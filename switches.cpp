
#include "cnc3018.h"
#include <Grbl.h>
#include "v2812b.h"
#include <GLimits.h>
#include <Machine/Axes.h>
#include <System.h>
#include <MotionControl.h>
#include <Serial.h>


uint32_t test_colors[4] = {
    0x440000,
    0x003300,
    0x000044,
    0x330033,
};

Adafruit_NeoPixel pixels(NUM_PIXELS,G_PIN_LEDS_OUT);


const char *switchName(int i)
{
	switch (i)
	{
		case 0 : return "xZERO";
		case 1 : return "yZERO";
		case 2 : return "zZERO";
		case 3 : return "PROBE";
		case 4 : return "xLIM";
		case 5 : return "yLIM";
		case 6 : return "zLIM";
		case 7 : return "UNUSED2";
	}
	return "UNKNOWN";

}

static uint8_t prev_switches = 0x00;		// pulled up, swtich=ground

uint8_t get_switches()
	// returns the last cached switch value so safe
	// to call from myProbe::getState()
{
		return prev_switches;
}


uint8_t read_switches()
    // reads the switches and sets the x/y/z limit bits into the system state
    // returns the entire read value
    // called 50 times a second by switch task
    // when probing called indirectly from stepper pulses via
    // myProbe::tripped() which checks for PROBE_SWITCH_MASK
{
	digitalWrite(G_PIN_74HC165_LATCH, HIGH);
	// delayMicroseconds(4);
	uint8_t switches = shiftIn(G_PIN_74HC165_DATA, G_PIN_74HC165_CLK, MSBFIRST);
	digitalWrite(G_PIN_74HC165_LATCH, LOW);

	// X/Y switches are pulled up with active HIGH signals due to NC switches
	// Z/PROBE switches are pulled down with normal HIGH signals and NO switches

	// g_debug("switches=0x%02x",switches);

	switches &= 0x7f;		// mask out the last unused bit

	// write limit pin bits directly into global masks
	// which works with homing algorithm

	Machine::Axes::negLimitMask = switches & 0x7;
	Machine::Axes::posLimitMask = (switches >> 4) & 0x7;

	// change detection

	if (prev_switches != switches)
	{
		// display debugging ONLY if not in probe state

		if (sys_probe_state != ProbeState::Active &&
			!the_machine._mesh->inLeveling())
		{
			for (int i=0; i<8; i++)
			{
				uint8_t mask = 1<<i;
				bool is = switches & mask;
				bool was = prev_switches & mask;
				if (was != is)
				{
					g_debug("(0x%02x) switch %s changed from %d to %d",switches,switchName(i),was,is);
				}
			}
		}

		// stop everything if not in homing (even if in probing)
		// if an x/y/z limit switch gets hit.
		// don't wanna do this during homing!

		if ((switches & 0x77) && sys.state != State::Homing)
		{
			if (sys_probe_state != ProbeState::Active)
				log_debug("Limit Switch State " << String(switches, HEX));
			mc_reset();                                // Initiate system kill.
			sys_rt_exec_alarm = ExecAlarm::HardLimit;  // Indicate hard limit critical event
		}
	}

	prev_switches = switches;
	return switches;
}






void switchTask(void* pvParameters)
{
    vTaskDelay(200/portTICK_PERIOD_MS);

    g_debug("switchTask running on core %d at priority %d",xPortGetCoreID(),uxTaskPriorityGet(NULL));

	// bypass yaml and set axes that have limit switches explicitly
	// need at least one set for the grbl_esp32 limit check task to run
	// though, perhaps it would be better to just "do what it does" here,
	// or make limits_get_state() weakly bound and override it here instead
	// of a task. For now dueling tasks works ok.

	Machine::Axes::limitMask = 0x03;
	limits_init();

    while (true)
    {
        vTaskDelay(20 / portTICK_PERIOD_MS);

        #if 0
			static uint32_t last_time = 0;
			if (millis() > last_time + 2000)
			{
				last_time = millis();
				static int pix_num = 0;
				pixels.setPixelColor(0, test_colors[(pix_num + 0) % 4]);
				pixels.setPixelColor(1, test_colors[(pix_num + 1) % 4]);
				pixels.setPixelColor(2, test_colors[(pix_num + 2) % 4]);
				pixels.setPixelColor(3, test_colors[(pix_num + 3) % 4]);
				pixels.show();
				pix_num++;
			}
		#endif

		// suppress switch reading while in probe mode

		if (sys_probe_state != ProbeState::Active)
		{
			read_switches();
		}

		// note any changes to realtimeZOffset;

		#ifdef FUNKY_REALTIME_STUFF
			float last_realtimeZOffset;
			if (last_realtimeZOffset != realtimeZOffset)
			{
				last_realtimeZOffset = realtimeZOffset;
				g_debug("realTimeZOffset changed to %5.3f",realtimeZOffset);
			}
		#endif

	}
}




void init_switches()
{
    pinMode(G_PIN_74HC165_DATA, INPUT);
    pinMode(G_PIN_74HC165_LATCH, OUTPUT);
    pinMode(G_PIN_74HC165_CLK, OUTPUT);
    digitalWrite(G_PIN_74HC165_CLK, LOW);

    pixels.setBrightness(20);

	xTaskCreatePinnedToCore(
		switchTask,		// method
		"switchTask",	// name
		4096,			// stack_size
		NULL,			// parameters
		1,  			// priority
		NULL,			// returned handle
		0);				// core 1=main Grbl_Esp32 thread/task, 0=my UI and other tasks
}
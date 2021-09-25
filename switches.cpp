
#include "cnc3018.h"
#include "my_ws2812b.h"

#include <Config.h>            // FluidNC
#include <GLimits.h>           // FluidNC
#include <MotionControl.h>     // FluidNC
#include <Protocol.h>          // FluidNC
#include <SDCard.h>            // FluidNC
#include <Serial.h>            // FluidNC
#include <System.h>            // FluidNC
#include <Machine/Axes.h>      // FluidNC

// was for mesh #include <gApp.h>			   // FluidNC_UI


Adafruit_NeoPixel pixels(NUM_PIXELS,G_PIN_LEDS_OUT);

static uint8_t switches = 0x00;		// pulled up, swtich=ground



// denormalized (copy) of getJobState() from Grbl_minUI

typedef enum cJobState
{
    C_JOB_NONE,
    C_JOB_IDLE,
    C_JOB_BUSY,
    C_JOB_HOLD,
    C_JOB_HOMING,
	C_JOB_PROBE,
    C_JOB_ALARM
};

const char *cJobStateName(cJobState job_state)
{
    switch (job_state)
    {
        case C_JOB_NONE   : return "";
        case C_JOB_IDLE   : return "IDLE";
        case C_JOB_BUSY   : return "BUSY";
        case C_JOB_HOLD   : return "HOLD";
        case C_JOB_HOMING : return "HOMING";
		case C_JOB_PROBE  : return "PROBE";
        case C_JOB_ALARM  : return "ALARM";
    }
    return "UNKNOWN_JOB_STATE";
}

void setLedJobState(cJobState job_state)
{
	pixels.setPixelColor(PIXEL_SYS_STATE,
		job_state == C_JOB_ALARM ? MY_LED_RED :
		job_state == C_JOB_HOLD ? MY_LED_CYAN :
		job_state == C_JOB_PROBE ? MY_LED_YELLOW :
		job_state == C_JOB_HOMING ? MY_LED_YELLOW :
		job_state == C_JOB_BUSY ? MY_LED_YELLOW :
		MY_LED_BLUE	);
}



const char *switchName(int i)
{
	switch (i)
	{
		case PIN7_XZERO   : return "xZERO";
		case PIN7_YZERO   : return "yZERO";
		case PIN7_ZZERO   : return "zZERO";
		case PIN7_PROBE   : return "PROBE";
		case PIN7_XLIM    : return "xLIM";
		case PIN7_YLIM    : return "yLIM";
		case PIN7_ZLIM    : return "zLIM";
		case PIN7_UNUSED  : return "UNUSED2";
	}
	return "UNKNOWN";
}


//---------------------------
// switches
//---------------------------



uint8_t get_switches()
	// returns the last cached switch value so safe
	// to call from myProbe::getState()
{
		return switches;
}



uint8_t IRAM_ATTR read_switches()
	// This method just reads the switches into FluidNC global variables
	// and handles hard stops.  It is called for probing indirectly from
	// the Stepper ISR routine, and so it, and all routines it calls
	// must be IRAM_ATTR and neoPixels are not, so no text, or pixels
	// are set by this.
	//
	// The issue is that the probe switch *may not* get detected
	// by my UI task if the probe is too quick.  We will see.
{
	digitalWrite(G_PIN_74HC165_LATCH, HIGH);
	uint8_t in = shiftIn(G_PIN_74HC165_DATA, G_PIN_74HC165_CLK, MSBFIRST);
	digitalWrite(G_PIN_74HC165_LATCH, LOW);

	// switches are pulled up with NO switches, so LOW is active
	// hence we invert the bit pattern here

	in = ~in;

	// map the switches to XYZ bits in the FluidNC masks

	uint8_t zero_val = 0;
	uint8_t lim_val  = 0;

	if (in & (1 << PIN7_XZERO)) zero_val |= 1;
	if (in & (1 << PIN7_YZERO)) zero_val |= 2;
	if (in & (1 << PIN7_ZZERO)) zero_val |= 4;
	if (in & (1 << PIN7_XLIM)) lim_val |= 1;
	if (in & (1 << PIN7_YLIM)) lim_val |= 2;
	if (in & (1 << PIN7_ZLIM)) lim_val |= 4;

	if (Machine::Axes::negLimitMask != zero_val ||
		Machine::Axes::posLimitMask != lim_val)
	{
		Machine::Axes::negLimitMask = zero_val;
		Machine::Axes::posLimitMask = lim_val;

		if ((zero_val || lim_val) && sys.state != State::Homing)
		{
			mc_reset();                                // Initiate system kill.
			rtAlarm = ExecAlarm::HardLimit;  // Indicate hard limit critical event
		}
	}

	switches = in;
	return in;
}





void switchTask(void* pvParameters)
{
    vTaskDelay(200/portTICK_PERIOD_MS);

    g_debug("switchTask running on core %d at priority %d",xPortGetCoreID(),uxTaskPriorityGet(NULL));

	pixels.setPixelColor(0,MY_LED_BLUE);
	pixels.show();

	// bypass yaml and set axes that have limit switches explicitly
	// need at least one set for the FluidNC limit check task to run
	// though, perhaps it would be better to just "do what it does" here,
	// or make limits_get_state() weakly bound and override it here instead
	// of a task. For now dueling tasks works ok.

	Machine::Axes::limitMask = 0x03;
	limits_init();

    while (true)
    {
		bool show_leds = false;
        vTaskDelay(50 / portTICK_PERIOD_MS);

		// suppress switch reading while in probe mode
		// as the Stepper ISR will call it

		if (probeState != ProbeState::Active)
		{
			read_switches();
		}


		// text debugging

		static uint8_t last_switches = 0;
		if (last_switches != switches)
		{
			for (int i=0; i<8; i++)
			{
				uint8_t mask = 1<<i;
				bool is = switches & mask;
				bool was = last_switches & mask;
				if (was != is)
				{
					g_debug("(0x%02x) switch %s changed from %d to %d",switches,switchName(i),was,is);
				}
			}
			last_switches = switches;
		}

		// XYZ pixels

		static uint8_t last_zero_val = 0;
		static uint8_t last_lim_val  = 0;
		if (last_zero_val != Machine::Axes::negLimitMask ||
			last_lim_val  != Machine::Axes::posLimitMask)
		{
			last_zero_val = Machine::Axes::negLimitMask;
			last_lim_val  = Machine::Axes::posLimitMask;

			show_leds = true;

			pixels.setPixelColor(PIXEL_X_STATE,
				(last_zero_val & 1) && (last_lim_val & 1) ? MY_LED_YELLOW :
				(last_zero_val & 1) ? MY_LED_MAGENTA :
				(last_lim_val & 1)  ? MY_LED_RED :
				MY_LED_BLACK);
			pixels.setPixelColor(PIXEL_Y_STATE,
				(last_zero_val & 2) && (last_lim_val & 2) ? MY_LED_YELLOW :
				(last_zero_val & 2) ? MY_LED_MAGENTA :
				(last_lim_val & 2)  ? MY_LED_RED :
				MY_LED_BLACK);
			pixels.setPixelColor(PIXEL_Z_STATE,
				(last_zero_val & 4) && (last_lim_val & 1) ? MY_LED_YELLOW :
				(last_zero_val & 4) ? MY_LED_MAGENTA :
				(last_lim_val & 4)  ? MY_LED_RED :
				MY_LED_BLACK);

		}

		// Probe pixel

		static bool last_probe = false;
		bool probe = switches & (1<<PIN7_PROBE);
		if (last_probe != probe)
		{
			last_probe = probe;
			pixels.setPixelColor(PIXEL_PROBE_STATE,
				probe ? MY_LED_MAGENTA : MY_LED_BLACK);
			show_leds = true;
		}

		// Set the job_state
		// denormalized (copy) of getJobState() from FluidNC_UI
		// because it might not be linked in

		static bool led_on = false;
		static uint32_t led_flash = 0;
		static cJobState last_job_state = C_JOB_IDLE;
		cJobState job_state = C_JOB_IDLE;

		// except we don't diffentiate between probing and meshing
		// as we flash the LED the same in both cases

		SDCard *sdCard = config->_sdCard;
		if (probeState == ProbeState::Active
			#ifdef WITH_MESH
				|| the_mesh.inLeveling()
			#endif
		    )
		{
			job_state = C_JOB_PROBE;
		}
		else if (sys.state == State::Homing)
			job_state = C_JOB_HOMING;
		else if (sys.state == State::Alarm)
			job_state = C_JOB_ALARM;
		else if (sys.state == State::Hold)
			job_state = C_JOB_HOLD;
		else if (sdCard && sdCard->get_state() == SDCard::State::Busy)
			job_state = C_JOB_BUSY;
		else
			job_state = C_JOB_IDLE;


		// Set the system pixel

		if (last_job_state != job_state)
		{
			g_debug("cJobState changed to %s",cJobStateName(job_state));
			last_job_state = job_state;
			setLedJobState(job_state);
			if (job_state == C_JOB_ALARM ||
				job_state == C_JOB_PROBE ||
				job_state == C_JOB_HOMING)
			{
				led_flash = millis();
				led_on = true;
			}
			else
			{
				led_flash = 0;
			}
			show_leds = true;
		}
		else if (led_flash && millis() > led_flash + 300)
		{
			led_flash = millis();
			if (led_on)
			{
				led_on = 0;
				pixels.setPixelColor(PIXEL_SYS_STATE, MY_LED_BLACK);
			}
			else
			{
				led_on = 1;
				setLedJobState(job_state);
			}
			show_leds = true;
		}

		// show pixes if needed

		if (show_leds)
			pixels.show();


		// note any changes to realtimeZOffset;

		#ifdef FUNKY_REALTIME_STUFF
			float last_realtimeZOffset;
			if (last_realtimeZOffset != realtimeZOffset)
			{
				last_realtimeZOffset = realtimeZOffset;
				g_debug("realTimeZOffset changed to %5.3f",realtimeZOffset);
			}
		#endif

	}	// while (true)
}	// switchTask()




void init_switches()
{
    pinMode(G_PIN_74HC165_DATA, INPUT);
    pinMode(G_PIN_74HC165_LATCH, OUTPUT);
    pinMode(G_PIN_74HC165_CLK, OUTPUT);
    digitalWrite(G_PIN_74HC165_CLK, LOW);

    pixels.setBrightness(20);
	for (int i=0; i<NUM_PIXELS; i++)
	{
		pixels.setPixelColor(i,MY_LED_BLACK);
	}
	pixels.show();

	xTaskCreatePinnedToCore(
		switchTask,		// method
		"switchTask",	// name
		4096,			// stack_size
		NULL,			// parameters
		1,  			// priority
		NULL,			// returned handle
		0);				// core 1=main FluidNC thread/task, 0=my UI and other tasks
}
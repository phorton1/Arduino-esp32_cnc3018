
#include "cnc3018.h"
#include "my_ws2812b.h"
#include <gStatus.h>	// FluidNC_extensions
#include <gActions.h>	// FluidNC_extensions

static uint8_t switches = 0x00;		// pulled up, swtich=ground

#ifdef WITH_PIXELS

	Adafruit_NeoPixel pixels(NUM_PIXELS,G_PIN_LEDS_OUT);

	int getJobStateColor(JobState job_state)
		// duplicated in _vMachine/sensor.cpp
	{
		switch (job_state)
		{
			case JOB_NONE:		return 0;
			case JOB_IDLE:		return MY_LED_BLUE;
			case JOB_HOLD:		return MY_LED_CYAN;
			case JOB_BUSY:
			case JOB_HOMING:
			case JOB_PROBING:
			case JOB_MESHING:	return MY_LED_YELLOW;
			case JOB_ALARM:		return MY_LED_RED;
		}
		g_error("UNKNOWN JobState(%d)",(int)job_state);
		return MY_LED_MAGENTA;
	}
#endif



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
	#ifdef TEST_WITHOUT_SWITCHES
		uint8_t in = 0;
	#else
		// real code

		digitalWrite(G_PIN_74HC165_LATCH, HIGH);
		uint8_t in = shiftIn(G_PIN_74HC165_DATA, G_PIN_74HC165_CLK, MSBFIRST);
		digitalWrite(G_PIN_74HC165_LATCH, LOW);

		// switches are pulled up with NO switches, so LOW is active
		// hence we invert the bit pattern here

		in = ~in;
	#endif


	// map the switches to XYZ bits in the FluidNC masks

	uint8_t zero_val = 0;
	uint8_t lim_val  = 0;

	if (in & (1 << PIN7_XZERO)) zero_val |= 1;
	if (in & (1 << PIN7_YZERO)) zero_val |= 2;
	if (in & (1 << PIN7_ZZERO)) zero_val |= 4;
	if (in & (1 << PIN7_XLIM)) lim_val |= 1;
	if (in & (1 << PIN7_YLIM)) lim_val |= 2;
	if (in & (1 << PIN7_ZLIM)) lim_val |= 4;

	if (gActions::getNegLimitMask() != zero_val ||
		gActions::getPosLimitMask() != lim_val)
	{
		gActions::setNegLimitMask(zero_val);
		gActions::setPosLimitMask(lim_val);

		if ((zero_val || lim_val) && sys.state != State::Homing)
		{
			gActions::g_reset();     // Initiate system kill.
			gActions::setAlarm(1);	 // 1 == ExecAlarm::HardLimit
		}
	}

	switches = in;
	return in;
}





void switchTask(void* pvParameters)
{
    vTaskDelay(200/portTICK_PERIOD_MS);

    g_debug("switchTask running on core %d at priority %d",xPortGetCoreID(),uxTaskPriorityGet(NULL));

	#ifdef WITH_PIXELS
		pixels.setPixelColor(0,MY_LED_BLUE);
		pixels.show();
	#endif

	// bypass yaml and set axes that have limit switches explicitly
	// need at least one set for the FluidNC limit check task to run
	// though, perhaps it would be better to just "do what it does" here,
	// or make limits_get_state() weakly bound and override it here instead
	// of a task. For now dueling tasks works ok.

	gActions::setLimitMask(0x03);
	gActions::g_limits_init();

    while (true)
    {
		vTaskDelay(50 / portTICK_PERIOD_MS);

		// suppress switch reading while in probe mode
		// as the Stepper ISR will call it

		if (!gStatus::getProbeState())
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

		bool show_leds = false;
		static uint8_t last_zero_val = 0;
		static uint8_t last_lim_val  = 0;
		if (last_zero_val != Machine::Axes::negLimitMask ||
			last_lim_val  != Machine::Axes::posLimitMask)
		{
			last_zero_val = Machine::Axes::negLimitMask;
			last_lim_val  = Machine::Axes::posLimitMask;

			#ifdef WITH_PIXELS

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

			#endif

		}

		// Probe pixel

		static bool last_probe = false;
		bool probe = switches & PROBE_SWITCH_MASK;
		if (last_probe != probe)
		{
			last_probe = probe;

			#ifdef WITH_PIXELS
				pixels.setPixelColor(PIXEL_PROBE_STATE,
					probe ? MY_LED_MAGENTA : MY_LED_BLACK);
				show_leds = true;
			#endif
		}

		// JOB STATE
		// if not using FluidNC_UI call gStatus.updateStatus()

		#ifndef WITH_UI
			g_status.updateStatus(
				#ifdef WITH_MESH
					the_mesh.inLeveling()
				#endif
			);
		#endif

		// Set the job_state
		// denormalized (copy) of getJobState() from FluidNC_UI
		// because it might not be linked in

		#ifdef WITH_PIXELS

			static bool led_on = false;
			static uint32_t led_flash = 0;
			static JobState last_job_state = JOB_IDLE;
			JobState job_state = g_status.getJobState();

			// Set the system pixel

			if (last_job_state != job_state)
			{
				g_debug("switches.cpp::JobState changed to %s",jobStateName(job_state));
				last_job_state = job_state;
				pixels.setPixelColor(PIXEL_SYS_STATE,getJobStateColor(job_state));

				if (job_state == JOB_ALARM ||
					job_state == JOB_HOMING ||
					job_state == JOB_PROBING ||
					job_state == JOB_MESHING)
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
					pixels.setPixelColor(PIXEL_SYS_STATE,getJobStateColor(job_state));
				}
				show_leds = true;
			}

			// show pixes if needed

			if (show_leds)
				pixels.show();

		#endif

	}	// while (true)
}	// switchTask()




void init_switches()
{
    pinMode(G_PIN_74HC165_DATA, INPUT);
    pinMode(G_PIN_74HC165_LATCH, OUTPUT);
    pinMode(G_PIN_74HC165_CLK, OUTPUT);
    digitalWrite(G_PIN_74HC165_CLK, LOW);

	#ifdef WITH_PIXELS
		for (int i=0; i<NUM_PIXELS; i++)
		{
			pixels.setPixelColor(i,MY_LED_BLACK);
		}
		pixels.show();
	#endif

	xTaskCreatePinnedToCore(
		switchTask,		// method
		"switchTask",	// name
		4096,			// stack_size
		NULL,			// parameters
		1,  			// priority
		NULL,			// returned handle
		0);				// core 1=main FluidNC thread/task, 0=my UI and other tasks
}
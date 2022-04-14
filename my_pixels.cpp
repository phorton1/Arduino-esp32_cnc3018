
#include "cnc3018.h"


#ifdef WITH_PIXELS

	#include "my_pixels.h"
	#include <gStatus.h>				// FluidNC_extensions
	#include <gActions.h>				// FluidNC_extensions
	#include <Machine/MachineConfig.h>	// FluidNC

	Adafruit_NeoPixel pixels(NUM_PIXELS,G_PIN_LEDS_OUT);

	#define DEBUG_PIXELS  1


	void bumpPixel()	// for startup sequence
	{
		static int pixel_num = 0;
		pixels.setPixelColor(pixel_num++,MY_LED_MAGENTA);
		pixels.show();
	}


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


	void pixelTask(void* pvParameters)
	{
		#if DEBUG_PIXELS
			g_debug("pixelTask running on core %d at priority %d",xPortGetCoreID(),uxTaskPriorityGet(NULL));
		#endif

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

			// update state
			// if not using FluidNC_UI call gStatus.updateStatus()

			bool probe = config->_probe && config->_probe->exists() ?  config->_probe->get_state() : 0;

			// probe->exists() returns true for the Error pin,
			// and there is no other way for me to know not to call get_state()
			// that's the way they designed it to work, so I'm leaving it.

			#ifndef WITH_UI
				g_status.updateStatus(
					#ifdef WITH_MESH
						the_mesh.inLeveling()
					#endif
				);
			#endif

			// XYZ pixels

			bool show_leds = false;
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
			if (last_probe != probe)
			{
				last_probe = probe;
				pixels.setPixelColor(PIXEL_PROBE_STATE,
					probe ? MY_LED_MAGENTA : MY_LED_BLACK);
				show_leds = true;
			}


			// Job state pixel

			static bool led_on = false;
			static uint32_t led_flash = 0;
			static JobState last_job_state = JOB_IDLE;
			JobState job_state = g_status.getJobState();

			if (last_job_state != job_state)
			{
				#if DEBUG_PIXELS
					g_debug("pixels JobState changed to %s",jobStateName(job_state));
				#endif

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

		}	// while (true)
	}	// switchTask()


	void start_pixels()
	{
		for (int i=0; i<NUM_PIXELS; i++)
		{
			pixels.setPixelColor(i,MY_LED_BLACK);
		}
		pixels.show();

		xTaskCreatePinnedToCore(
			pixelTask,		// method
			"pixelTask",	// name
			4096,			// stack_size
			NULL,			// parameters
			1,  			// priority
			NULL,			// returned handle
			0);				// core 1=main FluidNC thread/task, 0=my UI and other tasks
	}


#endif	// WITH_PIXELS

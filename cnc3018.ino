//----------------------------------------------------
// cnc3018.ino
//----------------------------------------------------
// interesting gCodes
//
// m6 t1 = tool change to tool #1


#include <FluidNC.h>
#include <Logging.h>        // FluidNC

#include "cnc3018.h"
#include "my_ws2812b.h"


#define INIT_SD_DURING_SETUP
#define INIT_SD_AGAIN


#ifdef INIT_SD_DURING_SETUP
    #include <SD.h>
#endif

#ifdef INIT_SD_AGAIN
    #include <Machine/MachineConfig.h>  // FluidNC
    #include <SDCard.h>                 // FluidNC
#endif


//----------------------------------------------------------
// SET FOLLOWING #if to 0 for no UI, or 1 to include the UI
//----------------------------------------------------------
// get g_debug from UI library if present, if not, implement it

#if 1          // 0=no UI, 1=with UI

    #include <FluidNC_UI.h>

    void display_init()
        // override weak definition in FluidNC
        // called after the Serial port Client has been created
    {
        g_debug("cnc3018.ino display_init() started");
        FluidNC_UI_init();
        g_debug("cnc3018.ino display_init() finished");
    }

#else

    void g_debug(const char *format, ...)
    {
        va_list var;
        va_start(var, format);
        char display_buffer[255];
        vsprintf(display_buffer,format,var);
        log_debug(display_buffer);
        va_end(var);
    }

#endif


#ifdef INIT_SD_AGAIN
	void debug_start_sdcard()
	{
		// The "normal" FluidNC code does not initialize the SD Card
		// until it is accessed via a [ESPxxx] command from the WebUI or
		// via [ESP210] or [ESP420].  I modified the webUI to start up
		// with the file list initialized.

		// REQUIRES PULLUP RESISTOR ON MISO

		// In bringing vMachine up on the Yaml_Settings branch. I discovered
		// that they have overriden the core system pinMode, digitalWrite, and digitalRead
		// methods, and that their overrides don't generally work with my code or other libraries.
		// Particularly with the SDCard that DID NOT WORK until I #ifdef'd out their code
		// in (their) PinMapper.cpp to get rid of their override methods so the core methods
		// get called normally.

		#ifdef INIT_SDCARD_OLD_FASHIONED_WAY

			// Call SD.begin() directly.
			g_debug("starting SD Card on pin(%d) %d/%dK",V_SDCARD_CS,xPortGetFreeHeapSize()/1024,xPortGetMinimumEverFreeHeapSize()/1024);
			if (!SD.begin(V_SDCARD_CS))
			{
				g_debug("SD.begin() failed");
			}
			else
			{

		#else	// relies on vMachine.yaml spi setup

			// The GRBL way of initializing the SD Card is to call
			// SDState state = get_sd_state(true) and then check for
			// SDState::NotPresent.  Otherwise it's there and if not
			// SDState::Idle it is considered busy. They then call
			// SD.end() after each transaction.

			g_debug("starting sdCard from yaml configuration");
			SDCard::State state = config->_sdCard->begin(SDCard::State::Idle);
			// info_debug("machine_init() get_sd_state() returned %d",state);
			if (state == SDCard::State::NotPresent)
			{
				g_debug("SD Card Not Present");
			}
			else
			{
				if (state != SDCard::State::Idle)
					g_debug("SD Card BUSY");

		#endif

			uint8_t cardType = SD.cardType();
			g_debug("SD Card Type: %s",
				cardType == CARD_NONE ? "NONE" :
				cardType == CARD_MMC  ? "MMC" :
				cardType == CARD_SD   ? "SDSC" :
				cardType == CARD_SDHC ? "SDHC" :
				"UNKNOWN");
			uint64_t cardSize = SD.cardSize() / (1024 * 1024);
			g_debug("SD Card Size: %lluMB", cardSize);
			g_debug("Total space:  %lluMB", (SD.totalBytes()+1024*1024-1) / (1024 * 1024));
			g_debug("Used space:   %lluMB", (SD.usedBytes()+1024*1024-1) / (1024 * 1024));

			// FluidNC closes the SD Card after every use.
			// SDCard::State() and it's usage in Grbl for me to proceed in
			// a sane manner.

			#if !INIT_SDCARD_OLD_FASHIONED_WAY
				SD.end();	// as per the GRBL way
			#endif
		}
	}
#endif	// INIT_SD_AGAIN




//----------------------------------------------------------
// setup()
//----------------------------------------------------------

void setup()
{
    pixels.show();
    delay(2000);

        pixels.setPixelColor(0,MY_LED_GREEN);
        pixels.show();

    #ifdef INIT_SD_DURING_SETUP
        bool sd_ok = SD.begin(G_PIN_SDCARD_CS);
    #endif

    main_init();

        pixels.setPixelColor(1,MY_LED_GREEN);
        pixels.show();

    #ifdef INIT_SD_DURING_SETUP
        g_debug("cnc3018.ino SD.begin() %s during setup()",sd_ok?"WORKED OK":"FAILED");
    #endif


    #ifdef INIT_SD_AGAIN
        debug_start_sdcard();
    #endif

        pixels.setPixelColor(2,MY_LED_GREEN);
        pixels.show();

    the_machine._mesh->readMesh();

        pixels.setPixelColor(3,MY_LED_GREEN);
        pixels.show();

    init_switches();

    g_debug("cnc3018.ino setup(core %d) completed %d/%dK",
        xPortGetCoreID(),
        xPortGetFreeHeapSize()/1024,
        xPortGetMinimumEverFreeHeapSize()/1024);
}




//----------------------------------------------------------
// loop()
//----------------------------------------------------------

void loop()
{
    g_debug("cnc3018.ino loop() started %d/%dK",xPortGetFreeHeapSize()/1024,xPortGetMinimumEverFreeHeapSize()/1024);
    run_once();
    delay(1000);    // for display of following message to work with FluidNC asynch debug output
    g_debug("cnc3018.ino loop() completed %d/%dK",xPortGetFreeHeapSize()/1024,xPortGetMinimumEverFreeHeapSize()/1024);
 }

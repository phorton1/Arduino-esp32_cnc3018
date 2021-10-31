//----------------------------------------------------
// cnc3018.ino
//----------------------------------------------------

#include <FluidNC.h>
#include "cnc3018.h"
#include "my_pixels.h"


#define INIT_SD_DURING_SETUP
#define INIT_SD_AGAIN


#ifdef INIT_SD_DURING_SETUP
    #include <SD.h>
#endif

#ifdef INIT_SD_AGAIN
	#include <gStatus.h>	// FluidNC extensions
#endif



#ifdef INIT_SD_AGAIN
	static void start_sdcard()
	{
		g_debug("starting sdCard using FluidNC");
		SDState state = g_status.getSDState(true);
		// info_debug("machine_init() get_sd_state() returned %d",state);
		if (state == SDState::NotPresent)
		{
			g_info("SD Card Not Present");
		}
		else
		{
			if (state != SDState::Idle)
				g_info("SD Card BUSY");
			uint8_t cardType = SD.cardType();
			g_debug("SD Card Type: %s",
				cardType == CARD_NONE ? "NONE" :
				cardType == CARD_MMC  ? "MMC" :
				cardType == CARD_SD   ? "SDSC" :
				cardType == CARD_SDHC ? "SDHC" :
				"UNKNOWN");
			uint64_t cardSize = SD.cardSize() / (1024 * 1024);
			g_info("SD Card Size: %lluMB", cardSize);
			g_info("Total space:  %lluMB", (SD.totalBytes()+1024*1024-1) / (1024 * 1024));
			g_info("Used space:   %lluMB", (SD.usedBytes()+1024*1024-1) / (1024 * 1024));
			SD.end();	// as per the GRBL way
		}
	}
#endif	// INIT_SD_AGAIN



//----------------------------------------------------------
// setup()
//----------------------------------------------------------


void setup()
{
    #ifdef WITH_PIXELS
		pixels.setBrightness(20);
		pixels.show();
		delay(1000);
	#endif

	#ifdef WITH_PIXELS
		bumpPixel();	// 0
    #endif

	delay(1000);

	#ifdef WITH_PIXELS
		bumpPixel();	// 1
    #endif

    #ifdef INIT_SD_DURING_SETUP
        bool sd_ok = SD.begin(G_PIN_SDCARD_CS);
    #endif

    main_init();	// FluidNC setup() method

	#ifdef WITH_PIXELS
		bumpPixel();	// 3
    #endif

    #ifdef INIT_SD_DURING_SETUP
        g_debug("cnc3018.ino SD.begin() %s during setup()",sd_ok?"WORKED OK":"FAILED");
    #endif

    #ifdef INIT_SD_AGAIN
        start_sdcard();
    #endif

	#ifdef WITH_MESH
	   the_mesh.readMesh();
	#endif

    #ifdef WITH_PIXELS
		start_pixels();
	#endif

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
    run_once();		// FluidNC loop() method
    delay(1000);    // for display of following message to work with FluidNC asynch debug output
    g_debug("cnc3018.ino loop() completed %d/%dK",xPortGetFreeHeapSize()/1024,xPortGetMinimumEverFreeHeapSize()/1024);
 }

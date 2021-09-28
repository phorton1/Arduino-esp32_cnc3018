//----------------------------------------------------
// cnc3018.ino
//----------------------------------------------------
// interesting gCodes
//
// m6 t1 = tool change to tool #1

#include <FluidNC.h>
#include "cnc3018.h"
#include "my_ws2812b.h"


#define INIT_SD_DURING_SETUP
#define INIT_SD_AGAIN


#ifdef INIT_SD_DURING_SETUP
    #include <SD.h>
#endif

#ifdef INIT_SD_AGAIN
	#include <gStatus.h>	// FluidNC extensions
#endif


#ifdef WITH_UI
    #include <FluidNC_UI.h>

    void display_init()
        // override weak definition in FluidNC
        // called after the Serial port Client has been created
    {
        g_debug("cnc3018.ino display_init() started");
        FluidNC_UI_init();
        g_debug("cnc3018.ino display_init() finished");
    }
#endif


#ifdef INIT_SD_AGAIN
	void debug_start_sdcard()
	{
		g_debug("starting sdCard using FluidNC");
		SDState state = g_status.getSDState(true);
		// info_debug("machine_init() get_sd_state() returned %d",state);
		if (state == SDState::NotPresent)
		{
			g_debug("SD Card Not Present");
		}
		else
		{
			if (state != SDState::Idle)
				g_debug("SD Card BUSY");
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
			SD.end();	// as per the GRBL way
		}
	}
#endif	// INIT_SD_AGAIN



//----------------------------------------------------------
// setup()
//----------------------------------------------------------

void bumpPixel()	// for startup sequence
{
	static int pixel_num = 0;
	pixels.setPixelColor(pixel_num++,MY_LED_MAGENTA);
	pixels.show();
}


void setup()
{
    pixels.setBrightness(20);
    pixels.show();
    delay(1000);
	bumpPixel();	// 0
    delay(1000);
	bumpPixel();	// 1

    #ifdef INIT_SD_DURING_SETUP
        bool sd_ok = SD.begin(G_PIN_SDCARD_CS);
    #endif

    main_init();
	bumpPixel();	// 3

    #ifdef INIT_SD_DURING_SETUP
        g_debug("cnc3018.ino SD.begin() %s during setup()",sd_ok?"WORKED OK":"FAILED");
    #endif

    #ifdef INIT_SD_AGAIN
        debug_start_sdcard();
    #endif

	#ifdef WITH_MESH
	   the_mesh.readMesh();
	#endif

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

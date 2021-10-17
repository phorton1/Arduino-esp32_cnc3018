// cnc3018.h

#pragma once

#define WITH_UI
#define WITH_MESH       // FluidNC_UI/gDefs.h::UI_WITH_MESH must be set the same!
#define WITH_PIXELS

#include <Machine/MachineConfig.h>  // FluidNC - required
#include <FluidDebug.h>             // FluidNC_extensions

#ifdef WITH_MESH
    #include <Mesh.h>               // FluidNC_extensions
#endif

//-----------------------------------
// ESP32 Pins Used by this Program
//-----------------------------------
// except motors defined in YAML
// TFT pina defined in TFT_eSPI/prhSettings.h

#define G_PIN_LEDS_OUT            GPIO_NUM_12
// #define G_PIN_TFT_CS             GPIO_NUM_22
// #define G_PIN_TFT_DC             GPIO_NUM_21
// #define G_PIN_TOUCH_CS           GPIO_NUM_5
#define G_PIN_74HC165_CLK         GPIO_NUM_16   // RX2
#define G_PIN_74HC165_LATCH       GPIO_NUM_17   // TX2
#define G_PIN_74HC165_DATA        GPIO_NUM_36
#define G_PIN_SDCARD_CS          GPIO_NUM_4

// pin ins to the 74HC165

#define PIN7_XZERO       3
#define PIN7_XLIM        2
#define PIN7_YZERO       1
#define PIN7_YLIM        0
#define PIN7_ZZERO       7
#define PIN7_ZLIM        6
#define PIN7_PROBE       5
#define PIN7_UNUSED      4

#define PROBE_SWITCH_MASK (1<<PIN7_PROBE)

// pin ins to display connector
// 1 - VCC
// 2 - TOUCH_CS (GPIO_NUM_5)
// 3 - SPI_CLK  (GPIO_NUM_18)
// 4 - SPI_MISO (GPIO_NUM_19)
// 5 - TFT DC   (GPIO_NUM_21)
// 6 - TFT CS   (GPIO_NUM_22)
// 7 - SPI_MOSI (GPIO_NUM_23)
// 8 - GND

// pin ins to sdcard connector
// 1 - VCC      (3.3v)
// 2 - CS       (GPIO_NUM_4)
// 3 - SPI_MOSI (GPIO_NUM_32)
// 4 - SPI_CLK  (GPIO_NUM_18)
// 5 - SPI_MISO (GPIO_NUM_19)
// 6 - GND

// ESP32 SPI defaults listed here for good measure
// #define SPI_CLK                  GPIO_NUM_18
// #define SPI_MISO                 GPIO_NUM_19
// #define SPI_MOSI                 GPIO_NUM_23

// HOOK UP TO ILI9486 "generic" TS with XPT2046
// from BOTTOM of screen with connector in TOP LEFT corner
// pin "1" would be the top right pin
//
//         2 - 5V                    1 - 3.3V
//         4 - 5V                    3 - x
//         6 - GND                   5 - x
//         8 - x                     7 - x
//        10 - x                     9 - GND
//        12 - x                    11 - TP IRQ (unused)
//        14 - GND                  13 - x
//        16 - x                    15 - x
//        18 - LCD_RS (DC)          17 - 3.3V
//        20 - GND                  19 - LCD/TP_SI  (MOSI)
//        22 - RST                  21 - TP_SO      (MISO)
//        24 - LCD_CS (TFT_CS)      23 - LCD/TP_SCK (CLK)
//        26 - TP_CS                25 - GND
//


//-----------------------------------
// the Machine
//-----------------------------------

class cnc3018 : public Machine::MachineConfig
{
    public:

        cnc3018();

    protected:

        void afterParse() override;
        void group(Configuration::HandlerBase& handler) override;

        void  initSettings();

};  // class cnc3018


extern cnc3018 the_machine;

extern void bumpPixel();	// for startup sequence
    // in cnc3018.ino

// public methods in swtiches.cpp

extern void init_switches();
extern uint8_t IRAM_ATTR read_switches();       // read em'
extern uint8_t get_switches();                  // return cached value

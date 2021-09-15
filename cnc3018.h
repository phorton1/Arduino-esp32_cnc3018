// cnc3018.h

#pragma once

#include <Machine/MachineConfig.h>
#include "Mesh.h"

#define G_PIN_LEDS_OUT            GPIO_NUM_12
// #define G_PIN_TFT_CS             GPIO_NUM_22
// #define G_PIN_TFT_DC             GPIO_NUM_21
// #define G_PIN_TOUCH_CS           GPIO_NUM_5
#define G_PIN_74HC165_CLK         GPIO_NUM_17   // TX2
#define G_PIN_74HC165_LATCH       GPIO_NUM_16   // RX2
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

extern void g_debug(const char *format, ...);



class cnc3018 : public Machine::MachineConfig
{
    public:

        cnc3018();

        Mesh *_mesh;

    protected:

        void afterParse() override;
        void group(Configuration::HandlerBase& handler) override;

        void  initSettings();

};  // class cnc3018


extern cnc3018 the_machine;



extern void init_switches();
extern uint8_t read_switches();
    // reads the switches and sets the x/y/z limit bits into the system state
    // returns the entire read value
    // called 50 times a second by switch task
    // when probing called indirectly from stepper pulses via
    // myProbe::tripped() which checks for PROBE_SWITCH_MASK
extern uint8_t get_switches();
    // returns the last cached switch value so safe
    // to call from myProbe::getState()

extern bool meshValid();
    // returns true if bed levelling ($HZ) has succeeded
extern float getMeshZOffset(float wx, float wy);
    // IN WORK COORDINATES
    // Return the interpolated z offset for the given
    // x and y positions.

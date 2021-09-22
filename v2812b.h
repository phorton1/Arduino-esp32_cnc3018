//------------------------------------
// a ws2812b LED strip
//------------------------------------
// static object defined in vMachine.cpp

#pragma once

#include <Adafruit_NeoPixel.h>

#define PIXEL_SYS_STATE   0
#define PIXEL_X_STATE     1
#define PIXEL_Y_STATE     2
#define PIXEL_Z_STATE     3
#define PIXEL_PROBE_STATE 4

#define NUM_PIXELS        5

#define MY_LED_BLACK    0x000000
#define MY_LED_RED      0x440000
#define MY_LED_GREEN    0x003300
#define MY_LED_BLUE     0x000044
#define MY_LED_CYAN     0x003333
#define MY_LED_YELLOW   0x333300
#define MY_LED_MAGENTA  0x330033
#define MY_LED_WHITE    0x000044

extern Adafruit_NeoPixel pixels;

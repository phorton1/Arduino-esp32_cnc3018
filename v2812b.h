//------------------------------------
// a ws2812b LED strip
//------------------------------------
// static object defined in vMachine.cpp

#pragma once

#define WITH_V2812B

#ifdef WITH_V2812B
    // if this is defined, a neopixel strip is expected on
    // V_LIMIT_LED_PIN.  Otherwise a single RED led is
    // expected.

#define NUM_PIXELS         4
#define PIXEL_LEFT_SENSOR  3
#define PIXEL_RIGHT_SENSOR 2
#define PIXEL_SYS_LED      0

#include <Adafruit_NeoPixel.h>

extern Adafruit_NeoPixel pixels;

#endif  // WITH_V2812B

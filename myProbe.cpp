
#include "myProbe.h"


#ifndef WITH_SERIN_PINS
    // compiles to nothing if using SERIN_PINS


#define DEBUG_PROBE 0


void myProbe::init()
{
    #if DEBUG_PROBE
        g_debug("myProbe.init() called");
    #endif
}

void myProbe::set_direction(bool is_away)
{
    #if DEBUG_PROBE
        g_debug("myProbe.set_direction(%d)",is_away);
    #endif
    _myProbeAway = is_away;
}

bool myProbe::get_state()
    // called from Report.cpp report_realtime_status()
    // get_switches() does not read the switches (uses cached value)
{
    // g_debug("myProbe.get_state() called");
    return get_switches() & PROBE_SWITCH_MASK;
}

bool IRAM_ATTR myProbe::tripped()
{
    // called from Stepper Motor ISR, must be IRAM_ATTR
    // reads the switches
    // g_debug("myProbe.tripped() called");
    return read_switches() & PROBE_SWITCH_MASK;
}



#endif  // WITH_SERIN_PINS


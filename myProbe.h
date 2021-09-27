//----------------------------------------------------
// myProbe.h
//----------------------------------------------------

#pragma once

#include "cnc3018.h"
#include <Probe.h>  // FluidNC - required


class myProbe : public Probe
{
    // Inverts the probe pin state depending on user settings and probing cycle mode.

    bool _myProbeAway = false;

public:

    myProbe() = default;
    ~myProbe() = default;

    virtual bool exists() const                 { return true; }
        // looks like I'm wandering into unknown territory.
        // GCode.cpp reports an error if exists() returns TRUE
        // yet the base Probe.h returns _probePin.defined(), which
        // would seem to want to be true to work. So I return false here.
        // Then MC failed, testing the opposite!

    virtual void init();
    virtual void set_direction(bool is_away);
    virtual bool get_state();
    virtual bool IRAM_ATTR tripped();

    void validate() const override                           {}
    void group(Configuration::HandlerBase& handler) override {}

};

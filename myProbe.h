//----------------------------------------------------
// myProbe.h
//----------------------------------------------------
// derived Probe class

#pragma once

#include "cnc3018.h"
#include <Probe.h>  // FluidNC - required


class myProbe : public Probe
{
    bool _myProbeAway = false;

public:

    myProbe() = default;
    ~myProbe() = default;

    virtual bool exists() const                 { return true; }
    virtual void init();
    virtual void set_direction(bool is_away);
    virtual bool get_state();
    virtual bool IRAM_ATTR tripped();

    void validate() const override                           {}
    void group(Configuration::HandlerBase& handler) override {}

};

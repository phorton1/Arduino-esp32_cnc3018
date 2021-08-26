//-------------------------------------------------
// Mesh bed levelling
//-------------------------------------------------
// 1. assumes work coordinates are set to x=0, y=0 on work piece,
//    and that Z is above the piece ready to probe
// 2. takes the work piece height and width as params, probably
//    via coordinate system values
// 3. user specifies number of mesh points in X and Y directions
// 4. levelling takes place in a rectangle 5 mm in from edges
//
// will end up at Z_PULLOFF above work position 0,0
// mesh is relative to zero_point

// my test zero is at x=62 y=9


#include "cnc3018.h"
#include <Arduino.h>
#include <Report.h>
#include <Logging.h>
#include <System.h>
#include <GCode.h>
#include <Protocol.h>
#include <Machine/MachineConfig.h>


#define DEBUG_MESH  1

#define Z_AXIS       2
#define Z_AXIS_MASK  0x04

#define WORK_PIECE_HEIGHT 100       // mm
#define WORK_PIECE_WIDTH  148       // mm

#define MESH_MARGIN       5.0       // mm's from the edges of the work piece
#define MESH_X_STEPS      6         // every 20mm
#define MESH_Y_STEPS      4         // 90/4 mm

#define Z_PULLOFF         2.0       // pull off after 0th point
#define Z_MAX_TRAVEL    -25.0       // mm in negative direction from absolute 0,0
#define Z_FEED_RATE      50.0




bool mesh_is_valid;                         // mesh levelling has completed
float zero_point;                           // the absolute machine position of z=0 at xy=0,0 (5,5)
float mesh[MESH_X_STEPS][MESH_Y_STEPS];     // the mesh
float mesh_x_step;                          // cached dependent variabls
float mesh_y_step;                          // cached dependent variabls


bool meshValid()  { return mesh_is_valid; }


float getMeshZOffset(float wx, float wy)
    // IN WORK COORDINATES
{
    if (!mesh_is_valid)
        return 0.00;

    g_debug("GET_MESH_Z_OFFSET(%5.3f,%5.3f)",wx,wy);

    wx -= MESH_MARGIN;
    wy -= MESH_MARGIN;

    // develop the integer "box" coordinates
    // into the mesh array along the percentage
    // traversed into the box

    int x_left;
    int x_right;
    float pct_x;
    if (wx < 0)
    {
        x_left = 0;
        x_right = 0;
        pct_x = 1.0;
    }
    else
    {
        x_left = wx / mesh_x_step;
        x_right = x_left + 1;
        if (x_left > MESH_X_STEPS - 1)
            x_left = MESH_X_STEPS - 1;
        if (x_right > MESH_X_STEPS - 1)
            x_right = MESH_X_STEPS - 1;
        pct_x = (wx - x_left * mesh_x_step) / mesh_x_step;
        if (pct_x > 1.0) pct_x = 1.0;
    }

    int y_top;
    int y_bottom;
    float pct_y;
    if (wy < MESH_MARGIN)
    {
        y_top = 0;
        y_bottom = 0;
        pct_y = 1.0;
    }
    else
    {
        y_bottom = wy / mesh_y_step;
        y_top = y_bottom + 1;
        if (y_bottom > MESH_Y_STEPS - 1)
            y_bottom = MESH_Y_STEPS - 1;
        if (y_top > MESH_Y_STEPS - 1)
            y_top = MESH_Y_STEPS - 1;
        pct_y = (wx - x_left * mesh_x_step) / mesh_x_step;
    }

    // get the four values

    float left_bottom =    mesh[x_left][y_bottom];
    float left_top =       mesh[x_left][y_top];
    float right_bottom =   mesh[x_right][y_bottom];
    float right_top =      mesh[x_right][y_top];

    // calculate the contribution
    //
    //    lt               rt
    //
    //
    //            o  pct_x,pct_y
    //
    //
    //     lb               rb

    float left = left_bottom + pct_y * (left_top - left_bottom);
    float right = right_bottom + pct_y * (right_top - right_bottom);
    float value = left + pct_x * (right - left);

    g_debug("   zone_lrtb(%d,%d,%d,%d)  pct_x=%5.3f  pct_y=%5.3f",
        x_left,
        x_right,
        y_top,
        y_bottom,
        pct_x,
        pct_y);

    g_debug("   mesh lb(%5.3f) lt(%5.3f) rb(%5.3f) rt(%5.3f)",
        left_bottom,
        left_top,
        right_bottom,
        right_top);

    g_debug("   left(%5.3f)  right(%5.3f)  FINAL VALUE(%5.3f)",
        left,
        right,
        value);

    return value;
}



void debug_mesh()
{
    #if DEBUG_MESH
        g_debug("MESH: zero_point == %6.3f",zero_point);
        for (int y=MESH_Y_STEPS-1; y>=0; y--)
        {
            char buf[100];
            sprintf(buf,"MESH[%d] ",y);
            for (int x=0; x<MESH_X_STEPS; x++)
            {
                sprintf(&buf[strlen(buf)]," % 6.3f",mesh[x][y]);
            }
            g_debug(buf);
        }
    #endif
}


void init_mesh()
{
    #if DEBUG_MESH > 2
        g_debug("MESH: init_mesh()");
    #endif

    mesh_is_valid = false;
    zero_point = 0.0;
    float mesh[MESH_X_STEPS][MESH_Y_STEPS];
    for (int x=0; x<MESH_X_STEPS; x++)
    {
        for (int y=0; y<MESH_Y_STEPS; y++)
        {
            mesh[x][y] = 0.00;
        }
    }

    mesh_x_step = (WORK_PIECE_WIDTH - 2*MESH_MARGIN) / (MESH_X_STEPS-1);
    mesh_y_step = (WORK_PIECE_HEIGHT - 2*MESH_MARGIN) / (MESH_Y_STEPS-1);
}



bool mesh_execute(char *buf)
{
    #if DEBUG_MESH > 2
        g_debug("MESH: execute(%s)",buf);
    #endif

    Error rslt = gc_execute_line(buf, CLIENT_SERIAL);
    if (rslt != Error::Ok)
    {
        report_status_message(rslt, CLIENT_ALL);
        g_debug("MESH: gc_execute_line failed");
        return false;
    }
    protocol_buffer_synchronize();
    if (sys.abort)
    {
        g_debug("MESH: move aborted");
        return false;           // Bail to main() program loop to reset system.
    }
    #if DEBUG_MESH > 2
        g_debug("MESH: move completed");
    #endif
    return true;
}


bool moveTo(float x, float y)  // just move the damned thing in work coordinate system
{
    #if DEBUG_MESH > 2
        g_debug("MESH: moveTo(%5.3f,%5.3f)",x,y);
    #endif
    char buf[24];
    sprintf(buf,"g0 x%5.3f y%5.3f",x,y);
    return mesh_execute(buf);
}


bool zPullOff() // move z upwards relative, check that probe goes off too
{
    float to = zero_point + Z_PULLOFF;
    #if DEBUG_MESH > 2
        g_debug("MESH: zPullOff() zero_point=%5.3f to=%5.3f",zero_point,to);
    #endif
    char buf[24];
    sprintf(buf,"g0 z%5.3f",to);
    bool move_ok = mesh_execute(buf);
    if (move_ok)
    {
        if (config->_probe->tripped())
        {
            g_debug("MESH: zPullOff() failed!");
            sys_rt_exec_alarm = ExecAlarm::HomingFailPulloff;
            return false;
        }
    }
    return true;
}




bool probeOne(int x, int y, float *zResult)
    // do a probe and return the z value in absolute machine coordinates
{
    #if DEBUG_MESH > 2
        g_debug("MESH: probeOne()");
    #endif

    char buf[24];
    sprintf(buf,"g38.2 z%5.3f f%5.3f",Z_MAX_TRAVEL,Z_FEED_RATE);

    #if DEBUG_MESH > 2
        g_debug("MESH: probeOne() execute(%s)",buf);
    #endif

    Error rslt = gc_execute_line(buf, CLIENT_SERIAL);
    if (rslt != Error::Ok)
    {
        report_status_message(rslt, CLIENT_ALL);
        g_debug("MESH: probeOne() gc_execute_line failed");
        return false;
    }
    float value = system_convert_axis_steps_to_mpos(sys_probe_position,Z_AXIS);

    #if DEBUG_MESH > 1
        g_debug("MESH: probe(%d,%d)=%f",x,y,value);
    #endif

    *zResult = value;
    return true;
}


bool doMeshLeveling()
{
    #if DEBUG_MESH
        g_debug("MESH: doMeshLeveling()");
    #endif

    init_mesh();

    // Finish all queued commands and empty planner buffer before starting probe cycle.
    // Return if system reset has been issued.

    protocol_buffer_synchronize();
    if (sys.abort) return false;
    sys.state = State::Idle;        // turn of "homing" flag!!

    char buf[24];
    strcpy(buf,"g0 x0 y0 z-18");
    if (!mesh_execute(buf))
    {
        g_debug("MESH: could not move to initial position");
        return false;
    }

    for (int y=0; y<MESH_Y_STEPS; y++)
    {
        int start = y & 1 ? MESH_X_STEPS-1 : 0;
        int end   = y & 1 ? -1 : MESH_X_STEPS;
        int inc   = y & 1 ? -1 : 1;

        for (int x=start; x!=end; x+=inc)
        {
            if (moveTo(MESH_MARGIN + x*mesh_x_step, MESH_MARGIN + y*mesh_y_step))
            {
                float value = 0.0;
                if (probeOne(x,y,&value))
                {
                    if (x==0 && y==0)
                    {
                        zero_point = value;

                        #if DEBUG_MESH
                            g_debug("MESH: zero_point <= %6.3f",zero_point);
                        #endif
                    }
                    else
                    {
                        mesh[x][y] = value - zero_point;

                        #if DEBUG_MESH
                            g_debug("MESH: mesh[%d,%d] <= %6.3f",x,y,mesh[x][y]);
                        #endif
                    }

                    zPullOff();
                }
                else
                {
                    g_debug("MESH: probeOne(%d,%d) failed",x,y);
                    return false;
                }
            }
            else
            {
                g_debug("MESH: moveTo(%d,%d) failed",x,y);
                return false;
            }
        }
    }

    moveTo(0,0);

    #if DEBUG_MESH
        g_debug("MESH: doMeshLeveling() succeeded!");
    #endif

    debug_mesh();
    mesh_is_valid = true;
    return true;
}



bool user_defined_homing(AxisMask axisMask)
{
    if (axisMask != Z_AXIS_MASK)
        return false;
    g_debug("cnc3018 user_defined_homing Z_AXIS!!");

    doMeshLeveling();


    #if 0

        if (!config->_probe->exists()) {
            log_error("Probe pin is not configured");
            return GCUpdatePos::None;
        }
        // TODO: Need to update this cycle so it obeys a non-auto cycle start.
        if (sys.state == State::CheckMode) {
            return config->_probe->_check_mode_start ? GCUpdatePos::None : GCUpdatePos::Target;
        }
        // Finish all queued commands and empty planner buffer before starting probe cycle.
        protocol_buffer_synchronize();
        if (sys.abort) {
            return GCUpdatePos::None;  // Return if system reset has been issued.
        }

        config->_stepping->beginLowLatency();

        // Initialize probing control variables
        bool is_probe_away  = bits_are_true(parser_flags, GCParserProbeIsAway);
        bool is_no_error    = bits_are_true(parser_flags, GCParserProbeIsNoError);
        sys.probe_succeeded = false;  // Re-initialize probe history before beginning cycle.
        config->_probe->set_direction(is_probe_away);
        // After syncing, check if probe is already triggered. If so, halt and issue alarm.
        // NOTE: This probe initialization error applies to all probing cycles.
        if (config->_probe->tripped()) {
            sys_rt_exec_alarm = ExecAlarm::ProbeFailInitial;
            protocol_execute_realtime();
            config->_stepping->endLowLatency();
            return GCUpdatePos::None;  // Nothing else to do but bail.
        }
        // Setup and queue probing motion. Auto cycle-start should not start the cycle.
        log_info("Found");
        cartesian_to_motors(target, pl_data, gc_state.position);
        // Activate the probing state monitor in the stepper module.
        sys_probe_state = ProbeState::Active;
        // Perform probing cycle. Wait here until probe is triggered or motion completes.
        rtCycleStart = true;
        do {
            protocol_execute_realtime();
            if (sys.abort) {
                config->_stepping->endLowLatency();
                return GCUpdatePos::None;  // Check for system abort
            }
        } while (sys.state != State::Idle);

        config->_stepping->endLowLatency();

        // Probing cycle complete!
        // Set state variables and error out, if the probe failed and cycle with error is enabled.
        if (sys_probe_state == ProbeState::Active) {
            if (is_no_error) {
                memcpy(sys_probe_position, sys_position, sizeof(sys_position));
            } else {
                sys_rt_exec_alarm = ExecAlarm::ProbeFailContact;
            }
        } else {
            sys.probe_succeeded = true;  // Indicate to system the probing cycle completed successfully.
        }
        sys_probe_state = ProbeState::Off;  // Ensure probe state monitor is disabled.
        protocol_execute_realtime();        // Check and execute run-time commands
        // Reset the stepper and planner buffers to remove the remainder of the probe motion.
        Stepper::reset();      // Reset step segment buffer.
        plan_reset();          // Reset planner buffer. Zero planner positions. Ensure probing motion is cleared.
        plan_sync_position();  // Sync planner position to current machine position.
        if (MESSAGE_PROBE_COORDINATES) {
            // All done! Output the probe position as message.
            report_probe_parameters(CLIENT_ALL);
        }
        if (sys.probe_succeeded) {
            return GCUpdatePos::System;  // Successful probe cycle.
        } else {
            return GCUpdatePos::Target;  // Failed to trigger probe within travel. With or without error.
        }
    #endif

    return true;
}
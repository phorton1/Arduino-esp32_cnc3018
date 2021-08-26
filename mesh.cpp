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
// will end up at _z_pulloff above work position 0,0
// mesh is relative to m_zero_point

// my test zero is at x=62 y=9


#include "cnc3018.h"
#include "mesh.h"

#include <Report.h>
#include <Logging.h>
#include <System.h>
#include <GCode.h>
#include <Protocol.h>
#include <Machine/MachineConfig.h>
#include <MotionControl.h>

#define DEBUG_MESH          1       // upto 3
#define DEBUG_GET_Z_OFFSET  0
#define DEBUG_VREVERSE      0       // upto 2
#define DEBUG_VFORWARD      0


#define Z_AXIS       2
#define Z_AXIS_MASK  0x04

#define DEFAULT_MESH_HEIGHT         100       // mm
#define DEFAULT_MESH_WIDTH          148       // mm
#define DEFAULT_MESH_MARGIN         5.0       // mm's from the edges of the work piece
#define DEFAULT_MESH_X_STEPS        6         // every 20mm
#define DEFAULT_MESH_Y_STEPS        4         // 90/4 mm
#define DEFAULT_MESH_Z_PULLOFF      2.0       // pull off after 0th point
#define DEFAULT_MESH_Z_MAX_TRAVEL   -25.0     // mm in negative direction from absolute 0,0
#define DEFAULT_MESH_Z_FEED_RATE    50.0      // mm per min
#define DEFAULT_LINE_SEG_LENGTH     2         // mm

Mesh::Mesh()
{
    m_is_valid = 0;
    m_in_leveling = 0;

	_height			    = DEFAULT_MESH_HEIGHT;
	_width			    = DEFAULT_MESH_WIDTH;
	_margin			    = DEFAULT_MESH_MARGIN;
	_x_steps		    = DEFAULT_MESH_X_STEPS;
	_y_steps		    = DEFAULT_MESH_Y_STEPS;
	_z_pulloff		    = DEFAULT_MESH_Z_PULLOFF;
	_z_max_travel	    = DEFAULT_MESH_Z_MAX_TRAVEL;
	_z_feed_rate	    = DEFAULT_MESH_Z_FEED_RATE;
    _line_seg_length    = DEFAULT_LINE_SEG_LENGTH;
}


void Mesh::group(Configuration::HandlerBase& handler) // override
{
	handler.item("height", 	    _height);
	handler.item("width", 		_width);
	handler.item("margin",		_margin);
	handler.item("x_steps",	    _x_steps);
	handler.item("y_steps",     _y_steps);
	handler.item("pulloff",     _z_pulloff);
	handler.item("max_travel",  _z_max_travel);
	handler.item("feed_rate",   _z_feed_rate);
    handler.item("line_seg_len",_line_seg_length);
}


//--------------------------------------------
// retrieval API
//--------------------------------------------

bool Mesh::isValid()
{
    return m_is_valid;
}


float Mesh::getZOffset(float wx, float wy)
    // IN WORK COORDINATES
{
    if (!m_is_valid)
        return 0.00;

    #if DEBUG_GET_Z_OFFSET
        g_debug("GET_Z_OFFSET(%5.3f,%5.3f)",wx,wy);
    #endif

    wx -= _margin;
    wy -= _margin;

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
        x_left = wx / m_dx;
        x_right = x_left + 1;
        if (x_left > _x_steps - 1)
            x_left = _x_steps - 1;
        if (x_right > _x_steps - 1)
            x_right = _x_steps - 1;
        pct_x = (wx - x_left * m_dx) / m_dx;
        if (pct_x > 1.0) pct_x = 1.0;
    }

    int y_top;
    int y_bottom;
    float pct_y;
    if (wy < 0)
    {
        y_top = 0;
        y_bottom = 0;
        pct_y = 1.0;
    }
    else
    {
        y_bottom = wy / m_dy;
        y_top = y_bottom + 1;
        if (y_bottom > _y_steps - 1)
            y_bottom = _y_steps - 1;
        if (y_top > _y_steps - 1)
            y_top = _y_steps - 1;
        pct_y = (wy - y_bottom * m_dy) / m_dy;
    }

    // get the four values

    float left_bottom =    m_mesh[x_left][y_bottom];
    float left_top =       m_mesh[x_left][y_top];
    float right_bottom =   m_mesh[x_right][y_bottom];
    float right_top =      m_mesh[x_right][y_top];

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

    #if DEBUG_GET_Z_OFFSET
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
    #endif

    return value;
}



//--------------------------------------------
// genration API
//--------------------------------------------


void Mesh::debug_mesh()
{
    #if DEBUG_MESH
        g_debug("MESH: m_zero_point == %6.3f",m_zero_point);
        for (int y=_y_steps-1; y>=0; y--)
        {
            char buf[100];
            sprintf(buf,"MESH[%d] ",y);
            for (int x=0; x<_x_steps; x++)
            {
                sprintf(&buf[strlen(buf)]," % 6.3f",m_mesh[x][y]);
            }
            g_debug(buf);
        }
    #endif
}


void Mesh::init_mesh()
{
    #if DEBUG_MESH > 2
        g_debug("MESH: init_mesh()");
    #endif

    m_zero_point = 0.0;
    m_is_valid = false;

    m_dx = (_width - 2*_margin) / (_x_steps-1);
    m_dy = (_height - 2*_margin) / (_y_steps-1);

    for (int x=0; x<_x_steps; x++)
    {
        for (int y=0; y<_y_steps; y++)
        {
            m_mesh[x][y] = 0.00;
        }
    }
}



static bool _mesh_execute(char *buf)
    // _ means it does not use any member variables
{
    #if DEBUG_MESH > 2
        g_debug("MESH: _mesh_execute(%s)",buf);
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


static bool _moveTo(float x, float y)
    // move in current coordinate system
    // _ means it does not use any member variables
{
    #if DEBUG_MESH > 2
        g_debug("MESH: _moveTo(%5.3f,%5.3f)",x,y);
    #endif
    char buf[24];
    sprintf(buf,"g0 x%5.3f y%5.3f",x,y);
    return _mesh_execute(buf);
}


bool Mesh::zPullOff() // move z upwards relative, check that probe goes off too
{
    float to = m_zero_point + _z_pulloff;
    #if DEBUG_MESH > 2
        g_debug("MESH: zPullOff() m_zero_point=%5.3f to=%5.3f",m_zero_point,to);
    #endif
    char buf[24];
    sprintf(buf,"g0 z%5.3f",to);
    bool move_ok = _mesh_execute(buf);
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




bool Mesh::probeOne(int x, int y, float *zResult)
    // do a probe and return the z value in absolute machine coordinates
{
    #if DEBUG_MESH > 2
        g_debug("MESH: probeOne()");
    #endif

    char buf[24];
    sprintf(buf,"g38.2 z%5.3f f%5.3f",
        _z_max_travel,
        _z_feed_rate);

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


bool Mesh::doMeshLeveling()
{
    m_in_leveling = true;

    #if DEBUG_MESH
        g_debug("MESH: doMeshLeveling()");
    #endif

    init_mesh();

    // Finish all queued commands and empty planner buffer before starting probe cycle.
    // Return if system reset has been issued.

    protocol_buffer_synchronize();
    if (sys.abort)
    {
        m_in_leveling = false;
        return false;
    }
    sys.state = State::Idle;        // turn of "homing" flag!!

    char buf[24];
    strcpy(buf,"g0 x0 y0 z-18");
    if (!_mesh_execute(buf))
    {
        g_debug("MESH: could not move to initial position");
        m_in_leveling = false;
        return false;
    }

    for (int y=0; y<_y_steps; y++)
    {
        int start = y & 1 ? _x_steps-1 : 0;
        int end   = y & 1 ? -1 : _x_steps;
        int inc   = y & 1 ? -1 : 1;

        for (int x=start; x!=end; x+=inc)
        {
            if (_moveTo(_margin + x*m_dx, _margin + y*m_dy))
            {
                float value = 0.0;
                if (probeOne(x,y,&value))
                {
                    if (x==0 && y==0)
                    {
                        m_zero_point = value;

                        #if DEBUG_MESH > 1
                            g_debug("MESH: m_zero_point <= %6.3f",m_zero_point);
                        #endif
                    }
                    else
                    {
                        m_mesh[x][y] = value - m_zero_point;

                        #if DEBUG_MESH > 1
                            g_debug("MESH: m_mesh[%d,%d] <= %6.3f",x,y,m_mesh[x][y]);
                        #endif
                    }

                    zPullOff();
                }
                else
                {
                    g_debug("MESH: probeOne(%d,%d) failed",x,y);
                    m_in_leveling = false;
                    return false;
                }
            }
            else
            {
                g_debug("MESH: moveTo(%d,%d) failed",x,y);
                m_in_leveling = false;
                return false;
            }
        }
    }

    _moveTo(0,0);

    #if DEBUG_MESH
        g_debug("MESH: doMeshLeveling() succeeded!");
    #endif

    debug_mesh();

    m_in_leveling = false;
    m_is_valid = true;
    return true;
}


//--------------------------------------------
// Override WEAK_LINK user_defined_homing()
//--------------------------------------------

bool user_defined_homing(AxisMask axisMask)
{
    // anytime we home we invalidate the mesh

    the_machine._mesh->invalidateMesh();

    if (axisMask != Z_AXIS_MASK)
        return false;
    g_debug("cnc3018 user_defined_homing Z_AXIS!!");

    the_machine._mesh->doMeshLeveling();
    return true;
}


//======================================================================
// implement "kinematics" to shoehorn the mesh into Grbl_Esp32
//======================================================================

bool cartesian_to_motors(float* target, plan_line_data_t* pl_data, float* position)
    // given a target and initial position in Machine Coordinates
    // call mc_line() to move to the new position possibly including
    // the mesh z offset
{
    Mesh *mesh = the_machine._mesh;

    // if the mesh is not valid, just call a single mc_line()
    // for the entire traversal

    if (!mesh->isValid())
    {
        if (!mc_line(target, pl_data))
			return false;
        return true;
    }

	#if DEBUG_VREVERSE
		g_debug("C2M from(%5.3f,%5.3f,%5.3f) to (%5.3f,%5.3f,%5.3f)",
			position[X_AXIS],
            position[Y_AXIS],
            position[Z_AXIS],
            target[X_AXIS],
            target[Y_AXIS],
            target[Z_AXIS]);
	#endif

    // break the x/y portion of the line up into multiple segments

	uint32_t num_segs = 1;
	float xdist = target[X_AXIS] - position[X_AXIS];
	float ydist = target[Y_AXIS] - position[Y_AXIS];
	float zdist = target[Z_AXIS] - position[Z_AXIS];

	if (!pl_data->motion.rapidMotion && (xdist!=0 || ydist!=0))
	{
		float dist = sqrt(xdist*xdist + ydist*ydist + zdist*zdist);
		float line_seg_len = mesh->getLineSegLength();
		float f_num_segs = (dist + (line_seg_len/2))/line_seg_len;
		num_segs = f_num_segs;
		if (!num_segs) num_segs = 1;
	}

    // create a copy of the initial position in work coordinates
    // we will increment both the actual position, and the x/y
    // work position in the loop

	float wpos[MAX_N_AXIS];
    memcpy(wpos,position,3 * sizeof(float));
    mpos_to_wpos(wpos);


	//--------------------
	// do loop of segments
	//--------------------

	float xinc = xdist/num_segs;
	float yinc = ydist/num_segs;
    float zinc = zdist/num_segs;

	#if DEBUG_VREVERSE
		g_debug("C2M doing %d segments with incs(%5.3f,%5.3f,%5.3f)",
			num_segs,
			xinc,
			yinc,
			zinc);
	#endif

	for (uint32_t seg_num=0; seg_num<num_segs; seg_num++)
	{
		position[X_AXIS] += xinc;
		position[Y_AXIS] += yinc;
		position[Z_AXIS] += zinc;
		wpos[X_AXIS] += xinc;
		wpos[Y_AXIS] += yinc;

        // we need a working copy of the position
        // so that we don't accumulate zOffsets

        float tpos[3];
        memcpy(tpos,position,3 * sizeof(float));

        // get the zOffset at the work position
        // and add it to the working copy

        float zoff = mesh->getZOffset(wpos[X_AXIS],wpos[Y_AXIS]);
        tpos[Z_AXIS] += zoff;

		#if DEBUG_VREVERSE>1
			g_debug("C2M seg(%d) to(%5.3f,%5.3f,%5.3f) zoff=%5.3f",
				seg_num,
				tpos[X_AXIS],
				tpos[Y_AXIS],
				tpos[Z_AXIS],
				zoff);
		#endif

		if (!mc_line(tpos, pl_data))
			return false;

	}	// for each segment

    return true;

}


//--------------------------------------------------------------------------------------------------------
// motors_to_cartesian
//--------------------------------------------------------------------------------------------------------

void motors_to_cartesian(float* cartesian, float* motors, int n_axis)
    // the input variable "motors" is "machine position"
    // the output variable is "cartesian"
{
    Mesh *mesh = the_machine._mesh;

    // the only thing we might change is the Z

    memcpy(cartesian,motors,3 * sizeof(float));

    // if the mesh is not valid, just return the input

    if (!mesh->isValid())
        return;

    // convert mpos to wpos

	float wpos[MAX_N_AXIS];
    memcpy(wpos,motors,3 * sizeof(float));
    mpos_to_wpos(wpos);

    // get the zOffset at the location
    // and subtract it from the z location

    float zoff = mesh->getZOffset(wpos[X_AXIS],wpos[Y_AXIS]);

    #if DEBUG_VFORWARD
        g_debug("M2C(%5.3f,%5.3f,%5.3f) subtracting z_offset(%5.3f)",
            motors[X_AXIS],
            motors[Y_AXIS],
            motors[Z_AXIS],
            zoff);
    #endif

    cartesian[Z_AXIS] -= zoff;
}

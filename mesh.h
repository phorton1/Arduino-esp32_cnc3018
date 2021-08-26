// cnc3018.h

#pragma once

#include "Configuration/Configurable.h"

// maximum mesh is big enough for 20mm grid on 3018 machine
// and occupies about 1/2K of memory

#define MAX_MESH_X_STEPS  15
#define MAX_MESH_Y_STEPS  9


class Mesh : public Configuration::Configurable
{
    public:

        Mesh();

        bool isValid();
            // returns true if doMeshLeveling succeeded

        float getZOffset(float wx, float wy);
            // After $HZ works, isValid() will return true and one can
            // call getZOffset with wx,wy in work coordinates to get the
            // interpolated mesh z offset at that point.

        bool doMeshLeveling();
            // called by contained override of weakly linked
            // user_deefined_homing() on $HZ axis

        bool inLeveling()      { return m_in_leveling; }
            // to suppress various debug messages in other objects

        void invalidateMesh()   { m_is_valid = false; }
            // public API to erase the mesh
            // mesh is invalidated by any homing

        float getLineSegLength()  { return _line_seg_length; }
            // length of interpolated line segments for
            // cartesian_to_motors()

    private:

        // config variables

        float _height;
        float _width;
        float _margin;
        float _x_steps;
        float _y_steps;
        float _z_pulloff;
        float _z_max_travel;
        float _z_feed_rate;
        float _line_seg_length;

        // working variables

        bool    m_in_leveling;                              // true while in doMeshLeveling
        bool    m_is_valid;                                 // mesh levelling has completed
        float   m_zero_point;                               // the absolute machine position of z=0 at xy=0,0 (5,5)
        float   m_mesh[MAX_MESH_X_STEPS][MAX_MESH_Y_STEPS]; // the mesh
        float   m_dx;                                       // size of a step in machine coordinates
        float   m_dy;

        // configurable api

        void group(Configuration::HandlerBase& handler) override;

        // implementation

        void init_mesh();
        bool probeOne(int x, int y, float *zResult);
        bool zPullOff();
        void debug_mesh();

};  // class Mesh

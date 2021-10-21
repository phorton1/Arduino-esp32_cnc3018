// cnc3018.cpp

#include "cnc3018.h"
#include "myProbe.h"
#include <YamlOverrides.h>	// FluidNC_extensions
	// can be commented out to disable extension
#ifdef WITH_UI
	#include <gApp.h>		// FluidNC_UI
#endif

#define DEBUG_YAML 	0


myProbe my_probe;
cnc3018 the_machine;


//---------------------------
// implement Mesh extension
//---------------------------
// instantiation of the_mesh object and
// overrides of WEAK_LINKs from FluidNC.


#ifdef WITH_MESH
	Mesh the_mesh;

	bool cartesian_to_motors(float* target, plan_line_data_t* pl_data, float* position)
	{
		the_mesh.cartesian_to_motors(target, pl_data, position);
	}

	void motors_to_cartesian(float* cartesian, float* motors, int n_axis)
	{
		the_mesh.motors_to_cartesian(cartesian, motors, n_axis);
	}

#endif



void user_realtime_command(uint8_t command, Print &client)
{
	// ctrl keys
	//
	// ctrl-Q			CMD_LIVE_Z_PLUS_COARSE
	// ctrl-W       	CMD_LIVE_Z_PLUS_FINE
	// ctrl-E       	CMD_LIVE_Z_RESET
	// ctrl-R       	CMD_LIVE_Z_MINUS_FINE
	// ctrl-T       	CMD_LIVE_Z_MINUS_COARSE
	//
	// 0x01 - ctrl-A
	// 0x02 - ctrl-B
	// 0x03 - ctrl-C	concole exit
	// 0x04 - ctrl-D	console clear
	// 0x05 - ctrl-E	CMD_LIVE_Z_RESET
	// 0x06 - ctrl-F	console experimental gcode
	// 0x07 - ctrl-G	console gcode
	// 0x08 - ctrl-H
	// 0x09 - ctrl-I
	// 0x0a - ctrl-J
	// 0x0b - ctrl-K
	// 0x0c - ctrl-L
	// 0x0d - ctrl-M
	// 0x0e - ctrl-N
	// 0x0f - ctrl-O    CMD_UI_SCREEN_GRAB_PENDING
	// 0x10 - ctrl-P    CMD_UI_SCREEN_GRAB
	// 0x11 - ctrl-Q	CMD_LIVE_Z_PLUS_COARSE
	// 0x12 - ctrl-R    CMD_LIVE_Z_MINUS_COARSE
	// 0x13 - ctrl-S
	// 0x14 - ctrl-T	CMD_LIVE_Z_MINUS_COARSE
	// 0x15 - ctrl-U
	// 0x16 - ctrl-V
	// 0x17 - ctrl-W	CMD_LIVE_Z_PLUS_FINE
	// 0x18 - ctrl-X	FluidNC reset (console upload if enabled)
	// 0x19 - ctrl-Y
	// 0x1a - ctrl-Z
	// 0x1b - ESC
	// 0x1c -
	// 0x1d -
	// 0x1e -
	// 0x1f -

	g_debug("user_realtime_command(0x%02x)",command);

	switch (command)
	{
		#ifdef WITH_MESH
			case CMD_LIVE_Z_PLUS_COARSE :
			case CMD_LIVE_Z_PLUS_FINE :
			case CMD_LIVE_Z_RESET :
			case CMD_LIVE_Z_MINUS_FINE :
			case CMD_LIVE_Z_MINUS_COARSE :
				the_mesh.setLiveZ(command);
				break;
		#endif
		#ifdef WITH_UI
			#ifdef WITH_SCREEN_GRAB
				case CMD_UI_SCREEN_GRAB :
					gApplication::doScreenGrab(false);
					break;
				case CMD_UI_SCREEN_GRAB_PENDING :
					gApplication::doScreenGrab(true);
					break;
			#endif
		#endif
	}
}


//-------------------------------------
// implement cnc3018 "machine"
//-------------------------------------

cnc3018::cnc3018()
{
	_probe = &my_probe;
	config = this;
}




void cnc3018::afterParse() // override
{
	#if DEBUG_YAML
		g_debug("---> cnc3018::afterParse() called");
	#endif

	// At this point the tree is fleshed out with items from the yaml file, but not
	// with the entire tree as *determined* by MachineConfig::afterParse().

	Machine::MachineConfig::afterParse();
}




void cnc3018::group(Configuration::HandlerBase& handler) // override
{
	#if DEBUG_YAML
		const char *htype = "UNKNOWN";
		switch (handler.handlerType())
		{
			case Configuration::HandlerType::Parser		:  htype="Parser";  break;
			case Configuration::HandlerType::AfterParse	:  htype="AfterParse";  break;
			case Configuration::HandlerType::Runtime	:  htype="Runtime";  break;
			case Configuration::HandlerType::Generator	:  htype="Generator";  break;
			case Configuration::HandlerType::Validator	:  htype="Validator";  break;
		}
		g_debug("---> cnc3018::group(handler=%s) called",htype);
	#endif

	Machine::MachineConfig::group(handler);
#ifdef WITH_MESH
	Mesh *_mesh = &the_mesh;
	handler.section("mesh",_mesh);
#endif

	static bool first_time = true;
	if (first_time)
	{
		first_time = false;
		bumpPixel();	// 2
	}
}

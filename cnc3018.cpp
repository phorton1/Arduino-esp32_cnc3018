// cnc3018.cpp

#include "cnc3018.h"
#include "myProbe.h"
#include <YamlOverrides.h>
	// can be commented out to disable extension

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

	#if MESH_USER_DEFINED_HOMING
		bool user_defined_homing(AxisMask axisMask)
		{
			return the_mesh.user_defined_homing(axisMask);
		}
	#endif
#endif


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
}

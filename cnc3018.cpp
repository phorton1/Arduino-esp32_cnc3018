// cnc3018.cpp

#include "cnc3018.h"
#include "myProbe.h"
#include <YamlOverrides.h>

#define DEBUG_YAML 	0



Mesh my_mesh;
myProbe my_probe;
cnc3018 the_machine;


cnc3018::cnc3018()
{
	_probe = &my_probe;
	_mesh  = &my_mesh;
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

	handler.section("mesh", _mesh);

}

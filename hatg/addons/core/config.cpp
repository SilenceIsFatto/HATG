#include "script_component.hpp"

class CfgPatches 
{
	class ADDON
	{
		name = COMPONENT_NAME;
		units[] = {
			"hatg_mirror",
			"hatg_mirror_debug"
		};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {
			"CBA_Main"
		};
		author = "Silence";
		authorUrl = "";
		VERSION_CONFIG;
	};
};

class CfgVehicles
{
	#include "CfgVehicles.hpp"
};
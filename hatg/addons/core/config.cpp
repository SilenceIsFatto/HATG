#include "script_component.hpp"

class CfgPatches 
{
	class ADDON
	{
		name = COMPONENT_NAME;
		units[] = {};
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
#include "script_component.hpp"

class CfgPatches 
{
	class ADDON 
	{
		name = COMPONENT_NAME;
		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {MOD(core)};
		author = "Silence";
		url = "";
		VERSION_CONFIG;
	};
};

class CfgVehicles
{
	class Man;
	class CAManBase: Man
	{
		extCameraPosition[] = {0.22,0.05,-2.2};
	};
};
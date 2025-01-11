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

#include "CfgFunctions.hpp"

class RscTitles
{
	class RscTitleDisplayEmpty;

	class RscTitleDisplayHATGHidden : RscTitleDisplayEmpty {};
};
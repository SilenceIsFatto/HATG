#include "script_component.hpp"

class CfgPatches 
{
	class ADDON 
	{
		name = COMPONENT_NAME;
		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {"CBA_Main"};
		author = "Silence";
		url = "";
		VERSION_CONFIG;
	};
};

#include "CfgFunctions.hpp"

class Extended_PreInit_EventHandlers
{
    class MOD(preInit)
    {
        init = "call HATG_fnc_preInit";
    };
};

class Extended_PostInit_EventHandlers
{
    class MOD(postInit)
    {
        init = "call HATG_fnc_postInit";
    };
};
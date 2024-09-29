if (isServer) then {missionNamespace setVariable ["hatg_serverActivated", true, true]};

call HATG_fnc_settings;

if !(hasInterface) exitWith {false}; // Do not run further preInit on dedicated servers or headless clients
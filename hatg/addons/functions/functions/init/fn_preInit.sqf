if (isServer) then {missionNamespace setVariable ["hatg_serverActivated", true, true]};
if !(hasInterface) exitWith {false}; // Do not run preInit on dedicated servers or headless clients

call HATG_fnc_settings;
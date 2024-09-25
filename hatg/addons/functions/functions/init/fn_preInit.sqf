if (isServer) then {["hatg_serverActivated", true] call HATG_fnc_setVariable};
if !(hasInterface) exitWith {false}; // Do not run preInit on dedicated servers or headless clients

call HATG_fnc_settings;
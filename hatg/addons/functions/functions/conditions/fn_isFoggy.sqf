if (fog >= 0.3) exitWith {true};

[format["Fog Level: %1", fog], 3, _fnc_scriptName] call HATG_fnc_log;

false;
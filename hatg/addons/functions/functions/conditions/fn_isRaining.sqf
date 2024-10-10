if (rain >= 0.3) exitWith {true};

[format["Rain Level: %1", rain], 3, _fnc_scriptName] call HATG_fnc_log;

false;
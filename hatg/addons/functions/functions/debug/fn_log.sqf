params [
    ["_message", ""],
    ["_level", 0],
    ["_script", _fnc_scriptName]
];

private _logMessage = format ["| Hide Among The Grass | %1 | %2 |", _message, _script];

if (_level == 1 && {call HATG_fnc_isDebug isEqualTo false}) exitWith {nil};
if (_level == 2 && {["hatg_setting_debug_surface", false] call HATG_fnc_getVariable isEqualTo false}) exitWith {nil};
if (_level == 3 && {["hatg_setting_debug_conditions", false] call HATG_fnc_getVariable isEqualTo false}) exitWith {nil};

diag_log _logMessage;
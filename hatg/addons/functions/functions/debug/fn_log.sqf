/*
    Author:
        Silence
    
    Description:
        Handles logging messages with different debug levels.
    
    Params:
        _message <STRING> <Default: "">
        _level <INT> <Default: 0>
        _script <STRING> <Default: _fnc_scriptName>
    
    Dependencies:
        missionNamespace variables:
        > "hatg_setting_debug_surface" <BOOL>
        > "hatg_setting_debug_conditions" <BOOL>
    
    Usage:
        ["Test"] call HATG_fnc_log;
    
    Return:
        N/A
*/

params [
    ["_message", ""],
    ["_level", 0],
    ["_script", _fnc_scriptName],
    ["_server", false]
];

private _logMessage = format ["| Hide Among The Grass | %1 | %2 |", _message, _script];

if (_level == 1 && {call HATG_fnc_isDebug isEqualTo false}) exitWith {nil};
if (_level == 2 && {["hatg_setting_debug_surface", false] call HATG_fnc_getVariable isEqualTo false}) exitWith {nil};
if (_level == 3 && {["hatg_setting_debug_conditions", false] call HATG_fnc_getVariable isEqualTo false}) exitWith {nil};
if (_level == 4 && {["hatg_setting_debug_detection", false] call HATG_fnc_getVariable isEqualTo false}) exitWith {nil};

if (_server) exitWith {[_message, _level, _script, false] remoteExec ["HATG_fnc_log", 2]};

diag_log _logMessage;
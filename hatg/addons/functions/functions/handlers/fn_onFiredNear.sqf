/*
    Author:
        Silence
    
    Description:
        The associated code with "handleFiredNear"
    
    Params:
        _unit <OBJECT>
        _firer <OBJECT>
    
    Dependencies:
        global variables:
    
    Usage:
        [player] call HATG_fnc_onFiredNear;
    
    Return:
        N/A
*/

params ["_unit", "_firer"];

[format["%1 was caught in a 'fired' event. %2 was the firer. Checking conditions"], 4, _fnc_scriptName] call HATG_fnc_log;

if (hatg_setting_reveal_nearby isEqualTo false) exitWith {["Failed 'Fired' Setting Check", 4, _fnc_scriptName] call HATG_fnc_log; false};
if ([_firer] call HATG_fnc_getMirror isNotEqualTo ObjNull) exitWith {["Failed 'Fired' Mirror Check", 4, _fnc_scriptName] call HATG_fnc_log; false};
if ([_firer] call HATG_fnc_canCreateMirror) exitWith {["Failed 'Fired' Can Create Mirror Check", 4, _fnc_scriptName] call HATG_fnc_log; false};

[format["%1 was caught in a 'fired' event. %2 was the firer. Giving them a cooldown."], 4, _fnc_scriptName] call HATG_fnc_log;

[_unit] call HATG_fnc_cooldown;
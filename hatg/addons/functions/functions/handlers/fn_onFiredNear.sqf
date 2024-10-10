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

[format["%1 was caught in a 'fired' event. %2 was the firer. Checking conditions", name _unit, name _firer], 4, _fnc_scriptName] call HATG_fnc_log;

if (_unit isEqualTo _firer) exitWith {false};

if ((_unit distance _firer) <= hatg_setting_distance_close) exitWith {
    [_unit] remoteExecCall ["HATG_fnc_cooldown", 0];
    [format["%1 was caught in a 'fired' event. %2 was the firer. Giving them a distance cooldown", name _unit, name _firer], 4, _fnc_scriptName] call HATG_fnc_log;
    false;
};

if ((_unit distance _firer) >= hatg_setting_distance_close) exitWith {false};
if (hatg_setting_reveal_nearby isEqualTo false) exitWith {["Failed 'Fired' Setting Check", 4, _fnc_scriptName] call HATG_fnc_log; false};
if ([_firer] call HATG_fnc_getMirror isNotEqualTo ObjNull) exitWith {["Failed 'Fired' Mirror Check", 4, _fnc_scriptName] call HATG_fnc_log; false};
if ([_firer, (stance _firer)] call HATG_fnc_canCreateMirror) exitWith {["Failed 'Fired' Can Create Mirror Check", 4, _fnc_scriptName] call HATG_fnc_log; false};

[_unit] remoteExecCall ["HATG_fnc_cooldown", 0]; // Needs to be broadcasted, otherwise remote clients won't recieve the cooldown
[format["%1 was caught in a 'fired' event. %2 was the firer. Giving them a cooldown", name _unit, name _firer], 4, _fnc_scriptName] call HATG_fnc_log;

false;
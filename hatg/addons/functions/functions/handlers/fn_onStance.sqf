/*
    Author:
        Silence
    
    Description:
        The associated code with "handleStance"
    
    Params:
        _unit <OBJECT>
    
    Dependencies:
        missionNamespace variables:
        > "hatg_mirror_disable" <BOOL>
    
    Usage:
        [player] call HATG_fnc_onStance;
    
    Return:
        N/A
*/

params ["_unit"];

if !(alive _unit) exitWith {nil}; // unit is dead
if (["hatg_mirror_disable", false, _unit] call HATG_fnc_getVariable isEqualTo true) exitWith {nil}; // unit has mirrors disabled

private _stance = stance _unit;

private _canCreateMirror = [_unit] call HATG_fnc_canCreateMirror;
// I'm not too happy about calling this every second, will have to check code performance. 
// Update: Brought it down from 2.2ms to 0.6ms with 119 AI in the "nearby" radius, still not particularly great but almost 4x faster.
[_canCreateMirror, 3, _fnc_scriptName] call HATG_fnc_log;

if (_stance == "PRONE" && {_canCreateMirror}) then {
    [_unit] call HATG_fnc_createMirror;
} else {
    [_unit] call HATG_fnc_deleteMirror;
};
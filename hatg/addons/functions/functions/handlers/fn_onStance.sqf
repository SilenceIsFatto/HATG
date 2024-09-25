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
        true, if we should exit
*/

params ["_unit"];

if !(alive _unit) exitWith {true}; // unit is dead
if (["hatg_mirror_disable", false, _unit] call HATG_fnc_getVariable isEqualTo true) exitWith {true}; // unit has mirrors disabled

private _stance = stance _unit;

// Honestly could probably merge the 2 ifs below into one, just need to handle the _canCreateMirror(Crouch)
if !(_stance in ["PRONE", "CROUCH"]) exitWith {false};

if (_stance isEqualTo "PRONE" && {[_unit] call HATG_fnc_canCreateMirror}) exitWith { // Originally took 2.2ms to run with 119 AI, got it down to ~0.6ms. Still not particularly great but almost 4x faster.
    [_unit] call HATG_fnc_createMirror;
    false;
};

if (_stance isEqualTo "CROUCH" && {[_unit] call HATG_fnc_canCreateMirrorCrouch}) exitWith {
    [_unit, "CROUCH"] call HATG_fnc_createMirror;
    false;
};

[_unit] call HATG_fnc_deleteMirror;

false;
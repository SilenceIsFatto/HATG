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

if !(alive _unit) exitWith {true};
if (["hatg_mirror_disable", false, _unit] call HATG_fnc_getVariable isEqualTo true) exitWith {true};

private _stance = stance _unit;
private _stances = ["PRONE", "CROUCH", "STAND"];

if !(_stance in _stances) exitWith {
    if (HATG_Client_Side) then {
        [_unit, false, false] call HATG_fnc_clIgnoreTarget;
    } else {
        [_unit] call HATG_fnc_deleteMirror;
    };
    false;
};

if ([_unit, _stance] call HATG_fnc_canCreateMirror) exitWith {
    if (HATG_Client_Side) then {
        [_unit, true, true] call HATG_fnc_clIgnoreTarget;
    } else {
        [_unit] call HATG_fnc_createMirror;
    };
    false;
};

if (HATG_Client_Side) then {
    [_unit, false, false] call HATG_fnc_clIgnoreTarget;
} else {
    [_unit] call HATG_fnc_deleteMirror;
};

false;
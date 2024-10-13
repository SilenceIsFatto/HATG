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

private _serverActivated = ["hatg_serverActivated", false] call HATG_fnc_getVariable;
private _stance = stance _unit;
private _stances = ["PRONE", "CROUCH", "STAND"];

if !(_stance in _stances) exitWith {
    if (_serverActivated) then {
        [_unit] call HATG_fnc_deleteMirror;
    } else {
        [_unit, _stance] call HATG_fnc_clIgnoreTarget;
    };
    false;
};

if ([_unit, _stance] call HATG_fnc_canCreateMirror) exitWith {
    if !(_serverActivated) then {
        [_unit, _stance] call HATG_fnc_clIgnoreTarget;
    } else {
        [_unit] call HATG_fnc_createMirror;
    }
    false;
};

[_unit] call HATG_fnc_deleteMirror;

false;
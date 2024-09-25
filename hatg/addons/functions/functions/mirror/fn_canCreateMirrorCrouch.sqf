/*
    Author:
        Silence
    
    Description:
        Checks if a mirror can be created whilst crouched. This is a little bit more lenient in every other way except the getNearbyUnits check, which is much more intensive.
    
    Params:
        _unit <OBJECT> <Default: ObjNull>
    
    Dependencies:
        _unit Namespace variables:
        > "hatg_mirror_cooldown"
    
    Usage:
        [player] call HATG_fnc_canCreateMirrorCrouch;
    
    Return:
        true, false <BOOL>
*/

params [
    ["_unit", ObjNull]
];

if (_unit isEqualTo ObjNull) exitWith {false};

private _cooldown = _unit getVariable ["hatg_mirror_cooldown", false];

private _unitInVehicle = !(isNull objectParent _unit);

private _units = [_unit, "CROUCH"] call HATG_fnc_getNearbyUnits;
private _closeUnits = _units#1;

[format["Cooldown? %1, Close Units %2, In Vehicle? %3", _cooldown, _closeUnits, _unitInVehicle], 3, _fnc_scriptName] call HATG_fnc_log;

if (_cooldown) exitWith {false};
if (_unitInVehicle) then {false};
if (count (_closeUnits) != 0) exitWith {false};

true
/*
    Author:
        Silence
    
    Description:
        Checks if a mirror can be created
    
    Params:
        _unit <OBJECT> <Default: ObjNull>
    
    Dependencies:
        _unit Namespace variables:
        > "hatg_mirror_cooldown"
    
    Usage:
        [player] call HATG_fnc_canCreateMirror;
    
    Return:
        true, false <BOOL>
*/

params [
    ["_unit", ObjNull],
    ["_stance", "PRONE"]
];

if (_unit isEqualTo ObjNull) exitWith {false};

private _mirror = [_unit] call HATG_fnc_getMirror;

private _cooldown = _unit getVariable ["hatg_mirror_cooldown", false];

private _surfaceIsGrass = [_unit] call HATG_fnc_surfaceIsGrass;

private _unitInVehicle = !(isNull objectParent _unit);

private _movementSpeed = speed _unit;

private _isOnRoad = isOnRoad _unit;

private _isOnFloor = [_unit] call HATG_fnc_isOnFloor;

private _unitsClose = [_unit, _stance] call HATG_fnc_getNearbyUnits;

[format["Cooldown? %1, Is Grass? %2, Is On Road? %3, Close Units? %4, In Vehicle? %5 Is On Floor? %6 Stance? %7", _cooldown, _surfaceIsGrass, _isOnRoad, _unitsClose, _unitInVehicle, _isOnFloor, _stance], 3, _fnc_scriptName] call HATG_fnc_log;

if (_cooldown) exitWith {false};
if !(_surfaceIsGrass) exitWith {false};
if (_unitInVehicle) exitWith {false};
if (_isOnRoad) exitWith {false};
if !(_isOnFloor) exitWith {false};
if (_unitsClose) exitWith {false};
if ((_movementSpeed > hatg_setting_movement_crouch) && {_stance isEqualTo "CROUCH"}) exitWith {false};

true
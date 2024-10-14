/*
    Author:
        Silence
    
    Description:
        Checks if a mirror can be created, also takes stance into account
    
    Params:
        _unit <OBJECT> <Default: ObjNull>
        _stance <STRING> <Default: "PRONE">
    
    Dependencies:
        _unit Namespace variables:
        > "hatg_mirror_cooldown"
    
    Scope:
        Local
    
    Environment:
        Unscheduled

    Usage:
        [player] call HATG_fnc_canCreateMirror;
    
    Return:
        true, false <BOOL>
*/

params [
    ["_unit", ObjNull],
    ["_stance", "PRONE"]
];

private _unitInVehicle = !(isNull objectParent _unit);
private _isOnRoad = isOnRoad _unit;
private _movementSpeed = speed _unit;

if (HATG_Client_Side) exitwith {
    if (_unit isEqualTo ObjNull) exitWith {false};
    if (_unitInVehicle) exitWith {false};
    if (_isOnRoad) exitWith {false};
    if (_stance isEqualTo "CROUCH" && {_movementSpeed > 15}) exitWith {false};

    true
};

if (_unit isEqualTo ObjNull) exitWith {false};

if (_unitInVehicle) exitWith {["In Vehicle Check Failed", 3, _fnc_scriptName] call HATG_fnc_log; false};

private _cooldown = _unit getVariable ["hatg_mirror_cooldown", false];
if (_cooldown) exitWith {["Cooldown Check Failed", 3, _fnc_scriptName] call HATG_fnc_log; false};

if (_stance isEqualTo "CROUCH" && {_movementSpeed > hatg_setting_movement_crouch}) exitWith {["Movement Speed Check Failed", 3, _fnc_scriptName] call HATG_fnc_log; false};
if (_stance isEqualTo "STAND" && {[_unit] call HATG_fnc_isInBuilding isEqualTo false}) exitWith {["Stand Building Check Failed", 3, _fnc_scriptName] call HATG_fnc_log; false};

private _surfaceIsGrass = [_unit] call HATG_fnc_surfaceIsGrass;
if !(_surfaceIsGrass) exitWith {["Surface Check Failed", 3, _fnc_scriptName] call HATG_fnc_log; false};

private _isOnFloor = [_unit] call HATG_fnc_isOnFloor;
if !(_isOnFloor) exitWith {["On Floor Check Failed", 3, _fnc_scriptName] call HATG_fnc_log; false};

if (_isOnRoad) exitWith {["On Road Check Failed", 3, _fnc_scriptName] call HATG_fnc_log; false};

private _unitsClose = [_unit, _stance] call HATG_fnc_getNearbyUnits;
if (_unitsClose) exitWith {["Close Units Check Failed", 3, _fnc_scriptName] call HATG_fnc_log; false};

true
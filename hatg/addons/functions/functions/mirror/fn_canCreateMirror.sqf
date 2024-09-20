params [
    ["_unit", ObjNull]
];

if (_unit isEqualTo ObjNull) exitWith {false};

private _mirror = [_unit] call HATG_fnc_getMirror;

private _cooldown = _unit getVariable ["hatg_mirror_cooldown", false];

private _surfaceIsGrass = [_unit] call HATG_fnc_surfaceIsGrass;

private _unitInVehicle = !(isNull objectParent _unit);

private _isOnRoad = isOnRoad _unit;

private _units = [_unit] call HATG_fnc_getNearbyUnits;
private _closeUnits = _units#1;

[format["Mirror already exists? %1, Cooldown? %2, Is Grass? %3, Is On Road? %4, Close Units %5, In Vehicle? %6", _mirror, _cooldown, _surfaceIsGrass, _isOnRoad, _closeUnits, _unitInVehicle], 3, _fnc_scriptName] call HATG_fnc_log;

if (_cooldown) exitWith {false};
if !(_surfaceIsGrass) exitWith {false};
if (_unitInVehicle) then {false};
if (_isOnRoad) exitWith {false};
if (count (_closeUnits) != 0) exitWith {false};

true
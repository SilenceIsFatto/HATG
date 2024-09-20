params [
    ["_unit", ObjNull]
];

if (_unit isEqualTo ObjNull) exitWith {false};

private _mirror = [_unit] call HATG_fnc_getMirror;
if (_mirror isNotEqualTo ObjNull) exitWith {false};

private _cooldown = _unit getVariable ["hatg_mirror_cooldown", false];
private _cooldownActual = !_cooldown; // need to invert this, if cooldown is active we actually want to return false instead of true

[format["Mirror already exists? %1, Cooldown? %2", _mirror, _cooldownActual], 1, _fnc_scriptName] call HATG_fnc_log;

_cooldownActual;
params ["_unit"];

private _grassDetected = false;

private _pos = getPosATL _unit;
_pos set [2, true];

private _surface = toLowerANSI (surfaceType _pos);
private _surfaceTexture = toLowerANSI (surfaceTexture _pos);

if ("grass" in _surface || {"grass" in _surfaceTexture}) then {_grassDetected = true};

[_surface, 2, _fnc_scriptName] call HATG_fnc_log;
[_surfaceTexture, 2, _fnc_scriptName] call HATG_fnc_log;

_grassDetected;
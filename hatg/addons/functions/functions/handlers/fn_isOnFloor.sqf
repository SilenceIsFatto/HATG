params ["_unit"];

private _allowedHeight = ["hatg_setting_distance_height", 2] call HATG_fnc_getVariable;

if (_allowedHeight isEqualTo -1) exitWith {true};

private _unitPosHeight = (getPosATL _unit) select 2;

if (_unitPosHeight >= _allowedHeight) exitWith {false};

true;
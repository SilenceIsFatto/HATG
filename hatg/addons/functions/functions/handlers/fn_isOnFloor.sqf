params ["_unit"];

private _unitPosHeight = (getPosATL _unit) select 2;

if (_unitPosHeight >= 2) exitWith {false};

true;
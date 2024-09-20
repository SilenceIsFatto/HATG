params ["_unit"];

#define DISTANCE_NEARBY 100

private _unitSide = side _unit;

private _distanceClose = ["hatg_setting_distance_close", -1] call HATG_fnc_getVariable;

private _nearbyUnits = allUnits select {_x != _unit && {[_unitSide, side _x] call BIS_fnc_sideIsEnemy} && {_x distance _unit <= DISTANCE_NEARBY}};
private _closeUnits = _nearbyUnits select {_x distance _unit <= _distanceClose};

[_nearbyUnits, _closeUnits];
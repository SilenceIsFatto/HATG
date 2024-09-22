/*
    Author:
        Silence
    
    Description:
        Gets nearby non-friendly units
    
    Params:
        _unit <OBJECT>
    
    Dependencies:
        missionNamespace variables:
        > "hatg_setting_distance_close" <INT>
    
    Usage:
        [player] call HATG_fnc_getNearbyUnits;
    
    Return:
        [_nearbyUnits, _closeUnits] < ARRAY <ARRAY OF UNITS, ARRAY OF UNITS> >
*/

params ["_unit"];

#define DISTANCE_NEARBY 100

private _unitSide = side _unit;

private _distanceClose = ["hatg_setting_distance_close", -1] call HATG_fnc_getVariable;

if (call HATG_fnc_isNight) then {
    _distanceClose = _distanceClose / 2; // If it is night time then the detection distance should be lower
};

// Fun fact, swapping BIS_fnc_sideIsEnemy to getFriend made the execution time go from about 1.8776ms with 119 AI to 0.5239ms. Fun :D
private _nearbyUnits = allUnits select {_x != _unit && {_unitSide getFriend side _x <= 0.5} && {_x distance _unit <= DISTANCE_NEARBY}};
private _closeUnits = _nearbyUnits select {_x distance _unit <= _distanceClose};

[_nearbyUnits, _closeUnits];
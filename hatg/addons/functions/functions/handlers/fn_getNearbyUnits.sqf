/*
    Author:
        Silence
    
    Description:
        Gets nearby non-friendly units
    
    Params:
        _unit <OBJECT>
        _stance <STRING>
    
    Dependencies:
        missionNamespace variables:
        > "hatg_setting_distance_close" <INT>
    
    Usage:
        [player] call HATG_fnc_getNearbyUnits;
    
    Return:
        [_nearbyUnits, _closeUnits] < ARRAY <ARRAY OF UNITS, ARRAY OF UNITS> >
*/

params ["_unit", ["_stance", "PRONE"]];

private _unitSide = side _unit;

private _distanceNearby = 100;
private _distanceClose = ["hatg_setting_distance_close", -1] call HATG_fnc_getVariable;
private _distanceCloseMultiplier = ["hatg_setting_distance_close_multiplier", -1] call HATG_fnc_getVariable;

if (_stance == "CROUCH") then {
    _distanceClose = _distanceClose * _distanceCloseMultiplier;
};

if (call HATG_fnc_isNight) then {
    _distanceClose = _distanceClose / 2; // If it is night time then the detection distance should be lower
};

if ([_unit] call HATG_fnc_hasGhillie) then {
    _distanceClose = _distanceClose / 2; // If _unit has a ghillie the detection distance should also be lower
};

// Fun fact, swapping BIS_fnc_sideIsEnemy to getFriend made the execution time go from about 1.8776ms with 119 AI to 0.5239ms. Fun :D
private _nearbyUnits = allUnits select {_x != _unit && {_unitSide getFriend side _x <= 0.5} && {_x distance _unit <= _distanceNearby}};
private _closeUnits = if (_nearbyUnits findIf {_x distance _unit <= _distanceClose} != -1 && {_x getVariable ["ACE_isUnconscious", false] isEqualTo false}) then {true} else {false};


[_nearbyUnits, _closeUnits];
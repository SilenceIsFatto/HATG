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
        _closeUnits <ARRAY>
*/

params ["_unit", ["_stance", "PRONE"]];

private _unitSide = side _unit;

private _distanceNearby = 100;
private _distanceClose = ["hatg_setting_distance_close", -1] call HATG_fnc_getVariable;
private _distanceCloseMultiplier = ["hatg_setting_distance_close_multiplier", -1] call HATG_fnc_getVariable;

// Can't think of a better way to do these if statements, there will be a more efficient way. Brain doesn't brain rn
if (_stance == "CROUCH") then {
    _distanceClose = _distanceClose * _distanceCloseMultiplier;
};

if (call HATG_fnc_isNight) then {
    _distanceClose = _distanceClose / 2;
};

if (call HATG_fnc_isRaining) then {
    _distanceClose = _distanceClose / 2;
};

if (call HATG_fnc_isFoggy) then {
    _distanceClose = _distanceClose / 2;
};

if ([_unit] call HATG_fnc_isInBuilding) then {
    _distanceClose = _distanceClose / 2;
};

if ([_unit] call HATG_fnc_hasGhillie) then {
    _distanceClose = _distanceClose / 2;
};

// Fun fact, swapping BIS_fnc_sideIsEnemy to getFriend made the execution time go from about 1.8776ms with 119 AI to 0.5239ms. Fun :D
private _nearbyUnits = allUnits select {_x != _unit && {_unitSide getFriend side _x <= 0.5} && {_x distance _unit <= _distanceNearby}};
private _closeUnits = if (_nearbyUnits findIf {_x distance _unit <= _distanceClose && {_x getVariable ["ACE_isUnconscious", false] isEqualTo false}} != -1) then {true} else {false};

if (isNil "_closeUnits") then {_closeUnits = false};

[format["Detection Distance: %1, Close Units? %2", _distanceClose, _closeUnits], 4, _fnc_scriptName] call HATG_fnc_log;

_closeUnits;
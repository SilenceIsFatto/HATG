/*
    Author:
        Silence
    
    Description:
        Checks if an enemy unit is near _unit, reduces distance dynamically based on multiple factors
    
    Params:
        _unit <OBJECT>
        _stance <STRING>
    
    Dependencies:
        global variables:
        > hatg_setting_distance_close <INT>
        > hatg_setting_distance_close_multiplier <INT>
    
    Usage:
        [player] call HATG_fnc_getNearbyUnits;
    
    Return:
        true, false <BOOL>
*/

params ["_unit", ["_stance", "PRONE"]];

private _distanceClose = hatg_setting_distance_close;
private _distanceCloseMultiplier = hatg_setting_distance_close_multiplier;

// Can't think of a better way to do these if statements, there will be a more efficient way. Brain doesn't brain rn
if (hatg_setting_simple) then {
    _distanceClose = 10;
};

if (_stance == "CROUCH") then {
    _distanceClose = _distanceClose * _distanceCloseMultiplier;
};

if (_stance == "STAND") then {
    _distanceClose = _distanceClose * (_distanceCloseMultiplier * 2);
};

// Can't exactly merge these into 1 statement since the effects are meant to stack
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

if ([_unit] call HATG_fnc_hasGhillie) then { // ghillie should ideally have no benefit if standing
    _distanceClose = _distanceClose / 2;
};

_distanceClose = _distanceClose max 5;

private _nearbyUnit = _unit findNearestEnemy _unit;

if (isNil "_nearbyUnit" || {_nearbyUnit isEqualTo ObjNull}) exitWith {false};
if (_nearbyUnit distance2D _unit >= _distanceClose) exitWith {false};
if (_nearbyUnit getVariable ["ACE_isUnconscious", false] isEqualTo true) exitWith {false};

[format["Detection Distance: %1, Close Unit? %2", _distanceClose, _nearbyUnit], 4, _fnc_scriptName] call HATG_fnc_log;

true;

/*
The below is an example on why overcomplicating is dumb. The below takes around 0.8ms on average to run with 120 AI. The above takes around 0.0250ms at most...

private _nearbyUnits = allUnits select {_x != _unit && {_unitSide getFriend side _x <= 0.5} && {_x distance _unit <= _distanceNearby}};
private _closeUnits = if (_nearbyUnits findIf {_x distance _unit <= _distanceClose && {_x getVariable ["ACE_isUnconscious", false] isEqualTo false}} != -1) then {true} else {false};

if (isNil "_closeUnits") then {_closeUnits = false};
*/
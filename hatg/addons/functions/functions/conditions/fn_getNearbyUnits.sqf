/*
    Author:
        Silence
    
    Description:
        Checks if an enemy unit is near _unit
    
    Params:
        _unit <OBJECT>
        _stance <STRING>
    
    Dependencies:
        N/A
    
    Usage:
        [player] call HATG_fnc_getNearbyUnits;
    
    Return:
        true, false <BOOL>
*/

params ["_unit", ["_stance", "PRONE"]];

private _distanceClose = [_unit, _stance] call HATG_fnc_getDetectionDistance;

[format["Detection Distance: %1", _distanceClose], 3, _fnc_scriptName] call HATG_fnc_log;

if (hatg_setting_complex_detection) exitWith {
    private _unitSide = side _unit;
    private _targets = nearestObjects [_unit, ["CAManBase"], _distanceClose];
    _targets deleteAt (_targets find _unit);
    private _isEnemyClose = if (_targets findIf {_unitSide getFriend side _x <= 0.5 && {_x getVariable ["ACE_isUnconscious", false] isEqualTo false}} isNotEqualTo -1) then {true} else {false};

    [format["Close Unit (Complex)? %1", _isEnemyClose], 4, _fnc_scriptName] call HATG_fnc_log;

    _isEnemyClose;
};

private _nearbyUnit = _unit findNearestEnemy _unit;
if (isNil "_nearbyUnit" || {_nearbyUnit isEqualTo ObjNull}) exitWith {false};
if (_nearbyUnit distance2D _unit >= _distanceClose) exitWith {false};
if (_nearbyUnit getVariable ["ACE_isUnconscious", false] isEqualTo true) exitWith {false};

[format["Close Unit? %1", _nearbyUnit], 4, _fnc_scriptName] call HATG_fnc_log;

true;

/*
The below is an example on why overcomplicating is dumb. The below takes around 0.8ms on average to run with 120 AI. The above takes around 0.0250ms at most...

private _nearbyUnits = allUnits select {_x != _unit && {_unitSide getFriend side _x <= 0.5} && {_x distance _unit <= _distanceNearby}};
private _closeUnits = if (_nearbyUnits findIf {_x distance _unit <= _distanceClose && {_x getVariable ["ACE_isUnconscious", false] isEqualTo false}} != -1) then {true} else {false};

if (isNil "_closeUnits") then {_closeUnits = false};
*/
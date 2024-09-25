params ["_unit", "_unitShots"];

private _allowedShots = ["hatg_setting_distance_shots", -1] call HATG_fnc_getVariable;

private _hasGhillie = [_unit] call HATG_fnc_hasGhillie;
private _hasSuppressor = [_unit] call HATG_fnc_hasSuppressor;
private _isNight = call HATG_fnc_isNight;

private _allowedShotsRange = round (random [_allowedShots-2, _allowedShots, _allowedShots+2]);

if (_hasGhillie) then {
    _allowedShotsRange = _allowedShotsRange + round(random 3);
};

if (_hasSuppressor) then {
    _allowedShotsRange = _allowedShotsRange + round(random (_allowedShots * 2));
};

if (_isNight) then {
    _allowedShotsRange = _allowedShotsRange + round(random 3);
};

[format["Has Ghillie? %1, Has Suppressor? %2, Is Night? %3, Allowed Shots: %4", _hasGhillie, _hasSuppressor, _isNight, _allowedShotsRange], 4, _fnc_scriptName] call HATG_fnc_log;

if (_allowedShots isEqualTo -1) exitWith {true};
if (_unitShots >= _allowedShotsRange) exitWith {false};
if (_hasSuppressor) exitWith {true};
if (_isNight) exitWith {true};

false;
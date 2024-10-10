/*
    Author:
        Silence
    
    Description:
        Checks if _unit can stay hidden after firing, handles creating/resetting the allowed shots variable attached to _unit
    
    Params:
        _unit <OBJECT>
        _unitShots <INT>
    
    Dependencies:
        hatg_setting_distance_shots <INT>
    
    Scope:
        Local
    
    Environment:
        Unscheduled
    
    Usage:
        [player] call HATG_fnc_canStayHidden;
    
    Return:
        true, false <BOOL>
*/

params ["_unit", "_unitShots"];

private _allowedShots = hatg_setting_distance_shots;

private _hasGhillie = [_unit] call HATG_fnc_hasGhillie;
private _hasSuppressor = [_unit] call HATG_fnc_hasSuppressor;

private _allowedShotsRange = ["hatg_mirror_allowedShots", -1, _unit] call HATG_fnc_getVariable;

if (_allowedShotsRange isEqualTo -1) then {
    _allowedShotsRange = round (random [_allowedShots, _allowedShots+2, _allowedShots+4]);

    if (_hasGhillie) then {
        _allowedShotsRange = _allowedShotsRange + round(random [_allowedShots, _allowedShots+2, _allowedShots+4]);
    };

    if (_hasSuppressor) then {
        _allowedShotsRange = _allowedShotsRange + round(_allowedShots*2);
    } else {
        _allowedShotsRange = round (_allowedShotsRange / 2);
    };

    ["hatg_mirror_allowedShots", _allowedShotsRange, _unit] call HATG_fnc_setVariable;
};

[format["Has Ghillie? %1, Has Suppressor? %2, Is Night? %3, Allowed Shots: %4, Current Shots: %5", _hasGhillie, _hasSuppressor, _isNight, _allowedShotsRange, _unitShots], 4, _fnc_scriptName] call HATG_fnc_log;

if (currentWeapon _unit isEqualTo secondaryWeapon _unit) exitWith {false}; // if _unit is not using a launcher
if (_allowedShots isEqualTo -1 || {hatg_setting_simple}) exitWith {true};
if (_unitShots < _allowedShotsRange) exitWith {true};

false;
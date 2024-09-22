/*
    Author:
        Silence
    
    Description:
        The associated code with "handleFired"
    
    Params:
        _unit <OBJECT>
    
    Dependencies:
        missionNamespace variables:
        > "hatg_setting_cooldown" <INT>
    
    Usage:
        [player] call HATG_fnc_onFired;
    
    Return:
        N/A
*/

params ["_unit"];
    
private _cooldown = ["hatg_setting_cooldown", -1] call HATG_fnc_getVariable;
private _resetDistance = ["hatg_setting_distance_reset", -1] call HATG_fnc_getVariable;
private _allowedShots = ["hatg_setting_distance_shots", -1] call HATG_fnc_getVariable;
private _allowedShotsRange = round (random [_allowedShots-2, _allowedShots, _allowedShots+2]); // Default setting

// Get the unit "information", shots and position
private _unitInformation = ["hatg_mirror_unitInformation", [], _unit] call HATG_fnc_getVariable;
private _unitShots = 0;
private _unitPos = getPosATL _unit;

if (_unitInformation isNotEqualTo []) then {
    _unitShots = _unitInformation#0;
    _unitPos = _unitInformation#1;
};

private _hasGhillie = [_unit] call HATG_fnc_hasGhillie;
private _hasSuppressor = [_unit] call HATG_fnc_hasSuppressor;

private _canStayHidden = if (_hasGhillie && {_hasSuppressor} && {_unitShots isEqualTo -1 || {_unitShots <= _allowedShotsRange}}) then {true} else {false};
private _isHidden = [_unit] call HATG_fnc_getMirror isNotEqualTo ObjNull;

[format["Is Hidden? %1, Can Stay Hidden? %2, Has Ghillie? %3, Has Suppressor? %4", _isHidden, _canStayHidden, _hasGhillie, _hasSuppressor], 4, _fnc_scriptName] call HATG_fnc_log;

if (_unit distance2D _unitPos >= _resetDistance || {_resetDistance isEqualTo -1}) then {
    private _unitPosUpdated = getPosATL _unit;
    
    ["hatg_mirror_unitInformation", [0, _unitPosUpdated], _unit] call HATG_fnc_setVariable;
    
    [format["Resetting shot count for %1 and updating their position information.", name _unit], 4, _fnc_scriptName] call HATG_fnc_log;
} else {
    private _unitShotsUpdated = _unitShots + 1;
    
    ["hatg_mirror_unitInformation", [_unitShotsUpdated, _unitPos], _unit] call HATG_fnc_setVariable;

    [format["Adding 1 to shot count for %1.", name _unit], 4, _fnc_scriptName] call HATG_fnc_log;
};

if (_canStayHidden) exitWith {}; // If they should remain hidden (has a ghillie and suppressor), then don't do a cooldown
// If you fire more than X-Y shots in the same pos, "hidden" status will be revoked regardless of ghillie/suppressor (setting dependent)

if !(_isHidden) exitWith {
    [format ["%1 fired whilst not hidden.", name _unit, (round(_cooldown / 10))], 1, _fnc_scriptName] call HATG_fnc_log;
    [_unit, (round(_cooldown / 10))] call HATG_fnc_cooldown; // if they shoot whilst not prone, give them 3 seconds to wait instead of 30. (default, 30. Divided by 10 = 3)
};

[format ["%1 fired whilst hidden.", name _unit, _cooldown], 1, _fnc_scriptName] call HATG_fnc_log;
[_unit] call HATG_fnc_deleteMirror;
[_unit, _cooldown] call HATG_fnc_cooldown;
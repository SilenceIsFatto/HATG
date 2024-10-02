/*
    Author:
        Silence
    
    Description:
        The associated code with "handleFired"
    
    Params:
        _unit <OBJECT>
    
    Dependencies:
        global variables:
        > "hatg_setting_cooldown" <INT>
        > "hatg_setting_distance_reset" <INT>
        > "hatg_setting_distance_shots" <INT>

        _unit Namespace variables:
        > "hatg_mirror_unitInformation" [ARRAY <INT, ARRAY>]
    
    Usage:
        [player] call HATG_fnc_onFired;
    
    Return:
        N/A
*/

params ["_unit"];
    
private _cooldown = hatg_setting_cooldown;
private _resetDistance = hatg_setting_distance_reset;

// Get the unit "information", shots and position
private _unitInformation = ["hatg_mirror_unitInformation", [], _unit] call HATG_fnc_getVariable;
private _unitShots = 0;
private _unitPos = getPosATL _unit;

if (_unitInformation isNotEqualTo []) then {
    _unitShots = _unitInformation#0;
    _unitPos = _unitInformation#1;
};

if (_unit distance2D _unitPos >= _resetDistance || {_resetDistance isEqualTo -1}) then {
    private _unitPosUpdated = getPosATL _unit;
    
    ["hatg_mirror_unitInformation", [0, _unitPosUpdated], _unit] call HATG_fnc_setVariable;

    ["hatg_mirror_allowedShots", -1, _unit] call HATG_fnc_setVariable;
    
    [format["Resetting shot count for %1 and updating their position information.", name _unit], 4, _fnc_scriptName] call HATG_fnc_log;
} else {
    private _unitShotsUpdated = _unitShots + 1;
    
    ["hatg_mirror_unitInformation", [_unitShotsUpdated, _unitPos], _unit] call HATG_fnc_setVariable;

    [format["Adding 1 to shot count for %1.", name _unit], 4, _fnc_scriptName] call HATG_fnc_log;
};

private _canStayHidden = [_unit, _unitShots] call HATG_fnc_canStayHidden;
if (_canStayHidden) exitWith {}; // If they should remain hidden then don't do a cooldown

private _isHidden = [_unit] call HATG_fnc_getMirror isNotEqualTo ObjNull;
if !(_isHidden) exitWith {
    [format ["%1 fired whilst not hidden.", name _unit, (round(_cooldown / 10))], 1, _fnc_scriptName] call HATG_fnc_log;
    [_unit, (round(_cooldown / 10))] call HATG_fnc_cooldown; // if they shoot whilst not prone, give them 3 seconds to wait instead of 30. (default, 30. Divided by 10 = 3)
};

[format ["%1 fired whilst hidden.", name _unit, _cooldown], 1, _fnc_scriptName] call HATG_fnc_log;
[_unit] call HATG_fnc_deleteMirror;
[_unit, _cooldown] call HATG_fnc_cooldown;
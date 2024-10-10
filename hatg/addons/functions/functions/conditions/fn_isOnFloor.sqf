/*
    Author:
        Silence
    
    Description:
        Checks if _unit is on the "floor", achieved by checking the second ATL index. If _unit is not on the floor, it then checks if _unit is in a building instead.
    
    Params:
        _unit <OBJECT>
    
    Dependencies:
        hatg_setting_distance_height <INT>
    
    Scope:
        Local
    
    Environment:
        Unscheduled
    
    Usage:
        [player] call HATG_fnc_isOnFloor;
    
    Return:
        true, false <BOOL>
*/

params ["_unit"];

private _allowedHeight = hatg_setting_distance_height;

if (_allowedHeight isEqualTo -1) exitWith {true};

private _unitPosHeight = (getPosATL _unit) select 2;

if (_unitPosHeight >= _allowedHeight) exitWith {
    private _isInBuilding = [_unit] call HATG_fnc_isInBuilding;

    if (_isInBuilding) exitWith {true};

    false
};

true;
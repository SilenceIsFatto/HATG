/*
    Author:
        Silence
    
    Description:
        Checks if _unit is in a building via line intersect
    
    Params:
        _unit <OBJECT>
    
    Dependencies:
        N/A
    
    Usage:
        [player] call HATG_fnc_isInBuilding;
    
    Return:
        _isBuilding <BOOL>
*/

params ["_unit"];

private _lineHeight = 25;

private _eyePos = eyePos _unit;
private _eyePosHeight = _eyePos#2;

private _endPosHeight = _eyePosHeight + _lineHeight;
private _endPos = [_eyePos#0, _eyePos#1, _endPosHeight];

private _intersectObjects = lineIntersectsWith [_eyePos, _endPos, _unit, objNull, true];

private _isBuilding = if (_intersectObjects findIf {_x isKindOf "Building"} != -1) then {true} else {false};

if (isNil "_isBuilding") then {_isBuilding = false};

_isBuilding;
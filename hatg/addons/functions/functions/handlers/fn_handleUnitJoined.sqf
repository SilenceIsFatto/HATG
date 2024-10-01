/*
    Author:
        Silence
    
    Description:
        Adds a "UnitJoined" event handler to _group. Handles AI boxes
    
    Params:
        _group <GROUP>
    
    Dependencies:
        N/A
    
    Usage:
        [group player] call HATG_fnc_handleUnitJoined;
    
    Return:
        _ehUnitJoined <INT>
*/

params ["_group"];

if (_group isEqualTo GrpNull) exitWith {};

private _ehUnitJoined = _group addEventHandler ["UnitJoined", {
	params ["_group", "_newUnit"];

    diag_log _group;
    diag_log _newUnit;

    if !(isPlayer _newUnit) then {
        [_newUnit] call HATG_fnc_addHandlers;
    };
}];

_ehUnitJoined;
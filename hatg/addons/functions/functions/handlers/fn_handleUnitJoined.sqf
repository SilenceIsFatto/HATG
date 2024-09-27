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

private _ehUnitJoined = _group addEventHandler ["UnitJoined", {
	params ["_group", "_newUnit"];

    [_newUnit] call HATG_fnc_addHandlers;
}];

_ehUnitJoined;
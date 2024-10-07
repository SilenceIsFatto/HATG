/*
    Author:
        Silence
    
    Description:
        Adds a "HandleDisconnect" mission event handler.
    
    Params:
        N/A
    
    Dependencies:
        N/A
    
    Usage:
        call HATG_fnc_handleDisconnect;
    
    Return:
        _ehHandleDisconnect <INT>
*/

private _ehHandleDisconnect = addMissionEventHandler ["HandleDisconnect", {
	params ["_unit", "_id", "_uid", "_name"];
    
    if !(isMultiplayer) exitWith {};

    [_unit] call HATG_fnc_deleteMirror;

    false;
}];

_ehGroupCreated;
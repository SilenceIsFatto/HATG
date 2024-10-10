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
    
    if (!isMultiplayer) exitWith {};

    private _mirror = [_unit] call HATG_fnc_getMirror;

    if (_mirror isNotEqualTo ObjNull) then {
        deleteVehicle _mirror;
    };

    false;
}];

_ehGroupCreated;
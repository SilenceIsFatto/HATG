/*
    Author:
        Silence
    
    Description:
        Adds a "GroupCreated" mission event handler.
    
    Params:
        N/A
    
    Dependencies:
        N/A
    
    Usage:
        call HATG_fnc_handleGroupCreated;
    
    Return:
        _ehGroupCreated <INT>
*/

private _ehGroupCreated = addMissionEventHandler ["GroupCreated", {
	params ["_group"];

    private _leader = leader _group;

    if ((hatg_setting_mp_ai || {!isMultiplayer}) && {isPlayer _leader}) then {
        [_group] call HATG_fnc_handleUnitJoined;
    };
}];

_ehGroupCreated;
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
        call HATG_fnc_handleGroup;
    
    Return:
        _ehGroupCreated <INT>
*/

private _ehGroupCreated = addMissionEventHandler ["GroupCreated", {
	params ["_group"];

    private _leader = leader _group;

    if (!(isMultiplayer) && {isPlayer _leader}) then {
        (units _group) apply {[_x] call HATG_fnc_addHandlers};

        [_group] call HATG_fnc_handleUnitJoined;
    };
}];

_ehGroupCreated;
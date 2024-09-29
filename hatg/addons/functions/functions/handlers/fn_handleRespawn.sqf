/*
    Author:
        Silence
    
    Description:
        Adds a "respawn" event handler to _unit, handles stale loop deletion and loop restarting
    
    Params:
        _unit <OBJECT>
    
    Dependencies:
        N/A
    
    Usage:
        [player] call HATG_fnc_handleRespawn;
    
    Return:
        _ehRespawn <INT>
*/

params ["_unit"];

private _ehRespawn = _unit addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];

    ["hatg_mirror_disable", true, _corpse] call HATG_fnc_setVariable;
    [_corpse] call HATG_fnc_deleteMirror;
    [_unit, true] call HATG_fnc_addHandlers;

    _unit setVariable ["hatg_mirror_cooldown", false];
}];

_ehRespawn;
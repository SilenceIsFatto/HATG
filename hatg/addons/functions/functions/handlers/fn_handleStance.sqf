/*
    Author:
        Silence
    
    Description:
        Creates a while loop to handle stance changes which in turn will spawn/despawn "mirrors"
    
    Params:
        _unit <OBJECT>
    
    Dependencies:
        N/A
    
    Usage:
        [player] call HATG_fnc_handleStance;
    
    Return:
        N/A
*/

params ["_unit"];

// I couldn't find an event handler specifically for stances and I didn't want to use an event handler for general anim changes, so this is what it is

while {alive _unit || {!(isNil "_unit")}} do
{
    private _exit = [_unit] call HATG_fnc_onStance;

    if (_exit) exitWith {["Exiting Stance Loop", 1, _fnc_scriptName] call HATG_fnc_log};

    uiSleep 1;
};

[_unit] call HATG_fnc_deleteMirror;
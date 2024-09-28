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

while {alive _unit} do
{
    private _exit = [_unit] call HATG_fnc_onStance; // Runs at ~0.6ms with 119 AI right next to the player, however 119 AI is rarely a common scenario. Could still probably be better!

    if (_exit) exitWith {["Exiting Stance Loop", 1, _fnc_scriptName] call HATG_fnc_log; [_unit] call HATG_fnc_deleteMirror};

    uiSleep 1;
};
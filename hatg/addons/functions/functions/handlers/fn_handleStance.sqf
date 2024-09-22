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
    [_unit] call HATG_fnc_onStance;

    uiSleep 1;
};
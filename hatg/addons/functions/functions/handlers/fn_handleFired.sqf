/*
    Author:
        Silence
    
    Description:
        Adds a "fired" event handler to _unit, handles "mirror" deletion and such
    
    Params:
        _unit <OBJECT>
    
    Dependencies:
        N/A
    
    Usage:
        [player] call HATG_fnc_handleFired;
    
    Return:
        N/A
*/

params ["_unit"];

_unit addEventHandler ["Fired", {
	params ["_unit"];

    [_unit] call HATG_fnc_onFired;
}];
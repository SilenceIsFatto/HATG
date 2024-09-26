/*
    Author:
        Silence
    
    Description:
        Adds a "HandleDamage" event handler to _unit
    
    Params:
        _unit <OBJECT>
    
    Dependencies:
        N/A
    
    Usage:
        [player] call HATG_fnc_handleDamage;
    
    Return:
        _ehFired <INT>
*/

params ["_unit"];

private _ehDamage = _unit addEventHandler ["HandleDamage", {
	params ["_unit"];

    [_unit] call HATG_fnc_cooldown;
}];

_ehDamage;
/*
    Author:
        Silence
    
    Description:
        Adds a "firedNear" event handler to _unit, handles potential edge cases where players use other players mirrors to exploit
    
    Params:
        _unit <OBJECT>
    
    Dependencies:
        N/A
    
    Usage:
        [player] call HATG_fnc_handleFiredNear;
    
    Return:
        _ehFiredNear <INT>
*/

params ["_unit"];

private _ehFiredNear = _unit addEventHandler ["FiredNear", { 
    params ["_unit", "_firer", "_distance", "_weapon", "_muzzle", "_mode", "_ammo", "_gunner"]; 

    [_unit, _firer] call HATG_fnc_onFiredNear;
}];

_ehFiredNear;
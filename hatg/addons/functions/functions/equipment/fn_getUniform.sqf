/*
    Author:
        Silence
    
    Description:
        Gets the current uniform of _unit
    
    Params:
        _unit <OBJECT>
    
    Dependencies:
        N/A
    
    Usage:
        [player] call HATG_fnc_getUniform;
    
    Return:
        _unitUniform <STRING>
*/

params ["_unit"];

private _unitUniform = uniform _unit;

_unitUniform;
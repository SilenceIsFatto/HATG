/*
    Author:
        Silence
    
    Description:
        Checks if the surface under _unit is grass or not
    
    Params:
        _unit <OBJECT>
    
    Dependencies:
        N/A
    
    Usage:
        [player] call HATG_fnc_surfaceIsGrass;
    
    Return:
        _grassDetected <BOOL>
*/

params ["_unit"];

private _pos = getPosATL _unit;
_pos set [2, true];

private _surface = toLowerANSI (surfaceType _pos);
private _surfaceTexture = toLowerANSI (surfaceTexture _pos);

[_surface, 2, _fnc_scriptName] call HATG_fnc_log;
[_surfaceTexture, 2, _fnc_scriptName] call HATG_fnc_log;

if ("grass" in _surface || {"grass" in _surfaceTexture}) exitWith {true};

false;
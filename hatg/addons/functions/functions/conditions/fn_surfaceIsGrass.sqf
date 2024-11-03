/*
    Author:
        Silence
    
    Description:
        Checks if the surface under _unit is grass or not, handles the surface check setting being disabled
    
    Params:
        _unit <OBJECT>
    
    Dependencies:
        hatg_setting_surfaces <BOOL>
    
    Usage:
        [player] call HATG_fnc_surfaceIsGrass;
    
    Return:
        true, false <BOOL>
*/

params ["_unit"];

private _pos = getPosATL _unit;
_pos set [2, true];

private _surface = toLowerANSI (surfaceType _pos);
private _surfaceTexture = toLowerANSI (surfaceTexture _pos);

[_surface, 2, _fnc_scriptName] call HATG_fnc_log;
[_surfaceTexture, 2, _fnc_scriptName] call HATG_fnc_log;

private _surfacesNames = ["grass", "forest", "thorn", "field", "hlina", "trava","gbr_es_plevel1","gbr_es_tierra1","gbr_es_tierra2","gbr_es_tierra3","gbr_es_tierra10"];
private _surfacesNamesBlackList = ["gbr_es_tierra12"];

if !(hatg_setting_surfaces) exitWith {true};
if (hatg_setting_simple) exitWith {true};
if ([_unit] call HATG_fnc_isInBuilding) exitWith {true;};
if isOnRoad _unit exitWith {false};
if (nearestTerrainObjects [_unit, ["bush"], 3, false, true] isNotEqualTo []) exitWith {true};
if (_surfacesNames findIf {(_x in _surface || {_x in _surfaceTexture}) } isNotEqualTo -1) exitWith {
	if (_surfacesNamesBlackList findIf {(_x in _surface || {_x in _surfaceTexture}) } isNotEqualTo -1) then {true} else {true};
};

false;

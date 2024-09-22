/*
    Author:
        Silence
    
    Description:
        Checks if _unit(s) current weapon has a "suppressor",accounts for blacklisted/whitelisted suppressors.
    
    Params:
        _unit <OBJECT>
    
    Dependencies:
        N/A
    
    Usage:
        [player] call HATG_fnc_hasSuppressor;
    
    Return:
        _hasSuppressor <BOOL>
*/

params ["_unit"];

private _unitMuzzle = currentMuzzle _unit;
private _unitSuppressor = _unit weaponAccessories _unitMuzzle; // will probably falsely flag muzzles as suppressors in certain mods
private _hasSuppressor = _unitSuppressor param [0, ""] != "";

private _blacklistedSuppressors = ["hatg_equipment_suppressor_blacklist", []] call HATG_fnc_getVariable;
if (_unitSuppressor in _blacklistedSuppressors) exitWith {false};

_hasSuppressor;
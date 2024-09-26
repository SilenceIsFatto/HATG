/*
    Author:
        Silence
    
    Description:
        Checks if _unit(s) current weapon has a "suppressor", accounts for blacklisted/whitelisted suppressors.
    
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
private _unitSuppressor = _unit weaponAccessories _unitMuzzle param [0, ""]; // will probably falsely flag muzzles as suppressors in certain mods, so white/blacklisting is necessary
private _hasSuppressor = _unitSuppressor != "";

private _suppressors = call HATG_fnc_getSuppressors;
private _whitelistedSuppressors = _suppressors # 0;
private _blacklistedSuppressors = _suppressors # 1;
if (_unitSuppressor in _blacklistedSuppressors) exitWith {false};
if (_unitSuppressor in _whitelistedSuppressors) exitWith {true};

if (_hasSuppressor) exitWith {true};

false;
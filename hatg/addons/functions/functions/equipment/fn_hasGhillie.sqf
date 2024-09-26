/*
    Author:
        Silence
    
    Description:
        Checks if _unit(s) current uniform is a "ghillie", accounts for blacklisted/whitelisted ghillies.
    
    Params:
        _unit <OBJECT>
    
    Dependencies:
        N/A
    
    Usage:
        [player] call HATG_fnc_hasGhillie;
    
    Return:
        true, false <BOOL>
*/

params ["_unit"];

private _unitUniform = [_unit] call HATG_fnc_getUniform;

private _hasGhillie = false; // find a method to figure out if uniform is ghillie

private _ghillies = call HATG_fnc_getGhillies;
private _whitelistedGhillies = _ghillies # 0;
private _blacklistedGhillies = _ghillies # 1;
if (_unitUniform in _blacklistedGhillies) exitWith {false};
if (_unitUniform in _whitelistedGhillies) exitWith {true};

if (_hasGhillie) exitWith {true};

false;
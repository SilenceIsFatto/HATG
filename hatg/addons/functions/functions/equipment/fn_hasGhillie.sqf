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
        _hasGhillie <BOOL>
*/

params ["_unit"];

private _unitUniform = [_unit] call HATG_fnc_getUniform;

// TBD
private _hasGhillie = true;

private _blacklistedGhillies = ["hatg_equipment_ghillie_blacklist", []] call HATG_fnc_getVariable;
if (_unitUniform in _blacklistedGhillies) exitWith {false};

_hasGhillie;
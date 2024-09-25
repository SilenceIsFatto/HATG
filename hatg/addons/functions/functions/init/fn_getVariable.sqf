/*
    Author:
        Silence
    
    Description:
        Retrieves _varName from missionNamespace
    
    Params:
        _varName <STRING> <Default: "">
        _defaultValue <ANY> <Default: "">
        _namespace <ANY> <Default: missionNamespace>
    
    Dependencies:
        N/A
    
    Usage:
        [VARNAME, DEFAULTVALUE] call HATG_fnc_getVariable;
    
    Return:
        _variable <ANY>
*/

params [
    ["_varName", ""],
    ["_defaultValue", ""],
    ["_namespace", missionNamespace]
];

private _variable = _namespace getVariable [_varname, _defaultValue];

_variable;
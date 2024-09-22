/*
    Author:
        Silence
    
    Description:
        Sets _varName in missionNamespace to _value
    
    Params:
        _varName <STRING> <Default: "">
        _value <ANY> <Default: "">
    
    Dependencies:
        N/A
    
    Usage:
        [VARNAME, VALUE] call HATG_fnc_setVariable;
    
    Return:
        N/A
*/

params [
    ["_varName", ""],
    ["_value", ""],
    ["_namespace", missionNamespace]
];

_namespace setVariable [_varname, _value];
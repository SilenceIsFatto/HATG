/*
    Author:
        Silence
    
    Description:
        Sets _varName in missionNamespace to _value
    
    Params:
        _varName <STRING> <Default: "">
        _value <ANY> <Default: "">
        _namespace <ANY> <Default: missionNamespace>
        _global <BOOL> <Default: false>
    
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
    ["_namespace", missionNamespace],
    ["_global", false]
];

if (_namespace in [uiNamespace]) exitWith {
    _namespace setVariable [_varname, _value]; // some namespaces don't take the global argument
};

_namespace setVariable [_varname, _value, _global];
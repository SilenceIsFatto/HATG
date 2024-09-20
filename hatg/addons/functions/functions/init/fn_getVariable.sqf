params [
    ["_varName", ""],
    ["_defaultValue", ""]
];

private _variable = missionNamespace getVariable [_varname, _defaultValue];

_variable;
/*
    Author:
        Silence
    
    Description:
        Retrieves the _mirror object from the _unit namespace
    
    Params:
        _unit <OBJECT> <Default: ObjNull>
    
    Dependencies:
        N/A

    Scope:
        Local, Remote
    
    Environment:
        Unscheduled
    
    Usage:
        private _mirror = [player] call HATG_fnc_getMirror;
    
    Return:
        _mirror or ObjNull <OBJECT>
*/

params [
    ["_unit", ObjNull]
];

if (_unit isEqualTo ObjNull) exitWith {ObjNull};

private _mirror = _unit getVariable ["hatg_mirror", ObjNull];

_mirror;
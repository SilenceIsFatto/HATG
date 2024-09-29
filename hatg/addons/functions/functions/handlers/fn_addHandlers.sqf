/*
    Author:
        Silence
    
    Description:
        Adds handlers to _unit
    
    Params:
        _unit <OBJECT> <Default: ObjNull>
    
    Dependencies:
        N/A
    
    Usage:
        [player] call HATG_fnc_addHandlers;
    
    Return:
        N/A
*/

params [
    ["_unit", ObjNull],
    ["_respawn", false]
];

if (_unit isEqualTo ObjNull) exitWith {["Could not add event handlers, _unit was null", 1, _fnc_scriptName] call HATG_fnc_log};

[_unit] spawn HATG_fnc_handleStance;
[_unit] call HATG_fnc_handleFired;
[_unit] call HATG_fnc_handleDamage;

if (_respawn isEqualTo false) then {
    [_unit] call HATG_fnc_handleRespawn;
};

// Word of advice: Don't run addHandlers when these ifs return true the second time around... you may cause a recursion loop and freeze the game...
if (!isMultiplayer && {isPlayer _unit}) then {
    private _unitGroup = group _unit;

    {
        if (_x isEqualTo _unit) then {continue};
        [_x] call HATG_fnc_addHandlers;
    } forEach units _unitGroup;

    [_unitGroup] call HATG_fnc_handleUnitJoined;
};
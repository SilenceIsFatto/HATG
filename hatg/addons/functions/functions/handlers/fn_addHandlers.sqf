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

// Completely exits which we don't necessarily want
// if (["hatg_handlers_activated", false, _unit] call HATG_fnc_getVariable) exitWith {["Could not add event handlers, _unit already has handlers active", 1, _fnc_scriptName] call HATG_fnc_log};

if (_unit isEqualTo ObjNull) exitWith {["Could not add event handlers, _unit was null", 1, _fnc_scriptName] call HATG_fnc_log};

[_unit] spawn HATG_fnc_handleStance;
[_unit] call HATG_fnc_handleFired;
[_unit] call HATG_fnc_handleFiredNear;
[_unit] call HATG_fnc_handleDamage;

if (_respawn isEqualTo false) then {
    [_unit] call HATG_fnc_handleRespawn;
};

["hatg_handlers_activated", true, _unit] call HATG_fnc_setVariable;

// Word of advice: Don't run addHandlers when these ifs return true the second time around... you may cause a recursion loop and freeze the game...
if ((hatg_setting_mp_ai || {!isMultiplayer}) && {isPlayer _unit}) then {
    private _unitGroup = group _unit;

    {
        if (_x isEqualTo _unit) then {continue};
        [_x] call HATG_fnc_addHandlers;
    } forEach units _unitGroup;

    [_unitGroup] call HATG_fnc_handleUnitJoined;
};
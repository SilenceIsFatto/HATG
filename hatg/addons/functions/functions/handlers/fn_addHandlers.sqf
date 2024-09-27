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
    ["_unit", ObjNull]
];

if (_unit isEqualTo ObjNull) exitWith {["Could not add event handlers, _unit was null", 1, _fnc_scriptName] call HATG_fnc_log};

[_unit] spawn HATG_fnc_handleStance;
[_unit] call HATG_fnc_handleFired;
[_unit] call HATG_fnc_handleRespawn;
[_unit] call HATG_fnc_handleDamage;

// Not sure why but this causes a game freeze when an AI is added to your group, I might just be dumb
// if !(isMultiplayer && {isPlayer _unit}) then {
//     private _unitGroup = group _unit;
//     [_unitGroup] call HATG_fnc_handleUnitJoined;
// };
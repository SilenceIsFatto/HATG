params [
    ["_unit", ObjNull]
];

if (_unit isEqualTo ObjNull) exitWith {["Could not add event handlers, _unit was null", 1, _fnc_scriptName] call HATG_fnc_log};

[_unit] call HATG_fnc_handleStance;
[_unit] call HATG_fnc_handleFired;
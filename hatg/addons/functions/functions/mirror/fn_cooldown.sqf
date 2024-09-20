params [
    ["_unit", ObjNull],
    ["_cooldown", -1]
];

private _cooldownOn = _unit getVariable ["hatg_mirror_cooldown", false];
if (_cooldownOn) exitWith {}; // no need to re-set this variable and open a loop to re-set it once again if it already is on

_unit setVariable ["hatg_mirror_cooldown", true];
["Set cooldown to true", 1, _fnc_scriptName] call HATG_fnc_log;

if (_cooldown isEqualTo -1) then {
    _cooldown = ["hatg_setting_cooldown", -1] call HATG_fnc_getVariable;
};

[
    {
        private _unit = _this#0;

        _unit setVariable ["hatg_mirror_cooldown", false];

        ["Set cooldown to false", 1, _fnc_scriptName] call HATG_fnc_log;
    }, 
    [_unit], 
    _cooldown
] call CBA_fnc_waitAndExecute;
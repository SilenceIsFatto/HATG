private _enabled = ["hatg_mirror_toggle", false, player] call HATG_fnc_getVariable;

{
    ["hatg_mirror_toggle", (!_enabled), _x] call HATG_fnc_setVariable;
} forEach (units (group player));

[player] call HATG_fnc_handleDisplayText;
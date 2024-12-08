private _enabled = ["hatg_mirror_toggle", false, player] call HATG_fnc_getVariable;

["hatg_mirror_toggle", (!_enabled), player] call HATG_fnc_setVariable;

[player] call HATG_fnc_handleDisplayText;
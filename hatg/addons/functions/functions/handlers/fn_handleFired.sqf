params ["_unit"];

_unit addEventHandler ["Fired", {
	params ["_unit"];

    [format ["%1 fired whilst hidden", name _unit], 1, _fnc_scriptName] call HATG_fnc_log;

    [_unit] call HATG_fnc_deleteMirror;
    [_unit] call HATG_fnc_cooldown;
}];
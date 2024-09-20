params ["_unit"];

_unit addEventHandler ["Fired", {
	params ["_unit"];

    private _cooldown = ["hatg_setting_cooldown", -1] call HATG_fnc_getVariable;

    private _hasSuppressor = _unit weaponAccessories currentMuzzle _unit param [0, ""] != ""; // will probably falsely flag muzzles as suppressors in certain mods

    if ([_unit] call HATG_fnc_getMirror isNotEqualTo ObjNull) then {
        [format ["%1 fired whilst hidden, unhiding them with cooldown.", name _unit], 1, _fnc_scriptName] call HATG_fnc_log;
    
        if !(_hasSuppressor) then {
            [_unit] call HATG_fnc_deleteMirror;
            [_unit, _cooldown] call HATG_fnc_cooldown;
        };
    } else {
        [format ["%1 fired whilst not hidden, giving them a short cooldown.", name _unit], 1, _fnc_scriptName] call HATG_fnc_log;
        [_unit, (round(_cooldown / 10))] call HATG_fnc_cooldown; // if they shoot whilst not prone, give them 3 seconds to wait instead of 30. (default, 30 divided by 10 = 3)
    };
}];
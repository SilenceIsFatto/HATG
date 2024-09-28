#include "..\..\script_component.hpp"

#define SETTING_HEADER_EQUIPMENT [SETTING_HEADER, QUOTE(Equipment)]

private _defaultSuppressors = call HATG_fnc_defaultSuppressors;
private _defaultGhillies = call HATG_fnc_defaultGhillies;

private _defaultSuppressorsWhitelist = str(_defaultSuppressors#0);
private _defaultSuppressorsBlacklist = str(_defaultSuppressors#1);
private _defaultGhilliesWhitelist = str(_defaultGhillies#0);
private _defaultGhilliesBlacklist = str(_defaultGhillies#1);

[
    "hatg_setting_equipment_suppressor_whitelist",
    "EDITBOX",
    "$STR_HATG_Suppressors_whitelist",
    SETTING_HEADER_EQUIPMENT,
    _defaultSuppressorsWhitelist,
    true,
    {
        params ["_value"];

        missionNamespace setVariable ["hatg_setting_equipment_suppressor_whitelist", _value, true];
    }
] call CBA_fnc_addSetting;

[
    "hatg_setting_equipment_ghillie_whitelist",
    "EDITBOX",
    "$STR_HATG_Ghillies_whitelist",
    SETTING_HEADER_EQUIPMENT,
    _defaultGhilliesWhitelist,
    true,
    {
        params ["_value"];

        missionNamespace setVariable ["hatg_setting_equipment_ghillie_whitelist", _value, true];
    }
] call CBA_fnc_addSetting;

[
    "hatg_setting_equipment_suppressor_blacklist",
    "EDITBOX",
    "$STR_HATG_Suppressors_blacklist",
    SETTING_HEADER_EQUIPMENT,
    _defaultSuppressorsBlacklist,
    true,
    {
        params ["_value"];

        missionNamespace setVariable ["hatg_setting_equipment_suppressor_blacklist", _value, true];
    }
] call CBA_fnc_addSetting;

[
    "hatg_setting_equipment_ghillie_blacklist",
    "EDITBOX",
    "$STR_HATG_Ghillies_blacklist",
    SETTING_HEADER_EQUIPMENT,
    _defaultGhilliesBlacklist,
    true,
    {
        params ["_value"];

        missionNamespace setVariable ["hatg_setting_equipment_ghillie_blacklist", _value, true];
    }
] call CBA_fnc_addSetting;
#include "..\..\script_component.hpp"

#define SETTING_HEADER_EQUIPMENT [SETTING_HEADER, QUOTE(Equipment)]

private _defaultSuppressors = call HATG_fnc_defaultSuppressors;
private _defaultGhillies = call HATG_fnc_defaultGhillies;

private _defaultSuppressorsWhitelist = _defaultSuppressors#0 joinString ", ";
private _defaultSuppressorsBlacklist = _defaultSuppressors#1 joinString ", ";
private _defaultGhilliesWhitelist = _defaultGhillies#0 joinString ", ";
private _defaultGhilliesBlacklist = _defaultGhillies#1 joinString ", ";

[
    "hatg_setting_equipment_suppressor_whitelist",
    "EDITBOX",
    "Suppressors (Whitelist)",
    SETTING_HEADER_DEBUG,
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
    "Ghillies (Whitelist)",
    SETTING_HEADER_DEBUG,
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
    "Suppressors (Blacklist)",
    SETTING_HEADER_DEBUG,
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
    "Ghillies (Blacklist)",
    SETTING_HEADER_DEBUG,
    _defaultGhilliesBlacklist,
    true,
    {
        params ["_value"];

        missionNamespace setVariable ["hatg_setting_equipment_ghillie_blacklist", _value, true];
    }
] call CBA_fnc_addSetting;
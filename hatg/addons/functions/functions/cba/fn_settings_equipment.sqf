#include "..\..\script_component.hpp"

#define SETTING_HEADER_EQUIPMENT [SETTING_HEADER, QUOTE(Equipment)]

private _defaultSuppressors = call HATG_fnc_defaultSuppressors#1;
private _defaultGhillies = call HATG_fnc_defaultGhillies#1;

// [
//     "hatg_setting_equipment_suppressor_whitelist",
//     "EDITBOX",
//     "Suppressors (Whitelist)",
//     SETTING_HEADER_DEBUG,
//     "",
//     true,
//     {
//         params ["_value"];

//         missionNamespace setVariable ["hatg_setting_equipment_suppressor_whitelist", _value, true];
//     }
// ] call CBA_fnc_addSetting;

// [
//     "hatg_setting_equipment_ghillie_whitelist",
//     "EDITBOX",
//     "Ghillies (Whitelist)",
//     SETTING_HEADER_DEBUG,
//     "",
//     true,
//     {
//         params ["_value"];

//         missionNamespace setVariable ["hatg_setting_equipment_ghillie_whitelist", _value, true];
//     }
// ] call CBA_fnc_addSetting;

[
    "hatg_setting_equipment_suppressor_blacklist",
    "EDITBOX",
    "Suppressors (Blacklist)",
    SETTING_HEADER_DEBUG,
    _defaultSuppressors,
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
    _defaultGhillies,
    true,
    {
        params ["_value"];

        missionNamespace setVariable ["hatg_setting_equipment_ghillie_blacklist", _value, true];
    }
] call CBA_fnc_addSetting;
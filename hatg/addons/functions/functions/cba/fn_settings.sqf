#include "..\..\script_component.hpp"

#define SETTING_HEADER QUOTE(Hide Among The Grass)
#define SETTING_HEADER_DEBUG [SETTING_HEADER, QUOTE(Debug)]

#include "fn_settings_detection.sqf"
#include "fn_settings_equipment.sqf"

[
    "hatg_setting_debug", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Debug Mode", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    SETTING_HEADER_DEBUG, // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false,
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];

        missionNamespace setVariable ["hatg_setting_debug", _value, true];
    }
] call CBA_fnc_addSetting;

[
    "hatg_setting_debug_surface",
    "CHECKBOX",
    "Debug RPT (Surfaces)",
    SETTING_HEADER_DEBUG,
    false,
    true,
    {
        params ["_value"];

        missionNamespace setVariable ["hatg_setting_debug_surface", _value, true];
    }
] call CBA_fnc_addSetting;

[
    "hatg_setting_debug_conditions",
    "CHECKBOX",
    "Debug RPT (Conditions)",
    SETTING_HEADER_DEBUG,
    false,
    true,
    {
        params ["_value"];

        missionNamespace setVariable ["hatg_setting_debug_conditions", _value, true];
    }
] call CBA_fnc_addSetting;

[
    "hatg_setting_debug_detection",
    "CHECKBOX",
    "Debug RPT (Detection)",
    SETTING_HEADER_DEBUG,
    false,
    true,
    {
        params ["_value"];

        missionNamespace setVariable ["hatg_setting_debug_detection", _value, true];
    }
] call CBA_fnc_addSetting;
#include "..\..\script_component.hpp"

#define SETTING_HEADER Hide Among The Grass
#define SETTING_HEADER_QUOTE QUOTE(SETTING_HEADER)
#define SETTING_HEADER_DEBUG [SETTING_HEADER_QUOTE, QUOTE(Debug)]

#include "fn_settings_detection.sqf"
#include "fn_settings_equipment.sqf"
#include "fn_settings_ui.sqf"

[
    "hatg_setting_debug", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "$STR_HATG_Debug", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
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
    "$STR_HATG_Debug_RPT_Surfaces",
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
    "$STR_HATG_Debug_RPT_Conditions",
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
    "$STR_HATG_Debug_RPT_Detection",
    SETTING_HEADER_DEBUG,
    false,
    true,
    {
        params ["_value"];

        missionNamespace setVariable ["hatg_setting_debug_detection", _value, true];
    }
] call CBA_fnc_addSetting;
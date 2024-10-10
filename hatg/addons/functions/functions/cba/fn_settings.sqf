#include "..\..\script_component.hpp"

#define SETTING_HEADER Hide Among The Grass
#define SETTING_HEADER_QUOTE QUOTE(SETTING_HEADER)
#define SETTING_HEADER_GENERAL [SETTING_HEADER_QUOTE, QUOTE(General)]
#define SETTING_HEADER_DEBUG [SETTING_HEADER_QUOTE, QUOTE(Debug)]

#include "fn_settings_detection.sqf"
#include "fn_settings_equipment.sqf"
#include "fn_settings_ui.sqf"

[
    "hatg_setting_simple", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    ["$STR_HATG_Simple", "$STR_HATG_Simple_info"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    SETTING_HEADER_GENERAL, // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false,
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];

        // This is mostly intended for singleplayer, the mirror will always be active unless you do something to reveal it
        hatg_setting_simple = _value;

        publicVariable "hatg_setting_simple";
    }
] call CBA_fnc_addSetting;

[
    "hatg_setting_mp_ai", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    ["$STR_HATG_MP_AI", "$STR_HATG_MP_AI_info"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    SETTING_HEADER_GENERAL, // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false,
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];

        // This is mostly intended for singleplayer, the mirror will always be active unless you do something to reveal it
        hatg_setting_mp_ai = _value;

        publicVariable "hatg_setting_mp_ai";
    },
    true
] call CBA_fnc_addSetting;

[
    "hatg_setting_debug",
    "CHECKBOX",
    "$STR_HATG_Debug",
    SETTING_HEADER_DEBUG,
    false,
    true,
    {
        params ["_value"];

        // missionNamespace setVariable ["hatg_setting_debug", _value, true];
        hatg_setting_debug = _value;
        publicVariable "hatg_setting_debug";
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

        // missionNamespace setVariable ["hatg_setting_debug_surface", _value, true];
        hatg_setting_debug_surface = _value;
        publicVariable "hatg_setting_debug_surface";
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

        // missionNamespace setVariable ["hatg_setting_debug_conditions", _value, true];
        hatg_setting_debug_conditions = _value;
        publicVariable "hatg_setting_debug_conditions";
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

        // missionNamespace setVariable ["hatg_setting_debug_detection", _value, true];
        hatg_setting_debug_detection = _value;
        publicVariable "hatg_setting_debug_detection";
    }
] call CBA_fnc_addSetting;
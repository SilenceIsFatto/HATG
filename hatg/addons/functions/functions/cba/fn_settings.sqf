#include "..\..\script_component.hpp"

#define SETTING_HEADER QUOTE(Hide Among The Grass)

[
    "hatg_setting_debug", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Debug Mode", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    SETTING_HEADER, // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false,
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];

        missionNamespace setVariable ["hatg_setting_debug", _value, true];
    }
] call CBA_fnc_addSetting;

[
    "hatg_setting_debug_surface", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Debug RPT (Surfaces)", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    SETTING_HEADER, // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false,
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];

        missionNamespace setVariable ["hatg_setting_debug_surface", _value, true];
    }
] call CBA_fnc_addSetting;

[
    "hatg_setting_debug_conditions", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Debug RPT (Conditions)", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    SETTING_HEADER, // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false,
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];

        missionNamespace setVariable ["hatg_setting_debug_conditions", _value, true];
    }
] call CBA_fnc_addSetting;

[
    "hatg_setting_cooldown", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Detection Cooldown", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    SETTING_HEADER, // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 600, 30, 0],
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];

        missionNamespace setVariable ["hatg_setting_cooldown", round(_value), true];
    }
] call CBA_fnc_addSetting;

[
    "hatg_setting_distance_close", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Detection Distance (Close)", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    SETTING_HEADER, // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 50, 20, 0],
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];

        missionNamespace setVariable ["hatg_setting_distance_close", round(_value), true];
    }
] call CBA_fnc_addSetting;
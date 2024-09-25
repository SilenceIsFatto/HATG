#include "..\..\script_component.hpp"

#define SETTING_HEADER_DETECTION [SETTING_HEADER, QUOTE(Detection)]
#define SETTING_HEADER_DETECTION_STEALTH [SETTING_HEADER, QUOTE(Stealth)]

[
    "hatg_setting_surfaces",
    "CHECKBOX",
    ["Enable Surface Requirements", "This controls the surfaces you need to be on in order to be hidden. By default you need to be on 'grass' to stay hidden. If set to off, you will remain hidden regardless of the terrain you're on. (other factors still apply)"],
    SETTING_HEADER_DETECTION, 
    true,
    true,
    {
        params ["_value"];

        missionNamespace setVariable ["hatg_setting_surfaces", _value, true];
    }
] call CBA_fnc_addSetting;

[
    "hatg_setting_cooldown",
    "SLIDER",
    ["Detection Cooldown", "This controls how long you will be 'spotted' for if you fire without a suppressor. This is divided by 10 if you fire while not prone."],
    SETTING_HEADER_DETECTION, 
    [0, 600, 30, 0],
    true,
    {
        params ["_value"];

        missionNamespace setVariable ["hatg_setting_cooldown", round(_value), true];
    }
] call CBA_fnc_addSetting;

[
    "hatg_setting_distance_close",
    "SLIDER",
    ["Detection Distance", "This controls how close you can get to AI before they 'spot' you. At night this is halved to mimic low visibilty. It will be further halved if you wear a ghillie suit."],
    SETTING_HEADER_DETECTION,
    [0, 100, 40, 0],
    true,
    {
        params ["_value"];

        missionNamespace setVariable ["hatg_setting_distance_close", round(_value), true];
    }
] call CBA_fnc_addSetting;

[
    "hatg_setting_distance_close_multiplier",
    "SLIDER",
    ["Detection Distance Multiplier", "This controls the multiplier at which the different stances increase distance detection (above). For example, 40m becomes 80m when you are crouching instead of prone."],
    SETTING_HEADER_DETECTION,
    [1, 5, 2, 0],
    true,
    {
        params ["_value"];

        missionNamespace setVariable ["hatg_setting_distance_close_multiplier", _value, true];
    }
] call CBA_fnc_addSetting;

[
    "hatg_setting_distance_reset",
    "SLIDER",
    ["Reset Shot Counter Distance", "This controls the distance (m) you have to move to reset the shot counter whilst using a suppressor. -1 means you can shoot in the same spot indefinitely."],
    SETTING_HEADER_DETECTION_STEALTH,
    [-1, 30, 5, 0],
    true,
    {
        params ["_value"];

        missionNamespace setVariable ["hatg_setting_distance_reset", round(_value), true];
    }
] call CBA_fnc_addSetting;

[
    "hatg_setting_distance_shots",
    "SLIDER",
    ["Shots Before Detection", "This controls the general amount of shots you can fire in one spot before being revealed whilst using a suppressor. -1 means you can shoot indefinitely."],
    SETTING_HEADER_DETECTION_STEALTH,
    [-1, 60, 4, 0],
    true,
    {
        params ["_value"];

        missionNamespace setVariable ["hatg_setting_distance_shots", round(_value), true];
    }
] call CBA_fnc_addSetting;

[
    "hatg_setting_movement_crouch",
    "LIST",
    ["Crouching Movement Speed Before Detection", "This controls how fast you can move while crouching before getting detected."],
    SETTING_HEADER_DETECTION_STEALTH,
    [[0, 5, 12, 20], ["Always Detect Movement", "Sneaking", "Walking", "Never Detect Movement"], 1],
    true,
    {
        params ["_value"];

        missionNamespace setVariable ["hatg_setting_movement_crouch", _value, true];
    }
] call CBA_fnc_addSetting;
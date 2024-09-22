#include "..\..\script_component.hpp"

#define SETTING_HEADER_DETECTION [SETTING_HEADER, QUOTE(Detection)]
#define SETTING_HEADER_DETECTION_STEALTH [SETTING_HEADER, QUOTE(Stealth)]

[
    "hatg_setting_cooldown",
    "SLIDER",
    ["Detection Cooldown", "This controls how long you will be 'spotted' for if you fire without a ghillie suit and suppressor. This is divided by 10 if you fire while not prone."],
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
    ["Detection Distance", "This controls how close you can get to AI before they 'spot' you. At night this is halved to mimic low visibilty."],
    SETTING_HEADER_DETECTION,
    [0, 50, 20, 0],
    true,
    {
        params ["_value"];

        missionNamespace setVariable ["hatg_setting_distance_close", round(_value), true];
    }
] call CBA_fnc_addSetting;

[
    "hatg_setting_distance_reset",
    "SLIDER",
    ["Reset Shot Counter Distance", "This controls the distance (m) you have to move to reset the shot counter whilst using a ghillie suit and suppressor. -1 means you can shoot in the same spot indefinitely."],
    SETTING_HEADER_DETECTION_STEALTH,
    [-1, 50, 5, 0],
    true,
    {
        params ["_value"];

        missionNamespace setVariable ["hatg_setting_distance_reset", round(_value), true];
    }
] call CBA_fnc_addSetting;

[
    "hatg_setting_distance_shots",
    "SLIDER",
    ["Shots Before Detection", "This controls the general amount of shots you can fire before being revealed whilst using a ghillie suit and suppressor. -1 means you can shoot indefinitely."],
    SETTING_HEADER_DETECTION_STEALTH,
    [-1, 30, 4, 0],
    true,
    {
        params ["_value"];

        missionNamespace setVariable ["hatg_setting_distance_shots", round(_value), true];
    }
] call CBA_fnc_addSetting;
#include "..\..\script_component.hpp"

#define SETTING_HEADER_GENERAL [SETTING_HEADER, QUOTE(UI)]

[
    "hatg_setting_ui",
    "CHECKBOX",
    ["Enable UI", "This controls if the 'Hidden' message can be drawn to help you know when you are vulnerable."],
    SETTING_HEADER_GENERAL, 
    true,
    false,
    {
        params ["_value"];

        uiNamespace setVariable ["hatg_setting_ui", _value];
    }
] call CBA_fnc_addSetting;

[
    "hatg_setting_ui_x",
    "SLIDER",
    ["UI X Position", "This controls the UI X position, Left/Right."],
    SETTING_HEADER_GENERAL, 
    [-2, 2, 0, 2],
    2,
    {
        params ["_value"];

        uiNamespace setVariable ["hatg_setting_ui_x", _value];
        [_value, (uiNamespace getVariable ["hatg_setting_ui_y", 1.7])] call HATG_fnc_handleDisplayPosition;
    }
] call CBA_fnc_addSetting;

[
    "hatg_setting_ui_y",
    "SLIDER",
    ["UI Y Position", "This controls the UI Y position, Up/Down."],
    SETTING_HEADER_GENERAL, 
    [-2, 2, 0, 2],
    2,
    {
        params ["_value"];

        uiNamespace setVariable ["hatg_setting_ui_y", _value];
        [(uiNamespace getVariable ["hatg_setting_ui_x", 0.45]), _value] call HATG_fnc_handleDisplayPosition;
    }
] call CBA_fnc_addSetting;

[
    "hatg_setting_ui_textsize",
    "SLIDER",
    ["HUD Text Size", "This controls the size of the text on the hud."],
    SETTING_HEADER_GENERAL,
    [0, 6.5, 2, 1],
    2,
    {
        params["_value"];

        uiNamespace setVariable ["hatg_setting_ui_textsize", _value];
    }
] call CBA_fnc_addSetting;

[
    "hatg_setting_ui_colour_hidden",
    "COLOR",
    ["UI Colour (Hidden)", "This controls the UI colour when hidden."],
    SETTING_HEADER_GENERAL,
    [0, 1, 0, 1],
    2,
    {
        params ["_value"];

        uiNamespace setVariable ["hatg_setting_ui_colour_hidden", _value];
    }
] call CBA_fnc_addSetting;

[
    "hatg_setting_ui_colour_revealed",
    "COLOR",
    ["UI Colour (Revealed)", "This controls the UI colour when revealed."],
    SETTING_HEADER_GENERAL, 
    [1, 0, 0, 1],
    2,
    {
        params ["_value"];

        uiNamespace setVariable ["hatg_setting_ui_colour_revealed", _value];
    }
] call CBA_fnc_addSetting;
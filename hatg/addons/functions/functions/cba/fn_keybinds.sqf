#include "..\..\script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"

#define KEYBIND_HEADER Hide Among The Grass
#define KEYBIND_HEADER_QUOTE QUOTE(KEYBIND_HEADER)

[KEYBIND_HEADER_QUOTE, "hatg_keybind_refresh", ["$STR_HATG_Keybind_Refresh", "$STR_HATG_Keybind_Refresh_Info"], {
    [] call HATG_fnc_createDisplay;

    private _width = ["hatg_setting_ui_x", 0.45] call HATG_fnc_getVariable;
    private _height = ["hatg_setting_ui_y", 1.7] call HATG_fnc_getVariable;
    [_width, _height] call HATG_fnc_handleDisplayPosition;

    [player] call HATG_fnc_handleDisplayText;
}, {}, [DIK_COMMA, [false, false, false]]] call CBA_fnc_addKeybind;

[KEYBIND_HEADER_QUOTE, "hatg_keybind_toggle", ["$STR_HATG_Keybind_Toggle", "$STR_HATG_Keybind_Toggle_Info"], {
    private _enabled = ["hatg_mirror_toggle", false, player] call HATG_fnc_getVariable;

    ["hatg_mirror_toggle", (!_enabled), player] call HATG_fnc_setVariable;

    [player] call HATG_fnc_handleDisplayText;
}, {}, [DIK_SLASH, [false, false, false]]] call CBA_fnc_addKeybind;
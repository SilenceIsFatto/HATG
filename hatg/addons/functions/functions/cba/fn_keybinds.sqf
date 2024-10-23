#include "..\..\script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"

#define KEYBIND_HEADER Hide Among The Grass
#define KEYBIND_HEADER_QUOTE QUOTE(KEYBIND_HEADER)

[KEYBIND_HEADER_QUOTE, "hatg_keybind_refresh", ["Refresh UI", "This keybind will refresh the UI, can be used to re-load the UI after loading a save."], {
    [] call HATG_fnc_createDisplay;

    private _width = ["hatg_setting_ui_x", 0.45] call HATG_fnc_getVariable;
    private _height = ["hatg_setting_ui_y", 1.7] call HATG_fnc_getVariable;
    [_width, _height] call HATG_fnc_handleDisplayPosition;

    [player] call HATG_fnc_handleDisplayText;
}, {}, [DIK_COMMA, [false, false, false]]] call CBA_fnc_addKeybind;
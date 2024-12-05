[] call HATG_fnc_createDisplay;

private _width = ["hatg_setting_ui_x", 0.45] call HATG_fnc_getVariable;
private _height = ["hatg_setting_ui_y", 1.7] call HATG_fnc_getVariable;
[_width, _height] call HATG_fnc_handleDisplayPosition;

[player] call HATG_fnc_handleDisplayText;
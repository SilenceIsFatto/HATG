params [
    ["_displayX", (["hatg_setting_ui_x", 0, uiNamespace] call HATG_fnc_getVariable)],
    ["_displayY", (["hatg_setting_ui_y", 0, uiNamespace] call HATG_fnc_getVariable)],
    ["_width", (["hatg_setting_ui_width", 0.45, uiNamespace] call HATG_fnc_getVariable)],
    ["_height", (["hatg_setting_ui_height", 1.7, uiNamespace] call HATG_fnc_getVariable)]
];

private _display = call HATG_fnc_getDisplay;

if (_display isEqualTo []) exitWith {};

private _displayHidden = _display#1;

_displayX = _displayX + ( safeZoneX + ( safeZoneWAbs / 2 )) - ( _width / 2 );
_displayY = _displayY + ( safeZoneY + safeZoneH ) - _height;

_displayHidden ctrlSetPosition [_displayX, _displayY, _width, _height];
_displayHidden ctrlCommit 0;
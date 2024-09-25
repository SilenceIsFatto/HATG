params [
    ["_width", (["hatg_setting_ui_x", 0.45, uiNamespace] call HATG_fnc_getVariable)],
    ["_height", (["hatg_setting_ui_y", 1.7, uiNamespace] call HATG_fnc_getVariable)]
];

private _display = call HATG_fnc_getDisplay;

if (_display isEqualTo []) exitWith {};

private _displayHidden = _display#1;

private _displayX = ( safeZoneX + ( safeZoneWAbs / 2 )) - ( _width / 2 );
private _displayY = ( safeZoneY + safeZoneH ) - _height;

_displayHidden ctrlSetPosition [_displayX, _displayY, _width, _height];
_displayHidden ctrlCommit 0;
params ["_unit"];

private _display = call HATG_fnc_getDisplay;

if (_display isEqualTo []) exitWith {};

private _displayHidden = _display#1;

private _displayColourHidden = ["hatg_setting_ui_colour_hidden", [0, 1, 0, 1], uiNamespace] call HATG_fnc_getVariable;
private _displayColourRevealed = ["hatg_setting_ui_colour_revealed", [1, 0, 0, 1], uiNamespace] call HATG_fnc_getVariable;

if !(["hatg_setting_ui", false] call HATG_fnc_getVariable) exitWith {
    if (ctrlText _displayHidden isEqualTo "") exitWith {};
    
    private _hiddenText = "";
    _displayHidden ctrlSetStructuredText (parseText _hiddenText);
};

private _hidden = false;
private _colour = _displayColourRevealed;

if (["hatg_mirror", ObjNull, _unit] call HATG_fnc_getVariable isNotEqualTo ObjNull) then {
    _hidden = true;
    _colour = _displayColourHidden;
};

_colour = (_colour call BIS_fnc_colorRGBAtoHTML);

private _hiddenText = format ["<t font ='PuristaBold' align = 'center' size='2' color='#%1'> Hidden", _colour];
_displayHidden ctrlSetStructuredText (parseText _hiddenText);
_displayHidden ctrlCommit 0;
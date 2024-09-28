params ["_unit"];

private _display = call HATG_fnc_getDisplay;

if (_display isEqualTo []) exitWith {};

private _statusText = localize "$STR_HATG_Revealed";
private _displayHidden = _display#1;

private _textSize = hatg_setting_ui_textsize;
private _displayColourHidden = hatg_setting_ui_colour_hidden;
private _displayColourRevealed = hatg_setting_ui_colour_revealed;

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
    _statusText = localize "$STR_HATG_Hidden";
};

_colour = (_colour call BIS_fnc_colorRGBAtoHTML);

private _hiddenText = format ["<t font ='PuristaBold' align = 'center' size='%2' color='%1'>" + _statusText + "</t>", _colour, _textSize];
_displayHidden ctrlSetStructuredText (parseText _hiddenText);
_displayHidden ctrlSetFade 0;
_displayHidden ctrlCommit 0;

if (hatg_setting_ui_fade > 0) then {
    _displayHidden ctrlSetFade 1;
    _displayHidden ctrlCommit hatg_setting_ui_fade;
};
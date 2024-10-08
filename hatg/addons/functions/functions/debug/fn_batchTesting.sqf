/*
	Author:
		Silence
	
	Description:
		Does automated testing to ensure core HATG functionality remains as it should. Logs results to the rpt file.
	
	Params:
		_unit <OBJECT> <Default: ObjNull>
	
	Dependencies:
		hatg_setting_simple
		hatg_setting_surfaces
		hatg_setting_building
		hatg_setting_reveal_nearby
		hatg_setting_distance_close
		hatg_setting_distance_close_multiplier
		hatg_setting_distance_height

	Scope:
		Local

	Environment:
		Scheduled
	
	Usage:
		[player] spawn HATG_fnc_batchTesting;
	
	Return:
		_return <TYPE>
*/

params [["_unit", player]];

if (toLowerANSI(worldName) isNotEqualTo "stratis") exitWith {titleText ["This can only be tested on Stratis.", "PLAIN"]};

private _testPositions = [ // area description, area pos (ATL), expected result (prone), expected result (crouch), expected result (stand)
	["Grass", [1964.24,3513.99,0], true, true, false],
	["Sand", [1922.38,3511.17,0], false, false, false],
	["Dirt", [1950.26,3527.46,0], false, false, false],
	["Sand (With Bush)", [1979.89,4129.44,0], true, true, false],
	["Road", [1945.8,3581.37,0], false, false, false],
	["Cargo HQ (Exterior)", [1972.86,3505.64,3], false, false, false],
	["Cargo HQ (Interior)", [1972.86,3505.64,1], true, true, true]
];

private _testStances = [
	"PlayerProne",
	"PlayerCrouch",
	"PlayerStand"
];

hatg_setting_debug = true;

private _settingSimple = format["Setting - General - Simple: %1", hatg_setting_simple];
private _settingSurfaces = format["Setting - Detection - Surfaces: %1", hatg_setting_surfaces];
private _settingBuildings = format["Setting - Detection - Buildings: %1", hatg_setting_building];
private _settingRevealNearby = format["Setting - Detection - Reveal Nearby: %1", hatg_setting_reveal_nearby];
private _settingDistanceClose = format["Setting - Detection - Distance Close: %1", hatg_setting_distance_close];
private _settingDistanceCloseMultiplier = format["Setting - Detection - Distance Close Multiplier: %1", hatg_setting_distance_close_multiplier];
private _settingDistanceHeight = format["Setting - Detection - Distance Height: %1", hatg_setting_distance_height];

private _settings = [_settingSimple, _settingSurfaces, _settingBuildings, _settingRevealNearby, _settingDistanceClose, _settingDistanceCloseMultiplier, _settingDistanceHeight];
private _settingsJoined = _settings joinString "<br/>";
private _settingsMessage = format["<t color='#ff0000' size='2' align='center'>%1</t>", _settingsJoined];
titleText [_settingsMessage, "PLAIN", 0, true, true];

private _logMessages = ["", "", ""];
private _logSettings = _settings apply {_logMessages pushBack _x};

{
	private _stance = _x;
	private _stanceIndex = _forEachIndex;
	_unit playActionNow _stance;

	_logMessages pushBack format["Starting Batch Testing With Stance: %1", _stance];

	uiSleep 1;
	{
		uiSleep 0.5;
		private _area = _x#0;
		private _pos = _x#1;
		private _expectedResultOne = _x#2;
		private _expectedResultTwo = _x#3;
		private _expectedResultThree = _x#4;
		private _expectedResult = [_expectedResultOne, _expectedResultTwo, _expectedResultThree] select _stanceIndex;

		_unit setPosATL _pos;

		private _result = [_unit] call HATG_fnc_canCreateMirror;

		private _isResultExpected = if (_expectedResult isEqualTo _result) then {true} else {false};

		_logMessages pushBack format["Batch Testing (%1). Area: %2. Result: %3. Passed? %4", _stance, _area, _result, _isResultExpected];
	} forEach _testPositions;
} forEach _testStances;

{
	[_x, 1] call HATG_fnc_log;
} forEach _logMessages;
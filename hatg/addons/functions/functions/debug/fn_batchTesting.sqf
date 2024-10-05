params [["_unit", player]];

if (toLowerANSI(worldName) isNotEqualTo "stratis") exitWith {["This can only be tested on Stratis.", "PLAIN"]};

// RUN ON STRATIS ONLY, OTHERWISE RESULTS WILL NOT BE ACCURATE

private _testPositions = [
	["Grass", [1985.75,3563.35,0]], // grass
	["Sand", [1922.38,3511.17,0]], // sand
	["Dirt", [1950.26,3527.46,0]], // dirt
	["Sand (With Bush)", [1979.89,4129.44,0]], // sand (bush)
	["Road", [1945.8,3581.37,0]], // road
	["Cargo HQ (Exterior)", [1972.86,3505.64,3]], // cargo hq (roof)
	["Cargo HQ (Interior)", [1972.86,3505.64,1]] // cargo hq (interior)
];

private _testStances = [
	"PlayerProne",
	"PlayerCrouch",
	"PlayerStand"
];

hatg_setting_debug = true;

private _settingSurfaces = format["Setting - Detection - Surfaces: %1", hatg_setting_surfaces];
private _settingBuildings = format["Setting - Detection - Buildings: %1", hatg_setting_building];
private _settingRevealNearby = format["Setting - Detection - Reveal Nearby: %1", hatg_setting_reveal_nearby];
private _settingDistanceClose = format["Setting - Detection - Distance Close: %1", hatg_setting_distance_close];
private _settingDistanceCloseMultiplier = format["Setting - Detection - Distance Close Multiplier: %1", hatg_setting_distance_close_multiplier];
private _settingDistanceHeight = format["Setting - Detection - Distance Height: %1", hatg_setting_distance_height];

private _settings = [_settingSurfaces, _settingBuildings, _settingRevealNearby, _settingDistanceClose, _settingDistanceCloseMultiplier, _settingDistanceHeight] joinString "<br/>";
private _settingsMessage = format["<t color='#ff0000' size='2' align='center'>%1</t>", _settings];
titleText [_settingsMessage, "PLAIN", 0, true, true];

uiSleep 15;

{
	private _stance = _x;
	player playActionNow _stance;
	titleText [_stance, "PLAIN"];
	uiSleep 1;
	{
		private _area = _x#0;
		private _pos = _x#1;
		player setPosATL _pos;

		titleText [_area, "PLAIN"];

		uiSleep 3;
	} forEach _testPositions;
} forEach _testStances;
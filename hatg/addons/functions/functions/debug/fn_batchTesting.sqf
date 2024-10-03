params [["_unit", player]];

// RUN ON STRATIS ONLY, OTHERWISE RESULTS WILL NOT BE ACCURATE

private _testPositions = [
	[1985.75,3563.35,0], // grass
	[1922.38,3511.17,0], // sand
	[1950.26,3527.46,0], // dirt
	[1979.89,4129.44,0], // sand (bush)
	[1945.8,3581.37,0], // road
	[1972.86,3505.64,3], // cargo hq (roof)
	[1972.86,3505.64,1] // cargo hq (interior)
];

private _testStances = [
	"PlayerProne",
	"PlayerCrouch",
	"PlayerStand"
];

hatg_setting_debug = true;

{
	private _stance = _x;
	player playActionNow _stance;
	{
		private _pos = _x;
		player setPosATL _pos;
		
		uiSleep 3;
	} forEach _testPositions;
	uiSleep 1;
} forEach _testStances;
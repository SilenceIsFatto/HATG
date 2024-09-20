params ["_unit"];

// I couldn't find an event handler specifically for stances and I didn't want to use an event handler for general anim changes, so this is what it is

while {alive _unit} do 
{    
    if !(alive _unit) exitWith {nil}; // unit is dead

	private _stance = stance _unit;

    // private _surfaceIsGrass = [_unit] call HATG_fnc_surfaceIsGrass;
    private _canCreateMirror = [_unit] call HATG_fnc_canCreateMirror; // I'm not too happy about calling this every second, will have to check code performance

    [_canCreateMirror, 3, _fnc_scriptName] call HATG_fnc_log;
	
    if (_stance == "PRONE" && {_canCreateMirror}) then
    {
        [_unit] call HATG_fnc_createMirror;
    } else {
        [_unit] call HATG_fnc_deleteMirror;
    };

    uiSleep 1;
};
params ["_unit"];

// I couldn't find an event handler specifically for stances and I didn't want to use an event handler for general anim changes, so this is what it is

while {alive _unit} do 
{
    private _skip = false;
    
    if !(alive _unit) exitWith {nil}; // unit is dead
    if !(isNull objectParent _unit) then {_skip = true}; // unit is in a vehicle

	private _stance = stance _unit;
	
    if (_skip isEqualTo false) then 
    {
        if (_stance == "PRONE") then 
        {
            [_unit] call HATG_fnc_createMirror;
        } else {
            [_unit] call HATG_fnc_deleteMirror;
        };
    };

    uiSleep 1;
};
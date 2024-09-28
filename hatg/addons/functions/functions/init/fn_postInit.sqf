if !(hasInterface) exitWith {false}; // Do not run postInit on dedicated servers or headless clients

private _serverActivated = ["hatg_serverActivated", false] call HATG_fnc_getVariable;
if !(_serverActivated) exitWith {titleText ["HATG is not a client mod and needs to be ran on the server too. HATG features will not work until the server loads the mod.", "PLAIN"]};

[player] call HATG_fnc_addHandlers;

[_unit] call HATG_fnc_createDisplay;

if !(isMultiplayer) then {
    call HATG_fnc_handleGroupCreated;
};
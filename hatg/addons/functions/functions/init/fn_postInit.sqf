if !(hasInterface) exitWith {false}; // Do not run postInit on dedicated servers or headless clients

HATG_Client_Side = false;
private _serverActivated = ["hatg_serverActivated", false] call HATG_fnc_getVariable;
if !(_serverActivated) exitWith {
    titleText ["HATG is not loaded on the server.\nSwitching to client sided version", "PLAIN"];
    diag_log format["HATG_Log: %1 : (%2) has joined you server using Hide Among The Grass", name player, getplayerUID player];
    HATG_Client_Side = true;
};
HATG_Client_Side = true;
if (isClass (configFile >> "CfgPatches" >> "HIG_wall")) exitWith {titleText ["HATG should not be running alongside ACSTG, please disable it. HATG will now be disabled to prevent conflicts.", "PLAIN"]};

// Should probably localize the above error messages

[player] call HATG_fnc_addHandlers;

call HATG_fnc_createDisplay;
[player] call HATG_fnc_handleDisplayText;

if (hatg_setting_mp_ai || {!isMultiplayer}) then {
    call HATG_fnc_handleGroupCreated;
};
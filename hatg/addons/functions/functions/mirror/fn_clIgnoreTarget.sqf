/*
    Author:
        MaxxLite
    
    Description:
        Makes a enemies ignore player if he has hidden status, also takes stance into account
        This fnc is for if a server doesnt have this mod but the player wants to use it on client side.
    
    Params:
        _unit <OBJECT> <Default: ObjNull>
        _status <BOOL> <Default: "false">
        _ignorTarget <BOOL> <Default: "false">

    Scope:
        Local
    
    Environment:
        Unscheduled

    Usage:
        [player] call HATG_fnc_clIgnoreTarget;
    
    Return:
        nil
    
    Note:
        this func is currently not efficient and will lead to issues
        also noticed that it runs when you are in the main menu
        func also always stays in a loop. got to find something for that.
*/

params [
	["_unit", ObjNull],
    ["_status", false],
    ["_ignorTarget", false]
];

hatg_ignorTarget = _ignorTarget;

private _unitSide = side _unit;

private _closeUnits = nearestObjects [_unit, ["CAManBase"], 200];
_closeUnits deleteAt (_closeUnits find _unit);
private _areUnitsClose = if (_closeUnits findIf {_unitSide getFriend side _x <= 0.5 && {_x getVariable ["ACE_isUnconscious", false] isEqualTo false}} isNotEqualTo -1) then {true} else {false};


private _targets = nearestObjects [_unit, ["CAManBase"], 30];
_targets deleteAt (_targets find _unit);
private _isEnemyClose = if (_targets findIf {_unitSide getFriend side _x <= 0.5 && {_x getVariable ["ACE_isUnconscious", false] isEqualTo false}} isNotEqualTo -1) then {true} else {false};
// if this returns true it should revoke undercover

private _closeEnemyGroups = [];

{
    private _group = group _x;
    _closeEnemyGroups pushBack _group;

    if ((_status) && !(_isEnemyClose)) then {
        _group ignoreTarget [_unit, true];
        systemChat "Hidden Status: true"; // debugging
    } else {
        _group ignoreTarget [_unit, false];
        systemChat "Hidden Status: false"; // debugging
    };
} forEach _closeUnits;

_unit call HATG_fnc_canCreateMirror;

if (isPlayer _unit) then {
    [_unit] call HATG_fnc_handleDisplayText;
};

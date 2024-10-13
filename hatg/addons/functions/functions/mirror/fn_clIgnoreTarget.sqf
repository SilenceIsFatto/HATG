/*
    Author:
        MaxxLite
    
    Description:
        Makes a enemies ignore player if he has hidden status, also takes stance into account
        This fnc is for if a server doesnt have this mod but the player wants to use it on client side.
    
    Params:
        _unit <OBJECT> <Default: ObjNull>
        _stance <STRING> <Default: "PRONE">
    
    Dependencies:
        _unit Namespace variables:
        > "hatg_mirror_cooldown"
    
    Scope:
        Local
    
    Environment:
        Unscheduled

    Usage:
        [player] call HATG_fnc_clIgnoreTarget;
    
    Return:
        nil
*/

params [
	["_unit", ObjNull],
	["_stance", "PRONE"]
];

private _closeEnemies = nearestObjects [_unit, ["CAManBase"], hatg_setting_distance_close];
private _closeEnemyGroups = [];

{
  private _group = group _x;
  _closeEnemyGroups pushBack _group;
  if ([_unit, _stance] call HATG_fnc_canCreateMirror) then {
	  _group ignoreTarget [_unit, true];
	  systemChat "you are hidden"; // debugging
	  } else {
	  _group ignoreTarget [_unit, false];
	  systemChat "you are overt"; // debugging
	  };
} forEach _closeEnemies;

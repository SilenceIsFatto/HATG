/*
    Author:
        Silence
    
    Description:
        Checks if it is "night"
    
    Params:
        N/A
    
    Dependencies:
        N/A
    
    Usage:
        private _isNight = call HATG_fnc_isNight;
    
    Return:
        true, false <BOOL>
*/

private _timeState = sunOrMoon;

if (_timeState <= 0.8) exitWith {
    true;
};

false;
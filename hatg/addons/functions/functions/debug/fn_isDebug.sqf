/*
    Author:
        Silence
    
    Description:
        Returns the CBA setting missionNamespace "hatg_setting_debug"
    
    Params:
        N/A
    
    Dependencies:
        missionNamespace variables:
        > "hatg_setting_debug" <BOOL>
    
    Usage:
        call HATG_fnc_isDebug;
    
    Return:
        _isDebug <BOOL>
*/

private _isDebug = ["hatg_setting_debug", false] call HATG_fnc_getVariable;

_isDebug;
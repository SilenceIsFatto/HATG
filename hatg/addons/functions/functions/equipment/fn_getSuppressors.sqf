private _suppressorsWhitelist = ["hatg_setting_equipment_suppressor_whitelist", []] call HATG_fnc_getVariable;
private _suppressorsBlacklist = ["hatg_setting_equipment_suppressor_blacklist", []] call HATG_fnc_getVariable;

try {
    _suppressorsWhitelist = parseSimpleArray _suppressorsWhitelist;
    _suppressorsBlacklist = parseSimpleArray _suppressorsBlacklist;

    if (isNil "_suppressorsWhitelist" || {isNil "_suppressorsBlacklist"}) throw "Invalid Array Structure for HATG suppressor whitelist/blacklist. Please fix immediately!";
} catch {
    titleText [_exception, "PLAIN"];
    _suppressorsWhitelist = [];
    _suppressorsBlacklist = [];
}; // honestly don't know if this works, either way it gives me a way to throw an error message

[_suppressorsWhitelist, _suppressorsBlacklist];
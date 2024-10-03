private _suppressorsWhitelist = hatg_setting_equipment_suppressor_whitelist;
private _suppressorsBlacklist = hatg_setting_equipment_suppressor_blacklist;
private _suppressorsIntegral = hatg_setting_equipment_suppressor_integral;

try {
    _suppressorsWhitelist = parseSimpleArray _suppressorsWhitelist;
    _suppressorsBlacklist = parseSimpleArray _suppressorsBlacklist;
    _suppressorsIntegral = parseSimpleArray _suppressorsIntegral;

    if (isNil "_suppressorsWhitelist" || {isNil "_suppressorsBlacklist"} || {isNil "_suppressorsIntegral"}) throw "Invalid Array Structure for HATG suppressor whitelist/blacklist/integral. Please fix immediately!";
} catch {
    titleText [_exception, "PLAIN"];
    _suppressorsWhitelist = [];
    _suppressorsBlacklist = [];
    _suppressorsIntegral = [];
}; // honestly don't know if this works, either way it gives me a way to throw an error message

[_suppressorsWhitelist, _suppressorsBlacklist, _suppressorsIntegral];
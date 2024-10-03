private _ghilliesWhitelist = hatg_setting_equipment_ghillie_whitelist;
private _ghilliesBlacklist = hatg_setting_equipment_ghillie_blacklist;

try {
    _ghilliesWhitelist = parseSimpleArray _ghilliesWhitelist;
    _ghilliesBlacklist = parseSimpleArray _ghilliesBlacklist;

    if (isNil "_ghilliesWhitelist" || {isNil "_ghilliesBlacklist"}) throw "Invalid Array Structure for HATG ghillie whitelist/blacklist. Please fix immediately!";
} catch {
    titleText [_exception, "PLAIN"];
    _ghilliesWhitelist = [];
    _ghilliesBlacklist = [];
}; // honestly don't know if this works, either way it gives me a way to throw an error message

[_ghilliesWhitelist, _ghilliesBlacklist];
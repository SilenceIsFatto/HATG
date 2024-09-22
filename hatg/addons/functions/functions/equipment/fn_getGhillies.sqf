private _ghillies = ["hatg_setting_equipment_ghillie_blacklist", []] call HATG_fnc_getVariable;

try {
    _ghillies = parseSimpleArray _ghillies;

    if (isNil "_ghillies") throw "Invalid Array Structure for HATG ghillie blacklist. Please fix immediately!";
} catch {
    titleText [_exception, "PLAIN"];
    _ghillies = [];
};

_ghillies;
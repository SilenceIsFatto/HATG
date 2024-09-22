private _suppressors = ["hatg_setting_equipment_suppressor_blacklist", []] call HATG_fnc_getVariable;

try {
    _suppressors = parseSimpleArray _suppressors;

    if (isNil "_suppressors") throw "Invalid Array Structure for HATG suppressor blacklist. Please fix immediately!";
} catch {
    titleText [_exception, "PLAIN"];
    _suppressors = [];
};

_suppressors;
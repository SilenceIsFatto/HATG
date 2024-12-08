class CfgUserActions
{
	class MOD(action_refresh)
	{// This class name is used for internal representation and also for the inputAction command.
		displayName = "$STR_HATG_Keybind_Refresh";
		tooltip = "$STR_HATG_Keybind_Refresh_Info";
		onActivate = "call HATG_fnc_refreshUI";		// _this is always true.
		onDeactivate = "";		// _this is always false.
		onAnalog = "";	// _this is the scalar analog value.
		analogChangeThreshold = 0.1; // Minimum change required to trigger the onAnalog EH (default: 0.01).
	};
	class MOD(action_toggle)
	{// This class name is used for internal representation and also for the inputAction command.
		displayName = "$STR_HATG_Keybind_Toggle";
		tooltip = "$STR_HATG_Keybind_Toggle_Info";
		onActivate = "call HATG_fnc_toggleUI";		// _this is always true.
		onDeactivate = "";		// _this is always false.
		onAnalog = "";	// _this is the scalar analog value.
		analogChangeThreshold = 0.1; // Minimum change required to trigger the onAnalog EH (default: 0.01).
	};
};

class UserActionGroups
{
	class MOD(actions)
	{
		name = "Hide Among The Grass"; // Display name of your category.
		isAddon = 1;
		group[] =
		{
			MOD(action_refresh),
			MOD(action_toggle)
		};
	};
};
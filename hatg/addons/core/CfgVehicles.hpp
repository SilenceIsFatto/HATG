	class HouseBase;

	class hatg_mirror: HouseBase
	{
		model = QPATHTOFOLDER(data\hatg_mirror);
		displayName = "AI Mirror";
		accuracy = 0;
		armor = 100;
		destrType = "DestructNo";
		damageResistance = 0.05;
		scope = 2;
		scopeCurator = 1;
        sbsource = None;
        mapSize = 8;
	};

	class hatg_mirror_debug: hatg_mirror
	{
		model = QPATHTOFOLDER(data\hatg_mirror_debug);
		displayName = "AI Mirror (Debug)";
	};
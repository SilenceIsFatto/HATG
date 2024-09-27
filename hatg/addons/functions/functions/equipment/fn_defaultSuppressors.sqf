private _suppressorsWhitelist = [];

private _suppressorsBlacklist = [
    // Ace muzzles
    "ACE_muzzle_mzls_B",
    "ACE_muzzle_mzls_L",
    "ACE_muzzle_mzls_H",
    "ACE_muzzle_mzls_93mmg",
    "ACE_muzzle_mzls_338",
    "ACE_muzzle_mzls_smg_01",
    "ACE_muzzle_mzls_smg_02",
    // Vanilla muzzles
    "muzzle_antenna_01_f",
    "muzzle_antenna_02_f",
    "muzzle_antenna_03_f",
    // CUP muzzles
    "CUP_muzzle_mfsup_Flashhider_545x39_Black",
    "CUP_muzzle_mfsup_Flashhider_545x39_OD",
    "CUP_muzzle_mfsup_Flashhider_545x39_Tan",
    "CUP_muzzle_mfsup_Flashhider_556x45_Black",
    "CUP_muzzle_mfsup_Flashhider_556x45_OD",
    "CUP_muzzle_mfsup_Flashhider_556x45_Tan",
    "CUP_muzzle_mfsup_SCAR_L",
    "CUP_muzzle_mfsup_SCAR_H",
    "CUP_muzzle_mfsup_Flashhider_762x39_Black",
    "CUP_muzzle_mfsup_Flashhider_762x39_OD",
    "CUP_muzzle_mfsup_Flashhider_762x39_Tan",
    "CUP_muzzle_mfsup_Flashhider_762x51_Black",
    "CUP_muzzle_mfsup_Flashhider_762x51_OD",
    "CUP_muzzle_mfsup_Flashhider_762x51_Tan",
    "CUP_muzzle_mfsup_CSA",
    "CUP_muzzle_mfsup_CSA_desert",
    "CUP_muzzle_mfsup_CSA_woodland",
    "CUP_muzzle_mfsup_flashhider_Sa58",
    "CUP_muzzle_mfsup_Zendl",
    "CUP_muzzle_mfsup_Zendl_desert",
    "CUP_muzzle_mfsup_Zendl_woodland",
    "CUP_acc_bfa",
    "CUP_acc_sffh",
    "CUP_muzzle_mfsup_Flashhider_PK_Black",
    "CUP_muzzle_mfsup_Flashhider_PK_OD",
    "CUP_muzzle_mfsup_Flashhider_PK_Tan"
]; // probably need a case for integrally suppressed guns

private _suppressorsIntegral = [
    // Vanilla
    "srifle_DMR_02_F",
    "srifle_DMR_02_camo_F",
    "srifle_DMR_02_sniper_F",
    "srifle_DMR_04_F",
    "srifle_DMR_04_Tan_F",
    // CUP
    "CUP_arifle_AS_VAL",
    "CUP_arifle_AS_VAL_flash",
    "CUP_arifle_AS_VAL_VFG",
    "CUP_arifle_AS_VAL_top_rail",
    "CUP_arifle_AS_VAL_flash_top",
    "CUP_arifle_AS_VAL_VFG_top_rail",
    "CUP_srifle_VSSVintorez",
    "CUP_srifle_VSSVintorez_flash",
    "CUP_srifle_VSSVintorez_VFG",
    "CUP_srifle_VSSVintorez_top_rail",
    "CUP_srifle_VSSVintorez_flash_top",
    "CUP_srifle_VSSVintorez_VFG_top_rail",
    "CUP_smg_MP5SD6",
    "CUP_arifle_OTS14_GROZA_762_Grip",
    "CUP_arifle_OTS14_GROZA_Grip"
]; // probably need a case for integrally suppressed guns

[_suppressorsWhitelist, _suppressorsBlacklist, _suppressorsIntegral];
class CfgFunctions
{
    class MOD_CONSTANT
    {
        class cba 
        {
            file = QPATHTOFOLDER(functions\cba);
            class settings {};
        };
        class debug 
        {
            file = QPATHTOFOLDER(functions\debug);
            class isDebug {};
            class log {};
        };
        class equipment 
        {
            file = QPATHTOFOLDER(functions\equipment);
            class defaultGhillies {};
            class defaultSuppressors {};
            class getGhillies {};
            class getSuppressors {};
            class getUniform {};
            class hasGhillie {};
            class hasSuppressor {};
        };
        class handlers
        {
            file = QPATHTOFOLDER(functions\handlers);
            class addHandlers {};
            class canStayHidden {};
            class getNearbyUnits {};
            class handleDamage {};
            class handleFired {};
            class handleRespawn {};
            class handleStance {};
            class isNight {};
            class onFired {};
            class onStance {};
            class surfaceIsGrass {};
        };
        class init 
        {
            file = QPATHTOFOLDER(functions\init);
            class getVariable {};
            class postInit {};
            class preInit {};
            class setVariable {};
        };
        class mirror 
        {
            file = QPATHTOFOLDER(functions\mirror);
            class canCreateMirror {};
            class canCreateMirrorCrouch {};
            class cooldown {};
            class createMirror {};
            class deleteMirror {};
            class getMirror {};
        };
    };
};
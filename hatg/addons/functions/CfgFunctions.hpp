class CfgFunctions
{
    class MOD_CONSTANT
    {
        class cba 
        {
            file = QPATHTOFOLDER(functions\cba);
            class keybinds {};
            class settings {};
        };
        class conditions 
        {
            file = QPATHTOFOLDER(functions\conditions);
            class canStayHidden {};
            class getDetectionDistance {};
            class getNearbyUnits {};
            class isFoggy {};
            class isInBuilding {};
            class isNight {};
            class isOnFloor {};
            class isRaining {};
            class surfaceIsGrass {};
        };
        class debug 
        {
            file = QPATHTOFOLDER(functions\debug);
            class batchTesting {};
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
            class handleDamage {};
            class handleDisconnect {};
            class handleFired {};
            class handleFiredNear {};
            class handleGroupCreated {};
            class handleRespawn {};
            class handleStance {};
            class handleUnitJoined {};
            class onFired {};
            class onFiredNear {};
            class onStance {};
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
            class cooldown {};
            class createMirror {};
            class deleteMirror {};
            class getMirror {};
        };
    };
};
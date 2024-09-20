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
        class handlers 
        {
            file = QPATHTOFOLDER(functions\handlers);
            class addHandlers {};
            class handleFired {};
            class handleStance {};
        };
        class init 
        {
            file = QPATHTOFOLDER(functions\init);
            class postInit {};
            class preInit {};
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
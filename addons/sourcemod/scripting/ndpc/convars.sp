/* To add an enable convar, increment convar_count then update the enum and convarNames char
 * The abstract code will handle the logistics of creating the convar */
#define CONVAR_COUNT 7

enum
{
    	CommanderLang = 0,
    	TeamLang,
	BuildingReqs,
    	CaptureReqs,
     	ResearchReqs,
	RepairReqs,
	SpecTesting
}

char convarNames[CONVAR_COUNT][] = {
	"commander_lang",
	"team_lang",
	"building_reqs",
	"capture_reqs",
	"research_reqs",
	"repair_reqs",
	"spec_testing"
};

#define CONVAR_PREFIX "sm_ndpc_"
#define DESCRIPTION_PREFIX "Enable "

ConVar g_Enable[CONVAR_COUNT];  

void CreateConVars()
{
	for (int convar = 0; convar < CONVAR_COUNT; convar++)
	{
		char cString[32];
		StrCat(cString, sizeof(cString), CONVAR_PREFIX);
		StrCat(cString, sizeof(cString), convarNames[convar]);
		
		char dString[32];
		StrCat(dString, sizeof(dString), DESCRIPTION_PREFIX);
		StrCat(dString, sizeof(dString), convarNames[convar]);
		
		g_Enable[convar] = CreateConVar(cString, "1", dString, _, true, 0.0, true, 1.0);	
	}
	
	/*g_Enable[CommanderLang] = CreateConVar("sm_ndpc_commanderlang", "1", "Enable commander lang", _, true, 0.0, true, 1.0);
	g_Enable[TeamLang] 	= CreateConVar("sm_ndpc_teamlang", "1", "Enable team lang", _, true, 0.0, true, 1.0);
	g_Enable[BuildingReqs] 	= CreateConVar("sm_ndpc_buildingreqs", "1", "Enable building requests", _, true, 0.0, true, 1.0);
	g_Enable[CaptureReqs] 	= CreateConVar("sm_ndpc_capturereqs", "1", "Enable capture requests", _, true, 0.0, true, 1.0);*/
	
	AutoExecConfig(true, "nd_trans_settings");
}

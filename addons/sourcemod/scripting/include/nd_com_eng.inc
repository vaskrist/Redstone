#if defined _nd_com_eng_included_
  #endinput
#endif
#define _nd_com_eng_included_

/**
 * Gets if the commander is in commander mode
 *
 * Accepts the input of any client on a team
 * Then checks if their commander is in rts_view
 *
 * @parm1 clientIDX
 * @return bool (true, false).
 */

native bool ND_IsInCommanderMode(int clientIDX);

#define ND_IICM_AVAILABLE() (GetFeatureStatus(FeatureType_Native, "ND_IsInCommanderMode") == FeatureStatus_Available)

stock bool ND_InCommanderMode(int clientIDX)
{
	return ND_IICM_AVAILABLE() && ND_IsInCommanderMode(clientIDX);
}

/**
 * Gets the commander on a given team
 *
 * Accepts input of etheir team consort or empire
 *
 * @parm1 teamIDX consort or empire
 * @return clientIDX of commander.
 */
native int ND_GetTeamCommander(int teamIDX);
#define ND_GTC_AVAILABLE() (GetFeatureStatus(FeatureType_Native, "ND_IsInCommanderMode") == FeatureStatus_Available)

stock int ND_GetCommanderOnTeam(int teamIDX)
{
	return !ND_GTC_AVAILABLE() ? -1 : ND_GetTeamCommander(teamIDX);
}

/**
 * Gets if a given client is a commander
 *
 * Accepts the input of any client on a team
 *
 * @parm1 clientIDX
 * @return bool (true, false).
 */
native bool ND_IsCommanderClient(int clientIDX);
#define ND_ICC_AVAILABLE() (GetFeatureStatus(FeatureType_Native, "ND_IsInCommanderMode") == FeatureStatus_Available)

stock bool ND_IsCommander(int clientIDX)
{
	return !ND_ICC_AVAILABLE() ? false : ND_IsCommanderClient(clientIDX);
}

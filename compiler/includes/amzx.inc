#include <a_samp>

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	if(newstate == PLAYER_STATE_DRIVER)SetPVarInt(playerid,"CarHack",GetPVarInt(playerid,"CarHack")+1);
    return CallLocalFunction("SD_OnPlayerStateChange", "ddd", playerid, newstate, oldstate);
}

#if defined 					_ALS_OnPlayerStateChange
	#undef 						OnPlayerStateChange
#else
	#define 					_ALS_OnPlayerStateChange
#endif

#define OnPlayerStateChange 	SD_OnPlayerStateChange

forward SD_OnPlayerStateChange(playerid, newstate, oldstate);
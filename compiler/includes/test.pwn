else if (PlayerInfo[playerid][pLeader] == 35 || PlayerInfo[playerid][pMember] == 35 && PlayerInfo[playerid][pRank] == 4)
			{
				if(IsPlayerConnected(para1))
				{
					if(para1 != INVALID_PLAYER_ID)
					{
						if(IsPlayerInAnyVehicle(para1)) return SendClientMessage(playerid, COLOR_GREY, "Motamashe Manqanashia");
						if(PlayerInfo[para1][pMember] != 0) return SendClientMessage(playerid, COLOR_GREY, "Motamashe Sxva Fraqciashia");
						if(PlayerInfo[para1][pWarns] >= 1) return SendClientMessage(playerid, COLOR_GRAD1, "Motamashes Adevs Warn");
					//	if(PlayerInfo[para1][pLevel] < 3) return SendClientMessage(playerid, COLOR_GRAD1, "Motamashes Schirdeba 3 Leveli");
						if(PlayerInfo[playerid][pLeader] == 35 || PlayerInfo[playerid][pMember] == 35 && PlayerInfo[playerid][pRank] == 4) { ftext = "Sons OF Anarchy"; InviteSkin[para1] = 248;  }
						GetPlayerName(para1, giveplayer, sizeof(giveplayer));
						GetPlayerName(playerid, sendername, sizeof(sendername));
						format(string, sizeof(string), "Tqven Miiget %s Fraqciashi Saxelad %s", giveplayer,ftext);
						SendClientMessage(playerid, 0x6BB3FFAA, string);
						format(string, sizeof(string), "Tqven Migiges Fraqciashi %s Mimgebi %s", ftext, sendername);
						SendClientMessage(para1, 0x6BB3FFAA, string);
     					FormaFrac[para1] = 35;
						PlayerInfo[para1][pMember] = 35;
						PlayerInfo[para1][pRank] = 1;
						PlayerInfo[para1][pJob] = 0;
						PlayerInfo[para1][pModel] = 247;
						SetPVarInt(playerid, "InvitedInSoa" 1);
						SpawnPlayer(para1);
					}
				}
			}
public OnPlayerSpawn(playerid)
{
	if(GetPVarInt(playerid, "InvetedInSoa") == 1)
	{
		SetPlayerPos(1555, 1555,1555);
		SetPlayerSkin(playerid, PlayerInfo[para1][pModel]);
		SetPlayerToTeamColor(playerid);
		SetPVarInt(playerid, "InvitedInSoa", 0);
	}
	return 1;
}			
YCMD:members(playerid, params[], help)
{
    if(PlayerInfo[playerid][pLogin] == 0) return true;
    new teamnumber;
	new chislo = 0;
	new string[128];
	if(PlayerInfo[playerid][pLeader] != 0) teamnumber = PlayerInfo[playerid][pLeader];
	else if(PlayerInfo[playerid][pMember] != 0) teamnumber = PlayerInfo[playerid][pMember];
	else
	{
		SendClientMessage(playerid, COLOR_GRAD1, "Tqven Ar Gaqvt Am CMD's Gamoyenebis Ufleba");
		return true;
	}
	SendClientMessage(playerid, 0x059BD3FF, "Online Members:");
	if(!IsAMafia(playerid) && !IsAGang(playerid)) SendClientMessage(playerid, TEAM_GROVE_COLOR, "Samsaxurshia:");
	foreach(new i:Player)
	{
		format(string, sizeof(string), "");
		if(PlayerInfo[playerid][pMember] == 4 && PlayerInfo[playerid][pRank] < 9)
		{
		    if(PlayerInfo[i][pLeader] == teamnumber) format(string, sizeof(string), " [%d] %s  Wodeba: Lideri",i,Name(i), chislo++);
		    else if(PlayerInfo[i][pJobHeal] == PlayerInfo[playerid][pJobHeal] && FormaFrac[i] > 0) format(string, sizeof(string), " [%d] %s  Wodeba: %d",i,Name(i), PlayerInfo[i][pRank]), chislo++;
		}
		else if(PlayerInfo[playerid][pMember] == 1 && PlayerInfo[playerid][pRank] < 15)
		{
            if(PlayerInfo[i][pLeader] == teamnumber) format(string, sizeof(string), " [%d] %s  Wodeba: Lideri",i,Name(i), chislo++);
		    else if(PlayerInfo[i][pJobHeal] == PlayerInfo[playerid][pJobHeal] && FormaFrac[i] > 0) format(string, sizeof(string), " [%d] %s  Wodeba: %d",i,Name(i), PlayerInfo[i][pRank]), chislo++;
		}
		if(PlayerInfo[i][pLeader] == teamnumber) format(string, sizeof(string), " [%d] %s  Wodeba: Lideri",i,Name(i), chislo++);
		else if(PlayerInfo[i][pMember] == teamnumber && FormaFrac[i] > 0) format(string, sizeof(string), " [%d] %s  Wodeba: %d",i,Name(i), PlayerInfo[i][pRank]), chislo++;
		if(strlen(string) > 1) SendClientMessage(playerid, 0x059BD3FF, string);
	}
	if(!IsAMafia(playerid) && !IsAGang(playerid)) SendClientMessage(playerid, TEAM_GROVE_COLOR, "Shvebulebashi:");
	foreach(new i:Player)
	{
		format(string, sizeof(string), "");
		if(PlayerInfo[playerid][pMember] == 4 && PlayerInfo[playerid][pRank] < 10)
		{
			if(PlayerInfo[i][pLeader] == teamnumber) format(string, sizeof(string), " [%d] %s  Wodeba: Leaderi",i,Name(i), chislo++);
		    else if(PlayerInfo[i][pJobHeal] == PlayerInfo[playerid][pJobHeal] && FormaFrac[i] == 0 && PlayerInfo[i][pRank] > 0) format(string, sizeof(string), " [%d] %s  Wodeba: %d",i,Name(i), PlayerInfo[i][pRank]), chislo++;
		}
		else if(PlayerInfo[playerid][pMember] == 1 && PlayerInfo[playerid][pRank] < 15)
		{
			if(PlayerInfo[i][pLeader] == teamnumber) format(string, sizeof(string), " [%d] %s  Wodeba: Leaderi",i,Name(i), chislo++);
		    else if(PlayerInfo[i][pJobHeal] == PlayerInfo[playerid][pJobHeal] && FormaFrac[i] == 0 && PlayerInfo[i][pRank] > 0) format(string, sizeof(string), " [%d] %s  Wodeba: %d",i,Name(i), PlayerInfo[i][pRank]), chislo++;
		}
		else if(PlayerInfo[i][pMember] == teamnumber && FormaFrac[i] == 0) format(string, sizeof(string), " [%d] %s  Wodeba: %d",i,Name(i), PlayerInfo[i][pRank]), chislo++;
		if(strlen(string) > 1) SendClientMessage(playerid, 0x059BD3FF, string);
	}
	format(string,sizeof(string),"Sul: %d Motamashe",chislo);
	SendClientMessage(playerid,COLOR_LIGHTGREEN,string);
	return true;
}			
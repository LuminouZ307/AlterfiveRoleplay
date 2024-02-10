#define SetPlayerHunger(%0,%1)              PlayerData[%0][pHunger]=%1
#define SetPlayerThirst(%0,%1)              PlayerData[%0][pThirst]=%1
#define GetPlayerHunger(%0)                 PlayerData[playerid][pHunger]
#define GetPlayerThirst(%0)                 PlayerData[playerid][pThirst]


new PlayerText:HBE_GUI[MAX_PLAYERS][12];
new PlayerText:HBE_HP[MAX_PLAYERS];
new PlayerText:HBE_AP[MAX_PLAYERS];
new PlayerText:HBE_HUNGER[MAX_PLAYERS];
new PlayerText:HBE_THIRST[MAX_PLAYERS];
#include <YSI_Coding\y_hooks>


new PlayerText:PHONEAPP_TD[MAX_PLAYERS][10];
new PlayerText:PHONEAPP_CONTACT[MAX_PLAYERS];
new PlayerText:PHONEAPP_SMS[MAX_PLAYERS];
new PlayerText:PHONEAPP_CALL[MAX_PLAYERS];
new PlayerText:PHONEAPP_TAXI[MAX_PLAYERS];
new PlayerText:PHONEAPP_BANK[MAX_PLAYERS];
new PlayerText:PHONEAPP_CARS[MAX_PLAYERS];
new PlayerText:PHONE_TD[MAX_PLAYERS][12];
new PlayerText:PHONE_WALLPAPER[MAX_PLAYERS];
new PlayerText:PHONE_BAR[MAX_PLAYERS];
new PlayerText:PHONE_CLOCK[MAX_PLAYERS];
new PlayerText:PHONE_DATE[MAX_PLAYERS];
new PlayerText:PHONE_BATTERY[MAX_PLAYERS];
new PlayerText:CALL_RETURN[MAX_PLAYERS];
new PlayerText:CALL_NOW[MAX_PLAYERS];
new PlayerText:CALL_0[MAX_PLAYERS];
new PlayerText:CALL_8[MAX_PLAYERS];
new PlayerText:CALL_5[MAX_PLAYERS];
new PlayerText:CALL_2[MAX_PLAYERS];
new PlayerText:CALL_1[MAX_PLAYERS];
new PlayerText:CALL_3[MAX_PLAYERS];
new PlayerText:CALL_6[MAX_PLAYERS];
new PlayerText:CALL_9[MAX_PLAYERS];
new PlayerText:CALL_4[MAX_PLAYERS];
new PlayerText:CALL_7[MAX_PLAYERS];
new PlayerText:CALL_NUMBER[MAX_PLAYERS];
new PlayerText:CALL_TD[MAX_PLAYERS][18];
new PlayerText:CALLING_STATUS[MAX_PLAYERS];
new PlayerText:CALLING_NAME[MAX_PLAYERS];
new PlayerText:CALLING_DECLINE[MAX_PLAYERS];
new PlayerText:CALLING_ACCEPT[MAX_PLAYERS];
new PlayerText:CALL_DEL[MAX_PLAYERS];
new PlayerText:CALL_DELALL[MAX_PLAYERS];
new PlayerText:CALLING_TD[MAX_PLAYERS][2];

new PlayerText:PHONEBANK_TF[MAX_PLAYERS],
    PlayerText:PHONEBANK_TD[MAX_PLAYERS][16],
	PlayerText:PHONEBANK_RETURN[MAX_PLAYERS];

#define WALLPAPER_COLOR 1296911871

CreatePhone(playerid) {
	PHONE_TD[playerid][0] = CreatePlayerTextDraw(playerid, 421.000000, 398.000000, "ld_beat:chit");
	PlayerTextDrawFont(playerid, PHONE_TD[playerid][0], 4);
	PlayerTextDrawLetterSize(playerid, PHONE_TD[playerid][0], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PHONE_TD[playerid][0], 20.500000, 23.500000);
	PlayerTextDrawSetOutline(playerid, PHONE_TD[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, PHONE_TD[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, PHONE_TD[playerid][0], 1);
	PlayerTextDrawColor(playerid, PHONE_TD[playerid][0], 255);
	PlayerTextDrawBackgroundColor(playerid, PHONE_TD[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, PHONE_TD[playerid][0], 50);
	PlayerTextDrawUseBox(playerid, PHONE_TD[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, PHONE_TD[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, PHONE_TD[playerid][0], 0);

	PHONE_TD[playerid][1] = CreatePlayerTextDraw(playerid, 497.000000, 398.000000, "ld_beat:chit");
	PlayerTextDrawFont(playerid, PHONE_TD[playerid][1], 4);
	PlayerTextDrawLetterSize(playerid, PHONE_TD[playerid][1], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PHONE_TD[playerid][1], 20.500000, 23.500000);
	PlayerTextDrawSetOutline(playerid, PHONE_TD[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, PHONE_TD[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, PHONE_TD[playerid][1], 1);
	PlayerTextDrawColor(playerid, PHONE_TD[playerid][1], 255);
	PlayerTextDrawBackgroundColor(playerid, PHONE_TD[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, PHONE_TD[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, PHONE_TD[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, PHONE_TD[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, PHONE_TD[playerid][1], 0);

	PHONE_TD[playerid][2] = CreatePlayerTextDraw(playerid, 497.000000, 221.000000, "ld_beat:chit");
	PlayerTextDrawFont(playerid, PHONE_TD[playerid][2], 4);
	PlayerTextDrawLetterSize(playerid, PHONE_TD[playerid][2], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PHONE_TD[playerid][2], 20.500000, 23.500000);
	PlayerTextDrawSetOutline(playerid, PHONE_TD[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, PHONE_TD[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, PHONE_TD[playerid][2], 1);
	PlayerTextDrawColor(playerid, PHONE_TD[playerid][2], 255);
	PlayerTextDrawBackgroundColor(playerid, PHONE_TD[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, PHONE_TD[playerid][2], 50);
	PlayerTextDrawUseBox(playerid, PHONE_TD[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, PHONE_TD[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, PHONE_TD[playerid][2], 0);

	PHONE_TD[playerid][3] = CreatePlayerTextDraw(playerid, 421.000000, 221.000000, "ld_beat:chit");
	PlayerTextDrawFont(playerid, PHONE_TD[playerid][3], 4);
	PlayerTextDrawLetterSize(playerid, PHONE_TD[playerid][3], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PHONE_TD[playerid][3], 20.500000, 23.500000);
	PlayerTextDrawSetOutline(playerid, PHONE_TD[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, PHONE_TD[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, PHONE_TD[playerid][3], 1);
	PlayerTextDrawColor(playerid, PHONE_TD[playerid][3], 255);
	PlayerTextDrawBackgroundColor(playerid, PHONE_TD[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, PHONE_TD[playerid][3], 50);
	PlayerTextDrawUseBox(playerid, PHONE_TD[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, PHONE_TD[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, PHONE_TD[playerid][3], 0);

	PHONE_WALLPAPER[playerid] = CreatePlayerTextDraw(playerid, 427.000000, 232.000000, "ld_dual:white");
	PlayerTextDrawFont(playerid, PHONE_WALLPAPER[playerid], 4);
	PlayerTextDrawLetterSize(playerid, PHONE_WALLPAPER[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PHONE_WALLPAPER[playerid], 87.000000, 180.000000);
	PlayerTextDrawSetOutline(playerid, PHONE_WALLPAPER[playerid], 1);
	PlayerTextDrawSetShadow(playerid, PHONE_WALLPAPER[playerid], 0);
	PlayerTextDrawAlignment(playerid, PHONE_WALLPAPER[playerid], 1);
	PlayerTextDrawColor(playerid, PHONE_WALLPAPER[playerid], 1296911871);
	PlayerTextDrawBackgroundColor(playerid, PHONE_WALLPAPER[playerid], 255);
	PlayerTextDrawBoxColor(playerid, PHONE_WALLPAPER[playerid], 50);
	PlayerTextDrawUseBox(playerid, PHONE_WALLPAPER[playerid], 1);
	PlayerTextDrawSetProportional(playerid, PHONE_WALLPAPER[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, PHONE_WALLPAPER[playerid], 0);

	PHONE_TD[playerid][4] = CreatePlayerTextDraw(playerid, 428.000000, 230.000000, "ld_dual:white");
	PlayerTextDrawFont(playerid, PHONE_TD[playerid][4], 4);
	PlayerTextDrawLetterSize(playerid, PHONE_TD[playerid][4], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PHONE_TD[playerid][4], -3.500000, 181.000000);
	PlayerTextDrawSetOutline(playerid, PHONE_TD[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, PHONE_TD[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, PHONE_TD[playerid][4], 1);
	PlayerTextDrawColor(playerid, PHONE_TD[playerid][4], 255);
	PlayerTextDrawBackgroundColor(playerid, PHONE_TD[playerid][4], 255);
	PlayerTextDrawBoxColor(playerid, PHONE_TD[playerid][4], 50);
	PlayerTextDrawUseBox(playerid, PHONE_TD[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, PHONE_TD[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, PHONE_TD[playerid][4], 0);

	PHONE_TD[playerid][5] = CreatePlayerTextDraw(playerid, 430.000000, 228.000000, "ld_dual:white");
	PlayerTextDrawFont(playerid, PHONE_TD[playerid][5], 4);
	PlayerTextDrawLetterSize(playerid, PHONE_TD[playerid][5], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PHONE_TD[playerid][5], 79.000000, -3.000000);
	PlayerTextDrawSetOutline(playerid, PHONE_TD[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, PHONE_TD[playerid][5], 0);
	PlayerTextDrawAlignment(playerid, PHONE_TD[playerid][5], 1);
	PlayerTextDrawColor(playerid, PHONE_TD[playerid][5], 255);
	PlayerTextDrawBackgroundColor(playerid, PHONE_TD[playerid][5], 255);
	PlayerTextDrawBoxColor(playerid, PHONE_TD[playerid][5], 50);
	PlayerTextDrawUseBox(playerid, PHONE_TD[playerid][5], 1);
	PlayerTextDrawSetProportional(playerid, PHONE_TD[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, PHONE_TD[playerid][5], 0);

	PHONE_TD[playerid][6] = CreatePlayerTextDraw(playerid, 514.000000, 230.000000, "ld_dual:white");
	PlayerTextDrawFont(playerid, PHONE_TD[playerid][6], 4);
	PlayerTextDrawLetterSize(playerid, PHONE_TD[playerid][6], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PHONE_TD[playerid][6], -3.500000, 182.000000);
	PlayerTextDrawSetOutline(playerid, PHONE_TD[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, PHONE_TD[playerid][6], 0);
	PlayerTextDrawAlignment(playerid, PHONE_TD[playerid][6], 1);
	PlayerTextDrawColor(playerid, PHONE_TD[playerid][6], 255);
	PlayerTextDrawBackgroundColor(playerid, PHONE_TD[playerid][6], 255);
	PlayerTextDrawBoxColor(playerid, PHONE_TD[playerid][6], 50);
	PlayerTextDrawUseBox(playerid, PHONE_TD[playerid][6], 1);
	PlayerTextDrawSetProportional(playerid, PHONE_TD[playerid][6], 1);
	PlayerTextDrawSetSelectable(playerid, PHONE_TD[playerid][6], 0);

	PHONE_TD[playerid][7] = CreatePlayerTextDraw(playerid, 427.000000, 235.000000, "ld_dual:white");
	PlayerTextDrawFont(playerid, PHONE_TD[playerid][7], 4);
	PlayerTextDrawLetterSize(playerid, PHONE_TD[playerid][7], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PHONE_TD[playerid][7], 83.500000, -7.500000);
	PlayerTextDrawSetOutline(playerid, PHONE_TD[playerid][7], 1);
	PlayerTextDrawSetShadow(playerid, PHONE_TD[playerid][7], 0);
	PlayerTextDrawAlignment(playerid, PHONE_TD[playerid][7], 1);
	PlayerTextDrawColor(playerid, PHONE_TD[playerid][7], 255);
	PlayerTextDrawBackgroundColor(playerid, PHONE_TD[playerid][7], 255);
	PlayerTextDrawBoxColor(playerid, PHONE_TD[playerid][7], 50);
	PlayerTextDrawUseBox(playerid, PHONE_TD[playerid][7], 1);
	PlayerTextDrawSetProportional(playerid, PHONE_TD[playerid][7], 1);
	PlayerTextDrawSetSelectable(playerid, PHONE_TD[playerid][7], 0);

	PHONE_TD[playerid][8] = CreatePlayerTextDraw(playerid, 430.000000, 415.000000, "ld_dual:white");
	PlayerTextDrawFont(playerid, PHONE_TD[playerid][8], 4);
	PlayerTextDrawLetterSize(playerid, PHONE_TD[playerid][8], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PHONE_TD[playerid][8], 79.000000, 2.500000);
	PlayerTextDrawSetOutline(playerid, PHONE_TD[playerid][8], 1);
	PlayerTextDrawSetShadow(playerid, PHONE_TD[playerid][8], 0);
	PlayerTextDrawAlignment(playerid, PHONE_TD[playerid][8], 1);
	PlayerTextDrawColor(playerid, PHONE_TD[playerid][8], 255);
	PlayerTextDrawBackgroundColor(playerid, PHONE_TD[playerid][8], 255);
	PlayerTextDrawBoxColor(playerid, PHONE_TD[playerid][8], 50);
	PlayerTextDrawUseBox(playerid, PHONE_TD[playerid][8], 1);
	PlayerTextDrawSetProportional(playerid, PHONE_TD[playerid][8], 1);
	PlayerTextDrawSetSelectable(playerid, PHONE_TD[playerid][8], 0);

	PHONE_TD[playerid][9] = CreatePlayerTextDraw(playerid, 427.000000, 415.000000, "ld_dual:white");
	PlayerTextDrawFont(playerid, PHONE_TD[playerid][9], 4);
	PlayerTextDrawLetterSize(playerid, PHONE_TD[playerid][9], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PHONE_TD[playerid][9], 83.500000, -16.500000);
	PlayerTextDrawSetOutline(playerid, PHONE_TD[playerid][9], 1);
	PlayerTextDrawSetShadow(playerid, PHONE_TD[playerid][9], 0);
	PlayerTextDrawAlignment(playerid, PHONE_TD[playerid][9], 1);
	PlayerTextDrawColor(playerid, PHONE_TD[playerid][9], 255);
	PlayerTextDrawBackgroundColor(playerid, PHONE_TD[playerid][9], 255);
	PlayerTextDrawBoxColor(playerid, PHONE_TD[playerid][9], 50);
	PlayerTextDrawUseBox(playerid, PHONE_TD[playerid][9], 1);
	PlayerTextDrawSetProportional(playerid, PHONE_TD[playerid][9], 1);
	PlayerTextDrawSetSelectable(playerid, PHONE_TD[playerid][9], 0);

	PHONE_TD[playerid][10] = CreatePlayerTextDraw(playerid, 460.000000, 399.000000, "ld_beat:chit");
	PlayerTextDrawFont(playerid, PHONE_TD[playerid][10], 4);
	PlayerTextDrawLetterSize(playerid, PHONE_TD[playerid][10], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PHONE_TD[playerid][10], 17.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, PHONE_TD[playerid][10], 1);
	PlayerTextDrawSetShadow(playerid, PHONE_TD[playerid][10], 0);
	PlayerTextDrawAlignment(playerid, PHONE_TD[playerid][10], 1);
	PlayerTextDrawColor(playerid, PHONE_TD[playerid][10], -1);
	PlayerTextDrawBackgroundColor(playerid, PHONE_TD[playerid][10], 255);
	PlayerTextDrawBoxColor(playerid, PHONE_TD[playerid][10], 50);
	PlayerTextDrawUseBox(playerid, PHONE_TD[playerid][10], 1);
	PlayerTextDrawSetProportional(playerid, PHONE_TD[playerid][10], 1);
	PlayerTextDrawSetSelectable(playerid, PHONE_TD[playerid][10], 0);

	PHONE_BAR[playerid] = CreatePlayerTextDraw(playerid, 428.000000, 235.000000, "ld_dual:white");
	PlayerTextDrawFont(playerid, PHONE_BAR[playerid], 4);
	PlayerTextDrawLetterSize(playerid, PHONE_BAR[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PHONE_BAR[playerid], 82.500000, 5.500000);
	PlayerTextDrawSetOutline(playerid, PHONE_BAR[playerid], 1);
	PlayerTextDrawSetShadow(playerid, PHONE_BAR[playerid], 0);
	PlayerTextDrawAlignment(playerid, PHONE_BAR[playerid], 1);
	PlayerTextDrawColor(playerid, PHONE_BAR[playerid], -741092521);
	PlayerTextDrawBackgroundColor(playerid, PHONE_BAR[playerid], 255);
	PlayerTextDrawBoxColor(playerid, PHONE_BAR[playerid], 50);
	PlayerTextDrawUseBox(playerid, PHONE_BAR[playerid], 1);
	PlayerTextDrawSetProportional(playerid, PHONE_BAR[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, PHONE_BAR[playerid], 0);

	PHONE_TD[playerid][11] = CreatePlayerTextDraw(playerid, 462.000000, 400.500000, "ld_beat:chit");
	PlayerTextDrawFont(playerid, PHONE_TD[playerid][11], 4);
	PlayerTextDrawLetterSize(playerid, PHONE_TD[playerid][11], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PHONE_TD[playerid][11], 13.000000, 14.000000);
	PlayerTextDrawSetOutline(playerid, PHONE_TD[playerid][11], 1);
	PlayerTextDrawSetShadow(playerid, PHONE_TD[playerid][11], 0);
	PlayerTextDrawAlignment(playerid, PHONE_TD[playerid][11], 1);
	PlayerTextDrawColor(playerid, PHONE_TD[playerid][11], 255);
	PlayerTextDrawBackgroundColor(playerid, PHONE_TD[playerid][11], 255);
	PlayerTextDrawBoxColor(playerid, PHONE_TD[playerid][11], 50);
	PlayerTextDrawUseBox(playerid, PHONE_TD[playerid][11], 1);
	PlayerTextDrawSetProportional(playerid, PHONE_TD[playerid][11], 1);
	PlayerTextDrawSetSelectable(playerid, PHONE_TD[playerid][11], 1);

	PHONE_DATE[playerid] = CreatePlayerTextDraw(playerid, 430.000000, 235.000000, "01_October_2023");
	PlayerTextDrawFont(playerid, PHONE_DATE[playerid], 1);
	PlayerTextDrawLetterSize(playerid, PHONE_DATE[playerid], 0.116664, 0.550000);
	PlayerTextDrawTextSize(playerid, PHONE_DATE[playerid], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, PHONE_DATE[playerid], 0);
	PlayerTextDrawSetShadow(playerid, PHONE_DATE[playerid], 0);
	PlayerTextDrawAlignment(playerid, PHONE_DATE[playerid], 1);
	PlayerTextDrawColor(playerid, PHONE_DATE[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, PHONE_DATE[playerid], 255);
	PlayerTextDrawBoxColor(playerid, PHONE_DATE[playerid], 50);
	PlayerTextDrawUseBox(playerid, PHONE_DATE[playerid], 0);
	PlayerTextDrawSetProportional(playerid, PHONE_DATE[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, PHONE_DATE[playerid], 0);

	PHONE_BATTERY[playerid] = CreatePlayerTextDraw(playerid, 508.000000, 235.000000, "100%%");
	PlayerTextDrawFont(playerid, PHONE_BATTERY[playerid], 1);
	PlayerTextDrawLetterSize(playerid, PHONE_BATTERY[playerid], 0.116664, 0.550000);
	PlayerTextDrawTextSize(playerid, PHONE_BATTERY[playerid], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, PHONE_BATTERY[playerid], 0);
	PlayerTextDrawSetShadow(playerid, PHONE_BATTERY[playerid], 0);
	PlayerTextDrawAlignment(playerid, PHONE_BATTERY[playerid], 3);
	PlayerTextDrawColor(playerid, PHONE_BATTERY[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, PHONE_BATTERY[playerid], 255);
	PlayerTextDrawBoxColor(playerid, PHONE_BATTERY[playerid], 50);
	PlayerTextDrawUseBox(playerid, PHONE_BATTERY[playerid], 0);
	PlayerTextDrawSetProportional(playerid, PHONE_BATTERY[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, PHONE_BATTERY[playerid], 0);

	PHONEAPP_CONTACT[playerid] = CreatePlayerTextDraw(playerid, 433.000000, 257.000000, "ld_dual:white");
	PlayerTextDrawFont(playerid, PHONEAPP_CONTACT[playerid], 4);
	PlayerTextDrawLetterSize(playerid, PHONEAPP_CONTACT[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PHONEAPP_CONTACT[playerid], 17.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, PHONEAPP_CONTACT[playerid], 1);
	PlayerTextDrawSetShadow(playerid, PHONEAPP_CONTACT[playerid], 0);
	PlayerTextDrawAlignment(playerid, PHONEAPP_CONTACT[playerid], 1);
	PlayerTextDrawColor(playerid, PHONEAPP_CONTACT[playerid], 561506815);
	PlayerTextDrawBackgroundColor(playerid, PHONEAPP_CONTACT[playerid], 255);
	PlayerTextDrawBoxColor(playerid, PHONEAPP_CONTACT[playerid], 50);
	PlayerTextDrawUseBox(playerid, PHONEAPP_CONTACT[playerid], 1);
	PlayerTextDrawSetProportional(playerid, PHONEAPP_CONTACT[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, PHONEAPP_CONTACT[playerid], 1);

	PHONEAPP_SMS[playerid] = CreatePlayerTextDraw(playerid, 489.000000, 257.000000, "ld_dual:white");
	PlayerTextDrawFont(playerid, PHONEAPP_SMS[playerid], 4);
	PlayerTextDrawLetterSize(playerid, PHONEAPP_SMS[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PHONEAPP_SMS[playerid], 17.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, PHONEAPP_SMS[playerid], 1);
	PlayerTextDrawSetShadow(playerid, PHONEAPP_SMS[playerid], 0);
	PlayerTextDrawAlignment(playerid, PHONEAPP_SMS[playerid], 1);
	PlayerTextDrawColor(playerid, PHONEAPP_SMS[playerid], 196552447);
	PlayerTextDrawBackgroundColor(playerid, PHONEAPP_SMS[playerid], 255);
	PlayerTextDrawBoxColor(playerid, PHONEAPP_SMS[playerid], 50);
	PlayerTextDrawUseBox(playerid, PHONEAPP_SMS[playerid], 1);
	PlayerTextDrawSetProportional(playerid, PHONEAPP_SMS[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, PHONEAPP_SMS[playerid], 1);

	PHONEAPP_CALL[playerid] = CreatePlayerTextDraw(playerid, 461.000000, 257.000000, "ld_dual:white");
	PlayerTextDrawFont(playerid, PHONEAPP_CALL[playerid], 4);
	PlayerTextDrawLetterSize(playerid, PHONEAPP_CALL[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PHONEAPP_CALL[playerid], 17.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, PHONEAPP_CALL[playerid], 1);
	PlayerTextDrawSetShadow(playerid, PHONEAPP_CALL[playerid], 0);
	PlayerTextDrawAlignment(playerid, PHONEAPP_CALL[playerid], 1);
	PlayerTextDrawColor(playerid, PHONEAPP_CALL[playerid], -1764666881);
	PlayerTextDrawBackgroundColor(playerid, PHONEAPP_CALL[playerid], 255);
	PlayerTextDrawBoxColor(playerid, PHONEAPP_CALL[playerid], 50);
	PlayerTextDrawUseBox(playerid, PHONEAPP_CALL[playerid], 1);
	PlayerTextDrawSetProportional(playerid, PHONEAPP_CALL[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, PHONEAPP_CALL[playerid], 1);

	PHONEAPP_TAXI[playerid] = CreatePlayerTextDraw(playerid, 433.000000, 289.000000, "ld_dual:white");
	PlayerTextDrawFont(playerid, PHONEAPP_TAXI[playerid], 4);
	PlayerTextDrawLetterSize(playerid, PHONEAPP_TAXI[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PHONEAPP_TAXI[playerid], 17.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, PHONEAPP_TAXI[playerid], 1);
	PlayerTextDrawSetShadow(playerid, PHONEAPP_TAXI[playerid], 0);
	PlayerTextDrawAlignment(playerid, PHONEAPP_TAXI[playerid], 1);
	PlayerTextDrawColor(playerid, PHONEAPP_TAXI[playerid], -71563009);
	PlayerTextDrawBackgroundColor(playerid, PHONEAPP_TAXI[playerid], 255);
	PlayerTextDrawBoxColor(playerid, PHONEAPP_TAXI[playerid], 50);
	PlayerTextDrawUseBox(playerid, PHONEAPP_TAXI[playerid], 1);
	PlayerTextDrawSetProportional(playerid, PHONEAPP_TAXI[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, PHONEAPP_TAXI[playerid], 1);

	PHONEAPP_BANK[playerid] = CreatePlayerTextDraw(playerid, 461.000000, 289.000000, "ld_dual:white");
	PlayerTextDrawFont(playerid, PHONEAPP_BANK[playerid], 4);
	PlayerTextDrawLetterSize(playerid, PHONEAPP_BANK[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PHONEAPP_BANK[playerid], 17.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, PHONEAPP_BANK[playerid], 1);
	PlayerTextDrawSetShadow(playerid, PHONEAPP_BANK[playerid], 0);
	PlayerTextDrawAlignment(playerid, PHONEAPP_BANK[playerid], 1);
	PlayerTextDrawColor(playerid, PHONEAPP_BANK[playerid], CreateRGBA(25,28,71, 255));
	PlayerTextDrawBackgroundColor(playerid, PHONEAPP_BANK[playerid], 255);
	PlayerTextDrawBoxColor(playerid, PHONEAPP_BANK[playerid], 50);
	PlayerTextDrawUseBox(playerid, PHONEAPP_BANK[playerid], 1);
	PlayerTextDrawSetProportional(playerid, PHONEAPP_BANK[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, PHONEAPP_BANK[playerid], 1);

	PHONEAPP_CARS[playerid] = CreatePlayerTextDraw(playerid, 489.000000, 289.000000, "ld_dual:white");
	PlayerTextDrawFont(playerid, PHONEAPP_CARS[playerid], 4);
	PlayerTextDrawLetterSize(playerid, PHONEAPP_CARS[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PHONEAPP_CARS[playerid], 17.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, PHONEAPP_CARS[playerid], 1);
	PlayerTextDrawSetShadow(playerid, PHONEAPP_CARS[playerid], 0);
	PlayerTextDrawAlignment(playerid, PHONEAPP_CARS[playerid], 1);
	PlayerTextDrawColor(playerid, PHONEAPP_CARS[playerid], 139632127);
	PlayerTextDrawBackgroundColor(playerid, PHONEAPP_CARS[playerid], 255);
	PlayerTextDrawBoxColor(playerid, PHONEAPP_CARS[playerid], 50);
	PlayerTextDrawUseBox(playerid, PHONEAPP_CARS[playerid], 1);
	PlayerTextDrawSetProportional(playerid, PHONEAPP_CARS[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, PHONEAPP_CARS[playerid], 1);

	PHONEAPP_TD[playerid][0] = CreatePlayerTextDraw(playerid, 437.500000, 258.500000, "ld_beat:chit");
	PlayerTextDrawFont(playerid, PHONEAPP_TD[playerid][0], 4);
	PlayerTextDrawLetterSize(playerid, PHONEAPP_TD[playerid][0], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PHONEAPP_TD[playerid][0], 7.000000, 8.000000);
	PlayerTextDrawSetOutline(playerid, PHONEAPP_TD[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, PHONEAPP_TD[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, PHONEAPP_TD[playerid][0], 1);
	PlayerTextDrawColor(playerid, PHONEAPP_TD[playerid][0], -741092353);
	PlayerTextDrawBackgroundColor(playerid, PHONEAPP_TD[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, PHONEAPP_TD[playerid][0], 50);
	PlayerTextDrawUseBox(playerid, PHONEAPP_TD[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, PHONEAPP_TD[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, PHONEAPP_TD[playerid][0], 0);

	PHONEAPP_TD[playerid][1] = CreatePlayerTextDraw(playerid, 434.500000, 263.500000, "ld_beat:chit");
	PlayerTextDrawFont(playerid, PHONEAPP_TD[playerid][1], 4);
	PlayerTextDrawLetterSize(playerid, PHONEAPP_TD[playerid][1], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PHONEAPP_TD[playerid][1], 13.500000, 8.000000);
	PlayerTextDrawSetOutline(playerid, PHONEAPP_TD[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, PHONEAPP_TD[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, PHONEAPP_TD[playerid][1], 1);
	PlayerTextDrawColor(playerid, PHONEAPP_TD[playerid][1], -741092353);
	PlayerTextDrawBackgroundColor(playerid, PHONEAPP_TD[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, PHONEAPP_TD[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, PHONEAPP_TD[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, PHONEAPP_TD[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, PHONEAPP_TD[playerid][1], 0);

	PHONEAPP_TD[playerid][2] = CreatePlayerTextDraw(playerid, 467.000000, 259.500000, "ld_beat:chit");
	PlayerTextDrawFont(playerid, PHONEAPP_TD[playerid][2], 4);
	PlayerTextDrawLetterSize(playerid, PHONEAPP_TD[playerid][2], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PHONEAPP_TD[playerid][2], 5.000000, 5.500000);
	PlayerTextDrawSetOutline(playerid, PHONEAPP_TD[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, PHONEAPP_TD[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, PHONEAPP_TD[playerid][2], 1);
	PlayerTextDrawColor(playerid, PHONEAPP_TD[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, PHONEAPP_TD[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, PHONEAPP_TD[playerid][2], 50);
	PlayerTextDrawUseBox(playerid, PHONEAPP_TD[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, PHONEAPP_TD[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, PHONEAPP_TD[playerid][2], 0);

	PHONEAPP_TD[playerid][3] = CreatePlayerTextDraw(playerid, 466.000000, 265.500000, "ld_beat:chit");
	PlayerTextDrawFont(playerid, PHONEAPP_TD[playerid][3], 4);
	PlayerTextDrawLetterSize(playerid, PHONEAPP_TD[playerid][3], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PHONEAPP_TD[playerid][3], 6.000000, 6.500000);
	PlayerTextDrawSetOutline(playerid, PHONEAPP_TD[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, PHONEAPP_TD[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, PHONEAPP_TD[playerid][3], 1);
	PlayerTextDrawColor(playerid, PHONEAPP_TD[playerid][3], -1);
	PlayerTextDrawBackgroundColor(playerid, PHONEAPP_TD[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, PHONEAPP_TD[playerid][3], 50);
	PlayerTextDrawUseBox(playerid, PHONEAPP_TD[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, PHONEAPP_TD[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, PHONEAPP_TD[playerid][3], 0);

	PHONEAPP_TD[playerid][4] = CreatePlayerTextDraw(playerid, 468.000000, 257.000000, ")");
	PlayerTextDrawFont(playerid, PHONEAPP_TD[playerid][4], 1);
	PlayerTextDrawLetterSize(playerid, PHONEAPP_TD[playerid][4], 0.399999, 1.500001);
	PlayerTextDrawTextSize(playerid, PHONEAPP_TD[playerid][4], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, PHONEAPP_TD[playerid][4], 0);
	PlayerTextDrawSetShadow(playerid, PHONEAPP_TD[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, PHONEAPP_TD[playerid][4], 1);
	PlayerTextDrawColor(playerid, PHONEAPP_TD[playerid][4], -1);
	PlayerTextDrawBackgroundColor(playerid, PHONEAPP_TD[playerid][4], 255);
	PlayerTextDrawBoxColor(playerid, PHONEAPP_TD[playerid][4], 50);
	PlayerTextDrawUseBox(playerid, PHONEAPP_TD[playerid][4], 0);
	PlayerTextDrawSetProportional(playerid, PHONEAPP_TD[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, PHONEAPP_TD[playerid][4], 0);

	PHONEAPP_TD[playerid][5] = CreatePlayerTextDraw(playerid, 491.000000, 260.500000, "ld_beat:chit");
	PlayerTextDrawFont(playerid, PHONEAPP_TD[playerid][5], 4);
	PlayerTextDrawLetterSize(playerid, PHONEAPP_TD[playerid][5], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PHONEAPP_TD[playerid][5], 13.000000, 10.000000);
	PlayerTextDrawSetOutline(playerid, PHONEAPP_TD[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, PHONEAPP_TD[playerid][5], 0);
	PlayerTextDrawAlignment(playerid, PHONEAPP_TD[playerid][5], 1);
	PlayerTextDrawColor(playerid, PHONEAPP_TD[playerid][5], -1);
	PlayerTextDrawBackgroundColor(playerid, PHONEAPP_TD[playerid][5], 255);
	PlayerTextDrawBoxColor(playerid, PHONEAPP_TD[playerid][5], 50);
	PlayerTextDrawUseBox(playerid, PHONEAPP_TD[playerid][5], 1);
	PlayerTextDrawSetProportional(playerid, PHONEAPP_TD[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, PHONEAPP_TD[playerid][5], 0);

	PHONEAPP_TD[playerid][6] = CreatePlayerTextDraw(playerid, 499.000000, 266.500000, "ld_beat:chit");
	PlayerTextDrawFont(playerid, PHONEAPP_TD[playerid][6], 4);
	PlayerTextDrawLetterSize(playerid, PHONEAPP_TD[playerid][6], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PHONEAPP_TD[playerid][6], 4.000000, 4.000000);
	PlayerTextDrawSetOutline(playerid, PHONEAPP_TD[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, PHONEAPP_TD[playerid][6], 0);
	PlayerTextDrawAlignment(playerid, PHONEAPP_TD[playerid][6], 1);
	PlayerTextDrawColor(playerid, PHONEAPP_TD[playerid][6], -1);
	PlayerTextDrawBackgroundColor(playerid, PHONEAPP_TD[playerid][6], 255);
	PlayerTextDrawBoxColor(playerid, PHONEAPP_TD[playerid][6], 50);
	PlayerTextDrawUseBox(playerid, PHONEAPP_TD[playerid][6], 1);
	PlayerTextDrawSetProportional(playerid, PHONEAPP_TD[playerid][6], 1);
	PlayerTextDrawSetSelectable(playerid, PHONEAPP_TD[playerid][6], 0);

	PHONEAPP_TD[playerid][7] = CreatePlayerTextDraw(playerid, 436.500000, 294.000000, "TAXI");
	PlayerTextDrawFont(playerid, PHONEAPP_TD[playerid][7], 1);
	PlayerTextDrawLetterSize(playerid, PHONEAPP_TD[playerid][7], 0.120831, 0.650000);
	PlayerTextDrawTextSize(playerid, PHONEAPP_TD[playerid][7], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, PHONEAPP_TD[playerid][7], 0);
	PlayerTextDrawSetShadow(playerid, PHONEAPP_TD[playerid][7], 0);
	PlayerTextDrawAlignment(playerid, PHONEAPP_TD[playerid][7], 1);
	PlayerTextDrawColor(playerid, PHONEAPP_TD[playerid][7], -1);
	PlayerTextDrawBackgroundColor(playerid, PHONEAPP_TD[playerid][7], 255);
	PlayerTextDrawBoxColor(playerid, PHONEAPP_TD[playerid][7], 50);
	PlayerTextDrawUseBox(playerid, PHONEAPP_TD[playerid][7], 0);
	PlayerTextDrawSetProportional(playerid, PHONEAPP_TD[playerid][7], 1);
	PlayerTextDrawSetSelectable(playerid, PHONEAPP_TD[playerid][7], 0);

	PHONEAPP_TD[playerid][8] = CreatePlayerTextDraw(playerid, 467.500000, 294.000000, "$");
	PlayerTextDrawFont(playerid, PHONEAPP_TD[playerid][8], 2);
	PlayerTextDrawLetterSize(playerid, PHONEAPP_TD[playerid][8], 0.120831, 0.650000);
	PlayerTextDrawTextSize(playerid, PHONEAPP_TD[playerid][8], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, PHONEAPP_TD[playerid][8], 0);
	PlayerTextDrawSetShadow(playerid, PHONEAPP_TD[playerid][8], 0);
	PlayerTextDrawAlignment(playerid, PHONEAPP_TD[playerid][8], 1);
	PlayerTextDrawColor(playerid, PHONEAPP_TD[playerid][8], CreateRGBA(247,247,247, 255));
	PlayerTextDrawBackgroundColor(playerid, PHONEAPP_TD[playerid][8], 255);
	PlayerTextDrawBoxColor(playerid, PHONEAPP_TD[playerid][8], 50);
	PlayerTextDrawUseBox(playerid, PHONEAPP_TD[playerid][8], 0);
	PlayerTextDrawSetProportional(playerid, PHONEAPP_TD[playerid][8], 1);
	PlayerTextDrawSetSelectable(playerid, PHONEAPP_TD[playerid][8], 0);

	PHONEAPP_TD[playerid][9] = CreatePlayerTextDraw(playerid, 491.000000, 294.500000, "MYCARS");
	PlayerTextDrawFont(playerid, PHONEAPP_TD[playerid][9], 1);
	PlayerTextDrawLetterSize(playerid, PHONEAPP_TD[playerid][9], 0.099998, 0.600000);
	PlayerTextDrawTextSize(playerid, PHONEAPP_TD[playerid][9], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, PHONEAPP_TD[playerid][9], 0);
	PlayerTextDrawSetShadow(playerid, PHONEAPP_TD[playerid][9], 0);
	PlayerTextDrawAlignment(playerid, PHONEAPP_TD[playerid][9], 1);
	PlayerTextDrawColor(playerid, PHONEAPP_TD[playerid][9], -1);
	PlayerTextDrawBackgroundColor(playerid, PHONEAPP_TD[playerid][9], 255);
	PlayerTextDrawBoxColor(playerid, PHONEAPP_TD[playerid][9], 50);
	PlayerTextDrawUseBox(playerid, PHONEAPP_TD[playerid][9], 0);
	PlayerTextDrawSetProportional(playerid, PHONEAPP_TD[playerid][9], 1);
	PlayerTextDrawSetSelectable(playerid, PHONEAPP_TD[playerid][9], 0);

	CALL_TD[playerid][0] = CreatePlayerTextDraw(playerid, 428.000000, 240.500000, "ld_dual:white");
	PlayerTextDrawFont(playerid, CALL_TD[playerid][0], 4);
	PlayerTextDrawLetterSize(playerid, CALL_TD[playerid][0], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, CALL_TD[playerid][0], 82.500000, 13.500000);
	PlayerTextDrawSetOutline(playerid, CALL_TD[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, CALL_TD[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, CALL_TD[playerid][0], 1);
	PlayerTextDrawColor(playerid, CALL_TD[playerid][0], 607738367);
	PlayerTextDrawBackgroundColor(playerid, CALL_TD[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, CALL_TD[playerid][0], 50);
	PlayerTextDrawUseBox(playerid, CALL_TD[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, CALL_TD[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, CALL_TD[playerid][0], 0);

	CALL_TD[playerid][1] = CreatePlayerTextDraw(playerid, 469.000000, 244.500000, "PHONE CALL");
	PlayerTextDrawFont(playerid, CALL_TD[playerid][1], 1);
	PlayerTextDrawLetterSize(playerid, CALL_TD[playerid][1], 0.116663, 0.550000);
	PlayerTextDrawTextSize(playerid, CALL_TD[playerid][1], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, CALL_TD[playerid][1], 0);
	PlayerTextDrawSetShadow(playerid, CALL_TD[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, CALL_TD[playerid][1], 3);
	PlayerTextDrawColor(playerid, CALL_TD[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, CALL_TD[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, CALL_TD[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, CALL_TD[playerid][1], 0);
	PlayerTextDrawSetProportional(playerid, CALL_TD[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, CALL_TD[playerid][1], 0);

	CALL_RETURN[playerid] = CreatePlayerTextDraw(playerid, 428.000000, 241.000000, "ld_dual:white");
	PlayerTextDrawFont(playerid, CALL_RETURN[playerid], 4);
	PlayerTextDrawLetterSize(playerid, CALL_RETURN[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, CALL_RETURN[playerid], 18.000000, 12.500000);
	PlayerTextDrawSetOutline(playerid, CALL_RETURN[playerid], 1);
	PlayerTextDrawSetShadow(playerid, CALL_RETURN[playerid], 0);
	PlayerTextDrawAlignment(playerid, CALL_RETURN[playerid], 1);
	PlayerTextDrawColor(playerid, CALL_RETURN[playerid], -256);
	PlayerTextDrawBackgroundColor(playerid, CALL_RETURN[playerid], 255);
	PlayerTextDrawBoxColor(playerid, CALL_RETURN[playerid], 50);
	PlayerTextDrawUseBox(playerid, CALL_RETURN[playerid], 1);
	PlayerTextDrawSetProportional(playerid, CALL_RETURN[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, CALL_RETURN[playerid], 1);

	CALL_TD[playerid][2] = CreatePlayerTextDraw(playerid, 439.000000, 240.500000, "<");
	PlayerTextDrawFont(playerid, CALL_TD[playerid][2], 1);
	PlayerTextDrawLetterSize(playerid, CALL_TD[playerid][2], 0.183330, 1.349999);
	PlayerTextDrawTextSize(playerid, CALL_TD[playerid][2], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, CALL_TD[playerid][2], 0);
	PlayerTextDrawSetShadow(playerid, CALL_TD[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, CALL_TD[playerid][2], 3);
	PlayerTextDrawColor(playerid, CALL_TD[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, CALL_TD[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, CALL_TD[playerid][2], 50);
	PlayerTextDrawUseBox(playerid, CALL_TD[playerid][2], 0);
	PlayerTextDrawSetProportional(playerid, CALL_TD[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, CALL_TD[playerid][2], 1);

	CALL_NOW[playerid] = CreatePlayerTextDraw(playerid, 450.000000, 381.000000, "ld_dual:white");
	PlayerTextDrawFont(playerid, CALL_NOW[playerid], 4);
	PlayerTextDrawLetterSize(playerid, CALL_NOW[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, CALL_NOW[playerid], 38.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, CALL_NOW[playerid], 1);
	PlayerTextDrawSetShadow(playerid, CALL_NOW[playerid], 0);
	PlayerTextDrawAlignment(playerid, CALL_NOW[playerid], 1);
	PlayerTextDrawColor(playerid, CALL_NOW[playerid], 684815871);
	PlayerTextDrawBackgroundColor(playerid, CALL_NOW[playerid], 255);
	PlayerTextDrawBoxColor(playerid, CALL_NOW[playerid], 50);
	PlayerTextDrawUseBox(playerid, CALL_NOW[playerid], 1);
	PlayerTextDrawSetProportional(playerid, CALL_NOW[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, CALL_NOW[playerid], 1);

	CALL_TD[playerid][3] = CreatePlayerTextDraw(playerid, 479.000000, 387.500000, "CALL NOW");
	PlayerTextDrawFont(playerid, CALL_TD[playerid][3], 1);
	PlayerTextDrawLetterSize(playerid, CALL_TD[playerid][3], 0.116663, 0.550000);
	PlayerTextDrawTextSize(playerid, CALL_TD[playerid][3], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, CALL_TD[playerid][3], 0);
	PlayerTextDrawSetShadow(playerid, CALL_TD[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, CALL_TD[playerid][3], 3);
	PlayerTextDrawColor(playerid, CALL_TD[playerid][3], 255);
	PlayerTextDrawBackgroundColor(playerid, CALL_TD[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, CALL_TD[playerid][3], 50);
	PlayerTextDrawUseBox(playerid, CALL_TD[playerid][3], 0);
	PlayerTextDrawSetProportional(playerid, CALL_TD[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, CALL_TD[playerid][3], 0);

	CALL_0[playerid] = CreatePlayerTextDraw(playerid, 450.000000, 364.000000, "ld_dual:white");
	PlayerTextDrawFont(playerid, CALL_0[playerid], 4);
	PlayerTextDrawLetterSize(playerid, CALL_0[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, CALL_0[playerid], 38.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, CALL_0[playerid], 1);
	PlayerTextDrawSetShadow(playerid, CALL_0[playerid], 0);
	PlayerTextDrawAlignment(playerid, CALL_0[playerid], 1);
	PlayerTextDrawColor(playerid, CALL_0[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, CALL_0[playerid], 255);
	PlayerTextDrawBoxColor(playerid, CALL_0[playerid], 50);
	PlayerTextDrawUseBox(playerid, CALL_0[playerid], 1);
	PlayerTextDrawSetProportional(playerid, CALL_0[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, CALL_0[playerid], 1);

	CALL_TD[playerid][4] = CreatePlayerTextDraw(playerid, 472.000000, 367.500000, "0");
	PlayerTextDrawFont(playerid, CALL_TD[playerid][4], 1);
	PlayerTextDrawLetterSize(playerid, CALL_TD[playerid][4], 0.199997, 1.149999);
	PlayerTextDrawTextSize(playerid, CALL_TD[playerid][4], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, CALL_TD[playerid][4], 0);
	PlayerTextDrawSetShadow(playerid, CALL_TD[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, CALL_TD[playerid][4], 3);
	PlayerTextDrawColor(playerid, CALL_TD[playerid][4], 255);
	PlayerTextDrawBackgroundColor(playerid, CALL_TD[playerid][4], 255);
	PlayerTextDrawBoxColor(playerid, CALL_TD[playerid][4], 50);
	PlayerTextDrawUseBox(playerid, CALL_TD[playerid][4], 0);
	PlayerTextDrawSetProportional(playerid, CALL_TD[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, CALL_TD[playerid][4], 0);

	CALL_8[playerid] = CreatePlayerTextDraw(playerid, 450.000000, 347.000000, "ld_dual:white");
	PlayerTextDrawFont(playerid, CALL_8[playerid], 4);
	PlayerTextDrawLetterSize(playerid, CALL_8[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, CALL_8[playerid], 38.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, CALL_8[playerid], 1);
	PlayerTextDrawSetShadow(playerid, CALL_8[playerid], 0);
	PlayerTextDrawAlignment(playerid, CALL_8[playerid], 1);
	PlayerTextDrawColor(playerid, CALL_8[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, CALL_8[playerid], 255);
	PlayerTextDrawBoxColor(playerid, CALL_8[playerid], 50);
	PlayerTextDrawUseBox(playerid, CALL_8[playerid], 1);
	PlayerTextDrawSetProportional(playerid, CALL_8[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, CALL_8[playerid], 1);

	CALL_TD[playerid][5] = CreatePlayerTextDraw(playerid, 469.000000, 350.500000, "8");
	PlayerTextDrawFont(playerid, CALL_TD[playerid][5], 1);
	PlayerTextDrawLetterSize(playerid, CALL_TD[playerid][5], 0.199997, 1.149999);
	PlayerTextDrawTextSize(playerid, CALL_TD[playerid][5], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, CALL_TD[playerid][5], 0);
	PlayerTextDrawSetShadow(playerid, CALL_TD[playerid][5], 0);
	PlayerTextDrawAlignment(playerid, CALL_TD[playerid][5], 2);
	PlayerTextDrawColor(playerid, CALL_TD[playerid][5], 255);
	PlayerTextDrawBackgroundColor(playerid, CALL_TD[playerid][5], 255);
	PlayerTextDrawBoxColor(playerid, CALL_TD[playerid][5], 50);
	PlayerTextDrawUseBox(playerid, CALL_TD[playerid][5], 0);
	PlayerTextDrawSetProportional(playerid, CALL_TD[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, CALL_TD[playerid][5], 0);

	CALL_5[playerid] = CreatePlayerTextDraw(playerid, 450.000000, 330.000000, "ld_dual:white");
	PlayerTextDrawFont(playerid, CALL_5[playerid], 4);
	PlayerTextDrawLetterSize(playerid, CALL_5[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, CALL_5[playerid], 38.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, CALL_5[playerid], 1);
	PlayerTextDrawSetShadow(playerid, CALL_5[playerid], 0);
	PlayerTextDrawAlignment(playerid, CALL_5[playerid], 1);
	PlayerTextDrawColor(playerid, CALL_5[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, CALL_5[playerid], 255);
	PlayerTextDrawBoxColor(playerid, CALL_5[playerid], 50);
	PlayerTextDrawUseBox(playerid, CALL_5[playerid], 1);
	PlayerTextDrawSetProportional(playerid, CALL_5[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, CALL_5[playerid], 1);

	CALL_TD[playerid][6] = CreatePlayerTextDraw(playerid, 469.000000, 333.500000, "5");
	PlayerTextDrawFont(playerid, CALL_TD[playerid][6], 1);
	PlayerTextDrawLetterSize(playerid, CALL_TD[playerid][6], 0.199997, 1.149999);
	PlayerTextDrawTextSize(playerid, CALL_TD[playerid][6], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, CALL_TD[playerid][6], 0);
	PlayerTextDrawSetShadow(playerid, CALL_TD[playerid][6], 0);
	PlayerTextDrawAlignment(playerid, CALL_TD[playerid][6], 2);
	PlayerTextDrawColor(playerid, CALL_TD[playerid][6], 255);
	PlayerTextDrawBackgroundColor(playerid, CALL_TD[playerid][6], 255);
	PlayerTextDrawBoxColor(playerid, CALL_TD[playerid][6], 50);
	PlayerTextDrawUseBox(playerid, CALL_TD[playerid][6], 0);
	PlayerTextDrawSetProportional(playerid, CALL_TD[playerid][6], 1);
	PlayerTextDrawSetSelectable(playerid, CALL_TD[playerid][6], 0);

	CALL_2[playerid] = CreatePlayerTextDraw(playerid, 450.000000, 313.000000, "ld_dual:white");
	PlayerTextDrawFont(playerid, CALL_2[playerid], 4);
	PlayerTextDrawLetterSize(playerid, CALL_2[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, CALL_2[playerid], 38.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, CALL_2[playerid], 1);
	PlayerTextDrawSetShadow(playerid, CALL_2[playerid], 0);
	PlayerTextDrawAlignment(playerid, CALL_2[playerid], 1);
	PlayerTextDrawColor(playerid, CALL_2[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, CALL_2[playerid], 255);
	PlayerTextDrawBoxColor(playerid, CALL_2[playerid], 50);
	PlayerTextDrawUseBox(playerid, CALL_2[playerid], 1);
	PlayerTextDrawSetProportional(playerid, CALL_2[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, CALL_2[playerid], 1);

	CALL_TD[playerid][7] = CreatePlayerTextDraw(playerid, 471.000000, 316.500000, "2");
	PlayerTextDrawFont(playerid, CALL_TD[playerid][7], 1);
	PlayerTextDrawLetterSize(playerid, CALL_TD[playerid][7], 0.199997, 1.149999);
	PlayerTextDrawTextSize(playerid, CALL_TD[playerid][7], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, CALL_TD[playerid][7], 0);
	PlayerTextDrawSetShadow(playerid, CALL_TD[playerid][7], 0);
	PlayerTextDrawAlignment(playerid, CALL_TD[playerid][7], 3);
	PlayerTextDrawColor(playerid, CALL_TD[playerid][7], 255);
	PlayerTextDrawBackgroundColor(playerid, CALL_TD[playerid][7], 255);
	PlayerTextDrawBoxColor(playerid, CALL_TD[playerid][7], 50);
	PlayerTextDrawUseBox(playerid, CALL_TD[playerid][7], 0);
	PlayerTextDrawSetProportional(playerid, CALL_TD[playerid][7], 1);
	PlayerTextDrawSetSelectable(playerid, CALL_TD[playerid][7], 0);

	CALL_1[playerid] = CreatePlayerTextDraw(playerid, 428.000000, 313.000000, "ld_dual:white");
	PlayerTextDrawFont(playerid, CALL_1[playerid], 4);
	PlayerTextDrawLetterSize(playerid, CALL_1[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, CALL_1[playerid], 22.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, CALL_1[playerid], 1);
	PlayerTextDrawSetShadow(playerid, CALL_1[playerid], 0);
	PlayerTextDrawAlignment(playerid, CALL_1[playerid], 1);
	PlayerTextDrawColor(playerid, CALL_1[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, CALL_1[playerid], 255);
	PlayerTextDrawBoxColor(playerid, CALL_1[playerid], 50);
	PlayerTextDrawUseBox(playerid, CALL_1[playerid], 1);
	PlayerTextDrawSetProportional(playerid, CALL_1[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, CALL_1[playerid], 1);

	CALL_TD[playerid][8] = CreatePlayerTextDraw(playerid, 440.000000, 316.500000, "1");
	PlayerTextDrawFont(playerid, CALL_TD[playerid][8], 1);
	PlayerTextDrawLetterSize(playerid, CALL_TD[playerid][8], 0.199997, 1.149999);
	PlayerTextDrawTextSize(playerid, CALL_TD[playerid][8], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, CALL_TD[playerid][8], 0);
	PlayerTextDrawSetShadow(playerid, CALL_TD[playerid][8], 0);
	PlayerTextDrawAlignment(playerid, CALL_TD[playerid][8], 3);
	PlayerTextDrawColor(playerid, CALL_TD[playerid][8], 255);
	PlayerTextDrawBackgroundColor(playerid, CALL_TD[playerid][8], 255);
	PlayerTextDrawBoxColor(playerid, CALL_TD[playerid][8], 50);
	PlayerTextDrawUseBox(playerid, CALL_TD[playerid][8], 0);
	PlayerTextDrawSetProportional(playerid, CALL_TD[playerid][8], 1);
	PlayerTextDrawSetSelectable(playerid, CALL_TD[playerid][8], 0);

	CALL_3[playerid] = CreatePlayerTextDraw(playerid, 488.500000, 313.000000, "ld_dual:white");
	PlayerTextDrawFont(playerid, CALL_3[playerid], 4);
	PlayerTextDrawLetterSize(playerid, CALL_3[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, CALL_3[playerid], 22.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, CALL_3[playerid], 1);
	PlayerTextDrawSetShadow(playerid, CALL_3[playerid], 0);
	PlayerTextDrawAlignment(playerid, CALL_3[playerid], 1);
	PlayerTextDrawColor(playerid, CALL_3[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, CALL_3[playerid], 255);
	PlayerTextDrawBoxColor(playerid, CALL_3[playerid], 50);
	PlayerTextDrawUseBox(playerid, CALL_3[playerid], 1);
	PlayerTextDrawSetProportional(playerid, CALL_3[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, CALL_3[playerid], 1);

	CALL_TD[playerid][9] = CreatePlayerTextDraw(playerid, 501.000000, 316.500000, "3");
	PlayerTextDrawFont(playerid, CALL_TD[playerid][9], 1);
	PlayerTextDrawLetterSize(playerid, CALL_TD[playerid][9], 0.199997, 1.149999);
	PlayerTextDrawTextSize(playerid, CALL_TD[playerid][9], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, CALL_TD[playerid][9], 0);
	PlayerTextDrawSetShadow(playerid, CALL_TD[playerid][9], 0);
	PlayerTextDrawAlignment(playerid, CALL_TD[playerid][9], 3);
	PlayerTextDrawColor(playerid, CALL_TD[playerid][9], 255);
	PlayerTextDrawBackgroundColor(playerid, CALL_TD[playerid][9], 255);
	PlayerTextDrawBoxColor(playerid, CALL_TD[playerid][9], 50);
	PlayerTextDrawUseBox(playerid, CALL_TD[playerid][9], 0);
	PlayerTextDrawSetProportional(playerid, CALL_TD[playerid][9], 1);
	PlayerTextDrawSetSelectable(playerid, CALL_TD[playerid][9], 0);

	CALL_6[playerid] = CreatePlayerTextDraw(playerid, 488.500000, 330.000000, "ld_dual:white");
	PlayerTextDrawFont(playerid, CALL_6[playerid], 4);
	PlayerTextDrawLetterSize(playerid, CALL_6[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, CALL_6[playerid], 22.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, CALL_6[playerid], 1);
	PlayerTextDrawSetShadow(playerid, CALL_6[playerid], 0);
	PlayerTextDrawAlignment(playerid, CALL_6[playerid], 1);
	PlayerTextDrawColor(playerid, CALL_6[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, CALL_6[playerid], 255);
	PlayerTextDrawBoxColor(playerid, CALL_6[playerid], 50);
	PlayerTextDrawUseBox(playerid, CALL_6[playerid], 1);
	PlayerTextDrawSetProportional(playerid, CALL_6[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, CALL_6[playerid], 1);

	CALL_TD[playerid][10] = CreatePlayerTextDraw(playerid, 501.000000, 332.500000, "6");
	PlayerTextDrawFont(playerid, CALL_TD[playerid][10], 1);
	PlayerTextDrawLetterSize(playerid, CALL_TD[playerid][10], 0.199997, 1.149999);
	PlayerTextDrawTextSize(playerid, CALL_TD[playerid][10], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, CALL_TD[playerid][10], 0);
	PlayerTextDrawSetShadow(playerid, CALL_TD[playerid][10], 0);
	PlayerTextDrawAlignment(playerid, CALL_TD[playerid][10], 3);
	PlayerTextDrawColor(playerid, CALL_TD[playerid][10], 255);
	PlayerTextDrawBackgroundColor(playerid, CALL_TD[playerid][10], 255);
	PlayerTextDrawBoxColor(playerid, CALL_TD[playerid][10], 50);
	PlayerTextDrawUseBox(playerid, CALL_TD[playerid][10], 0);
	PlayerTextDrawSetProportional(playerid, CALL_TD[playerid][10], 1);
	PlayerTextDrawSetSelectable(playerid, CALL_TD[playerid][10], 0);

	CALL_9[playerid] = CreatePlayerTextDraw(playerid, 488.500000, 347.000000, "ld_dual:white");
	PlayerTextDrawFont(playerid, CALL_9[playerid], 4);
	PlayerTextDrawLetterSize(playerid, CALL_9[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, CALL_9[playerid], 22.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, CALL_9[playerid], 1);
	PlayerTextDrawSetShadow(playerid, CALL_9[playerid], 0);
	PlayerTextDrawAlignment(playerid, CALL_9[playerid], 1);
	PlayerTextDrawColor(playerid, CALL_9[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, CALL_9[playerid], 255);
	PlayerTextDrawBoxColor(playerid, CALL_9[playerid], 50);
	PlayerTextDrawUseBox(playerid, CALL_9[playerid], 1);
	PlayerTextDrawSetProportional(playerid, CALL_9[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, CALL_9[playerid], 1);

	CALL_TD[playerid][11] = CreatePlayerTextDraw(playerid, 501.000000, 349.500000, "9");
	PlayerTextDrawFont(playerid, CALL_TD[playerid][11], 1);
	PlayerTextDrawLetterSize(playerid, CALL_TD[playerid][11], 0.199997, 1.149999);
	PlayerTextDrawTextSize(playerid, CALL_TD[playerid][11], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, CALL_TD[playerid][11], 0);
	PlayerTextDrawSetShadow(playerid, CALL_TD[playerid][11], 0);
	PlayerTextDrawAlignment(playerid, CALL_TD[playerid][11], 3);
	PlayerTextDrawColor(playerid, CALL_TD[playerid][11], 255);
	PlayerTextDrawBackgroundColor(playerid, CALL_TD[playerid][11], 255);
	PlayerTextDrawBoxColor(playerid, CALL_TD[playerid][11], 50);
	PlayerTextDrawUseBox(playerid, CALL_TD[playerid][11], 0);
	PlayerTextDrawSetProportional(playerid, CALL_TD[playerid][11], 1);
	PlayerTextDrawSetSelectable(playerid, CALL_TD[playerid][11], 0);

	CALL_4[playerid] = CreatePlayerTextDraw(playerid, 428.000000, 330.000000, "ld_dual:white");
	PlayerTextDrawFont(playerid, CALL_4[playerid], 4);
	PlayerTextDrawLetterSize(playerid, CALL_4[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, CALL_4[playerid], 22.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, CALL_4[playerid], 1);
	PlayerTextDrawSetShadow(playerid, CALL_4[playerid], 0);
	PlayerTextDrawAlignment(playerid, CALL_4[playerid], 1);
	PlayerTextDrawColor(playerid, CALL_4[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, CALL_4[playerid], 255);
	PlayerTextDrawBoxColor(playerid, CALL_4[playerid], 50);
	PlayerTextDrawUseBox(playerid, CALL_4[playerid], 1);
	PlayerTextDrawSetProportional(playerid, CALL_4[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, CALL_4[playerid], 1);

	CALL_TD[playerid][12] = CreatePlayerTextDraw(playerid, 441.000000, 331.500000, "4");
	PlayerTextDrawFont(playerid, CALL_TD[playerid][12], 1);
	PlayerTextDrawLetterSize(playerid, CALL_TD[playerid][12], 0.199997, 1.149999);
	PlayerTextDrawTextSize(playerid, CALL_TD[playerid][12], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, CALL_TD[playerid][12], 0);
	PlayerTextDrawSetShadow(playerid, CALL_TD[playerid][12], 0);
	PlayerTextDrawAlignment(playerid, CALL_TD[playerid][12], 3);
	PlayerTextDrawColor(playerid, CALL_TD[playerid][12], 255);
	PlayerTextDrawBackgroundColor(playerid, CALL_TD[playerid][12], 255);
	PlayerTextDrawBoxColor(playerid, CALL_TD[playerid][12], 50);
	PlayerTextDrawUseBox(playerid, CALL_TD[playerid][12], 0);
	PlayerTextDrawSetProportional(playerid, CALL_TD[playerid][12], 1);
	PlayerTextDrawSetSelectable(playerid, CALL_TD[playerid][12], 0);

	CALL_7[playerid] = CreatePlayerTextDraw(playerid, 428.000000, 347.000000, "ld_dual:white");
	PlayerTextDrawFont(playerid, CALL_7[playerid], 4);
	PlayerTextDrawLetterSize(playerid, CALL_7[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, CALL_7[playerid], 22.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, CALL_7[playerid], 1);
	PlayerTextDrawSetShadow(playerid, CALL_7[playerid], 0);
	PlayerTextDrawAlignment(playerid, CALL_7[playerid], 1);
	PlayerTextDrawColor(playerid, CALL_7[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, CALL_7[playerid], 255);
	PlayerTextDrawBoxColor(playerid, CALL_7[playerid], 50);
	PlayerTextDrawUseBox(playerid, CALL_7[playerid], 1);
	PlayerTextDrawSetProportional(playerid, CALL_7[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, CALL_7[playerid], 1);

	CALL_TD[playerid][13] = CreatePlayerTextDraw(playerid, 442.000000, 349.500000, "7");
	PlayerTextDrawFont(playerid, CALL_TD[playerid][13], 1);
	PlayerTextDrawLetterSize(playerid, CALL_TD[playerid][13], 0.199997, 1.149999);
	PlayerTextDrawTextSize(playerid, CALL_TD[playerid][13], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, CALL_TD[playerid][13], 0);
	PlayerTextDrawSetShadow(playerid, CALL_TD[playerid][13], 0);
	PlayerTextDrawAlignment(playerid, CALL_TD[playerid][13], 3);
	PlayerTextDrawColor(playerid, CALL_TD[playerid][13], 255);
	PlayerTextDrawBackgroundColor(playerid, CALL_TD[playerid][13], 255);
	PlayerTextDrawBoxColor(playerid, CALL_TD[playerid][13], 50);
	PlayerTextDrawUseBox(playerid, CALL_TD[playerid][13], 0);
	PlayerTextDrawSetProportional(playerid, CALL_TD[playerid][13], 1);
	PlayerTextDrawSetSelectable(playerid, CALL_TD[playerid][13], 0);

	CALL_TD[playerid][14] = CreatePlayerTextDraw(playerid, 470.000000, 301.500000, "Input_the_number");
	PlayerTextDrawFont(playerid, CALL_TD[playerid][14], 2);
	PlayerTextDrawLetterSize(playerid, CALL_TD[playerid][14], 0.116663, 0.800000);
	PlayerTextDrawTextSize(playerid, CALL_TD[playerid][14], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, CALL_TD[playerid][14], 0);
	PlayerTextDrawSetShadow(playerid, CALL_TD[playerid][14], 0);
	PlayerTextDrawAlignment(playerid, CALL_TD[playerid][14], 2);
	PlayerTextDrawColor(playerid, CALL_TD[playerid][14], 255);
	PlayerTextDrawBackgroundColor(playerid, CALL_TD[playerid][14], 255);
	PlayerTextDrawBoxColor(playerid, CALL_TD[playerid][14], 50);
	PlayerTextDrawUseBox(playerid, CALL_TD[playerid][14], 0);
	PlayerTextDrawSetProportional(playerid, CALL_TD[playerid][14], 1);
	PlayerTextDrawSetSelectable(playerid, CALL_TD[playerid][14], 0);

	CALL_TD[playerid][15] = CreatePlayerTextDraw(playerid, 428.000000, 281.000000, "ld_dual:white");
	PlayerTextDrawFont(playerid, CALL_TD[playerid][15], 4);
	PlayerTextDrawLetterSize(playerid, CALL_TD[playerid][15], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, CALL_TD[playerid][15], 82.500000, 32.000000);
	PlayerTextDrawSetOutline(playerid, CALL_TD[playerid][15], 1);
	PlayerTextDrawSetShadow(playerid, CALL_TD[playerid][15], 0);
	PlayerTextDrawAlignment(playerid, CALL_TD[playerid][15], 1);
	PlayerTextDrawColor(playerid, CALL_TD[playerid][15], -1);
	PlayerTextDrawBackgroundColor(playerid, CALL_TD[playerid][15], 255);
	PlayerTextDrawBoxColor(playerid, CALL_TD[playerid][15], 50);
	PlayerTextDrawUseBox(playerid, CALL_TD[playerid][15], 1);
	PlayerTextDrawSetProportional(playerid, CALL_TD[playerid][15], 1);
	PlayerTextDrawSetSelectable(playerid, CALL_TD[playerid][15], 0);

	CALL_NUMBER[playerid] = CreatePlayerTextDraw(playerid, 470.000000, 287.500000, "081380939412");
	PlayerTextDrawFont(playerid, CALL_NUMBER[playerid], 2);
	PlayerTextDrawLetterSize(playerid, CALL_NUMBER[playerid], 0.116663, 0.800000);
	PlayerTextDrawTextSize(playerid, CALL_NUMBER[playerid], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, CALL_NUMBER[playerid], 0);
	PlayerTextDrawSetShadow(playerid, CALL_NUMBER[playerid], 0);
	PlayerTextDrawAlignment(playerid, CALL_NUMBER[playerid], 2);
	PlayerTextDrawColor(playerid, CALL_NUMBER[playerid], 255);
	PlayerTextDrawBackgroundColor(playerid, CALL_NUMBER[playerid], 255);
	PlayerTextDrawBoxColor(playerid, CALL_NUMBER[playerid], 50);
	PlayerTextDrawUseBox(playerid, CALL_NUMBER[playerid], 0);
	PlayerTextDrawSetProportional(playerid, CALL_NUMBER[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, CALL_NUMBER[playerid], 0);

	CALL_DEL[playerid] = CreatePlayerTextDraw(playerid, 488.500000, 364.000000, "ld_dual:white");
	PlayerTextDrawFont(playerid, CALL_DEL[playerid], 4);
	PlayerTextDrawLetterSize(playerid, CALL_DEL[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, CALL_DEL[playerid], 22.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, CALL_DEL[playerid], 1);
	PlayerTextDrawSetShadow(playerid, CALL_DEL[playerid], 0);
	PlayerTextDrawAlignment(playerid, CALL_DEL[playerid], 1);
	PlayerTextDrawColor(playerid, CALL_DEL[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, CALL_DEL[playerid], 255);
	PlayerTextDrawBoxColor(playerid, CALL_DEL[playerid], 50);
	PlayerTextDrawUseBox(playerid, CALL_DEL[playerid], 1);
	PlayerTextDrawSetProportional(playerid, CALL_DEL[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, CALL_DEL[playerid], 1);

	CALL_TD[playerid][16] = CreatePlayerTextDraw(playerid, 505.000000, 368.500000, "DEL");
	PlayerTextDrawFont(playerid, CALL_TD[playerid][16], 1);
	PlayerTextDrawLetterSize(playerid, CALL_TD[playerid][16], 0.158330, 0.899999);
	PlayerTextDrawTextSize(playerid, CALL_TD[playerid][16], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, CALL_TD[playerid][16], 0);
	PlayerTextDrawSetShadow(playerid, CALL_TD[playerid][16], 0);
	PlayerTextDrawAlignment(playerid, CALL_TD[playerid][16], 3);
	PlayerTextDrawColor(playerid, CALL_TD[playerid][16], 255);
	PlayerTextDrawBackgroundColor(playerid, CALL_TD[playerid][16], 255);
	PlayerTextDrawBoxColor(playerid, CALL_TD[playerid][16], 50);
	PlayerTextDrawUseBox(playerid, CALL_TD[playerid][16], 0);
	PlayerTextDrawSetProportional(playerid, CALL_TD[playerid][16], 1);
	PlayerTextDrawSetSelectable(playerid, CALL_TD[playerid][16], 0);

	CALL_DELALL[playerid] = CreatePlayerTextDraw(playerid, 428.000000, 364.000000, "ld_dual:white");
	PlayerTextDrawFont(playerid, CALL_DELALL[playerid], 4);
	PlayerTextDrawLetterSize(playerid, CALL_DELALL[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, CALL_DELALL[playerid], 22.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, CALL_DELALL[playerid], 1);
	PlayerTextDrawSetShadow(playerid, CALL_DELALL[playerid], 0);
	PlayerTextDrawAlignment(playerid, CALL_DELALL[playerid], 1);
	PlayerTextDrawColor(playerid, CALL_DELALL[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, CALL_DELALL[playerid], 255);
	PlayerTextDrawBoxColor(playerid, CALL_DELALL[playerid], 50);
	PlayerTextDrawUseBox(playerid, CALL_DELALL[playerid], 1);
	PlayerTextDrawSetProportional(playerid, CALL_DELALL[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, CALL_DELALL[playerid], 1);

	CALL_TD[playerid][17] = CreatePlayerTextDraw(playerid, 446.000000, 368.500000, "DELALL");
	PlayerTextDrawFont(playerid, CALL_TD[playerid][17], 1);
	PlayerTextDrawLetterSize(playerid, CALL_TD[playerid][17], 0.124997, 0.899999);
	PlayerTextDrawTextSize(playerid, CALL_TD[playerid][17], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, CALL_TD[playerid][17], 0);
	PlayerTextDrawSetShadow(playerid, CALL_TD[playerid][17], 0);
	PlayerTextDrawAlignment(playerid, CALL_TD[playerid][17], 3);
	PlayerTextDrawColor(playerid, CALL_TD[playerid][17], 255);
	PlayerTextDrawBackgroundColor(playerid, CALL_TD[playerid][17], 255);
	PlayerTextDrawBoxColor(playerid, CALL_TD[playerid][17], 50);
	PlayerTextDrawUseBox(playerid, CALL_TD[playerid][17], 0);
	PlayerTextDrawSetProportional(playerid, CALL_TD[playerid][17], 1);
	PlayerTextDrawSetSelectable(playerid, CALL_TD[playerid][17], 0);

	CALLING_TD[playerid][0] = CreatePlayerTextDraw(playerid, 446.000000, 255.000000, "ld_beat:chit");
	PlayerTextDrawFont(playerid, CALLING_TD[playerid][0], 4);
	PlayerTextDrawLetterSize(playerid, CALLING_TD[playerid][0], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, CALLING_TD[playerid][0], 46.000000, 47.500000);
	PlayerTextDrawSetOutline(playerid, CALLING_TD[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, CALLING_TD[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, CALLING_TD[playerid][0], 1);
	PlayerTextDrawColor(playerid, CALLING_TD[playerid][0], -1279731969);
	PlayerTextDrawBackgroundColor(playerid, CALLING_TD[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, CALLING_TD[playerid][0], 50);
	PlayerTextDrawUseBox(playerid, CALLING_TD[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, CALLING_TD[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, CALLING_TD[playerid][0], 0);

	CALLING_TD[playerid][1] = CreatePlayerTextDraw(playerid, 455.000000, 265.000000, "ld_beat:chit");
	PlayerTextDrawFont(playerid, CALLING_TD[playerid][1], 4);
	PlayerTextDrawLetterSize(playerid, CALLING_TD[playerid][1], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, CALLING_TD[playerid][1], 28.000000, 27.500000);
	PlayerTextDrawSetOutline(playerid, CALLING_TD[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, CALLING_TD[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, CALLING_TD[playerid][1], 1);
	PlayerTextDrawColor(playerid, CALLING_TD[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, CALLING_TD[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, CALLING_TD[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, CALLING_TD[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, CALLING_TD[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, CALLING_TD[playerid][1], 0);

	CALLING_STATUS[playerid] = CreatePlayerTextDraw(playerid, 470.000000, 300.500000, "_");
	PlayerTextDrawFont(playerid, CALLING_STATUS[playerid], 1);
	PlayerTextDrawLetterSize(playerid, CALLING_STATUS[playerid], 0.116663, 0.550000);
	PlayerTextDrawTextSize(playerid, CALLING_STATUS[playerid], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, CALLING_STATUS[playerid], 0);
	PlayerTextDrawSetShadow(playerid, CALLING_STATUS[playerid], 0);
	PlayerTextDrawAlignment(playerid, CALLING_STATUS[playerid], 2);
	PlayerTextDrawColor(playerid, CALLING_STATUS[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, CALLING_STATUS[playerid], 255);
	PlayerTextDrawBoxColor(playerid, CALLING_STATUS[playerid], 50);
	PlayerTextDrawUseBox(playerid, CALLING_STATUS[playerid], 0);
	PlayerTextDrawSetProportional(playerid, CALLING_STATUS[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, CALLING_STATUS[playerid], 0);

	CALLING_NAME[playerid] = CreatePlayerTextDraw(playerid, 469.000000, 308.500000, "_");
	PlayerTextDrawFont(playerid, CALLING_NAME[playerid], 1);
	PlayerTextDrawLetterSize(playerid, CALLING_NAME[playerid], 0.183329, 1.100000);
	PlayerTextDrawTextSize(playerid, CALLING_NAME[playerid], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, CALLING_NAME[playerid], 0);
	PlayerTextDrawSetShadow(playerid, CALLING_NAME[playerid], 0);
	PlayerTextDrawAlignment(playerid, CALLING_NAME[playerid], 2);
	PlayerTextDrawColor(playerid, CALLING_NAME[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, CALLING_NAME[playerid], 255);
	PlayerTextDrawBoxColor(playerid, CALLING_NAME[playerid], 50);
	PlayerTextDrawUseBox(playerid, CALLING_NAME[playerid], 0);
	PlayerTextDrawSetProportional(playerid, CALLING_NAME[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, CALLING_NAME[playerid], 0);

	CALLING_DECLINE[playerid] = CreatePlayerTextDraw(playerid, 454.000000, 364.000000, "ld_beat:chit");
	PlayerTextDrawFont(playerid, CALLING_DECLINE[playerid], 4);
	PlayerTextDrawLetterSize(playerid, CALLING_DECLINE[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, CALLING_DECLINE[playerid], 28.000000, 27.500000);
	PlayerTextDrawSetOutline(playerid, CALLING_DECLINE[playerid], 1);
	PlayerTextDrawSetShadow(playerid, CALLING_DECLINE[playerid], 0);
	PlayerTextDrawAlignment(playerid, CALLING_DECLINE[playerid], 1);
	PlayerTextDrawColor(playerid, CALLING_DECLINE[playerid], -29741313);
	PlayerTextDrawBackgroundColor(playerid, CALLING_DECLINE[playerid], 255);
	PlayerTextDrawBoxColor(playerid, CALLING_DECLINE[playerid], 50);
	PlayerTextDrawUseBox(playerid, CALLING_DECLINE[playerid], 1);
	PlayerTextDrawSetProportional(playerid, CALLING_DECLINE[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, CALLING_DECLINE[playerid], 1);

	CALLING_ACCEPT[playerid] = CreatePlayerTextDraw(playerid, 454.000000, 340.000000, "ld_beat:chit");
	PlayerTextDrawFont(playerid, CALLING_ACCEPT[playerid], 4);
	PlayerTextDrawLetterSize(playerid, CALLING_ACCEPT[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, CALLING_ACCEPT[playerid], 28.000000, 27.500000);
	PlayerTextDrawSetOutline(playerid, CALLING_ACCEPT[playerid], 1);
	PlayerTextDrawSetShadow(playerid, CALLING_ACCEPT[playerid], 0);
	PlayerTextDrawAlignment(playerid, CALLING_ACCEPT[playerid], 1);
	PlayerTextDrawColor(playerid, CALLING_ACCEPT[playerid], 818945535);
	PlayerTextDrawBackgroundColor(playerid, CALLING_ACCEPT[playerid], 255);
	PlayerTextDrawBoxColor(playerid, CALLING_ACCEPT[playerid], 50);
	PlayerTextDrawUseBox(playerid, CALLING_ACCEPT[playerid], 1);
	PlayerTextDrawSetProportional(playerid, CALLING_ACCEPT[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, CALLING_ACCEPT[playerid], 1);


    PHONEBANK_TD[playerid][0] = CreatePlayerTextDraw(playerid, 428.000000, 240.500000, "ld_dual:white");
    PlayerTextDrawFont(playerid, PHONEBANK_TD[playerid][0], 4);
    PlayerTextDrawLetterSize(playerid, PHONEBANK_TD[playerid][0], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, PHONEBANK_TD[playerid][0], 82.500000, 13.500000);
    PlayerTextDrawSetOutline(playerid, PHONEBANK_TD[playerid][0], 1);
    PlayerTextDrawSetShadow(playerid, PHONEBANK_TD[playerid][0], 0);
    PlayerTextDrawAlignment(playerid, PHONEBANK_TD[playerid][0], 1);
    PlayerTextDrawColor(playerid, PHONEBANK_TD[playerid][0], 631567359);
    PlayerTextDrawBackgroundColor(playerid, PHONEBANK_TD[playerid][0], 255);
    PlayerTextDrawBoxColor(playerid, PHONEBANK_TD[playerid][0], 50);
    PlayerTextDrawUseBox(playerid, PHONEBANK_TD[playerid][0], 1);
    PlayerTextDrawSetProportional(playerid, PHONEBANK_TD[playerid][0], 1);
    PlayerTextDrawSetSelectable(playerid, PHONEBANK_TD[playerid][0], 0);

    PHONEBANK_TD[playerid][1] = CreatePlayerTextDraw(playerid, 428.000000, 241.000000, "ld_dual:white");
    PlayerTextDrawFont(playerid, PHONEBANK_TD[playerid][1], 4);
    PlayerTextDrawLetterSize(playerid, PHONEBANK_TD[playerid][1], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, PHONEBANK_TD[playerid][1], 18.000000, 12.500000);
    PlayerTextDrawSetOutline(playerid, PHONEBANK_TD[playerid][1], 1);
    PlayerTextDrawSetShadow(playerid, PHONEBANK_TD[playerid][1], 0);
    PlayerTextDrawAlignment(playerid, PHONEBANK_TD[playerid][1], 1);
    PlayerTextDrawColor(playerid, PHONEBANK_TD[playerid][1], 631567359);
    PlayerTextDrawBackgroundColor(playerid, PHONEBANK_TD[playerid][1], 255);
    PlayerTextDrawBoxColor(playerid, PHONEBANK_TD[playerid][1], 50);
    PlayerTextDrawUseBox(playerid, PHONEBANK_TD[playerid][1], 1);
    PlayerTextDrawSetProportional(playerid, PHONEBANK_TD[playerid][1], 1);
    PlayerTextDrawSetSelectable(playerid, PHONEBANK_TD[playerid][1], 1);

    PHONEBANK_TD[playerid][2] = CreatePlayerTextDraw(playerid, 439.000000, 240.500000, "<");
    PlayerTextDrawFont(playerid, PHONEBANK_TD[playerid][2], 1);
    PlayerTextDrawLetterSize(playerid, PHONEBANK_TD[playerid][2], 0.183330, 1.348999);
    PlayerTextDrawTextSize(playerid, PHONEBANK_TD[playerid][2], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, PHONEBANK_TD[playerid][2], 0);
    PlayerTextDrawSetShadow(playerid, PHONEBANK_TD[playerid][2], 0);
    PlayerTextDrawAlignment(playerid, PHONEBANK_TD[playerid][2], 1);
    PlayerTextDrawColor(playerid, PHONEBANK_TD[playerid][2], 255);
    PlayerTextDrawBackgroundColor(playerid, PHONEBANK_TD[playerid][2], 255);
    PlayerTextDrawBoxColor(playerid, PHONEBANK_TD[playerid][2], 50);
    PlayerTextDrawUseBox(playerid, PHONEBANK_TD[playerid][2], 0);
    PlayerTextDrawSetProportional(playerid, PHONEBANK_TD[playerid][2], 1);
    PlayerTextDrawSetSelectable(playerid, PHONEBANK_TD[playerid][2], 0);

    PHONEBANK_TD[playerid][3] = CreatePlayerTextDraw(playerid, 432.000000, 265.500000, "ld_dual:white");
    PlayerTextDrawFont(playerid, PHONEBANK_TD[playerid][3], 4);
    PlayerTextDrawLetterSize(playerid, PHONEBANK_TD[playerid][3], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, PHONEBANK_TD[playerid][3], 75.000000, 20.000000);
    PlayerTextDrawSetOutline(playerid, PHONEBANK_TD[playerid][3], 1);
    PlayerTextDrawSetShadow(playerid, PHONEBANK_TD[playerid][3], 0);
    PlayerTextDrawAlignment(playerid, PHONEBANK_TD[playerid][3], 1);
    PlayerTextDrawColor(playerid, PHONEBANK_TD[playerid][3], 724199167);
    PlayerTextDrawBackgroundColor(playerid, PHONEBANK_TD[playerid][3], 255);
    PlayerTextDrawBoxColor(playerid, PHONEBANK_TD[playerid][3], 50);
    PlayerTextDrawUseBox(playerid, PHONEBANK_TD[playerid][3], 1);
    PlayerTextDrawSetProportional(playerid, PHONEBANK_TD[playerid][3], 1);
    PlayerTextDrawSetSelectable(playerid, PHONEBANK_TD[playerid][3], 0);

    PHONEBANK_TD[playerid][4] = CreatePlayerTextDraw(playerid, 437.000000, 268.500000, "Total_Balance");
    PlayerTextDrawFont(playerid, PHONEBANK_TD[playerid][4], 1);
    PlayerTextDrawLetterSize(playerid, PHONEBANK_TD[playerid][4], 0.124996, 0.650000);
    PlayerTextDrawTextSize(playerid, PHONEBANK_TD[playerid][4], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, PHONEBANK_TD[playerid][4], 0);
    PlayerTextDrawSetShadow(playerid, PHONEBANK_TD[playerid][4], 0);
    PlayerTextDrawAlignment(playerid, PHONEBANK_TD[playerid][4], 1);
    PlayerTextDrawColor(playerid, PHONEBANK_TD[playerid][4], -1);
    PlayerTextDrawBackgroundColor(playerid, PHONEBANK_TD[playerid][4], 255);
    PlayerTextDrawBoxColor(playerid, PHONEBANK_TD[playerid][4], 50);
    PlayerTextDrawUseBox(playerid, PHONEBANK_TD[playerid][4], 0);
    PlayerTextDrawSetProportional(playerid, PHONEBANK_TD[playerid][4], 1);
    PlayerTextDrawSetSelectable(playerid, PHONEBANK_TD[playerid][4], 0);

    PHONEBANK_TD[playerid][5] = CreatePlayerTextDraw(playerid, 437.000000, 275.500000, "$0");
    PlayerTextDrawFont(playerid, PHONEBANK_TD[playerid][5], 1);
    PlayerTextDrawLetterSize(playerid, PHONEBANK_TD[playerid][5], 0.124996, 0.650000);
    PlayerTextDrawTextSize(playerid, PHONEBANK_TD[playerid][5], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, PHONEBANK_TD[playerid][5], 0);
    PlayerTextDrawSetShadow(playerid, PHONEBANK_TD[playerid][5], 0);
    PlayerTextDrawAlignment(playerid, PHONEBANK_TD[playerid][5], 1);
    PlayerTextDrawColor(playerid, PHONEBANK_TD[playerid][5], -1061109505);
    PlayerTextDrawBackgroundColor(playerid, PHONEBANK_TD[playerid][5], 255);
    PlayerTextDrawBoxColor(playerid, PHONEBANK_TD[playerid][5], 50);
    PlayerTextDrawUseBox(playerid, PHONEBANK_TD[playerid][5], 0);
    PlayerTextDrawSetProportional(playerid, PHONEBANK_TD[playerid][5], 1);
    PlayerTextDrawSetSelectable(playerid, PHONEBANK_TD[playerid][5], 0);

    PHONEBANK_TD[playerid][6] = CreatePlayerTextDraw(playerid, 432.000000, 288.500000, "ld_dual:white");
    PlayerTextDrawFont(playerid, PHONEBANK_TD[playerid][6], 4);
    PlayerTextDrawLetterSize(playerid, PHONEBANK_TD[playerid][6], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, PHONEBANK_TD[playerid][6], 75.000000, 18.500000);
    PlayerTextDrawSetOutline(playerid, PHONEBANK_TD[playerid][6], 1);
    PlayerTextDrawSetShadow(playerid, PHONEBANK_TD[playerid][6], 0);
    PlayerTextDrawAlignment(playerid, PHONEBANK_TD[playerid][6], 1);
    PlayerTextDrawColor(playerid, PHONEBANK_TD[playerid][6], 724199167);
    PlayerTextDrawBackgroundColor(playerid, PHONEBANK_TD[playerid][6], 255);
    PlayerTextDrawBoxColor(playerid, PHONEBANK_TD[playerid][6], 50);
    PlayerTextDrawUseBox(playerid, PHONEBANK_TD[playerid][6], 1);
    PlayerTextDrawSetProportional(playerid, PHONEBANK_TD[playerid][6], 1);
    PlayerTextDrawSetSelectable(playerid, PHONEBANK_TD[playerid][6], 0);

    PHONEBANK_TD[playerid][7] = CreatePlayerTextDraw(playerid, 432.000000, 310.500000, "ld_dual:white");
    PlayerTextDrawFont(playerid, PHONEBANK_TD[playerid][7], 4);
    PlayerTextDrawLetterSize(playerid, PHONEBANK_TD[playerid][7], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, PHONEBANK_TD[playerid][7], 75.000000, 18.500000);
    PlayerTextDrawSetOutline(playerid, PHONEBANK_TD[playerid][7], 1);
    PlayerTextDrawSetShadow(playerid, PHONEBANK_TD[playerid][7], 0);
    PlayerTextDrawAlignment(playerid, PHONEBANK_TD[playerid][7], 1);
    PlayerTextDrawColor(playerid, PHONEBANK_TD[playerid][7], 724199167);
    PlayerTextDrawBackgroundColor(playerid, PHONEBANK_TD[playerid][7], 255);
    PlayerTextDrawBoxColor(playerid, PHONEBANK_TD[playerid][7], 50);
    PlayerTextDrawUseBox(playerid, PHONEBANK_TD[playerid][7], 1);
    PlayerTextDrawSetProportional(playerid, PHONEBANK_TD[playerid][7], 1);
    PlayerTextDrawSetSelectable(playerid, PHONEBANK_TD[playerid][7], 0);

    PHONEBANK_TD[playerid][8] = CreatePlayerTextDraw(playerid, 432.000000, 347.500000, "ld_dual:white");
    PlayerTextDrawFont(playerid, PHONEBANK_TD[playerid][8], 4);
    PlayerTextDrawLetterSize(playerid, PHONEBANK_TD[playerid][8], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, PHONEBANK_TD[playerid][8], 75.000000, 29.000000);
    PlayerTextDrawSetOutline(playerid, PHONEBANK_TD[playerid][8], 1);
    PlayerTextDrawSetShadow(playerid, PHONEBANK_TD[playerid][8], 0);
    PlayerTextDrawAlignment(playerid, PHONEBANK_TD[playerid][8], 1);
    PlayerTextDrawColor(playerid, PHONEBANK_TD[playerid][8], 724199167);
    PlayerTextDrawBackgroundColor(playerid, PHONEBANK_TD[playerid][8], 255);
    PlayerTextDrawBoxColor(playerid, PHONEBANK_TD[playerid][8], 50);
    PlayerTextDrawUseBox(playerid, PHONEBANK_TD[playerid][8], 1);
    PlayerTextDrawSetProportional(playerid, PHONEBANK_TD[playerid][8], 1);
    PlayerTextDrawSetSelectable(playerid, PHONEBANK_TD[playerid][8], 0);

    PHONEBANK_TF[playerid] = CreatePlayerTextDraw(playerid, 478.000000, 348.500000, "ld_dual:white");
    PlayerTextDrawFont(playerid, PHONEBANK_TF[playerid], 4);
    PlayerTextDrawLetterSize(playerid, PHONEBANK_TF[playerid], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, PHONEBANK_TF[playerid], 27.000000, 26.500000);
    PlayerTextDrawSetOutline(playerid, PHONEBANK_TF[playerid], 1);
    PlayerTextDrawSetShadow(playerid, PHONEBANK_TF[playerid], 0);
    PlayerTextDrawAlignment(playerid, PHONEBANK_TF[playerid], 1);
    PlayerTextDrawColor(playerid, PHONEBANK_TF[playerid], 2053498409);
    PlayerTextDrawBackgroundColor(playerid, PHONEBANK_TF[playerid], 255);
    PlayerTextDrawBoxColor(playerid, PHONEBANK_TF[playerid], 50);
    PlayerTextDrawUseBox(playerid, PHONEBANK_TF[playerid], 1);
    PlayerTextDrawSetProportional(playerid, PHONEBANK_TF[playerid], 1);
    PlayerTextDrawSetSelectable(playerid, PHONEBANK_TF[playerid], 1);

    PHONEBANK_TD[playerid][9] = CreatePlayerTextDraw(playerid, 437.000000, 351.500000, "Recent_Transfer~n~~n~");
    PlayerTextDrawFont(playerid, PHONEBANK_TD[playerid][9], 1);
    PlayerTextDrawLetterSize(playerid, PHONEBANK_TD[playerid][9], 0.124996, 0.650000);
    PlayerTextDrawTextSize(playerid, PHONEBANK_TD[playerid][9], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, PHONEBANK_TD[playerid][9], 0);
    PlayerTextDrawSetShadow(playerid, PHONEBANK_TD[playerid][9], 0);
    PlayerTextDrawAlignment(playerid, PHONEBANK_TD[playerid][9], 1);
    PlayerTextDrawColor(playerid, PHONEBANK_TD[playerid][9], -1);
    PlayerTextDrawBackgroundColor(playerid, PHONEBANK_TD[playerid][9], 255);
    PlayerTextDrawBoxColor(playerid, PHONEBANK_TD[playerid][9], 50);
    PlayerTextDrawUseBox(playerid, PHONEBANK_TD[playerid][9], 0);
    PlayerTextDrawSetProportional(playerid, PHONEBANK_TD[playerid][9], 1);
    PlayerTextDrawSetSelectable(playerid, PHONEBANK_TD[playerid][9], 0);

    PHONEBANK_TD[playerid][10] = CreatePlayerTextDraw(playerid, 437.000000, 313.500000, "Last_Withdraw~n~");
    PlayerTextDrawFont(playerid, PHONEBANK_TD[playerid][10], 1);
    PlayerTextDrawLetterSize(playerid, PHONEBANK_TD[playerid][10], 0.124996, 0.650000);
    PlayerTextDrawTextSize(playerid, PHONEBANK_TD[playerid][10], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, PHONEBANK_TD[playerid][10], 0);
    PlayerTextDrawSetShadow(playerid, PHONEBANK_TD[playerid][10], 0);
    PlayerTextDrawAlignment(playerid, PHONEBANK_TD[playerid][10], 1);
    PlayerTextDrawColor(playerid, PHONEBANK_TD[playerid][10], -1);
    PlayerTextDrawBackgroundColor(playerid, PHONEBANK_TD[playerid][10], 255);
    PlayerTextDrawBoxColor(playerid, PHONEBANK_TD[playerid][10], 50);
    PlayerTextDrawUseBox(playerid, PHONEBANK_TD[playerid][10], 0);
    PlayerTextDrawSetProportional(playerid, PHONEBANK_TD[playerid][10], 1);
    PlayerTextDrawSetSelectable(playerid, PHONEBANK_TD[playerid][10], 0);

    PHONEBANK_TD[playerid][11] = CreatePlayerTextDraw(playerid, 437.000000, 291.500000, "Last_Deposit~n~");
    PlayerTextDrawFont(playerid, PHONEBANK_TD[playerid][11], 1);
    PlayerTextDrawLetterSize(playerid, PHONEBANK_TD[playerid][11], 0.124996, 0.650000);
    PlayerTextDrawTextSize(playerid, PHONEBANK_TD[playerid][11], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, PHONEBANK_TD[playerid][11], 0);
    PlayerTextDrawSetShadow(playerid, PHONEBANK_TD[playerid][11], 0);
    PlayerTextDrawAlignment(playerid, PHONEBANK_TD[playerid][11], 1);
    PlayerTextDrawColor(playerid, PHONEBANK_TD[playerid][11], -1);
    PlayerTextDrawBackgroundColor(playerid, PHONEBANK_TD[playerid][11], 255);
    PlayerTextDrawBoxColor(playerid, PHONEBANK_TD[playerid][11], 50);
    PlayerTextDrawUseBox(playerid, PHONEBANK_TD[playerid][11], 0);
    PlayerTextDrawSetProportional(playerid, PHONEBANK_TD[playerid][11], 1);
    PlayerTextDrawSetSelectable(playerid, PHONEBANK_TD[playerid][11], 0);

    PHONEBANK_TD[playerid][12] = CreatePlayerTextDraw(playerid, 481.500000, 356.500000, "TRANSFER~n~___HERE");
    PlayerTextDrawFont(playerid, PHONEBANK_TD[playerid][12], 1);
    PlayerTextDrawLetterSize(playerid, PHONEBANK_TD[playerid][12], 0.124996, 0.650000);
    PlayerTextDrawTextSize(playerid, PHONEBANK_TD[playerid][12], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, PHONEBANK_TD[playerid][12], 0);
    PlayerTextDrawSetShadow(playerid, PHONEBANK_TD[playerid][12], 0);
    PlayerTextDrawAlignment(playerid, PHONEBANK_TD[playerid][12], 1);
    PlayerTextDrawColor(playerid, PHONEBANK_TD[playerid][12], -1);
    PlayerTextDrawBackgroundColor(playerid, PHONEBANK_TD[playerid][12], 255);
    PlayerTextDrawBoxColor(playerid, PHONEBANK_TD[playerid][12], 50);
    PlayerTextDrawUseBox(playerid, PHONEBANK_TD[playerid][12], 0);
    PlayerTextDrawSetProportional(playerid, PHONEBANK_TD[playerid][12], 1);
    PlayerTextDrawSetSelectable(playerid, PHONEBANK_TD[playerid][12], 0);

	PHONEBANK_TD[playerid][13] = CreatePlayerTextDraw(playerid, 428.000000, 240.500000, "ld_dual:white");
	PlayerTextDrawFont(playerid, PHONEBANK_TD[playerid][13], 4);
	PlayerTextDrawLetterSize(playerid, PHONEBANK_TD[playerid][13], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PHONEBANK_TD[playerid][13], 82.500000, 13.500000);
	PlayerTextDrawSetOutline(playerid, PHONEBANK_TD[playerid][13], 1);
	PlayerTextDrawSetShadow(playerid, PHONEBANK_TD[playerid][13], 0);
	PlayerTextDrawAlignment(playerid, PHONEBANK_TD[playerid][13], 1);
	PlayerTextDrawColor(playerid, PHONEBANK_TD[playerid][13], CreateRGBA(117,89,227, 255));
	PlayerTextDrawBackgroundColor(playerid, PHONEBANK_TD[playerid][13], 255);
	PlayerTextDrawBoxColor(playerid, PHONEBANK_TD[playerid][13], 50);
	PlayerTextDrawUseBox(playerid, PHONEBANK_TD[playerid][13], 1);
	PlayerTextDrawSetProportional(playerid, PHONEBANK_TD[playerid][13], 1);
	PlayerTextDrawSetSelectable(playerid, PHONEBANK_TD[playerid][13], 0);

	PHONEBANK_TD[playerid][14] = CreatePlayerTextDraw(playerid, 469.000000, 244.500000, "M-BANKING");
	PlayerTextDrawFont(playerid, PHONEBANK_TD[playerid][14], 1);
	PlayerTextDrawLetterSize(playerid, PHONEBANK_TD[playerid][14], 0.116663, 0.550000);
	PlayerTextDrawTextSize(playerid, PHONEBANK_TD[playerid][14], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, PHONEBANK_TD[playerid][14], 0);
	PlayerTextDrawSetShadow(playerid, PHONEBANK_TD[playerid][14], 0);
	PlayerTextDrawAlignment(playerid, PHONEBANK_TD[playerid][14], 3);
	PlayerTextDrawColor(playerid, PHONEBANK_TD[playerid][14], -1);
	PlayerTextDrawBackgroundColor(playerid, PHONEBANK_TD[playerid][14], 255);
	PlayerTextDrawBoxColor(playerid, PHONEBANK_TD[playerid][14], 50);
	PlayerTextDrawUseBox(playerid, PHONEBANK_TD[playerid][14], 0);
	PlayerTextDrawSetProportional(playerid, PHONEBANK_TD[playerid][14], 1);
	PlayerTextDrawSetSelectable(playerid, PHONEBANK_TD[playerid][14], 0);

	PHONEBANK_RETURN[playerid] = CreatePlayerTextDraw(playerid, 428.000000, 241.000000, "ld_dual:white");
	PlayerTextDrawFont(playerid, PHONEBANK_RETURN[playerid], 4);
	PlayerTextDrawLetterSize(playerid, PHONEBANK_RETURN[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PHONEBANK_RETURN[playerid], 18.000000, 12.500000);
	PlayerTextDrawSetOutline(playerid, PHONEBANK_RETURN[playerid], 1);
	PlayerTextDrawSetShadow(playerid, PHONEBANK_RETURN[playerid], 0);
	PlayerTextDrawAlignment(playerid, PHONEBANK_RETURN[playerid], 1);
	PlayerTextDrawColor(playerid, PHONEBANK_RETURN[playerid], -256);
	PlayerTextDrawBackgroundColor(playerid, PHONEBANK_RETURN[playerid], 255);
	PlayerTextDrawBoxColor(playerid, PHONEBANK_RETURN[playerid], 50);
	PlayerTextDrawUseBox(playerid, PHONEBANK_RETURN[playerid], 1);
	PlayerTextDrawSetProportional(playerid, PHONEBANK_RETURN[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, PHONEBANK_RETURN[playerid], 1);

	PHONEBANK_TD[playerid][15] = CreatePlayerTextDraw(playerid, 439.000000, 240.500000, "<");
	PlayerTextDrawFont(playerid, PHONEBANK_TD[playerid][15], 1);
	PlayerTextDrawLetterSize(playerid, PHONEBANK_TD[playerid][15], 0.183330, 1.349999);
	PlayerTextDrawTextSize(playerid, PHONEBANK_TD[playerid][15], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, PHONEBANK_TD[playerid][15], 0);
	PlayerTextDrawSetShadow(playerid, PHONEBANK_TD[playerid][15], 0);
	PlayerTextDrawAlignment(playerid, PHONEBANK_TD[playerid][15], 3);
	PlayerTextDrawColor(playerid, PHONEBANK_TD[playerid][15], -1);
	PlayerTextDrawBackgroundColor(playerid, PHONEBANK_TD[playerid][15], 255);
	PlayerTextDrawBoxColor(playerid, PHONEBANK_TD[playerid][15], 50);
	PlayerTextDrawUseBox(playerid, PHONEBANK_TD[playerid][15], 0);
	PlayerTextDrawSetProportional(playerid, PHONEBANK_TD[playerid][15], 1);
	PlayerTextDrawSetSelectable(playerid, PHONEBANK_TD[playerid][15], 1);
}


ShowPhoneBase(playerid) {
	for(new i = 0; i < 12; i++) {
		PlayerTextDrawShow(playerid, PHONE_TD[playerid][i]);
	}

	PlayerTextDrawShow(playerid, PHONE_BATTERY[playerid]);
	PlayerTextDrawShow(playerid, PHONE_DATE[playerid]);
	PlayerTextDrawShow(playerid, PHONE_WALLPAPER[playerid]);
	PlayerTextDrawShow(playerid, PHONE_BAR[playerid]);
}
ShowPhoneApp(playerid) {
	for(new i = 0 ; i < 10; i++) {
		PlayerTextDrawShow(playerid, PHONEAPP_TD[playerid][i]);
	}

	PlayerTextDrawShow(playerid, PHONEAPP_BANK[playerid]);
	PlayerTextDrawShow(playerid, PHONEAPP_CALL[playerid]);
	PlayerTextDrawShow(playerid, PHONEAPP_CARS[playerid]);
	PlayerTextDrawShow(playerid, PHONEAPP_CONTACT[playerid]);
	PlayerTextDrawShow(playerid, PHONEAPP_SMS[playerid]);
	PlayerTextDrawShow(playerid, PHONEAPP_TAXI[playerid]);

}


ShowPhoneCall(playerid) {


	for(new i = 0; i < 18; i++) {
		PlayerTextDrawShow(playerid, CALL_TD[playerid][i]);
	}
	PlayerTextDrawShow(playerid, CALL_NOW[playerid]);
	PlayerTextDrawShow(playerid, CALL_NUMBER[playerid]);
	PlayerTextDrawShow(playerid, CALL_RETURN[playerid]);
	PlayerTextDrawShow(playerid, CALL_0[playerid]);
	PlayerTextDrawShow(playerid, CALL_1[playerid]);
	PlayerTextDrawShow(playerid, CALL_2[playerid]);
	PlayerTextDrawShow(playerid, CALL_3[playerid]);
	PlayerTextDrawShow(playerid, CALL_4[playerid]);
	PlayerTextDrawShow(playerid, CALL_5[playerid]);
	PlayerTextDrawShow(playerid, CALL_6[playerid]);
	PlayerTextDrawShow(playerid, CALL_7[playerid]);
	PlayerTextDrawShow(playerid, CALL_8[playerid]);
	PlayerTextDrawShow(playerid, CALL_9[playerid]);
	PlayerTextDrawShow(playerid, CALL_DEL[playerid]);
	PlayerTextDrawShow(playerid, CALL_DELALL[playerid]);
}

HidePhoneCall(playerid) {

	for(new i = 0; i < 18; i++) {
		PlayerTextDrawHide(playerid, CALL_TD[playerid][i]);
	}
	PlayerTextDrawHide(playerid, CALL_NOW[playerid]);
	PlayerTextDrawHide(playerid, CALL_NUMBER[playerid]);
	PlayerTextDrawHide(playerid, CALL_RETURN[playerid]);
	PlayerTextDrawHide(playerid, CALL_0[playerid]);
	PlayerTextDrawHide(playerid, CALL_1[playerid]);
	PlayerTextDrawHide(playerid, CALL_2[playerid]);
	PlayerTextDrawHide(playerid, CALL_3[playerid]);
	PlayerTextDrawHide(playerid, CALL_4[playerid]);
	PlayerTextDrawHide(playerid, CALL_5[playerid]);
	PlayerTextDrawHide(playerid, CALL_6[playerid]);
	PlayerTextDrawHide(playerid, CALL_7[playerid]);
	PlayerTextDrawHide(playerid, CALL_8[playerid]);
	PlayerTextDrawHide(playerid, CALL_9[playerid]);
	PlayerTextDrawHide(playerid, CALL_DEL[playerid]);
	PlayerTextDrawHide(playerid, CALL_DELALL[playerid]);
}
HidePhoneApp(playerid) {
	for(new i = 0 ; i < 10; i++) {
		PlayerTextDrawHide(playerid, PHONEAPP_TD[playerid][i]);
	}

	PlayerTextDrawHide(playerid, PHONEAPP_BANK[playerid]);
	PlayerTextDrawHide(playerid, PHONEAPP_CALL[playerid]);
	PlayerTextDrawHide(playerid, PHONEAPP_CARS[playerid]);
	PlayerTextDrawHide(playerid, PHONEAPP_CONTACT[playerid]);
	PlayerTextDrawHide(playerid, PHONEAPP_SMS[playerid]);
	PlayerTextDrawHide(playerid, PHONEAPP_TAXI[playerid]);
}

DestroyPhone(playerid) {

	for(new i = 0; i < 12; i++) {
		PlayerTextDrawDestroyEx(playerid, PHONE_TD[playerid][i]);
	}
	
	PlayerTextDrawDestroyEx(playerid, PHONE_WALLPAPER[playerid]);
	PlayerTextDrawDestroyEx(playerid, PHONE_BATTERY[playerid]);
	PlayerTextDrawDestroyEx(playerid, PHONE_DATE[playerid]);
	PlayerTextDrawDestroyEx(playerid, PHONE_BAR[playerid]);

	for(new i = 0 ; i < 10; i++) {
		PlayerTextDrawDestroyEx(playerid, PHONEAPP_TD[playerid][i]);
	}

	PlayerTextDrawDestroyEx(playerid, PHONEAPP_BANK[playerid]);
	PlayerTextDrawDestroyEx(playerid, PHONEAPP_CALL[playerid]);
	PlayerTextDrawDestroyEx(playerid, PHONEAPP_CARS[playerid]);
	PlayerTextDrawDestroyEx(playerid, PHONEAPP_CONTACT[playerid]);
	PlayerTextDrawDestroyEx(playerid, PHONEAPP_SMS[playerid]);
	PlayerTextDrawDestroyEx(playerid, PHONEAPP_TAXI[playerid]);

	for(new i = 0; i < 18; i++) {
		PlayerTextDrawDestroyEx(playerid, CALL_TD[playerid][i]);
	}
	PlayerTextDrawDestroyEx(playerid, CALL_NOW[playerid]);
	PlayerTextDrawDestroyEx(playerid, CALL_NUMBER[playerid]);
	PlayerTextDrawDestroyEx(playerid, CALL_RETURN[playerid]);
	PlayerTextDrawDestroyEx(playerid, CALL_0[playerid]);
	PlayerTextDrawDestroyEx(playerid, CALL_1[playerid]);
	PlayerTextDrawDestroyEx(playerid, CALL_2[playerid]);
	PlayerTextDrawDestroyEx(playerid, CALL_3[playerid]);
	PlayerTextDrawDestroyEx(playerid, CALL_4[playerid]);
	PlayerTextDrawDestroyEx(playerid, CALL_5[playerid]);
	PlayerTextDrawDestroyEx(playerid, CALL_6[playerid]);
	PlayerTextDrawDestroyEx(playerid, CALL_7[playerid]);
	PlayerTextDrawDestroyEx(playerid, CALL_8[playerid]);
	PlayerTextDrawDestroyEx(playerid, CALL_9[playerid]);
	PlayerTextDrawDestroyEx(playerid, CALL_DEL[playerid]);
	PlayerTextDrawDestroyEx(playerid, CALL_DELALL[playerid]);

	PlayerTextDrawDestroy(playerid, CALLING_TD[playerid][0]);
	PlayerTextDrawDestroy(playerid, CALLING_TD[playerid][1]);

	PlayerTextDrawDestroyEx(playerid, CALLING_ACCEPT[playerid]);
	PlayerTextDrawDestroyEx(playerid, CALLING_DECLINE[playerid]);
	PlayerTextDrawDestroyEx(playerid, CALLING_NAME[playerid]);
	PlayerTextDrawDestroyEx(playerid, CALLING_STATUS[playerid]);

	for(new i = 0; i < 16; i++) {
		PlayerTextDrawDestroy(playerid, PHONEBANK_TD[playerid][i]);
	}
	PlayerTextDrawDestroy(playerid, PHONEBANK_TF[playerid]);
	PlayerTextDrawDestroy(playerid, PHONEBANK_RETURN[playerid]);

	for(new i = 0; i < 12; i++) {
		PHONE_TD[playerid][i] = PlayerText:INVALID_TEXT_DRAW;
	}

	PHONE_BATTERY[playerid] = PHONE_DATE[playerid] = PHONE_WALLPAPER[playerid] = PHONE_BAR[playerid] = PlayerText:INVALID_TEXT_DRAW;
}

ShowBank(playerid) {
	for(new i = 0; i < 16; i++) {
		PlayerTextDrawShow(playerid, PHONEBANK_TD[playerid][i]);
	}
	PlayerTextDrawShow(playerid, PHONEBANK_TF[playerid]);
	PlayerTextDrawShow(playerid, PHONEBANK_RETURN[playerid]);
}

HideBank(playerid) {
	for(new i = 0; i < 16; i++) {
		PlayerTextDrawHide(playerid, PHONEBANK_TD[playerid][i]);
	}
	PlayerTextDrawHide(playerid, PHONEBANK_TF[playerid]);
	PlayerTextDrawHide(playerid, PHONEBANK_RETURN[playerid]);
}
ShowCalling(playerid) {
	PlayerTextDrawShow(playerid, CALLING_TD[playerid][0]);
	PlayerTextDrawShow(playerid, CALLING_TD[playerid][1]);
	
	PlayerTextDrawShow(playerid, CALLING_NAME[playerid]);
	PlayerTextDrawShow(playerid, CALLING_STATUS[playerid]);
	PlayerTextDrawShow(playerid, CALLING_DECLINE[playerid]);
}

ShowCalled(playerid) {
	PlayerTextDrawShow(playerid, CALLING_TD[playerid][0]);
	PlayerTextDrawShow(playerid, CALLING_TD[playerid][1]);

	PlayerTextDrawShow(playerid, CALLING_ACCEPT[playerid]);
	PlayerTextDrawShow(playerid, CALLING_DECLINE[playerid]);
	PlayerTextDrawShow(playerid, CALLING_NAME[playerid]);
	PlayerTextDrawShow(playerid, CALLING_STATUS[playerid]);
}

HideCalling(playerid) {
	PlayerTextDrawHide(playerid, CALLING_TD[playerid][0]);
	PlayerTextDrawHide(playerid, CALLING_TD[playerid][1]);

	PlayerTextDrawHide(playerid, CALLING_ACCEPT[playerid]);
	PlayerTextDrawHide(playerid, CALLING_DECLINE[playerid]);
	PlayerTextDrawHide(playerid, CALLING_NAME[playerid]);
	PlayerTextDrawHide(playerid, CALLING_STATUS[playerid]);
}

hook OnPlayerConnect(playerid) {
	for(new i = 0; i < 12; i++) {
		PHONE_TD[playerid][i] = PlayerText:INVALID_TEXT_DRAW;
	}

	PHONE_BATTERY[playerid] = PHONE_DATE[playerid] = PHONE_WALLPAPER[playerid] = PHONE_BAR[playerid] = PlayerText:INVALID_TEXT_DRAW;
}
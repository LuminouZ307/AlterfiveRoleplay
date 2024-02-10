
CreatePlayerHBE_GUI(playerid) {
	HBE_GUI[playerid][0] = CreatePlayerTextDraw(playerid, 26.000000, 428.000000, "ld_dual:white");
	PlayerTextDrawFont(playerid, HBE_GUI[playerid][0], 4);
	PlayerTextDrawLetterSize(playerid, HBE_GUI[playerid][0], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, HBE_GUI[playerid][0], 20.000000, 12.000000);
	PlayerTextDrawSetOutline(playerid, HBE_GUI[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, HBE_GUI[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, HBE_GUI[playerid][0], 1);
	PlayerTextDrawColor(playerid, HBE_GUI[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, HBE_GUI[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, HBE_GUI[playerid][0], 50);
	PlayerTextDrawUseBox(playerid, HBE_GUI[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, HBE_GUI[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, HBE_GUI[playerid][0], 0);

	HBE_GUI[playerid][1] = CreatePlayerTextDraw(playerid, 27.000000, 429.000000, "ld_dual:white");
	PlayerTextDrawFont(playerid, HBE_GUI[playerid][1], 4);
	PlayerTextDrawLetterSize(playerid, HBE_GUI[playerid][1], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, HBE_GUI[playerid][1], 18.000000, 9.500000);
	PlayerTextDrawSetOutline(playerid, HBE_GUI[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, HBE_GUI[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, HBE_GUI[playerid][1], 1);
	PlayerTextDrawColor(playerid, HBE_GUI[playerid][1], 1296911775);
	PlayerTextDrawBackgroundColor(playerid, HBE_GUI[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, HBE_GUI[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, HBE_GUI[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, HBE_GUI[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, HBE_GUI[playerid][1], 0);

	HBE_HP[playerid] = CreatePlayerTextDraw(playerid, 27.000000, 429.000000, "ld_dual:white");
	PlayerTextDrawFont(playerid, HBE_HP[playerid], 4);
	PlayerTextDrawLetterSize(playerid, HBE_HP[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, HBE_HP[playerid], 18.000000, 9.500000);
	PlayerTextDrawSetOutline(playerid, HBE_HP[playerid], 1);
	PlayerTextDrawSetShadow(playerid, HBE_HP[playerid], 0);
	PlayerTextDrawAlignment(playerid, HBE_HP[playerid], 1);
	PlayerTextDrawColor(playerid, HBE_HP[playerid], 1304723711);
	PlayerTextDrawBackgroundColor(playerid, HBE_HP[playerid], 255);
	PlayerTextDrawBoxColor(playerid, HBE_HP[playerid], 50);
	PlayerTextDrawUseBox(playerid, HBE_HP[playerid], 1);
	PlayerTextDrawSetProportional(playerid, HBE_HP[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, HBE_HP[playerid], 0);

	HBE_GUI[playerid][2] = CreatePlayerTextDraw(playerid, 47.000000, 428.000000, "ld_dual:white");
	PlayerTextDrawFont(playerid, HBE_GUI[playerid][2], 4);
	PlayerTextDrawLetterSize(playerid, HBE_GUI[playerid][2], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, HBE_GUI[playerid][2], 20.000000, 12.000000);
	PlayerTextDrawSetOutline(playerid, HBE_GUI[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, HBE_GUI[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, HBE_GUI[playerid][2], 1);
	PlayerTextDrawColor(playerid, HBE_GUI[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, HBE_GUI[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, HBE_GUI[playerid][2], 50);
	PlayerTextDrawUseBox(playerid, HBE_GUI[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, HBE_GUI[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, HBE_GUI[playerid][2], 0);

	HBE_GUI[playerid][3] = CreatePlayerTextDraw(playerid, 48.000000, 429.000000, "ld_dual:white");
	PlayerTextDrawFont(playerid, HBE_GUI[playerid][3], 4);
	PlayerTextDrawLetterSize(playerid, HBE_GUI[playerid][3], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, HBE_GUI[playerid][3], 18.000000, 9.500000);
	PlayerTextDrawSetOutline(playerid, HBE_GUI[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, HBE_GUI[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, HBE_GUI[playerid][3], 1);
	PlayerTextDrawColor(playerid, HBE_GUI[playerid][3], 1296911775);
	PlayerTextDrawBackgroundColor(playerid, HBE_GUI[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, HBE_GUI[playerid][3], 50);
	PlayerTextDrawUseBox(playerid, HBE_GUI[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, HBE_GUI[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, HBE_GUI[playerid][3], 0);

	HBE_AP[playerid] = CreatePlayerTextDraw(playerid, 48.000000, 429.000000, "ld_dual:white");
	PlayerTextDrawFont(playerid, HBE_AP[playerid], 4);
	PlayerTextDrawLetterSize(playerid, HBE_AP[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, HBE_AP[playerid], 18.000000, 9.500000);
	PlayerTextDrawSetOutline(playerid, HBE_AP[playerid], 1);
	PlayerTextDrawSetShadow(playerid, HBE_AP[playerid], 0);
	PlayerTextDrawAlignment(playerid, HBE_AP[playerid], 1);
	PlayerTextDrawColor(playerid, HBE_AP[playerid], -1061109505);
	PlayerTextDrawBackgroundColor(playerid, HBE_AP[playerid], 255);
	PlayerTextDrawBoxColor(playerid, HBE_AP[playerid], 50);
	PlayerTextDrawUseBox(playerid, HBE_AP[playerid], 1);
	PlayerTextDrawSetProportional(playerid, HBE_AP[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, HBE_AP[playerid], 0);

	HBE_GUI[playerid][4] = CreatePlayerTextDraw(playerid, 68.000000, 428.000000, "ld_dual:white");
	PlayerTextDrawFont(playerid, HBE_GUI[playerid][4], 4);
	PlayerTextDrawLetterSize(playerid, HBE_GUI[playerid][4], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, HBE_GUI[playerid][4], 13.000000, 12.000000);
	PlayerTextDrawSetOutline(playerid, HBE_GUI[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, HBE_GUI[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, HBE_GUI[playerid][4], 1);
	PlayerTextDrawColor(playerid, HBE_GUI[playerid][4], -1);
	PlayerTextDrawBackgroundColor(playerid, HBE_GUI[playerid][4], 255);
	PlayerTextDrawBoxColor(playerid, HBE_GUI[playerid][4], 50);
	PlayerTextDrawUseBox(playerid, HBE_GUI[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, HBE_GUI[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, HBE_GUI[playerid][4], 0);

	HBE_GUI[playerid][5] = CreatePlayerTextDraw(playerid, 69.000000, 429.000000, "ld_dual:white");
	PlayerTextDrawFont(playerid, HBE_GUI[playerid][5], 4);
	PlayerTextDrawLetterSize(playerid, HBE_GUI[playerid][5], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, HBE_GUI[playerid][5], 11.000000, 9.500000);
	PlayerTextDrawSetOutline(playerid, HBE_GUI[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, HBE_GUI[playerid][5], 0);
	PlayerTextDrawAlignment(playerid, HBE_GUI[playerid][5], 1);
	PlayerTextDrawColor(playerid, HBE_GUI[playerid][5], 1296911775);
	PlayerTextDrawBackgroundColor(playerid, HBE_GUI[playerid][5], 255);
	PlayerTextDrawBoxColor(playerid, HBE_GUI[playerid][5], 50);
	PlayerTextDrawUseBox(playerid, HBE_GUI[playerid][5], 1);
	PlayerTextDrawSetProportional(playerid, HBE_GUI[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, HBE_GUI[playerid][5], 0);

	HBE_HUNGER[playerid] = CreatePlayerTextDraw(playerid, 69.000000, 438.500000, "ld_dual:white");
	PlayerTextDrawFont(playerid, HBE_HUNGER[playerid], 4);
	PlayerTextDrawLetterSize(playerid, HBE_HUNGER[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, HBE_HUNGER[playerid], 11.000000, -9.500000);
	PlayerTextDrawSetOutline(playerid, HBE_HUNGER[playerid], 1);
	PlayerTextDrawSetShadow(playerid, HBE_HUNGER[playerid], 0);
	PlayerTextDrawAlignment(playerid, HBE_HUNGER[playerid], 1);
	PlayerTextDrawColor(playerid, HBE_HUNGER[playerid], -493150465);
	PlayerTextDrawBackgroundColor(playerid, HBE_HUNGER[playerid], 255);
	PlayerTextDrawBoxColor(playerid, HBE_HUNGER[playerid], 50);
	PlayerTextDrawUseBox(playerid, HBE_HUNGER[playerid], 1);
	PlayerTextDrawSetProportional(playerid, HBE_HUNGER[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, HBE_HUNGER[playerid], 0);

	HBE_GUI[playerid][6] = CreatePlayerTextDraw(playerid, 82.000000, 428.000000, "ld_dual:white");
	PlayerTextDrawFont(playerid, HBE_GUI[playerid][6], 4);
	PlayerTextDrawLetterSize(playerid, HBE_GUI[playerid][6], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, HBE_GUI[playerid][6], 13.000000, 12.000000);
	PlayerTextDrawSetOutline(playerid, HBE_GUI[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, HBE_GUI[playerid][6], 0);
	PlayerTextDrawAlignment(playerid, HBE_GUI[playerid][6], 1);
	PlayerTextDrawColor(playerid, HBE_GUI[playerid][6], -1);
	PlayerTextDrawBackgroundColor(playerid, HBE_GUI[playerid][6], 255);
	PlayerTextDrawBoxColor(playerid, HBE_GUI[playerid][6], 50);
	PlayerTextDrawUseBox(playerid, HBE_GUI[playerid][6], 1);
	PlayerTextDrawSetProportional(playerid, HBE_GUI[playerid][6], 1);
	PlayerTextDrawSetSelectable(playerid, HBE_GUI[playerid][6], 0);

	HBE_GUI[playerid][7] = CreatePlayerTextDraw(playerid, 83.000000, 429.000000, "ld_dual:white");
	PlayerTextDrawFont(playerid, HBE_GUI[playerid][7], 4);
	PlayerTextDrawLetterSize(playerid, HBE_GUI[playerid][7], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, HBE_GUI[playerid][7], 11.000000, 9.500000);
	PlayerTextDrawSetOutline(playerid, HBE_GUI[playerid][7], 1);
	PlayerTextDrawSetShadow(playerid, HBE_GUI[playerid][7], 0);
	PlayerTextDrawAlignment(playerid, HBE_GUI[playerid][7], 1);
	PlayerTextDrawColor(playerid, HBE_GUI[playerid][7], 1296911775);
	PlayerTextDrawBackgroundColor(playerid, HBE_GUI[playerid][7], 255);
	PlayerTextDrawBoxColor(playerid, HBE_GUI[playerid][7], 50);
	PlayerTextDrawUseBox(playerid, HBE_GUI[playerid][7], 1);
	PlayerTextDrawSetProportional(playerid, HBE_GUI[playerid][7], 1);
	PlayerTextDrawSetSelectable(playerid, HBE_GUI[playerid][7], 0);

	HBE_THIRST[playerid] = CreatePlayerTextDraw(playerid, 83.000000, 438.500000, "ld_dual:white");
	PlayerTextDrawFont(playerid, HBE_THIRST[playerid], 4);
	PlayerTextDrawLetterSize(playerid, HBE_THIRST[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, HBE_THIRST[playerid], 11.000000, -9.500000);
	PlayerTextDrawSetOutline(playerid, HBE_THIRST[playerid], 1);
	PlayerTextDrawSetShadow(playerid, HBE_THIRST[playerid], 0);
	PlayerTextDrawAlignment(playerid, HBE_THIRST[playerid], 1);
	PlayerTextDrawColor(playerid, HBE_THIRST[playerid], 1352519679);
	PlayerTextDrawBackgroundColor(playerid, HBE_THIRST[playerid], 255);
	PlayerTextDrawBoxColor(playerid, HBE_THIRST[playerid], 50);
	PlayerTextDrawUseBox(playerid, HBE_THIRST[playerid], 1);
	PlayerTextDrawSetProportional(playerid, HBE_THIRST[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, HBE_THIRST[playerid], 0);

	HBE_GUI[playerid][8] = CreatePlayerTextDraw(playerid, 33.500000, 431.000000, "HUD:radar_girlfriend");
	PlayerTextDrawFont(playerid, HBE_GUI[playerid][8], 4);
	PlayerTextDrawLetterSize(playerid, HBE_GUI[playerid][8], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, HBE_GUI[playerid][8], 5.000000, 5.000000);
	PlayerTextDrawSetOutline(playerid, HBE_GUI[playerid][8], 1);
	PlayerTextDrawSetShadow(playerid, HBE_GUI[playerid][8], 0);
	PlayerTextDrawAlignment(playerid, HBE_GUI[playerid][8], 1);
	PlayerTextDrawColor(playerid, HBE_GUI[playerid][8], -1);
	PlayerTextDrawBackgroundColor(playerid, HBE_GUI[playerid][8], 255);
	PlayerTextDrawBoxColor(playerid, HBE_GUI[playerid][8], 50);
	PlayerTextDrawUseBox(playerid, HBE_GUI[playerid][8], 1);
	PlayerTextDrawSetProportional(playerid, HBE_GUI[playerid][8], 1);
	PlayerTextDrawSetSelectable(playerid, HBE_GUI[playerid][8], 0);

	HBE_GUI[playerid][9] = CreatePlayerTextDraw(playerid, 54.500000, 431.000000, "HUD:radar_tshirt");
	PlayerTextDrawFont(playerid, HBE_GUI[playerid][9], 4);
	PlayerTextDrawLetterSize(playerid, HBE_GUI[playerid][9], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, HBE_GUI[playerid][9], 5.000000, 5.000000);
	PlayerTextDrawSetOutline(playerid, HBE_GUI[playerid][9], 1);
	PlayerTextDrawSetShadow(playerid, HBE_GUI[playerid][9], 0);
	PlayerTextDrawAlignment(playerid, HBE_GUI[playerid][9], 1);
	PlayerTextDrawColor(playerid, HBE_GUI[playerid][9], 1296911871);
	PlayerTextDrawBackgroundColor(playerid, HBE_GUI[playerid][9], 255);
	PlayerTextDrawBoxColor(playerid, HBE_GUI[playerid][9], 50);
	PlayerTextDrawUseBox(playerid, HBE_GUI[playerid][9], 1);
	PlayerTextDrawSetProportional(playerid, HBE_GUI[playerid][9], 1);
	PlayerTextDrawSetSelectable(playerid, HBE_GUI[playerid][9], 0);

	HBE_GUI[playerid][10] = CreatePlayerTextDraw(playerid, 72.000000, 431.000000, "HUD:radar_burgershot");
	PlayerTextDrawFont(playerid, HBE_GUI[playerid][10], 4);
	PlayerTextDrawLetterSize(playerid, HBE_GUI[playerid][10], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, HBE_GUI[playerid][10], 5.000000, 5.000000);
	PlayerTextDrawSetOutline(playerid, HBE_GUI[playerid][10], 1);
	PlayerTextDrawSetShadow(playerid, HBE_GUI[playerid][10], 0);
	PlayerTextDrawAlignment(playerid, HBE_GUI[playerid][10], 1);
	PlayerTextDrawColor(playerid, HBE_GUI[playerid][10], -1);
	PlayerTextDrawBackgroundColor(playerid, HBE_GUI[playerid][10], 255);
	PlayerTextDrawBoxColor(playerid, HBE_GUI[playerid][10], 50);
	PlayerTextDrawUseBox(playerid, HBE_GUI[playerid][10], 1);
	PlayerTextDrawSetProportional(playerid, HBE_GUI[playerid][10], 1);
	PlayerTextDrawSetSelectable(playerid, HBE_GUI[playerid][10], 0);

	HBE_GUI[playerid][11] = CreatePlayerTextDraw(playerid, 86.000000, 431.000000, "HUD:radar_diner");
	PlayerTextDrawFont(playerid, HBE_GUI[playerid][11], 4);
	PlayerTextDrawLetterSize(playerid, HBE_GUI[playerid][11], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, HBE_GUI[playerid][11], 5.000000, 5.000000);
	PlayerTextDrawSetOutline(playerid, HBE_GUI[playerid][11], 1);
	PlayerTextDrawSetShadow(playerid, HBE_GUI[playerid][11], 0);
	PlayerTextDrawAlignment(playerid, HBE_GUI[playerid][11], 1);
	PlayerTextDrawColor(playerid, HBE_GUI[playerid][11], -1);
	PlayerTextDrawBackgroundColor(playerid, HBE_GUI[playerid][11], 255);
	PlayerTextDrawBoxColor(playerid, HBE_GUI[playerid][11], 50);
	PlayerTextDrawUseBox(playerid, HBE_GUI[playerid][11], 1);
	PlayerTextDrawSetProportional(playerid, HBE_GUI[playerid][11], 1);
	PlayerTextDrawSetSelectable(playerid, HBE_GUI[playerid][11], 0);
}

ShowHBE_GUI(playerid) {

	for(new i = 0; i < 12; i++) {
		PlayerTextDrawShow(playerid, HBE_GUI[playerid][i]);
	}

	PlayerTextDrawShow(playerid, HBE_AP[playerid]);
	PlayerTextDrawShow(playerid, HBE_HP[playerid]);
	PlayerTextDrawShow(playerid, HBE_THIRST[playerid]);
	PlayerTextDrawShow(playerid, HBE_HUNGER[playerid]);
}
UpdateHBE_GUI(playerid) {
	
	new Float:divided, Float:value, Float:armour, Float:health;

	GetPlayerHealth(playerid, health);
	GetPlayerArmourEx(playerid, armour);

	divided = floatdiv(18.000000,100);
	value = floatmul(health, divided);

	PlayerTextDrawTextSize(playerid, HBE_HP[playerid], value, 9.500000);
	PlayerTextDrawShow(playerid, HBE_HP[playerid]);

	divided = floatdiv(18.000000,100);
	value = floatmul(armour, divided);
	
	PlayerTextDrawTextSize(playerid, HBE_AP[playerid], value, 9.500000);
	PlayerTextDrawShow(playerid, HBE_AP[playerid]);

	divided = floatdiv(-9.500000,100);
	value = floatmul(GetPlayerHunger(playerid), divided);
	
	PlayerTextDrawTextSize(playerid, HBE_HUNGER[playerid], 11.000000, value);
	PlayerTextDrawShow(playerid, HBE_HUNGER[playerid]);

	divided = floatdiv(-9.500000,100);
	value = floatmul(GetPlayerThirst(playerid), divided);
	
	PlayerTextDrawTextSize(playerid, HBE_THIRST[playerid], 11.000000, value);
	PlayerTextDrawShow(playerid, HBE_THIRST[playerid]);

}

CMD:zz(playerid, params[]) {
	SetPlayerHunger(playerid, RandomFloat(1.0, 100.0));
	SetPlayerThirst(playerid, RandomFloat(1.0, 100.0));
	SetPlayerHealthEx(playerid, RandomFloat(1.0, 100.0));
	SetPlayerArmourEx(playerid, RandomFloat(1.0, 100.0));
	return 1;
}
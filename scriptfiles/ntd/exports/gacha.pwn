/*
This file was generated by Nickk's TextDraw editor script
Nickk888 is the author of the NTD script
*/

//Variables
new PlayerText:GACHATD[MAX_PLAYERS][7];
new PlayerText:CLOSETD[MAX_PLAYERS];
new PlayerText:GACHANOW[MAX_PLAYERS];
new PlayerText:GACHAPRIZE[MAX_PLAYERS];
new PlayerText:GACHASTATUS[MAX_PLAYERS];
new PlayerText:GACHACD[MAX_PLAYERS];

//Textdraws

//Player Textdraws
	GACHATD[playerid][0] = CreatePlayerTextDraw(playerid, 321.000000, 169.000000, "_");
	PlayerTextDrawFont(playerid, GACHATD[playerid][0], 1);
	PlayerTextDrawLetterSize(playerid, GACHATD[playerid][0], 0.633333, 17.200002);
	PlayerTextDrawTextSize(playerid, GACHATD[playerid][0], 298.500000, 260.000000);
	PlayerTextDrawSetOutline(playerid, GACHATD[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, GACHATD[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, GACHATD[playerid][0], 2);
	PlayerTextDrawColor(playerid, GACHATD[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, GACHATD[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, GACHATD[playerid][0], -1);
	PlayerTextDrawUseBox(playerid, GACHATD[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, GACHATD[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, GACHATD[playerid][0], 0);

	GACHATD[playerid][1] = CreatePlayerTextDraw(playerid, 321.000000, 169.000000, "_");
	PlayerTextDrawFont(playerid, GACHATD[playerid][1], 1);
	PlayerTextDrawLetterSize(playerid, GACHATD[playerid][1], 0.633333, 2.050009);
	PlayerTextDrawTextSize(playerid, GACHATD[playerid][1], 298.500000, 260.000000);
	PlayerTextDrawSetOutline(playerid, GACHATD[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, GACHATD[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, GACHATD[playerid][1], 2);
	PlayerTextDrawColor(playerid, GACHATD[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, GACHATD[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, GACHATD[playerid][1], 1097458175);
	PlayerTextDrawUseBox(playerid, GACHATD[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, GACHATD[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, GACHATD[playerid][1], 0);

	GACHATD[playerid][2] = CreatePlayerTextDraw(playerid, 198.000000, 171.000000, "RV:PP Gacha Event!");
	PlayerTextDrawFont(playerid, GACHATD[playerid][2], 1);
	PlayerTextDrawLetterSize(playerid, GACHATD[playerid][2], 0.270832, 1.450000);
	PlayerTextDrawTextSize(playerid, GACHATD[playerid][2], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, GACHATD[playerid][2], 0);
	PlayerTextDrawSetShadow(playerid, GACHATD[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, GACHATD[playerid][2], 1);
	PlayerTextDrawColor(playerid, GACHATD[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, GACHATD[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, GACHATD[playerid][2], 50);
	PlayerTextDrawUseBox(playerid, GACHATD[playerid][2], 0);
	PlayerTextDrawSetProportional(playerid, GACHATD[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, GACHATD[playerid][2], 0);

	CLOSETD[playerid] = CreatePlayerTextDraw(playerid, 432.000000, 170.000000, "ld_dual:white");
	PlayerTextDrawFont(playerid, CLOSETD[playerid], 4);
	PlayerTextDrawLetterSize(playerid, CLOSETD[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, CLOSETD[playerid], 17.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, CLOSETD[playerid], 1);
	PlayerTextDrawSetShadow(playerid, CLOSETD[playerid], 0);
	PlayerTextDrawAlignment(playerid, CLOSETD[playerid], 1);
	PlayerTextDrawColor(playerid, CLOSETD[playerid], -16776961);
	PlayerTextDrawBackgroundColor(playerid, CLOSETD[playerid], 255);
	PlayerTextDrawBoxColor(playerid, CLOSETD[playerid], 50);
	PlayerTextDrawUseBox(playerid, CLOSETD[playerid], 1);
	PlayerTextDrawSetProportional(playerid, CLOSETD[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, CLOSETD[playerid], 1);

	GACHATD[playerid][3] = CreatePlayerTextDraw(playerid, 436.000000, 171.000000, "X");
	PlayerTextDrawFont(playerid, GACHATD[playerid][3], 1);
	PlayerTextDrawLetterSize(playerid, GACHATD[playerid][3], 0.408333, 1.500000);
	PlayerTextDrawTextSize(playerid, GACHATD[playerid][3], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, GACHATD[playerid][3], 0);
	PlayerTextDrawSetShadow(playerid, GACHATD[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, GACHATD[playerid][3], 1);
	PlayerTextDrawColor(playerid, GACHATD[playerid][3], -1);
	PlayerTextDrawBackgroundColor(playerid, GACHATD[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, GACHATD[playerid][3], 50);
	PlayerTextDrawUseBox(playerid, GACHATD[playerid][3], 0);
	PlayerTextDrawSetProportional(playerid, GACHATD[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, GACHATD[playerid][3], 0);

	GACHATD[playerid][4] = CreatePlayerTextDraw(playerid, 368.000000, 275.000000, "ld_dual:white");
	PlayerTextDrawFont(playerid, GACHATD[playerid][4], 4);
	PlayerTextDrawLetterSize(playerid, GACHATD[playerid][4], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, GACHATD[playerid][4], 75.500000, 40.000000);
	PlayerTextDrawSetOutline(playerid, GACHATD[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, GACHATD[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, GACHATD[playerid][4], 1);
	PlayerTextDrawColor(playerid, GACHATD[playerid][4], 9145343);
	PlayerTextDrawBackgroundColor(playerid, GACHATD[playerid][4], 255);
	PlayerTextDrawBoxColor(playerid, GACHATD[playerid][4], 50);
	PlayerTextDrawUseBox(playerid, GACHATD[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, GACHATD[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, GACHATD[playerid][4], 1);

	GACHANOW[playerid] = CreatePlayerTextDraw(playerid, 378.000000, 283.000000, "GACHA_NOW!");
	PlayerTextDrawFont(playerid, GACHANOW[playerid], 1);
	PlayerTextDrawLetterSize(playerid, GACHANOW[playerid], 0.262499, 2.349999);
	PlayerTextDrawTextSize(playerid, GACHANOW[playerid], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, GACHANOW[playerid], 0);
	PlayerTextDrawSetShadow(playerid, GACHANOW[playerid], 0);
	PlayerTextDrawAlignment(playerid, GACHANOW[playerid], 1);
	PlayerTextDrawColor(playerid, GACHANOW[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, GACHANOW[playerid], 255);
	PlayerTextDrawBoxColor(playerid, GACHANOW[playerid], 50);
	PlayerTextDrawUseBox(playerid, GACHANOW[playerid], 0);
	PlayerTextDrawSetProportional(playerid, GACHANOW[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, GACHANOW[playerid], 0);

	GACHATD[playerid][5] = CreatePlayerTextDraw(playerid, 369.000000, 250.000000, "Click_below_to~n~start_gacha!");
	PlayerTextDrawFont(playerid, GACHATD[playerid][5], 1);
	PlayerTextDrawLetterSize(playerid, GACHATD[playerid][5], 0.183333, 1.100000);
	PlayerTextDrawTextSize(playerid, GACHATD[playerid][5], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, GACHATD[playerid][5], 0);
	PlayerTextDrawSetShadow(playerid, GACHATD[playerid][5], 0);
	PlayerTextDrawAlignment(playerid, GACHATD[playerid][5], 1);
	PlayerTextDrawColor(playerid, GACHATD[playerid][5], 255);
	PlayerTextDrawBackgroundColor(playerid, GACHATD[playerid][5], 255);
	PlayerTextDrawBoxColor(playerid, GACHATD[playerid][5], 50);
	PlayerTextDrawUseBox(playerid, GACHATD[playerid][5], 0);
	PlayerTextDrawSetProportional(playerid, GACHATD[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, GACHATD[playerid][5], 0);

	GACHATD[playerid][6] = CreatePlayerTextDraw(playerid, 262.000000, 201.000000, "_");
	PlayerTextDrawFont(playerid, GACHATD[playerid][6], 1);
	PlayerTextDrawLetterSize(playerid, GACHATD[playerid][6], 0.600000, 3.650003);
	PlayerTextDrawTextSize(playerid, GACHATD[playerid][6], 298.500000, 121.500000);
	PlayerTextDrawSetOutline(playerid, GACHATD[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, GACHATD[playerid][6], 0);
	PlayerTextDrawAlignment(playerid, GACHATD[playerid][6], 2);
	PlayerTextDrawColor(playerid, GACHATD[playerid][6], -1);
	PlayerTextDrawBackgroundColor(playerid, GACHATD[playerid][6], 255);
	PlayerTextDrawBoxColor(playerid, GACHATD[playerid][6], 1296911871);
	PlayerTextDrawUseBox(playerid, GACHATD[playerid][6], 1);
	PlayerTextDrawSetProportional(playerid, GACHATD[playerid][6], 1);
	PlayerTextDrawSetSelectable(playerid, GACHATD[playerid][6], 0);

	GACHAPRIZE[playerid] = CreatePlayerTextDraw(playerid, 262.000000, 209.000000, "Please_wait...");
	PlayerTextDrawFont(playerid, GACHAPRIZE[playerid], 1);
	PlayerTextDrawLetterSize(playerid, GACHAPRIZE[playerid], 0.270832, 1.450000);
	PlayerTextDrawTextSize(playerid, GACHAPRIZE[playerid], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, GACHAPRIZE[playerid], 0);
	PlayerTextDrawSetShadow(playerid, GACHAPRIZE[playerid], 0);
	PlayerTextDrawAlignment(playerid, GACHAPRIZE[playerid], 2);
	PlayerTextDrawColor(playerid, GACHAPRIZE[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, GACHAPRIZE[playerid], 255);
	PlayerTextDrawBoxColor(playerid, GACHAPRIZE[playerid], 50);
	PlayerTextDrawUseBox(playerid, GACHAPRIZE[playerid], 0);
	PlayerTextDrawSetProportional(playerid, GACHAPRIZE[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, GACHAPRIZE[playerid], 0);

	GACHASTATUS[playerid] = CreatePlayerTextDraw(playerid, 199.000000, 284.000000, "Gacha status: ~g~able to gacha!");
	PlayerTextDrawFont(playerid, GACHASTATUS[playerid], 1);
	PlayerTextDrawLetterSize(playerid, GACHASTATUS[playerid], 0.204166, 1.050000);
	PlayerTextDrawTextSize(playerid, GACHASTATUS[playerid], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, GACHASTATUS[playerid], 0);
	PlayerTextDrawSetShadow(playerid, GACHASTATUS[playerid], 0);
	PlayerTextDrawAlignment(playerid, GACHASTATUS[playerid], 1);
	PlayerTextDrawColor(playerid, GACHASTATUS[playerid], 255);
	PlayerTextDrawBackgroundColor(playerid, GACHASTATUS[playerid], 255);
	PlayerTextDrawBoxColor(playerid, GACHASTATUS[playerid], 50);
	PlayerTextDrawUseBox(playerid, GACHASTATUS[playerid], 0);
	PlayerTextDrawSetProportional(playerid, GACHASTATUS[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, GACHASTATUS[playerid], 0);

	GACHACD[playerid] = CreatePlayerTextDraw(playerid, 199.000000, 299.000000, "Gacha_Cooldown:_~r~24_hours");
	PlayerTextDrawFont(playerid, GACHACD[playerid], 1);
	PlayerTextDrawLetterSize(playerid, GACHACD[playerid], 0.204166, 1.050000);
	PlayerTextDrawTextSize(playerid, GACHACD[playerid], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, GACHACD[playerid], 0);
	PlayerTextDrawSetShadow(playerid, GACHACD[playerid], 0);
	PlayerTextDrawAlignment(playerid, GACHACD[playerid], 1);
	PlayerTextDrawColor(playerid, GACHACD[playerid], 255);
	PlayerTextDrawBackgroundColor(playerid, GACHACD[playerid], 255);
	PlayerTextDrawBoxColor(playerid, GACHACD[playerid], 50);
	PlayerTextDrawUseBox(playerid, GACHACD[playerid], 0);
	PlayerTextDrawSetProportional(playerid, GACHACD[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, GACHACD[playerid], 0);


/*Player Progress Bars
Requires "progress2" include by Southclaws
Download: https://github.com/Southclaws/progress2/releases */

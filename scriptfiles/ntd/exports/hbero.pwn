/*
This file was generated by Nickk's TextDraw editor script
Nickk888 is the author of the NTD script
*/

//Variables
new PlayerText:PlayerTD[MAX_PLAYERS][7];
new PlayerText:HUNGER_BAR[MAX_PLAYERS];
new PlayerText:BLADDER_BAR[MAX_PLAYERS];
new PlayerText:ENERGY_BAR[MAX_PLAYERS];

//Textdraws

//Player Textdraws
PlayerTD[playerid][0] = CreatePlayerTextDraw(playerid, 76.000000, 227.000000, "_");
PlayerTextDrawFont(playerid, PlayerTD[playerid][0], 2);
PlayerTextDrawLetterSize(playerid, PlayerTD[playerid][0], 0.079166, 9.649995);
PlayerTextDrawTextSize(playerid, PlayerTD[playerid][0], 5.500000, 64.000000);
PlayerTextDrawSetOutline(playerid, PlayerTD[playerid][0], 0);
PlayerTextDrawSetShadow(playerid, PlayerTD[playerid][0], 0);
PlayerTextDrawAlignment(playerid, PlayerTD[playerid][0], 2);
PlayerTextDrawColor(playerid, PlayerTD[playerid][0], -1);
PlayerTextDrawBackgroundColor(playerid, PlayerTD[playerid][0], 255);
PlayerTextDrawBoxColor(playerid, PlayerTD[playerid][0], 186);
PlayerTextDrawUseBox(playerid, PlayerTD[playerid][0], 1);
PlayerTextDrawSetProportional(playerid, PlayerTD[playerid][0], 1);
PlayerTextDrawSetSelectable(playerid, PlayerTD[playerid][0], 0);

PlayerTD[playerid][1] = CreatePlayerTextDraw(playerid, 47.000000, 221.000000, ".");
PlayerTextDrawFont(playerid, PlayerTD[playerid][1], 1);
PlayerTextDrawLetterSize(playerid, PlayerTD[playerid][1], 0.908333, 3.949999);
PlayerTextDrawTextSize(playerid, PlayerTD[playerid][1], 400.000000, 17.000000);
PlayerTextDrawSetOutline(playerid, PlayerTD[playerid][1], 0);
PlayerTextDrawSetShadow(playerid, PlayerTD[playerid][1], 0);
PlayerTextDrawAlignment(playerid, PlayerTD[playerid][1], 1);
PlayerTextDrawColor(playerid, PlayerTD[playerid][1], -1);
PlayerTextDrawBackgroundColor(playerid, PlayerTD[playerid][1], 255);
PlayerTextDrawBoxColor(playerid, PlayerTD[playerid][1], 50);
PlayerTextDrawUseBox(playerid, PlayerTD[playerid][1], 0);
PlayerTextDrawSetProportional(playerid, PlayerTD[playerid][1], 1);
PlayerTextDrawSetSelectable(playerid, PlayerTD[playerid][1], 0);

PlayerTD[playerid][2] = CreatePlayerTextDraw(playerid, 61.000000, 228.000000, "Hunger");
PlayerTextDrawFont(playerid, PlayerTD[playerid][2], 1);
PlayerTextDrawLetterSize(playerid, PlayerTD[playerid][2], 0.329165, 1.399999);
PlayerTextDrawTextSize(playerid, PlayerTD[playerid][2], 400.000000, 17.000000);
PlayerTextDrawSetOutline(playerid, PlayerTD[playerid][2], 1);
PlayerTextDrawSetShadow(playerid, PlayerTD[playerid][2], 0);
PlayerTextDrawAlignment(playerid, PlayerTD[playerid][2], 1);
PlayerTextDrawColor(playerid, PlayerTD[playerid][2], -1);
PlayerTextDrawBackgroundColor(playerid, PlayerTD[playerid][2], 255);
PlayerTextDrawBoxColor(playerid, PlayerTD[playerid][2], 50);
PlayerTextDrawUseBox(playerid, PlayerTD[playerid][2], 0);
PlayerTextDrawSetProportional(playerid, PlayerTD[playerid][2], 1);
PlayerTextDrawSetSelectable(playerid, PlayerTD[playerid][2], 0);

PlayerTD[playerid][3] = CreatePlayerTextDraw(playerid, 47.000000, 250.000000, ".");
PlayerTextDrawFont(playerid, PlayerTD[playerid][3], 1);
PlayerTextDrawLetterSize(playerid, PlayerTD[playerid][3], 0.908333, 3.949999);
PlayerTextDrawTextSize(playerid, PlayerTD[playerid][3], 400.000000, 17.000000);
PlayerTextDrawSetOutline(playerid, PlayerTD[playerid][3], 0);
PlayerTextDrawSetShadow(playerid, PlayerTD[playerid][3], 0);
PlayerTextDrawAlignment(playerid, PlayerTD[playerid][3], 1);
PlayerTextDrawColor(playerid, PlayerTD[playerid][3], -1);
PlayerTextDrawBackgroundColor(playerid, PlayerTD[playerid][3], 255);
PlayerTextDrawBoxColor(playerid, PlayerTD[playerid][3], 50);
PlayerTextDrawUseBox(playerid, PlayerTD[playerid][3], 0);
PlayerTextDrawSetProportional(playerid, PlayerTD[playerid][3], 1);
PlayerTextDrawSetSelectable(playerid, PlayerTD[playerid][3], 0);

PlayerTD[playerid][4] = CreatePlayerTextDraw(playerid, 61.000000, 255.000000, "Blader");
PlayerTextDrawFont(playerid, PlayerTD[playerid][4], 1);
PlayerTextDrawLetterSize(playerid, PlayerTD[playerid][4], 0.329165, 1.399999);
PlayerTextDrawTextSize(playerid, PlayerTD[playerid][4], 400.000000, 17.000000);
PlayerTextDrawSetOutline(playerid, PlayerTD[playerid][4], 1);
PlayerTextDrawSetShadow(playerid, PlayerTD[playerid][4], 0);
PlayerTextDrawAlignment(playerid, PlayerTD[playerid][4], 1);
PlayerTextDrawColor(playerid, PlayerTD[playerid][4], -1);
PlayerTextDrawBackgroundColor(playerid, PlayerTD[playerid][4], 255);
PlayerTextDrawBoxColor(playerid, PlayerTD[playerid][4], 50);
PlayerTextDrawUseBox(playerid, PlayerTD[playerid][4], 0);
PlayerTextDrawSetProportional(playerid, PlayerTD[playerid][4], 1);
PlayerTextDrawSetSelectable(playerid, PlayerTD[playerid][4], 0);

PlayerTD[playerid][5] = CreatePlayerTextDraw(playerid, 47.000000, 276.000000, ".");
PlayerTextDrawFont(playerid, PlayerTD[playerid][5], 1);
PlayerTextDrawLetterSize(playerid, PlayerTD[playerid][5], 0.908333, 3.949999);
PlayerTextDrawTextSize(playerid, PlayerTD[playerid][5], 400.000000, 17.000000);
PlayerTextDrawSetOutline(playerid, PlayerTD[playerid][5], 0);
PlayerTextDrawSetShadow(playerid, PlayerTD[playerid][5], 0);
PlayerTextDrawAlignment(playerid, PlayerTD[playerid][5], 1);
PlayerTextDrawColor(playerid, PlayerTD[playerid][5], -1);
PlayerTextDrawBackgroundColor(playerid, PlayerTD[playerid][5], 255);
PlayerTextDrawBoxColor(playerid, PlayerTD[playerid][5], 50);
PlayerTextDrawUseBox(playerid, PlayerTD[playerid][5], 0);
PlayerTextDrawSetProportional(playerid, PlayerTD[playerid][5], 1);
PlayerTextDrawSetSelectable(playerid, PlayerTD[playerid][5], 0);

PlayerTD[playerid][6] = CreatePlayerTextDraw(playerid, 61.000000, 282.000000, "Energy");
PlayerTextDrawFont(playerid, PlayerTD[playerid][6], 1);
PlayerTextDrawLetterSize(playerid, PlayerTD[playerid][6], 0.329165, 1.399999);
PlayerTextDrawTextSize(playerid, PlayerTD[playerid][6], 400.000000, 17.000000);
PlayerTextDrawSetOutline(playerid, PlayerTD[playerid][6], 1);
PlayerTextDrawSetShadow(playerid, PlayerTD[playerid][6], 0);
PlayerTextDrawAlignment(playerid, PlayerTD[playerid][6], 1);
PlayerTextDrawColor(playerid, PlayerTD[playerid][6], -1);
PlayerTextDrawBackgroundColor(playerid, PlayerTD[playerid][6], 255);
PlayerTextDrawBoxColor(playerid, PlayerTD[playerid][6], 50);
PlayerTextDrawUseBox(playerid, PlayerTD[playerid][6], 0);
PlayerTextDrawSetProportional(playerid, PlayerTD[playerid][6], 1);
PlayerTextDrawSetSelectable(playerid, PlayerTD[playerid][6], 0);

HUNGER_BAR[playerid] = CreatePlayerTextDraw(playerid, 61.000000, 244.000000, "ld_dual:white");
PlayerTextDrawFont(playerid, HUNGER_BAR[playerid], 4);
PlayerTextDrawLetterSize(playerid, HUNGER_BAR[playerid], 0.600000, 2.000000);
PlayerTextDrawTextSize(playerid, HUNGER_BAR[playerid], 38.500000, 9.000000);
PlayerTextDrawSetOutline(playerid, HUNGER_BAR[playerid], 1);
PlayerTextDrawSetShadow(playerid, HUNGER_BAR[playerid], 0);
PlayerTextDrawAlignment(playerid, HUNGER_BAR[playerid], 1);
PlayerTextDrawColor(playerid, HUNGER_BAR[playerid], 9109759);
PlayerTextDrawBackgroundColor(playerid, HUNGER_BAR[playerid], 255);
PlayerTextDrawBoxColor(playerid, HUNGER_BAR[playerid], 50);
PlayerTextDrawUseBox(playerid, HUNGER_BAR[playerid], 1);
PlayerTextDrawSetProportional(playerid, HUNGER_BAR[playerid], 1);
PlayerTextDrawSetSelectable(playerid, HUNGER_BAR[playerid], 0);

BLADDER_BAR[playerid] = CreatePlayerTextDraw(playerid, 61.000000, 271.000000, "ld_dual:white");
PlayerTextDrawFont(playerid, BLADDER_BAR[playerid], 4);
PlayerTextDrawLetterSize(playerid, BLADDER_BAR[playerid], 0.600000, 2.000000);
PlayerTextDrawTextSize(playerid, BLADDER_BAR[playerid], 38.500000, 9.000000);
PlayerTextDrawSetOutline(playerid, BLADDER_BAR[playerid], 1);
PlayerTextDrawSetShadow(playerid, BLADDER_BAR[playerid], 0);
PlayerTextDrawAlignment(playerid, BLADDER_BAR[playerid], 1);
PlayerTextDrawColor(playerid, BLADDER_BAR[playerid], 9109759);
PlayerTextDrawBackgroundColor(playerid, BLADDER_BAR[playerid], 255);
PlayerTextDrawBoxColor(playerid, BLADDER_BAR[playerid], 50);
PlayerTextDrawUseBox(playerid, BLADDER_BAR[playerid], 1);
PlayerTextDrawSetProportional(playerid, BLADDER_BAR[playerid], 1);
PlayerTextDrawSetSelectable(playerid, BLADDER_BAR[playerid], 0);

ENERGY_BAR[playerid] = CreatePlayerTextDraw(playerid, 61.000000, 298.000000, "ld_dual:white");
PlayerTextDrawFont(playerid, ENERGY_BAR[playerid], 4);
PlayerTextDrawLetterSize(playerid, ENERGY_BAR[playerid], 0.600000, 2.000000);
PlayerTextDrawTextSize(playerid, ENERGY_BAR[playerid], 38.500000, 9.000000);
PlayerTextDrawSetOutline(playerid, ENERGY_BAR[playerid], 1);
PlayerTextDrawSetShadow(playerid, ENERGY_BAR[playerid], 0);
PlayerTextDrawAlignment(playerid, ENERGY_BAR[playerid], 1);
PlayerTextDrawColor(playerid, ENERGY_BAR[playerid], 9109759);
PlayerTextDrawBackgroundColor(playerid, ENERGY_BAR[playerid], 255);
PlayerTextDrawBoxColor(playerid, ENERGY_BAR[playerid], 50);
PlayerTextDrawUseBox(playerid, ENERGY_BAR[playerid], 1);
PlayerTextDrawSetProportional(playerid, ENERGY_BAR[playerid], 1);
PlayerTextDrawSetSelectable(playerid, ENERGY_BAR[playerid], 0);


/*Player Progress Bars
Requires "progress2" include by Southclaws
Download: https://github.com/Southclaws/progress2/releases */
/*
This file was generated by Nickk's TextDraw editor script
Nickk888 is the author of the NTD script
*/

//Variables
new PlayerText:PlayerTD[MAX_PLAYERS][3];

//Textdraws

//Player Textdraws
PlayerTD[playerid][0] = CreatePlayerTextDraw(playerid, 155.000000, 407.000000, "00:00");
PlayerTextDrawFont(playerid, PlayerTD[playerid][0], 1);
PlayerTextDrawLetterSize(playerid, PlayerTD[playerid][0], 0.183333, 0.900000);
PlayerTextDrawTextSize(playerid, PlayerTD[playerid][0], 400.000000, 17.000000);
PlayerTextDrawSetOutline(playerid, PlayerTD[playerid][0], 0);
PlayerTextDrawSetShadow(playerid, PlayerTD[playerid][0], 0);
PlayerTextDrawAlignment(playerid, PlayerTD[playerid][0], 1);
PlayerTextDrawColor(playerid, PlayerTD[playerid][0], -1);
PlayerTextDrawBackgroundColor(playerid, PlayerTD[playerid][0], 255);
PlayerTextDrawBoxColor(playerid, PlayerTD[playerid][0], 50);
PlayerTextDrawUseBox(playerid, PlayerTD[playerid][0], 0);
PlayerTextDrawSetProportional(playerid, PlayerTD[playerid][0], 1);
PlayerTextDrawSetSelectable(playerid, PlayerTD[playerid][0], 0);

PlayerTD[playerid][1] = CreatePlayerTextDraw(playerid, 155.000000, 416.000000, "100 ~r~KMH ~w~100 ~r~FUEL");
PlayerTextDrawFont(playerid, PlayerTD[playerid][1], 1);
PlayerTextDrawLetterSize(playerid, PlayerTD[playerid][1], 0.183333, 0.900000);
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

PlayerTD[playerid][2] = CreatePlayerTextDraw(playerid, 155.000000, 425.000000, "~y~NE ~w~I Los Santos I Ganton Street");
PlayerTextDrawFont(playerid, PlayerTD[playerid][2], 1);
PlayerTextDrawLetterSize(playerid, PlayerTD[playerid][2], 0.183333, 0.900000);
PlayerTextDrawTextSize(playerid, PlayerTD[playerid][2], 400.000000, 17.000000);
PlayerTextDrawSetOutline(playerid, PlayerTD[playerid][2], 0);
PlayerTextDrawSetShadow(playerid, PlayerTD[playerid][2], 0);
PlayerTextDrawAlignment(playerid, PlayerTD[playerid][2], 1);
PlayerTextDrawColor(playerid, PlayerTD[playerid][2], -1);
PlayerTextDrawBackgroundColor(playerid, PlayerTD[playerid][2], 255);
PlayerTextDrawBoxColor(playerid, PlayerTD[playerid][2], 50);
PlayerTextDrawUseBox(playerid, PlayerTD[playerid][2], 0);
PlayerTextDrawSetProportional(playerid, PlayerTD[playerid][2], 1);
PlayerTextDrawSetSelectable(playerid, PlayerTD[playerid][2], 0);


/*Player Progress Bars
Requires "progress2" include by Southclaws
Download: https://github.com/Southclaws/progress2/releases */
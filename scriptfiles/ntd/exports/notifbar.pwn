/*
This file was generated by Nickk's TextDraw editor script
Nickk888 is the author of the NTD script
*/

//Variables
new PlayerText:PlayerTD[MAX_PLAYERS][2];

//Textdraws

//Player Textdraws
PlayerTD[playerid][0] = CreatePlayerTextDraw(playerid, 74.000000, 227.000000, "_");
PlayerTextDrawFont(playerid, PlayerTD[playerid][0], 1);
PlayerTextDrawLetterSize(playerid, PlayerTD[playerid][0], 0.587500, 1.150002);
PlayerTextDrawTextSize(playerid, PlayerTD[playerid][0], 298.500000, 107.000000);
PlayerTextDrawSetOutline(playerid, PlayerTD[playerid][0], 1);
PlayerTextDrawSetShadow(playerid, PlayerTD[playerid][0], 0);
PlayerTextDrawAlignment(playerid, PlayerTD[playerid][0], 2);
PlayerTextDrawColor(playerid, PlayerTD[playerid][0], -1);
PlayerTextDrawBackgroundColor(playerid, PlayerTD[playerid][0], 255);
PlayerTextDrawBoxColor(playerid, PlayerTD[playerid][0], 99);
PlayerTextDrawUseBox(playerid, PlayerTD[playerid][0], 1);
PlayerTextDrawSetProportional(playerid, PlayerTD[playerid][0], 1);
PlayerTextDrawSetSelectable(playerid, PlayerTD[playerid][0], 0);

PlayerTD[playerid][1] = CreatePlayerTextDraw(playerid, 24.000000, 228.500000, "asdsadsadasdhsadghsadasdsasdasdaaasdsd");
PlayerTextDrawFont(playerid, PlayerTD[playerid][1], 1);
PlayerTextDrawLetterSize(playerid, PlayerTD[playerid][1], 0.145833, 0.700000);
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


/*Player Progress Bars
Requires "progress2" include by Southclaws
Download: https://github.com/Southclaws/progress2/releases */
/*
This file was generated by Nickk's TextDraw editor script
Nickk888 is the author of the NTD script
*/

//Variables
new PlayerText:CASHTD[MAX_PLAYERS];

//Textdraws
//Player Textdraws
CASHTD[playerid] = CreatePlayerTextDraw(playerid, 607.000000, 106.000000, "");
PlayerTextDrawFont(playerid, CASHTD[playerid], 3);
PlayerTextDrawLetterSize(playerid, CASHTD[playerid], 0.254166, 1.250000);
PlayerTextDrawTextSize(playerid, CASHTD[playerid], 400.000000, 17.000000);
PlayerTextDrawSetOutline(playerid, CASHTD[playerid], 1);
PlayerTextDrawSetShadow(playerid, CASHTD[playerid], 0);
PlayerTextDrawAlignment(playerid, CASHTD[playerid], 3);
PlayerTextDrawColor(playerid, CASHTD[playerid], -1);
PlayerTextDrawBackgroundColor(playerid, CASHTD[playerid], 255);
PlayerTextDrawBoxColor(playerid, CASHTD[playerid], 50);
PlayerTextDrawUseBox(playerid, CASHTD[playerid], 0);
PlayerTextDrawSetProportional(playerid, CASHTD[playerid], 1);
PlayerTextDrawSetSelectable(playerid, CASHTD[playerid], 0);


/*Player Progress Bars
Requires "progress2" include by Southclaws
Download: https://github.com/Southclaws/progress2/releases */
/*
This file was generated by Nickk's TextDraw editor script
Nickk888 is the author of the NTD script
*/

//Variables
new PlayerText:PlayerTD[MAX_PLAYERS][1];

//Textdraws

//Player Textdraws
LOGOTD[playerid] = CreatePlayerTextDraw(playerid, 275.000000, 5.000000, "Orang_Tua_Community");
PlayerTextDrawFont(playerid, LOGOTD[playerid], 1);
PlayerTextDrawLetterSize(playerid, LOGOTD[playerid], 0.212500, 1.050000);
PlayerTextDrawTextSize(playerid, LOGOTD[playerid], 400.000000, 17.000000);
PlayerTextDrawSetOutline(playerid, LOGOTD[playerid], 1);
PlayerTextDrawSetShadow(playerid, LOGOTD[playerid], 0);
PlayerTextDrawAlignment(playerid, LOGOTD[playerid], 1);
PlayerTextDrawColor(playerid, LOGOTD[playerid], -1);
PlayerTextDrawBackgroundColor(playerid, LOGOTD[playerid], 255);
PlayerTextDrawBoxColor(playerid, LOGOTD[playerid], 50);
PlayerTextDrawUseBox(playerid, LOGOTD[playerid], 0);
PlayerTextDrawSetProportional(playerid, LOGOTD[playerid], 1);
PlayerTextDrawSetSelectable(playerid, LOGOTD[playerid], 0);


/*Player Progress Bars
Requires "progress2" include by Southclaws
Download: https://github.com/Southclaws/progress2/releases */
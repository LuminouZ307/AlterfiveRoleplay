/*
This file was generated by Nickk's TextDraw editor script
Nickk888 is the author of the NTD script
*/

//Variables
new PlayerText:LOBBYTD[MAX_PLAYERS];

//Textdraws

//Player Textdraws
LOBBYTD[playerid] = CreatePlayerTextDraw(playerid, 2.000000, 434.000000, "LOBBY:_2");
PlayerTextDrawFont(playerid, LOBBYTD[playerid], 2);
PlayerTextDrawLetterSize(playerid, LOBBYTD[playerid], 0.183333, 1.250000);
PlayerTextDrawTextSize(playerid, LOBBYTD[playerid], 400.000000, 17.000000);
PlayerTextDrawSetOutline(playerid, LOBBYTD[playerid], 0);
PlayerTextDrawSetShadow(playerid, LOBBYTD[playerid], 0);
PlayerTextDrawAlignment(playerid, LOBBYTD[playerid], 1);
PlayerTextDrawColor(playerid, LOBBYTD[playerid], -1);
PlayerTextDrawBackgroundColor(playerid, LOBBYTD[playerid], 255);
PlayerTextDrawBoxColor(playerid, LOBBYTD[playerid], 50);
PlayerTextDrawUseBox(playerid, LOBBYTD[playerid], 0);
PlayerTextDrawSetProportional(playerid, LOBBYTD[playerid], 1);
PlayerTextDrawSetSelectable(playerid, LOBBYTD[playerid], 0);

OnPlayerRequestClass(playerid, classid)
/*Player Progress Bars
Requires "progress2" include by Southclaws
Download: https://github.com/Southclaws/progress2/releases */

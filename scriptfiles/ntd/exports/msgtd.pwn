/*
This file was generated by Nickk's TextDraw editor script
Nickk888 is the author of the NTD script
*/

//Variables
new PlayerText:MSGTD[MAX_PLAYERS];

//Textdraws

//Player Textdraws
	MSGTD[playerid] = CreatePlayerTextDraw(playerid, 231.000000, 378.000000, "~r~ERROR: ~w~Kamu tidak memiliki kunci kendaraan ini");
	PlayerTextDrawFont(playerid, MSGTD[playerid], 1);
	PlayerTextDrawLetterSize(playerid, MSGTD[playerid], 0.183333, 1.400000);
	PlayerTextDrawTextSize(playerid, MSGTD[playerid], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, MSGTD[playerid], 1);
	PlayerTextDrawSetShadow(playerid, MSGTD[playerid], 0);
	PlayerTextDrawAlignment(playerid, MSGTD[playerid], 1);
	PlayerTextDrawColor(playerid, MSGTD[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, MSGTD[playerid], 255);
	PlayerTextDrawBoxColor(playerid, MSGTD[playerid], 50);
	PlayerTextDrawUseBox(playerid, MSGTD[playerid], 0);
	PlayerTextDrawSetProportional(playerid, MSGTD[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, MSGTD[playerid], 0);


/*Player Progress Bars
Requires "progress2" include by Southclaws
Download: https://github.com/Southclaws/progress2/releases */
/*
This file was generated by Nickk's TextDraw editor script
Nickk888 is the author of the NTD script
*/

//Variables
new Text:PublicTD[10];
new Text:LOADOUT_SAVE;
new Text:LOADOUT_CANCEL;
new PlayerText:LOADOUT_PISTOL[MAX_PLAYERS];
new PlayerText:LOADOUT_PISTOLMODEL[MAX_PLAYERS];
new PlayerText:LOADOUT_AR[MAX_PLAYERS];
new PlayerText:LOADOUT_ARMODEL[MAX_PLAYERS];
new PlayerText:LOADOUT_SG[MAX_PLAYERS];
new PlayerText:LOADOUT_SGMODEL[MAX_PLAYERS];
new PlayerText:LOADOUT_SMG[MAX_PLAYERS];
new PlayerText:LOADOUT_SMGMODEL[MAX_PLAYERS];

//Textdraws
PublicTD[0] = TextDrawCreate(183.000000, 146.000000, "ld_dual:white");
TextDrawFont(PublicTD[0], 4);
TextDrawLetterSize(PublicTD[0], 0.600000, 2.000000);
TextDrawTextSize(PublicTD[0], 96.500000, 12.000000);
TextDrawSetOutline(PublicTD[0], 1);
TextDrawSetShadow(PublicTD[0], 0);
TextDrawAlignment(PublicTD[0], 1);
TextDrawColor(PublicTD[0], 169);
TextDrawBackgroundColor(PublicTD[0], 255);
TextDrawBoxColor(PublicTD[0], 50);
TextDrawUseBox(PublicTD[0], 1);
TextDrawSetProportional(PublicTD[0], 1);
TextDrawSetSelectable(PublicTD[0], 0);

PublicTD[1] = TextDrawCreate(189.000000, 147.000000, "PISTOL");
TextDrawFont(PublicTD[1], 1);
TextDrawLetterSize(PublicTD[1], 0.170833, 0.850000);
TextDrawTextSize(PublicTD[1], 400.000000, 17.000000);
TextDrawSetOutline(PublicTD[1], 0);
TextDrawSetShadow(PublicTD[1], 0);
TextDrawAlignment(PublicTD[1], 1);
TextDrawColor(PublicTD[1], -1);
TextDrawBackgroundColor(PublicTD[1], 255);
TextDrawBoxColor(PublicTD[1], 50);
TextDrawUseBox(PublicTD[1], 0);
TextDrawSetProportional(PublicTD[1], 1);
TextDrawSetSelectable(PublicTD[1], 0);

PublicTD[2] = TextDrawCreate(280.000000, 146.000000, "ld_dual:white");
TextDrawFont(PublicTD[2], 4);
TextDrawLetterSize(PublicTD[2], 0.600000, 2.000000);
TextDrawTextSize(PublicTD[2], 96.500000, 12.000000);
TextDrawSetOutline(PublicTD[2], 1);
TextDrawSetShadow(PublicTD[2], 0);
TextDrawAlignment(PublicTD[2], 1);
TextDrawColor(PublicTD[2], 169);
TextDrawBackgroundColor(PublicTD[2], 255);
TextDrawBoxColor(PublicTD[2], 50);
TextDrawUseBox(PublicTD[2], 1);
TextDrawSetProportional(PublicTD[2], 1);
TextDrawSetSelectable(PublicTD[2], 0);

PublicTD[3] = TextDrawCreate(284.000000, 147.000000, "ASSAULT RIFLE");
TextDrawFont(PublicTD[3], 1);
TextDrawLetterSize(PublicTD[3], 0.170833, 0.850000);
TextDrawTextSize(PublicTD[3], 400.000000, 17.000000);
TextDrawSetOutline(PublicTD[3], 0);
TextDrawSetShadow(PublicTD[3], 0);
TextDrawAlignment(PublicTD[3], 1);
TextDrawColor(PublicTD[3], -1);
TextDrawBackgroundColor(PublicTD[3], 255);
TextDrawBoxColor(PublicTD[3], 50);
TextDrawUseBox(PublicTD[3], 0);
TextDrawSetProportional(PublicTD[3], 1);
TextDrawSetSelectable(PublicTD[3], 0);

PublicTD[4] = TextDrawCreate(183.000000, 215.000000, "ld_dual:white");
TextDrawFont(PublicTD[4], 4);
TextDrawLetterSize(PublicTD[4], 0.600000, 2.000000);
TextDrawTextSize(PublicTD[4], 96.500000, 12.000000);
TextDrawSetOutline(PublicTD[4], 1);
TextDrawSetShadow(PublicTD[4], 0);
TextDrawAlignment(PublicTD[4], 1);
TextDrawColor(PublicTD[4], 169);
TextDrawBackgroundColor(PublicTD[4], 255);
TextDrawBoxColor(PublicTD[4], 50);
TextDrawUseBox(PublicTD[4], 1);
TextDrawSetProportional(PublicTD[4], 1);
TextDrawSetSelectable(PublicTD[4], 0);

PublicTD[5] = TextDrawCreate(189.000000, 217.000000, "SHOTGUN");
TextDrawFont(PublicTD[5], 1);
TextDrawLetterSize(PublicTD[5], 0.170833, 0.850000);
TextDrawTextSize(PublicTD[5], 400.000000, 17.000000);
TextDrawSetOutline(PublicTD[5], 0);
TextDrawSetShadow(PublicTD[5], 0);
TextDrawAlignment(PublicTD[5], 1);
TextDrawColor(PublicTD[5], -1);
TextDrawBackgroundColor(PublicTD[5], 255);
TextDrawBoxColor(PublicTD[5], 50);
TextDrawUseBox(PublicTD[5], 0);
TextDrawSetProportional(PublicTD[5], 1);
TextDrawSetSelectable(PublicTD[5], 0);

PublicTD[6] = TextDrawCreate(280.000000, 215.000000, "ld_dual:white");
TextDrawFont(PublicTD[6], 4);
TextDrawLetterSize(PublicTD[6], 0.600000, 2.000000);
TextDrawTextSize(PublicTD[6], 96.500000, 12.000000);
TextDrawSetOutline(PublicTD[6], 1);
TextDrawSetShadow(PublicTD[6], 0);
TextDrawAlignment(PublicTD[6], 1);
TextDrawColor(PublicTD[6], 169);
TextDrawBackgroundColor(PublicTD[6], 255);
TextDrawBoxColor(PublicTD[6], 50);
TextDrawUseBox(PublicTD[6], 1);
TextDrawSetProportional(PublicTD[6], 1);
TextDrawSetSelectable(PublicTD[6], 0);

PublicTD[7] = TextDrawCreate(284.000000, 217.000000, "SUB MACHINE GUN");
TextDrawFont(PublicTD[7], 1);
TextDrawLetterSize(PublicTD[7], 0.170833, 0.850000);
TextDrawTextSize(PublicTD[7], 400.000000, 17.000000);
TextDrawSetOutline(PublicTD[7], 0);
TextDrawSetShadow(PublicTD[7], 0);
TextDrawAlignment(PublicTD[7], 1);
TextDrawColor(PublicTD[7], -1);
TextDrawBackgroundColor(PublicTD[7], 255);
TextDrawBoxColor(PublicTD[7], 50);
TextDrawUseBox(PublicTD[7], 0);
TextDrawSetProportional(PublicTD[7], 1);
TextDrawSetSelectable(PublicTD[7], 0);

PublicTD[8] = TextDrawCreate(384.000000, 269.000000, "SAVE_LOADOUT");
TextDrawFont(PublicTD[8], 1);
TextDrawLetterSize(PublicTD[8], 0.174999, 1.000000);
TextDrawTextSize(PublicTD[8], 400.000000, 17.000000);
TextDrawSetOutline(PublicTD[8], 0);
TextDrawSetShadow(PublicTD[8], 0);
TextDrawAlignment(PublicTD[8], 1);
TextDrawColor(PublicTD[8], -1);
TextDrawBackgroundColor(PublicTD[8], 255);
TextDrawBoxColor(PublicTD[8], 50);
TextDrawUseBox(PublicTD[8], 0);
TextDrawSetProportional(PublicTD[8], 1);
TextDrawSetSelectable(PublicTD[8], 0);

LOADOUT_SAVE = TextDrawCreate(381.000000, 268.000000, "ld_dual:white");
TextDrawFont(LOADOUT_SAVE, 4);
TextDrawLetterSize(LOADOUT_SAVE, 0.600000, 2.000000);
TextDrawTextSize(LOADOUT_SAVE, 50.000000, 12.000000);
TextDrawSetOutline(LOADOUT_SAVE, 1);
TextDrawSetShadow(LOADOUT_SAVE, 0);
TextDrawAlignment(LOADOUT_SAVE, 1);
TextDrawColor(LOADOUT_SAVE, 169);
TextDrawBackgroundColor(LOADOUT_SAVE, 255);
TextDrawBoxColor(LOADOUT_SAVE, 50);
TextDrawUseBox(LOADOUT_SAVE, 1);
TextDrawSetProportional(LOADOUT_SAVE, 1);
TextDrawSetSelectable(LOADOUT_SAVE, 1);

PublicTD[9] = TextDrawCreate(381.000000, 251.000000, "ld_dual:white");
TextDrawFont(PublicTD[9], 4);
TextDrawLetterSize(PublicTD[9], 0.600000, 2.000000);
TextDrawTextSize(PublicTD[9], 50.000000, 12.000000);
TextDrawSetOutline(PublicTD[9], 1);
TextDrawSetShadow(PublicTD[9], 0);
TextDrawAlignment(PublicTD[9], 1);
TextDrawColor(PublicTD[9], 169);
TextDrawBackgroundColor(PublicTD[9], 255);
TextDrawBoxColor(PublicTD[9], 50);
TextDrawUseBox(PublicTD[9], 1);
TextDrawSetProportional(PublicTD[9], 1);
TextDrawSetSelectable(PublicTD[9], 1);

LOADOUT_CANCEL = TextDrawCreate(395.000000, 252.000000, "CANCEL");
TextDrawFont(LOADOUT_CANCEL, 1);
TextDrawLetterSize(LOADOUT_CANCEL, 0.179166, 1.000000);
TextDrawTextSize(LOADOUT_CANCEL, 400.000000, 17.000000);
TextDrawSetOutline(LOADOUT_CANCEL, 0);
TextDrawSetShadow(LOADOUT_CANCEL, 0);
TextDrawAlignment(LOADOUT_CANCEL, 1);
TextDrawColor(LOADOUT_CANCEL, -1);
TextDrawBackgroundColor(LOADOUT_CANCEL, 255);
TextDrawBoxColor(LOADOUT_CANCEL, 50);
TextDrawUseBox(LOADOUT_CANCEL, 0);
TextDrawSetProportional(LOADOUT_CANCEL, 1);
TextDrawSetSelectable(LOADOUT_CANCEL, 0);


//Player Textdraws
LOADOUT_PISTOL[playerid] = CreatePlayerTextDraw(playerid, 183.000000, 146.000000, "ld_dual:white");
PlayerTextDrawFont(playerid, LOADOUT_PISTOL[playerid], 4);
PlayerTextDrawLetterSize(playerid, LOADOUT_PISTOL[playerid], 0.600000, 2.000000);
PlayerTextDrawTextSize(playerid, LOADOUT_PISTOL[playerid], 96.500000, 69.000000);
PlayerTextDrawSetOutline(playerid, LOADOUT_PISTOL[playerid], 1);
PlayerTextDrawSetShadow(playerid, LOADOUT_PISTOL[playerid], 0);
PlayerTextDrawAlignment(playerid, LOADOUT_PISTOL[playerid], 1);
PlayerTextDrawColor(playerid, LOADOUT_PISTOL[playerid], 169);
PlayerTextDrawBackgroundColor(playerid, LOADOUT_PISTOL[playerid], 255);
PlayerTextDrawBoxColor(playerid, LOADOUT_PISTOL[playerid], 50);
PlayerTextDrawUseBox(playerid, LOADOUT_PISTOL[playerid], 1);
PlayerTextDrawSetProportional(playerid, LOADOUT_PISTOL[playerid], 1);
PlayerTextDrawSetSelectable(playerid, LOADOUT_PISTOL[playerid], 1);

LOADOUT_PISTOLMODEL[playerid] = CreatePlayerTextDraw(playerid, 165.000000, 129.000000, "Preview_Model");
PlayerTextDrawFont(playerid, LOADOUT_PISTOLMODEL[playerid], 5);
PlayerTextDrawLetterSize(playerid, LOADOUT_PISTOLMODEL[playerid], 0.600000, 2.000000);
PlayerTextDrawTextSize(playerid, LOADOUT_PISTOLMODEL[playerid], 88.500000, 125.500000);
PlayerTextDrawSetOutline(playerid, LOADOUT_PISTOLMODEL[playerid], 0);
PlayerTextDrawSetShadow(playerid, LOADOUT_PISTOLMODEL[playerid], 0);
PlayerTextDrawAlignment(playerid, LOADOUT_PISTOLMODEL[playerid], 1);
PlayerTextDrawColor(playerid, LOADOUT_PISTOLMODEL[playerid], -1);
PlayerTextDrawBackgroundColor(playerid, LOADOUT_PISTOLMODEL[playerid], 0);
PlayerTextDrawBoxColor(playerid, LOADOUT_PISTOLMODEL[playerid], 255);
PlayerTextDrawUseBox(playerid, LOADOUT_PISTOLMODEL[playerid], 0);
PlayerTextDrawSetProportional(playerid, LOADOUT_PISTOLMODEL[playerid], 1);
PlayerTextDrawSetSelectable(playerid, LOADOUT_PISTOLMODEL[playerid], 0);
PlayerTextDrawSetPreviewModel(playerid, LOADOUT_PISTOLMODEL[playerid], 348);
PlayerTextDrawSetPreviewRot(playerid, LOADOUT_PISTOLMODEL[playerid], -10.000000, 0.000000, 178.000000, 1.000000);
PlayerTextDrawSetPreviewVehCol(playerid, LOADOUT_PISTOLMODEL[playerid], 1, 1);

LOADOUT_AR[playerid] = CreatePlayerTextDraw(playerid, 280.000000, 146.000000, "ld_dual:white");
PlayerTextDrawFont(playerid, LOADOUT_AR[playerid], 4);
PlayerTextDrawLetterSize(playerid, LOADOUT_AR[playerid], 0.600000, 2.000000);
PlayerTextDrawTextSize(playerid, LOADOUT_AR[playerid], 96.500000, 69.000000);
PlayerTextDrawSetOutline(playerid, LOADOUT_AR[playerid], 1);
PlayerTextDrawSetShadow(playerid, LOADOUT_AR[playerid], 0);
PlayerTextDrawAlignment(playerid, LOADOUT_AR[playerid], 1);
PlayerTextDrawColor(playerid, LOADOUT_AR[playerid], 169);
PlayerTextDrawBackgroundColor(playerid, LOADOUT_AR[playerid], 255);
PlayerTextDrawBoxColor(playerid, LOADOUT_AR[playerid], 50);
PlayerTextDrawUseBox(playerid, LOADOUT_AR[playerid], 1);
PlayerTextDrawSetProportional(playerid, LOADOUT_AR[playerid], 1);
PlayerTextDrawSetSelectable(playerid, LOADOUT_AR[playerid], 1);

LOADOUT_ARMODEL[playerid] = CreatePlayerTextDraw(playerid, 242.000000, 111.000000, "Preview_Model");
PlayerTextDrawFont(playerid, LOADOUT_ARMODEL[playerid], 5);
PlayerTextDrawLetterSize(playerid, LOADOUT_ARMODEL[playerid], 0.600000, 2.000000);
PlayerTextDrawTextSize(playerid, LOADOUT_ARMODEL[playerid], 135.500000, 153.000000);
PlayerTextDrawSetOutline(playerid, LOADOUT_ARMODEL[playerid], 0);
PlayerTextDrawSetShadow(playerid, LOADOUT_ARMODEL[playerid], 0);
PlayerTextDrawAlignment(playerid, LOADOUT_ARMODEL[playerid], 1);
PlayerTextDrawColor(playerid, LOADOUT_ARMODEL[playerid], -1);
PlayerTextDrawBackgroundColor(playerid, LOADOUT_ARMODEL[playerid], 0);
PlayerTextDrawBoxColor(playerid, LOADOUT_ARMODEL[playerid], 255);
PlayerTextDrawUseBox(playerid, LOADOUT_ARMODEL[playerid], 0);
PlayerTextDrawSetProportional(playerid, LOADOUT_ARMODEL[playerid], 1);
PlayerTextDrawSetSelectable(playerid, LOADOUT_ARMODEL[playerid], 0);
PlayerTextDrawSetPreviewModel(playerid, LOADOUT_ARMODEL[playerid], 355);
PlayerTextDrawSetPreviewRot(playerid, LOADOUT_ARMODEL[playerid], -10.000000, 0.000000, 178.000000, 2.859997);
PlayerTextDrawSetPreviewVehCol(playerid, LOADOUT_ARMODEL[playerid], 1, 1);

LOADOUT_SG[playerid] = CreatePlayerTextDraw(playerid, 183.000000, 215.000000, "ld_dual:white");
PlayerTextDrawFont(playerid, LOADOUT_SG[playerid], 4);
PlayerTextDrawLetterSize(playerid, LOADOUT_SG[playerid], 0.600000, 2.000000);
PlayerTextDrawTextSize(playerid, LOADOUT_SG[playerid], 96.500000, 69.000000);
PlayerTextDrawSetOutline(playerid, LOADOUT_SG[playerid], 1);
PlayerTextDrawSetShadow(playerid, LOADOUT_SG[playerid], 0);
PlayerTextDrawAlignment(playerid, LOADOUT_SG[playerid], 1);
PlayerTextDrawColor(playerid, LOADOUT_SG[playerid], 169);
PlayerTextDrawBackgroundColor(playerid, LOADOUT_SG[playerid], 255);
PlayerTextDrawBoxColor(playerid, LOADOUT_SG[playerid], 50);
PlayerTextDrawUseBox(playerid, LOADOUT_SG[playerid], 1);
PlayerTextDrawSetProportional(playerid, LOADOUT_SG[playerid], 1);
PlayerTextDrawSetSelectable(playerid, LOADOUT_SG[playerid], 1);

LOADOUT_SGMODEL[playerid] = CreatePlayerTextDraw(playerid, 139.000000, 185.000000, "Preview_Model");
PlayerTextDrawFont(playerid, LOADOUT_SGMODEL[playerid], 5);
PlayerTextDrawLetterSize(playerid, LOADOUT_SGMODEL[playerid], 0.600000, 2.000000);
PlayerTextDrawTextSize(playerid, LOADOUT_SGMODEL[playerid], 135.500000, 153.000000);
PlayerTextDrawSetOutline(playerid, LOADOUT_SGMODEL[playerid], 0);
PlayerTextDrawSetShadow(playerid, LOADOUT_SGMODEL[playerid], 0);
PlayerTextDrawAlignment(playerid, LOADOUT_SGMODEL[playerid], 1);
PlayerTextDrawColor(playerid, LOADOUT_SGMODEL[playerid], -1);
PlayerTextDrawBackgroundColor(playerid, LOADOUT_SGMODEL[playerid], 0);
PlayerTextDrawBoxColor(playerid, LOADOUT_SGMODEL[playerid], 255);
PlayerTextDrawUseBox(playerid, LOADOUT_SGMODEL[playerid], 0);
PlayerTextDrawSetProportional(playerid, LOADOUT_SGMODEL[playerid], 1);
PlayerTextDrawSetSelectable(playerid, LOADOUT_SGMODEL[playerid], 0);
PlayerTextDrawSetPreviewModel(playerid, LOADOUT_SGMODEL[playerid], 349);
PlayerTextDrawSetPreviewRot(playerid, LOADOUT_SGMODEL[playerid], -10.000000, 0.000000, 178.000000, 2.859997);
PlayerTextDrawSetPreviewVehCol(playerid, LOADOUT_SGMODEL[playerid], 1, 1);

LOADOUT_SMG[playerid] = CreatePlayerTextDraw(playerid, 280.000000, 215.000000, "ld_dual:white");
PlayerTextDrawFont(playerid, LOADOUT_SMG[playerid], 4);
PlayerTextDrawLetterSize(playerid, LOADOUT_SMG[playerid], 0.600000, 2.000000);
PlayerTextDrawTextSize(playerid, LOADOUT_SMG[playerid], 96.500000, 69.000000);
PlayerTextDrawSetOutline(playerid, LOADOUT_SMG[playerid], 1);
PlayerTextDrawSetShadow(playerid, LOADOUT_SMG[playerid], 0);
PlayerTextDrawAlignment(playerid, LOADOUT_SMG[playerid], 1);
PlayerTextDrawColor(playerid, LOADOUT_SMG[playerid], 169);
PlayerTextDrawBackgroundColor(playerid, LOADOUT_SMG[playerid], 255);
PlayerTextDrawBoxColor(playerid, LOADOUT_SMG[playerid], 50);
PlayerTextDrawUseBox(playerid, LOADOUT_SMG[playerid], 1);
PlayerTextDrawSetProportional(playerid, LOADOUT_SMG[playerid], 1);
PlayerTextDrawSetSelectable(playerid, LOADOUT_SMG[playerid], 1);

LOADOUT_SMGMODEL[playerid] = CreatePlayerTextDraw(playerid, 237.000000, 161.000000, "Preview_Model");
PlayerTextDrawFont(playerid, LOADOUT_SMGMODEL[playerid], 5);
PlayerTextDrawLetterSize(playerid, LOADOUT_SMGMODEL[playerid], 0.600000, 2.000000);
PlayerTextDrawTextSize(playerid, LOADOUT_SMGMODEL[playerid], 174.500000, 191.500000);
PlayerTextDrawSetOutline(playerid, LOADOUT_SMGMODEL[playerid], 0);
PlayerTextDrawSetShadow(playerid, LOADOUT_SMGMODEL[playerid], 0);
PlayerTextDrawAlignment(playerid, LOADOUT_SMGMODEL[playerid], 1);
PlayerTextDrawColor(playerid, LOADOUT_SMGMODEL[playerid], -1);
PlayerTextDrawBackgroundColor(playerid, LOADOUT_SMGMODEL[playerid], 0);
PlayerTextDrawBoxColor(playerid, LOADOUT_SMGMODEL[playerid], 255);
PlayerTextDrawUseBox(playerid, LOADOUT_SMGMODEL[playerid], 0);
PlayerTextDrawSetProportional(playerid, LOADOUT_SMGMODEL[playerid], 1);
PlayerTextDrawSetSelectable(playerid, LOADOUT_SMGMODEL[playerid], 0);
PlayerTextDrawSetPreviewModel(playerid, LOADOUT_SMGMODEL[playerid], 353);
PlayerTextDrawSetPreviewRot(playerid, LOADOUT_SMGMODEL[playerid], -10.000000, 0.000000, 178.000000, 2.859997);
PlayerTextDrawSetPreviewVehCol(playerid, LOADOUT_SMGMODEL[playerid], 1, 1);


/*Player Progress Bars
Requires "progress2" include by Southclaws
Download: https://github.com/Southclaws/progress2/releases */
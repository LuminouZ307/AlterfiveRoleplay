/*
This file was generated by Nickk's TextDraw editor script
Nickk888 is the author of the NTD script
*/

//Variables
new PlayerText:PlayerTD[MAX_PLAYERS][19];
new PlayerText:PHONE_CLOSE[MAX_PLAYERS];
new PlayerText:PHONE_BAR[MAX_PLAYERS];
new PlayerText:PHONE_CLOCK[MAX_PLAYERS];
new PlayerText:PHONECONTACT_BG[MAX_PLAYERS];
new PlayerText:PHONECONTACT_RETURN[MAX_PLAYERS];
new PlayerText:PHONECONTACT_ADD[MAX_PLAYERS];
new PlayerText:PHONEAPP_CONTACT[MAX_PLAYERS];

//Textdraws

//Player Textdraws
PlayerTD[playerid][0] = CreatePlayerTextDraw(playerid, 421.000000, 398.000000, "ld_beat:chit");
PlayerTextDrawFont(playerid, PlayerTD[playerid][0], 4);
PlayerTextDrawLetterSize(playerid, PlayerTD[playerid][0], 0.600000, 2.000000);
PlayerTextDrawTextSize(playerid, PlayerTD[playerid][0], 20.500000, 23.500000);
PlayerTextDrawSetOutline(playerid, PlayerTD[playerid][0], 1);
PlayerTextDrawSetShadow(playerid, PlayerTD[playerid][0], 0);
PlayerTextDrawAlignment(playerid, PlayerTD[playerid][0], 1);
PlayerTextDrawColor(playerid, PlayerTD[playerid][0], 255);
PlayerTextDrawBackgroundColor(playerid, PlayerTD[playerid][0], 255);
PlayerTextDrawBoxColor(playerid, PlayerTD[playerid][0], 50);
PlayerTextDrawUseBox(playerid, PlayerTD[playerid][0], 1);
PlayerTextDrawSetProportional(playerid, PlayerTD[playerid][0], 1);
PlayerTextDrawSetSelectable(playerid, PlayerTD[playerid][0], 0);

PlayerTD[playerid][1] = CreatePlayerTextDraw(playerid, 497.000000, 398.000000, "ld_beat:chit");
PlayerTextDrawFont(playerid, PlayerTD[playerid][1], 4);
PlayerTextDrawLetterSize(playerid, PlayerTD[playerid][1], 0.600000, 2.000000);
PlayerTextDrawTextSize(playerid, PlayerTD[playerid][1], 20.500000, 23.500000);
PlayerTextDrawSetOutline(playerid, PlayerTD[playerid][1], 1);
PlayerTextDrawSetShadow(playerid, PlayerTD[playerid][1], 0);
PlayerTextDrawAlignment(playerid, PlayerTD[playerid][1], 1);
PlayerTextDrawColor(playerid, PlayerTD[playerid][1], 255);
PlayerTextDrawBackgroundColor(playerid, PlayerTD[playerid][1], 255);
PlayerTextDrawBoxColor(playerid, PlayerTD[playerid][1], 50);
PlayerTextDrawUseBox(playerid, PlayerTD[playerid][1], 1);
PlayerTextDrawSetProportional(playerid, PlayerTD[playerid][1], 1);
PlayerTextDrawSetSelectable(playerid, PlayerTD[playerid][1], 0);

PlayerTD[playerid][2] = CreatePlayerTextDraw(playerid, 497.000000, 221.000000, "ld_beat:chit");
PlayerTextDrawFont(playerid, PlayerTD[playerid][2], 4);
PlayerTextDrawLetterSize(playerid, PlayerTD[playerid][2], 0.600000, 2.000000);
PlayerTextDrawTextSize(playerid, PlayerTD[playerid][2], 20.500000, 23.500000);
PlayerTextDrawSetOutline(playerid, PlayerTD[playerid][2], 1);
PlayerTextDrawSetShadow(playerid, PlayerTD[playerid][2], 0);
PlayerTextDrawAlignment(playerid, PlayerTD[playerid][2], 1);
PlayerTextDrawColor(playerid, PlayerTD[playerid][2], 255);
PlayerTextDrawBackgroundColor(playerid, PlayerTD[playerid][2], 255);
PlayerTextDrawBoxColor(playerid, PlayerTD[playerid][2], 50);
PlayerTextDrawUseBox(playerid, PlayerTD[playerid][2], 1);
PlayerTextDrawSetProportional(playerid, PlayerTD[playerid][2], 1);
PlayerTextDrawSetSelectable(playerid, PlayerTD[playerid][2], 0);

PlayerTD[playerid][3] = CreatePlayerTextDraw(playerid, 421.000000, 221.000000, "ld_beat:chit");
PlayerTextDrawFont(playerid, PlayerTD[playerid][3], 4);
PlayerTextDrawLetterSize(playerid, PlayerTD[playerid][3], 0.600000, 2.000000);
PlayerTextDrawTextSize(playerid, PlayerTD[playerid][3], 20.500000, 23.500000);
PlayerTextDrawSetOutline(playerid, PlayerTD[playerid][3], 1);
PlayerTextDrawSetShadow(playerid, PlayerTD[playerid][3], 0);
PlayerTextDrawAlignment(playerid, PlayerTD[playerid][3], 1);
PlayerTextDrawColor(playerid, PlayerTD[playerid][3], 255);
PlayerTextDrawBackgroundColor(playerid, PlayerTD[playerid][3], 255);
PlayerTextDrawBoxColor(playerid, PlayerTD[playerid][3], 50);
PlayerTextDrawUseBox(playerid, PlayerTD[playerid][3], 1);
PlayerTextDrawSetProportional(playerid, PlayerTD[playerid][3], 1);
PlayerTextDrawSetSelectable(playerid, PlayerTD[playerid][3], 0);

PlayerTD[playerid][4] = CreatePlayerTextDraw(playerid, 427.000000, 232.000000, "ld_dual:white");
PlayerTextDrawFont(playerid, PlayerTD[playerid][4], 4);
PlayerTextDrawLetterSize(playerid, PlayerTD[playerid][4], 0.600000, 2.000000);
PlayerTextDrawTextSize(playerid, PlayerTD[playerid][4], 87.000000, 180.000000);
PlayerTextDrawSetOutline(playerid, PlayerTD[playerid][4], 1);
PlayerTextDrawSetShadow(playerid, PlayerTD[playerid][4], 0);
PlayerTextDrawAlignment(playerid, PlayerTD[playerid][4], 1);
PlayerTextDrawColor(playerid, PlayerTD[playerid][4], 1111638783);
PlayerTextDrawBackgroundColor(playerid, PlayerTD[playerid][4], 255);
PlayerTextDrawBoxColor(playerid, PlayerTD[playerid][4], 50);
PlayerTextDrawUseBox(playerid, PlayerTD[playerid][4], 1);
PlayerTextDrawSetProportional(playerid, PlayerTD[playerid][4], 1);
PlayerTextDrawSetSelectable(playerid, PlayerTD[playerid][4], 0);

PlayerTD[playerid][5] = CreatePlayerTextDraw(playerid, 428.000000, 230.000000, "ld_dual:white");
PlayerTextDrawFont(playerid, PlayerTD[playerid][5], 4);
PlayerTextDrawLetterSize(playerid, PlayerTD[playerid][5], 0.600000, 2.000000);
PlayerTextDrawTextSize(playerid, PlayerTD[playerid][5], -3.500000, 181.000000);
PlayerTextDrawSetOutline(playerid, PlayerTD[playerid][5], 1);
PlayerTextDrawSetShadow(playerid, PlayerTD[playerid][5], 0);
PlayerTextDrawAlignment(playerid, PlayerTD[playerid][5], 1);
PlayerTextDrawColor(playerid, PlayerTD[playerid][5], 255);
PlayerTextDrawBackgroundColor(playerid, PlayerTD[playerid][5], 255);
PlayerTextDrawBoxColor(playerid, PlayerTD[playerid][5], 50);
PlayerTextDrawUseBox(playerid, PlayerTD[playerid][5], 1);
PlayerTextDrawSetProportional(playerid, PlayerTD[playerid][5], 1);
PlayerTextDrawSetSelectable(playerid, PlayerTD[playerid][5], 0);

PlayerTD[playerid][6] = CreatePlayerTextDraw(playerid, 430.000000, 228.000000, "ld_dual:white");
PlayerTextDrawFont(playerid, PlayerTD[playerid][6], 4);
PlayerTextDrawLetterSize(playerid, PlayerTD[playerid][6], 0.600000, 2.000000);
PlayerTextDrawTextSize(playerid, PlayerTD[playerid][6], 79.000000, -3.000000);
PlayerTextDrawSetOutline(playerid, PlayerTD[playerid][6], 1);
PlayerTextDrawSetShadow(playerid, PlayerTD[playerid][6], 0);
PlayerTextDrawAlignment(playerid, PlayerTD[playerid][6], 1);
PlayerTextDrawColor(playerid, PlayerTD[playerid][6], 255);
PlayerTextDrawBackgroundColor(playerid, PlayerTD[playerid][6], 255);
PlayerTextDrawBoxColor(playerid, PlayerTD[playerid][6], 50);
PlayerTextDrawUseBox(playerid, PlayerTD[playerid][6], 1);
PlayerTextDrawSetProportional(playerid, PlayerTD[playerid][6], 1);
PlayerTextDrawSetSelectable(playerid, PlayerTD[playerid][6], 0);

PlayerTD[playerid][7] = CreatePlayerTextDraw(playerid, 514.000000, 230.000000, "ld_dual:white");
PlayerTextDrawFont(playerid, PlayerTD[playerid][7], 4);
PlayerTextDrawLetterSize(playerid, PlayerTD[playerid][7], 0.600000, 2.000000);
PlayerTextDrawTextSize(playerid, PlayerTD[playerid][7], -3.500000, 182.000000);
PlayerTextDrawSetOutline(playerid, PlayerTD[playerid][7], 1);
PlayerTextDrawSetShadow(playerid, PlayerTD[playerid][7], 0);
PlayerTextDrawAlignment(playerid, PlayerTD[playerid][7], 1);
PlayerTextDrawColor(playerid, PlayerTD[playerid][7], 255);
PlayerTextDrawBackgroundColor(playerid, PlayerTD[playerid][7], 255);
PlayerTextDrawBoxColor(playerid, PlayerTD[playerid][7], 50);
PlayerTextDrawUseBox(playerid, PlayerTD[playerid][7], 1);
PlayerTextDrawSetProportional(playerid, PlayerTD[playerid][7], 1);
PlayerTextDrawSetSelectable(playerid, PlayerTD[playerid][7], 0);

PlayerTD[playerid][8] = CreatePlayerTextDraw(playerid, 427.000000, 235.000000, "ld_dual:white");
PlayerTextDrawFont(playerid, PlayerTD[playerid][8], 4);
PlayerTextDrawLetterSize(playerid, PlayerTD[playerid][8], 0.600000, 2.000000);
PlayerTextDrawTextSize(playerid, PlayerTD[playerid][8], 83.500000, -7.500000);
PlayerTextDrawSetOutline(playerid, PlayerTD[playerid][8], 1);
PlayerTextDrawSetShadow(playerid, PlayerTD[playerid][8], 0);
PlayerTextDrawAlignment(playerid, PlayerTD[playerid][8], 1);
PlayerTextDrawColor(playerid, PlayerTD[playerid][8], 255);
PlayerTextDrawBackgroundColor(playerid, PlayerTD[playerid][8], 255);
PlayerTextDrawBoxColor(playerid, PlayerTD[playerid][8], 50);
PlayerTextDrawUseBox(playerid, PlayerTD[playerid][8], 1);
PlayerTextDrawSetProportional(playerid, PlayerTD[playerid][8], 1);
PlayerTextDrawSetSelectable(playerid, PlayerTD[playerid][8], 0);

PlayerTD[playerid][9] = CreatePlayerTextDraw(playerid, 430.000000, 415.000000, "ld_dual:white");
PlayerTextDrawFont(playerid, PlayerTD[playerid][9], 4);
PlayerTextDrawLetterSize(playerid, PlayerTD[playerid][9], 0.600000, 2.000000);
PlayerTextDrawTextSize(playerid, PlayerTD[playerid][9], 79.000000, 2.500000);
PlayerTextDrawSetOutline(playerid, PlayerTD[playerid][9], 1);
PlayerTextDrawSetShadow(playerid, PlayerTD[playerid][9], 0);
PlayerTextDrawAlignment(playerid, PlayerTD[playerid][9], 1);
PlayerTextDrawColor(playerid, PlayerTD[playerid][9], 255);
PlayerTextDrawBackgroundColor(playerid, PlayerTD[playerid][9], 255);
PlayerTextDrawBoxColor(playerid, PlayerTD[playerid][9], 50);
PlayerTextDrawUseBox(playerid, PlayerTD[playerid][9], 1);
PlayerTextDrawSetProportional(playerid, PlayerTD[playerid][9], 1);
PlayerTextDrawSetSelectable(playerid, PlayerTD[playerid][9], 0);

PlayerTD[playerid][10] = CreatePlayerTextDraw(playerid, 427.000000, 415.000000, "ld_dual:white");
PlayerTextDrawFont(playerid, PlayerTD[playerid][10], 4);
PlayerTextDrawLetterSize(playerid, PlayerTD[playerid][10], 0.600000, 2.000000);
PlayerTextDrawTextSize(playerid, PlayerTD[playerid][10], 83.500000, -7.500000);
PlayerTextDrawSetOutline(playerid, PlayerTD[playerid][10], 1);
PlayerTextDrawSetShadow(playerid, PlayerTD[playerid][10], 0);
PlayerTextDrawAlignment(playerid, PlayerTD[playerid][10], 1);
PlayerTextDrawColor(playerid, PlayerTD[playerid][10], 255);
PlayerTextDrawBackgroundColor(playerid, PlayerTD[playerid][10], 255);
PlayerTextDrawBoxColor(playerid, PlayerTD[playerid][10], 50);
PlayerTextDrawUseBox(playerid, PlayerTD[playerid][10], 1);
PlayerTextDrawSetProportional(playerid, PlayerTD[playerid][10], 1);
PlayerTextDrawSetSelectable(playerid, PlayerTD[playerid][10], 0);

PHONE_CLOSE[playerid] = CreatePlayerTextDraw(playerid, 447.000000, 400.000000, "ld_dual:white");
PlayerTextDrawFont(playerid, PHONE_CLOSE[playerid], 4);
PlayerTextDrawLetterSize(playerid, PHONE_CLOSE[playerid], 0.600000, 2.000000);
PlayerTextDrawTextSize(playerid, PHONE_CLOSE[playerid], 42.500000, 4.500000);
PlayerTextDrawSetOutline(playerid, PHONE_CLOSE[playerid], 1);
PlayerTextDrawSetShadow(playerid, PHONE_CLOSE[playerid], 0);
PlayerTextDrawAlignment(playerid, PHONE_CLOSE[playerid], 1);
PlayerTextDrawColor(playerid, PHONE_CLOSE[playerid], 1296911871);
PlayerTextDrawBackgroundColor(playerid, PHONE_CLOSE[playerid], 255);
PlayerTextDrawBoxColor(playerid, PHONE_CLOSE[playerid], 50);
PlayerTextDrawUseBox(playerid, PHONE_CLOSE[playerid], 1);
PlayerTextDrawSetProportional(playerid, PHONE_CLOSE[playerid], 1);
PlayerTextDrawSetSelectable(playerid, PHONE_CLOSE[playerid], 1);

PHONE_BAR[playerid] = CreatePlayerTextDraw(playerid, 428.000000, 235.000000, "ld_dual:white");
PlayerTextDrawFont(playerid, PHONE_BAR[playerid], 4);
PlayerTextDrawLetterSize(playerid, PHONE_BAR[playerid], 0.600000, 2.000000);
PlayerTextDrawTextSize(playerid, PHONE_BAR[playerid], 82.500000, 5.500000);
PlayerTextDrawSetOutline(playerid, PHONE_BAR[playerid], 1);
PlayerTextDrawSetShadow(playerid, PHONE_BAR[playerid], 0);
PlayerTextDrawAlignment(playerid, PHONE_BAR[playerid], 1);
PlayerTextDrawColor(playerid, PHONE_BAR[playerid], -741092521);
PlayerTextDrawBackgroundColor(playerid, PHONE_BAR[playerid], 255);
PlayerTextDrawBoxColor(playerid, PHONE_BAR[playerid], 50);
PlayerTextDrawUseBox(playerid, PHONE_BAR[playerid], 1);
PlayerTextDrawSetProportional(playerid, PHONE_BAR[playerid], 1);
PlayerTextDrawSetSelectable(playerid, PHONE_BAR[playerid], 0);

PHONE_CLOCK[playerid] = CreatePlayerTextDraw(playerid, 430.000000, 235.000000, "02:00");
PlayerTextDrawFont(playerid, PHONE_CLOCK[playerid], 1);
PlayerTextDrawLetterSize(playerid, PHONE_CLOCK[playerid], 0.116666, 0.550000);
PlayerTextDrawTextSize(playerid, PHONE_CLOCK[playerid], 400.000000, 17.000000);
PlayerTextDrawSetOutline(playerid, PHONE_CLOCK[playerid], 0);
PlayerTextDrawSetShadow(playerid, PHONE_CLOCK[playerid], 0);
PlayerTextDrawAlignment(playerid, PHONE_CLOCK[playerid], 1);
PlayerTextDrawColor(playerid, PHONE_CLOCK[playerid], -1);
PlayerTextDrawBackgroundColor(playerid, PHONE_CLOCK[playerid], 255);
PlayerTextDrawBoxColor(playerid, PHONE_CLOCK[playerid], 50);
PlayerTextDrawUseBox(playerid, PHONE_CLOCK[playerid], 0);
PlayerTextDrawSetProportional(playerid, PHONE_CLOCK[playerid], 1);
PlayerTextDrawSetSelectable(playerid, PHONE_CLOCK[playerid], 0);

PHONECONTACT_BG[playerid] = CreatePlayerTextDraw(playerid, 428.000000, 240.500000, "ld_dual:white");
PlayerTextDrawFont(playerid, PHONECONTACT_BG[playerid], 4);
PlayerTextDrawLetterSize(playerid, PHONECONTACT_BG[playerid], 0.600000, 2.000000);
PlayerTextDrawTextSize(playerid, PHONECONTACT_BG[playerid], 82.500000, 166.500000);
PlayerTextDrawSetOutline(playerid, PHONECONTACT_BG[playerid], 1);
PlayerTextDrawSetShadow(playerid, PHONECONTACT_BG[playerid], 0);
PlayerTextDrawAlignment(playerid, PHONECONTACT_BG[playerid], 1);
PlayerTextDrawColor(playerid, PHONECONTACT_BG[playerid], -1);
PlayerTextDrawBackgroundColor(playerid, PHONECONTACT_BG[playerid], 255);
PlayerTextDrawBoxColor(playerid, PHONECONTACT_BG[playerid], 50);
PlayerTextDrawUseBox(playerid, PHONECONTACT_BG[playerid], 1);
PlayerTextDrawSetProportional(playerid, PHONECONTACT_BG[playerid], 1);
PlayerTextDrawSetSelectable(playerid, PHONECONTACT_BG[playerid], 0);

PlayerTD[playerid][11] = CreatePlayerTextDraw(playerid, 428.000000, 240.500000, "ld_dual:white");
PlayerTextDrawFont(playerid, PlayerTD[playerid][11], 4);
PlayerTextDrawLetterSize(playerid, PlayerTD[playerid][11], 0.600000, 2.000000);
PlayerTextDrawTextSize(playerid, PlayerTD[playerid][11], 82.500000, 14.000000);
PlayerTextDrawSetOutline(playerid, PlayerTD[playerid][11], 1);
PlayerTextDrawSetShadow(playerid, PlayerTD[playerid][11], 0);
PlayerTextDrawAlignment(playerid, PlayerTD[playerid][11], 1);
PlayerTextDrawColor(playerid, PlayerTD[playerid][11], 929608703);
PlayerTextDrawBackgroundColor(playerid, PlayerTD[playerid][11], 255);
PlayerTextDrawBoxColor(playerid, PlayerTD[playerid][11], 50);
PlayerTextDrawUseBox(playerid, PlayerTD[playerid][11], 1);
PlayerTextDrawSetProportional(playerid, PlayerTD[playerid][11], 1);
PlayerTextDrawSetSelectable(playerid, PlayerTD[playerid][11], 0);

PHONECONTACT_RETURN[playerid] = CreatePlayerTextDraw(playerid, 433.000000, 242.500000, "ld_dual:white");
PlayerTextDrawFont(playerid, PHONECONTACT_RETURN[playerid], 4);
PlayerTextDrawLetterSize(playerid, PHONECONTACT_RETURN[playerid], 0.600000, 2.000000);
PlayerTextDrawTextSize(playerid, PHONECONTACT_RETURN[playerid], 11.500000, 9.000000);
PlayerTextDrawSetOutline(playerid, PHONECONTACT_RETURN[playerid], 1);
PlayerTextDrawSetShadow(playerid, PHONECONTACT_RETURN[playerid], 0);
PlayerTextDrawAlignment(playerid, PHONECONTACT_RETURN[playerid], 1);
PlayerTextDrawColor(playerid, PHONECONTACT_RETURN[playerid], -256);
PlayerTextDrawBackgroundColor(playerid, PHONECONTACT_RETURN[playerid], 255);
PlayerTextDrawBoxColor(playerid, PHONECONTACT_RETURN[playerid], 50);
PlayerTextDrawUseBox(playerid, PHONECONTACT_RETURN[playerid], 1);
PlayerTextDrawSetProportional(playerid, PHONECONTACT_RETURN[playerid], 1);
PlayerTextDrawSetSelectable(playerid, PHONECONTACT_RETURN[playerid], 1);

PlayerTD[playerid][12] = CreatePlayerTextDraw(playerid, 436.000000, 243.000000, "<");
PlayerTextDrawFont(playerid, PlayerTD[playerid][12], 1);
PlayerTextDrawLetterSize(playerid, PlayerTD[playerid][12], 0.175000, 0.850000);
PlayerTextDrawTextSize(playerid, PlayerTD[playerid][12], 400.000000, 17.000000);
PlayerTextDrawSetOutline(playerid, PlayerTD[playerid][12], 0);
PlayerTextDrawSetShadow(playerid, PlayerTD[playerid][12], 0);
PlayerTextDrawAlignment(playerid, PlayerTD[playerid][12], 1);
PlayerTextDrawColor(playerid, PlayerTD[playerid][12], -1);
PlayerTextDrawBackgroundColor(playerid, PlayerTD[playerid][12], 255);
PlayerTextDrawBoxColor(playerid, PlayerTD[playerid][12], 50);
PlayerTextDrawUseBox(playerid, PlayerTD[playerid][12], 0);
PlayerTextDrawSetProportional(playerid, PlayerTD[playerid][12], 1);
PlayerTextDrawSetSelectable(playerid, PlayerTD[playerid][12], 0);

PlayerTD[playerid][13] = CreatePlayerTextDraw(playerid, 442.000000, 243.500000, "MY_CONTACTS");
PlayerTextDrawFont(playerid, PlayerTD[playerid][13], 2);
PlayerTextDrawLetterSize(playerid, PlayerTD[playerid][13], 0.112500, 0.700000);
PlayerTextDrawTextSize(playerid, PlayerTD[playerid][13], 400.000000, 17.000000);
PlayerTextDrawSetOutline(playerid, PlayerTD[playerid][13], 0);
PlayerTextDrawSetShadow(playerid, PlayerTD[playerid][13], 0);
PlayerTextDrawAlignment(playerid, PlayerTD[playerid][13], 1);
PlayerTextDrawColor(playerid, PlayerTD[playerid][13], -1);
PlayerTextDrawBackgroundColor(playerid, PlayerTD[playerid][13], 255);
PlayerTextDrawBoxColor(playerid, PlayerTD[playerid][13], 50);
PlayerTextDrawUseBox(playerid, PlayerTD[playerid][13], 0);
PlayerTextDrawSetProportional(playerid, PlayerTD[playerid][13], 1);
PlayerTextDrawSetSelectable(playerid, PlayerTD[playerid][13], 0);

PHONECONTACT_ADD[playerid] = CreatePlayerTextDraw(playerid, 428.000000, 254.500000, "ld_dual:white");
PlayerTextDrawFont(playerid, PHONECONTACT_ADD[playerid], 4);
PlayerTextDrawLetterSize(playerid, PHONECONTACT_ADD[playerid], 0.600000, 2.000000);
PlayerTextDrawTextSize(playerid, PHONECONTACT_ADD[playerid], 82.500000, 9.500000);
PlayerTextDrawSetOutline(playerid, PHONECONTACT_ADD[playerid], 1);
PlayerTextDrawSetShadow(playerid, PHONECONTACT_ADD[playerid], 0);
PlayerTextDrawAlignment(playerid, PHONECONTACT_ADD[playerid], 1);
PlayerTextDrawColor(playerid, PHONECONTACT_ADD[playerid], -741092535);
PlayerTextDrawBackgroundColor(playerid, PHONECONTACT_ADD[playerid], 255);
PlayerTextDrawBoxColor(playerid, PHONECONTACT_ADD[playerid], 50);
PlayerTextDrawUseBox(playerid, PHONECONTACT_ADD[playerid], 1);
PlayerTextDrawSetProportional(playerid, PHONECONTACT_ADD[playerid], 1);
PlayerTextDrawSetSelectable(playerid, PHONECONTACT_ADD[playerid], 1);

PlayerTD[playerid][14] = CreatePlayerTextDraw(playerid, 432.000000, 255.500000, "(+)_New_contact");
PlayerTextDrawFont(playerid, PlayerTD[playerid][14], 2);
PlayerTextDrawLetterSize(playerid, PlayerTD[playerid][14], 0.112500, 0.700000);
PlayerTextDrawTextSize(playerid, PlayerTD[playerid][14], 400.000000, 17.000000);
PlayerTextDrawSetOutline(playerid, PlayerTD[playerid][14], 0);
PlayerTextDrawSetShadow(playerid, PlayerTD[playerid][14], 0);
PlayerTextDrawAlignment(playerid, PlayerTD[playerid][14], 1);
PlayerTextDrawColor(playerid, PlayerTD[playerid][14], 255);
PlayerTextDrawBackgroundColor(playerid, PlayerTD[playerid][14], 255);
PlayerTextDrawBoxColor(playerid, PlayerTD[playerid][14], 50);
PlayerTextDrawUseBox(playerid, PlayerTD[playerid][14], 0);
PlayerTextDrawSetProportional(playerid, PlayerTD[playerid][14], 1);
PlayerTextDrawSetSelectable(playerid, PlayerTD[playerid][14], 0);

PlayerTD[playerid][15] = CreatePlayerTextDraw(playerid, 428.000000, 264.000000, "ld_dual:white");
PlayerTextDrawFont(playerid, PlayerTD[playerid][15], 4);
PlayerTextDrawLetterSize(playerid, PlayerTD[playerid][15], 0.600000, 2.000000);
PlayerTextDrawTextSize(playerid, PlayerTD[playerid][15], 82.500000, 9.500000);
PlayerTextDrawSetOutline(playerid, PlayerTD[playerid][15], 1);
PlayerTextDrawSetShadow(playerid, PlayerTD[playerid][15], 0);
PlayerTextDrawAlignment(playerid, PlayerTD[playerid][15], 1);
PlayerTextDrawColor(playerid, PlayerTD[playerid][15], -741092535);
PlayerTextDrawBackgroundColor(playerid, PlayerTD[playerid][15], 255);
PlayerTextDrawBoxColor(playerid, PlayerTD[playerid][15], 50);
PlayerTextDrawUseBox(playerid, PlayerTD[playerid][15], 1);
PlayerTextDrawSetProportional(playerid, PlayerTD[playerid][15], 1);
PlayerTextDrawSetSelectable(playerid, PlayerTD[playerid][15], 1);

PlayerTD[playerid][16] = CreatePlayerTextDraw(playerid, 432.000000, 265.000000, "081380939412_-_Arif");
PlayerTextDrawFont(playerid, PlayerTD[playerid][16], 2);
PlayerTextDrawLetterSize(playerid, PlayerTD[playerid][16], 0.112500, 0.700000);
PlayerTextDrawTextSize(playerid, PlayerTD[playerid][16], 400.000000, 17.000000);
PlayerTextDrawSetOutline(playerid, PlayerTD[playerid][16], 0);
PlayerTextDrawSetShadow(playerid, PlayerTD[playerid][16], 0);
PlayerTextDrawAlignment(playerid, PlayerTD[playerid][16], 1);
PlayerTextDrawColor(playerid, PlayerTD[playerid][16], 255);
PlayerTextDrawBackgroundColor(playerid, PlayerTD[playerid][16], 255);
PlayerTextDrawBoxColor(playerid, PlayerTD[playerid][16], 50);
PlayerTextDrawUseBox(playerid, PlayerTD[playerid][16], 0);
PlayerTextDrawSetProportional(playerid, PlayerTD[playerid][16], 1);
PlayerTextDrawSetSelectable(playerid, PlayerTD[playerid][16], 0);

PHONEAPP_CONTACT[playerid] = CreatePlayerTextDraw(playerid, 436.000000, 361.500000, "ld_dual:white");
PlayerTextDrawFont(playerid, PHONEAPP_CONTACT[playerid], 4);
PlayerTextDrawLetterSize(playerid, PHONEAPP_CONTACT[playerid], 0.600000, 2.000000);
PlayerTextDrawTextSize(playerid, PHONEAPP_CONTACT[playerid], 14.500000, 18.000000);
PlayerTextDrawSetOutline(playerid, PHONEAPP_CONTACT[playerid], 1);
PlayerTextDrawSetShadow(playerid, PHONEAPP_CONTACT[playerid], 0);
PlayerTextDrawAlignment(playerid, PHONEAPP_CONTACT[playerid], 1);
PlayerTextDrawColor(playerid, PHONEAPP_CONTACT[playerid], 9109759);
PlayerTextDrawBackgroundColor(playerid, PHONEAPP_CONTACT[playerid], 255);
PlayerTextDrawBoxColor(playerid, PHONEAPP_CONTACT[playerid], 50);
PlayerTextDrawUseBox(playerid, PHONEAPP_CONTACT[playerid], 1);
PlayerTextDrawSetProportional(playerid, PHONEAPP_CONTACT[playerid], 1);
PlayerTextDrawSetSelectable(playerid, PHONEAPP_CONTACT[playerid], 1);

PlayerTD[playerid][17] = CreatePlayerTextDraw(playerid, 440.500000, 364.000000, "ld_beat:chit");
PlayerTextDrawFont(playerid, PlayerTD[playerid][17], 4);
PlayerTextDrawLetterSize(playerid, PlayerTD[playerid][17], 0.600000, 2.000000);
PlayerTextDrawTextSize(playerid, PlayerTD[playerid][17], 4.500000, 6.000000);
PlayerTextDrawSetOutline(playerid, PlayerTD[playerid][17], 1);
PlayerTextDrawSetShadow(playerid, PlayerTD[playerid][17], 0);
PlayerTextDrawAlignment(playerid, PlayerTD[playerid][17], 1);
PlayerTextDrawColor(playerid, PlayerTD[playerid][17], -1);
PlayerTextDrawBackgroundColor(playerid, PlayerTD[playerid][17], 255);
PlayerTextDrawBoxColor(playerid, PlayerTD[playerid][17], 50);
PlayerTextDrawUseBox(playerid, PlayerTD[playerid][17], 1);
PlayerTextDrawSetProportional(playerid, PlayerTD[playerid][17], 1);
PlayerTextDrawSetSelectable(playerid, PlayerTD[playerid][17], 0);

PlayerTD[playerid][18] = CreatePlayerTextDraw(playerid, 437.000000, 368.000000, "ld_beat:chit");
PlayerTextDrawFont(playerid, PlayerTD[playerid][18], 4);
PlayerTextDrawLetterSize(playerid, PlayerTD[playerid][18], 0.600000, 2.000000);
PlayerTextDrawTextSize(playerid, PlayerTD[playerid][18], 12.500000, 8.000000);
PlayerTextDrawSetOutline(playerid, PlayerTD[playerid][18], 1);
PlayerTextDrawSetShadow(playerid, PlayerTD[playerid][18], 0);
PlayerTextDrawAlignment(playerid, PlayerTD[playerid][18], 1);
PlayerTextDrawColor(playerid, PlayerTD[playerid][18], -1);
PlayerTextDrawBackgroundColor(playerid, PlayerTD[playerid][18], 255);
PlayerTextDrawBoxColor(playerid, PlayerTD[playerid][18], 50);
PlayerTextDrawUseBox(playerid, PlayerTD[playerid][18], 1);
PlayerTextDrawSetProportional(playerid, PlayerTD[playerid][18], 1);
PlayerTextDrawSetSelectable(playerid, PlayerTD[playerid][18], 0);


/*Player Progress Bars
Requires "progress2" include by Southclaws
Download: https://github.com/Southclaws/progress2/releases */

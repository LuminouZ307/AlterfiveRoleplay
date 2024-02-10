
// Notification system 1.0
// Creator: HPQ123#8114

#include <YSI_Coding\y_hooks>

#define CB_YELLOW   1
#define CB_BLUE     2
#define CB_ORANGE   3
#define CB_GREY     4
#define CB_RED      5
#define CB_WHITE    6

// * Settings * //
#define 	MAX_CHATBOX 		(10) // max show notofication
#define 	MAX_NT_STRING 	(320)
#define 	MAX_NT_TITLE 	(64)
#define 	SECONDS_NT 		(5)

enum ntInfo { ntIcon[32], ntTitle[MAX_NT_TITLE], ntMessage[MAX_NT_STRING], ntLines, ntColor }
static notifyInfo[MAX_PLAYERS][MAX_CHATBOX][ntInfo], PlayerText:notifyPTD[MAX_PLAYERS][MAX_CHATBOX * 2], notifyIndex[MAX_PLAYERS];

#define notify::%0(%1) forward %0(%1); public %0(%1)
#define InternalNotification_show InternalNotification_Show
#define notification.	InternalNotification_

static const TDTextCaracterWidth[] = {
	0,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,
	12,12,12,12,12,12,12,13,13,28,28,28,28,8,17,17,30,28,28,12,9,21,28,14,28,28,
	28,28,28,28,28,28,13,13,30,30,30,30,10,25,23,21,24,22,20,24,24,17,20,22,20,
	30,27,27,26,26,24,23,24,31,23,31,24,23,21,28,33,33,14,28,10,11,12,9,11,10,
	10,12,12,7,7,13,5,18,12,10,12,11,10,12,8,13,13,18,17,13,12,30,30,37,35,37,
	25,25,25,25,33,21,24,24,24,24,17,17,17,17,27,27,27,27,31,31,31,31,11,11,11,
	11,11,20,9,10,10,10,10,7,7,7,7,10,10,10,10,13,13,13,13,27,12,30
};


ReturnCB_RGBA(color) {

	new new_color;
	switch(color) {
		case CB_YELLOW: new_color = CreateRGBA(255, 255, 8, 80);
		case CB_BLUE: new_color = CreateRGBA(141,209,240, 80);
		case CB_ORANGE: new_color = CreateRGBA(255,99,8, 80);
		case CB_GREY:   new_color = CreateRGBA(179,177,176, 80);
		case CB_RED:    new_color = CreateRGBA(255,8,8, 80);
		case CB_WHITE:  new_color = CreateRGBA(246,248,243, 80);
	}
	return new_color;
}
// Get width for char //
stock getSizeMessage(const string:message[], maxWidth=500) {
	new size = 0, lines=1, i=-1, lastPoint = 0;

	while(message[++i]) {
		size += TDTextCaracterWidth[message[i]];

		switch(message[i]) {
			case ' ': 
				lastPoint = i;

			default: 
				if(size >= maxWidth) 
					++lines, 
					size -= maxWidth, 
					size += i - lastPoint;
		}
	}
	return lines;
}

// main function for show notification //
stock SendChatbox(const playerid, const string:message[], color = CB_GREY, time = SECONDS_NT) {
	for(new x=-1;++x<notifyIndex[playerid];) {
		for(new i=-1;++i<2;) PlayerTextDrawDestroy(playerid, notifyPTD[playerid][(x*2) + i]);
		notifyInfo[playerid][notifyIndex[playerid]-x] = notifyInfo[playerid][(notifyIndex[playerid]-x)-1];
	}

	strmid(notifyInfo[playerid][0][ntMessage], message, 0, MAX_NT_STRING);
	notifyInfo[playerid][0][ntLines] = getSizeMessage(message);
    notifyInfo[playerid][0][ntColor] = color;
    
	++notifyIndex[playerid];

	new Float:static_x=0.0;
	for(new x=-1;++x<notifyIndex[playerid];) {
		createNotifyTD(playerid, x, x * 2, static_x);
		static_x+=(notifyInfo[playerid][x][ntLines] * 0.9) + 20.0;
	}

	SetTimerEx(#destroy_notify, time * 1000, false, #i, playerid);
	return 1;
}


// when the notification stops //
notify::destroy_notify(playerid) {
	if(!notifyIndex[playerid]) return 1;
	--notifyIndex[playerid];
	for(new i=-1;++i<2;) PlayerTextDrawDestroy(playerid, notifyPTD[playerid][(notifyIndex[playerid]*2) + i]);
	return 1;
}

// display notification //
stock createNotifyTD(const playerid, index, i, const Float:static_x) {
	new lines = notifyInfo[playerid][index][ntLines],Float:x = (lines * 0.9) + static_x;

	notifyPTD[playerid][i] = CreatePlayerTextDraw(playerid, 111.000000, 185.000000 - x, "_");
	PlayerTextDrawFont(playerid, notifyPTD[playerid][i], 1);
	PlayerTextDrawLetterSize(playerid, notifyPTD[playerid][i], 1.266666, 1.150001);
	PlayerTextDrawTextSize(playerid, notifyPTD[playerid][i], 361.000000, 208.000000);
	PlayerTextDrawSetOutline(playerid, notifyPTD[playerid][i], 1);
	PlayerTextDrawSetShadow(playerid, notifyPTD[playerid][i], 0);
	PlayerTextDrawAlignment(playerid, notifyPTD[playerid][i], 2);
	PlayerTextDrawColor(playerid, notifyPTD[playerid][i], notifyInfo[playerid][index][ntColor]);
	PlayerTextDrawBackgroundColor(playerid, notifyPTD[playerid][i], 255);
	PlayerTextDrawBoxColor(playerid, notifyPTD[playerid][i], ReturnCB_RGBA(notifyInfo[playerid][index][ntColor]));
	PlayerTextDrawUseBox(playerid, notifyPTD[playerid][i], 1);
	PlayerTextDrawSetProportional(playerid, notifyPTD[playerid][i], 1);
	PlayerTextDrawSetSelectable(playerid, notifyPTD[playerid][i], 0);

	PlayerTextDrawShow(playerid, notifyPTD[playerid][i]);

	notifyPTD[playerid][++i] = CreatePlayerTextDraw(playerid, 7.000000, 186.000000 - x, notifyInfo[playerid][index][ntMessage]);
	PlayerTextDrawFont(playerid, notifyPTD[playerid][i], 1);
	PlayerTextDrawLetterSize(playerid, notifyPTD[playerid][i], 0.133332, 0.800000);
	PlayerTextDrawTextSize(playerid, notifyPTD[playerid][i], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, notifyPTD[playerid][i], 0);
	PlayerTextDrawSetShadow(playerid, notifyPTD[playerid][i], 0);
	PlayerTextDrawAlignment(playerid, notifyPTD[playerid][i], 1);
	PlayerTextDrawColor(playerid, notifyPTD[playerid][i], -1);
	PlayerTextDrawBackgroundColor(playerid, notifyPTD[playerid][i], 255);
	PlayerTextDrawBoxColor(playerid, notifyPTD[playerid][i], 50);
	PlayerTextDrawUseBox(playerid, notifyPTD[playerid][i], 0);
	PlayerTextDrawSetProportional(playerid, notifyPTD[playerid][i], 1);
	PlayerTextDrawSetSelectable(playerid, notifyPTD[playerid][i], 0);
	PlayerTextDrawShow(playerid, notifyPTD[playerid][i]);
/*
    notifyPTD[playerid][i] = CreatePlayerTextDraw(playerid, 6.000000, 140.000000 - x, "ld_dual:white");
    PlayerTextDrawFont(playerid, notifyPTD[playerid][i], 4);
    PlayerTextDrawLetterSize(playerid, notifyPTD[playerid][i], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, notifyPTD[playerid][i], 210.500000, 15.000000);
    PlayerTextDrawSetOutline(playerid, notifyPTD[playerid][i], 1);
    PlayerTextDrawSetShadow(playerid, notifyPTD[playerid][i], 0);
    PlayerTextDrawAlignment(playerid, notifyPTD[playerid][i], 1);
    PlayerTextDrawColor(playerid, notifyPTD[playerid][i], notifyInfo[playerid][index][ntColor]);
    PlayerTextDrawBackgroundColor(playerid, notifyPTD[playerid][i], 255);
    PlayerTextDrawBoxColor(playerid, notifyPTD[playerid][i], 50);
    PlayerTextDrawUseBox(playerid, notifyPTD[playerid][i], 1);
    PlayerTextDrawSetProportional(playerid, notifyPTD[playerid][i], 1);
    PlayerTextDrawSetSelectable(playerid, notifyPTD[playerid][i], 0);
    PlayerTextDrawShow(playerid, notifyPTD[playerid][i]);

    notifyPTD[playerid][++i] = CreatePlayerTextDraw(playerid, 10.000000, 143.000000 - x, notifyInfo[playerid][index][ntMessage]);
    PlayerTextDrawFont(playerid, notifyPTD[playerid][i], 1);
    PlayerTextDrawLetterSize(playerid, notifyPTD[playerid][i], 0.133333, 0.800000);
    PlayerTextDrawTextSize(playerid, notifyPTD[playerid][i], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, notifyPTD[playerid][i], 0);
    PlayerTextDrawSetShadow(playerid, notifyPTD[playerid][i], 0);
    PlayerTextDrawAlignment(playerid, notifyPTD[playerid][i], 1);
    PlayerTextDrawColor(playerid, notifyPTD[playerid][i], -1);
    PlayerTextDrawBackgroundColor(playerid, notifyPTD[playerid][i], 255);
    PlayerTextDrawBoxColor(playerid, notifyPTD[playerid][i], 50);
    PlayerTextDrawUseBox(playerid, notifyPTD[playerid][i], 0);
    PlayerTextDrawSetProportional(playerid, notifyPTD[playerid][i], 1);
    PlayerTextDrawSetSelectable(playerid, notifyPTD[playerid][i], 0);
    PlayerTextDrawShow(playerid, notifyPTD[playerid][i]);

	notifyPTD[playerid][i] = CreatePlayerTextDraw(playerid, 29.42, 292.73 - x, "box");
	PlayerTextDrawLetterSize(playerid, notifyPTD[playerid][i], 0.0, 2.0 + (lines *0.9));
	PlayerTextDrawTextSize(playerid, notifyPTD[playerid][i], 132.0, 0.0);
	PlayerTextDrawAlignment(playerid, notifyPTD[playerid][i], 1);
	PlayerTextDrawColor(playerid, notifyPTD[playerid][i], -1);
	PlayerTextDrawUseBox(playerid, notifyPTD[playerid][i], 1);
	PlayerTextDrawBoxColor(playerid, notifyPTD[playerid][i], 113);
	PlayerTextDrawSetShadow(playerid, notifyPTD[playerid][i], 0);
	PlayerTextDrawSetOutline(playerid, notifyPTD[playerid][i], 0);
	PlayerTextDrawBackgroundColor(playerid, notifyPTD[playerid][i], 255);
	PlayerTextDrawFont(playerid, notifyPTD[playerid][i], 1);
	PlayerTextDrawSetProportional(playerid, notifyPTD[playerid][i], 1); 
	PlayerTextDrawSetShadow(playerid, notifyPTD[playerid][i], 0);
	PlayerTextDrawShow(playerid, notifyPTD[playerid][i]);

	notifyPTD[playerid][++i] = CreatePlayerTextDraw(playerid, 30.61, 308.96 - x, notifyInfo[playerid][index][ntMessage]);
	PlayerTextDrawLetterSize(playerid, notifyPTD[playerid][i], 0.145, 0.887);
	PlayerTextDrawTextSize(playerid, notifyPTD[playerid][i], 132.0, 0.0);
	PlayerTextDrawAlignment(playerid, notifyPTD[playerid][i], 1);
	PlayerTextDrawColor(playerid, notifyPTD[playerid][i], -1);
	PlayerTextDrawSetShadow(playerid, notifyPTD[playerid][i], 0);
	PlayerTextDrawSetOutline(playerid, notifyPTD[playerid][i], 0);
	PlayerTextDrawBackgroundColor(playerid, notifyPTD[playerid][i], 255);
	PlayerTextDrawFont(playerid, notifyPTD[playerid][i], 1);
	PlayerTextDrawSetProportional(playerid, notifyPTD[playerid][i], 1);
	PlayerTextDrawSetShadow(playerid, notifyPTD[playerid][i], 0);
	PlayerTextDrawShow(playerid, notifyPTD[playerid][i]);*/
	return true;
}

hook OnPlayerConnect(playerid)
{

	notifyIndex[playerid] = 0;
}

ErrorMsg(playerid, reason[]) {
	return SendChatbox(playerid, reason, CB_RED, 10000);
}

Syntax(playerid,reason[]) {
	return SendChatbox(playerid, reason, CB_GREY, 10000);
}

InfoCB(playerid,reason[]) {
	return SendChatbox(playerid, reason, CB_BLUE, 10000);
}

AdminCB(reason[]) {
	foreach(new i : Player) if(PlayerData[i][pAdmin]) {
		SendChatbox(i, va_return("AdmCmd: %s", reason), CB_RED, 10000);
	}
	return 1;
}
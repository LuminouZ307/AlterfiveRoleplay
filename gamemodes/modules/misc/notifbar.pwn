#include <YSI_Coding\y_hooks>

new PlayerText:NOTIFBAR[MAX_PLAYERS][2];

enum E_NOTIF_BAR {
    bool:notif_bar_active,
    notif_bar_time,
    notif_bar_timer
};

new NotifBar[MAX_PLAYERS][E_NOTIF_BAR];

ShowNotifTD(playerid, reason[], time = 5) {

    if(NotifBar[playerid][notif_bar_active])
        return 1;

    PlayerTextDrawSetString(playerid, NOTIFBAR[playerid][1], RemoveSpace(reason));

    for(new i = 0; i < 2; i++) {
        PlayerTextDrawShow(playerid, NOTIFBAR[playerid][i]);
    }
    NotifBar[playerid][notif_bar_active] = true;
    NotifBar[playerid][notif_bar_time] = time * 1000;
    NotifBar[playerid][notif_bar_timer] = SetTimerEx("internal_HideNotifBar", NotifBar[playerid][notif_bar_time], false, "d", playerid);
    return 1;
}

function internal_HideNotifBar(playerid) {
    if(!NotifBar[playerid][notif_bar_active])
        return 1;

    NotifBar[playerid][notif_bar_active] = false;
    NotifBar[playerid][notif_bar_timer] = 0;
    NotifBar[playerid][notif_bar_time] = 0;
    PlayerTextDrawSetString(playerid, NOTIFBAR[playerid][1], "_");

    for(new i = 0; i < 2; i++) {
        PlayerTextDrawHide(playerid, NOTIFBAR[playerid][i]);
    }
    return 1;
}
hook OnPlayerConnect(playerid) {

    NotifBar[playerid][notif_bar_time] = 0;
    NotifBar[playerid][notif_bar_active] = false;
    NotifBar[playerid][notif_bar_timer] = 0;
	NOTIFBAR[playerid][0] = CreatePlayerTextDraw(playerid, 74.000000, 227.000000, "_");
	PlayerTextDrawFont(playerid, NOTIFBAR[playerid][0], 1);
	PlayerTextDrawLetterSize(playerid, NOTIFBAR[playerid][0], 0.587500, 1.150002);
	PlayerTextDrawTextSize(playerid, NOTIFBAR[playerid][0], 298.500000, 107.000000);
	PlayerTextDrawSetOutline(playerid, NOTIFBAR[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, NOTIFBAR[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, NOTIFBAR[playerid][0], 2);
	PlayerTextDrawColor(playerid, NOTIFBAR[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, NOTIFBAR[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, NOTIFBAR[playerid][0], 99);
	PlayerTextDrawUseBox(playerid, NOTIFBAR[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, NOTIFBAR[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, NOTIFBAR[playerid][0], 0);

	NOTIFBAR[playerid][1] = CreatePlayerTextDraw(playerid, 24.000000, 228.500000, "_");
	PlayerTextDrawFont(playerid, NOTIFBAR[playerid][1], 1);
	PlayerTextDrawLetterSize(playerid, NOTIFBAR[playerid][1], 0.145833, 0.700000);
	PlayerTextDrawTextSize(playerid, NOTIFBAR[playerid][1], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, NOTIFBAR[playerid][1], 0);
	PlayerTextDrawSetShadow(playerid, NOTIFBAR[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, NOTIFBAR[playerid][1], 1);
	PlayerTextDrawColor(playerid, NOTIFBAR[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, NOTIFBAR[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, NOTIFBAR[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, NOTIFBAR[playerid][1], 0);
	PlayerTextDrawSetProportional(playerid, NOTIFBAR[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, NOTIFBAR[playerid][1], 0);
}
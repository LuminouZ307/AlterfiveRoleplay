
#define NOTIF_GENERAL   -1734038529
#define NOTIF_ERROR     -867809793
#define NOTIF_SUCCESS   1522112767
#define NOTIF_INFO      1435819263
#define NOTIF_WARNING   -389732097


enum e_notify
{
	NotifyIcon,
	NotifyMessage[64],
    NotifyTitle[64],
	NotifyLoading,
	NotifySize,
    NotifyColor
}
new NotifyData[MAX_PLAYERS][5][e_notify];
new MaxPlayerNotify[MAX_PLAYERS];
new PlayerText:ui_notifications[MAX_PLAYERS][5*5];
new IndexNotify[MAX_PLAYERS];

stock ShowNotify(const playerid, const string:title[], const string:message[], color = NOTIF_GENERAL, time = 5)
{
	if(MaxPlayerNotify[playerid] == 4) return 1;
	MaxPlayerNotify[playerid]++;
	for(new x=-1; ++x <IndexNotify[playerid];)
	{
		for(new i=-1;++i<5;) PlayerTextDrawDestroy(playerid, ui_notifications[playerid][(x*5) + i]);
		NotifyData[playerid][IndexNotify[playerid]-x] = NotifyData[playerid][(IndexNotify[playerid]-x)-1];
	}
    PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
	format(NotifyData[playerid][0][NotifyMessage],64, "%s", message);
    format(NotifyData[playerid][0][NotifyTitle],64, "%s", title);
	NotifyData[playerid][0][NotifySize] = 3;
    NotifyData[playerid][0][NotifyColor] = color;
	
	++IndexNotify[playerid];
	new Float:new_x=1.0;
	for(new x=-1;++x<IndexNotify[playerid];)
	{
		create_notify(playerid, x, x * 5, new_x);
		new_x += (NotifyData[playerid][x][NotifySize]*8.0)+15.0;
	}
	SetTimerEx("hide_notify", time * 999, false, "i", playerid);
	return 1;
}

stock create_notify(const playerid, index, i, const Float:new_x)
{
	new lines = NotifyData[playerid][index][NotifySize];
	new Float:x = (lines * 5) + new_x;
    ui_notifications[playerid][i] = CreatePlayerTextDraw(playerid, 527.000000, 123.000000 + x, "ld_dual:white");
    PlayerTextDrawFont(playerid, ui_notifications[playerid][i], 4);
    PlayerTextDrawLetterSize(playerid, ui_notifications[playerid][i], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, ui_notifications[playerid][i], 98.000000, 36.000000);
    PlayerTextDrawSetOutline(playerid, ui_notifications[playerid][i], 1);
    PlayerTextDrawSetShadow(playerid, ui_notifications[playerid][i], 0);
    PlayerTextDrawAlignment(playerid, ui_notifications[playerid][i], 1);
    PlayerTextDrawColor(playerid, ui_notifications[playerid][i], 893010175);
    PlayerTextDrawBackgroundColor(playerid, ui_notifications[playerid][i], 255);
    PlayerTextDrawBoxColor(playerid, ui_notifications[playerid][i], 50);
    PlayerTextDrawUseBox(playerid, ui_notifications[playerid][i], 1);
    PlayerTextDrawSetProportional(playerid, ui_notifications[playerid][i], 1);
    PlayerTextDrawSetSelectable(playerid, ui_notifications[playerid][i], 0);
    PlayerTextDrawShow(playerid, ui_notifications[playerid][i]);

    ui_notifications[playerid][++i] = CreatePlayerTextDraw(playerid, 527.000000, 123.000000 + x, "ld_dual:white");
    PlayerTextDrawFont(playerid, ui_notifications[playerid][i], 4);
    PlayerTextDrawLetterSize(playerid, ui_notifications[playerid][i], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, ui_notifications[playerid][i], 1.500000, 36.000000);
    PlayerTextDrawSetOutline(playerid, ui_notifications[playerid][i], 1);
    PlayerTextDrawSetShadow(playerid, ui_notifications[playerid][i], 0);
    PlayerTextDrawAlignment(playerid, ui_notifications[playerid][i], 1);
    PlayerTextDrawColor(playerid, ui_notifications[playerid][i], NotifyData[playerid][index][NotifyColor]);
    PlayerTextDrawBackgroundColor(playerid, ui_notifications[playerid][i], 255);
    PlayerTextDrawBoxColor(playerid, ui_notifications[playerid][i], 50);
    PlayerTextDrawUseBox(playerid, ui_notifications[playerid][i], 1);
    PlayerTextDrawSetProportional(playerid, ui_notifications[playerid][i], 1);
    PlayerTextDrawSetSelectable(playerid, ui_notifications[playerid][i], 0);
    PlayerTextDrawShow(playerid, ui_notifications[playerid][i]);

    ui_notifications[playerid][++i] = CreatePlayerTextDraw(playerid, 532.000000, 126.000000 + x, NotifyData[playerid][index][NotifyTitle]);
    PlayerTextDrawFont(playerid, ui_notifications[playerid][i], 1);
    PlayerTextDrawLetterSize(playerid, ui_notifications[playerid][i], 0.204166, 0.850000);
    PlayerTextDrawTextSize(playerid, ui_notifications[playerid][i], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, ui_notifications[playerid][i], 0);
    PlayerTextDrawSetShadow(playerid, ui_notifications[playerid][i], 0);
    PlayerTextDrawAlignment(playerid, ui_notifications[playerid][i], 1);
    PlayerTextDrawColor(playerid, ui_notifications[playerid][i], NotifyData[playerid][index][NotifyColor]);
    PlayerTextDrawBackgroundColor(playerid, ui_notifications[playerid][i], 255);
    PlayerTextDrawBoxColor(playerid, ui_notifications[playerid][i], 50);
    PlayerTextDrawUseBox(playerid, ui_notifications[playerid][i], 0);
    PlayerTextDrawSetProportional(playerid, ui_notifications[playerid][i], 1);
    PlayerTextDrawSetSelectable(playerid, ui_notifications[playerid][i], 0);
    PlayerTextDrawShow(playerid, ui_notifications[playerid][i]);

    ui_notifications[playerid][++i] = CreatePlayerTextDraw(playerid, 532.000000, 135.000000 + x, NotifyData[playerid][index][NotifyMessage]);
    PlayerTextDrawFont(playerid, ui_notifications[playerid][i], 1);
    PlayerTextDrawLetterSize(playerid, ui_notifications[playerid][i], 0.141666, 0.600000);
    PlayerTextDrawTextSize(playerid, ui_notifications[playerid][i], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, ui_notifications[playerid][i], 0);
    PlayerTextDrawSetShadow(playerid, ui_notifications[playerid][i], 1);
    PlayerTextDrawAlignment(playerid, ui_notifications[playerid][i], 1);
    PlayerTextDrawColor(playerid, ui_notifications[playerid][i], -1);
    PlayerTextDrawBackgroundColor(playerid, ui_notifications[playerid][i], 255);
    PlayerTextDrawBoxColor(playerid, ui_notifications[playerid][i], 50);
    PlayerTextDrawUseBox(playerid, ui_notifications[playerid][i], 0);
    PlayerTextDrawSetProportional(playerid, ui_notifications[playerid][i], 1);
    PlayerTextDrawSetSelectable(playerid, ui_notifications[playerid][i], 0);
    PlayerTextDrawShow(playerid, ui_notifications[playerid][i]);

    ui_notifications[playerid][++i] = CreatePlayerTextDraw(playerid, 527.000000, 157.000000 + x, "ld_dual:white");
    PlayerTextDrawFont(playerid, ui_notifications[playerid][i], 4);
    PlayerTextDrawLetterSize(playerid, ui_notifications[playerid][i], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, ui_notifications[playerid][i], 98.000000, 2.000000);
    PlayerTextDrawSetOutline(playerid, ui_notifications[playerid][i], 1);
    PlayerTextDrawSetShadow(playerid, ui_notifications[playerid][i], 0);
    PlayerTextDrawAlignment(playerid, ui_notifications[playerid][i], 1);
    PlayerTextDrawColor(playerid, ui_notifications[playerid][i], NotifyData[playerid][index][NotifyColor]);
    PlayerTextDrawBackgroundColor(playerid, ui_notifications[playerid][i], 255);
    PlayerTextDrawBoxColor(playerid, ui_notifications[playerid][i], 50);
    PlayerTextDrawUseBox(playerid, ui_notifications[playerid][i], 1);
    PlayerTextDrawSetProportional(playerid, ui_notifications[playerid][i], 1);
    PlayerTextDrawSetSelectable(playerid, ui_notifications[playerid][i], 0);
    PlayerTextDrawShow(playerid, ui_notifications[playerid][i]);
	return true;
}

function hide_notify(playerid)
{
	if(!IndexNotify[playerid]) return 1;
	--IndexNotify[playerid];
	MaxPlayerNotify[playerid]--;
	for(new i=-1;++i<5;) PlayerTextDrawDestroy(playerid, ui_notifications[playerid][(IndexNotify[playerid]*5)+i]);
	return 1;
}

stock ErrorTD(playerid, reason[], time = 5) {
    return ShowNotify(playerid, "ERROR", RemoveSpace(reason), NOTIF_ERROR, time);
}

stock Notify(playerid, title[], reason[], color, time = 5) {
    return ShowNotify(playerid, RemoveSpace(title), RemoveSpace(reason), color, time);
}

stock InfoTD(playerid, reason[], time = 5) {
    return ShowNotify(playerid, "INFO", RemoveSpace(reason), NOTIF_INFO, time);
}

stock WarningTD(playerid, reason[], time = 5) {
    return ShowNotify(playerid, "WARNING", RemoveSpace(reason), NOTIF_WARNING, time);
}
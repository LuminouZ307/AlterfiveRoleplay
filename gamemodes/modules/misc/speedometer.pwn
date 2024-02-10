#include <YSI_Coding\y_hooks>

new PlayerText:SPEEDO_TD[MAX_PLAYERS][3];

hook OnPlayerConnect(playerid) {
	SPEEDO_TD[playerid][0] = CreatePlayerTextDraw(playerid, 155.000000, 407.000000, "00:00");
	PlayerTextDrawFont(playerid, SPEEDO_TD[playerid][0], 1);
	PlayerTextDrawLetterSize(playerid, SPEEDO_TD[playerid][0], 0.183333, 0.900000);
	PlayerTextDrawTextSize(playerid, SPEEDO_TD[playerid][0], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, SPEEDO_TD[playerid][0], 0);
	PlayerTextDrawSetShadow(playerid, SPEEDO_TD[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, SPEEDO_TD[playerid][0], 1);
	PlayerTextDrawColor(playerid, SPEEDO_TD[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, SPEEDO_TD[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, SPEEDO_TD[playerid][0], 50);
	PlayerTextDrawUseBox(playerid, SPEEDO_TD[playerid][0], 0);
	PlayerTextDrawSetProportional(playerid, SPEEDO_TD[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, SPEEDO_TD[playerid][0], 0);

	SPEEDO_TD[playerid][1] = CreatePlayerTextDraw(playerid, 155.000000, 416.000000, "100 ~r~KMH ~w~100 ~r~FUEL");
	PlayerTextDrawFont(playerid, SPEEDO_TD[playerid][1], 1);
	PlayerTextDrawLetterSize(playerid, SPEEDO_TD[playerid][1], 0.183333, 0.900000);
	PlayerTextDrawTextSize(playerid, SPEEDO_TD[playerid][1], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, SPEEDO_TD[playerid][1], 0);
	PlayerTextDrawSetShadow(playerid, SPEEDO_TD[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, SPEEDO_TD[playerid][1], 1);
	PlayerTextDrawColor(playerid, SPEEDO_TD[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, SPEEDO_TD[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, SPEEDO_TD[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, SPEEDO_TD[playerid][1], 0);
	PlayerTextDrawSetProportional(playerid, SPEEDO_TD[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, SPEEDO_TD[playerid][1], 0);

	SPEEDO_TD[playerid][2] = CreatePlayerTextDraw(playerid, 155.000000, 425.000000, "~y~NE ~w~I Los Santos I Ganton Street");
	PlayerTextDrawFont(playerid, SPEEDO_TD[playerid][2], 1);
	PlayerTextDrawLetterSize(playerid, SPEEDO_TD[playerid][2], 0.183333, 0.900000);
	PlayerTextDrawTextSize(playerid, SPEEDO_TD[playerid][2], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, SPEEDO_TD[playerid][2], 0);
	PlayerTextDrawSetShadow(playerid, SPEEDO_TD[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, SPEEDO_TD[playerid][2], 1);
	PlayerTextDrawColor(playerid, SPEEDO_TD[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, SPEEDO_TD[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, SPEEDO_TD[playerid][2], 50);
	PlayerTextDrawUseBox(playerid, SPEEDO_TD[playerid][2], 0);
	PlayerTextDrawSetProportional(playerid, SPEEDO_TD[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, SPEEDO_TD[playerid][2], 0);
}

hook OnPlayerSecondUpdate(playerid) {

    new vehicleid = GetPlayerVehicleID(playerid);
    if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER && IsEngineVehicle(vehicleid)) {
        new string[128], hour, minute, second;

        gettime(hour, minute, second);
        format(string, sizeof(string), "%02d:%02d", hour, minute);
        PlayerTextDrawSetString(playerid, SPEEDO_TD[playerid][0], string);

        format(string, sizeof(string), "%03d ~r~KMH ~w~%.2f ~r~FUEL", floatround(GetVehicleSpeed(vehicleid)), VehicleData[vehicleid][vehicleFuel]);
        PlayerTextDrawSetString(playerid, SPEEDO_TD[playerid][1], string);

        format(string, sizeof(string), "~y~%s ~w~I %s I %s", GetPlayerDirection(playerid), GetPlayerCity(playerid), GetPlayerZone(playerid));
        PlayerTextDrawSetString(playerid, SPEEDO_TD[playerid][2], string);

    }
}

ToggleSpeedometer(playerid, bool:status) {
    if(status) {
        for(new i = 0; i < 3; i++) {
            PlayerTextDrawShow(playerid, SPEEDO_TD[playerid][i]);
        }
    }
    else {
        for(new i = 0; i < 3; i++) {
            PlayerTextDrawHide(playerid, SPEEDO_TD[playerid][i]);
        }
    }
    return 1;
}

hook OnPlayerStateChange(playerid, newstate, oldstate) {
    if(newstate == PLAYER_STATE_DRIVER) {
        ToggleSpeedometer(playerid, true);
    }
    if(newstate == PLAYER_STATE_ONFOOT && oldstate == PLAYER_STATE_DRIVER) {
        ToggleSpeedometer(playerid, false);
    }
}
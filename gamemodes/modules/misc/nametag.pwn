#include <YSI_Coding\y_hooks>

SyncNameTag(playerid) {

	new nametag[64], id;

	if(PlayerData[playerid][pFactionDuty]) {

        id = GetPlayerFaction(playerid);
		format(nametag, sizeof(nametag), "{%06x}%s - #%04d\n%s(%d)", FactionData[id][factionColor] >>> 8, GetPlayerFactionRank(playerid), PlayerData[playerid][pFactionBadge], GetRPName(playerid, false), playerid);
	}
    else {
        format(nametag, sizeof(nametag), ""WHITE"%s(%d)", GetRPName(playerid, false), playerid);
    }

	if(!IsValidDynamic3DTextLabel(PlayerData[playerid][pNameTag])) {
		PlayerData[playerid][pNameTag] = CreateDynamic3DTextLabel(nametag, -1, 0.0, 0.0, 0.12, 8.0, playerid, INVALID_VEHICLE_ID, 1, -1, GetPlayerInterior(playerid), -1, 8.0);
	}
	else {
		Streamer_SetIntData(STREAMER_TYPE_3D_TEXT_LABEL, PlayerData[playerid][pNameTag], E_STREAMER_INTERIOR_ID, GetPlayerInterior(playerid));
		UpdateDynamic3DTextLabelText(PlayerData[playerid][pNameTag], -1, nametag);
	}
	return 1;
}

hook OnPlayerDisconnectEx(playerid) {
    if(IsValidDynamic3DTextLabel(PlayerData[playerid][pNameTag]))
        DestroyDynamic3DTextLabel(PlayerData[playerid][pNameTag]);
}

hook OnPlayerConnect(playerid) {
    PlayerData[playerid][pNameTag] = Text3D:INVALID_STREAMER_ID;
}
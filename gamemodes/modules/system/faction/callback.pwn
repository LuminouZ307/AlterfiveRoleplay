#include <YSI_Coding\y_hooks>


hook OnGameModeInitEx() {
    mysql_tquery(sqlcon, "SELECT * FROM `factions`", "OnLoadFaction");
}

hook OnPlayerPressY(playerid) {

    new factionid = GetPlayerFaction(playerid);

    if(IsPlayerInRangeOfPoint(playerid, 2.5, FactionData[factionid][factionLocker][0], FactionData[factionid][factionLocker][1], FactionData[factionid][factionLocker][2])) {
        ShowFactionLocker(playerid);
    }
    return Y_HOOKS_CONTINUE_RETURN_1;
}   

hook OnFSelectionResponse(playerid, fselectid, modelid, response) {	
	if(fselectid == SELECTION_FACTIONSKIN && response) {

        PlayerData[playerid][pFactionSkin] = modelid;
		SetPlayerSkin(playerid, PlayerData[playerid][pFactionSkin]);	
        fselection_hide(playerid);
	}
	return 1;
}
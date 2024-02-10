#include <YSI_Coding\y_hooks>

hook OnGameModeInitEx() {
    mysql_tquery(sqlcon, "SELECT * FROM `doors`", "OnLoadDoor");
}

hook OnPlayerPressEnter(playerid) {

    new idx = -1;

    if((idx = GetNearestDoorExt(playerid)) != -1) {
        EnterDoor(playerid, idx);
    }

    if((idx = GetNearestDoorInt(playerid)) != -1) {
        ExitDoor(playerid, idx);
    }
    return Y_HOOKS_CONTINUE_RETURN_1;
}
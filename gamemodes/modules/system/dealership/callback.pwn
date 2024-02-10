#include <YSI_Coding\y_hooks>

hook OnGameModeInit() {
    CreateHoop(305.6821,-1359.2876,14.4583, 2, 0, 15.0, ""GREEN"[Y] "WHITE"Membuka dealer menu", 0, 0);
}

hook OnPlayerPressY(playerid) {
    if(IsPlayerInRangeOfPoint(playerid, 5.0, 305.6821,-1359.2876,14.4583)) {

        ShowDealerMenu(playerid);
    }
    return Y_HOOKS_CONTINUE_RETURN_1;
}

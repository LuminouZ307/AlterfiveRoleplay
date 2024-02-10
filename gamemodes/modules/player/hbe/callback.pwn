#include <YSI_Coding\y_hooks>


hook OnPlayerSpawn(playerid) {
    ShowHBE_GUI(playerid);
}

hook OnPlayerConnect(playerid) {
    CreatePlayerHBE_GUI(playerid);
}
hook OnPlayerSecondUpdate(playerid) {

    if(IsCharacterSpawned(playerid)) {
		new animidx = GetPlayerAnimationIndex(playerid),
			k,
			ud,
			lr,
			Float:adjustment,
			Float:adjustment1;    

		GetPlayerKeys(playerid, k, ud, lr);

		if(animidx == 43) {
			adjustment = (0.06 * 0.4);
			adjustment1 = (0.06 * 0.3); // Sitting
		} else if(animidx == 1159) {
			adjustment = (0.06 * 0.7);
			adjustment1 = (0.06 * 0.7); // Crouching
		} else if(animidx == 1195) {
			adjustment = (0.06 * 1.9);
			adjustment1 = (0.06 * 1.5); // Jumping
		} else if(animidx == 1231) {
			if(k & KEY_WALK) {
				adjustment = (0.06 * 0.08);
				adjustment1 = (0.06 * 0.07); // Walking
			} else if(k & KEY_SPRINT) {
				adjustment = (0.06 * 1.5);
				adjustment1 = (0.06 * 1.2); // Sprinting
			} else if(k & KEY_JUMP) {
				adjustment = (0.06 * 1.8);
				adjustment1 = (0.06 * 1.7); // Jumping
			} else {
				adjustment = (0.06 * 0.8);
				adjustment1 = (0.06 * 0.4); // Jogging
			}
		} else {
			adjustment = 0.05;
			adjustment1 = 0.04;
		}

		adjustment *= 0.2;
		adjustment1 *= 0.2;

		if(PlayerData[playerid][pHunger] > 0.0) {
			SetPlayerHunger(playerid, GetPlayerHunger(playerid)-adjustment);
		}
		if(PlayerData[playerid][pThirst] > 0.0){ 
			SetPlayerThirst(playerid, GetPlayerThirst(playerid)-adjustment1);
		}
        UpdateHBE_GUI(playerid);
    }
    return Y_HOOKS_CONTINUE_RETURN_1;
}


new Float:IdlePos[MAX_PLAYERS][3], IdleAnim[MAX_PLAYERS];

#include <YSI_Coding\y_hooks>

hook OnPlayerConnect(playerid) {
    PlayerData[playerid][pLoopAnim] = false;
    IdleAnim[playerid] = false;
}
Idleanimations(playerid) {

    new
    Float:x,
    Float:y,
    Float:z;

    GetPlayerPos(playerid, x, y, z);

    if (GetPlayerState(playerid) == PLAYER_STATE_ONFOOT && !PlayerData[playerid][pLoopAnim] && IdlePos[playerid][0] == x && IdlePos[playerid][1] == y && IdlePos[playerid][2] == z) {
        
       
        new randchance = random(6);
        if(IsTwoHandWeapon(GetPlayerWeapon(playerid))) {
            ApplyAnimation(playerid, "ped", "IDLE_armed", 4.1, 0, 1, 1, 1, 0, 1);
        }
        else {

            if (randchance == 0) {
                ApplyAnimation(playerid, "PLAYIDLES", "time", 4.1, 0, 1, 1, 0, 0, 1);
                
            }
            if (randchance == 1) {
                ApplyAnimation(playerid, "PLAYIDLES", "strleg", 4.1, 0, 1, 1, 0, 0, 1);
                
            }
            if (randchance == 2) {
                ApplyAnimation(playerid, "PLAYIDLES", "stretch", 4.1, 0, 1, 1, 0, 0, 1);
                
            }
            if (randchance == 3) {
                ApplyAnimation(playerid, "PLAYIDLES", "shift", 4.1, 0, 1, 1, 0, 0, 1);
                
            }
            if (randchance == 4) {
                ApplyAnimation(playerid, "SWEET", "plyr_hndshldr_01", 4.1, 0, 1, 1, 0, 0, 1);
                
            }
            if (randchance == 5) {
                ApplyAnimation(playerid, "WUZI", "Wuzi_stand_loop", 4.1, 0, 1, 1, 0, 0, 1);
                
            }
        }
        IdleAnim[playerid] = true;
    }
     
    IdlePos[playerid][0] = x;
	IdlePos[playerid][1] = y;
	IdlePos[playerid][2] = z;
    return 1;
}
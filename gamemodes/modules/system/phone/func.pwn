GetNumberOwner(number[]) {

    new playerid = INVALID_PLAYER_ID;
    foreach(new i : Player) if(isequal(number, PlayerData[i][pPhoneNumber])) {
        playerid = i;
        break;
    }
    return playerid;
}
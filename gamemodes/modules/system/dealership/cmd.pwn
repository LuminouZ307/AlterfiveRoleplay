CMD:addcardealer(playerid, params[]) {
    if(PlayerData[playerid][pAdmin] < 5)
        return NoAdmin(playerid);

    ShowAddCarDealer(playerid);
    return 1;
}
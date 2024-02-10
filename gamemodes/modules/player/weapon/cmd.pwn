CMD:givewep(playerid, params[])
{
    new
        userid,
        weaponid,
        ammo
    ;

    if(sscanf(params, "uii", userid, weaponid, ammo))
        return Syntax(playerid, "/givewep [playerid] [weaponid] [ammo]");

    if(userid == INVALID_PLAYER_ID)
        return ErrorMsg(playerid, "You have specified invalid player.");

    if(!(0 < weaponid < 46))
        return ErrorMsg(playerid, "Invalid weapon id!");

    if(ammo < 1 || ammo > 2000)
        return ErrorMsg(playerid, "Ammo only 1 - 2000");
        
    if(PlayerHasWeaponInSlot(userid, weaponid))
        return ErrorMsg(playerid, "There is same weapon on that player slot.");

    GivePlayerWeaponEx(userid, weaponid, ammo);
    return 1;
}

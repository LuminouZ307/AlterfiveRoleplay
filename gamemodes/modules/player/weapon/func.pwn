function PlayerWeapon_Load(playerid)
{
	new weaponid;
	
	for(new i = 0; i < cache_num_rows(); i++)
	{
		weaponid = cache_get_field_int(i, "weaponid");
		new slot = g_aWeaponSlots[weaponid];

		if(!(0 < weaponid < 46))
			continue;

	    PlayerGuns[playerid][slot][weapon_id] 			= weaponid;
		PlayerGuns[playerid][slot][weapon_slot] 		= slot;
		PlayerGuns[playerid][slot][weapon_ammo] 		= cache_get_field_int(i, "ammo");

		cache_get_field_content(i, "serial", PlayerGuns[playerid][slot][weapon_serial], 64);
		
	}

    RefreshWeapon(playerid); 
    
	SetPlayerArmedWeapon(playerid, 0);
	return 1; 
}

RemoveWeaponInSlot(playerid, slotid) 
{
    new
        arrWeapons[2][13];
        
    for (new i = 0; i < 13; i ++) {
        GetPlayerWeaponData(playerid, i, arrWeapons[0][i], arrWeapons[1][i]);
    }
    ResetPlayerWeapons(playerid);
    
    for (new i = 0; i < 13; i ++) if (i != slotid) {
        GivePlayerWeapon(playerid, arrWeapons[0][i], arrWeapons[1][i]);
    }
    return 1;
}

PlayerHasWeaponInSlot(playerid, weaponid) 
{
	if(weaponid == 0){
		return 0;
	}
	
    if(PlayerGuns[playerid][g_aWeaponSlots[weaponid]][weapon_slot] == g_aWeaponSlots[weaponid]) {
        return 1;
    }
    return 0;
}

ReturnWeaponName(weaponid)
{
    new weapon[22];
    switch(weaponid)
    {
        case 0: weapon = "Fist";
        case 18: weapon = "Molotov Cocktail";
        case 44: weapon = "Night Vision Goggles";
        case 45: weapon = "Thermal Goggles";
        case 54: weapon = "Fall";
        default: GetWeaponName(weaponid, weapon, sizeof(weapon));
    }
    return weapon;
}

GivePlayerWeaponEx(playerid, weaponid, ammo = DEFAULT_AMMO, serial[] = "no_serial") 
{
	if(!(0 < weaponid < 46))
		return 0;

	if(PlayerHasWeapon(playerid, weaponid))
		return 1;

	new query[255],
		slot = g_aWeaponSlots[weaponid];

	if(slot == 1 || slot == 10)
		ammo = 1;

	PlayerGuns[playerid][slot][weapon_id] 			= weaponid;
	PlayerGuns[playerid][slot][weapon_ammo] 		= ammo;
	PlayerGuns[playerid][slot][weapon_slot] 		= slot;
	format(PlayerGuns[playerid][slot][weapon_serial], 64, "%s", serial);

	GivePlayerWeapon(playerid, weaponid, 999999);

	mysql_format(sqlcon, query, sizeof(query), "INSERT INTO weapon_players (`ownerid`, `slot`, `weaponid`, `ammo`, `created`, `serial`) VALUES('%d', '%d', '%d', '%d', '%d', '%e') ON DUPLICATE KEY UPDATE ammo = %d", 
    GetPlayerSQLID(playerid), slot, weaponid, ammo, gettime(), serial,  ammo);

	mysql_tquery(sqlcon, query);
	return 1;
}

SQL_SaveWeapon(playerid) 
{
	for(new i = 1; i < MAX_WEAPON_SLOT; i++)
	{
		if(!PlayerGuns[playerid][i][weapon_id]) 
			continue;
		
		new query[255];
		mysql_format(sqlcon, query, sizeof(query), "INSERT INTO weapon_players (`ownerid`, `slot`, `weaponid`, `ammo`, `created`, `serial`) VALUES('%d', '%d', '%d', '%d', '%d', '%e') ON DUPLICATE KEY UPDATE ammo = %d", 
        GetPlayerSQLID(playerid), i, PlayerGuns[playerid][i][weapon_id], PlayerGuns[playerid][i][weapon_ammo], gettime(), PlayerGuns[playerid][i][weapon_serial], PlayerGuns[playerid][i][weapon_ammo]);
		mysql_tquery(sqlcon, query);
	}
	return 1;
}

ResetWeaponID(playerid, weaponid) 
{
	new slot = g_aWeaponSlots[weaponid];

    PlayerGuns[playerid][slot][weapon_id] = PlayerGuns[playerid][slot][weapon_ammo] = 0;
	PlayerGuns[playerid][slot][weapon_slot] = 0;

	mysql_tquery(sqlcon, va_return("DELETE FROM `weapon_players` WHERE `slot` = '%d' AND `userid` = '%d';", slot, GetPlayerSQLID(playerid)));

	RemoveWeaponInSlot(playerid, slot);
	return 1;
}

ResetWeaponInSlot(playerid, slot) {
    PlayerGuns[playerid][slot][weapon_id] = PlayerGuns[playerid][slot][weapon_ammo] = 0;
	PlayerGuns[playerid][slot][weapon_slot] = 0;

	mysql_tquery(sqlcon, va_return("DELETE FROM `weapon_players` WHERE `slot` = '%d' AND `userid` = '%d';", slot, GetPlayerSQLID(playerid)));

	RemoveWeaponInSlot(playerid, slot);
	return 1;	
}
ResetWeapons(playerid)
{
	ResetPlayerWeapons(playerid);

    for (new i = 0; i < MAX_WEAPON_SLOT; i ++) if(PlayerGuns[playerid][i][weapon_id]) {
        PlayerGuns[playerid][i][weapon_id] = PlayerGuns[playerid][i][weapon_ammo] = 0;
		PlayerGuns[playerid][i][weapon_slot] = 0;

    }
	mysql_tquery(sqlcon, va_return("DELETE FROM `weapon_players` WHERE `userid` = '%d';", GetPlayerSQLID(playerid)));
	return 1;
}

GetWeapon(playerid) 
{
    new weaponid = GetPlayerWeapon(playerid);

    if(1 < weaponid < 46 && PlayerGuns[playerid][g_aWeaponSlots[weaponid]][weapon_id] == weaponid)
        return weaponid;

    return 0;
}

ReturnWeaponCount(playerid) 
{
	new count;

	for (new i = 0; i < MAX_WEAPON_SLOT; i ++) if(PlayerGuns[playerid][i][weapon_id]) {
		count++;
    }
    return count;
}

PlayerHasWeapon(playerid, weaponid) 
{
    for (new i = 0; i < MAX_WEAPON_SLOT; i ++) if(PlayerGuns[playerid][i][weapon_id] == weaponid) {
        return 1;
    }
    return 0;
}

ReturnWeaponAmmo(playerid, weaponid)
{
	new slot = g_aWeaponSlots[weaponid];

	if(PlayerGuns[playerid][slot][weapon_id] != 0)
		return PlayerGuns[playerid][slot][weapon_ammo];

	return 0;
}

RefreshWeapon(playerid)
{
	ResetPlayerWeapons(playerid);

	for(new i = 1; i != MAX_WEAPON_SLOT; i++) if(PlayerGuns[playerid][i][weapon_id]) {
        GivePlayerWeapon(playerid, PlayerGuns[playerid][i][weapon_id], 999999);
    }
}

RefreshWeaponSlot(playerid, weaponid)
{
	if (weaponid < 0 || weaponid > 46)
		return 0;

	new slot = g_aWeaponSlots[weaponid];

	RemoveWeaponInSlot(playerid, slot);

	if(!PlayerGuns[playerid][slot][weapon_id])
		return 0;

    GivePlayerWeapon(playerid, PlayerGuns[playerid][slot][weapon_id], 999999);
    return 1;
}

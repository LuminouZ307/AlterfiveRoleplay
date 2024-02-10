GetFreeFactionID() {
    new idx = -1;
    for(new i = 0; i < MAX_FACTIONS; i++) if(!FactionData[i][factionExists]) {
        idx = i;
        break;
    }
    return idx;
}


/*
    factionID,
    bool:factionExists,
    factionName[24],
    Float:factionLocker[3],
    factionWorld,
    factionInterior,
    factionType,
    factionRanks,*/


GetPlayerFactionID(playerid) {
    return PlayerData[playerid][pFactionID];
}

SetFaction(playerid, id, rank) {

    if(!FactionData[id][factionExists])
        return 1;

    PlayerData[playerid][pFactionID] = FactionData[id][factionID];
    PlayerData[playerid][pFactionRank] = rank;
    SQL_SaveCharacter(playerid);
    return 1;
}
GetPlayerFaction(playerid) {
    new id = -1;

    for(new i = 0; i < MAX_FACTIONS; i++) if(FactionData[i][factionExists] && FactionData[i][factionID] == GetPlayerFactionID(playerid)) {
        id = i;
        break;
    }
    return id;
}


GetPlayerFactionRank(playerid) {
    new str[64], rank = PlayerData[playerid][pFactionRank];

    if(isequal(FactionRankName[playerid][rank], "None", true)) {
        format(str, sizeof(str), "Rank %d", rank);
    }
    else {
        format(str, sizeof(str), FactionRankName[playerid][rank]);
    }
    return str;
}
GetPlayerFactionType(playerid) {
    new id = GetPlayerFaction(playerid);
    return FactionData[id][factionType];
}


CreateFaction(name[], type) {

    new id = -1;

    if((id = GetFreeFactionID()) != -1) {
        FactionData[id][factionExists] = true;
        format(FactionData[id][factionName], 64, name);

        for(new i = 0; i < 3; i++) {
            FactionData[id][factionLocker][i] = 0.0;
        }

        FactionData[id][factionWorld] = 0;
        FactionData[id][factionInterior] = 0;
        FactionData[id][factionType] = type;
        FactionData[id][factionRanks] = 6;
        FactionData[id][factionColor] = 0xFFFFFF00;

        for(new i = 0; i < 15; i++) {
            format(FactionRankName[id][i], 64, "None");
            FactionData[id][factionSkin][i] = 0;
            FactionData[id][factionWeapon][i] = 0;
            FactionData[id][factionAmmo][i] = 0;
        }
        mysql_tquery(sqlcon, va_return("INSERT INTO `factions` (`Name`) VALUES('%s')", name), "OnFactionCreated", "d", id);
    }
    return id;
}


SQL_SaveFaction(id) {
    new query[2012];

    mysql_format(sqlcon, query, sizeof(query), "UPDATE `factions` SET `Name` = '%e', `Type` = '%d', `World` = '%d', `Interior` = '%d', `Ranks` = '%d'",
        FactionData[id][factionName],
        FactionData[id][factionType],
        FactionData[id][factionWorld],
        FactionData[id][factionInterior],
        FactionData[id][factionRanks]
    );
    mysql_format(sqlcon, query, sizeof(query), "%s, `LockerX` = '%f', `LockerY` = '%f', `LockerZ` = '%f', `FactionColor` = '%d'",
        query,
        FactionData[id][factionLocker][0],
        FactionData[id][factionLocker][1],
        FactionData[id][factionLocker][2],
        FactionData[id][factionColor]
    );
	for(new i = 0; i < 15; i++)
	{
		mysql_format(sqlcon, query, sizeof(query), "%s, `FactionSkin%d` = '%d', `FactionWeapon%d` = '%d', `FactionAmmo%d` = '%d', `FactionRank%d` = '%e'", 
            query, 
            i + 1, FactionData[id][factionSkin][i], 
            i + 1, FactionData[id][factionWeapon][i], 
            i + 1, FactionData[id][factionAmmo][i], 
            i + 1, FactionRankName[id][i]
        );
	}
    mysql_format(sqlcon, query, sizeof(query), "%s WHERE `ID` = '%d'",
        query,
        FactionData[id][factionID]
    );

    return mysql_tquery(sqlcon, query);
}

SyncFaction(id) {
    if(!FactionData[id][factionExists])
        return 1;

    if(IsValidHoop(FactionData[id][factionHoop]))
        DestroyHoop(FactionData[id][factionHoop]);

    if(FactionData[id][factionLocker][0] != 0.0 && FactionData[id][factionLocker][1] != 0.0 && FactionData[id][factionLocker][2] != 0.0) {
        if(FactionData[id][factionType] != FACTION_PEDAGANG) {
            CreateHoop(FactionData[id][factionLocker][0], FactionData[id][factionLocker][1], FactionData[id][factionLocker][2], 1, X11_BLUE, 10.0, va_return(""GREEN"[Y] "WHITE"%s\nFaction Locker", FactionData[id][factionName]),  FactionData[id][factionInterior],  FactionData[id][factionWorld]);
        }
        else {
            CreateHoop(FactionData[id][factionLocker][0], FactionData[id][factionLocker][1], FactionData[id][factionLocker][2], 1, X11_BLUE, 10.0, va_return(""GREEN"[Y] "WHITE"%s\nFaction Locker", FactionData[id][factionName]),  FactionData[id][factionInterior],  FactionData[id][factionWorld], "Tekan H untuk membuat makan/minum");
        }
    }
    return 1;
}
function OnFactionCreated(id) {
    FactionData[id][factionID] = cache_insert_id();
    SQL_SaveFaction(id);
}
function OnLoadFaction() {
    new rows = cache_num_rows(), str[256];

    if(rows) {
        for(new i = 0; i < rows; i++) {
            FactionData[i][factionExists] = true;
            
            cache_get_value_name(i, "Name", FactionData[i][factionName]);
            FactionData[i][factionID] = cache_get_field_int(i, "ID");
            FactionData[i][factionType] = cache_get_field_int(i, "Type");
            FactionData[i][factionWorld] = cache_get_field_int(i, "World");
            FactionData[i][factionInterior] = cache_get_field_int(i, "Interior");
            FactionData[i][factionRanks] = cache_get_field_int(i, "Ranks");
            FactionData[i][factionLocker][0] = cache_get_field_float(i, "LockerX");
            FactionData[i][factionLocker][1] = cache_get_field_float(i, "LockerY");
            FactionData[i][factionLocker][2] = cache_get_field_float(i, "LockerZ");
            FactionData[i][factionColor] = cache_get_field_int(i, "FactionColor");

		    for (new j = 0; j < 15; j ++) {
		        format(str, sizeof(str), "FactionSkin%d", j + 1);
		        cache_get_value_name_int(i, str, FactionData[i][factionSkin][j]);
		        format(str, sizeof(str), "FactionWeapon%d", j + 1);
		        cache_get_value_name_int(i, str, FactionData[i][factionWeapon][j]);
		        format(str, sizeof(str), "FactionAmmo%d", j + 1);
		        cache_get_value_name_int(i, str, FactionData[i][factionAmmo][j]);
		        format(str, sizeof(str), "FactionRank%d", j + 1);
		        cache_get_value_name(i, str, FactionRankName[i][j]);
			}

            SyncFaction(i);
        }
    }

    printf("[FACTION] Memuat %d faction dari database.", rows);
    return 1;
}

ShowFactionLocker(playerid) {
    new string[352];

    if(GetPlayerFactionType(playerid) == FACTION_PEDAGANG) {
        strcat(string, "Duty\n");
        strcat(string, "Skins\n");
        Dialog_Show(playerid, FactionLockerPedagang, DIALOG_STYLE_LIST, "Faction Locker", string, "Select", "Close");
    }
    else if(GetPlayerFactionType(playerid) == FACTION_FNG) {

    }
    else {
        strcat(string, "Duty\n");
        strcat(string, "Skins\n");
        strcat(string, "Storage\n");
        strcat(string, "Armoury\n");
        Dialog_Show(playerid, FactionLockerLegal, DIALOG_STYLE_LIST, "Faction Locker", string, "Select", "Close");
    }
    return 1;
}

Dialog:FactionLockerLegal(playerid, response, listitem, inputtext[]) {
    if(response) {
        if(listitem == 0) {
            ToggleFactionDuty(playerid);
        }
        if(listitem == 1) {
            ShowFactionSkins(playerid);
        }
        if(listitem == 2) {

        }
        if(listitem == 3) {
            new string[15 * 32], count = 0, id = GetPlayerFaction(playerid);

            for(new i = 0; i < 15; i++) if(FactionData[id][factionWeapon][i] != 0) {
                strcat(string, va_return("%s\n", ReturnWeaponName(FactionData[id][factionWeapon][i])));
                ListedItems[playerid][count++] = i;
            }
            Dialog_Show(playerid, FactionLockerWeapon, DIALOG_STYLE_LIST, "Locker Senjata", string, "Equip", "Close");
        }
    }
    return 1;
}

Dialog:FactionLockerWeapon(playerid, response, listitem, inputtext[]) {
    if(response) {
        new slot = ListedItems[playerid][listitem], id = GetPlayerFaction(playerid), weaponid, ammo;

        if(FactionData[id][factionWeapon][slot] == 0)
            return ErrorTD(playerid, "Tidak ada senjata di slot ini");

        weaponid = FactionData[id][factionWeapon][slot];
        ammo = FactionData[id][factionAmmo][slot];

        new weaponslot = g_aWeaponSlots[weaponid];
        ResetWeaponInSlot(playerid, weaponslot);

        GivePlayerWeaponEx(playerid, weaponid, ammo, va_return("%s-%d", GetInitials(FactionData[id][factionName]), (PlayerData[playerid][pID] + RandomEx(111, 999)))); 
    }
    return 1;
}
ToggleFactionDuty(playerid) {

    new id = GetPlayerFaction(playerid);

    if(!PlayerData[playerid][pFactionDuty]) {
        PlayerData[playerid][pFactionDuty] = true;

        if(PlayerData[playerid][pFactionSkin] != 0)
            SetPlayerSkin(playerid, PlayerData[playerid][pFactionSkin]);

        SetPlayerHealth(playerid, 100.0);

        InfoTD(playerid, va_return("Kamu sekarang on-duty sebagai~n~%s", FactionData[id][factionName]));
    }
    else {
        PlayerData[playerid][pFactionDuty] = false;
        SetPlayerSkin(playerid, PlayerData[playerid][pSkin]);    
        InfoTD(playerid, va_return("Kamu tidak lagi bertugas sebagai~n~%s", FactionData[id][factionName]));
    }
    return 1;
}

ShowFactionSkins(playerid) {
    new id = GetPlayerFaction(playerid);

    if(fselection_showing(playerid))
        return 1;

    if(!PlayerData[playerid][pFactionDuty])
        return ErrorTD(playerid, "Kamu harus on-duty!");

    for(new i = 0; i < 15; i++) if(FactionData[id][factionSkin][i] != 0) {
        fselection_add_item(playerid, FactionData[id][factionSkin][i]);
    }
    fselection_show(playerid, SELECTION_FACTIONSKIN, "Faction Skin");
    SendClientMessage(playerid, X11_GOLD, "Tips | "WHITE"Gunakan \"/hf\" untuk menutup skin selection.");
    return 1;
}

Dialog:FactionLockerPedagang(playerid, response, listitem, inputtext[]) {
    if(response) {
        if(listitem == 0) {
            ToggleFactionDuty(playerid);
        }
        if(listitem == 1) {
            ShowFactionSkins(playerid);
        }
    }
    return 1;
}
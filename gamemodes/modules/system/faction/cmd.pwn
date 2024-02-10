CMD:faction(playerid, params[]) {
    new string[128], type[24], id;

    if(PlayerData[playerid][pAdmin] < 5) {
        return NoAdmin(playerid);
    }

    if(sscanf(params, "s[24]S()[128]", type, string))
        return Syntax(playerid, "/faction [create/ranks/name/locker/setleader/weapon/skin]");

    if(!strcmp(type, "create", true)) {

        new name[24], faction_type;
        if(sscanf(string, "ds[24]", faction_type, name))
            return Syntax(playerid, "/faction create <faction_type> <name>"), SendClientMessage(playerid, -1, "Type | 1. Police, 2. Medic, 3. News, 4. Gov, 5. Pedagang, 6. FNG");

        if(faction_type < FACTION_POLICE || faction_type > FACTION_FNG) 
            return ErrorMsg(playerid, "You have specified invalid player.");

        id = CreateFaction(name, faction_type);
        AdminMessage(X11_TOMATO, "AdmCmd | %s telah membuat Faction %s (ID:%d)", PlayerData[playerid][pUCP], name, id);
    }
    else if(!strcmp(type, "setleader", true)) {
        new targetid;

        if(sscanf(string, "du", id, targetid))
            return Syntax(playerid, "/faction setleader <factionid> <playerid/PartOfName> (ID -1 to unset)");

        if(targetid == INVALID_PLAYER_ID)
            return ErrorMsg(playerid, "You have specified invalid player.");

        if(id == -1) {
            PlayerData[targetid][pFactionID] = 0;
            PlayerData[targetid][pFactionRank] = 0;
            PlayerData[targetid][pFactionSkin] = 0;

            AdminMessage(X11_TOMATO, "AdmCmd | %s telah mencabut status faction %s.", PlayerData[playerid][pUCP], GetName(targetid));
            SQL_SaveCharacter(playerid);
        }
        else {
            if(!FactionData[id][factionExists])
                return ErrorMsg(playerid, "You have specified invalid faction.");

            if(PlayerData[targetid][pFactionID] != 0)
                return ErrorMsg(playerid, "Player tersebut sudah berada di faction");

            SetFaction(targetid, id, FactionData[id][factionRanks]);
            AdminMessage(X11_TOMATO, "AdmCmd | %s telah menjadikan %s leader Faction ID:%d", PlayerData[playerid][pUCP], GetName(targetid), id);
        }
    }
    else if(!strcmp(type, "locker", true)) {

        if(sscanf(string, "d", id))
            return Syntax(playerid, "/faction locker <faction id>");

        if(!FactionData[id][factionExists])
            return ErrorMsg(playerid, "You have specified invalid faction.");

        GetPlayerPos(playerid, FactionData[id][factionLocker][0],  FactionData[id][factionLocker][1],  FactionData[id][factionLocker][2]);
        FactionData[id][factionWorld] = GetPlayerVirtualWorld(playerid);
        FactionData[id][factionInterior] = GetPlayerInterior(playerid);

        SyncFaction(id);
        SQL_SaveFaction(id);
    }
    else if(!strcmp(type, "weapon", true)) {
        new slot, weaponid, ammo;

        if(sscanf(string, "dddd", id, slot, weaponid, ammo))
            return Syntax(playerid, "/faction weapon <faction id> <slot> <weapon id> <ammo>");

        if(!FactionData[id][factionExists])
            return ErrorMsg(playerid, "You have specified invalid faction.");

        if(slot < 1 || slot > 15)
            return ErrorMsg(playerid, "Slot Skin hanya 1 - 15.");

        if(weaponid < 1 || weaponid > 43)
            return ErrorMsg(playerid, "You have specified invalid Weapon id (1 - 43)");

        FactionData[id][factionWeapon][slot - 1] = weaponid;
        FactionData[id][factionAmmo][slot - 1] = ammo;
        SQL_SaveFaction(id);
        AdminMsg(playerid, "Kamu mengubah senjata %s pada slot %d menjadi %s %d ammo.", FactionData[id][factionName], slot, ReturnWeaponName(weaponid), ammo);
    }
	else if (!strcmp(type, "color", true))
	{
	    new color;

	    if (sscanf(string, "dh", id, color))
	        return Syntax(playerid, "/faction color <faction id> <color>");

        if(!FactionData[id][factionExists])
            return ErrorMsg(playerid, "You have specified invalid faction.");

	    FactionData[id][factionColor] = color;
	    SQL_SaveFaction(id);
		AdminMsg(playerid, "Kamu mengubah warna faction {%06x}%s"WHITE".", FactionData[id][factionColor] >>> 8, FactionData[id][factionName]);
	}
    else if(!strcmp(type, "skin", true)) {
        new slot, skinid;

        if(sscanf(string, "ddd", id, slot, skinid))
            return Syntax(playerid, "/faction skin <faction id> <slot> <skin id>");

        if(!FactionData[id][factionExists])
            return ErrorMsg(playerid, "You have specified invalid faction.");

        if(slot < 1 || slot > 15)
            return ErrorMsg(playerid, "Slot Skin hanya 1 - 15.");

        if(skinid < 1 || skinid > 311)
            return ErrorMsg(playerid, "You have specified invalid skin id (1 - 311)");

        FactionData[id][factionSkin][slot - 1] = skinid;
        SQL_SaveFaction(id);
        AdminMsg(playerid, "Kamu mengubah skin %s pada slot %d menjadi %d.", FactionData[id][factionName], slot, skinid);
        
    }
    else if(!strcmp(type, "ranks", true)) {
        new amount;

        if(sscanf(string, "dd", id, amount))
            return Syntax(playerid, "/faction locker <faction id> <max ranks>");

        if(!FactionData[id][factionExists])
            return ErrorMsg(playerid, "You have specified invalid faction.");

        FactionData[id][factionRanks] = amount;
        SQL_SaveFaction(playerid);

        AdminMessage(X11_TOMATO, "AdmCmd | %s telah mengubah max rank %s menjadi %d.", PlayerData[playerid][pUCP], FactionData[id][factionName], amount);
    }
    else if(!strcmp(type, "name", true)) {
        new name[64];

        if(sscanf(string, "ds[64]", id, name))
            return Syntax(playerid, "/faction locker <faction id> <new name>");

        if(!FactionData[id][factionExists])
            return ErrorMsg(playerid, "You have specified invalid faction.");

        
        AdminMessage(X11_TOMATO, "AdmCmd | %s telah mengubah nama faction %s menjadi %s", FactionData[id][factionName], name);
        format(FactionData[id][factionName], 64, name);
        UpdateHoopLabel(id, va_return(""GREEN"[Y] "WHITE"%s\nFaction Locker", name));
    }
    return 1;
}

CMD:f(playerid, params[]) {
    new id = GetPlayerFaction(playerid);

    if(id == -1)
        return ErrorTD(playerid, "Kamu tidak berada di faction!");

    if(isnull(params))
        return Syntax(playerid, "/f(faction) <text>");

    new string[144];
    format(string, sizeof(string), "{%06x}Faction Chat | %s(%d): %s", FactionData[id][factionColor] >>> 8, GetName(playerid, false), playerid, params);
    foreach(new i : Player) if(GetPlayerFaction(i) == GetPlayerFaction(playerid)) {
        SendClientMessage(i, -1, string);
    }
    return 1;
}
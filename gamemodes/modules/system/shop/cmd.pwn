CMD:shop(playerid, params[]) {
    if(!PlayerData[playerid][pAdmin])
        return NoAdmin(playerid);

    new string[128], type[24], id;

    if(sscanf(params, "s[24]S()[128]", type, string))
        return Syntax(playerid, "/shop [create/delete/location/skinid/type]");

    if(!strcmp(type, "create", true)) {

        new stype, name[64], Float:x, Float:y, Float:z, Float:r;
        GetPlayerPos(playerid, x, y, z);
        GetPlayerFacingAngle(playerid, r);

        if(sscanf(string, "ds[64]", stype, name))
            return Syntax(playerid, "/shop create < 1. Market, 2. Clothes > <shop name>");

        if((id = CreateShop(x, y, z, r, stype, name, GetPlayerInterior(playerid), GetPlayerVirtualWorld(playerid))) != -1) {

            AdminMsg(playerid, "Kamu telah membuat Shop %s tipe %s (ID:%d)", name, ReturnShopType(stype), id);
            Streamer_Update(playerid, -1);
            SetPlayerPos(playerid, x, y + 2.0, z);
        }

        
    }
    else if(!strcmp(type, "type", true)) {
        new stype;

        if(sscanf(string, "dd", id, stype))
            return Syntax(playerid, "/shop type <shop id> < 1. Market, 2. Clothes >");

        if(!ShopData[id][shopExists])
            return ErrorMsg(playerid, "You have specified invalid shop.");

        if(stype < SHOP_TYPE_MARKET || stype > SHOP_TYPE_CLOTHES)
            return ErrorMsg(playerid, "Tipe shop tidak valid.");

        ShopData[id][shopType] = stype;
        SQL_SaveShop(id);
        AdminMsg(playerid, "Kamu telah mengubah Type pada Shop ID:%d menjadi %s", id, ReturnShopType(stype));
    }
    else if(!strcmp(type, "skinid", true)) {
        new skinid;

        if(sscanf(string, "dd", id, skinid))
            return Syntax(playerid, "/shop skin <shop id> <skin id>");

        if(!ShopData[id][shopExists])
            return ErrorMsg(playerid, "You have specified invalid shop.");

        if(skinid < 1 || skinid == 74 || skinid > 311)
            return ErrorMsg(playerid, "Skin ID tidak valid.");

        ShopData[id][shopSkin] = skinid;
        SQL_SaveShop(id);
        SyncShop(id);
        AdminMsg(playerid, "Kamu telah mengubah Skin pada Shop ID:%d", id);
    }
    else if(!strcmp(type, "location", true)) {


        if(sscanf(string, "d", id))
            return Syntax(playerid, "/shop location <shop id>");

        if(!ShopData[id][shopExists])
            return ErrorMsg(playerid, "You have specified invalid shop.");

        GetPlayerPos(playerid, ShopData[id][shopX], ShopData[id][shopY], ShopData[id][shopZ]);
        GetPlayerFacingAngle(playerid, ShopData[id][shopR]);  

        SQL_SaveShop(id);
        SyncShop(id);
        AdminMsg(playerid, "Kamu telah mengubah lokasi Shop ID:%d", id);

        new Float:x, Float:y, Float:z;
        GetPlayerPos(playerid,x, y, z);
        SetPlayerPos(playerid, x, y + 2.0, z);
    }
    else if(!strcmp(type, "delete", true)) {

        if(sscanf(string, "d", id))
            return Syntax(playerid, "/shop location <shop id>");

        if(!ShopData[id][shopExists])
            return ErrorMsg(playerid, "You have specified invalid shop.");

        DeleteShop(id);
        AdminMsg(playerid, "Kamu telah menghapus Shop ID:%d", id); 
    }
    return 1;
}
GetFreeShopID() {
    new idx = -1;
    for(new i = 0; i < MAX_SHOP; i++) if(!ShopData[i][shopExists]) {
        idx = i;
        break;
    }
    return idx;
}

stock CreateShop(Float:x, Float:y, Float:z, Float:r, shoptype, name[], interior, world) {

    new id = -1;


    if((id = GetFreeShopID()) != -1) {
        ShopData[id][shopExists] = true;
        format(ShopData[id][shopName], 64, name);
        ShopData[id][shopType] = shoptype;
        ShopData[id][shopX] = x;
        ShopData[id][shopY] = y;
        ShopData[id][shopZ] = z;
        ShopData[id][shopR] = r;
        ShopData[id][shopInterior] = interior;
        ShopData[id][shopWorld] = world;
        ShopData[id][shopStatus] = SHOP_STATUS_OPEN;
        ShopData[id][shopSkin] = 171;
        ShopData[id][shopHoop] = INVALID_HOOP_ID;

        SyncShop(id);

        new query[128];
        mysql_format(sqlcon, query, sizeof(query), "INSERT INTO `shop` (`Name`) VALUES('%e')", name);
        mysql_tquery(sqlcon, query, "OnShopCreated", "d", id);
    }
    return id;
}

DeleteShop(id) {

    if(!ShopData[id][shopExists])
        return 1;

    if(IsValidDynamic3DTextLabel(ShopData[id][shopLabel])) 
        DestroyDynamic3DTextLabel(ShopData[id][shopLabel]);

    if(IsValidDynamicActor(ShopData[id][shopActor]))
        DestroyDynamicActor(ShopData[id][shopActor]);

    if(IsValidHoop(ShopData[id][shopHoop]))
        DestroyHoop(ShopData[id][shopHoop]);
        
    mysql_tquery(sqlcon, va_return("DELETE FROM `shop` WHERE `ID` = '%d'", ShopData[id][shopID]));
    ShopData[id][shopExists] = false;   
    ShopData[id][shopID] = 0;
    return 1;
}
SyncShop(id) {
    if(!ShopData[id][shopExists])
        return 1;

    new string[144];
    format(string, sizeof(string), ""WHITE"[%d] %s\n"GREEN"[Y] "WHITE"Untuk membuka menu toko", id, ShopData[id][shopName]);
    if(!IsValidDynamic3DTextLabel(ShopData[id][shopLabel])) {
        ShopData[id][shopLabel] = CreateDynamic3DTextLabel(string, -1, ShopData[id][shopX], ShopData[id][shopY], ShopData[id][shopZ], 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, ShopData[id][shopWorld], ShopData[id][shopInterior]);
    }
    else {
        Streamer_UpdateItem(STREAMER_TYPE_3D_TEXT_LABEL, ShopData[id][shopLabel], ShopData[id][shopX], ShopData[id][shopY], ShopData[id][shopZ], ShopData[id][shopWorld], ShopData[id][shopInterior]);
        UpdateDynamic3DTextLabelText(ShopData[id][shopLabel], -1, string);
    }

    if(ShopData[id][shopType] == SHOP_TYPE_MARKET) {
        if(!IsValidDynamicActor(ShopData[id][shopActor])) {
            ShopData[id][shopActor] = CreateDynamicActor(ShopData[id][shopSkin], ShopData[id][shopX], ShopData[id][shopY], ShopData[id][shopZ],ShopData[id][shopR], .worldid = ShopData[id][shopWorld], .interiorid = ShopData[id][shopInterior], .streamdistance = 20.0);
        }
        else {
            Streamer_UpdateItem(STREAMER_TYPE_ACTOR, ShopData[id][shopActor], ShopData[id][shopX], ShopData[id][shopY], ShopData[id][shopZ], ShopData[id][shopWorld], ShopData[id][shopInterior]);
            SetDynamicActorFacingAngle(ShopData[id][shopActor], ShopData[id][shopR]);
            Streamer_SetIntData(STREAMER_TYPE_ACTOR, ShopData[id][shopActor], E_STREAMER_MODEL_ID, ShopData[id][shopSkin]);
        }
    }
    if(ShopData[id][shopType] == SHOP_TYPE_CLOTHES) {
        if(IsValidHoop(ShopData[id][shopHoop])) {
            DestroyHoop(ShopData[id][shopHoop]);
        }

        ShopData[id][shopHoop] = CreateHoop(ShopData[id][shopX], ShopData[id][shopY], ShopData[id][shopZ], 1, X11_GREEN, 15.0);
    }
    return id;
}

ReturnShopType(type) {
    new str[24];

    switch(type) {
        case SHOP_TYPE_MARKET: str = "Market";
        case SHOP_TYPE_CLOTHES: str = "Clothes";
    }
    return str;
}

SQL_SaveShop(id) {

    new query[512];
    mysql_format(sqlcon,query, sizeof(query), "UPDATE `shop` SET `Name` = '%e', `Type` = '%d', `Skin` = '%d', `Interior` = '%d', `World` = '%d'",
        ShopData[id][shopName],
        ShopData[id][shopType],
        ShopData[id][shopSkin],
        ShopData[id][shopInterior],
        ShopData[id][shopWorld]
    );
    mysql_format(sqlcon, query, sizeof(query), "%s, `X` = '%f', `Y` = '%f', `Z` = '%f', `R` = '%f'",
        query,
        ShopData[id][shopX],
        ShopData[id][shopY], 
        ShopData[id][shopZ],
        ShopData[id][shopR]
    );
    mysql_format(sqlcon,query, sizeof(query), "%s WHERE `ID` = '%d'", query, ShopData[id][shopID]);
    mysql_tquery(sqlcon, query);
    return 1;
}

function OnShopCreated(id) {
    ShopData[id][shopID] = cache_insert_id();
    SQL_SaveShop(id);
}

function OnLoadShop() {
    new rows = cache_num_rows();
    if(rows) {
        for(new i = 0; i < rows; i++) {
            ShopData[i][shopHoop] = INVALID_HOOP_ID;
            ShopData[i][shopExists] = true;
            ShopData[i][shopStatus] = SHOP_STATUS_OPEN;
            ShopData[i][shopID] = cache_get_field_int(i, "ID");
            ShopData[i][shopX] = cache_get_field_float(i, "X");
            ShopData[i][shopY] = cache_get_field_float(i, "Y");
            ShopData[i][shopZ] = cache_get_field_float(i, "Z");
            ShopData[i][shopR] = cache_get_field_float(i, "R");
            ShopData[i][shopType] = cache_get_field_int(i, "Type");
            ShopData[i][shopInterior] = cache_get_field_int(i, "Interior");
            ShopData[i][shopWorld] = cache_get_field_int(i, "World");
            ShopData[i][shopSkin] = cache_get_field_int(i, "Skin");
            cache_get_value_name(i, "Name", ShopData[i][shopName]);
            SyncShop(i);
        }
    }

    printf("[SHOP] Memuat %d Shop dari database.", rows);
    return 1;
}
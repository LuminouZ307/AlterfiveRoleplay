GetFreeDoorID() {
    new idx = -1;
    for(new i = 0; i < MAX_DOOR; i++) if(!DoorData[i][doorExists]) {
        idx = i;
        break;
    }
    return idx;
}

CreateDoor(Float:x, Float:y, Float:z, caption[], world, interior) {
    new id = -1;

    if((id = GetFreeDoorID()) != -1) {
        DoorData[id][doorExists] = true;
        DoorData[id][doorX] = x;
        DoorData[id][doorY] = y;
        DoorData[id][doorZ] = z;
        DoorData[id][doorInteriorExt] = interior;
        DoorData[id][doorWorldExt] = world;
        DoorData[id][doorInteriorInt] = 0;
        DoorData[id][doorInteriorExt] = 0;
        DoorData[id][doorInteriorX] = 0.0;
        DoorData[id][doorInteriorY] = 0.0;
        DoorData[id][doorInteriorZ] = 0.0;
        format(DoorData[id][doorCaption], 64, caption);


        new query[128];
        mysql_format(sqlcon, query, sizeof(query), "INSERT INTO `doors` (`Caption`) VALUES('%e')", DoorData[id][doorCaption]);
        mysql_tquery(sqlcon, query, "OnDoorCreated", "d", id);

        SyncDoor(id);
    }
    return id;
}

function OnDoorCreated(id) {
    DoorData[id][doorID] = cache_insert_id();
    SQL_SaveDoor(id);
}

DeleteDoor(id) {
    if(IsValidDynamic3DTextLabel(DoorData[id][doorLabel])) {
        DestroyDynamic3DTextLabel(DoorData[id][doorLabel]);
        DoorData[id][doorLabel] = Text3D:INVALID_STREAMER_ID;
    }

    if(IsValidDynamicPickup(DoorData[id][doorPickup])) {
        DestroyDynamicPickup(DoorData[id][doorPickup]);
        DoorData[id][doorPickup] = STREAMER_TAG_PICKUP:INVALID_STREAMER_ID;
    }

    mysql_tquery(sqlcon, va_return("DELETE FROM `doors` WHERE `ID` = '%d'", DoorData[id][doorID]));

    DoorData[id][doorID] = 0;
    DoorData[id][doorExists] = false;
    return 1;
}
SyncDoor(id) {

    new string[128];
    format(string, sizeof(string), "[%d]\n%s", id, DoorData[id][doorCaption]);

    if(IsValidDynamic3DTextLabel(DoorData[id][doorLabel])) {
        Streamer_SetItemPos(STREAMER_TYPE_3D_TEXT_LABEL, DoorData[id][doorLabel], DoorData[id][doorX], DoorData[id][doorY], DoorData[id][doorZ]);
        Streamer_SetIntData(STREAMER_TYPE_3D_TEXT_LABEL, DoorData[id][doorLabel], E_STREAMER_INTERIOR_ID, DoorData[id][doorInteriorExt]);
        Streamer_SetIntData(STREAMER_TYPE_3D_TEXT_LABEL, DoorData[id][doorLabel], E_STREAMER_WORLD_ID, DoorData[id][doorWorldExt]);
        UpdateDynamic3DTextLabelText(DoorData[id][doorLabel], -1,string);
    }
    else {

        DoorData[id][doorLabel] = CreateDynamic3DTextLabel(string, -1, DoorData[id][doorX], DoorData[id][doorY], DoorData[id][doorZ], 5.0, INVALID_PLAYER_ID,INVALID_VEHICLE_ID, 0, DoorData[id][doorWorldExt], DoorData[id][doorInteriorExt]);
    }
    if(IsValidDynamicPickup(DoorData[id][doorPickup])) {    
        Streamer_SetItemPos(STREAMER_TYPE_PICKUP, DoorData[id][doorPickup], DoorData[id][doorX], DoorData[id][doorY], DoorData[id][doorZ] + 0.2);
        Streamer_SetIntData(STREAMER_TYPE_PICKUP, DoorData[id][doorPickup], E_STREAMER_INTERIOR_ID, DoorData[id][doorInteriorExt]);
        Streamer_SetIntData(STREAMER_TYPE_PICKUP, DoorData[id][doorPickup], E_STREAMER_WORLD_ID, DoorData[id][doorWorldExt]);
    }
    else {
        DoorData[id][doorPickup] = CreateDynamicPickup(19197, 23, DoorData[id][doorX], DoorData[id][doorY], DoorData[id][doorZ] + 0.2, DoorData[id][doorWorldExt], DoorData[id][doorInteriorExt], -1, 15.0);
    }
    return 1;
}

SQL_SaveDoor(id) {
    if(DoorData[id][doorExists]) {
        new query[712];
        mysql_format(sqlcon, query, sizeof(query), "UPDATE `doors` SET `Caption` = '%e', `InteriorExt` = '%d', `WorldExt` = '%d', `X` = '%f', `Y` = '%f', `Z` = '%f'",
            DoorData[id][doorCaption],
            DoorData[id][doorInteriorExt],
            DoorData[id][doorWorldExt],
            DoorData[id][doorX],
            DoorData[id][doorY],
            DoorData[id][doorZ]
        );
        mysql_format(sqlcon, query, sizeof(query), "%s, `InteriorInt` = '%d', `WorldInt` = '%d', `InteriorX` = '%f', `InteriorY` = '%f', `InteriorZ` = '%f'",
            query,
            DoorData[id][doorInteriorInt],
            DoorData[id][doorWorldInt],
            DoorData[id][doorInteriorX],
            DoorData[id][doorInteriorY],
            DoorData[id][doorInteriorZ]
        );
        mysql_format(sqlcon, query, sizeof(query), "%s WHERE `ID` = '%d'", query, DoorData[id][doorID]);
        mysql_tquery(sqlcon, query);
    }
    return 1;
}

function OnLoadDoor() {
    new rows = cache_num_rows();

    if(rows) {
        for(new id = 0; id < rows; id++) {

            DoorData[id][doorID] = cache_get_field_int(id, "ID");
            DoorData[id][doorX] = cache_get_field_float(id, "X");
            DoorData[id][doorY] = cache_get_field_float(id, "Y");
            DoorData[id][doorZ] = cache_get_field_float(id, "Z");
            DoorData[id][doorInteriorX] = cache_get_field_float(id, "InteriorX");
            DoorData[id][doorInteriorY] = cache_get_field_float(id, "InteriorY");
            DoorData[id][doorInteriorZ] = cache_get_field_float(id, "InteriorZ");
            DoorData[id][doorInteriorInt] = cache_get_field_int(id, "InteriorInt");
            DoorData[id][doorWorldInt] = cache_get_field_int(id, "WorldInt");
            DoorData[id][doorInteriorExt] = cache_get_field_int(id, "InteriorExt");
            DoorData[id][doorWorldExt] = cache_get_field_int(id, "WorldExt");
            cache_get_value_name(id, "Caption", DoorData[id][doorCaption]);
            DoorData[id][doorExists] = true;

            SyncDoor(id);
        }
    }

    printf("[DOOR] Membuat %d Dynamic Door dari database.", rows);
    return 1;
}

EnterDoor(playerid, id) {
    
    if(DoorData[id][doorInteriorX] == 0.0 && DoorData[id][doorInteriorY] == 0.0 && DoorData[id][doorInteriorZ] == 0.0) {
        ErrorTD(playerid, "Pintu ini belum memiliki interior.");
        return 1;
    }

    SetPlayerPosEx(playerid, DoorData[id][doorInteriorX], DoorData[id][doorInteriorY], DoorData[id][doorInteriorZ], DoorData[id][doorInteriorInt], DoorData[id][doorWorldInt]);
    PlayerData[playerid][pDoor] = DoorData[id][doorID];
    return 1;
}

ExitDoor(playerid, id) {
    
    SetPlayerPosEx(playerid, DoorData[id][doorX], DoorData[id][doorY], DoorData[id][doorZ], DoorData[id][doorInteriorExt], DoorData[id][doorWorldExt]);
    PlayerData[playerid][pDoor] = 0;
    return 1;
}

GetNearestDoorExt(playerid) {
    new idx = -1;
    for(new i = 0; i < MAX_DOOR; i++) if(DoorData[i][doorExists] && IsPlayerInRangeOfPoint(playerid, 3.0, DoorData[i][doorX], DoorData[i][doorY], DoorData[i][doorZ]) && DoorData[i][doorInteriorExt] == GetPlayerInterior(playerid) && DoorData[i][doorWorldExt] == GetPlayerVirtualWorld(playerid)) {
        idx = i;
        break;
    }
    return idx;
}

GetNearestDoorInt(playerid) {
    new idx = -1;
    for(new i = 0; i < MAX_DOOR; i++) if(DoorData[i][doorExists] && IsPlayerInRangeOfPoint(playerid, 3.0, DoorData[i][doorInteriorX], DoorData[i][doorInteriorY], DoorData[i][doorInteriorZ]) && DoorData[i][doorInteriorInt] == GetPlayerInterior(playerid) && DoorData[i][doorWorldInt] == GetPlayerVirtualWorld(playerid)) {
        idx = i;
        break;
    }
    return idx;
}


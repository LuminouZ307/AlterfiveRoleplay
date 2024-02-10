CMD:door(playerid, params[]) {
    new string[128], type[24], id;

    if(PlayerData[playerid][pAdmin] < 5)
        return NoAdmin(playerid);

    if(sscanf(params, "s[24]S()[128]", type, string))   
        return Syntax(playerid, "/door [create/delete/interior/location/name]");

    if(!strcmp(type, "create", true)) {

        new name[64];

        if(sscanf(string, "s[64]", name))
            return Syntax(playerid, "/door create <door name>");

        new Float:x, Float:y, Float:z;
        GetPlayerPos(playerid, x, y, z);

        if((id = CreateDoor(x, y, z, name, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid))) != -1) {

            Streamer_Update(playerid, STREAMER_TYPE_PICKUP);
            Streamer_Update(playerid, STREAMER_TYPE_3D_TEXT_LABEL);
            AdminMsg(playerid, "Kamu membuat Door ID:%d (%s)", id, name);
        }
    }
    else if(!strcmp(type, "interior", true)) {
    
        if(sscanf(string, "d", id))
            return Syntax(playerid, "/door interior <door id>");

        if(!DoorData[id][doorExists])
            return ErrorMsg(playerid, "Kamu memasukan Door ID yang tidak valid.");   

        GetPlayerPos(playerid, DoorData[id][doorInteriorX], DoorData[id][doorInteriorY], DoorData[id][doorInteriorZ]);
        DoorData[id][doorInteriorInt] = GetPlayerInterior(playerid);
        
        if(!DoorData[id][doorWorldInt]) {
            DoorData[id][doorWorldInt] = DoorData[id][doorID] + (29);
        }

        SyncDoor(id);
        SQL_SaveDoor(id);
        AdminMsg(playerid, "Kamu mengubah posisi interior Door ID:%d (%s)", id, DoorData[id][doorCaption]);
    }
    else if(!strcmp(type, "delete", true)) {
        if(sscanf(string, "d", id))
            return Syntax(playerid, "/door delete <door id>");

        if(!DoorData[id][doorExists])
            return ErrorMsg(playerid, "Kamu memasukan Door ID yang tidak valid.");    

        DeleteDoor(id);
        AdminMsg(playerid, "Kamu menghapus Door ID:%d (%s)", id, DoorData[id][doorCaption]);         
    }
    else if(!strcmp(type, "location", true)) {
        if(sscanf(string, "d", id))
            return Syntax(playerid, "/door location <door id>");

        if(!DoorData[id][doorExists])
            return ErrorMsg(playerid, "Kamu memasukan Door ID yang tidak valid.");    

        GetPlayerPos(playerid, DoorData[id][doorX], DoorData[id][doorY], DoorData[id][doorZ]);
        DoorData[id][doorInteriorExt] = GetPlayerInterior(playerid);
        DoorData[id][doorWorldInt] = GetPlayerVirtualWorld(playerid);
        SyncDoor(id);
        SQL_SaveDoor(id);
        AdminMsg(playerid, "Kamu mengubah posisi exterior Door ID:%d (%s)", id, DoorData[id][doorCaption]);         
    }
    else if(!strcmp(type, "name", true)) {
        new name[64];

        if(sscanf(string, "ds[64]", id, name))
            return Syntax(playerid, "/door name <door id> <door name>");

        if(!DoorData[id][doorExists])
            return ErrorMsg(playerid, "Kamu memasukan Door ID yang tidak valid.");   

        format(DoorData[id][doorCaption], 64, name);
        SyncDoor(id);
        SQL_SaveDoor(id);
        AdminMsg(playerid, "Kamu mengubah nama Door ID:%d menjadi %s", id, DoorData[id][doorCaption]);  
    }
    return 1;
}
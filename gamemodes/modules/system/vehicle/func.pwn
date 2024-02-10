stock Vehicle_Create(modelid, Float:x, Float:y, Float:z, Float:rotation, type = 0, extraid = 0, color1, color2, addsiren=0) {
    new vehicleid = INVALID_VEHICLE_ID;

    vehicleid = CreateVehicle(modelid, x, y, z, rotation, color1, color2,-1, addsiren);

    if(IsValidVehicle(vehicleid)) {

        VehicleData[vehicleid][vehicleExists] = true;
        VehicleData[vehicleid][vehicleModel] = modelid;
        VehicleData[vehicleid][vehiclePos][0] = x;
        VehicleData[vehicleid][vehiclePos][1] = y;
        VehicleData[vehicleid][vehiclePos][2] = z;
        VehicleData[vehicleid][vehiclePos][3] = rotation;
        VehicleData[vehicleid][vehicleWorld] = VehicleData[vehicleid][vehicleInterior] = 0;
        VehicleData[vehicleid][vehicleExtraID] = extraid;
        VehicleData[vehicleid][vehicleColor][0] = color1;
        VehicleData[vehicleid][vehicleColor][1] = color2;
        VehicleData[vehicleid][vehicleType] = type;
        VehicleData[vehicleid][vehicleState] = VEHICLE_STATE_SPAWNED;
        VehicleData[vehicleid][vehicleTimeout] = 0;
        VehicleData[vehicleid][vehicleFuel] = 100.0;
        VehicleData[vehicleid][vehicleMaxSpeed] = 0;

        if(type == VEHICLE_TYPE_PLAYER) {

            new query[256];
            mysql_format(sqlcon, query, sizeof(query), "INSERT INTO `vehicles` (`Model`, `ExtraID`, `Type`) VALUES('%d', '%d', '%d')", VehicleData[vehicleid][vehicleModel], VehicleData[vehicleid][vehicleExtraID], VehicleData[vehicleid][vehicleType]);
            mysql_tquery(sqlcon, query, "OnVehicleAdd", "d", vehicleid);
        }
    }
    return vehicleid;
}

function OnVehicleAdd(vehicleid) {
    VehicleData[vehicleid][vehicleID] = cache_insert_id();
    Vehicle_SaveSQL(vehicleid);
}

Vehicle_SaveSQL(vehicleid) {
    new query[512];

    GetVehiclePos(vehicleid, VehicleData[vehicleid][vehiclePos][0], VehicleData[vehicleid][vehiclePos][1], VehicleData[vehicleid][vehiclePos][2]);
    GetVehicleZAngle(vehicleid, VehicleData[vehicleid][vehiclePos][3]);

    
    mysql_format(sqlcon, query, sizeof(query), "UPDATE `vehicles` SET `PosX` = '%.2f', `PosY` = '%.2f', `PosZ` = '%.2f', `PosA` = '%.2f', `Color1` = '%d', `Color2` = '%d'",
        VehicleData[vehicleid][vehiclePos][0],
        VehicleData[vehicleid][vehiclePos][1],
        VehicleData[vehicleid][vehiclePos][2],
        VehicleData[vehicleid][vehiclePos][3],
        VehicleData[vehicleid][vehicleColor][0],
        VehicleData[vehicleid][vehicleColor][1]
    );
    mysql_format(sqlcon, query, sizeof(query), "%s, `World` = '%d', `Interior` = '%d', `Fuel` = '%.2f', `Plate` = '%e' WHERE `ID` = '%d'", 
        query,
        VehicleData[vehicleid][vehicleWorld], 
        VehicleData[vehicleid][vehicleInterior], 
        VehicleData[vehicleid][vehicleFuel],
        VehicleData[vehicleid][vehiclePlate],
        VehicleData[vehicleid][vehicleID]
    );
    return mysql_tquery(sqlcon, query);
}

GetPlayerSpawnedCar(playerid) {
    new count;

    foreach(new i : Vehicle) if(VehicleData[i][vehicleType] == VEHICLE_TYPE_PLAYER && VehicleData[i][vehicleExtraID] == PlayerData[playerid][pID]) {
        count++;
    }
    return count;
}

Vehicle_IsOwner(playerid, vehicleid) {

    if(!IsValidVehicle(vehicleid))
        return 1;
        
    if(VehicleData[vehicleid][vehicleExtraID] == PlayerData[playerid][pID])
        return 1;

    return 0;
}

Vehicle_Destroy(vehicleid) {
    DestroyVehicle(vehicleid);
    VehicleData[vehicleid][vehicleExists] = false;
    VehicleData[vehicleid][vehicleModel] = 0;
    VehicleData[vehicleid][vehiclePos][0] = 0.0;
    VehicleData[vehicleid][vehiclePos][1] = 0.0;
    VehicleData[vehicleid][vehiclePos][2] = 0.0;
    VehicleData[vehicleid][vehiclePos][3] = 0.0;
    VehicleData[vehicleid][vehicleWorld] = VehicleData[vehicleid][vehicleInterior] = 0;
    VehicleData[vehicleid][vehicleExtraID] = 0;
    VehicleData[vehicleid][vehicleColor][0] = 0;
    VehicleData[vehicleid][vehicleColor][1] = 0;
    VehicleData[vehicleid][vehicleType] = 0;
    VehicleData[vehicleid][vehicleState] = VEHICLE_STATE_SPAWNED;
    VehicleData[vehicleid][vehicleTimeout] = 0;
}

ReturnVehicleName(modelid, name[]) {

    new string[24];

    if(isequal(name, "NotCustom")) {
        format(string, sizeof(string), "%s", ReturnVehicleModelName(modelid));
    }
    else {
        format(string, sizeof(string), "%s", name);
    }
    return string;
}
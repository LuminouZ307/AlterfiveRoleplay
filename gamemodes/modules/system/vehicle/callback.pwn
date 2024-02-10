#include <YSI_Coding\y_hooks>

hook OnPlayerDisconnect(playerid, reason) {
    if(IsCharacterSpawned(playerid)) {
        if(GetPlayerSpawnedCar(playerid)) {
            foreach(new i : Vehicle) if(Vehicle_IsOwner(playerid, i)) {
                Vehicle_SaveSQL(i);
                VehicleData[i][vehicleTimeout] = 120;
            }
        }
    }
    return Y_HOOKS_CONTINUE_RETURN_1;
}

task OnVehicleTimeout[1000]() {
    for(new i = 0; i < MAX_VEHICLES; i++) if(IsValidVehicle(i) && VehicleData[i][vehicleType] == VEHICLE_TYPE_PLAYER && VehicleData[i][vehicleTimeout] != 0) {
        if(--VehicleData[i][vehicleTimeout] <= 0) {
            printf("Vehicle Timeout: %s ID:%d", GetVehicleName(i), i);
            Vehicle_SaveSQL(i);
            mysql_tquery(sqlcon, va_return("UPDATE `vehicles` SET `State` = '%d' WHERE `ID` = '%d'", VEHICLE_STATE_INSURANCE, VehicleData[i][vehicleID]));
            Vehicle_Destroy(i);
        }
    }
    return 1;
}

hook OnCharacterLoaded(playerid) {

    foreach(new i : Vehicle) if(Vehicle_IsOwner(playerid, i) && VehicleData[i][vehicleTimeout]) {
        VehicleData[i][vehicleTimeout] = 0;
        printf("Gak jadi timeout: ID:%d", i);
    }
    return Y_HOOKS_CONTINUE_RETURN_1;
}
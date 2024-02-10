#include <YSI_Coding\y_hooks>

hook OnPlayerPressY(playerid) {
    if(IsPlayerInRangeOfPoint(playerid, 2.5, 1975.4735,-2046.5167,13.5469)) {
        ShowAsuransi(playerid);
    }
    return Y_HOOKS_CONTINUE_RETURN_1;
}

ShowAsuransi(playerid) {
    mysql_tquery(sqlcon, va_return("SELECT * FROM `vehicles` WHERE `ExtraID` = '%d' AND `State` = '1'", PlayerData[playerid][pID]), "OnShowAsuransi", "d", playerid);
}

function OnShowAsuransi(playerid) {
    new rows = cache_num_rows(), count = 0, string[256];

    if(!rows) {
        return ErrorTD(playerid, "Tidak ada kendaraanmu~n~pada asuransi.");
    }

    for(new i = 0; i < rows; i++) {
        new sql_id, name[24], modelid;
        cache_get_value_name(i, "Name", name);
        cache_get_value_name_int(i, "ID", sql_id);
        cache_get_value_name_int(i, "Model", modelid);

        strcat(string, va_return("%s\n", ReturnVehicleName(modelid, name)));
        ListedItems[playerid][count++] = sql_id;
    }

    Dialog_Show(playerid, ShowAsuransiDialog, DIALOG_STYLE_LIST, "Kendaraan Asuransi", string, "Select", "Close");
    return 1;
}

Dialog:ShowAsuransiDialog(playerid, response, listitem, inputtext[]) {
    if(response) {
        new sql_id = ListedItems[playerid][listitem];

        StartPlayerLoadingBar(playerid, 50, "Mengeluarkan_Kendaraan", 30, "OnAsuransiDone");

        SetPVarInt(playerid, "SQL_ID", sql_id);
        mysql_tquery(sqlcon, va_return("UPDATE `vehicles` SET `State` = '0' WHERE `ID` = '%d'", sql_id));
    }
    return 1;
}

function OnAsuransiDone(playerid) {
    new string[128];
    mysql_format(sqlcon, string, sizeof(string), "SELECT * FROM `vehicles` WHERE `ID` = '%d'",GetPVarInt(playerid, "SQL_ID"));
    mysql_tquery(sqlcon, string, "OnLoadVehicleAsuransi", "dd", playerid,GetPVarInt(playerid, "SQL_ID"));
}

function OnLoadVehicleAsuransi(playerid, sql_id) {

    if(!cache_num_rows())
        return 1;

    new modelid, color[2];

    cache_get_value_name_int(0, "Model", modelid);
    cache_get_value_name_int(0, "Color1", color[0]);
    cache_get_value_name_int(0, "Color2", color[1]);

    new vehicleid = CreateVehicle(modelid, 1985.0237,-2062.2102,13.0799,89.1999, color[0], color[1], -1, 0);

    VehicleData[vehicleid][vehicleExists] = true;
    VehicleData[vehicleid][vehicleID] = sql_id;
    VehicleData[vehicleid][vehicleWorld] = 0;
    VehicleData[vehicleid][vehicleInterior] = 0;
    VehicleData[vehicleid][vehicleType] = VEHICLE_TYPE_PLAYER;
    VehicleData[vehicleid][vehicleState] = VEHICLE_STATE_SPAWNED;
    
    VehicleData[vehicleid][vehicleColor][0] = color[0];
    VehicleData[vehicleid][vehicleColor][1] = color[1];
    cache_get_value_name_int(0, "ExtraID", VehicleData[vehicleid][vehicleExtraID]);
    cache_get_value_name_float(0, "Fuel", VehicleData[vehicleid][vehicleFuel]);
    cache_get_value_name(0, "Plate", VehicleData[vehicleid][vehiclePlate]);
    cache_get_value_name_float(0, "MaxSpeed", VehicleData[vehicleid][vehicleMaxSpeed]);
    
    PutPlayerInVehicle(playerid, vehicleid, 0);
    Vehicle_SaveSQL(vehicleid);
    Notify(playerid, "ASURANSI", "Kamu telah mengeluarkan~n~kendaraan kamu dari asuransi.", NOTIF_INFO, 4);
    return 1;
}
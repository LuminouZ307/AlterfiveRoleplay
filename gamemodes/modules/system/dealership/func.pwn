GetFreeVehicleDealerID() {
    new idx = -1;

    for(new i = 0; i < MAX_DEALER_VEHICLE; i++) if(!DealerVehicle[i][dealer_vehicle_exists]) {
        idx = i;
        break;
    }
    return idx;
}


GetVehicleTypeName(type) {
    new string[24];
    format(string, sizeof(string), "%s", g_DealerVehType[type]);
    return string;
}

ShowDealerMenu(playerid) {

    new string[128];
    for(new i = 0; i < 8; i++) {
        strcat(string, va_return("%s\n", GetVehicleTypeName(i)));
    }
    Dialog_Show(playerid, DealerMenu, DIALOG_STYLE_LIST, "Pilih Tipe Kendaaran", string, "Select", "Close");
    return 1;
}
stock AddVehicleToDealer(modelid, type, price, color1, color2) {

    new id = -1;

    if((id = GetFreeVehicleDealerID()) != -1) {
        DealerVehicle[id][dealer_vehicle_exists] = true;
        DealerVehicle[id][dealer_vehicle_model] = modelid;
        DealerVehicle[id][dealer_vehicle_type] = type;
        DealerVehicle[id][dealer_vehicle_color][0] = color1;
        DealerVehicle[id][dealer_vehicle_color][1] = color2;
        DealerVehicle[id][dealer_vehicle_price] = price;

        new query[256];
        mysql_format(sqlcon, query, sizeof(query), "INSERT INTO `dealer_vehicle` (`Model`, `Price`, `Color1`, `Color2`, `Type`) VALUES('%d', '%d', '%d', '%d', '%d')",
            modelid, price, color1, color2, type
        );
        mysql_tquery(sqlcon, query, "OnDealerVehicleAdd", "d", id);
    }
    return 1;
}

Dialog:DealerMenu(playerid, response, listitem, inputtext[]) {
    if(response) {
        new count = 0, string[512];

        for(new i = 0; i < MAX_DEALER_VEHICLE; i++) if(DealerVehicle[i][dealer_vehicle_exists] && DealerVehicle[i][dealer_vehicle_type] == listitem) {
            strcat(string, va_return("%s "DARKGREEN"%s"WHITE"\n", ReturnVehicleModelName(DealerVehicle[i][dealer_vehicle_model]), FormatNumber(DealerVehicle[i][dealer_vehicle_price])));
            ListedItems[playerid][count++] = i;
        }
        Dialog_Show(playerid, DealerMenuSelect, DIALOG_STYLE_LIST, "Pilih Kendaraan", string, "Select", "Close");
    }
    return 1;
}

Dialog:DealerMenuSelect(playerid, response, listitem, inputtext[]) {
    if(response) {
        new id = ListedItems[playerid][listitem];

        if(!DealerVehicle[id][dealer_vehicle_exists]) 
            return ErrorTD(playerid, "Kendaraan sudah tidak ada!");

        if(GetMoney(playerid) < DealerVehicle[id][dealer_vehicle_price])
            return ErrorTD(playerid, "Uang tidak cukup!");

        new vehicleid = Vehicle_Create(DealerVehicle[id][dealer_vehicle_model], 301.3355,-1374.0911,14.1364,202.5645, VEHICLE_TYPE_PLAYER, PlayerData[playerid][pID], DealerVehicle[id][dealer_vehicle_color][0], DealerVehicle[id][dealer_vehicle_color][1]);
        
        PutPlayerInVehicle(playerid, vehicleid, 0);
    }
    return 1;
}

function OnDealerVehicleAdd(id) {
    DealerVehicle[id][dealer_vehicle_id] = cache_insert_id();
}

ShowAddCarDealer(playerid) {
    Dialog_Show(playerid, AddVehicleModel, DIALOG_STYLE_INPUT, "Tambah kendaraan baru", "Masukkan model atau nama kendaraan", "Input", "Close");
    return 1;
}


Dialog:AddVehicleDealer(playerid, response, listitem, inputtext[]) {
    if(response) {
        if(listitem == 0) {
            Dialog_Show(playerid, AddVehicleModel, DIALOG_STYLE_INPUT, "Tambah kendaraan baru","Masukkan model atau nama kendaraan", "Input", "Close");
        }
    }
    return 1;
}
Dialog:AddVehicleModel(playerid, response, listitem, inputtext[]) {
    if(response) {

        new model[32];

        if(sscanf(inputtext, "s[32]", model))
            return Dialog_Show(playerid, AddVehicleModel, DIALOG_STYLE_INPUT, "Tambah kendaraan baru","Masukkan model atau nama kendaraan", "Input", "Close");


        if ((model[0] = GetVehicleModelByName(model)) == 0)
            return ErrorMsg(playerid, "Invalid model ID.");

        SetPVarInt(playerid, "CarModel", model[0]);

        new string[156];

        for(new i = 0; i < 8; i++) {
            strcat(string, va_return("%s\n", GetVehicleTypeName(i)));
        }
        Dialog_Show(playerid, AddVehicleType, DIALOG_STYLE_LIST, "Tambah kendaraan baru", string, "Select", "Close");
    }
    return 1;
}

Dialog:AddVehicleType(playerid, response, listitem, inputtext[]) {
    if(response) {

        SetPVarInt(playerid, "CarType", listitem);
        Dialog_Show(playerid, AddVehicleColor1, DIALOG_STYLE_INPUT, "Tambah kendaraan baru (warna 1)", color_string, "Input", "Close");
    }
    return 1;
}

Dialog:AddVehiclePrice(playerid, response, listitem, inputtext[]) {
    if(response) {

        SetPVarInt(playerid, "CarPrice", strval(inputtext));

        ShowVehicleDealerPreview(playerid);

    }
    return 1;
}

Dialog:AddVehicleColor2(playerid, response, listitem, inputtext[]) {
    if(response) {

        if(!(0 <= strval(inputtext) <= sizeof(ColorList)-1))
            return Dialog_Show(playerid, AddVehicleColor1, DIALOG_STYLE_INPUT, "Tambah kendaraan baru (warna 1)", color_string, "Input", "Close");

        SetPVarInt(playerid, "CarColor2", strval(inputtext));

        Dialog_Show(playerid, AddVehiclePrice, DIALOG_STYLE_INPUT, "Tambah kendaraan baru", "Masukkan harga untuk kendaraan", "Input", "Close");
        

    }
    return 1;
}

Dialog:AddVehicleColor1(playerid, response, listitem, inputtext[]) {
    if(response) {

        if(!(0 <= strval(inputtext) <= sizeof(ColorList)-1))
            return Dialog_Show(playerid, AddVehicleColor1, DIALOG_STYLE_INPUT, "Tambah kendaraan baru (warna 1)", color_string, "Input", "Close");

        SetPVarInt(playerid, "CarColor1", strval(inputtext));
        Dialog_Show(playerid, AddVehicleColor2, DIALOG_STYLE_INPUT, "Tambah kendaraan baru (warna 2)", color_string, "Input", "Close");

    }
    return 1;
}

ShowVehicleDealerPreview(playerid) {
    new string[562];

    new modelid = GetPVarInt(playerid, "CarModel"),
        type = GetPVarInt(playerid, "CarType"),
        cash = GetPVarInt(playerid, "CarPrice");

    strcat(string, va_return("Model: %s\n", ReturnVehicleModelName(modelid)));
    strcat(string, va_return("Tipe: %s\n", GetVehicleTypeName(type)));
    strcat(string, va_return("Harga: %s\n\n", FormatNumber(cash)));
    strcat(string, "Ingin menambahkan kendaraan ini? klik CONFIRM jika ingin lanjut.");

    return Dialog_Show(playerid, AddVehicleConfirm, DIALOG_STYLE_MSGBOX, "Tambah kendaraan baru", string, "Confirm", "Close");
}

Dialog:AddVehicleConfirm(playerid, response, listitem, inputtext[]) {
    new modelid = GetPVarInt(playerid, "CarModel"),
        type = GetPVarInt(playerid, "CarType"),
        color1 = GetPVarInt(playerid, "CarColor1"),
        cash = GetPVarInt(playerid, "CarPrice"),
        color2 = GetPVarInt(playerid, "CarColor2");

    AddVehicleToDealer(modelid, type, cash, color1, color2);
    return 1;
}   
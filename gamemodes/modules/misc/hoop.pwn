#include <YSI_Coding\y_hooks>

#define MAX_HOOP 1000
#define INVALID_HOOP_ID -1

enum E_HOOP_DATA {
    bool:hoopExists,
    STREAMER_TAG_OBJECT:hoopObject,
    STREAMER_TAG_PICKUP:hoopPickup,
    Float:hoopPos[3],
    Text3D:hoopLabel,
    hoopCaption[64],
    hoopColor,
    hoopWorld,
    hoopInterior,
    hoopNotif[64]
};
new HoopData[MAX_HOOP][E_HOOP_DATA];

GetFreeHoopID() {
    new idx = -1;

    for(new i = 0; i < MAX_HOOP; i++) if(!HoopData[i][hoopExists]) {
        idx = i;
        break;
    }
    return idx;
}
stock CreateHoop(Float:x, Float:y, Float:z, type = 1, color = 0, Float:distance = 10.0, caption[] = "None", interior = 0, world = 0, notif[] = "None") {

    new idx = -1;

    if((idx = GetFreeHoopID()) != -1) {
        HoopData[idx][hoopExists] = true;
        if(type == 1) {
            HoopData[idx][hoopObject] = CreateDynamicObject(1316, x, y, z - 1.0, 0.0, 0.0, 0.0, world, interior, .streamdistance = distance, .drawdistance = distance);
            SetDynamicObjectMaterial(HoopData[idx][hoopObject], 0, -1, "none", "none", RGBAToARGB(color));
        }
        else if(type == 2) {
            HoopData[idx][hoopPickup] = CreateDynamicPickup(19197, 23, x, y, z - 0.9, world, interior, .streamdistance = distance);
        }

        if(!isequal(caption, "None", true)) {

            new string[124];
            format(string, sizeof(string), "%s", caption);
            HoopData[idx][hoopLabel] = CreateDynamic3DTextLabel(string, -1, x, y, z, 5.0, .worldid = world, .interiorid = interior);
        }

        HoopData[idx][hoopExists] = true;
        format(HoopData[idx][hoopCaption], 64, caption);
        format(HoopData[idx][hoopNotif], 64, notif);

        HoopData[idx][hoopPos][0] = x;
        HoopData[idx][hoopPos][1] = y;
        HoopData[idx][hoopPos][2] = z;
        HoopData[idx][hoopWorld] = world;
        HoopData[idx][hoopInterior] = interior;
    }
    return idx;
}

stock IsValidHoop(idx) {
    if(idx == INVALID_HOOP_ID) {
        return 0;
    }

    if(!HoopData[idx][hoopExists]) {
        return 0;
    }

    return 1;
}

UpdateHoopLabel(idx, text[]) {

    if(!IsValidHoop(idx))
        return 1;

    if(IsValidDynamic3DTextLabel(HoopData[idx][hoopLabel])) {
        UpdateDynamic3DTextLabelText(HoopData[idx][hoopLabel], -1, text);
    }
    return 1;
}

stock DestroyHoop(id) {

    if(IsValidDynamicObject(HoopData[id][hoopObject]))
        DestroyDynamicObject(HoopData[id][hoopObject]);

    if(IsValidDynamicPickup(HoopData[id][hoopPickup]))
        DestroyDynamicPickup(HoopData[id][hoopPickup]);

    if(IsValidDynamic3DTextLabel(HoopData[id][hoopLabel]))
        DestroyDynamic3DTextLabel(HoopData[id][hoopLabel]);

    HoopData[id][hoopExists] = false;
    format(HoopData[id][hoopCaption], 24, "None");
    return -1;
}

stock GetNearestHoop(playerid, Float:range = 2.5) {
    new idx = -1;

    for(new i = 0; i < MAX_HOOP; i++) if(HoopData[i][hoopExists] && IsPlayerInRangeOfPoint(playerid, range, HoopData[i][hoopPos][0], HoopData[i][hoopPos][1], HoopData[i][hoopPos][2])) {
        idx = i;
        break;
    }
    return idx;
}

hook OnPlayerSecondUpdate(playerid) {
    new idx = -1;

    if((idx = GetNearestHoop(playerid)) != -1) {

        if(!isequal(HoopData[idx][hoopNotif], "None")) {

            new string[124];
            format(string, sizeof(string), "%s", HoopData[idx][hoopNotif]);
            ShowNotifTD(playerid, string, 1);
        }
    }
    return Y_HOOKS_CONTINUE_RETURN_1;
}
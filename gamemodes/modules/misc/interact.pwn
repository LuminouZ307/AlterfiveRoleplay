#include <YSI_Coding\y_hooks>

new PlayerText:INTERACT_TD[MAX_PLAYERS][7];
new PlayerText:INTERACT_VEH[MAX_PLAYERS];
new PlayerText:INTERACT_ITEM[MAX_PLAYERS];
new PlayerText:INTERACT_INVOICE[MAX_PLAYERS];
new PlayerText:INTERACT_PHONE[MAX_PLAYERS];
new PlayerText:INTERACT_GENERAL[MAX_PLAYERS];
new PlayerText:INTERACT_JOB[MAX_PLAYERS];
new PlayerText:INTERACT_CLOSE[MAX_PLAYERS];

hook OnPlayerConnect(playerid) {
    INTERACT_VEH[playerid] = CreatePlayerTextDraw(playerid, 248.000000, 177.000000, "ld_dual:white");
    PlayerTextDrawFont(playerid, INTERACT_VEH[playerid], 4);
    PlayerTextDrawLetterSize(playerid, INTERACT_VEH[playerid], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, INTERACT_VEH[playerid], 56.500000, 17.500000);
    PlayerTextDrawSetOutline(playerid, INTERACT_VEH[playerid], 1);
    PlayerTextDrawSetShadow(playerid, INTERACT_VEH[playerid], 0);
    PlayerTextDrawAlignment(playerid, INTERACT_VEH[playerid], 1);
    PlayerTextDrawColor(playerid, INTERACT_VEH[playerid], 123838463);
    PlayerTextDrawBackgroundColor(playerid, INTERACT_VEH[playerid], 255);
    PlayerTextDrawBoxColor(playerid, INTERACT_VEH[playerid], 50);
    PlayerTextDrawUseBox(playerid, INTERACT_VEH[playerid], 1);
    PlayerTextDrawSetProportional(playerid, INTERACT_VEH[playerid], 1);
    PlayerTextDrawSetSelectable(playerid, INTERACT_VEH[playerid], 1);

    INTERACT_TD[playerid][0] = CreatePlayerTextDraw(playerid, 276.000000, 181.000000, "KENDARAAN");
    PlayerTextDrawFont(playerid, INTERACT_TD[playerid][0], 1);
    PlayerTextDrawLetterSize(playerid, INTERACT_TD[playerid][0], 0.216666, 0.850000);
    PlayerTextDrawTextSize(playerid, INTERACT_TD[playerid][0], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, INTERACT_TD[playerid][0], 0);
    PlayerTextDrawSetShadow(playerid, INTERACT_TD[playerid][0], 1);
    PlayerTextDrawAlignment(playerid, INTERACT_TD[playerid][0], 2);
    PlayerTextDrawColor(playerid, INTERACT_TD[playerid][0], -1);
    PlayerTextDrawBackgroundColor(playerid, INTERACT_TD[playerid][0], 255);
    PlayerTextDrawBoxColor(playerid, INTERACT_TD[playerid][0], 50);
    PlayerTextDrawUseBox(playerid, INTERACT_TD[playerid][0], 0);
    PlayerTextDrawSetProportional(playerid, INTERACT_TD[playerid][0], 1);
    PlayerTextDrawSetSelectable(playerid, INTERACT_TD[playerid][0], 0);

    INTERACT_ITEM[playerid] = CreatePlayerTextDraw(playerid, 248.000000, 199.000000, "ld_dual:white");
    PlayerTextDrawFont(playerid, INTERACT_ITEM[playerid], 4);
    PlayerTextDrawLetterSize(playerid, INTERACT_ITEM[playerid], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, INTERACT_ITEM[playerid], 56.500000, 17.500000);
    PlayerTextDrawSetOutline(playerid, INTERACT_ITEM[playerid], 1);
    PlayerTextDrawSetShadow(playerid, INTERACT_ITEM[playerid], 0);
    PlayerTextDrawAlignment(playerid, INTERACT_ITEM[playerid], 1);
    PlayerTextDrawColor(playerid, INTERACT_ITEM[playerid], 123838463);
    PlayerTextDrawBackgroundColor(playerid, INTERACT_ITEM[playerid], 255);
    PlayerTextDrawBoxColor(playerid, INTERACT_ITEM[playerid], 50);
    PlayerTextDrawUseBox(playerid, INTERACT_ITEM[playerid], 1);
    PlayerTextDrawSetProportional(playerid, INTERACT_ITEM[playerid], 1);
    PlayerTextDrawSetSelectable(playerid, INTERACT_ITEM[playerid], 1);

    INTERACT_TD[playerid][1] = CreatePlayerTextDraw(playerid, 276.000000, 203.000000, "INVENTORY");
    PlayerTextDrawFont(playerid, INTERACT_TD[playerid][1], 1);
    PlayerTextDrawLetterSize(playerid, INTERACT_TD[playerid][1], 0.216666, 0.850000);
    PlayerTextDrawTextSize(playerid, INTERACT_TD[playerid][1], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, INTERACT_TD[playerid][1], 0);
    PlayerTextDrawSetShadow(playerid, INTERACT_TD[playerid][1], 1);
    PlayerTextDrawAlignment(playerid, INTERACT_TD[playerid][1], 2);
    PlayerTextDrawColor(playerid, INTERACT_TD[playerid][1], -1);
    PlayerTextDrawBackgroundColor(playerid, INTERACT_TD[playerid][1], 255);
    PlayerTextDrawBoxColor(playerid, INTERACT_TD[playerid][1], 50);
    PlayerTextDrawUseBox(playerid, INTERACT_TD[playerid][1], 0);
    PlayerTextDrawSetProportional(playerid, INTERACT_TD[playerid][1], 1);
    PlayerTextDrawSetSelectable(playerid, INTERACT_TD[playerid][1], 0);

    INTERACT_INVOICE[playerid] = CreatePlayerTextDraw(playerid, 248.000000, 222.000000, "ld_dual:white");
    PlayerTextDrawFont(playerid, INTERACT_INVOICE[playerid], 4);
    PlayerTextDrawLetterSize(playerid, INTERACT_INVOICE[playerid], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, INTERACT_INVOICE[playerid], 56.500000, 17.500000);
    PlayerTextDrawSetOutline(playerid, INTERACT_INVOICE[playerid], 1);
    PlayerTextDrawSetShadow(playerid, INTERACT_INVOICE[playerid], 0);
    PlayerTextDrawAlignment(playerid, INTERACT_INVOICE[playerid], 1);
    PlayerTextDrawColor(playerid, INTERACT_INVOICE[playerid], 123838463);
    PlayerTextDrawBackgroundColor(playerid, INTERACT_INVOICE[playerid], 255);
    PlayerTextDrawBoxColor(playerid, INTERACT_INVOICE[playerid], 50);
    PlayerTextDrawUseBox(playerid, INTERACT_INVOICE[playerid], 1);
    PlayerTextDrawSetProportional(playerid, INTERACT_INVOICE[playerid], 1);
    PlayerTextDrawSetSelectable(playerid, INTERACT_INVOICE[playerid], 1);

    INTERACT_TD[playerid][2] = CreatePlayerTextDraw(playerid, 276.000000, 226.000000, "TAGIHAN");
    PlayerTextDrawFont(playerid, INTERACT_TD[playerid][2], 1);
    PlayerTextDrawLetterSize(playerid, INTERACT_TD[playerid][2], 0.216666, 0.850000);
    PlayerTextDrawTextSize(playerid, INTERACT_TD[playerid][2], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, INTERACT_TD[playerid][2], 0);
    PlayerTextDrawSetShadow(playerid, INTERACT_TD[playerid][2], 1);
    PlayerTextDrawAlignment(playerid, INTERACT_TD[playerid][2], 2);
    PlayerTextDrawColor(playerid, INTERACT_TD[playerid][2], -1);
    PlayerTextDrawBackgroundColor(playerid, INTERACT_TD[playerid][2], 255);
    PlayerTextDrawBoxColor(playerid, INTERACT_TD[playerid][2], 50);
    PlayerTextDrawUseBox(playerid, INTERACT_TD[playerid][2], 0);
    PlayerTextDrawSetProportional(playerid, INTERACT_TD[playerid][2], 1);
    PlayerTextDrawSetSelectable(playerid, INTERACT_TD[playerid][2], 0);

    INTERACT_PHONE[playerid] = CreatePlayerTextDraw(playerid, 248.000000, 245.000000, "ld_dual:white");
    PlayerTextDrawFont(playerid, INTERACT_PHONE[playerid], 4);
    PlayerTextDrawLetterSize(playerid, INTERACT_PHONE[playerid], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, INTERACT_PHONE[playerid], 56.500000, 17.500000);
    PlayerTextDrawSetOutline(playerid, INTERACT_PHONE[playerid], 1);
    PlayerTextDrawSetShadow(playerid, INTERACT_PHONE[playerid], 0);
    PlayerTextDrawAlignment(playerid, INTERACT_PHONE[playerid], 1);
    PlayerTextDrawColor(playerid, INTERACT_PHONE[playerid], 123838463);
    PlayerTextDrawBackgroundColor(playerid, INTERACT_PHONE[playerid], 255);
    PlayerTextDrawBoxColor(playerid, INTERACT_PHONE[playerid], 50);
    PlayerTextDrawUseBox(playerid, INTERACT_PHONE[playerid], 1);
    PlayerTextDrawSetProportional(playerid, INTERACT_PHONE[playerid], 1);
    PlayerTextDrawSetSelectable(playerid, INTERACT_PHONE[playerid], 1);

    INTERACT_TD[playerid][3] = CreatePlayerTextDraw(playerid, 276.000000, 249.000000, "HANDPHONE");
    PlayerTextDrawFont(playerid, INTERACT_TD[playerid][3], 1);
    PlayerTextDrawLetterSize(playerid, INTERACT_TD[playerid][3], 0.216666, 0.850000);
    PlayerTextDrawTextSize(playerid, INTERACT_TD[playerid][3], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, INTERACT_TD[playerid][3], 0);
    PlayerTextDrawSetShadow(playerid, INTERACT_TD[playerid][3], 1);
    PlayerTextDrawAlignment(playerid, INTERACT_TD[playerid][3], 2);
    PlayerTextDrawColor(playerid, INTERACT_TD[playerid][3], -1);
    PlayerTextDrawBackgroundColor(playerid, INTERACT_TD[playerid][3], 255);
    PlayerTextDrawBoxColor(playerid, INTERACT_TD[playerid][3], 50);
    PlayerTextDrawUseBox(playerid, INTERACT_TD[playerid][3], 0);
    PlayerTextDrawSetProportional(playerid, INTERACT_TD[playerid][3], 1);
    PlayerTextDrawSetSelectable(playerid, INTERACT_TD[playerid][3], 0);

    INTERACT_GENERAL[playerid] = CreatePlayerTextDraw(playerid, 248.000000, 268.000000, "ld_dual:white");
    PlayerTextDrawFont(playerid, INTERACT_GENERAL[playerid], 4);
    PlayerTextDrawLetterSize(playerid, INTERACT_GENERAL[playerid], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, INTERACT_GENERAL[playerid], 56.500000, 17.500000);
    PlayerTextDrawSetOutline(playerid, INTERACT_GENERAL[playerid], 1);
    PlayerTextDrawSetShadow(playerid, INTERACT_GENERAL[playerid], 0);
    PlayerTextDrawAlignment(playerid, INTERACT_GENERAL[playerid], 1);
    PlayerTextDrawColor(playerid, INTERACT_GENERAL[playerid], 123838463);
    PlayerTextDrawBackgroundColor(playerid, INTERACT_GENERAL[playerid], 255);
    PlayerTextDrawBoxColor(playerid, INTERACT_GENERAL[playerid], 50);
    PlayerTextDrawUseBox(playerid, INTERACT_GENERAL[playerid], 1);
    PlayerTextDrawSetProportional(playerid, INTERACT_GENERAL[playerid], 1);
    PlayerTextDrawSetSelectable(playerid, INTERACT_GENERAL[playerid], 1);

    INTERACT_TD[playerid][4] = CreatePlayerTextDraw(playerid, 276.000000, 272.000000, "GENERAL");
    PlayerTextDrawFont(playerid, INTERACT_TD[playerid][4], 1);
    PlayerTextDrawLetterSize(playerid, INTERACT_TD[playerid][4], 0.216666, 0.850000);
    PlayerTextDrawTextSize(playerid, INTERACT_TD[playerid][4], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, INTERACT_TD[playerid][4], 0);
    PlayerTextDrawSetShadow(playerid, INTERACT_TD[playerid][4], 1);
    PlayerTextDrawAlignment(playerid, INTERACT_TD[playerid][4], 2);
    PlayerTextDrawColor(playerid, INTERACT_TD[playerid][4], -1);
    PlayerTextDrawBackgroundColor(playerid, INTERACT_TD[playerid][4], 255);
    PlayerTextDrawBoxColor(playerid, INTERACT_TD[playerid][4], 50);
    PlayerTextDrawUseBox(playerid, INTERACT_TD[playerid][4], 0);
    PlayerTextDrawSetProportional(playerid, INTERACT_TD[playerid][4], 1);
    PlayerTextDrawSetSelectable(playerid, INTERACT_TD[playerid][4], 0);

    INTERACT_JOB[playerid] = CreatePlayerTextDraw(playerid, 248.000000, 292.000000, "ld_dual:white");
    PlayerTextDrawFont(playerid, INTERACT_JOB[playerid], 4);
    PlayerTextDrawLetterSize(playerid, INTERACT_JOB[playerid], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, INTERACT_JOB[playerid], 56.500000, 17.500000);
    PlayerTextDrawSetOutline(playerid, INTERACT_JOB[playerid], 1);
    PlayerTextDrawSetShadow(playerid, INTERACT_JOB[playerid], 0);
    PlayerTextDrawAlignment(playerid, INTERACT_JOB[playerid], 1);
    PlayerTextDrawColor(playerid, INTERACT_JOB[playerid], 123838463);
    PlayerTextDrawBackgroundColor(playerid, INTERACT_JOB[playerid], 255);
    PlayerTextDrawBoxColor(playerid, INTERACT_JOB[playerid], 50);
    PlayerTextDrawUseBox(playerid, INTERACT_JOB[playerid], 1);
    PlayerTextDrawSetProportional(playerid, INTERACT_JOB[playerid], 1);
    PlayerTextDrawSetSelectable(playerid, INTERACT_JOB[playerid], 1);

    INTERACT_TD[playerid][5] = CreatePlayerTextDraw(playerid, 276.000000, 296.000000, "PEKERJAAN");
    PlayerTextDrawFont(playerid, INTERACT_TD[playerid][5], 1);
    PlayerTextDrawLetterSize(playerid, INTERACT_TD[playerid][5], 0.216666, 0.850000);
    PlayerTextDrawTextSize(playerid, INTERACT_TD[playerid][5], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, INTERACT_TD[playerid][5], 0);
    PlayerTextDrawSetShadow(playerid, INTERACT_TD[playerid][5], 1);
    PlayerTextDrawAlignment(playerid, INTERACT_TD[playerid][5], 2);
    PlayerTextDrawColor(playerid, INTERACT_TD[playerid][5], -1);
    PlayerTextDrawBackgroundColor(playerid, INTERACT_TD[playerid][5], 255);
    PlayerTextDrawBoxColor(playerid, INTERACT_TD[playerid][5], 50);
    PlayerTextDrawUseBox(playerid, INTERACT_TD[playerid][5], 0);
    PlayerTextDrawSetProportional(playerid, INTERACT_TD[playerid][5], 1);
    PlayerTextDrawSetSelectable(playerid, INTERACT_TD[playerid][5], 0);

    INTERACT_CLOSE[playerid] = CreatePlayerTextDraw(playerid, 310.000000, 292.000000, "ld_dual:white");
    PlayerTextDrawFont(playerid, INTERACT_CLOSE[playerid], 4);
    PlayerTextDrawLetterSize(playerid, INTERACT_CLOSE[playerid], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, INTERACT_CLOSE[playerid], 56.500000, 17.500000);
    PlayerTextDrawSetOutline(playerid, INTERACT_CLOSE[playerid], 1);
    PlayerTextDrawSetShadow(playerid, INTERACT_CLOSE[playerid], 0);
    PlayerTextDrawAlignment(playerid, INTERACT_CLOSE[playerid], 1);
    PlayerTextDrawColor(playerid, INTERACT_CLOSE[playerid], -1962934017);
    PlayerTextDrawBackgroundColor(playerid, INTERACT_CLOSE[playerid], 255);
    PlayerTextDrawBoxColor(playerid, INTERACT_CLOSE[playerid], 50);
    PlayerTextDrawUseBox(playerid, INTERACT_CLOSE[playerid], 1);
    PlayerTextDrawSetProportional(playerid, INTERACT_CLOSE[playerid], 1);
    PlayerTextDrawSetSelectable(playerid, INTERACT_CLOSE[playerid], 1);

    INTERACT_TD[playerid][6] = CreatePlayerTextDraw(playerid, 338.000000, 296.000000, "TUTUP");
    PlayerTextDrawFont(playerid, INTERACT_TD[playerid][6], 1);
    PlayerTextDrawLetterSize(playerid, INTERACT_TD[playerid][6], 0.216666, 0.850000);
    PlayerTextDrawTextSize(playerid, INTERACT_TD[playerid][6], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, INTERACT_TD[playerid][6], 0);
    PlayerTextDrawSetShadow(playerid, INTERACT_TD[playerid][6], 1);
    PlayerTextDrawAlignment(playerid, INTERACT_TD[playerid][6], 2);
    PlayerTextDrawColor(playerid, INTERACT_TD[playerid][6], -1);
    PlayerTextDrawBackgroundColor(playerid, INTERACT_TD[playerid][6], 255);
    PlayerTextDrawBoxColor(playerid, INTERACT_TD[playerid][6], 50);
    PlayerTextDrawUseBox(playerid, INTERACT_TD[playerid][6], 0);
    PlayerTextDrawSetProportional(playerid, INTERACT_TD[playerid][6], 1);
    PlayerTextDrawSetSelectable(playerid, INTERACT_TD[playerid][6], 0);
}

ShowInteraction(playerid) {
    for(new i = 0; i < 7; i++) {
        PlayerTextDrawShow(playerid, INTERACT_TD[playerid][i]);
    }

    PlayerTextDrawShow(playerid, INTERACT_VEH[playerid]);
    PlayerTextDrawShow(playerid, INTERACT_ITEM[playerid]);
    PlayerTextDrawShow(playerid, INTERACT_INVOICE[playerid]);
    PlayerTextDrawShow(playerid, INTERACT_PHONE[playerid]);
    PlayerTextDrawShow(playerid, INTERACT_GENERAL[playerid]);
    PlayerTextDrawShow(playerid, INTERACT_JOB[playerid]);
    PlayerTextDrawShow(playerid, INTERACT_CLOSE[playerid]);

    SelectTextDraw(playerid, X11_YELLOW);
}

HideInteraction(playerid, bool:hide_cursor = true) {
    for(new i = 0; i < 7; i++) {
        PlayerTextDrawHide(playerid, INTERACT_TD[playerid][i]);
    }

    PlayerTextDrawHide(playerid, INTERACT_VEH[playerid]);
    PlayerTextDrawHide(playerid, INTERACT_ITEM[playerid]);
    PlayerTextDrawHide(playerid, INTERACT_INVOICE[playerid]);
    PlayerTextDrawHide(playerid, INTERACT_PHONE[playerid]);
    PlayerTextDrawHide(playerid, INTERACT_GENERAL[playerid]);
    PlayerTextDrawHide(playerid, INTERACT_JOB[playerid]);
    PlayerTextDrawHide(playerid, INTERACT_CLOSE[playerid]);

    if(hide_cursor)
        CancelSelectTextDraw(playerid);
    
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys) {
    if(PRESSED(KEY_NO)) {
        ShowInteraction(playerid);
    }
}

hook OnPlayerHideCursor(playerid, hovercolor) {
    HideInteraction(playerid);
}

hook OnPlayerClickPlayerTD(playerid, PlayerText:playertextid) {
    if(playertextid == INTERACT_CLOSE[playerid]) {
        HideInteraction(playerid);
    }

    if(playertextid == INTERACT_PHONE[playerid]) {

        if(IsPlayerInjured(playerid))
            return 1;

        HideInteraction(playerid, false);

        if(PHONE_WALLPAPER[playerid] != PlayerText:INVALID_TEXT_DRAW) {
            DestroyPhone(playerid);
        }
        CreatePhone(playerid);
        ShowPhoneBase(playerid);
        ShowPhoneApp(playerid);

        SelectTextDraw(playerid, X11_YELLOW);

        SetPlayerAttachedObject(playerid, ATTACH_INDEX_GENERAL, 18867, 6, 0.0909, -0.0030, 0.0000, 80.4001, 159.8000, 18.0000, 1.0000, 1.0000, 1.0000, 0xFFFFFFFF, 0xFFFFFFFF);
        ApplyAnimation(playerid, "ROCKET", "IDLE_ROCKET", 4.1, 0, 0, 0, 1, 0, 1);
        SetPlayerArmedWeapon(playerid, 0);
    }
    if(playertextid == INTERACT_VEH[playerid]) {

        HideInteraction(playerid);

        if(IsPlayerInAnyVehicle(playerid)) {
            ShowInVehInteract(playerid);
        }
        else {
            ShowOutVehInteract(playerid);
        }
    }
    if(playertextid == INTERACT_ITEM[playerid]) {

        if(IsPlayerInjured(playerid))
            return 1;

        HideInteraction(playerid, false);

        OpenInventory(playerid, playerid);
        invPage[playerid] = 0;
    }
    return Y_HOOKS_CONTINUE_RETURN_1;
}

Dialog:InVehInteract(playerid,response,listitem,inputtext[]) {
    if(response) {

        new vehicleid = GetPlayerVehicleID(playerid);
        if(listitem == 0) {
            if(GetEngineStatus(vehicleid)) {
                SwitchVehicleEngine(vehicleid, false);
            }
            else {
                SwitchVehicleEngine(vehicleid, true);
            }
        }
        if(listitem == 1) {
            if(!Vehicle_IsOwner(playerid, vehicleid)) {
                return 1;
            }

            if(!VehicleData[vehicleid][vehicleLock]) {
                VehicleData[vehicleid][vehicleLock] = 1;
                Notify(playerid, "KENDARAAN", "Kendaraan dikunci.", NOTIF_GENERAL, 3);
                PlayerPlaySoundEx(playerid, 24600);
            }
            else {
                VehicleData[vehicleid][vehicleLock] = 0;
                Notify(playerid, "KENDARAAN", "Kendaraan dibuka.", NOTIF_GENERAL, 3);
                PlayerPlaySoundEx(playerid, 1145);
            }
            SwitchVehicleDoor(vehicleid, VehicleData[vehicleid][vehicleLock]);   
        }
        if(listitem == 2) {
            VehicleData[vehicleid][vehicleLights] = !(VehicleData[vehicleid][vehicleLights]);
            SwitchVehicleLight(vehicleid, VehicleData[vehicleid][vehicleLights]);
        }
    }
    return 1;
}

Dialog:OutVehInteract(playerid,response,listitem,inputtext[]) {

    new vehicleid = GetClosestVehicleToPlayer(playerid);
    if(response) {

        if(!IsValidVehicle(vehicleid))
            return ErrorTD(playerid, "Tidak ada kendaraan didekatmu.");

        new Float:x, Float:y, Float:z;
        GetVehiclePos(vehicleid, x, y, z);
        if(listitem == 0) {
            if(!Vehicle_IsOwner(playerid, vehicleid)) {
                return 1;
            }

            if(!VehicleData[vehicleid][vehicleLock]) {
                VehicleData[vehicleid][vehicleLock] = 1;
                Notify(playerid, "KENDARAAN", "Kendaraan dikunci.", NOTIF_GENERAL, 3);
                PlayerPlaySoundEx(playerid, 24600);
            }
            else {
                VehicleData[vehicleid][vehicleLock] = 0;
                Notify(playerid, "KENDARAAN", "Kendaraan dibuka.", NOTIF_GENERAL, 3);
                PlayerPlaySoundEx(playerid, 1145);
            }
            ApplyAnimation(playerid, "HEIST9", "Use_SwipeCard", 10.0, 0, 0, 0, 0, 0);
            SwitchVehicleDoor(vehicleid, VehicleData[vehicleid][vehicleLock]);  
            SetPlayerFace(playerid, x, y);
        }
    }
    return 1;
}

ShowOutVehInteract(playerid) {
    Dialog_Show(playerid, OutVehInteract, DIALOG_STYLE_LIST, "Vehicle Interaction", "Lock Doors\nOpen Storage", "Select", "Close");
    return 1;
}

ShowInVehInteract(playerid) {
    Dialog_Show(playerid, InVehInteract, DIALOG_STYLE_LIST, "Vehicle Interaction", "Engine\nLock Doors\nLights", "Select", "Close");
    return 1;
}
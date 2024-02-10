#include <YSI_Coding\y_hooks>

hook OnCharacterLoaded(playerid)
{
    mysql_tquery(sqlcon, va_return("SELECT * FROM `items` WHERE `ExtraID` = '%d' LIMIT %d", PlayerData[playerid][pID], MAX_INVENTORY), "LoadPlayerInventory", "d", playerid);
}

hook OnPlayerClickPlayerTD(playerid, PlayerText:playertextid) {
    if(playertextid == INV_EXIT[playerid]) {
        for(new i = 0; i < 8; i++) {
            PlayerTextDrawHide(playerid, INV_TD[playerid][i]);
        }

        PlayerTextDrawHide(playerid, INV_TITLE[playerid]);
        PlayerTextDrawHide(playerid, INV_INPUT[playerid]);
        PlayerTextDrawHide(playerid, INV_INPUT_NUM[playerid]);
        PlayerTextDrawHide(playerid, INV_EXIT[playerid]);
        PlayerTextDrawHide(playerid, INV_GIVE[playerid]);
        PlayerTextDrawHide(playerid, INV_USE[playerid]);
        PlayerTextDrawHide(playerid, INV_PREV[playerid]);
        PlayerTextDrawHide(playerid, INV_NEXT[playerid]);

        for(new i = 0; i < 12; i++) {
            PlayerTextDrawHide(playerid, INV_SELECT[playerid][i]);
            PlayerTextDrawHide(playerid, INV_NAME[playerid][i]);
            PlayerTextDrawHide(playerid, INV_AMOUNT[playerid][i]);
            PlayerTextDrawHide(playerid, INV_MODEL[playerid][i]);
        }
        CancelSelectTextDraw(playerid);

    }
    if(playertextid == INV_NEXT[playerid]) {

        if(invPage[playerid] < 2) {
            invPage[playerid]++;
            SyncInventoryPage(playerid);
            PlayerPlaySound(playerid, 1039, 0.0, 0.0, 0.0);
        }
    }
    if(playertextid == INV_PREV[playerid]) {

        if(invPage[playerid] > 0) {
            invPage[playerid]--;

            SyncInventoryPage(playerid);
            PlayerPlaySound(playerid, 1039, 0.0, 0.0, 0.0);
        }
    }

    if(playertextid == INV_USE[playerid]) {
        new idx = invSelect[playerid];

        if(idx == -1) {
            return ErrorTD(playerid, "Kamu belum memilih~n~item!");
        }

        if(!InventoryData[playerid][idx][invExists]) {
            return ErrorTD(playerid, "Tidak ada item!");
        }

        CallLocalFunction("OnPlayerUseItem", "dds", playerid, idx, InventoryData[playerid][idx][invName]);
    }
    for(new i = 0; i < 12; i++) if(playertextid == INV_SELECT[playerid][i]) {


        for(new j = 0; j < 12; j++) {
            PlayerTextDrawColor(playerid, INV_SELECT[playerid][j], 1077885951);
            PlayerTextDrawShow(playerid, INV_SELECT[playerid][j]);
        }

        new idxs = invPage[playerid] * 12;
        new itemid = i + idxs;

        if(invSelect[playerid] == itemid) {
            invSelect[playerid] = -1;
        }
        else {
            PlayerTextDrawColor(playerid, INV_SELECT[playerid][i], -1094795674);
            PlayerTextDrawShow(playerid, INV_SELECT[playerid][i]);
            new idx = invPage[playerid] * 12;
            new real_idx = idx + i;
            invSelect[playerid] = real_idx;
        }
        break;
    }
    return Y_HOOKS_CONTINUE_RETURN_1;
}

function OnPlayerUseItem(playerid, itemid, itemname[]) {

    printf("UseItem: %s Model: %d ID:%d", itemname, GetItemModel(itemname), itemid);
    return 1;
}
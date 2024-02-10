CountPlayerItem(playerid) {
	new count = 0;

	for(new i = 0; i < MAX_INVENTORY; i++) if(InventoryData[playerid][i][invExists]) {
		count++;
	}
	return count;
}

GetFreeInventoryID(playerid) {

	new idx = -1;
	for(new i = 0; i < MAX_INVENTORY; i++) if(!InventoryData[playerid][i][invExists]) {
		idx = i;
		break;
	}
	return idx;
}

GetInventorySameForSlot(playerid, item[], added_amount) {
	new idx = -1, stack;
	for(new i = 0; i < MAX_INVENTORY; i++) if(InventoryData[playerid][i][invExists] && !strcmp(InventoryData[playerid][i][invName], item, true)) {

        stack = GetItemStack(item);

        if(InventoryData[playerid][i][invAmount] + added_amount <= stack) {
            idx = i;
            break;
        }
		
	}
	return idx;
}

RemovePlayerInventory(playerid, itemid) {

	if(InventoryData[playerid][itemid][invExists]) {
		InventoryData[playerid][itemid][invAmount] = 0;
		format(InventoryData[playerid][itemid][invName], 32, "\0");
		InventoryData[playerid][itemid][invExists] = false;

		mysql_tquery(sqlcon, va_return("DELETE FROM `items` WHERE `ID` = '%d'", InventoryData[playerid][itemid][invID]));
	}
}

GetItemModel(itemname[]) {
	new model = 0;

	for(new i = 0; i < sizeof(g_ItemInfo); i++) if(isequal(g_ItemInfo[i][e_item_name], itemname)) {
		model = g_ItemInfo[i][e_item_model];
		break;
	}
	return model;
}

GetItemAmount(playerid, itemid) {
    return InventoryData[playerid][itemid][invAmount];
}
UpdatePlayerItem(playerid, itemid, amount) {
    InventoryData[playerid][itemid][invAmount] = amount;
    SQL_UpdateInventory(playerid, itemid);
}
SetPlayerItem(playerid, item[], amount) {

	if(GetFreeInventoryID(playerid) == -1) {
		return -1;
	}

	new same = -1;

	same = GetInventorySameForSlot(playerid, item, amount);

	if(same == -1) {
		new id = GetFreeInventoryID(playerid);

        if(id == -1) {
            return -1;
        }

		InventoryData[playerid][id][invExists] = true;
		InventoryData[playerid][id][invAmount] = amount;
		format(InventoryData[playerid][id][invName], 32, RemoveSpace(item));

		new query[256];
		mysql_format(sqlcon, query, sizeof(query), "INSERT INTO `items` (`ExtraID`, `Name`, `Amount`) VALUES('%d','%e','%d')", PlayerData[playerid][pID], RemoveSpace(item), amount);
		mysql_tquery(sqlcon, query, "OnInventoryAdd", "dd", playerid, id);
	}
	else {
        UpdatePlayerItem(playerid, same, GetItemAmount(playerid, same)+amount);
	}
	return 1;
}

function OnInventoryAdd(playerid, id) {
	InventoryData[playerid][id][invID] = cache_insert_id();
}

SQL_UpdateInventory(playerid, id) {
	new query[256];
	mysql_format(sqlcon, query, sizeof(query), "UPDATE `items` SET `Amount` = '%d' WHERE `ID` = '%d' AND `ExtraID` = '%d'", InventoryData[playerid][id][invAmount], InventoryData[playerid][id][invID], PlayerData[playerid][pID]);
	return mysql_tquery(sqlcon, query);
}

function OpenInventory(playerid, showto)
{
    if(!IsCharacterSpawned(playerid))
        return 0;
    
    for(new i = 0; i < 12; i++) {
        PlayerTextDrawColor(playerid, INV_SELECT[playerid][i], 1077885951);
        PlayerTextDrawShow(playerid, INV_SELECT[playerid][i]);
        PlayerTextDrawHide(playerid, INV_NAME[playerid][i]);
        PlayerTextDrawHide(playerid, INV_AMOUNT[playerid][i]);
        PlayerTextDrawHide(playerid, INV_MODEL[playerid][i]);
    }
    for(new i = 0; i < 12; i++) if(InventoryData[playerid][i][invExists]) {

        PlayerTextDrawShow(playerid, INV_NAME[playerid][i]);
        PlayerTextDrawSetString(playerid, INV_NAME[playerid][i], RemoveSpace(InventoryData[playerid][i][invName]));
        PlayerTextDrawShow(playerid, INV_AMOUNT[playerid][i]);
        if(isequal(InventoryData[playerid][i][invName], "Uang")) {
            PlayerTextDrawSetString(playerid, INV_AMOUNT[playerid][i], va_return("%s", FormatNumber(InventoryData[playerid][i][invAmount])));
        }
        else {
            PlayerTextDrawSetString(playerid, INV_AMOUNT[playerid][i], va_return("x%d", InventoryData[playerid][i][invAmount]));
        }
        PlayerTextDrawSetPreviewModel(playerid, INV_MODEL[playerid][i], GetItemModel(InventoryData[playerid][i][invName]));
        PlayerTextDrawShow(playerid, INV_MODEL[playerid][i]);
    }
     
    PlayerTextDrawShow(playerid, INV_TITLE[playerid]);
    PlayerTextDrawShow(playerid, INV_INPUT[playerid]);
    PlayerTextDrawShow(playerid, INV_INPUT_NUM[playerid]);
    PlayerTextDrawShow(playerid, INV_EXIT[playerid]);
    PlayerTextDrawShow(playerid, INV_GIVE[playerid]);
    PlayerTextDrawShow(playerid, INV_USE[playerid]);
    PlayerTextDrawShow(playerid, INV_PREV[playerid]);
    PlayerTextDrawShow(playerid, INV_NEXT[playerid]);

    //ShowInventoryGUI(playerid);
    PlayerTextDrawShow(playerid, INV_TD[playerid][0]);
    PlayerTextDrawShow(playerid, INV_TD[playerid][1]);
    PlayerTextDrawShow(playerid, INV_TD[playerid][2]);
    PlayerTextDrawShow(playerid, INV_TD[playerid][3]);
    PlayerTextDrawShow(playerid, INV_TD[playerid][4]);
    PlayerTextDrawShow(playerid, INV_TD[playerid][5]);
    PlayerTextDrawShow(playerid, INV_TD[playerid][6]);
    PlayerTextDrawShow(playerid, INV_TD[playerid][7]);

    PlayerPlaySound(playerid, 1039, 0.0, 0.0, 0.0);
    SelectTextDraw(playerid, X11_YELLOW);
    return 1;
}

IsItemCanGive(item[]) {
	new can_Give = true;
    for (new i = 0; i < sizeof(g_ItemInfo); i ++) if(!strcmp(g_ItemInfo[i][e_item_name], item, true))
    {
        if(!g_ItemInfo[i][e_item_give])
        {
            can_Give = false;
			break;
        }
    }
	return can_Give;
}


GetItemStack(item[]) {
	new stack = 0;
    for (new i = 0; i < sizeof(g_ItemInfo); i ++) if(!strcmp(g_ItemInfo[i][e_item_name], item, true))
    {
        stack = g_ItemInfo[i][e_item_stack];
        break;
    }
	return stack;
}

SyncInventoryPage(playerid) {
    new idx = invPage[playerid];

    new tempidx = idx * 12;

    for(new i = 0; i < 12; i++) {
        PlayerTextDrawColor(playerid, INV_SELECT[playerid][i], 1077885951);
        PlayerTextDrawShow(playerid, INV_SELECT[playerid][i]);
        PlayerTextDrawHide(playerid, INV_NAME[playerid][i]);
        PlayerTextDrawHide(playerid, INV_AMOUNT[playerid][i]);
        PlayerTextDrawHide(playerid, INV_MODEL[playerid][i]);
        
    }
    for(new i = 0; i < 12; i++) if(InventoryData[playerid][tempidx + i][invExists]) {

        PlayerTextDrawShow(playerid, INV_NAME[playerid][i]);
        PlayerTextDrawSetString(playerid, INV_NAME[playerid][i], RemoveSpace(InventoryData[playerid][tempidx + i][invName]));
        PlayerTextDrawShow(playerid, INV_AMOUNT[playerid][i]);
        if(isequal(InventoryData[playerid][i][invName], "Uang")) {
            PlayerTextDrawSetString(playerid, INV_AMOUNT[playerid][i], va_return("%s", FormatNumber(InventoryData[playerid][tempidx + i][invAmount])));
        }
        else {
            PlayerTextDrawSetString(playerid, INV_AMOUNT[playerid][i], va_return("x%d", InventoryData[playerid][tempidx + i][invAmount]));
        }
        PlayerTextDrawSetPreviewModel(playerid, INV_MODEL[playerid][i], GetItemModel(InventoryData[playerid][tempidx + i][invName]));
        PlayerTextDrawShow(playerid, INV_MODEL[playerid][i]);
    }
}
function LoadPlayerInventory(playerid) {
    new
        rows = cache_num_rows();

    for(new i = 0; i < rows; i++)
    {
		cache_get_value_name(i, "Name", InventoryData[playerid][i][invName], 32);
		cache_get_value_name_int(i, "Amount", InventoryData[playerid][i][invAmount]);
		cache_get_value_name_int(i, "ID", InventoryData[playerid][i][invID]);
		InventoryData[playerid][i][invExists] = true;
    }
    return 1;
}

GetCountItem(playerid, item[]) {

    new count = 0;
    for(new i = 0; i < MAX_INVENTORY; i++) if(InventoryData[playerid][i][invExists] && isequal(InventoryData[playerid][i][invName], item)) {
        count += InventoryData[playerid][i][invAmount];
    }
    return count;
}
GetMoney(playerid) {
    return GetCountItem(playerid, "Uang");
}
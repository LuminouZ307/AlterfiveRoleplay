#define MAX_INVENTORY 36

enum E_INVENTORY_DATA {
	invID,
	invExists,
	invName[32],
	invAmount
};
new InventoryData[MAX_PLAYERS][MAX_INVENTORY][E_INVENTORY_DATA];

enum E_ITEM_OPT {
	e_item_name[32],
	e_item_model,
	e_item_stack,
	e_item_give
};

new const g_ItemInfo[][E_ITEM_OPT] = {
    {"Handphone", 18867, 1, false},
    {"GPS", 18875, 1, false},
    {"JerryCan", 1650, 3, true},
    {"Medkit", 1580, 3, true},
    {"Radio", 18868, 1, false},
    {"Snack", 2768, 5, true},
    {"Air Mineral", 1484, 5, true},
    {"Guzzle_Combo", 2663, 5, true},
    {"Burger", 2703, 10, true},
    {"Kebab", 2769, 10 ,true},
    {"Rokok", 19896, 3, true},
    {"Sprite", 1546, 10, true},
    {"Uang", 1212, 99999999, true},
    {"Obeng", 19627, 1, true},
    {"Kopi", 19835, 10, true},
    {"Jus Apel", 19564, 10, true},
    {"Daging Ayam", 2804, 10, true},
    {"Tabung Nitro", 1009, 10}
};

new invPage[MAX_PLAYERS] = {0, ...},
    invSelect[MAX_PLAYERS] = {-1, ...};
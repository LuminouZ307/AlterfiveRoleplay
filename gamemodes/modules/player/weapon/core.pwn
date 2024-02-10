new PlayerText:AMMO_GUI[MAX_PLAYERS];

#define MAX_WEAPON_HEALTH           100.0
#define DEFAULT_AMMO                20
#define MAX_WEAPON_SLOT             13
#define PLAYER_WEAPON_INTERVAL		999

enum E_WEAPON_DATA {
	weapon_id,
	weapon_slot,
	weapon_ammo,
	weapon_serial[64],
};

new 
	PlayerGuns[MAX_PLAYERS][MAX_WEAPON_SLOT][E_WEAPON_DATA];

new const MaxGunAmmo[54] = {
	0,-1,-1,-1,-1,-1,-1,-1,-1,-1,
	-1,-1,-1,-1,-1,-1,10,10,10,0,
	0,0,850,350,350,100,200,350,2000,2000,
	2000,750,2000,100,50,5,5,10,9999,10,
	-1,500,500,10,-1,-1,-1,0,0,0,
	0,0,0,0
};

new const g_aWeaponSlots[] =
{
	0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 10, 10, 8, 8, 8, 0, 0, 0, 2, 2, 2, 3, 3, 3, 4, 4, 5, 5, 4, 6, 6, 7, 7, 7, 7, 8, 12, 9, 9, 9, 11, 11, 11
};


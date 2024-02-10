#include <YSI_Coding\y_hooks>

hook OnPlayerConnect(playerid) {
    AMMO_GUI[playerid] = CreatePlayerTextDraw(playerid, 519.000000, 66.000000, "1000");
    PlayerTextDrawFont(playerid, AMMO_GUI[playerid], 1);
    PlayerTextDrawLetterSize(playerid, AMMO_GUI[playerid], 0.237500, 1.149999);
    PlayerTextDrawTextSize(playerid, AMMO_GUI[playerid], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, AMMO_GUI[playerid], 1);
    PlayerTextDrawSetShadow(playerid, AMMO_GUI[playerid], 0);
    PlayerTextDrawAlignment(playerid, AMMO_GUI[playerid], 2);
    PlayerTextDrawColor(playerid, AMMO_GUI[playerid], -1061109505);
    PlayerTextDrawBackgroundColor(playerid, AMMO_GUI[playerid], 255);
    PlayerTextDrawBoxColor(playerid, AMMO_GUI[playerid], 50);
    PlayerTextDrawUseBox(playerid, AMMO_GUI[playerid], 0);
    PlayerTextDrawSetProportional(playerid, AMMO_GUI[playerid], 1);
    PlayerTextDrawSetSelectable(playerid, AMMO_GUI[playerid], 0);
}

hook OnPlayerSpawn(playerid) {
    PlayerTextDrawShow(playerid, AMMO_GUI[playerid]);
}

hook OnPlayerDisconnectEx(playerid)
{
    SQL_SaveWeapon(playerid);
    for (new i = 0; i < MAX_WEAPON_SLOT; i ++) if(PlayerGuns[playerid][i][weapon_id]) 
    {
        PlayerGuns[playerid][i][weapon_id] = 0;
        PlayerGuns[playerid][i][weapon_ammo] = 0;
        PlayerGuns[playerid][i][weapon_slot] = 0;
    }
    ResetPlayerWeapons(playerid);
}

hook OnCharacterLoaded(playerid)
{
    mysql_tquery(sqlcon, va_return("SELECT * FROM `weapon_players` WHERE `ownerid` = '%d';", GetPlayerSQLID(playerid)), "PlayerWeapon_Load", "d", playerid);
}

hook OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
    if(GetWeapon(playerid) == weaponid)
    {
        new slot = g_aWeaponSlots[weaponid];

        if(--PlayerGuns[playerid][slot][weapon_ammo] <= 0) {
            SetPlayerArmedWeapon(playerid, 0);
            PlayerGuns[playerid][slot][weapon_ammo] = 0;
        }
    }
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if (PRESSED(KEY_FIRE) || PRESSED(KEY_HANDBRAKE))
	{
		new weaponid;

		if((weaponid = GetWeapon(playerid)) != 0 && !PlayerGuns[playerid][g_aWeaponSlots[weaponid]][weapon_ammo] && GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) 
		{
			TogglePlayerControllable(playerid, 0);
			SetPlayerArmedWeapon(playerid, 0);
			TogglePlayerControllable(playerid, 1);
			SetCameraBehindPlayer(playerid);
		}
	}
}

hook OnPlayerSecondUpdate(playerid) {
    if(IsCharacterSpawned(playerid)) {
		new weaponid = GetWeapon(playerid);
		if(weaponid >= 22 && weaponid <= 38) {
			if(PlayerGuns[playerid][g_aWeaponSlots[weaponid]][weapon_ammo] > 0) {
				PlayerTextDrawSetString(playerid, AMMO_GUI[playerid], va_return("%d", PlayerGuns[playerid][g_aWeaponSlots[weaponid]][weapon_ammo]));
			}
		}
		else
			PlayerTextDrawSetString(playerid,  AMMO_GUI[playerid], "_");
    }
    return Y_HOOKS_CONTINUE_RETURN_1;
}

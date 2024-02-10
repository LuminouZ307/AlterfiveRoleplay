

#include <a_samp>

#undef MAX_PLAYERS
#define MAX_PLAYERS 100
#define TDN_MODE_DEFAULT
#define CGEN_MEMORY	20000

native IsValidVehicle(vehicleid);

#include <a_mysql>
#include <sscanf2>
#include <streamer>

#include <YSI_Coding\y_va>
#include <YSI_Server\y_colours>
#include <YSI_Data\y_iterate>
#include <YSI_Coding\y_timers>
#include <YSI_Game\y_vehicledata>

#include <DialogCenter>

#include <fSelection>
#include <eSelection>

#include <samp_bcrypt>
#include <izcmd>
#include <easyDialog> 
#include <callbacks>
#include <samp-loadingbar>
#include <colandreas>
#include <distance>

#include "modules\core\mapping.pwn"
#include "modules\core\define.pwn"
#include "modules\core\var.pwn"

#include "modules/player/hbe/core.pwn"
#include "modules/player/weapon/core.pwn"
#include "modules/system/faction/core.pwn"
#include "modules/system/items/core.pwn"
#include "modules/system/phone/core.pwn"
#include "modules/system/vehicle/core.pwn"
#include "modules/system/dealership/core.pwn"
#include "modules/system/door/core.pwn"
#include "modules/system/shop/core.pwn"

#include "modules\core\funcs.pwn"

//#include "modules/system/chatbox.pwn"
#include "modules/misc/notify.pwn"
#include "modules/misc/notifbar.pwn"
#include "modules/misc/hoop.pwn"
#include "modules/misc/loadscreen.pwn"
#include "modules/misc/idle.pwn"

#include "modules/system/items/gui.pwn"
#include "modules/system/phone/contactui.pwn"
#include "modules/system/phone/gui.pwn"

#include "modules/player/hbe/func.pwn"
#include "modules/player/weapon/func.pwn"
#include "modules/system/items/func.pwn"
#include "modules/system/faction/func.pwn"
#include "modules/system/phone/func.pwn"
#include "modules/system/vehicle/func.pwn"
#include "modules/system/dealership/func.pwn"
#include "modules/system/door/func.pwn"
#include "modules/system/shop/func.pwn"

#include "modules/misc/interact.pwn"
#include "modules/misc/nametag.pwn"
#include "modules/system/faction/pedagang.pwn"

#include "modules/misc/asuransi.pwn"
#include "modules/misc/speedometer.pwn"

#include "modules/player/hbe/callback.pwn"
#include "modules/player/weapon/callback.pwn"
#include "modules/system/items/callback.pwn"
#include "modules/system/faction/callback.pwn"
#include "modules/system/phone/callback.pwn"
#include "modules/system/vehicle/callback.pwn"
#include "modules/system/dealership/callback.pwn"
#include "modules/system/door/callback.pwn"
#include "modules/system/shop/callback.pwn"

#include "modules/player/weapon/cmd.pwn"
#include "modules/system/items/cmd.pwn"
#include "modules/system/faction/cmd.pwn"
#include "modules/system/phone/cmd.pwn"
#include "modules/system/vehicle/cmd.pwn"
#include "modules/system/dealership/cmd.pwn"
#include "modules/system/door/cmd.pwn"
#include "modules/system/shop/cmd.pwn"

#include "modules/core/timer.pwn"
#include "modules/misc/object.pwn"
/* Gamemode Start! */

main()
{
	print("FiveM Project Gamemode loaded!");
}

public OnGameModeInit()
{
	if(SQL_Connect()) {
		DisableInteriorEnterExits();
		EnableStuntBonusForAll(0);
		ManualVehicleEngineAndLights();
		ShowPlayerMarkers(PLAYER_MARKERS_MODE_OFF);
		CreateServerObjects();
		CA_Init();
		for (new i; i < sizeof(ColorList); i++) {
			format(color_string, sizeof(color_string), "%s{%06x}%03d %s", color_string, ColorList[i] >>> 8, i, ((i+1) % 16 == 0) ? ("\n") : (""));
		}

		mysql_tquery(sqlcon, "UPDATE `vehicles` SET `State` = '1'");
		CallLocalFunction("OnGameModeInitEx", "");
		CreateHoop(1975.4735,-2046.5167,13.5469, 1, X11_YELLOW, 10.0, ""GREEN"[Y] "WHITE"Menu asuransi", 0, 0);
		ShowNameTags(0);
		SetGameModeText(SERVER_VERSION);
		SendRconCommand("hostname "#SERVER_HOSTNAME"");
		SendRconCommand("language Bahasa Indonesia");
	}
	else {
		SendRconCommand("hostname "#SERVER_HOSTNAME" database not Connected!!!");
		SendRconCommand("password 1231321");
	}
	return 1;
}

public OnGameModeExit()
{
	return 1;
}

public OnVehicleDeath(vehicleid, killerid) {
	return 1;
}

public OnVehicleSpawn(vehicleid) {
	
}
public OnPlayerConnect(playerid)
{
	g_RaceCheck{playerid} ++;
	ResetPlayerVariable(playerid);
	PlayerData[playerid][pAdmin] = 6;
	PreloadAnimations(playerid);

	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	if(IsCharacterSpawned(playerid)) {
		SQL_SaveCharacter(playerid);

		new minute = 10*60;
		mysql_tquery(sqlcon, va_return("UPDATE `characters` SET `LastExitTime` = '%d' WHERE `pID` = '%d'", gettime()+minute, PlayerData[playerid][pID]));

		CallLocalFunction("OnPlayerDisconnectEx", "d", playerid);
	}

	PlayerData[playerid][pSpawned] = false;
	return 1;
}

function OnCharacterLoaded(playerid) { 
	
}
public OnPlayerRequestClass(playerid, classid) {
	if(!PlayerData[playerid][pSpawned]) {

		TogglePlayerSpectating(playerid, true);

		OnIntroCamera(playerid);
		StartLoadingScreen(playerid);

		switch(random(3)) {
			case 0: {
				PlayAudioStreamForPlayer(playerid, "https://cdn.discordapp.com/attachments/1183677132782714930/1183677376455000074/chimewalovesong.mp3?ex=65893476&is=6576bf76&hm=85e234b10dd602ab88f9611847face2f6bda4e2d2e696c6a9c6615c69cfe3315&");
				SendClientMessage(playerid, X11_LIGHTBLUE, "Now playing: Chime wa Lovesong - JKT48 (sisasose cover)");
			}
			case 1: {
				PlayAudioStreamForPlayer(playerid, "https://cdn.discordapp.com/attachments/1183677132782714930/1183677376769560576/hissatsuteleport.mp3?ex=65893476&is=6576bf76&hm=e12ede0263da163480a09f909e462787fba685d35eba7c9e3e1fb88e806b886b&");
				SendClientMessage(playerid, X11_LIGHTBLUE, "Now playing: Jurus Rahasia Teleport - JKT48 (sisasose cover)");
			}
			case 2: {
				PlayAudioStreamForPlayer(playerid, "https://cdn.discordapp.com/attachments/1183677132782714930/1184838689759703090/onlytoday.mp3?ex=658d6e04&is=657af904&hm=94f2b4b8c392df9ee9cd4ea2b10869b9194326689007547859de54cd8497861d&");
				SendClientMessage(playerid, X11_LIGHTBLUE, "Now playing: Only Today - JKT48 (sisasose cover)");
			}
		}

	}
	return 1;
}

function OnLoadingScrFinish(playerid) {
	PlayerCheck(playerid, g_RaceCheck{playerid});
	return 1;
}

function OnPlayerPressH(playerid) {
	return 1;
}
public OnPlayerKeyStateChange(playerid, newkeys, oldkeys) {

	if(PRESSED(KEY_SPRINT)) {
		if(IdleAnim[playerid]) {
			
			IdleAnim[playerid] = false;

			if(!IsPlayerInAnyVehicle(playerid)) 
				ClearAnimations(playerid, 1);
		}
	}
	if(PRESSED(KEY_SECONDARY_ATTACK)) {
		if(!IsPlayerInjured(playerid))
			CallLocalFunction("OnPlayerPressEnter", "d", playerid);
	}
	if(PRESSED(KEY_YES)) {
		if(!IsPlayerInjured(playerid))
			CallLocalFunction("OnPlayerPressY", "d", playerid);
	}
	if(PRESSED(KEY_CTRL_BACK)) {
		if(!IsPlayerInjured(playerid))
			CallLocalFunction("OnPlayerPressH", "d", playerid);
	}
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate) {
	if(newstate == PLAYER_STATE_WASTED) {
		if(!IsPlayerInjured(playerid)) {
			PlayerData[playerid][pInjured] = true;
			GetPlayerPos(playerid, PlayerData[playerid][pInjuredPos][0],  PlayerData[playerid][pInjuredPos][1],  PlayerData[playerid][pInjuredPos][2]);
			PlayerData[playerid][pWorld] = GetPlayerVirtualWorld(playerid);
			PlayerData[playerid][pInterior] = GetPlayerInterior(playerid);

			SetSpawnInfo(playerid, NO_TEAM, GetPlayerSkin(playerid), PlayerData[playerid][pInjuredPos][0],  PlayerData[playerid][pInjuredPos][1],  PlayerData[playerid][pInjuredPos][2], 0.0, 0,0,0,0,0,0);
		}
		else {
			PlayerData[playerid][pDead] = true;
			PlayerData[playerid][pInjured] = false;

			SetSpawnInfo(playerid, NO_TEAM, GetPlayerSkin(playerid),  1181.8834,-1323.9219,13.5822,271.2740, 0,0,0,0,0,0);
		}
	}
	return 1;
}
function OnPlayerPressY(playerid) {
	return 1;
}

function OnPlayerSecondUpdate(playerid) {

	new hour, minute, second;
	gettime(hour, minute, second);
	SetPlayerTime(playerid, hour, minute);

	if(IsCharacterSpawned(playerid)) {
		if(GetPlayerAnimationIndex(playerid) != 1701 && PlayerData[playerid][pInjured])
		{
			ApplyAnimation(playerid, "WUZI", "CS_DEAD_GUY", 4.1, 0, 0, 0, 1, 0, 1);
		}
	}
	return 1;
}

public OnPlayerUpdate(playerid) {
    new iCurWeap = GetPlayerWeapon(playerid); 
    if (iCurWeap != GetPVarInt(playerid, "iCurrentWeapon")) 
    {
        CallLocalFunction("OnPlayerChangeWeapon", "ddd", playerid, GetPVarInt(playerid, "iCurrentWeapon"), iCurWeap);
        SetPVarInt(playerid, "iCurrentWeapon", iCurWeap);
    }
	return 1;
}

function OnPlayerChangeWeapon(playerid, oldweapon, newweapon) {
	if(!IsTwoHandWeapon(newweapon)) {
		if(IdleAnim[playerid]) {
			ClearAnimations(playerid, 1);
			IdleAnim[playerid] = false;
		}
	}
	return 1;
}
public OnPlayerHideCursor(playerid, hovercolor) {
	InfoTD(playerid, "Gunakan '/cursor' untuk~n~memunculkan cursor.");
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid) {
	PlayerData[playerid][pInterior] = GetPlayerInterior(playerid);
	SyncNameTag(playerid);
	return 1;
}
public OnPlayerSpawn(playerid)
{
	if(!PlayerData[playerid][pSpawned])
	{
	    PlayerData[playerid][pSpawned] = true;
	    SetPlayerHealth(playerid, PlayerData[playerid][pHealth]);

	    SetPlayerSkin(playerid, PlayerData[playerid][pSkin]);
	    SetPlayerVirtualWorld(playerid, PlayerData[playerid][pWorld]);
		SetPlayerInterior(playerid, PlayerData[playerid][pInterior]);

		StopAudioStreamForPlayer(playerid);
		RefreshWeapon(playerid);

		SyncNameTag(playerid);
		SetPlayerArmedWeapon(playerid, 0);
	}

	if(PlayerData[playerid][pInjured]) {
		SetPlayerPos(playerid, PlayerData[playerid][pInjuredPos][0],  PlayerData[playerid][pInjuredPos][1],  PlayerData[playerid][pInjuredPos][2]);
		SetPlayerInterior(playerid, PlayerData[playerid][pInterior]);
		SetPlayerVirtualWorld(playerid, PlayerData[playerid][pWorld]);
	}
	if(PlayerData[playerid][pDead]) {
		PlayerData[playerid][pInjured] = false;
		PlayerData[playerid][pDead] = false;
		
		SetPlayerInterior(playerid, 0);
		SetPlayerVirtualWorld(playerid, 0);
		Streamer_Update(playerid, STREAMER_TYPE_OBJECT);

		SetPlayerHealthEx(playerid, 100);
		SetPlayerPos(playerid, 1181.8834,-1323.9219,13.5822);
		SetPlayerFacingAngle(playerid, 271.2740);
		SetCameraBehindPlayer(playerid);
		ResetWeapons(playerid);
	}
	return 1;
}


public OnPlayerText(playerid, text[])
{
    return 0;
}

public OnPlayerCommandPerformed(playerid, cmdtext[], success)
{
	printf("[CMD] %s: %s", GetName(playerid, false), cmdtext);

	if(!success) {
		return ErrorTD(playerid, "Command tidak ditemukan.");
	}
		

    return 1;
}

public OnPlayerTakeDamage(playerid, issuerid, Float:amount, weaponid, bodypart) {

	if(playerid == INVALID_PLAYER_ID) {
		return 0;
	}
	if(issuerid != INVALID_PLAYER_ID)
	{
		return 0;
	}
	else {
		CallLocalFunction("OnPlayerDamage", "ddfdd", playerid, issuerid, amount, weaponid, bodypart);
	}
	return 1;
}
public OnPlayerGiveDamage(playerid, damagedid, Float:amount, weaponid, bodypart) {

	if(damagedid != INVALID_PLAYER_ID) {
		CallLocalFunction("OnPlayerDamage", "ddfdd", damagedid, playerid, amount, weaponid, bodypart);
	}
	return 1;
}

function OnPlayerDamage(playerid, issuerid, Float:amount, weaponid, bodypart) {

	g_LastDamager[playerid] = issuerid;
	g_LastDamageW[playerid] = weaponid;

	new Float:damage = 0.0, Float:x, Float:y, Float:z, Float:armour, Float:health;

	GetPlayerPos(playerid, x, y, z);

	damage = GetWeaponDamage(issuerid, weaponid, x, y, z);

	GetPlayerHealth(playerid, health);
	GetPlayerArmourEx(playerid, armour);

	if(weaponid >= 22 && weaponid <= 38) {

		if(armour > 0.0) {
			SetPlayerArmourEx(playerid, armour-damage);
			SetPlayerHealthEx(playerid, health);
		}
		else {
			SetPlayerHealthEx(playerid, health-damage);
		}
	}
	else {
		SetPlayerHealthEx(playerid, health-amount);
	}
	return 1;
}

function OnPlayerDead(playerid, killerid, reason) {
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason) {
	return 1;
}

/*  Commands */

CMD:hf(playerid, params[]) {
	if(!fselection_showing(playerid))
		return 1;

	fselection_hide(playerid);
	return 1;
}

CMD:ahealme(playerid, params[]) {

	if(!PlayerData[playerid][pAdmin])
		return NoAdmin(playerid);

	SetPlayerHealth(playerid, 100.0);
	PlayerData[playerid][pInjured] = false;
	PlayerData[playerid][pDead] = false;
	ClearAnimations(playerid, 1);
	ApplyAnimation(playerid, "WUZI", "CS_DEAD_GUY", 4.1, 0, 0, 0, 1, 0, 1);
	return 1;
}

CMD:sethp(playerid, params[]) {
	if(PlayerData[playerid][pAdmin] < 2)
		return NoAdmin(playerid);

	new targetid, Float:hp;
	if(sscanf(params, "uf", targetid, hp))
		return Syntax(playerid, "/sethp [playerid/PartOfName] [health]");

	if(targetid == INVALID_PLAYER_ID)
		return ErrorMsg(playerid, "You have specified invalid player.");

	SetPlayerHealthEx(targetid, hp);
	return 1;
}

CMD:cursor(playerid, params[]) {
	SelectTextDraw(playerid, X11_ORANGE);
	return 1;
}

CMD:gotoco(playerid, params[]) {

	if(!PlayerData[playerid][pAdmin])
		return NoAdmin(playerid);

	new Float:x, Float:y, Float:z, interior;

	sscanf(params, "fffd", x, y, z, interior);

	SetPlayerInterior(playerid, interior);
	SetPlayerPos(playerid, x, y, z);
	return 1;
}

CMD:ann(playerid, params[]) {
	if(!PlayerData[playerid][pAdmin]) 
		return NoAdmin(playerid);

	if(isnull(params))
		return Syntax(playerid, "/ann [pengumuman]");
		
	
	va_SendClientMessageToAll(X11_LIGHTPINK, "OOC Pengumuman | %s: %s", PlayerData[playerid][pUCP], params);
	return 1;
}

CMD:vr(playerid, params[]) {

	if(!IsCharacterSpawned(playerid))
		return 1;
		
	CallRemoteFunction("OnChangeVoiceRange", "d", playerid);
	return 1;
}
/* Dialog */

Dialog:DIALOG_REGISTER(playerid, response, listitem, inputtext[]) {
	if(!response)
		return Kick(playerid);

	new str[256];
	format(str, sizeof(str), "Welcome to Roleplay Server!\n\nYour UCP: %s\nERROR: Password length cannot below 7 or above 32!\nPlease insert your Password below to register:", GetName(playerid));

	if(strlen(inputtext) < 8 || strlen(inputtext) > 32)
		return Dialog_Show(playerid, DIALOG_REGISTER, DIALOG_STYLE_PASSWORD, "UCP - Register", str, "Register", "Exit");

	bcrypt_hash(playerid, "HashPlayerPassword", inputtext, BCRYPT_COST);
	return 1;
}

Dialog:DIALOG_LOGIN(playerid, response, listitem, inputtext[]) {
	if(!response)
		return Kick(playerid);
		
	if(!strlen(inputtext))
	{
		new str[256];
		format(str, sizeof(str), "Welcome Back to Roleplay Server!\n\nYour UCP: %s\nPlease insert your Password below to logged in:", GetName(playerid));
		Dialog_Show(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "UCP - Login", str, "Login", "Exit");
		return 1;
	}
	new pwQuery[256], hash[BCRYPT_HASH_LENGTH];
	mysql_format(sqlcon, pwQuery, sizeof(pwQuery), "SELECT Password FROM playerucp WHERE UCP = '%e' LIMIT 1", GetName(playerid));
	new Cache:result = mysql_query(sqlcon, pwQuery);
	
	cache_get_value_name(0, "Password", hash, sizeof(hash));
	
	bcrypt_verify(playerid, "OnPlayerPasswordChecked", inputtext, hash);

	cache_delete(result);
	return 1;
}

Dialog:DIALOG_CHARLIST(playerid, response, listitem, inputtext[]) {
	if(response)
	{
		if (PlayerChar[playerid][listitem][0] == EOS)
			return Dialog_Show(playerid, DIALOG_MAKECHAR, DIALOG_STYLE_INPUT, "Create Character", "Insert your new Character Name\n\nExample: Finn_Xanderz, Javier_Cooper etc.", "Create", "Exit");

		PlayerData[playerid][pChar] = listitem;
		//SetPlayerName(playerid, PlayerChar[playerid][listitem]);
		new cQuery[256];
		mysql_format(sqlcon, cQuery, sizeof(cQuery), "SELECT * FROM `characters` WHERE `Name` = '%e' LIMIT 1;", PlayerChar[playerid][listitem]);
		mysql_tquery(sqlcon, cQuery, "LoadCharacterData", "d", playerid);
		
	}
	return 1;
}

Dialog:DIALOG_MAKECHAR(playerid, response, listitem, inputtext[]) {
	if(response)
	{
		if(strlen(inputtext) < 1 || strlen(inputtext) > 24)
			return Dialog_Show(playerid, DIALOG_MAKECHAR, DIALOG_STYLE_INPUT, "Create Character", "Insert your new Character Name\n\nExample: Finn_Xanderz, Javier_Cooper etc.", "Create", "Back");

		if(!IsRoleplayName(inputtext))
			return Dialog_Show(playerid, DIALOG_MAKECHAR, DIALOG_STYLE_INPUT, "Create Character", "Insert your new Character Name\n\nExample: Finn_Xanderz, Javier_Cooper etc.", "Create", "Back");

		new characterQuery[178];
		mysql_format(sqlcon, characterQuery, sizeof(characterQuery), "SELECT * FROM `characters` WHERE `Name` = '%s'", inputtext);
		mysql_tquery(sqlcon, characterQuery, "InsertPlayerName", "ds", playerid, inputtext);

		format(PlayerData[playerid][pUCP], 22, GetName(playerid));
	}
	return 1;
}

Dialog:DIALOG_BIRTHDATE(playerid, response, listitem, inputtext[]) {

	if(response)
	{
		new
			iDay,
			iMonth,
			iYear;

		new const
			arrMonthDays[] = {31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

		if (sscanf(inputtext, "p</>ddd", iDay, iMonth, iYear)) {
			Dialog_Show(playerid, DIALOG_BIRTHDATE, DIALOG_STYLE_INPUT, "Date of Birth", "Error: Invalid format specified!\n\nPlease enter your date of birth below (DD/MM/YYYY):", "Submit", "Cancel");
		}
		else if (iYear < 1900 || iYear > 2014) {
			Dialog_Show(playerid, DIALOG_BIRTHDATE, DIALOG_STYLE_INPUT, "Date of Birth", "Error: Invalid year specified!\n\nPlease enter your date of birth below (DD/MM/YYYY):", "Submit", "Cancel");
		}
		else if (iMonth < 1 || iMonth > 12) {
			Dialog_Show(playerid, DIALOG_BIRTHDATE, DIALOG_STYLE_INPUT, "Date of Birth", "Error: Invalid month specified!\n\nPlease enter your date of birth below (DD/MM/YYYY):", "Submit", "Cancel");
		}
		else if (iDay < 1 || iDay > arrMonthDays[iMonth - 1]) {
			Dialog_Show(playerid, DIALOG_BIRTHDATE, DIALOG_STYLE_INPUT, "Date of Birth", "Error: Invalid day specified!\n\nPlease enter your date of birth below (DD/MM/YYYY):", "Submit", "Cancel");
		}
		else 
		{
			format(PlayerData[playerid][pBirthdate], 24, inputtext);
			Dialog_Show(playerid, DIALOG_ORIGIN, DIALOG_STYLE_INPUT, "Character Origin", "Please input your Character Origin:", "Continue", "Quit");
		}
	}
	else
	{
		Dialog_Show(playerid, DIALOG_BIRTHDATE, DIALOG_STYLE_INPUT, "Date of Birth", "Please enter your date of birth below (DD/MM/YYYY):", "Submit", "Cancel");
	}
	return 1;
}

Dialog:DIALOG_ORIGIN(playerid, response, listitem, inputtext[]) {
	if(!response)
		return Dialog_Show(playerid, DIALOG_ORIGIN, DIALOG_STYLE_INPUT, "Character Origin", "Please input your Character Origin:", "Continue", "Quit");

	if(strlen(inputtext) < 1)
		return Dialog_Show(playerid, DIALOG_ORIGIN, DIALOG_STYLE_INPUT, "Character Origin", "Please input your Character Origin:", "Continue", "Quit");

	format(PlayerData[playerid][pOrigin], 32, inputtext);
	Dialog_Show(playerid, DIALOG_GENDER, DIALOG_STYLE_LIST, "Character Gender", "Male\nFemale", "Continue", "Cancel");
	return 1;
}

Dialog:DIALOG_GENDER(playerid, response, listitem, inputtext[]) {
	
	if(!response)
		return Dialog_Show(playerid, DIALOG_GENDER, DIALOG_STYLE_LIST, "Character Gender", "Male\nFemale", "Continue", "Cancel");

	PlayerData[playerid][pGender] = listitem + 1;

	if(listitem == 0) {
		ShowModelSelectionMenu(playerid, "Select Skin", SELECTION_SPAWNSKIN, g_MaleSkins, sizeof(g_MaleSkins));
	}
	else {
		ShowModelSelectionMenu(playerid, "Select Skin", SELECTION_SPAWNSKIN, g_FemaleSkins, sizeof(g_FemaleSkins));
	}
	return 1;
}

public OnModelSelectionResponse(playerid, extraid, index, modelid, response) {
	if(extraid == SELECTION_SPAWNSKIN) {
		if(!response) {
			if(PlayerData[playerid][pGender] == 1) {
				ShowModelSelectionMenu(playerid, "Select Skin", SELECTION_SPAWNSKIN, g_MaleSkins, sizeof(g_MaleSkins));
			}
			else {
				ShowModelSelectionMenu(playerid, "Select Skin", SELECTION_SPAWNSKIN, g_FemaleSkins, sizeof(g_FemaleSkins));
			}
		}
		else {
			PlayerData[playerid][pSkin] = modelid;
			PlayerData[playerid][pHealth] = 100.0;
			SetupPlayerData(playerid);
		}
	}
	return 1;
}
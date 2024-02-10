GetName(playerid, bool:underscore = true)
{
	new name[MAX_PLAYER_NAME];
	GetPlayerName(playerid,name,sizeof(name));

	if(!underscore) {

		for (new i = 0, len = strlen(name); i < len; i ++)
		{
	        if (name[i] == '_') name[i] = ' ';
		}
	}
	return name;
}

GetRPName(playerid, bool:underscore = true)
{
	new name[MAX_PLAYER_NAME];
	format(name, sizeof(name), PlayerData[playerid][pName]);

	if(!underscore) {

		for (new i = 0, len = strlen(name); i < len; i ++)
		{
	        if (name[i] == '_') name[i] = ' ';
		}
	}
	return name;
}

PreloadAnimations(playerid)
{
    for (new i = 0; i < sizeof(g_aPreloadLibs); i ++) {
        ApplyAnimation(playerid, g_aPreloadLibs[i], "null", 4.0, 0, 0, 0, 0, 0, 1);
    }
    return 1;
}

SQL_Connect()
{
	sqlcon = mysql_connect(DATABASE_ADDRESS,DATABASE_USERNAME,DATABASE_PASSWORD,DATABASE_NAME);

	if(mysql_errno(sqlcon) != 0){
	    print("[MySQL] - Connection Failed!");
		return 0;
	}
	else{
		print("[MySQL] - Connection Estabilished!");
	}
	return 1;
}

SetCameraLookPlayer(playerid) {
	new
		Float:x,
		Float:y,
		Float:z,
		Float:r;

	GetPlayerPos(playerid, x, y, z);
	GetPlayerFacingAngle(playerid, r);

	SetPlayerCameraPos(playerid,
		x + (5*floatsin(-r, degrees)),
		y + (5*floatcos(-r, degrees)), z);

	SetPlayerCameraLookAt(playerid, x, y, z, CAMERA_MOVE);
}
stock IsRoleplayName(player[])
{
    for(new n = 0; n < strlen(player); n++)
    {
        if (player[n] == '_' && player[n+1] >= 'A' && player[n+1] <= 'Z') return 1;
        if (player[n] == ']' || player[n] == '[') return 0;
	}
    return 0;
}

stock IsPlayerNearPlayer(playerid, targetid, Float:radius)
{
	static
		Float:fX,
		Float:fY,
		Float:fZ;

	GetPlayerPos(targetid, fX, fY, fZ);

	return (GetPlayerInterior(playerid) == GetPlayerInterior(targetid) && GetPlayerVirtualWorld(playerid) == GetPlayerVirtualWorld(targetid)) && IsPlayerInRangeOfPoint(playerid, radius, fX, fY, fZ);
}

stock SendNearbyMessage(playerid, Float:radius, color, const str[], {Float,_}:...)
{
	static
	    args,
	    start,
	    end,
	    string[144]
	;
	#emit LOAD.S.pri 8
	#emit STOR.pri args

	if (args > 16)
	{
		#emit ADDR.pri str
		#emit STOR.pri start

	    for (end = start + (args - 16); end > start; end -= 4)
		{
	        #emit LREF.pri end
	        #emit PUSH.pri
		}
		#emit PUSH.S str
		#emit PUSH.C 144
		#emit PUSH.C string

		#emit LOAD.S.pri 8
		#emit CONST.alt 4
		#emit SUB
		#emit PUSH.pri

		#emit SYSREQ.C format
		#emit LCTRL 5
		#emit SCTRL 4

        foreach (new i : Player)
		{
			if (IsPlayerNearPlayer(i, playerid, radius) && PlayerData[i][pSpawned])
			{
  				SendClientMessage(i, color, string);
			}
		}
		return 1;
	}
	foreach (new i : Player)
	{
		if (IsPlayerNearPlayer(i, playerid, radius) && PlayerData[i][pSpawned])
		{
			SendClientMessage(i, color, str);
		}
	}
	return 1;
}

stock SendClientMessageEx(playerid, colour, const text[], va_args<>)
{
    new str[145];
    va_format(str, sizeof(str), text, va_start<3>);
    return SendClientMessage(playerid, colour, str);
}

stock AdminMessage(colour, const text[], va_args<>) {
	new str[145];
	va_format(str, sizeof(str), text, va_start<2>);
	foreach(new i : Player) if(PlayerData[i][pAdmin]) {
		SendClientMessage(i, colour, str);
	}
	return 1;
}
stock SQL_CheckAccount(playerid)
{
	new query[256];
	format(query, sizeof(query), "SELECT * FROM `playerucp` WHERE `UCP` = '%s' LIMIT 1;", GetName(playerid));
	mysql_tquery(sqlcon, query, "OnUsernameCheck", "d", playerid);
	return 1;
}

function PlayerCheck(playerid, rcc)
{
	if(rcc != g_RaceCheck{playerid})
	    return Kick(playerid);
	    
	SQL_CheckAccount(playerid);
	return true;
}

function OnUsernameCheck(playerid)
{
	new rows = cache_num_rows();
	new str[256];
	if (rows)
	{
	    cache_get_value_name(0, "UCP", UserData[playerid][userName]);
		cache_get_value_name(0, "ID", UserData[playerid][userID]);
	    format(str, sizeof(str), "Welcome Back to Roleplay Server!\n\nYour UCP: %s\nPlease insert your Password below to logged in:", GetName(playerid));
		Dialog_Show(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "UCP - Login", str, "Login", "Exit");
	}
	else
	{
	    format(str, sizeof(str), "Welcome to Roleplay Server!\n\nYour UCP: %s\nPlease insert your Password below to register:", GetName(playerid));
		Dialog_Show(playerid, DIALOG_REGISTER, DIALOG_STYLE_PASSWORD, "UCP - Register", str, "Register", "Exit");
	}
	return 1;
}

GeneratePhoneNumber()
{
    new prefix[] = "08";
    new randomNumber, str_number[11], output[15];

    // Menghasilkan 10 angka acak.
    for (new i = 0; i < 11; i++) {
        randomNumber = random(10); // Menghasilkan angka acak antara 0 dan 9.
        format(str_number, sizeof(str_number), "%s%d", str_number, randomNumber);
    }

    // Menggabungkan prefix "08" dengan angka acak.
    format(output, sizeof(output), "%s%s", prefix, str_number);

	return output;
}

IsEngineVehicle(vehicleid)
{
	new const g_aEngineStatus[] = {
	    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
	    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1,
	    1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1,
	    1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
	    1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
	    1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1,
	    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1,
	    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
	    1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1,
	    1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1,
	    1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0
	};
    new modelid = GetVehicleModel(vehicleid);

    if (modelid < 400 || modelid > 611)
        return 0;

    return (g_aEngineStatus[modelid - 400]);
}

GetPlayerDirection(playerid) {

    new direction[64], Float:rz;


	if(IsPlayerInAnyVehicle(playerid)) {
		GetVehicleZAngle(GetPlayerVehicleID(playerid), rz);
	}
	else {
		GetPlayerFacingAngle(playerid, rz);
	}

	if(rz >= 348.75 || rz < 11.25) direction = "N";
	else if(rz >= 326.25 && rz < 348.75) direction = "NNE";
	else if(rz >= 303.75 && rz < 326.25) direction = "NE";
	else if(rz >= 281.25 && rz < 303.75) direction = "ENE";
	else if(rz >= 258.75 && rz < 281.25) direction = "E";
	else if(rz >= 236.25 && rz < 258.75) direction = "ESE";
	else if(rz >= 213.75 && rz < 236.25) direction = "SE";
	else if(rz >= 191.25 && rz < 213.75) direction = "SSE";
	else if(rz >= 168.75 && rz < 191.25) direction = "S";
	else if(rz >= 146.25 && rz < 168.75) direction = "SSW";
	else if(rz >= 123.25 && rz < 146.25) direction = "SW";
	else if(rz >= 101.25 && rz < 123.25) direction = "WSW";
	else if(rz >= 78.75 && rz < 101.25) direction = "W";
	else if(rz >= 56.25 && rz < 78.75) direction = "WNW";
	else if(rz >= 33.75 && rz < 56.25) direction = "NW";
	else if(rz >= 11.5 && rz < 33.75) direction = "NNW";

    return direction;
}

GetPlayerZone(playerid)
{
    new Float:x;
    new Float:y;
    new Float:z;
    new zoneName[64];
    GetPlayerPos(playerid, x, y, z);
    for(new i=0; i<375; i++){
        if(ZoneInfo[i][zonePosx1] < x && ZoneInfo[i][zonePosx2] > x)
        {
            if(ZoneInfo[i][zonePosy1] < y && ZoneInfo[i][zonePosy2] > y)
            {
                if(ZoneInfo[i][zonePosz1] < z && (ZoneInfo[i][zonePosz2]+100) > z){
                    format(zoneName, 64, "%s", ZoneInfo[i][ZoneName]);
                }
            }
        }
    }
    return zoneName;
}

GetPlayerCity(playerid)
{
    new Float:x;
    new Float:y;
    new Float:z;
    GetPlayerPos(playerid, x, y, z);

    new cities[3][ZoneInfoEnum] =
    {
        {-2997.47, -1213.91, -1115.58, 1659.68, -242.99, 900.0, "San Fierro"},
        {869.461, 2997.06, 596.349, 2993.87, -242.99, 900.0, "Las Venturas"},
        {44.6147, 2997.06, -2892.97, -768.027, -242.99, 900.0, "Los Santos"}
    };

    new cityName[64];
    for(new i=0; i<3; i++)
    {
        if(cities[i][zonePosx1] < x && cities[i][zonePosx2] > x)
        {
            if(cities[i][zonePosy1] < y && cities[i][zonePosy2] > y)
            {
                format(cityName,64,"%s",cities[i][ZoneName]);
            }
        }
    }
    return cityName;
}

Float:GetVehicleSpeed(vehicleid)
{
    new
        Float:x,
        Float:y,
        Float:z,
        Float:speed;
        
    GetVehicleVelocity(vehicleid, x, y, z);
    speed = VectorSize(x, y, z);
    
    return floatmul(speed, 195.12); 
}

SetupPlayerData(playerid)
{
    SetSpawnInfo(playerid, 0, PlayerData[playerid][pSkin], 1642.1681, -2333.3689, 13.5469, 0.0, 0, 0, 0, 0, 0, 0);
    TogglePlayerSpectating(playerid, false);

	InfoTD(playerid, "Selamat datang warga baru!", 4);
	InfoTD(playerid, "Kamu dibekali handphone,~n~makan dan juga minum~n~pada inventory!");
	InfoTD(playerid, "Petunjuk bermain & keybinds~n~silahkan lihat discord.");

	SetPlayerItem(playerid, "Uang",  500);
	SetPlayerItem(playerid, "Guzzle_Combo",  1);
	SetPlayerItem(playerid, "Handphone", 1);

	format(PlayerData[playerid][pPhoneNumber], 15, GeneratePhoneNumber());
	PlayerData[playerid][pBankNumber] = RandomEx(1111, 9999);
    return 1;
}

stock SQL_SaveCharacter(playerid)
{
	new query[1012];
	if(PlayerData[playerid][pSpawned])
	{
		GetPlayerPos(playerid, PlayerData[playerid][pPos][0], PlayerData[playerid][pPos][1], PlayerData[playerid][pPos][2]);
		GetPlayerHealth(playerid, PlayerData[playerid][pHealth]);

	    mysql_format(sqlcon, query, sizeof(query), "UPDATE `characters` SET `PosX` = '%.4f', `PosY` = '%.4f', `PosZ` = '%.4f', `Health` = '%.4f', `World` = '%d', `Interior` = '%d', `Birthdate` = '%d', `Origin` = '%e', `Gender` = '%d', `Skin` = '%d', `BankMoney` = '%d'",
			PlayerData[playerid][pPos][0],
			PlayerData[playerid][pPos][1],
			PlayerData[playerid][pPos][2],
			PlayerData[playerid][pHealth],
			GetPlayerVirtualWorld(playerid),
			GetPlayerInterior(playerid),
			PlayerData[playerid][pBirthdate],
			PlayerData[playerid][pOrigin],
			PlayerData[playerid][pGender],
			PlayerData[playerid][pSkin],
			PlayerData[playerid][pBankMoney]
		);
	    mysql_format(sqlcon, query, sizeof(query), "%s, `Health` = '%.2f', `Armour` = '%.2f', `Hunger` = '%.2f', `Thirst` = '%.2f', `Number` = '%e', `Battery` = '%d', `LastDeposit` = '%e', `LastWithdraw` = '%e', `LastTransfer` = '%e', `LastTransferAmount` = '%d'",
			query,
			PlayerData[playerid][pHealth],
			PlayerData[playerid][pArmour],
			PlayerData[playerid][pHunger],
			PlayerData[playerid][pThirst],
			PlayerData[playerid][pPhoneNumber],
			PlayerData[playerid][pBattery],
			PlayerData[playerid][pLastDeposit],
			PlayerData[playerid][pLastWithdraw],
			PlayerData[playerid][pLastTransfer],
			PlayerData[playerid][pLastTransferAmount]
		);
		mysql_format(sqlcon, query, sizeof(query), "%s, `BankNumber` = '%d', `FactionID` = '%d', `FactionRank` = '%d', `FactionSkin` = '%d', `Injured` = '%d', `FactionBadge` = '%d'",
			query,
			PlayerData[playerid][pBankNumber],
			PlayerData[playerid][pFactionID],
			PlayerData[playerid][pFactionRank],
			PlayerData[playerid][pFactionSkin],
			PlayerData[playerid][pInjured],
			PlayerData[playerid][pFactionBadge]
		);
		mysql_format(sqlcon, query, sizeof(query), "%s WHERE `pID`= '%d'",
			query,
			PlayerData[playerid][pID]
		);
		mysql_tquery(sqlcon, query);
	}
	return 1;
}

GetBankOwner(number) {
	new playerid = INVALID_PLAYER_ID;

	foreach(new i : Player) if(PlayerData[i][pBankNumber] == number) {
		playerid = i;
		break;
	}
	return playerid;
}

stock CreateRGBA(r, g, b, a)
	return ((a) & 0xFF) | (((b) & 0xFF) << 8) | (((g) & 0xFF) << 16) | ((r) << 24);

RGBAToARGB(rgba)
    return rgba >>> 8 | rgba << 24;

SwitchVehicleEngine(vehicleid,bool:engine_status){
	new engine,lights,alarm,doors,bonnet,boot,objective;
	GetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,bonnet,boot,objective);
	SetVehicleParamsEx(vehicleid,_:engine_status,lights,alarm,doors,bonnet,boot,objective);
}

GetDuration(time)
{
    new
        str[32];

    if (time < 0 || time == gettime()) {
        format(str, sizeof(str), "Never");
        return str;
    }
    else if (time < 60)
        format(str, sizeof(str), "%d seconds", time);

    else if (time >= 0 && time < 60)
        format(str, sizeof(str), "%d seconds", time);

    else if (time >= 60 && time < 3600)
        format(str, sizeof(str), (time >= 120) ? ("%d minutes") : ("%d minute"), time / 60);

    else if (time >= 3600 && time < 86400)
        format(str, sizeof(str), (time >= 7200) ? ("%d hours") : ("%d hour"), time / 3600);

    else if (time >= 86400 && time < 2592000)
        format(str, sizeof(str), (time >= 172800) ? ("%d days") : ("%d day"), time / 86400);

    else if (time >= 2592000 && time < 31536000)
        format(str, sizeof(str), (time >= 5184000) ? ("%d months") : ("%d month"), time / 2592000);

    else if (time >= 31536000)
        format(str, sizeof(str), (time >= 63072000) ? ("%d years") : ("%d year"), time / 31536000);

    strcat(str, " ago");

    return str;
}

GetInitials(const string[])
{
	new
	    ret[32],
		index = 0;

	for (new i = 0, l = strlen(string); i != l; i ++)
	{
	    if (('A' <= string[i] <= 'Z') && (i == 0 || string[i - 1] == ' '))
			ret[index++] = string[i];
	}
	return ret;
}

function LoadCharacterData(playerid)
{
	cache_get_value_name_int(0, "pID", PlayerData[playerid][pID]);
	cache_get_value_name(0, "Name", PlayerData[playerid][pName]);
	cache_get_value_name_float(0, "PosX", PlayerData[playerid][pPos][0]);
	cache_get_value_name_float(0, "PosY", PlayerData[playerid][pPos][1]);
	cache_get_value_name_float(0, "PosZ", PlayerData[playerid][pPos][2]);
	cache_get_value_name_float(0, "Health", PlayerData[playerid][pHealth]);
	cache_get_value_name_int(0, "Interior", PlayerData[playerid][pInterior]);
	cache_get_value_name_int(0, "World", PlayerData[playerid][pWorld]);
	cache_get_value_name(0, "Birthdate", PlayerData[playerid][pBirthdate]);
	cache_get_value_name(0, "Origin", PlayerData[playerid][pOrigin]);
	cache_get_value_name_int(0, "Gender", PlayerData[playerid][pGender]);
	cache_get_value_name_int(0, "Skin", PlayerData[playerid][pSkin]);
	cache_get_value_name(0, "UCP", PlayerData[playerid][pUCP]);
	cache_get_value_name_float(0, "Armour", PlayerData[playerid][pArmour]);
	cache_get_value_name_float(0, "Hunger", PlayerData[playerid][pHunger]);
	cache_get_value_name_float(0, "Thirst", PlayerData[playerid][pThirst]);
	cache_get_value_name(0, "Number", PlayerData[playerid][pPhoneNumber]);
	cache_get_value_name_int(0, "Battery", PlayerData[playerid][pBattery]);
	cache_get_value_name(0, "LastDeposit", PlayerData[playerid][pLastDeposit]);
	cache_get_value_name(0, "LastWithdraw", PlayerData[playerid][pLastWithdraw]);
	cache_get_value_name(0, "LastTransfer", PlayerData[playerid][pLastTransfer]);
	cache_get_value_name_int(0, "LastTransferAmount", PlayerData[playerid][pLastTransferAmount]);
	cache_get_value_name_int(0, "BankMoney", PlayerData[playerid][pBankMoney]);
	cache_get_value_name_int(0, "BankNumber", PlayerData[playerid][pBankNumber]);
	cache_get_value_name_int(0, "FactionID", PlayerData[playerid][pFactionID]);
	cache_get_value_name_int(0, "FactionRank", PlayerData[playerid][pFactionRank]);
	cache_get_value_name_int(0, "FactionSkin", PlayerData[playerid][pFactionSkin]);
	cache_get_value_name_int(0, "Injured", PlayerData[playerid][pInjured]);
	cache_get_value_name_int(0, "FactionBadge", PlayerData[playerid][pFactionBadge]);

	new temp_lastexit;

	cache_get_value_name_int(0, "LastExitTime", temp_lastexit);
	SetPVarInt(playerid, "LastExit", temp_lastexit);

    ShowSpawnMenu(playerid);


	CallLocalFunction(#OnCharacterLoaded, "d", playerid);
    return 1;
}

SetPlayerFace(playerid, Float:X, Float:Y)
{
	new Float:pX, Float:pY, Float:pZ, Float:ang;
	GetPlayerPos(playerid, pX, pY, pZ);

	if(Y > pY) ang = (-acos((X - pX) / floatsqroot((X - pX)*(X - pX) + (Y - pY)*(Y - pY))) - 90.0);
	else if(Y < pY && X < pX) ang = (acos((X - pX) / floatsqroot((X - pX)*(X - pX) + (Y - pY)*(Y - pY))) - 450.0);
	else if(Y < pY) ang = (acos((X - pX) / floatsqroot((X - pX)*(X - pX) + (Y - pY)*(Y - pY))) - 90.0);

	if(X > pX) ang = (floatabs(floatabs(ang) + 180.0));
	else ang = (floatabs(ang) - 180.0);

	SetPlayerFacingAngle(playerid, ang);
	return false;
}

FormatNumber(number, prefix[] = "$")
{
	static
		value[32],
		length;

	format(value, sizeof(value), "%d", (number < 0) ? (-number) : (number));

	if ((length = strlen(value)) > 3)
	{
		for (new i = length, l = 0; --i >= 0; l ++) {
		    if ((l > 0) && (l % 3 == 0)) strins(value, ",", i + 1);
		}
	}
	if (prefix[0] != 0)
	    strins(value, prefix, 0);

	if (number < 0)
		strins(value, "-", 0);

	return value;
}

ShowSpawnMenu(playerid) {

	new string[128];
	format(string, sizeof(string), "Posisi Terakhir %s\n"WHITE"Bandara", (CanLastExit(playerid)) ? (""GREEN"(tersedia)") : (""RED"(expired)"));
	return Dialog_Show(playerid, SelectSpawn, DIALOG_STYLE_LIST, "Pemilihan Spawn", string, "Select", "Exit");
}
Dialog:SelectSpawn(playerid, response, listitem, inputtext[]) {
	if(response) {
		if(listitem == 0) {
			if(!CanLastExit(playerid)) 
				return ErrorTD(playerid, "Posisi exit sudah expired!"), ShowSpawnMenu(playerid);

			SetSpawnInfo(playerid, NO_TEAM, PlayerData[playerid][pSkin], PlayerData[playerid][pPos][0],  PlayerData[playerid][pPos][1],  PlayerData[playerid][pPos][2], 0.0, 0, 0, 0, 0, 0, 0);
			TogglePlayerSpectating(playerid, false);
		}
		if(listitem == 1) {

			PlayerData[playerid][pInterior] = PlayerData[playerid][pWorld] = 0;
			
			SetSpawnInfo(playerid, NO_TEAM, PlayerData[playerid][pSkin], 1642.1681, -2333.3689, 13.5469, 0.0, 0, 0, 0, 0, 0, 0);
			TogglePlayerSpectating(playerid, false);
		}
	}
	return 1;
}
CanLastExit(playerid) {

	if(PlayerData[playerid][pAdmin])
		return 1;

	if(GetPVarInt(playerid, "LastExit") <= gettime())
		return 0;

	return 1;
}
function HashPlayerPassword(playerid, hashid)
{
	new
		query[256],
		hash[BCRYPT_HASH_LENGTH];

    bcrypt_get_hash(hash, sizeof(hash));

	GetPlayerName(playerid, UserData[playerid][userName], MAX_PLAYER_NAME);

	format(query,sizeof(query),"INSERT INTO `playerucp` (`UCP`, `Password`) VALUES ('%s', '%s')", UserData[playerid][userName], hash);
	mysql_tquery(sqlcon, query);

    SQL_CheckAccount(playerid);
	return 1;
}

RemoveUnderscore(text[])
{
    for (new i = 0, len = strlen(text); i < len; i ++)
		if(text[i] == '_') text[i] = ' ';

	new str[144];
	format(str, sizeof(str), "%s", text);
	return str;
}

RemoveSpace(text[])
{
    for (new i = 0, len = strlen(text); i < len; i ++)
		if(text[i] == ' ') text[i] = '_';

	new str[144];
	format(str, sizeof(str), "%s", text);
	return str;
}

ShowCharacterList(playerid)
{
	new name[256], count, sgstr[128];

	for (new i; i < MAX_CHARS; i ++) if(PlayerChar[playerid][i][0] != EOS)
	{
	    format(sgstr, sizeof(sgstr), "%s\n", PlayerChar[playerid][i]);
		strcat(name, sgstr);
		count++;
	}
	if(count < MAX_CHARS)
		strcat(name, "< Create Character >");

	Dialog_Show(playerid, DIALOG_CHARLIST, DIALOG_STYLE_LIST, "Character List", name, "Select", "Quit");
	return 1;
}

function LoadCharacter(playerid)
{
	for (new i = 0; i < MAX_CHARS; i ++)
	{
		PlayerChar[playerid][i][0] = EOS;
	}
	for (new i = 0; i < cache_num_rows(); i ++)
	{
		cache_get_value_name(i, "Name", PlayerChar[playerid][i]);
	}
  	ShowCharacterList(playerid);
  	return 1;
}

function OnPlayerPasswordChecked(playerid, bool:success)
{
	new str[256];
    format(str, sizeof(str), "Welcome Back to Roleplay Server!\n\nYour UCP: %s\nPlease insert your Password below to logged in:", GetName(playerid));
    
	if(!success)
        return Dialog_Show(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "UCP - Login", str, "Login", "Exit");

	new query[256];
	format(query, sizeof(query), "SELECT `Name` FROM `characters` WHERE `UCP` = '%s' LIMIT %d;", GetName(playerid), MAX_CHARS);
	mysql_tquery(sqlcon, query, "LoadCharacter", "d", playerid);
	return 1;
}

function InsertPlayerName(playerid, name[])
{
	new query[145];
	if(cache_num_rows())
	{
        Dialog_Show(playerid, DIALOG_MAKECHAR, DIALOG_STYLE_INPUT, "Create Character", "ERROR: This name is already used by the other player!\nInsert your new Character Name\n\nExample: Finn_Xanderz, Javier_Cooper etc.", "Create", "Back");
	}
	else
	{
		mysql_format(sqlcon,query,sizeof(query),"INSERT INTO `characters` (`Name`,`UCP`) VALUES('%e','%e')",name,GetName(playerid));
		mysql_tquery(sqlcon, query, "OnCharacterInsert", "ds", playerid, name);
	}
	return 1;
}

function OnCharacterInsert(playerid, name[]) {
	PlayerData[playerid][pID] = cache_insert_id();
	SetPlayerName(playerid, name);
	format(PlayerData[playerid][pName], MAX_PLAYER_NAME, name);

	Dialog_Show(playerid, DIALOG_BIRTHDATE, DIALOG_STYLE_INPUT, "Date of Birth", "Please enter your date of birth below (DD/MM/YYYY):", "Submit", "Cancel");
}
ResetPlayerVariable(playerid) {
	PlayerData[playerid][pHunger] = 100.0;
	PlayerData[playerid][pThirst] = 100.0;
	PlayerData[playerid][pHealth] = 100.0;
	PlayerData[playerid][pArmour] = 100.0;
	PlayerData[playerid][pBattery] = 100;
	PlayerData[playerid][pBankNumber] = 0;
	PlayerData[playerid][pInjured] = false;
	LoadingPosition[playerid] = false;
	CallLocalFunction(#OnPlayerResetVar, "d", playerid);
	return 1;
}

stock GetMonthName(Month)
{
	new MonthName[12];

	switch(Month)
	{
		case 1: MonthName = "Jan";
		case 2: MonthName = "Febr";
		case 3: MonthName = "Mar";
		case 4: MonthName = "Apr";
		case 5: MonthName = "May";
		case 6: MonthName = "Jun";
		case 7: MonthName = "Jul";
		case 8: MonthName = "Aug";
		case 9: MonthName = "Sept";
		case 10: MonthName = "Oct";
		case 11: MonthName = "Nov";
		case 12: MonthName = "Dec";
	}

	return MonthName;
}

Float:SetPlayerArmourEx(playerid, Float:armour) {

	if(armour <= 0.0) {
		armour = 0.0;
	}
	return PlayerData[playerid][pArmour] = armour;
}

Float:SetPlayerHealthEx(playerid, Float:health) {
	SetPlayerHealth(playerid, health);
	return PlayerData[playerid][pHealth] = health;
}


Float:GetPlayerArmourEx(playerid, &Float:Armour) {

	Armour = PlayerData[playerid][pArmour];
	return Armour;
}

cache_get_data(&rows, &fields)
{
	cache_get_row_count(rows);
	cache_get_field_count(fields);

}

cache_get_field_content(row, const field_name[], destination[], max_len = sizeof(destination))
{
    cache_get_value_name(row, field_name, destination, max_len);
}

Float:cache_get_field_float(row, const field_name[])
{
    new
        str[16];

    cache_get_field_content(row, field_name, str, sizeof(str));
    return floatstr(str);
}

cache_get_field_int(row, const field_name[])
{
    new val;
    cache_get_value_name_int(row, field_name, val);
    return val;
}

PlayerTextDrawDestroyEx(playerid, PlayerText:text) {
	if(text != PlayerText:INVALID_TEXT_DRAW) {
		PlayerTextDrawDestroy(playerid, text);

		text = PlayerText:INVALID_TEXT_DRAW;
		return 1;
	}
	return 0;
}

stock bool:isequal(const str1[], const str2[], bool:ignorecase = false) {
    new
        c1 = (str1[0] > 255) ? str1{0} : str1[0],
        c2 = (str2[0] > 255) ? str2{0} : str2[0]
    ;

    if (!c1 != !c2)
        return false;

    return !strcmp(str1, str2, ignorecase);
}

PlayerPlaySoundEx(playerid, sound, Float:range = 5.0)
{
    new
        Float:x,
        Float:y,
        Float:z;

    GetPlayerPos(playerid, x, y, z);

    foreach (new i : Player) if(IsPlayerInRangeOfPoint(i, range, x, y, z)) {
        PlayerPlaySound(i, sound, x, y, z);
    }
    return 1;
}


Float:GetWeaponDamage(playerid, weaponid, Float:x, Float:y, Float:z) {
	new Float:damage = 0.0, Float:dist = GetPlayerDistanceFromPoint(playerid, x, y, z);

	switch(weaponid) {
		case 22: damage = RandomFloat(8.25, 15.99);
		case 23: damage = RandomFloat(13.2, 18.99);
		case 24: damage = RandomFloat(30.99, 45.22);
		case 25: {
		    if (dist < 5.0)
				damage = RandomFloat(19.0, 27.0);

			else if (dist < 10.0)
				damage = RandomFloat(15.0,19.0);

			else if (dist < 15.0)
				damage = RandomFloat(12, 15.0);

			else if (dist < 20.0)
				damage = RandomFloat(6.0, 12.0);

			else if (dist < 30.0)
				damage = RandomFloat(2.0, 6.0);
		}
	}
	return damage;
}


GetVehicleModelByName(const name[])
{
	if(IsNumeric(name) && (strval(name) >= 400 && strval(name) <= 611))
		return strval(name);

	for (new i = 0; i < sizeof(g_arrVehicleNames); i ++)
	{
		if(strfind(g_arrVehicleNames[i], name, true) != -1)
		{
			return i + 400;
		}
	}
	return 0;
}

stock IsVehicleOnGround(vehicleid)
{
    if (!IsValidVehicle(vehicleid))
        return false;

    new Float:playerPos[3], Float:mapAndreasZ;

    GetVehiclePos(vehicleid, playerPos[0], playerPos[1], playerPos[2]);

    MapAndreas_FindZ_For2DCoord(playerPos[0], playerPos[1], mapAndreasZ);

    return (floatabs(playerPos[2] - mapAndreasZ) < 0.001);
}
ReturnVehicleModelName(model)
{
	new
	    name[32] = "None";

    if (model < 400 || model > 611)
	    return name;

	format(name, sizeof(name), g_arrVehicleNames[model - 400]);
	return name;
}

IsNumeric(const str[])
{
	for (new i = 0, l = strlen(str); i != l; i ++)
	{
	    if (i == 0 && str[0] == '-')
			continue;

	    else if (str[i] < '0' || str[i] > '9')
			return 0;
	}
	return 1;
}

RandomEx(min, max)
{
	new rand = random(max-min)+min;
	return rand;
}

function OnIntroCamera(playerid)
{

	switch(random(7))
	{
	    case 0: InterpolateCameraPos(playerid, 2608.8567,-2495.1262,66.1117, 621.4464,-973.0934,140.1878, 60000, CAMERA_MOVE);
		case 1: 
		{
			InterpolateCameraPos(playerid, -1661.901367, -14.027463, 6.758706, -1708.980102, 300.460449, 35.345272, 20000);
			InterpolateCameraLookAt(playerid, -1659.607055, -9.603525, 7.164509, -1713.582275, 300.629577, 33.398178, 15000);
		}
		case 2: {
			InterpolateCameraPos(playerid, -1881.850585, 971.852905, 73.548904, -1795.089477, 1394.321411, 30.082445, 20000);
			InterpolateCameraLookAt(playerid, -1884.813354, 968.006713, 72.353561, -1791.281372, 1391.242309, 29.073791, 15000);
		}
		case 3: {
			InterpolateCameraPos(playerid, 546.749267, -1408.705200, 20.525941, 1250.746582, -1393.686767, 19.419189, 30000);
			InterpolateCameraLookAt(playerid, 551.736450, -1408.684814, 20.169057, 1247.091064, -1390.297119, 19.035037, 15000);
		}
		case 4: {
			InterpolateCameraPos(playerid, 2550.974121, -1664.531738, 16.615615, 2186.334716, -1653.106933, 14.849622, 30000);
			InterpolateCameraLookAt(playerid, 2545.977050, -1664.520996, 16.447679, 2188.319091, -1657.573486, 15.904144, 15000);
		}
		case 5: {
			InterpolateCameraPos(playerid, 2287.160888, -918.219055, 25.588674, 2277.710693, -1746.899169, 43.992710, 30000);
			InterpolateCameraLookAt(playerid, 2287.145996, -923.217895, 25.694135, 2282.406005, -1746.867797, 42.274547, 15000);
		}
		case 6: {
			InterpolateCameraPos(playerid, -1801.528442, 1412.879150, 22.452032, -1472.461914, 950.851196, 47.155590, 20000);
			InterpolateCameraLookAt(playerid, -1798.010986, 1409.372802, 21.875198, -1476.977294, 949.634399, 45.386184, 15000);
		}
		default: InterpolateCameraPos(playerid, 1361.1880,-2338.8389,65.3276, 2666.7107,-1399.4921,108.5323, 60000, CAMERA_MOVE);
	}
	return true;
}

ApplyAnimationEx(playerid, animlib[], animname[], Float:fDelta, loop, lockx, locky, freeze, time, forcesync = 0)
{
	ApplyAnimation(playerid, animlib, animname, fDelta, loop, lockx, locky, freeze, time, forcesync);

	PlayerData[playerid][pLoopAnim] = true;

	return 1;
}

IsTwoHandWeapon(weaponid) {

	new is = false;
	switch(weaponid) {
		case 25, 27, 30, 31, 33, 34: is = true;
	}
	return is;
}

SetVehicleSpeed(vehicleid, Float:speed)
{
    if(!IsValidVehicle(vehicleid))
        return 1;

    new Float:vPos[4];
    
    GetVehicleVelocity(vehicleid,vPos[0],vPos[1],vPos[2]);
    GetVehicleZAngle(vehicleid, vPos[3]);
    speed = floatdiv(speed, 195.12);
    return SetVehicleVelocity(vehicleid, speed * floatsin(-vPos[3], degrees), speed * floatcos(-vPos[3], degrees), (vPos[2]-0.005));
}

IsVehicleDrivingBackwards(vehicleid) // By Joker
{
    new
        Float:Float[3]
    ;
    if(GetVehicleVelocity(vehicleid, Float[1], Float[2], Float[0]))
    {
        GetVehicleZAngle(vehicleid, Float[0]);
        if(Float[0] < 90)
        {
            if(Float[1] > 0 && Float[2] < 0) return true;
        }
        else if(Float[0] < 180)
        {
            if(Float[1] > 0 && Float[2] > 0) return true;
        }
        else if(Float[0] < 270)
        {
            if(Float[1] < 0 && Float[2] > 0) return true;
        }
        else if(Float[1] < 0 && Float[2] < 0) return true;
    }
    return false;
}

stock GetEngineStatus(vehicleid)
{
	static
	engine,
	lights,
	alarm,
	doors,
	bonnet,
	boot,
	objective;

	GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);

	if(engine != 1)
		return 0;

	return 1;
}

stock SwitchVehicleBoot(vehicleid,bool:boot_status){
	new engine,lights,alarm,doors,bonnet,boot,objective;
	GetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,bonnet,boot,objective);
	SetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,bonnet,_:boot_status,objective);
}

stock SwitchVehicleLight(vehicleid,bool:light_status){

	if(light_status) {
        new panels, doors, lights, tires;

        GetVehicleDamageStatus(vehicleid, panels, doors, lights, tires);
    	UpdateVehicleDamageStatus(vehicleid, panels, doors, 0, tires);
	}
	new engine,lights,alarm,doors,bonnet,boot,objective;
	GetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,bonnet,boot,objective);
	SetVehicleParamsEx(vehicleid,engine,_:light_status,alarm,doors,bonnet,boot,objective);
}

stock SwitchVehicleDoor(vehicleid,status)
{
	new engine,lights,alarm,doors,bonnet,boot,objective;
	GetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,bonnet,boot,objective);
	SetVehicleParamsEx(vehicleid,engine,lights,alarm,status,bonnet,boot,objective);
}

GetStrDate()
{
    static
        date[6], string[24];

	getdate(date[2], date[1], date[0]);
	gettime(date[3], date[4], date[5]);

	format(string, sizeof(string), "%d %s %d %02d:%02d", date[0],  GetMonthName(date[1]), date[2], date[3], date[4]);
    return string;
}

stock RemoveAlpha(color) {
    return (color & ~0xFF);
}

stock GetPosFaInFrontOfPlayer(playerid, Float:OffDist, &Float:Pxx, &Float:Pyy, &Float:Pzz, &Float:Fa, Float:rotoff = 0.0)
{
	if(!IsPlayerConnected(playerid)) return 0;
	new
	    Float:playerpos[3],
		Float:FacingA;
	GetPlayerPos(playerid, playerpos[0], playerpos[1], playerpos[2]);
	GetPlayerFacingAngle(playerid, FacingA);
	FacingA += rotoff;

	Pxx = (playerpos[0] + OffDist * floatsin(-FacingA,degrees));
	Pyy = (playerpos[1] + OffDist * floatcos(-FacingA,degrees));
	Pzz = playerpos[2];
	Fa = (FacingA > 180) ? (FacingA - 180) : (FacingA + 180);
	return 1;
}

SetPlayerPosEx(playerid, Float:x, Float:y, Float:z, interior, world) {

	if(LoadingPosition[playerid])
		return ErrorTD(playerid, "Harap tunggu!");

	Streamer_UpdateEx(playerid, x, y, z, world, interior, STREAMER_TYPE_OBJECT, 3000, 1);

	SetPlayerPos(playerid, x, y, z);
	SetPlayerInterior(playerid, interior);
	SetPlayerVirtualWorld(playerid, world);
	LoadingPosition[playerid] = true;
	
	SetTimerEx("internal_UpdatePos", 3000, false, "dfff", playerid, x, y, z);
	return 1;
}

function internal_UpdatePos(playerid, Float:x, Float:y, Float:z) {
	if(!IsPlayerInRangeOfPoint(playerid, 10.0, x, y, z)) {
		SetPlayerPos(playerid, x, y, z);
	}

	LoadingPosition[playerid] = false;

	return 1;
}

stock Streamer_UpdateItem(type, STREAMER_ALL_TAGS:id, Float:x, Float:y, Float:z, worldid, interiorid) {

	Streamer_SetItemPos(type, id, x, y, z);
	Streamer_SetIntData(type, id, E_STREAMER_WORLD_ID, worldid);
	Streamer_SetIntData(type,id, E_STREAMER_INTERIOR_ID, interiorid);
}
CMD:createcar(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 6)
		return NoAdmin(playerid);

    new
        model[32],
        color1,
        color2,
        otherid;

    if (sscanf(params, "us[32]I(-1)I(-1)", otherid, model, color1, color2))
        return Syntax(playerid, "/createcar [playerid] [model id/name] <color 1> <color 2>");
		
	if(otherid == INVALID_PLAYER_ID)
		return ErrorMsg(playerid, "You have specified invalid player.");

    if ((model[0] = GetVehicleModelByName(model)) == 0)
        return ErrorMsg(playerid, "Invalid model ID.");
		
	new Float:pos[4];
	GetPlayerPos(otherid, pos[0], pos[1], pos[2]);
	GetPlayerFacingAngle(otherid, pos[3]);
    new vehicleid = Vehicle_Create(model[0], pos[0], pos[1], pos[2], pos[3], VEHICLE_TYPE_PLAYER, PlayerData[otherid][pID], color1, color2);

    AdminMessage(X11_TOMATO, "AdmCmd | %s telah memberikan %s kepada %s.", PlayerData[playerid][pUCP], ReturnVehicleModelName(model[0]), GetName(otherid));
    PutPlayerInVehicle(otherid, vehicleid, 0);
    SwitchVehicleEngine(vehicleid,  true);
	return 1;
}
#include <a_samp>
#include <streamer>

new Area;
new Float:Array[] =
{
	-335.75, -1466.75,
	-333.02, -1559.64,
	-212.00, -1558.72,
	-212.30, -1466.76
};

public OnFilterScriptInit()
{
	Area = CreateDynamicPolygon(Array);
}

public OnPlayerEnterDynamicArea(playerid, areaid)
{
	if(areaid == Area)
	{
		SendClientMessage(playerid, -1, "Welcome to field_1 Area");
	}
}

public OnPlayerLeaveDynamicArea(playerid, areaid)
{
	if(areaid == Area)
	{
		SendClientMessage(playerid, -1, "Goodbye from field_1 Area");
	}
}

// Total Array Point: 4
// Output File: Polygon_Editor - field_1.pwn
// Exported Date: 16/3/2022 ~ 22:4:26
// Polygon Editor by Abyss (GvC.VN)
// Version 1.0

Streamer_GetFloatData(type, STREAMER_ALL_TAGS id, data, Float:result)
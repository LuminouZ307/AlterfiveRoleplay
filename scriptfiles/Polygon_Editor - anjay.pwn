#include <a_samp>
#include <streamer>

new Area;
new Float:Array[] =
{
	2426.92, -2070.59,
	2536.72, -2069.06,
	2536.31, -2141.87,
	2428.77, -2142.25
};

public OnFilterScriptInit()
{
	Area = CreateDynamicPolygon(Array);
}

public OnPlayerEnterDynamicArea(playerid, areaid)
{
	if(areaid == Area)
	{
		SendClientMessage(playerid, -1, "Welcome to anjay Area");
	}
}

public OnPlayerLeaveDynamicArea(playerid, areaid)
{
	if(areaid == Area)
	{
		SendClientMessage(playerid, -1, "Goodbye from anjay Area");
	}
}

// Total Array Point: 4
// Output File: Polygon_Editor - anjay.pwn
// Exported Date: 2/3/2022 ~ 19:49:48
// Polygon Editor by Abyss (GvC.VN)
// Version 1.0
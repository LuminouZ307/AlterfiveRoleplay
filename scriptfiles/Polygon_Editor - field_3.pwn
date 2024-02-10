#include <a_samp>
#include <streamer>

new Area;
new Float:Array[] =
{
	-341.95, -1263.09,
	-435.27, -1279.33,
	-466.67, -1287.29,
	-591.29, -1287.60,
	-591.36, -1409.88,
	-553.79, -1439.68,
	-529.54, -1422.89,
	-505.20, -1412.85,
	-442.65, -1406.02,
	-400.68, -1400.01,
	-372.04, -1379.44
};

public OnFilterScriptInit()
{
	Area = CreateDynamicPolygon(Array);
}

public OnPlayerEnterDynamicArea(playerid, areaid)
{
	if(areaid == Area)
	{
		SendClientMessage(playerid, -1, "Welcome to field_3 Area");
	}
}

public OnPlayerLeaveDynamicArea(playerid, areaid)
{
	if(areaid == Area)
	{
		SendClientMessage(playerid, -1, "Goodbye from field_3 Area");
	}
}

// Total Array Point: 11
// Output File: Polygon_Editor - field_3.pwn
// Exported Date: 16/3/2022 ~ 22:9:20
// Polygon Editor by Abyss (GvC.VN)
// Version 1.0
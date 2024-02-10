#include <a_samp>
#include <streamer>

new Area;
new Float:Array[] =
{
	-332.53, -1433.73,
	-325.90, -1313.56,
	-162.39, -1300.40,
	-159.39, -1416.17
};

public OnFilterScriptInit()
{
	Area = CreateDynamicPolygon(Array);
}

public OnPlayerEnterDynamicArea(playerid, areaid)
{
	if(areaid == Area)
	{
		SendClientMessage(playerid, -1, "Welcome to field_2 Area");
	}
}

public OnPlayerLeaveDynamicArea(playerid, areaid)
{
	if(areaid == Area)
	{
		SendClientMessage(playerid, -1, "Goodbye from field_2 Area");
	}
}



// Total Array Point: 4
// Output File: Polygon_Editor - field_2.pwn
// Exported Date: 16/3/2022 ~ 22:6:5
// Polygon Editor by Abyss (GvC.VN)
// Version 1.0
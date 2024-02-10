#include <a_samp>
#include <streamer>

new Area;
new Float:Array[] =
{
	-444.66, -202.62,
	-513.74, -211.06,
	-574.81, -195.23,
	-590.09, -154.89,
	-600.28, -55.98,
	-497.08, -37.28,
	-459.38, -37.09,
	-426.59, -38.27
};

public OnFilterScriptInit()
{
	Area = CreateDynamicPolygon(Array);
}

public OnPlayerEnterDynamicArea(playerid, areaid)
{
	if(areaid == Area)
	{
		SendClientMessage(playerid, -1, "Welcome to bear Area");
	}
}

public OnPlayerLeaveDynamicArea(playerid, areaid)
{
	if(areaid == Area)
	{
		SendClientMessage(playerid, -1, "Goodbye from bear Area");
	}
}

// Total Array Point: 8
// Output File: Polygon_Editor - bear.pwn
// Exported Date: 29/3/2022 ~ 19:43:12
// Polygon Editor by Abyss (GvC.VN)
// Version 1.0
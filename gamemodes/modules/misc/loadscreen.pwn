new PlayerText:LOADINGSCREEN[MAX_PLAYERS][3],
    Timer:LoadingScrCamTimer[MAX_PLAYERS] = {Timer:0, ...},
    Timer:LoadingScrTimer[MAX_PLAYERS] = {Timer:0, ...},
    Timer:LoadingScrTextTimer[MAX_PLAYERS] = {Timer:0, ...},
    LoadingScrValue[MAX_PLAYERS] = {0, ...};

#define MAX_LOADING_SCR_VALUE 1000

#include <YSI_Coding\y_hooks>


hook OnPlayerConnect(playerid) {
    LoadingScrValue[playerid] = 0;
    LoadingScrTimer[playerid] = Timer:0;
    LoadingScrCamTimer[playerid] = Timer:0;
}
timer OnLoadingScrCam[15000](playerid) {
    if(IsCharacterSpawned(playerid))
        return 1;
        
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
    }
    return 1;
}

timer OnLoadingScr[50](playerid) {

    if(IsCharacterSpawned(playerid))
        return 1;

    if(LoadingScrValue[playerid] < MAX_LOADING_SCR_VALUE) {

        new add_value;

        if(GetPlayerPing(playerid) <= 50) {
            add_value = RandomEx(350, 550);
        }
        else if(GetPlayerPing(playerid) <= 100) {
            add_value = RandomEx(250, 350);
        }
        else if(GetPlayerPing(playerid) <= 150) {
            add_value = RandomEx(150, 250);
        }
        else if(GetPlayerPing(playerid) <= 250) {
            add_value = RandomEx(100, 150);
        }
        else {
            add_value = RandomEx(50, 100);
        }
        LoadingScrValue[playerid] += add_value;
        PlayerTextDrawTextSize(playerid,LOADINGSCREEN[playerid][1], LoadingScrValue[playerid] * 319.000000 / MAX_LOADING_SCR_VALUE, 8.000000);
        PlayerTextDrawShow(playerid,LOADINGSCREEN[playerid][1]);
    }
    else {

        LoadingScrValue[playerid] = 0;

        stop LoadingScrTimer[playerid];

        stop LoadingScrCamTimer[playerid];

        stop LoadingScrTextTimer[playerid];

        for(new i = 0; i < 3; i++) {
            PlayerTextDrawHide(playerid, LOADINGSCREEN[playerid][i]);
        }

        DestroyLoadScrTD(playerid);

        CallLocalFunction("OnLoadingScrFinish", "d", playerid);
    }
    return 1;
}

timer OnLoadingScrText[7000](playerid) {
    if(IsCharacterSpawned(playerid))
        return 1;
        
    switch(random(5)) {
        case 0: {
            PlayerTextDrawSetString(playerid, LOADINGSCREEN[playerid][2], "LOADING:_SERVER_ASSETS");
        }
        case 1: {
            PlayerTextDrawSetString(playerid, LOADINGSCREEN[playerid][2], "LOADING:_CLIENT_ASSETS");
        }
        case 2: {
            PlayerTextDrawSetString(playerid, LOADINGSCREEN[playerid][2], "LOADING:_PREPARING_CONNECTION");
        }
        case 3: {
            PlayerTextDrawSetString(playerid, LOADINGSCREEN[playerid][2], "LOADING:_ESTABILISH_CONNECTION");
        }
        case 4: {
            PlayerTextDrawSetString(playerid, LOADINGSCREEN[playerid][2], "LOADING:_ACCOUNT_DATA");
        }
    }
    return 1;
}
StartLoadingScreen(playerid) {
    
    CreateLoadScrTD(playerid);

    for(new i = 0; i < 3; i++) {
        PlayerTextDrawShow(playerid, LOADINGSCREEN[playerid][i]);
    }

    if(LoadingScrTimer[playerid] != Timer:0) {
        stop LoadingScrTimer[playerid];
    }

    if(LoadingScrCamTimer[playerid] != Timer:0) {
        stop LoadingScrCamTimer[playerid];
    }

    if(LoadingScrTextTimer[playerid] != Timer:0) {
        stop LoadingScrTextTimer[playerid];
    }

    LoadingScrCamTimer[playerid] = repeat OnLoadingScrCam[15000](playerid);
    LoadingScrTextTimer[playerid] = repeat OnLoadingScrText[7000](playerid);

    LoadingScrTimer[playerid] = repeat OnLoadingScr[50](playerid);
    return 1;
}


CreateLoadScrTD(playerid) {
    LOADINGSCREEN[playerid][0] = CreatePlayerTextDraw(playerid, 159.000000, 403.000000, "ld_dual:white");
    PlayerTextDrawFont(playerid, LOADINGSCREEN[playerid][0], 4);
    PlayerTextDrawLetterSize(playerid, LOADINGSCREEN[playerid][0], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, LOADINGSCREEN[playerid][0], 321.000000, 10.000000);
    PlayerTextDrawSetOutline(playerid, LOADINGSCREEN[playerid][0], 1);
    PlayerTextDrawSetShadow(playerid, LOADINGSCREEN[playerid][0], 0);
    PlayerTextDrawAlignment(playerid, LOADINGSCREEN[playerid][0], 1);
    PlayerTextDrawColor(playerid, LOADINGSCREEN[playerid][0], -1);
    PlayerTextDrawBackgroundColor(playerid, LOADINGSCREEN[playerid][0], 255);
    PlayerTextDrawBoxColor(playerid, LOADINGSCREEN[playerid][0], 50);
    PlayerTextDrawUseBox(playerid, LOADINGSCREEN[playerid][0], 1);
    PlayerTextDrawSetProportional(playerid, LOADINGSCREEN[playerid][0], 1);
    PlayerTextDrawSetSelectable(playerid, LOADINGSCREEN[playerid][0], 0);

    LOADINGSCREEN[playerid][1] = CreatePlayerTextDraw(playerid, 160.000000, 404.000000, "ld_dual:white");
    PlayerTextDrawFont(playerid, LOADINGSCREEN[playerid][1], 4);
    PlayerTextDrawLetterSize(playerid, LOADINGSCREEN[playerid][1], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, LOADINGSCREEN[playerid][1], 319.000000, 8.000000);
    PlayerTextDrawSetOutline(playerid, LOADINGSCREEN[playerid][1], 1);
    PlayerTextDrawSetShadow(playerid, LOADINGSCREEN[playerid][1], 0);
    PlayerTextDrawAlignment(playerid, LOADINGSCREEN[playerid][1], 1);
    PlayerTextDrawColor(playerid, LOADINGSCREEN[playerid][1], 1296911871);
    PlayerTextDrawBackgroundColor(playerid, LOADINGSCREEN[playerid][1], 255);
    PlayerTextDrawBoxColor(playerid, LOADINGSCREEN[playerid][1], 50);
    PlayerTextDrawUseBox(playerid, LOADINGSCREEN[playerid][1], 1);
    PlayerTextDrawSetProportional(playerid, LOADINGSCREEN[playerid][1], 1);
    PlayerTextDrawSetSelectable(playerid, LOADINGSCREEN[playerid][1], 0);

    LOADINGSCREEN[playerid][2] = CreatePlayerTextDraw(playerid, 323.000000, 404.000000, "LOADING:_ASSIGN_TO_SERVER");
    PlayerTextDrawFont(playerid, LOADINGSCREEN[playerid][2], 1);
    PlayerTextDrawLetterSize(playerid, LOADINGSCREEN[playerid][2], 0.150000, 0.800000);
    PlayerTextDrawTextSize(playerid, LOADINGSCREEN[playerid][2], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, LOADINGSCREEN[playerid][2], 0);
    PlayerTextDrawSetShadow(playerid, LOADINGSCREEN[playerid][2], 0);
    PlayerTextDrawAlignment(playerid, LOADINGSCREEN[playerid][2], 2);
    PlayerTextDrawColor(playerid, LOADINGSCREEN[playerid][2], CreateRGBA(1, 1, 1, 255));
    PlayerTextDrawBackgroundColor(playerid, LOADINGSCREEN[playerid][2], 255);
    PlayerTextDrawBoxColor(playerid, LOADINGSCREEN[playerid][2], 50);
    PlayerTextDrawUseBox(playerid, LOADINGSCREEN[playerid][2], 0);
    PlayerTextDrawSetProportional(playerid, LOADINGSCREEN[playerid][2], 1);
    PlayerTextDrawSetSelectable(playerid, LOADINGSCREEN[playerid][2], 0);
}

DestroyLoadScrTD(playerid) {
    for(new i = 0; i < 3; i++) {
        PlayerTextDrawDestroy(playerid, LOADINGSCREEN[playerid][i]);
    }
}
ptask OnSecondUpdate[999](playerid) {
    CallLocalFunction(#OnPlayerSecondUpdate, "d", playerid);
    return 1;
}

ptask OnIdleCheck[10000](playerid)  {
    if(IsCharacterSpawned(playerid) && GetPlayerAnimationIndex(playerid) == 0) {
        Idleanimations(playerid);
    }
    return 1;
}
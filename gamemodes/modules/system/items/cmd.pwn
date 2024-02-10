CMD:setitem(playerid, params[])
{
    static
        userid,
        item[32],
        amount;

    if (PlayerData[playerid][pAdmin] < 5)
        return NoAdmin(playerid);

    if(sscanf(params, "uds[32]", userid, amount, item))
        return Syntax(playerid, "/setitem [playerid] [amount] [item name]");

    for (new i = 0; i < sizeof(g_ItemInfo); i ++) if(!strcmp(g_ItemInfo[i][e_item_name], RemoveSpace(item), true))
    {
        SetPlayerItem(userid, g_ItemInfo[i][e_item_name], amount);
        return ServerMsg(playerid,"You have set %s's~~\"%s\" to %d.", GetName(userid), RemoveSpace(item), amount);
    }
    ErrorMsg(playerid, "Invalid item name~n~(use /itemlist for a list).");
    return 1;
}

CMD:itemlist(playerid, params[])
{
    new string[2000];
    strcat(string, "Name\tMax per-stack\n");
    for (new i = 0; i < sizeof(g_ItemInfo); i ++) {
        strcat(string, va_return("%s\t%d\n",  RemoveUnderscore(g_ItemInfo[i][e_item_name]),  g_ItemInfo[i][e_item_stack]));
    }
    Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_TABLIST_HEADERS, "List of Items", string, "Select", "Cancel");
    return 1;
}
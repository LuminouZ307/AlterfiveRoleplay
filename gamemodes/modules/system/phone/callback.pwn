#include <YSI_Coding\y_hooks>

hook OnPlayerClickPlayerTD(playerid, PlayerText:playertextid) {
	if(playertextid == PHONE_TD[playerid][11]) {
		DestroyPhone(playerid);

		CancelSelectTextDraw(playerid);

        ClearAnimations(playerid, 1);
        RemovePlayerAttachedObject(playerid, ATTACH_INDEX_GENERAL);
	}
	if(playertextid == PHONEAPP_CALL[playerid]) {
		HidePhoneApp(playerid);

        ShowPhoneCall(playerid);

		format(temp_number_call[playerid], 15, "");

		PlayerTextDrawSetString(playerid, CALL_NUMBER[playerid], "");
		PlayerTextDrawSetString(playerid, CALL_TD[playerid][14], "Input_the_number");

		PlayerTextDrawColor(playerid, PHONE_WALLPAPER[playerid], CreateRGBA(230, 234, 236, 255));
		PlayerTextDrawShow(playerid, PHONE_WALLPAPER[playerid]);
	}

    if(playertextid == PHONEAPP_BANK[playerid]) {
        HidePhoneApp(playerid);
        ShowBank(playerid);

        PlayerTextDrawSetString(playerid, PHONEBANK_TD[playerid][10], va_return("Last_Withdraw~n~%s", RemoveSpace(PlayerData[playerid][pLastWithdraw])));
        PlayerTextDrawSetString(playerid, PHONEBANK_TD[playerid][11], va_return("Last_Deposit~n~%s", RemoveSpace(PlayerData[playerid][pLastDeposit])));
        PlayerTextDrawSetString(playerid, PHONEBANK_TD[playerid][5], va_return("%s", FormatNumber(PlayerData[playerid][pBankMoney])));

        new string[128];
        format(string, sizeof(string), "Recent_Transfer~n~%s~n~%s", FormatNumber(PlayerData[playerid][pLastTransferAmount]), PlayerData[playerid][pLastTransfer]);
        PlayerTextDrawSetString(playerid, PHONEBANK_TD[playerid][9],RemoveSpace(string));

        PlayerTextDrawColor(playerid, PHONE_WALLPAPER[playerid], CreateRGBA(117,89,227, 255));
        PlayerTextDrawShow(playerid, PHONE_WALLPAPER[playerid]);
    }
    if(playertextid == PHONEBANK_TF[playerid]) {
        Dialog_Show(playerid, TransferTarget, DIALOG_STYLE_INPUT, ""WHITE"Transfer >> Target", "\\c"WHITE"Transfer Saldo\n\nMasukkan "GREEN"Nomor Rekening "WHITE"milik orang yang..\ningin kamu transfer.", "Lanjut", "Tutup");
    }
	if(playertextid == CALL_RETURN[playerid]) {
        HidePhoneCall(playerid);
		ShowPhoneApp(playerid);
        
		PlayerTextDrawColor(playerid, PHONE_WALLPAPER[playerid], WALLPAPER_COLOR);
		PlayerTextDrawShow(playerid, PHONE_WALLPAPER[playerid]);
	}
    if(playertextid == PHONEBANK_RETURN[playerid]) {
        HideBank(playerid);
		ShowPhoneApp(playerid);
        
		PlayerTextDrawColor(playerid, PHONE_WALLPAPER[playerid], WALLPAPER_COLOR);
		PlayerTextDrawShow(playerid, PHONE_WALLPAPER[playerid]);
    }
    if(playertextid == CALL_0[playerid]) {
        if(strlen(temp_number_call[playerid]) < 12) {
            format(temp_number_call[playerid], 15, "%s%s", temp_number_call[playerid], "0");
            PlayerTextDrawSetString(playerid, CALL_NUMBER[playerid], temp_number_call[playerid]);
            PlayerPlaySound(playerid, 21000, 0.0, 0.0, 0.0);
        }
    }
    if(playertextid == CALL_1[playerid]) {
        if(strlen(temp_number_call[playerid]) < 12) {
            format(temp_number_call[playerid], 15, "%s%s", temp_number_call[playerid], "1");
            PlayerTextDrawSetString(playerid, CALL_NUMBER[playerid], temp_number_call[playerid]);
            PlayerPlaySound(playerid, 21000, 0.0, 0.0, 0.0);
        }
    }
    if(playertextid == CALL_2[playerid]) {
        if(strlen(temp_number_call[playerid]) < 12) {
            format(temp_number_call[playerid], 15, "%s%s", temp_number_call[playerid], "2");
            PlayerTextDrawSetString(playerid, CALL_NUMBER[playerid], temp_number_call[playerid]);
            PlayerPlaySound(playerid, 21000, 0.0, 0.0, 0.0);
        }
    }
    if(playertextid == CALL_3[playerid]) {
        if(strlen(temp_number_call[playerid]) < 12) {
            format(temp_number_call[playerid], 15, "%s%s", temp_number_call[playerid], "3");
            PlayerTextDrawSetString(playerid, CALL_NUMBER[playerid], temp_number_call[playerid]);
            PlayerPlaySound(playerid, 21000, 0.0, 0.0, 0.0);
        }
    }
    if(playertextid == CALL_4[playerid]) {
        if(strlen(temp_number_call[playerid]) < 12) {
            format(temp_number_call[playerid], 15, "%s%s", temp_number_call[playerid], "4");
            PlayerTextDrawSetString(playerid, CALL_NUMBER[playerid], temp_number_call[playerid]);
            PlayerPlaySound(playerid, 21000, 0.0, 0.0, 0.0);
        }
    }
    if(playertextid == CALL_5[playerid]) {
        if(strlen(temp_number_call[playerid]) < 12) {
            format(temp_number_call[playerid], 15, "%s%s", temp_number_call[playerid], "5");
            PlayerTextDrawSetString(playerid, CALL_NUMBER[playerid], temp_number_call[playerid]);
            PlayerPlaySound(playerid, 21000, 0.0, 0.0, 0.0);
        }
    }
    if(playertextid == CALL_6[playerid]) {
        if(strlen(temp_number_call[playerid]) < 12) {
            format(temp_number_call[playerid], 15, "%s%s", temp_number_call[playerid], "6");
            PlayerTextDrawSetString(playerid, CALL_NUMBER[playerid], temp_number_call[playerid]);
            PlayerPlaySound(playerid, 21000, 0.0, 0.0, 0.0);
        }
    }
    if(playertextid == CALL_7[playerid]) {
        if(strlen(temp_number_call[playerid]) < 12) {
            format(temp_number_call[playerid], 15, "%s%s", temp_number_call[playerid], "7");
            PlayerTextDrawSetString(playerid, CALL_NUMBER[playerid], temp_number_call[playerid]);
            PlayerPlaySound(playerid, 21000, 0.0, 0.0, 0.0);
        }
    }
    if(playertextid == CALL_8[playerid]) {
        if(strlen(temp_number_call[playerid]) < 12) {
            format(temp_number_call[playerid], 15, "%s%s", temp_number_call[playerid], "8");
            PlayerTextDrawSetString(playerid, CALL_NUMBER[playerid], temp_number_call[playerid]);
            PlayerPlaySound(playerid, 21000, 0.0, 0.0, 0.0);
        }
    }
    if(playertextid == CALL_9[playerid]) {
        if(strlen(temp_number_call[playerid]) < 12) {
            format(temp_number_call[playerid], 15, "%s%s", temp_number_call[playerid], "9");
            PlayerTextDrawSetString(playerid, CALL_NUMBER[playerid], temp_number_call[playerid]);
            PlayerPlaySound(playerid, 21000, 0.0, 0.0, 0.0);
        }
    }
    if(playertextid == CALL_DEL[playerid]) {
        if(strlen(temp_number_call[playerid])) {
            new len = strlen(temp_number_call[playerid]);

            temp_number_call[playerid][len - 1] = EOS;
            PlayerTextDrawSetString(playerid, CALL_NUMBER[playerid], temp_number_call[playerid]);
        }
    }
    if(playertextid == CALL_DELALL[playerid]) {
        if(strlen(temp_number_call[playerid])) {

            temp_number_call[playerid] = "";
            PlayerTextDrawSetString(playerid, CALL_NUMBER[playerid], temp_number_call[playerid]);
        }
    }
    if(playertextid == CALLING_DECLINE[playerid]) {
        if(callStatus[playerid] == CALL_STATUS_CALLING) {

            new targetid = GetPVarInt(playerid, "CallingID");


            HideCalling(playerid);
            HidePhoneCall(playerid);
            ShowPhoneApp(playerid);
            
            DestroyPhone(targetid);

            SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
            ApplyAnimation(playerid, "ROCKET", "IDLE_ROCKET", 4.1, 0, 0, 0, 1, 0, 1);
        }
        else if(callStatus[playerid] == CALL_STATUS_INCOMING) {

            new targetid = GetPVarInt(playerid, "CalledByID");

            InfoTD(targetid, "Panggilan anda ditolak!", 5);

            HideCalling(targetid);
            HidePhoneCall(targetid);
            ShowPhoneApp(targetid);

            DestroyPhone(playerid);
            CancelSelectTextDraw(playerid);


        }
        else {
            
            new targetid = GetPVarInt(playerid, "CallWithID");

            CallRemoteFunction("OnPlayerEndCall", "dd", playerid, targetid);

            HideCalling(playerid);
            HidePhoneCall(playerid);
            ShowPhoneApp(playerid);

            DestroyPhone(targetid);
            CancelSelectTextDraw(targetid);
            SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
            SetPlayerSpecialAction(targetid, SPECIAL_ACTION_NONE);
            ApplyAnimation(playerid, "ROCKET", "IDLE_ROCKET", 4.1, 0, 0, 0, 1, 0, 1);
            RemovePlayerAttachedObject(targetid, ATTACH_INDEX_GENERAL);

            callStatus[playerid] = callStatus[targetid] = 0;
        }
    }
    if(playertextid == CALLING_ACCEPT[playerid]) {
        if(callStatus[playerid] != CALL_STATUS_INCOMING) {
            return ErrorTD(playerid, "Tidak ada yang menelfonmu!");
        }


        new targetid;

        if(callStatus[playerid] == CALL_STATUS_INCOMING) {
            targetid = GetPVarInt(playerid, "CalledByID");
        }
        if(callStatus[playerid] == CALL_STATUS_CALLING) {
            targetid = GetPVarInt(playerid, "CallingID");
        }

        if(!IsPlayerConnected(targetid)) {
            ErrorTD(playerid, "Penelfon tidak lagi terkoneksi");

            HideCalling(playerid);
            HidePhoneCall(playerid);
            ShowPhoneApp(playerid);
            SetPlayerSpecialAction(targetid, SPECIAL_ACTION_NONE);
            ApplyAnimation(playerid, "ROCKET", "IDLE_ROCKET", 4.1, 0, 0, 0, 1, 0, 1);
            return 1;
        }
        SetPVarInt(playerid, "CallWithID", targetid);
        SetPVarInt(targetid, "CallWithID", playerid);

        CallRemoteFunction("OnPlayerCall", "dd", playerid, targetid);

        PlayerTextDrawSetString(playerid, CALLING_STATUS[playerid], "In_Call...");
        PlayerTextDrawSetString(targetid, CALLING_STATUS[targetid], "In_Call...");

        ShowCalled(playerid);
        ShowCalled(targetid);

        CancelSelectTextDraw(targetid);
        CancelSelectTextDraw(playerid);

        callStatus[playerid] = callStatus[targetid] = CALL_STATUS_INCALL;

        SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
        SetPlayerSpecialAction(targetid, SPECIAL_ACTION_USECELLPHONE);

        SetPlayerAttachedObject(targetid, ATTACH_INDEX_GENERAL, 18867, 6, 0.0909, -0.0030, 0.0000, 80.4001, 159.8000, 18.0000, 1.0000, 1.0000, 1.0000, 0xFFFFFFFF, 0xFFFFFFFF);
    }
    if(playertextid == CALL_NOW[playerid]) {
        new targetid = GetNumberOwner(temp_number_call[playerid]);

        if(targetid == INVALID_PLAYER_ID)
            return ErrorTD(playerid, "Nomor tidak tersedia atau~n~sedang offline.");

        HidePhoneCall(playerid);
        ShowCalling(playerid);

        PlayerTextDrawSetString(playerid, CALLING_NAME[playerid], va_return("Unknown~n~%s", temp_number_call[playerid]));
        PlayerTextDrawSetString(playerid, CALLING_STATUS[playerid], "CALLING...");
        callStatus[playerid] = CALL_STATUS_CALLING;
        SetPVarInt(playerid, "CallingID", targetid);
        PlayerTextDrawColor(playerid, PHONE_WALLPAPER[playerid], 707409663);
        PlayerTextDrawShow(playerid, PHONE_WALLPAPER[playerid]);

        temp_number_call[playerid] = "";



        if(PHONE_WALLPAPER[playerid] == PlayerText:INVALID_TEXT_DRAW) {
            CreatePhone(targetid);
        }
        ShowPhoneBase(targetid);
        ShowCalled(targetid);
        SetPVarInt(targetid, "CalledByID", playerid);
        PlayerTextDrawSetString(targetid, CALLING_NAME[playerid], va_return("Unknown~n~%s", PlayerData[playerid][pPhoneNumber]));
        PlayerTextDrawSetString(targetid, CALLING_STATUS[playerid], "INCOMING...");
        
        callStatus[targetid] = CALL_STATUS_INCOMING;
        PlayerTextDrawColor(targetid, PHONE_WALLPAPER[targetid], 707409663);
        PlayerTextDrawShow(targetid, PHONE_WALLPAPER[targetid]);
        
        
        PlayerPlaySoundEx(playerid, 3600, 5.0);
        CancelSelectTextDraw(playerid);
        InfoTD(playerid, "Kamu dapat bergerak ketika~n~menelfon, '/cursor' untuk~n~memunculkan cursor");

        PlayerPlaySoundEx(targetid, 23000, 10.0);
    }
    return Y_HOOKS_CONTINUE_RETURN_1;
}

hook OnPlayerSecondUpdate(playerid) {
    if(IsCharacterSpawned(playerid)) {
	    new string[256], date[6];

		getdate(date[2], date[1], date[0]);
		gettime(date[3], date[4], date[5]);

		format(string, sizeof(string), "%d %s %d %02d:%02d", date[0],  GetMonthName(date[1]), date[2], date[3], date[4]);
		PlayerTextDrawSetString(playerid, PHONE_DATE[playerid], RemoveSpace(string));
    }
}

Dialog:TransferTarget(playerid, response, listitem, inputtext[]) {
    if(response) {
        new targetid = GetBankOwner(strval(inputtext));

        if(targetid == INVALID_PLAYER_ID)
            return Dialog_Show(playerid, TransferTarget, DIALOG_STYLE_INPUT, ""WHITE"Transfer >> Target", "\\c"WHITE"Transfer Saldo\n\\c"RED"(target tidak ditemukan!)\n\n"WHITE"Masukkan "GREEN"Nomor Rekening "WHITE"milik orang yang..\ningin kamu transfer.", "Lanjut", "Tutup");

        SetPVarInt(playerid, "TargetID", targetid);
        Dialog_Show(playerid, TransferAmount, DIALOG_STYLE_INPUT, ""WHITE"Transfer >> Input Amount","\\c"WHITE"Transfer Saldo\n\nMasukkan "GREEN"Jumlah Uang "WHITE"yang akan kamu transfer.", "Transfer", "Batal");

    }
    return 1;
}

Dialog:TransferAmount(playerid, response, listitem, inputtext[]) {
    if(response) {

        new amount = strval(inputtext);

        new targetid = GetPVarInt(playerid, "TargetID");

        if(!IsPlayerConnected(targetid))
            return ErrorTD(playerid, "Target tidak lagi~n~terkoneksi"), Dialog_Show(playerid, TransferAmount, DIALOG_STYLE_INPUT, ""WHITE"Transfer >> Input Amount","\\c"WHITE"Transfer Saldo\n\nMasukkan "GREEN"Jumlah Uang "WHITE"yang akan kamu transfer.", "Transfer", "Batal");

        if(amount < 1 || amount > 100000)
            return ErrorTD(playerid, "Jumlah tidak valid!"), Dialog_Show(playerid, TransferAmount, DIALOG_STYLE_INPUT, ""WHITE"Transfer >> Input Amount","\\c"WHITE"Transfer Saldo\n\nMasukkan "GREEN"Jumlah Uang "WHITE"yang akan kamu transfer.", "Transfer", "Batal");

        if(PlayerData[playerid][pBankMoney] < amount) {
            return ErrorTD(playerid, "Uang pada rekening~n~kamu tidak cukup."), Dialog_Show(playerid, TransferAmount, DIALOG_STYLE_INPUT, ""WHITE"Transfer >> Input Amount","\\c"WHITE"Transfer Saldo\n\nMasukkan "GREEN"Jumlah Uang "WHITE"yang akan kamu transfer.", "Transfer", "Batal");
        }

        PlayerData[playerid][pBankMoney] -= amount;
        PlayerData[targetid][pBankMoney] += amount;

        format(PlayerData[playerid][pLastTransfer], 24, GetStrDate());
        PlayerData[playerid][pLastTransferAmount] = amount;

        Notify(targetid, "TRANSFER", va_return("Yeay! kamu mendapatkan~n~transfer sejumlah %s", FormatNumber(amount)), NOTIF_WARNING, 5);
        Notify(playerid, "TRANSFER", va_return("Kamu berhasil transfer~n~sejumlah~n~ %s", FormatNumber(amount)), NOTIF_WARNING, 5);

        PlayerTextDrawSetString(playerid, PHONEBANK_TD[playerid][5], va_return("%s", FormatNumber(PlayerData[playerid][pBankMoney])));

        new string[128];
        format(string, sizeof(string), "Recent_Transfer~n~%s~n~%s", FormatNumber(PlayerData[playerid][pLastTransferAmount]), PlayerData[playerid][pLastTransfer]);
        PlayerTextDrawSetString(playerid, PHONEBANK_TD[playerid][9],RemoveSpace(string));
    }
    return 1;
}
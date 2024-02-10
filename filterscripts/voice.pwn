#include <a_samp>
#include <sampvoice>
#include <izcmd>
#include <streamer>
#include <strlib>
#include <KeyListener>

#define FUNC::%0(%1)                forward %0(%1); public %0(%1)
#define MAX_RADIO_FREQ              9999

new SV_GSTREAM:SV_OnPhone[MAX_PLAYERS],
    IsAtPhone[MAX_PLAYERS],
    bool:radioStatus[MAX_PLAYERS];

#define PRESSED(%0) \
    (((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))

new SV_LSTREAM:localStream[MAX_PLAYERS] = SV_NULL;
new SV_GSTREAM:radioStream[MAX_RADIO_FREQ] = SV_NULL;

new voiceRange[MAX_PLAYERS];
new radioFreq[MAX_PLAYERS];
new callerID[MAX_PLAYERS];
new bool:radioMic[MAX_PLAYERS];
new PlayerText:VOICERANGE[MAX_PLAYERS][1];
new bool:hasRadio[MAX_PLAYERS] = {false, ...};

enum {
    VOICE_RANGE_NORMAL = 0,
    VOICE_RANGE_SHOUT,
    VOICE_RANGE_WHISPER
};

new voicerange_names[][] = {
    "~y~NORMAL",
    "~r~BERTERIAK",
    "~g~BERBISIK"
};
main() {

}


public OnFilterScriptInit() {
    printf("<<<<<<< [SAMP-VOICE] System initialized successfully !! >>>>>>>");

    for(new i = 0; i < MAX_RADIO_FREQ; i++)
    {
        radioStream[i] = SvCreateGStream(0xDB881AFF, "RadioStream");
    }   

    return 1;
}

public SV_VOID:OnPlayerActivationKeyPress(SV_UINT:playerid, SV_UINT:keyid) 
{
    if(keyid == 0x42 && radioFreq[playerid] != 0 && radioStatus[playerid] && !IsAtPhone[playerid] && radioMic[playerid] && hasRadio[playerid]) // Radio Stream
    {

        if(!IsPlayerInAnyVehicle(playerid))
           ApplyAnimation(playerid, "ped", "phone_talk", 4.1, 1, 1, 1, 1, 1, 1);

        if(!IsPlayerAttachedObjectSlotUsed(playerid, 9)) 
            SetPlayerAttachedObject(playerid, 9, 19942, 2, 0.0300, 0.1309, -0.1060, 118.8998, 19.0998, 164.2999);

        SvAttachSpeakerToStream(radioStream[radioFreq[playerid]], playerid);
        
        for(new i = 0; i < MAX_PLAYERS; i++) if(IsPlayerConnected(i) && radioFreq[i] == radioFreq[playerid] && radioStatus[i]) {
            PlayerPlaySound(i, 21001, 0.0, 0.0, 0.0);
        }
    }   
    if(keyid == 0x42 && IsAtPhone[playerid] && callerID[playerid] != INVALID_PLAYER_ID) { // Calling Stream

        
        new targetid = callerID[playerid];

        if(SV_OnPhone[playerid] != SV_NULL) {
            SvAttachSpeakerToStream(SV_OnPhone[playerid], playerid);
            SvAttachListenerToStream(SV_OnPhone[playerid], targetid);
        }
        if(SV_OnPhone[targetid] != SV_NULL) {
            SvAttachSpeakerToStream(SV_OnPhone[targetid], playerid);
            SvAttachListenerToStream(SV_OnPhone[targetid], targetid);
        }
    }
    if (keyid == 0x42 && localStream[playerid]) {
        SvAttachSpeakerToStream(localStream[playerid], playerid); // Local Stream
    }
}

public SV_VOID:OnPlayerActivationKeyRelease(SV_UINT:playerid, SV_UINT:keyid)
{
    if(keyid == 0x42 && radioFreq[playerid] != 0 && radioStatus[playerid] && !IsAtPhone[playerid] && radioMic[playerid] && hasRadio[playerid]) // Radio Stream
    {

        if(!IsPlayerInAnyVehicle(playerid))
          ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.0, 0, 0, 0, 0, 0, 1);

        SvDetachSpeakerFromStream(radioStream[radioFreq[playerid]], playerid);

        if(IsPlayerAttachedObjectSlotUsed(playerid, 9)) 
            RemovePlayerAttachedObject(playerid, 9);

        PlayerPlaySound(playerid, 21001, 0.0, 0.0, 0.0);
        
    }
    if(keyid == 0x42 && IsAtPhone[playerid] && callerID[playerid] != INVALID_PLAYER_ID) { // Calling Stream


        new targetid = callerID[playerid];

        if(SV_OnPhone[playerid] != SV_NULL) {
            SvDetachSpeakerFromStream(SV_OnPhone[playerid], playerid);
            SvDetachListenerFromStream(SV_OnPhone[playerid], targetid);
        }
        if(SV_OnPhone[targetid] != SV_NULL) {
            SvDetachSpeakerFromStream(SV_OnPhone[targetid], playerid);
            SvDetachListenerFromStream(SV_OnPhone[targetid], targetid);
        }
    }
    if (keyid == 0x42 && localStream[playerid]) {
        SvDetachSpeakerFromStream(localStream[playerid], playerid); // Local Stream
    }
}

FUNC::OnPlayerHaveRadio(playerid) {
    hasRadio[playerid] = true;
}

FUNC::OnPlayerRemoveRadio(playerid) {
    hasRadio[playerid] = false;
}
FUNC::OnToggleRadio(playerid) {

    if(!radioFreq[playerid]) {
        return GameTextForPlayer(playerid, "~r~Frekuensi belum diatur!", 3000, 6);
    }
    if(!radioStatus[playerid]) {
        radioStatus[playerid] = true;
        GameTextForPlayer(playerid, sprintf("Radio ~g~aktif~n~(freq: %d)", radioFreq[playerid]), 3000, 6);
        SvAttachListenerToStream(radioStream[radioFreq[playerid]], playerid);
    }
    else {
        radioStatus[playerid] = false;
        GameTextForPlayer(playerid, sprintf("Radio ~r~non-aktif~n~(freq: %d)", radioFreq[playerid]), 3000, 6);

        SvDetachListenerFromStream(radioStream[radioFreq[playerid]], playerid);
    }
    return 1;
}

FUNC::OnRadioFreqLoaded(playerid, freq) {
    radioFreq[playerid] = freq;
}

FUNC::OnPlayerSwitchFreq(playerid, freq) {

    if(freq) {
        SendClientMessage(playerid, 0xFF0000AA, sprintf("[i] {FFFFFF}Anda telah terhubung ke Frekuensi %d. (status mic: %s)", freq, (radioStatus[playerid]) ? ("aktif") : ("tidak aktif")));

        SvDetachSpeakerFromStream(radioStream[radioFreq[playerid]], playerid);
        SvDetachListenerFromStream(radioStream[radioFreq[playerid]], playerid);

        radioFreq[playerid] = freq;

        if(radioStatus[playerid])
            SvAttachListenerToStream(radioStream[freq], playerid);

        //PlayAudioStreamForPlayer(playerid, "https://k.top4top.io/m_256085cjl2.mp3");
    }
    return 1;
}
FUNC::OnPlayerCall(penelfonID, penerimaID) {

    SV_OnPhone[penelfonID] = SvCreateGStream(0xFFA200FF, "InPhone");
    IsAtPhone[penelfonID] = true;
    IsAtPhone[penerimaID] = true;
    callerID[penerimaID] = penelfonID;
    callerID[penelfonID] = penerimaID;
    return 1;
}

FUNC::OnPlayerEndCall(playerid, caller) {
    IsAtPhone[playerid] = false;
    IsAtPhone[caller] = false;
    callerID[playerid] = INVALID_PLAYER_ID;
    callerID[caller] = INVALID_PLAYER_ID;

    if(SV_OnPhone[caller] != SV_NULL) {
        SvDetachListenerFromStream(SV_OnPhone[caller], caller);
        SvDetachListenerFromStream(SV_OnPhone[caller], playerid);
        SvDeleteStream(SV_OnPhone[caller]);
        SV_OnPhone[caller] = SV_NULL;
    }
    if(SV_OnPhone[playerid] != SV_NULL){
        SvDetachListenerFromStream(SV_OnPhone[playerid], caller);
        SvDetachListenerFromStream(SV_OnPhone[playerid], playerid);
        SvDeleteStream(SV_OnPhone[playerid]);
        SV_OnPhone[playerid] = SV_NULL;
    }
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys) {
    if(PRESSED(KEY_WALK) && radioFreq[playerid] != 0 && hasRadio[playerid] && radioStatus[playerid]) {
        if(!radioMic[playerid]) {
            CallRemoteFunction("OnRadioActive", "d", playerid);
            radioMic[playerid] = true;
        }
        else {
            CallRemoteFunction("OnRadioInActive", "d", playerid);
            radioMic[playerid] = false;
        }
    }
    return 1;
}
public OnPlayerConnect(playerid)
{
    if(SvGetVersion(playerid) == SV_NULL) {
        SendClientMessage(playerid, -1, "{FF0000}[i] {FFFFFF}Kami tidak dapat menemukan plugin sampvoice yang terinstall.");
        SendClientMessage(playerid, -1, "{FF0000}[i] {FFFFFF}Silahkan pasang plugin sampvoice terlebih dahulu.");
    }
    else {

        if (SvHasMicro(playerid) == SV_FALSE)
        {
            SendClientMessage(playerid, -1, "{FF0000}[i] {FFFFFF}Mikrofon tidak terdeteksi pada perangkat anda.");
        }
        else {
            if ((localStream[playerid] = SvCreateDLStreamAtPlayer(20.0, SV_INFINITY, playerid)))
            {
                SendClientMessage(playerid, -1, "{FFFFFF}[i] Plugin sampvoice terdeteksi.");
                SvAddKey(playerid, 0x42);
            }
        }
    }


    radioStatus[playerid] = false; 
    IsAtPhone[playerid] = false;
    SV_OnPhone[playerid] = SV_NULL;
    voiceRange[playerid] = VOICE_RANGE_NORMAL;
    radioFreq[playerid] = 0;
    callerID[playerid] = INVALID_PLAYER_ID;
    radioMic[playerid] = false;
    hasRadio[playerid] = false;

    return 1;
}

public OnPlayerSpawn(playerid)
{
    VOICERANGE[playerid][0] = CreatePlayerTextDraw(playerid, 580.000, 434.000, "_");
    PlayerTextDrawLetterSize(playerid, VOICERANGE[playerid][0], 0.170, 1.199);
    PlayerTextDrawAlignment(playerid, VOICERANGE[playerid][0], 1);
    PlayerTextDrawColor(playerid, VOICERANGE[playerid][0], -1);
    PlayerTextDrawSetShadow(playerid, VOICERANGE[playerid][0], 0);
    PlayerTextDrawSetOutline(playerid, VOICERANGE[playerid][0], 0);
    PlayerTextDrawBackgroundColor(playerid, VOICERANGE[playerid][0], 150);
    PlayerTextDrawFont(playerid, VOICERANGE[playerid][0], 1);
    PlayerTextDrawSetProportional(playerid, VOICERANGE[playerid][0], 1);

    PlayerTextDrawSetString(playerid, VOICERANGE[playerid][0], sprintf("VOICE : %s", voicerange_names[voiceRange[playerid]]));
    PlayerTextDrawShow(playerid, VOICERANGE[playerid][0]);

    return 1;
}

FUNC::OnChangeVoiceRange(playerid) {
    if(voiceRange[playerid] == VOICE_RANGE_NORMAL) {
        voiceRange[playerid] = VOICE_RANGE_SHOUT;

        if(localStream[playerid] != SV_NULL) {
            SvDeleteStream(localStream[playerid]);
        }

        localStream[playerid] = SvCreateDLStreamAtPlayer(50.0, SV_INFINITY, playerid);
    }
    else if(voiceRange[playerid] == VOICE_RANGE_SHOUT) {
        voiceRange[playerid] = VOICE_RANGE_WHISPER;

        if(localStream[playerid] != SV_NULL) {
            SvDeleteStream(localStream[playerid]);
        }

        localStream[playerid] = SvCreateDLStreamAtPlayer(10.0, SV_INFINITY, playerid);
    }
    else if(voiceRange[playerid] == VOICE_RANGE_WHISPER) {
        voiceRange[playerid] = VOICE_RANGE_NORMAL;

        if(localStream[playerid] != SV_NULL) {
            SvDeleteStream(localStream[playerid]);
        }

        localStream[playerid] = SvCreateDLStreamAtPlayer(20.0, SV_INFINITY, playerid);
    }
    PlayerTextDrawSetString(playerid, VOICERANGE[playerid][0], sprintf("VOICE : %s", voicerange_names[voiceRange[playerid]]));
    return 1;
}
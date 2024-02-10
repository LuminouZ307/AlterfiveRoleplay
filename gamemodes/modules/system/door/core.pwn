#define MAX_DOOR    500

enum E_DOOR_DATA {
    doorID,
    bool:doorExists,
    Float:doorX,
    Float:doorY,
    Float:doorZ,
    Float:doorInteriorX,
    Float:doorInteriorY,
    Float:doorInteriorZ,
    doorWorldExt,
    doorInteriorExt,
    doorInteriorInt,
    doorWorldInt,
    doorCaption[64],
    STREAMER_TAG_PICKUP:doorPickup,
    Text3D:doorLabel 
};
new DoorData[MAX_DOOR][E_DOOR_DATA];
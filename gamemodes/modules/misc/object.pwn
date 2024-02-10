#include <YSI_Coding\y_hooks>

#define MAX_CUSTOM_OBJECT   1500

enum E_OBJECT_DATA {
    object_model,
    bool:object_exists,
    Float:object_pos[3],
    Float:object_rot[3],
};
new ObjectInfo[MAX_CUSTOM_OBJECT][E_OBJECT_DATA];

GetFreeCustomObjID() {
    new idx = -1;

    for(new i = 0; i < MAX_CUSTOM_OBJECT; i++) if(!ObjectInfo[i][object_exists]) {
        idx = i;
        break;
    }
    return idx;
}
CreateCustomObject() {
    new idx = -1;

    if((idx = GetFreeCustomObjID()) != -1) {
        ObjectInfo[idx][object_exists] = true;
        ObjectInfo[idx][object_model] = modelid;
        ObjectInfo[idx][object_pos][0] = x;
        ObjectInfo[idx][object_pos][1] = y;
        ObjectInfo[idx][object_pos][2] = z;
        ObjectInfo[idx][object_rot][0] = 0.0;
        ObjectInfo[idx][object_rot][1] = 0.0;
        ObjectInfo[idx][object_rot][2] = 0.0;

        SyncCustomObject(idx);
    }
    return idx;
}
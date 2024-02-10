#define MAX_SHOP    50

enum E_SHOP_DATA {
    bool:shopExists,
    shopName[64],
    shopID,
    Float:shopX,
    Float:shopY,
    Float:shopZ,
    Float:shopR,
    shopInterior,
    shopWorld,
    shopType,
    shopStatus,
    shopSkin,
    STREAMER_TAG_ACTOR:shopActor,
    Text3D:shopLabel,
    shopHoop
};
new ShopData[MAX_SHOP][E_SHOP_DATA];

enum {
    SHOP_TYPE_MARKET = 1,
    SHOP_TYPE_CLOTHES
};

enum {
    SHOP_STATUS_CLOSED,
    SHOP_STATUS_OPEN
};
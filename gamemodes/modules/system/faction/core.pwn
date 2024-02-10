#define MAX_FACTIONS 10

enum E_FACTION_DATA {
    factionID,
    bool:factionExists,
    factionName[64],
    Float:factionLocker[3],
    factionWorld,
    factionInterior,
    factionType,
    factionRanks,
    factionHoop,
    factionWeapon[15],
    factionAmmo[15],
    factionSkin[15],
    factionColor,
};
new FactionData[MAX_FACTIONS][E_FACTION_DATA],
    FactionRankName[MAX_FACTIONS][15][64];

enum {
    FACTION_POLICE = 1,
    FACTION_MEDIC,
    FACTION_NEWS,
    FACTION_GOV,
    FACTION_PEDAGANG,
    FACTION_FNG
};
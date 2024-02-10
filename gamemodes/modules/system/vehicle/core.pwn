enum E_VEHICLE_DATA {
    vehicleExists,
    vehicleID,
    Float:vehiclePos[4],
    vehicleWorld,
    vehicleInterior,
    vehicleExtraID,
    vehicleModel,
    vehicleColor[2],
    vehicleName[24],
    vehicleType,
    vehicleTimeout,
    vehicleState,
    Float:vehicleFuel,
    vehiclePlate[36],
    bool:vehicleLights,
    vehicleLock,
    Float:vehicleMaxSpeed,
};

new VehicleData[MAX_VEHICLES][E_VEHICLE_DATA];

enum {
    VEHICLE_TYPE_SERVER = 1,
    VEHICLE_TYPE_ADMIN,
    VEHICLE_TYPE_JOB,
    VEHICLE_TYPE_PLAYER
};

enum {
    VEHICLE_STATE_SPAWNED = 0,
    VEHICLE_STATE_INSURANCE,
    VEHICLE_STATE_GARAGE,
    VEHICLE_STATE_DEATH
};
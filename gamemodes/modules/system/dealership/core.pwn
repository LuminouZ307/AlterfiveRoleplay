#define MAX_DEALER_VEHICLE  500

enum E_DEALER_VEHICLE {
    dealer_vehicle_exists,
    dealer_vehicle_id,
    dealer_vehicle_model,
    dealer_vehicle_color[2],
    dealer_vehicle_name[24],
    dealer_vehicle_price,
    Float:dealer_vehicle_max_speed,
    dealer_vehicle_type
};
new DealerVehicle[MAX_DEALER_VEHICLE][E_DEALER_VEHICLE];

enum {
    DEALER_TYPE_MOTOR = 0,
    DEALER_TYPE_TUNER,
    DEALER_TYPE_SPORT,
    DEALER_TYPE_SEDAN,
    DEALER_TYPE_SUV,
    DEALER_TYPE_VAN,
    DEALER_TYPE_TRUCK,
    DEALER_TYPE_COMPACT
};

new g_DealerVehType[][] = {
    "Motor",
    "Tuner",
    "Sport",
    "Sedan",
    "SUV/Offroad",
    "Van",
    "Truck",
    "Compact"
};
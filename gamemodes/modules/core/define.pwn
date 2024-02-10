#define function%0(%1) forward %0(%1); public %0(%1)
	
#define MAX_CHARS 3

#define DATABASE_ADDRESS "localhost" //Change this to your Database Address
#define DATABASE_USERNAME "root" // Change this to your database username
#define DATABASE_PASSWORD "" //Change this to your database password
#define DATABASE_NAME "fivemproj" // Change this to your database name

#if !defined BCRYPT_HASH_LENGTH
	#define BCRYPT_HASH_LENGTH 250
#endif

#if !defined BCRYPT_COST
	#define BCRYPT_COST 12
#endif

#define IsCharacterSpawned(%0) PlayerData[playerid][pSpawned]

#define PRESSED(%0) (((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))

#define GetPlayerSQLID(%0) PlayerData[playerid][pID]
#define GetVehicleName(%0) ReturnVehicleModelName(GetVehicleModel(%0))

#define IsPlayerInjured(%0) PlayerData[%0][pInjured]
#define	NoAdmin(%0)			ErrorTD(playerid, "Kamu bukan admin!")


#define Syntax(%0,%1) \
	va_SendClientMessage(%0, X11_GREY, "Syntax | "%1)

#define AdminMsg(%0,%1) \
	va_SendClientMessage(%0, X11_TOMATO, "Admin | "WHITE""%1)

#define ErrorMsg(%0,%1) \
	va_SendClientMessage(%0, X11_GREY, "Error | "%1)


#define ServerMsg(%0,%1) \
	va_SendClientMessage(%0, X11_LIGHTBLUE, "Server | "WHITE""%1)

#define GetUCP(%0) PlayerData[%0][pUCP]


#define SERVER_VERSION	"AltRP:Unstable"
#define SERVER_HOSTNAME	"Alterfive Roleplay"
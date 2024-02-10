#include <YSI_Coding\y_hooks>

hook OnGameModeInitEx() {
    mysql_tquery(sqlcon, "SELECT * FROM `shop`", "OnLoadShop");
}
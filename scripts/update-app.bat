@echo off
set STEAM_CMD_LOC="E:\apps\steamcmd"
set STEAM_USER="anonymous"
set STEAM_PASS=""

set INSTALL_DIR="..\my-app"
set APP_ID="<APP ID>"

cd "%STEAM_CMD_LOC%"
start "" steamcmd.exe +force_install_dir "%INSTALL_DIR%" +login "%STEAM_USERNAME%" "%STEAM_PASSWORD%" +app_update %APP_ID% validate +quit
#!/bin/bash
STEAM_CMD_LOC=../steamcmd/
STEAM_USER="anonymous"
STEAM_PASS=""

INSTALL_DIR=../my-app

APP_ID=<APP ID>

$STEAM_CMD_LOC/steamcmd.sh +force_install_dir $INSTALL_DIR +login "$STEAM_USER" "$STEAM_PASS" +app_update $APP_ID validate +quit
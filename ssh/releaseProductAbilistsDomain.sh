#!/bin/sh
# This is the shell script to release for something.
APP_NAME=tomcat
TOMCAT_PATH="/etc/init.d/"
APP_PATH="~/git/abilists_client"
WAR_FILE="ROOT.war"
USER_ID=joonk

echo ${APP_PATH}

# Build with gradle
cd ~/git/abilists_client
gradle -Pprofile=product deployWar
echo "Finished the builds."

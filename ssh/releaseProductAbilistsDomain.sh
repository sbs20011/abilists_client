#!/bin/sh
# This is the shell script to release for something.
APP_NAME=tomcat
TOMCAT_PATH="/etc/init.d/"
APP_PATH="~/git/abilists_apps"
WAR_FILE="ROOT.war"
USER_ID=joonk

echo ${APP_PATH}

# Build with gradle
cd ~/git/abilists_apps
gradle -Pprofile=product deployWar
echo "Finished the builds."

if [ -d "${APP_PATH}" ]; then
	echo "If the path exists."
	/bin/rm -rf ${APP_PATH}/webapps/ROOT.war
else
	echo "failure build"
	exit 1
fi

printf "%-50s" "product $NAME..."
${TOMCAT_PATH}${APP_NAME} start
RETVAL=$?
if [ $RETVAL -eq 0 ]; then
	echo "successful start"
else
	echo "failure starting"
	exit 1
fi

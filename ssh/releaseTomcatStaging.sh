#!/bin/sh
# This is the shell script to release for something.
APP_NAME=tomcat
TOMCAT_PATH="/etc/init.d/"
APP_PATH="/usr/local/tomcat/webapps/"
APP_PATH_ROOT="${APP_PATH}ROOT"

APP_PATH_TO_WAR="${APP_PATH}ROOT.war"
APP_PATH_FROM_WAR="/home/joonk/git/abilists_client/build/libs/ROOT.war"

USER_ID=joonk

case "$1" in
start)

	# Check the process count
	APP_CNT=`/bin/ps -ef | /bin/grep "tomcat" | /bin/grep -v "grep\|init.d" -c`
	if [ ${APP_CNT} -gt 0 ]; then
        echo "Tomcat is already runing..."
        echo "Tomcat is stopping forcely"
		${TOMCAT_PATH}${APP_NAME} stop
		echo "Tomcat stopped"
        exit 1
	fi

	# Build with gradle
	cd ~/git/abilists_client
	gradle -Pprofile=staging deployWar
	echo "Finished the builds."
  
  if [ -d "${APP_PATH_ROOT}" ]; then
		echo "If the path exists."
		/bin/rm -rf ${APP_PATH_ROOT}
		/bin/rm ${APP_PATH_TO_WAR}
  fi
	echo "Moved a war file"
	/bin/mv ${APP_PATH_FROM_WAR} ${APP_PATH}

	printf "%-50s" "Starting $NAME..."
	${TOMCAT_PATH}${APP_NAME} start
	RETVAL=$?
	if [ $RETVAL -eq 0 ]; then
		echo "successful start"
	else
		echo "failure starting"
		exit 1
	fi
;;

stop)
    printf "%-50s" "Starting $NAME..."

    ${TOMCAT_PATH}${APP_NAME} stop
    RETVAL=$?
    if [ $RETVAL -eq 0 ]; then
            echo "successful stop"
    else
            echo "failure stopping"
    fi
;;

*)
	echo "Usage: $0 {start|stop}"
	exit 1
esac
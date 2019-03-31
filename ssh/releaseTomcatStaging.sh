#!/bin/sh
# This is the shell script to release for something.
APP_NAME=tomcat
TOMCAT_PATH="/etc/init.d/"
APP_PATH="/usr/local/tomcat/webapps/"
APP_PATH_ROOT="${APP_PATH}ROOT"

APP_PATH_TO_WAR="${APP_PATH}ROOT.war"
APP_PATH_FROM_WAR="/home/joonk/git/abilists_client/build/libs/ROOT.war"

USER_ID=joonk

build_fuc () { 
    printf "Starting base_bean."
    cd ~/git/base_bean
    gradle clean
    gradle buildJar
    
    printf "Starting base_core."
    cd ~/git/base_core
    gradle buildJar
    
    printf "Starting abilists_bean."
    cd ~/git/abilists_bean
    gradle buildJar

    printf "Starting abilists_core."
    cd ~/git/abilists_core
    gradle buildJar

    printf "Starting abilists_apps."
    cd ~/git/abilists_apps
    gradle buildJar
    
    printf "Starting abilists_client."
    cd ~/git/abilists_client
    gradle clean
    gradle -Pprofile=product deployWar
}

start_fuc () { 
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
	gradle -Pprofile=product deployWar
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
}

case "$1" in
build)
    build_fuc
;;

start)
	start_fuc
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

all)
	build_fuc
	start_fuc
;;

*)
	echo "Usage: $0 {build|start|stop}"
	exit 1
esac
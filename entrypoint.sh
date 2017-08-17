#!/bin/bash

if [ "${1:0:1}" ]; then

    set -- "$@"

    case "$1" in
        "--help")
	
	    cat <<EOF
Usage: command [option]

commands:
    up		- start docker compose up
    stop	- run docker compose stop
    down	- run docker compose down
    ...		- other command in bash shell debian 8.8
options:
    up|stop|down	- use option of docker-compose. Ext -d

volume:
    -v "your/volume:/app" - map volume to /app to run docker-compose in

EOF
        ;;

        "up"|"stop"|"down"|"version")
	    PWD=$( pwd )
	    echo "run docker-compose in $PWD"
	    cd /app && /usr/local/bin/docker-compose $@
        ;;

	*) exec "$@" ;;
    esac

else
    echo "use --help for more infomations."
fi

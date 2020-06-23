#!/bin/bash

# Stop and restore groups of docker containers.
# With one argument stop1/restore1/stop2/restore2


###################
# ALL CONTAINERS: #
#   vue_nginx1    #
#   vue_nginx2    #
#   django1       #
#   django2       #
#   pxc_haproxy1  #
#   pxc_haproxy2  #
#   pxc_master    #
#   pxc_slave1    #
#   pxc_slave2    #
###################


# CONSTANTS
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"


# FUNCTIONS
function stop_containers {
    pushd "${DIR}"
        for var in "$@"
        do
            docker-compose rm -f -s -v "$var"
        done
    popd
}


function start_containers {
    pushd "${DIR}"
        for var in "$@"
        do
            docker-compose up -d "$var"
        done
    popd
}


# MAIN
case "$1" in
  stop1)
    stop_containers vue_nginx1 django1 pxc_haproxy1 pxc_slave1
    ;;
  restore1)
    start_containers vue_nginx1 django1 pxc_haproxy1 pxc_slave1
    ;;
  stop2)
    stop_containers vue_nginx2 django2 pxc_haproxy2 pxc_slave2
    ;;
  restore2)
    start_containers vue_nginx2 django2 pxc_haproxy2 pxc_slave2
    ;;
  *)
    echo "BAD INPUT" 1>&2
    ;;
esac
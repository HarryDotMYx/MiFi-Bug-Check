#!/bin/sh
# Copyright (c) 2020 Qualcomm Technologies, Inc.
# All Rights Reserved.
# Confidential and Proprietary - Qualcomm Technologies, Inc.

INTERFACE_PATH="/sys/class/net/"
TIMEOUT=120 #Timeout in seconds for interface to come up

#check if interface is up
function is_up() {
    local path
    local count=0

    #see if path exists
    path="$INTERFACE_PATH$1"
    if [ -d $path ] ; then
	echo "found $1 interface"
	return 0;
    fi;
    return 1;
}

# create interface
function create_iface() {
    ifconfig $1 $2 "up"
    # Check if the interface is up, if not sleep 1sec and recheck
    timeout=0
    while [ $timeout -lt $TIMEOUT ]; do
	if is_up $1; then
	    echo "Interface $1 is up"
	    break
	fi;
	timeout=$((timeout+1))
	sleep 1
    done
    if [ $timeout -ge $TIMEOUT ]; then
	echo "Interface $1 is not up"
	exit 1
    fi;
}

function add_static_route() {
    echo "Adding static neighbor route for $1 with $2 as lladdr"
    ip neigh add $1 lladdr $2 nud permanent dev $3
}

# Utility to display usage of the script
function help() {
    echo "Usage: "$1" <IFACE_NAME> <IFACE_IP>"
    echo "Usage: "$1" <IFACE_NAME> <IFACE_IP> <NBR_IP> <NBR_LINK_LOCAL_ADDRESS>"
}

# main
if [ $# -gt 0 ]; then
    if [ $1 = "--help" ]; then
	help $0
    else
	if [ $# == 2 ]; then
	    echo "Configuring interface $1 with ip $2"
	    create_iface $1 $2
	elif [ $# == 4 ]; then
	    echo "Configuring interface $1 with ip $2, nbr ip as $3 with link local address as $4"
	    create_iface $1 $2
	    add_static_route $3 $4 $1
	else
	    echo "Argument mismatch"
	    help $0
	fi
    fi
else
    help $0
fi

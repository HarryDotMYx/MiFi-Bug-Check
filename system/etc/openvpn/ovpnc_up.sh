#!/bin/sh
nvram set_temp ppp_ifname $1
nvram set_temp ppp_remote_ip $5
nvram set_temp ovpnc_status "1"

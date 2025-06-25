#!/bin/sh
# Copyright (c) 2019 Qualcomm Technologies, Inc.
# All Rights Reserved.
# Confidential and Proprietary - Qualcomm Technologies, Inc.
KMSG_PATH=/dev/kmsg
	case "$1" in
	1)
		sync
		sync
		sync
		sys_reboot recovery
		echo "Rebooted successfully into recovery" > $KMSG_PATH
	;;
	2)
		mkdir /cache/recovery
		chmod 755 /cache/recovery
	;;
	3)
		echo "--update_package=/data/mbimd/update.zip" > /cache/recovery/command
	;;
	4)
		echo "RNR:: Rebooting system during PLDR" > $KMSG_PATH
		sys_reboot
	;;
	5)
		echo "RNR: triggering MSSR for FLDR" > $KMSG_PATH
		echo 1 > /sys/kernel/boot_adsp/ssr
	;;
	6)
		echo "Changing the freq scaling profile to reduce overall update time" > $KMSG_PATH
		echo performance > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
	;;
	*)
		echo "Invalid argument no default action" > $KMSG_PATH
	;;
	esac
exit 0
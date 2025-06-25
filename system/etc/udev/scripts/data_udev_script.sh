#!/bin/sh
#-----------------------------------------------------------------------------
#  Copyright (c) 2019-2020 Qualcomm Technologies, Inc.
#  All Rights Reserved.
#  Confidential and Proprietary - Qualcomm Technologies, Inc.
#-----------------------------------------------------------------------------

DUMP_TO_KMSG=/dev/kmsg
    case "$1" in
    ttyGS0)
        chown -h radio.radio /dev/ttyGS0
    ;;
    ttyGS1)
        chown -h radio.radio /dev/ttyGS1
    ;;
    ttyHS1)
        chown -h radio.radio /dev/ttyHS1
    ;;
    smd7)
        chown -h radio.radio /dev/smd7
    ;;
    smd8)
        chown -h radio.radio /dev/smd8
        chmod 664 /dev/smd8
    ;;
    smd9)
        chown -h radio.radio /dev/smd9
    ;;
    smd10)
        chown -h radio.radio /dev/smd10
    ;;
    dpl_ctrl)
        chown -h radio.radio /dev/dpl_ctrl
    ;;
    dpl_ctrl10)
    chown -h radio.radio /dev/dpl_ctrl10
    ;;
    mhi_pipe_14)
        chown -h radio.radio /dev/mhi_pipe_14
    ;;
    smdcntl8)
        chown -h radio.radio /dev/smdcntl8
    ;;
    rmnet_ctrl)
        chown -h radio.radio /dev/rmnet_ctrl
    ;;
    mhi_pipe_16)
        chown -h radio.radio /dev/mhi_pipe_16
    ;;
    mhi_ctrl)
        chown -h radio.radio /dev/mhi_ctrl
    ;;
    bridge)
        chown -h radio.radio /sys/devices/virtual/net/bridge*/bridge/multicast_querier
    ;;
    mhi_pipe_14)
        chown -h radio.radio /dev/mhi_pipe_14
    ;;
    gsb)
        chown -h radio.radio /dev/gsb
    ;;
    rndis)
        echo "\n add rndis to bridge start" > $DUMP_TO_KMSG
        ifconfig rndis0 up
        brctl addif bridge0 rndis0
        echo "\n add rndis to bridge stop" > $DUMP_TO_KMSG
    ;;
    mtd)
        chown -h radio.radio /dev/$2
        ln -sf /dev/$2 /tmp/data/early_eth_partition_file
        chcon system_u:object_r:datamtd_device_t:s0 /dev/$2
        echo "\n changing permission on radio:radio /dev/$2 (user:group)" > $DUMP_TO_KMSG
    ;;
    switch_ssdk)
        chown -h root.radio /dev/switch_ssdk
        chmod 660 /dev/switch_ssdk
    ;;
    embms_tm_device)
        chown -h radio.radio /dev/embms_tm_device
        chmod 660 /dev/embms_tm_device
    ;;
    *)
        echo " qcmap: Invalid option. option: $1 " > $DUMP_TO_KMSG
    ;;

    esac
exit 0

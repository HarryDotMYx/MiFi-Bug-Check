#!/bin/sh
#-----------------------------------------------------------------------------
#  Copyright (c) 2019 Qualcomm Technologies, Inc.
#  All Rights Reserved.
#  Confidential and Proprietary - Qualcomm Technologies, Inc.
#-----------------------------------------------------------------------------
        case "$1" in
                ipa)
                        chmod 660 /dev/ipa
                        chown -h radio.radio /dev/ipa
                ;;
                wwan_ioctl)
                        chown -h radio.radio /dev/wwan_ioctl
                ;;
                odu_ipa_bridge)
                        chown -h radio.radio /dev/odu_ipa_bridge
                ;;
                ipaNatTable)
                        chown -h radio.radio /dev/ipaNatTable
                ;;
                ipaIpv6CTTable)
                        chown -h radio.radio /dev/ipaIpv6CTTable
                ;;
                diag)
                        chgrp diag /dev/diag
                        chmod 660 /dev/diag
                ;;
                ipa_adpl)
                        chmod 666 /dev/ipa_adpl
                        chown -h radio.radio /dev/ipa_adpl
                ;;
                ipa_odl_ctl)
                        chmod 666 /dev/ipa_odl_ctl
                        chown -h radio.radio /dev/ipa_odl_ctl
                ;;
        esac
exit 0

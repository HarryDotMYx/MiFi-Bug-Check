#!/bin/sh

# Copyright (c) 2019, The Linux Foundation. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above
#       copyright notice, this list of conditions and the following
#       disclaimer in the documentation and/or other materials provided
#       with the distribution.
#     * Neither the name of The Linux Foundation nor the names of its
#       contributors may be used to endorse or promote products derived
#       from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
# WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
# ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
# BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
# BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
# IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

set -e

BLUETOOTH_POWER_KERNEL_MODULE_PATH=/usr/lib/modules/$(uname -r)/kernel/drivers/bluetooth/bluetooth-power.ko
BLUETOOTH_POWER_EXTRA_MODULE_PATH=/usr/lib/modules/$(uname -r)/extra/bluetooth-power.ko
case "$1" in
  start)
  if [ -e /sys/bus/platform/drivers/bt_power ]; then
	echo "bluetooth-power has already resided in kernel."
  elif [ -e ${BLUETOOTH_POWER_EXTRA_MODULE_PATH} ]; then
	insmod ${BLUETOOTH_POWER_EXTRA_MODULE_PATH}
	echo "insmod extra bluetooth-power.ko Done"
  elif [ -e ${BLUETOOTH_POWER_KERNEL_MODULE_PATH} ]; then
	insmod ${BLUETOOTH_POWER_KERNEL_MODULE_PATH}
	echo "insmod kernel bluetooth-power.ko Done"
  else
    echo "exit due to no bluetooth-power.ko"
  fi
  exit 0
  ;;

  stop|restart|reload|force-reload)
  echo "Action '$1' is meaningless for $0"
  exit 0
  ;;

  *)
  echo "Usage: $0 start"
  exit 1
esac

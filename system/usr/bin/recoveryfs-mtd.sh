#Copyright (c) 2019-2020 Qualcomm Technologies, Inc.
#All Rights Reserved.
#Confidential and Proprietary - Qualcomm Technologies, Inc.

#!/bin/sh
set -e
mtd_file=/proc/mtd
mtd_block_number=`cat $mtd_file | grep -i "recoveryfs" | sed 's/mtd//' | awk -F ':' '{print $1}'`
ln -sf /dev/mtd$mtd_block_number /tmp/recoveryfs-mtd
if [ -x /sbin/restorecon ]; then
    /sbin/restorecon /tmp/recoveryfs-mtd
fi
chmod 0660 /dev/ubi_ctrl
chown root:ubi /dev/ubi_ctrl
i=0
found=1;
while [ $found -eq 1 ]
do
  if [ -d /sys/class/ubi/ubi$i ]; then
    chown -R root:ubi /sys/class/ubi/ubi$i/scrub_all
    chmod 0664 /sys/class/ubi/ubi$i/scrub_all
    i=$(( $i + 1 ))
  else
    found=0
  fi
done

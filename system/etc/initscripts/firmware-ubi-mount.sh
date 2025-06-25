#!/bin/sh
# Copyright (c) 2018, The Linux Foundation. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
#   * Redistributions of source code must retain the above copyright
#     notice, this list of conditions and the following disclaimer.
#   * Redistributions in binary form must reproduce the above
#     copyright notice, this list of conditions and the following
#     disclaimer in the documentation and/or other materials provided
#     with the distribution.
#   * Neither the name of The Linux Foundation nor the names of its
#     contributors may be used to endorse or promote products derived
#     from this software without specific prior written permission.
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

FindAndMountUBI () {
   partition=$1
   dir=$2
   mtd_file=/proc/mtd

   mtd_block_number=`cat $mtd_file | grep -i $partition | sed 's/^mtd//' | awk -F ':' '{print $1}'`
   echo "MTD : Detected block device : $dir for $partition"
   mkdir -p $dir

   ubiattach -m $mtd_block_number -d 1 /dev/ubi_ctrl
   device=/dev/ubi1_0
   while [ 1 ]
    do
        if [ -c $device ]
        then
            test -x /sbin/restorecon && /sbin/restorecon $device
            break
        else
            sleep 0.010
        fi
    done
}

FormatUBI() {
   partition=$1
   dir=$2
   ubinub=$3
   mtd_block_number=$4
   device=/dev/ubi${ubinub}
   
   ubidetach -p /dev/mtd$mtd_block_number
   sleep 1
   
   ubiformat /dev/mtd$mtd_block_number -y
   sleep 1
   
   ubiattach -m $mtd_block_number -d $ubinub /dev/ubi_ctrl
   sleep 1

   if [ -e $device ];then
      echo "ubiformat $partition success."
   else
      echo "ubiformat $partition failed."
      return 0
   fi

   ubimkvol /dev/ubi${ubinub} -m -N $partition
   sleep 1

   if [ -e ${device}_0  ];then
      echo "ubimkvol success."
      sync
      return 1
   else
      echo "ubimkvol failed."
      return 0
   fi   
}

GetMountResult() {
   partition=$1
   
   mountResult1=`mount | grep $partition`

   if [ "" = "$mountResult1" ]
   then
      echo "Mount $partition fail."
      return 0
   else
      echo "Mount $partition success."
      return 1
   fi
}

FindAndMountUsrdataUBI () {
   partition=$1
   dir=$2
   ubinub=$3
   QuecUsrdataFormatTimes=0
   Var1=0
   Var2=1
   ubiattach_time=0
   device=/dev/ubi${ubinub}_0

   mtd_block_number=`cat $mtd_file | grep -wi $partition | sed 's/^mtd//' | awk -F ':' '{print $1}'`
   echo "MTD : Detected block device : $dir for $partition"
   mkdir -p $dir

   #attatch ubi
   ubiattach -m $mtd_block_number -d  $ubinub /dev/ubi_ctrl
   while [ 1 ]
   do
      if [ -e $device ]
      then
         break
      else
         sleep 0.01
         ubiattach_time=$((ubiattach_time+1))
         #echo "ubiattach wait times= $ubiattach_time"

         if [ "$ubiattach_time" -gt "200" ]
         then
            echo "ubiattach $partition failed. Start to format the $partition partition ..."
            QL_FormatUBI $partition $dir $ubinub $mtd_block_number
            if [ ! -e $device ] ;then
               echo "ubiattach $partition failed."
               return 0
            fi
            break
         fi
      fi
   done

   #mount volume
   mounttimes=0
   while [ 1 ]
   do
      mount -t ubifs /dev/ubi${ubinub}_0 $dir -o bulk_read
      sleep 0.1
      GetMountResult $partition
      if [ $? -eq 1 ]
      then
         return 1
      fi

      mounttimes=$((mounttimes+1))
      if [ "$mounttimes" -gt "20" ]
      then
         echo "Mount failed, Start to format the $partition partition ..."
         QL_FormatUBI $partition $dir $ubinub $mtd_block_number
         if [ ! -e $device ] ;then
            echo "ubiattach $partition failed."
            return 0
         fi
         sleep 1
         mount -t ubifs /dev/ubi${ubinub}_0 $dir -o bulk_read
         sleep 2
         GetMountResult $partition
         return $?
      fi
   done
}

mtd_file=/proc/mtd
if [ -x /sbin/restorecon ]; then
    firmware_selinux_opt=",context=system_u:object_r:firmware_t:s0"
else
    firmware_selinux_opt=""
fi

if [ -e /systemrw/format_usrfs ];then
	ubiupdatevol /dev/ubi0_1 /usr/usrfs/sdxprairie-usrfs.ubifs
	rm -rf /systemrw/format_usrfs
fi

eval FindAndMountUBI modem /firmware

eval FindAndMountUsrdataUBI oemdata /oemdata 3

exit 0

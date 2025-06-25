#!/bin/sh

# Copyright (c) 2019, Qualcomm Technologies, Inc.
# All Rights Reserved.
# Confidential and Proprietary - Qualcomm Technologies, Inc.

chown -h system:system /sys/class/thermal
chown -h system:system /sys/class/thermal/*
chown -h system:system /sys/class/thermal/*/*
chown -h system:system /sys/devices/virtual/thermal/
chown -h system:system /sys/devices/virtual/thermal/*
chown -h system:system /sys/devices/virtual/thermal/*/*
chmod 0664 /sys/class/thermal/thermal_zone*/mode
chmod 0664 /sys/class/thermal/thermal_zone*/trip_point_0_temp
chmod 0664 /sys/class/thermal/thermal_zone*/trip_point_0_hyst
chmod 0664 /sys/class/thermal/cooling_device*/cur_state
chmod 0664 /sys/devices/virtual/thermal/thermal_zone*/mode
chmod 0664 /sys/devices/virtual/thermal/thermal_zone*/trip_point_0_temp
chmod 0664 /sys/devices/virtual/thermal/thermal_zone*/trip_point_0_hyst
chmod 0664 /sys/devices/virtual/thermal/cooling_device*/cur_state

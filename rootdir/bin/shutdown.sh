#! /system/bin/sh
temp=($(getprop factory-shutdown));
sleep $temp;
reboot -p

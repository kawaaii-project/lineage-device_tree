#! /system/bin/sh
for i in `seq 60`
do
	var_usb=($(cat /sys/class/power_supply/usb/online));
	var_pc_port=($(cat /sys/class/power_supply/pc_port/online));
	var_usb_present=($(cat /sys/class/power_supply/usb/present));
	if [ $var_usb -eq 1 ] || [ $var_pc_port -eq 1 ] || [ $var_usb_present -eq 1 ];then
		sleep 1;
	else
		sleep 1;
		var_brightness=($(cat /sys/class/backlight/panel0-backlight/brightness));
		if [ "$var_brightness" -gt 32 ];then
			input keyevent 26;
		fi
	fi
done

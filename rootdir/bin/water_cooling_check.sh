LOGDIR=/data/local
COOLFILE=$LOGDIR"/water_cooling_check.txt"
echo "water_test" > /sys/power/wake_lock
stop mi_thermald
echo 1 > /sys/class/power_supply/battery/input_suspend

for i in `ls /sys/class/thermal/ | grep thermal_zone`;
do
        if [ `cat /sys/class/thermal/${i}/type` = "cpu-1-1-usr" ] ; then
                export cpu1="/sys/class/thermal/${i}/temp"
        elif [ `cat /sys/class/thermal/${i}/type` = "cpu-1-3-usr" ] ; then
                export cpu3="/sys/class/thermal/${i}/temp"
        fi
done

cpu1_usr_start=($(cat $cpu1))
echo -n "cpu1_usr_start = $cpu1_usr_start" > $COOLFILE
echo  " " >> $COOLFILE

cpu3_usr_start=($(cat $cpu3))
echo -n "cpu3_usr_start = $cpu3_usr_start" >> $COOLFILE
echo  " " >> $COOLFILE

echo "cpu0 1612800" > /sys/class/thermal/thermal_message/cpu_limits
echo "cpu4 1862400" > /sys/class/thermal/thermal_message/cpu_limits
echo "cpu7 1747200" > /sys/class/thermal/thermal_message/cpu_limits


j=1;
while [ j -le 6 ]
do
	while true;do done &
	j=$j+1;
done

i=1
while [ i -le 120 ]
do
	i=$i+1
	sleep 1
done

cpu1_usr_end=($(cat $cpu1))
echo -n "cpu1_usr_end = $cpu1_usr_end"  >> $COOLFILE
echo  " " >> $COOLFILE

cpu3_usr_end=($(cat $cpu3))
echo -n "cpu3_usr_end = $cpu3_usr_end"  >> $COOLFILE
echo  " " >> $COOLFILE

start mi_thermald
echo 0 > /sys/class/power_supply/battery/input_suspend

echo "Finished"

pkill sh



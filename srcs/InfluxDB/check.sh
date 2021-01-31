pgrep influxd
ps_1=$?
pgrep telegraf
ps_2=$?
if [ $ps_1 -eq 0 ] && [ $ps_2 -eq 0 ]; then
        exit 0;
fi
exit 1;
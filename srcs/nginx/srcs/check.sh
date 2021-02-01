pgrep nginx
ps_1=$?
pgrep telegraf
ps_2=$?
pgrep sshd
ps_3=$?
if [ $ps_1 -eq 0 ] && [ $ps_2 -eq 0 ] && [ $ps_3 -eq 0 ]; then
        exit 0;
fi
exit 1;
sudo openrc reboot
rc-service nginx start
rc-service php-fpm7 start
/telegraf-1.17.0/usr/bin/telegraf --config /etc/telegraf/telegraf.conf &
#to keep process running
tail -F /dev/null
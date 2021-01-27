sudo openrc reboot
rc-service nginx start
rc-service php-fpm7 start
/telegraf/telegraf --config /etc/telegraf/telegraf.conf &
exec top
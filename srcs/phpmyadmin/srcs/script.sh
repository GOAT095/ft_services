#!bin/sh

mv /usr/share/webapps/phpmyadmin/ /www/phpmyadmin
mv /config.inc.php /www/phpmyadmin/
mkdir -p /www/phpmyadmin/tmp
chmod 777 /www/phpmyadmin/tmp
chmod 755 /www/phpmyadmin



# run services 

rc-service nginx start
rc-service php-fpm7 start
exec top
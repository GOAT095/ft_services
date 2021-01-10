#!bin/sh

/etc/init.d/mariadb setup
/etc/init.d/mariadb start

/usr/bin/mysql_install_db --user=mysql
/etc/init.d/mariadb start && rc-update add mariadb default
/usr/bin/mysqladmin -u root password '1234'


mysql -u root < create_tables.sql
mysql -u root -e "CREATE DATABASE wordpress"
mysql -u root -e "CREATE USER 'admin'@'localhost' IDENTIFIED BY '123'"
mysql -u root -e "CREATE USER 'admin'@'%' IDENTIFIED BY '123'"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost'"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%'"
mysql -u root -e "FLUSH PRIVILEGES"
#mysql -u root -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'pma'@'localhost' IDENTIFIED BY '123';"
#mysql -u root -e "FLUSH PRIVILEGES;"

mv mariadb-server.cnf /etc/my.cnf.d/
# run services 

rc-service mariadb start
exec top
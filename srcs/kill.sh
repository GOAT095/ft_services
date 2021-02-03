kubectl exec deploy/mysql-deployment -- pkill mysqld
kubectl exec deploy/wordpress-deployment -- pkill nginx
kubectl exec deploy/phpmyadmin-deployment -- pkill php-fpm7
kubectl exec deploy/influxdb-deployment -- pkill influxd
kubectl exec deploy/grafana-deployment -- pkill telegraf
kubectl exec deploy/ftps-deployment -- pkill vsftpd
kubectl exec deploy/nginx-deployment -- pkill nginx
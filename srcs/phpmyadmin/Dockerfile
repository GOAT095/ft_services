FROM alpine:latest

EXPOSE  5000

# Updating and adding Stuff i might need
RUN  apk update && apk upgrade
RUN  apk add nginx
RUN  apk add openrc --no-cache
RUN  apk add vim

#nginx config nginx -t
RUN  mkdir -p /run/nginx
RUN  adduser -D -g 'www' www
RUN  mkdir /www
RUN  chown -R www:www /var/lib/nginx
RUN  chown -R www:www /www
COPY ./srcs/default.conf /etc/nginx/conf.d/
COPY ./srcs/config.inc.php /

#PHPMYADMIN
RUN  openrc reboot
RUN  apk add php7-fpm php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
COPY ./srcs/script.sh /
RUN  apk add phpmyadmin php-mbstring php-gettext
RUN  chmod +x /script.sh
ENTRYPOINT [ "sh", "script.sh" ]
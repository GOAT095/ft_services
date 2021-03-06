FROM alpine:3.12

RUN apk update
RUN apk add sudo
RUN apk add openrc --no-cache
RUN apk add nginx wget
RUN apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl
RUN apk add php7-fpm php7-mcrypt php7-soap php7-session php7-openssl php7-gmp php7-pdo_odbc php7-json php7-dom php7-pdo php7-zip php7-mysqli php7-sqlite3 php7-apcu php7-pdo_pgsql php7-bcmath php7-gd php7-odbc php7-pdo_mysql php7-pdo_sqlite php7-gettext php7-xmlreader php7-xmlrpc php7-bz2 php7-iconv php7-pdo_dblib php7-curl php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip

RUN mkdir -p /var/anassif/

COPY nginx.conf /etc/nginx/nginx.conf
COPY wordpress-script.sh /
RUN chmod +x wordpress-script.sh

RUN adduser -D -g 'anassif' anassif
RUN chown -R anassif:anassif /var/anassif
RUN chown -R anassif:anassif /var/lib/nginx
RUN mkdir -p /run/nginx
RUN touch /run/nginx/nginx.pid

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.13.3-static_linux_amd64.tar.gz
RUN tar xf telegraf-1.13.3-static_linux_amd64.tar.gz
RUN rm telegraf-1.13.3-static_linux_amd64.tar.gz

RUN mkdir -p /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf
COPY check.sh /

RUN cd /tmp/
ADD https://wordpress.org/latest.tar.gz /
RUN tar xzvf latest.tar.gz
RUN rm -rf latest.tar.gz
RUN mv wordpress/ /var/anassif
COPY wp-config.php /var/anassif/wordpress/

EXPOSE 5050

# Open a shell
ENTRYPOINT ["sh", "/wordpress-script.sh"]
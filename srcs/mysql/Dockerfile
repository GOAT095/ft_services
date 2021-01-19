FROM alpine:3.12

RUN apk add sudo
RUN apk add openrc --no-cache
RUN apk update
RUN apk add mariadb mariadb-common mariadb-client libc6-compat

# Process Manager
#RUN apk add --no-cache supervisor
#COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ADD https://dl.influxdata.com/telegraf/releases/telegraf-1.17.0_linux_amd64.tar.gz /
RUN tar xf telegraf-1.17.0_linux_amd64.tar.gz
RUN rm telegraf-1.17.0_linux_amd64.tar.gz

RUN mkdir -p /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf

COPY mariadb-server.cnf /etc/my.cnf.d
COPY wp_database.sql /
COPY pma_tables.sql /
COPY mysql-script.sh /
RUN sudo chmod +x /mysql-script.sh

EXPOSE 3306

ENTRYPOINT ["sh", "/mysql-script.sh"]
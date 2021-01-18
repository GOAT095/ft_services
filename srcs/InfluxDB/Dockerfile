FROM alpine:3.12

RUN apk add sudo
RUN apk add openrc --no-cache
RUN apk update
RUN apk add libc6-compat
RUN apk add influxdb

# Process Manager
# RUN apk add --no-cache supervisor
# COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ADD https://dl.influxdata.com/influxdb/releases/influxdb2-2.0.3_linux_amd64.tar.gz /
RUN tar xvfz influxdb2-2.0.3_linux_amd64.tar.gz
RUN rm influxdb2-2.0.3_linux_amd64.tar.gz

ADD https://dl.influxdata.com/telegraf/releases/telegraf-1.17.0_linux_amd64.tar.gz /
RUN tar xf telegraf-1.17.0_linux_amd64.tar.gz
RUN rm telegraf-1.17.0_linux_amd64.tar.gz

RUN mkdir -p /etc/telegraf
# Make a directory for volumeMounts on Deployment {mountPath}
RUN mkdir -p /var/lib/influxdb
RUN mkdir -p /etc/influxdb

COPY influxdb.conf /etc/influxdb
COPY telegraf.conf /etc/telegraf/telegraf.conf

COPY influxdb-script.sh /
RUN sudo chmod +x /influxdb-script.sh

EXPOSE 8086

ENTRYPOINT ["sh", "/influxdb-script.sh"]

#to check curl -sL -I localhost:8086/ping
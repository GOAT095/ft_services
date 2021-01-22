FROM alpine:3.12

# update and install openrc
RUN apk update && apk add openrc libc6-compat bash
RUN openrc reboot

#install telegraf
ADD https://dl.influxdata.com/telegraf/releases/telegraf-1.17.0_linux_amd64.tar.gz /
RUN tar xf telegraf-1.17.0_linux_amd64.tar.gz
RUN rm telegraf-1.17.0_linux_amd64.tar.gz

RUN mkdir -p /etc/telegraf
COPY srcs/telegraf.conf /etc/telegraf/telegraf.conf

#instal supervisor
#RUN apk add --no-cache supervisor
#COPY srcs/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

#install and config vsftpd
RUN apk add vsftpd
RUN adduser admin -D && echo "admin:123" |chpasswd
COPY srcs/vsftpd.conf /etc/vsftpd/
COPY srcs/vsftpd.pem /etc/ssl/
COPY srcs/script.sh /
ENTRYPOINT ["sh","script.sh"]
FROM alpine:3.12
COPY srcs/install.sh /
RUN sh install.sh
COPY srcs/default.conf /etc/nginx/conf.d/default.conf
COPY srcs/service.sh /
COPY srcs/index.html /var/www/localhost/htdocs/
COPY srcs/domain.crt /etc/ssl/certs/
COPY srcs/domain.key /etc/ssl/private/
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

ADD https://dl.influxdata.com/telegraf/releases/telegraf-1.17.0_linux_amd64.tar.gz /
RUN tar xf telegraf-1.17.0_linux_amd64.tar.gz
RUN rm telegraf-1.17.0_linux_amd64.tar.gz

RUN mkdir -p /etc/telegraf
COPY srcs/telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 80 443 22
ENTRYPOINT ["sh", "service.sh"]
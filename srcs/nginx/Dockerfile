FROM alpine:3.12
COPY srcs/install.sh /
RUN sh install.sh
COPY srcs/default.conf /etc/nginx/conf.d/default.conf
COPY srcs/service.sh /
COPY srcs/index.html /var/www/localhost/htdocs/
COPY srcs/domain.crt /etc/ssl/certs/
COPY srcs/domain.key /etc/ssl/private/
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
EXPOSE 80 443 22
ENTRYPOINT ["sh", "service.sh"]
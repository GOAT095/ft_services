FROM alpine:latest

# port for sql
EXPOSE 3306
# Updating and adding Stuff i may need
RUN     apk update && apk upgrade
RUN     apk add openrc --no-cache
RUN     apk add vim

RUN     openrc reboot
RUN     apk add 
COPY    ./srcs/script.sh /

RUN     apk add mariadb mariadb-common mariadb-client 
RUN     chmod +x /script.sh
COPY    srcs/mariadb-server.cnf /
COPY    srcs/create_tables.sql /
ENTRYPOINT [ "sh", "script.sh" ]
#to check mysql 
#mysql -e "select 1" || echo down

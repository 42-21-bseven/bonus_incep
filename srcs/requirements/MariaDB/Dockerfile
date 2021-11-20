FROM debian:buster

RUN apt-get update && apt-get -y upgrade

RUN apt-get install -y vim mariadb-server php-mysql

COPY ./conf/wp_database.sql /tmp/

COPY ./conf/init_mdb.sh /tmp/

COPY ./conf/my.cnf /etc/mysql/

EXPOSE 3306

CMD sh /tmp/init_mdb.sh

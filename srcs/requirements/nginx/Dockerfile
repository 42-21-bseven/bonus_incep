#nginx_openssl_vim

FROM debian:buster

RUN		apt-get update && apt-get -y upgrade

RUN		apt-get install -y nginx

COPY	./conf/nginx-conf /etc/nginx/sites-available/xz_site.conf

RUN		apt-get install -y openssl

COPY    ./conf/*.sh /tmp/

EXPOSE 443

RUN sh /tmp/init.sh

ENTRYPOINT /usr/sbin/nginx -g "daemon off;"

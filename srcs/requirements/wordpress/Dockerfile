#wordpress:debian_upd_upg_wget_wp

FROM debian:buster

RUN		apt-get update && apt-get -y upgrade

RUN		apt-get install -y vim wget php7.3-fpm php php-mbstring php-mysql

RUN	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/bin/wp

RUN mkdir -p /var/www/xz_site /run/php 

RUN cd /var/www/xz_site/ && wp core download --allow-root

RUN    sed -i 's/;daemonize = yes/daemonize = no/g' /etc/php/7.3/fpm/pool.d/www.conf \
    && echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf

#RUN			mv wordpress /var/www/xz_site

COPY		./conf/wp-config.php /tmp

COPY		./conf/init_wp.sh /tmp

EXPOSE 9000

CMD	sh /tmp/init_wp.sh

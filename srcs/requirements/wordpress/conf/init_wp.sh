

if [ ! -f /var/www/xz_site/wp-config.php ]; then
    mv /tmp/wp-config.php /var/www/xz_site/
    sed -i -e "s|SOS_NAME|'$DB_NAME'|g" /var/www/xz_site/wp-config.php
    sed -i -e "s|SOS_USER|'$DB_USER'|g" /var/www/xz_site/wp-config.php
    sed -i -e "s|SOS_PASSWORD|'$DB_PASSWORD'|g" /var/www/xz_site/wp-config.php
    sed -i -e "s|SOS_HOST|'$DB_HOST'|g" /var/www/xz_site/wp-config.php
    cd /var/www/xz_site/
    wp core install --allow-root --url=$DOMAIN_NAME --title=$WP_TITLE \
    --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_MAIL
    wp user create --allow-root $WP_USER $WP_USER_MAIL --user_pass=$WP_USER_PASS
fi

#               starting php-fpm(fastCGI)
/usr/sbin/$(ls /usr/sbin | grep php | grep fpm) --nodaemonize

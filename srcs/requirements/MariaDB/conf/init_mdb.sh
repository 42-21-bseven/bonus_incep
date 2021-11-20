
if [ ! -f /tmp/ok ]; then
    service mysql start
    touch /tmp/ok
    sed -i -e "s|SOS_NAME|$DB_NAME|g" /tmp/wp_database.sql
    sed -i -e "s|SOS_USER|$DB_USER|g" /tmp/wp_database.sql
    sed -i -e "s|SOS_PASSWORD|$DB_PASSWORD|g" /tmp/wp_database.sql
    sed -i -e "s|SOS_ROOT_PASSWORD|$DB_ROOT_PASSWORD|g" /tmp/wp_database.sql

    mysql -u root < /tmp/wp_database.sql
    service mysql stop
fi

/usr/bin/mysqld_safe


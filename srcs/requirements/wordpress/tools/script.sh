#! /bin/bash

sed -i "s/listen = .*/listen = 9000/" /etc/php/7.3/fpm/pool.d/www.conf

if [ ! -f "/var/www/html/wp-config.php" ]; then

cd /var/www/html

sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php
sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
sed -i "s/localhost/mariadb/g" wp-config-sample.php
cp wp-config-sample.php wp-config.php

wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --allow-root
wp user create $WP_USER_1 $WP_USER_1_EMAIL --role=author --user_pass=$WP_USER_1_PASSWORD --allow-root

fi

exec "$@"

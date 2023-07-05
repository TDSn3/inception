#! /bin/bash

sleep 5

if [ ! -f "/var/www/html/wp-config.php" ]; then

mkdir /var/www
mkdir /var/www/html
cd /var/www/html

wget http://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
rm -rf latest.tar.gz

cd wordpress

sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php
sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
sed -i "s/localhost/mariadb/g" wp-config-sample.php
cp wp-config-sample.php wp-config.php

mv * ..
rm -rf ../wordpress

fi

sed -i 's/listen = .*/listen = 9000/' /etc/php/7.3/fpm/pool.d/www.conf

exec "$@"

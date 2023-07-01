#! /bin/bash

if [ ! -f "/var/lib/mysql/.installation_ok" ]; then

service mysql start

mysql_secure_installation << EOF

Y
$MYSQL_ROOT_PWD
$MYSQL_ROOT_PWD
Y
n
Y
Y
EOF

mysql -u root -e "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PWD';
                  CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
                  CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PWD';
                  GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PWD';
                  FLUSH PRIVILEGES;"

sed -i 's/#port.*/port                    = 3306/' /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i 's/bind-address.*/bind-address            = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

touch /var/lib/mysql/.installation_ok

service mysql stop

fi

exec "$@"

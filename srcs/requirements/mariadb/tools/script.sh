#! /bin/bash

if [ ! -f "/.installation_ok" ]; then

service mysql start

mysql -u root -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE ;
                  CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' ;
                  GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' ;
                  ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' ;
                  FLUSH PRIVILEGES ;"

sed -i "s/#port.*/port                    = 3306/"           /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i "s/bind-address.*/bind-address            = 0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf

touch /.installation_ok

service mysql stop

fi

exec "$@"

#! /bin/bash

#if [ ! -f "/var/lib/mysql/.installation_ok" ]; then

service mysql start
mysql_secure_installation << STOP

Y
root
root
Y
n
Y
Y
STOP
service mysql stop
touch .installation_ok

#fi

exec "$@"

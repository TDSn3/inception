#! /bin/bash

service mysql start

echo "Database already exists"

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

exec "$@"

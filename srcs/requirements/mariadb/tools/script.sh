#! /bin/bash

service mysql start

echo "Database already exists"

mysql_secure_installation << STOP

Y
123
123
Y
N
Y
Y
STOP

exec "$@"

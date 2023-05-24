
FROM	debian:buster

ARG		PHP_VERSION=7.3

RUN		apt-get update												\
			&& apt-get install -y									\
				wget												\
				php${PHP_VERSION}									\
				php${PHP_VERSION}-fpm								\
				php${PHP_VERSION}-mysql 							\
			&& mkdir /var/run/php

COPY	./tools/script.sh /usr/bin
RUN		chmod +x /usr/bin/script.sh

WORKDIR	/var/www/html
RUN		wget http://wordpress.org/latest.tar.gz						\
			&& tar -xzvf latest.tar.gz								\
			&& rm -rf latest.tar.gz									\
			&& chown -R www-data:www-data /var/www/html/wordpress
WORKDIR	/

EXPOSE	9000

CMD ["php-fpm7.3", "-F"]

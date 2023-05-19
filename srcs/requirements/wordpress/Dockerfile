
FROM	debian:buster

ARG		PHP_VERSION=7.3

RUN		apt-get update					\
			&& apt-get install -y		\
				php${PHP_VERSION}		\
				php${PHP_VERSION}-fpm	\
				php${PHP_VERSION}-mysql \
			&& mkdir /var/run/php

CMD ["php-fpm7.3", "-F"]

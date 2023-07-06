
FROM	debian:buster

ARG		PHP_VERSION=7.3

RUN		apt-get update																			\
			&& apt-get install -y																\
				wget																			\
				php${PHP_VERSION}																\
				php${PHP_VERSION}-fpm															\
				php${PHP_VERSION}-mysql															\
			&& mkdir -p /var/run/php															\
			&& mkdir -p /var/www/html															\
			&& wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar	\
			&& chmod +x wp-cli.phar																\
			&& mv wp-cli.phar /usr/local/bin/wp

COPY	./tools/script.sh /usr/bin
RUN		chmod +x /usr/bin/script.sh

EXPOSE	9000

ENTRYPOINT ["/usr/bin/script.sh"]

CMD ["php-fpm7.3", "-F"]


FROM	debian:buster

ARG		PHP_VERSION=7.3

RUN		apt-get update							\
			&& apt-get install -y				\
				wget							\
				php${PHP_VERSION}				\
				php${PHP_VERSION}-fpm			\
				php${PHP_VERSION}-mysql 		\
			&& mkdir /var/run/php

COPY	./tools/script.sh /usr/bin
RUN		chmod +x /usr/bin/script.sh

EXPOSE	9000

ENTRYPOINT ["/usr/bin/script.sh"]

CMD ["php-fpm7.3", "-F"]

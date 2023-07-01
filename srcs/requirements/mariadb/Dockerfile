
FROM	debian:buster

RUN		apt-get update				\
			&& apt-get install -y	\
				mariadb-server

COPY	./tools/script.sh /usr/bin
RUN		chmod +x /usr/bin/script.sh

EXPOSE	3306

ENTRYPOINT ["/usr/bin/script.sh"]

CMD ["mysqld"]

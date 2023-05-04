
FROM	debian:buster

RUN		apt-get update						\
			&& apt-get install -y nginx		\
			&& apt-get install -y openssl

EXPOSE	443
EXPOSE	80/tcp

CMD		["nginx", "-g", "daemon off;"]


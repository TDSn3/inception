
FROM	debian:buster

RUN		apt-get update						\
			&& apt-get install -y nginx		\
			&& apt-get install -y openssl

COPY	./conf/.conf /etc/nginx/conf.d

EXPOSE	443

CMD		["nginx", "-g", "daemon off;"]


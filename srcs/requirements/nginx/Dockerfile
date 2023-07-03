
FROM	debian:buster

RUN		apt-get update																\
			&& apt-get install -y													\
				nginx																\
				openssl

COPY	./conf/nginx.conf /etc/nginx/conf.d

RUN		openssl req -x509															\
		-nodes																		\
		-days 365																	\
		-newkey rsa:4096															\
		-subj "/CN=tda-silv.42.fr/O=ECOLE 42/ST=PARIS/L=PARIS/C=FR/OU=INCEPTION"	\
		-addext "subjectAltName=DNS:tda-silv.42.fr"									\
		-keyout /etc/ssl/private/tda-silv.42.fr.key									\
		-out /etc/ssl/certs/tda-silv.42.fr.crt

EXPOSE	80
EXPOSE	443

CMD		["nginx", "-g", "daemon off;"]

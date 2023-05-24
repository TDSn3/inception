
FROM	debian:buster

RUN		apt-get update																\
			&& apt-get install -y													\
				nginx																\
				openssl

COPY	./conf/nginx.conf /etc/nginx/conf.d
# COPY	./tools/index.html /var/www/html
# COPY	./tools/card.css /var/www/html
COPY	./tools/index.php /var/www/html

RUN		openssl req -x509															\
		-nodes																		\
		-days 365																	\
		-newkey rsa:4096															\
		-subj "/CN=tda-silv.42.fr/O=ECOLE 42/ST=PARIS/L=PARIS/C=FR/OU=INCEPTION"	\
		-addext "subjectAltName=DNS:tda-silv.42.fr"									\
		-keyout /etc/ssl/private/tda-silv.42.fr.key									\
		-out /etc/ssl/certs/tda-silv.42.fr.crt

#		req -x509			to specify we want to create a self-signed certificate instead of generating a certificate signing request
#		-nodes				makes it so that we skip the option to secure our certificate with a passphrase, so that nginx can read it
#		-days 365			specifies how long the certificate would be valid for, which is 365 days
#		-subj ""			this allows us to specify subject without filling in prompts. /C for country, /ST for state, /O for organization, and /CN for common name
#		-addext ""			which adds additional attributes to our certificate which is needed to make it a valid certificate seen by both our browser and local machine
#		-newrsa rsa:4096	specifies that we want to generate both a new certificate and a new key with an RSA key of 4096 bits
#		-keyout /...		specifies the location of the output .key file
#		-out /...			specifies the location of the output .crt file

EXPOSE	443
EXPOSE	80

CMD		["nginx", "-g", "daemon off;"]

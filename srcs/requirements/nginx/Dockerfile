
FROM	debian:buster

RUN		apt-get update										\
			&& apt-get install -y nginx						\
			&& apt-get install -y openssl

COPY	./conf/.conf /etc/nginx/conf.d
COPY	./conf/index.html /var/www/html

RUN		openssl req -x509									\
		-nodes												\
		-days 365											\
		-subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com"	\
		-addext "subjectAltName=DNS:mydomain.com"			\
		-newkey rsa:2048									\
		-keyout /etc/ssl/private/nginx-selfsigned.key		\
		-out /etc/ssl/certs/nginx-selfsigned.crt

#		req -x509			to specify we want to create a self-signed certificate instead of generating a certificate signing request
#		-nodes				makes it so that we skip the option to secure our certificate with a passphrase, so that nginx can read it
#		-days 365			specifies how long the certificate would be valid for, which is 365 days
#		-subj ""			this allows us to specify subject without filling in prompts. /C for country, /ST for state, /O for organization, and /CN for common name
#		-addext ""			which adds additional attributes to our certificate which is needed to make it a valid certificate seen by both our browser and local machine
#		-newrsa rsa:2048	specifies that we want to generate both a new certificate and a new key with an RSA key of 2048 bits
#		-keyout /...		specifies the location of the output .key file
#		-out /...			specifies the location of the output .crt file

EXPOSE	443
EXPOSE	80

CMD		["nginx", "-g", "daemon off;"]


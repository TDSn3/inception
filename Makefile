
all:
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

ps:
	docker image ls
	@echo ""
	docker ps
	@echo ""
	docker volume ls	

start : 
	@docker-compose -f ./srcs/docker-compose.yml start

stop : 
	@docker-compose -f ./srcs/docker-compose.yml stop

down : 
	@docker-compose -f ./srcs/docker-compose.yml down

clean:
	@docker-compose -f ./srcs/docker-compose.yml kill
	@echo ""
	@docker system prune -a -f
	@if [ $$(docker volume ls -q | wc -l) -gt 0 ]; then	\
		docker volume rm $$(docker volume ls -q);		\
	fi
	@rm -rf /Users/thomas/Desktop/42/data/mariadb/*
	@rm -rf /Users/thomas/Desktop/42/data/wordpress/*

#-----------------------#
# Manual                #
#-----------------------#

setup:
	@docker network create inception_network
	@docker volume create --driver local					\
		--opt type=none										\
		--opt device=/Users/thomas/Desktop/42/data/mariadb	\
		--opt o=bind										\
		mariadb
	@docker volume create --driver local						\
		--opt type=none											\
		--opt device=/Users/thomas/Desktop/42/data/wordpress	\
		--opt o=bind											\
		wordpress

#-----------------------#
# MariaDB               #
#-----------------------#

mariadb: setup
	@docker build -t mariadb srcs/requirements/mariadb
	@docker run						\
		-d							\
		--name mariadb				\
		-v mariadb:/var/lib/mysql	\
		--env-file srcs/.env		\
		--network inception_network	\
		--restart always			\
		mariadb

it_mariadb:
	@docker exec -it $$(docker ps --filter name=mariadb --format "{{.ID}}") bash

kill_mariadb:
	@docker kill $$(docker ps --filter name=mariadb --format "{{.ID}}")

#-----------------------#
# Wordpress             #
#-----------------------#

it_wordpress:
	@docker exec -it $$(docker ps --filter name=wordpress --format "{{.ID}}") bash

#-----------------------#
# Nginx                 #
#-----------------------#

it_nginx:
	@docker exec -it $$(docker ps --filter name=nginx --format "{{.ID}}") bash

#-----------------------#

.PHONY: all ps start stop down clean setup mariadb it_mariadb kill_mariadb

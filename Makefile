
all:
	@cd srcs; docker-compose up -d --build

ps:
	docker image ls
	@echo ""
	docker ps
	@echo ""
	docker volume ls	

clean:
	@cd srcs; docker-compose kill
	@echo ""
	@docker system prune -a -f
	@if [ $$(docker volume ls -q | wc -l) -gt 0 ]; then	\
		docker volume rm $$(docker volume ls -q);		\
	fi
	rm -rf /Users/thomas/Desktop/42/data/mariadb/*
	rm -rf /Users/thomas/Desktop/42/data/wordpress/*

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

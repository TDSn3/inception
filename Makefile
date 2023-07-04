
all:
	@cd srcs; docker-compose up -d --build

show:
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


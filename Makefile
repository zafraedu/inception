all:
	@docker compose -f srcs/docker-compose.yml up -d --build

restart:
	@docker compose -f srcs/docker-compose.yml restart

down:
	@docker compose -f srcs/docker-compose.yml down

clean:
	@docker stop $$(docker ps -aq)
	@docker rm $$(docker ps -aq)
	@docker rmi -f $$(docker images -aq)
	@docker volume rm $$(docker volume ls -q)
	@docker network rm $$(docker network ls -q)

.PHONY: all re restart down clean

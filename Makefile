all: prune reload

setup:
	@echo "127.0.0.1 ezafra-r.42.fr" >> /etc/hosts

stop:
	@docker compose -f srcs/docker-compose.yml down

clean: stop
	@ rm -rf $HOME/data

fclean:
	@docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	docker network rm $$(docker network ls -q);\


prune: clean
	@ docker system prune -f

reload:
	@ docker compose -f srcs/docker-compose.yml up --build

.PHONY: setup stop clean prune reload all

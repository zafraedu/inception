all: prune reload

setup:
	@echo "127.0.0.1 ezafra-r.42.fr" >> /etc/hosts

stop:
	@docker compose -f srcs/docker-compose.yml down

clean: stop
	@ rm -rf /home/$USER/data

prune: clean
	@ docker system prune -f

reload:
	@ docker compose -f srcs/docker-compose.yml up --build

.PHONY: setup stop clean prune reload all

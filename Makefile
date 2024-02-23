RELATIVE_PATH = ./srcs/docker-compose.yml

DOCKER = sudo docker compose -f ${RELATIVE_PATH}

all:		build up

build:		
			${DOCKER} build

up:
			${DOCKER} up -d
		
down:		
			${DOCKER} down

clean:		down
			sudo docker system prune -a --force

fclean:		clean
			sudo rm -rf /home/${USER}/data/DataBase/*
			sudo rm -rf /home/${USER}/data/WebsiteFiles/*

re:			clean all

ref:		fclean all

.PHONY:		all build up down clean fclean re

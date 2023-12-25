RELATIVE_PATH = ./srcs/docker-compose.yml

DOCKER_SWITCH = sudo docker compose -f ${RELATIVE_PATH}

all:		
			${DOCKER_SWITCH} up -d --build

clean:		
			${DOCKER_SWITCH} down

fclean:		clean
			sudo docker system prune -a --force

re:			fclean all

.PHONY:		all clean fclean re

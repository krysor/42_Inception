all:		
			sudo docker compose -f srcs/docker-compose.yml up -d

clean:		
			sudo docker compose -f srcs/docker-compose.yml down

fclean:		clean
			sudo docker system prune -a --force

re:			fclean all

.PHONY:		all clean fclean re

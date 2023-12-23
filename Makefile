#build Docker images using docket-compose.yml

#copy a makefile from my another project and add commands for building images and then docker-compose???
#or BUILD images from the docker compose?

#docker-compose fileName up/down

#SRCS	= megaphone.cpp

#OBJS	= ${SRCS:.cpp=.o}

#NAME	= megaphone

#CC		= c++
#RM		= rm -f

#CFLAGS	= -Wall -Wextra -Werror -std=c++98

#${NAME}:	${OBJS}
#			${CC} ${CFLAGS} -o ${NAME} ${OBJS}

all:		
			docker compose up srcs/docker-compose.yml -d

clean:		
			-c srcs
			docker compose down

fclean:		clean
#			${RM} ${NAME}

re:			fclean all

.PHONY:		all clean fclean re

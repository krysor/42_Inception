FROM alpine:3

RUN apk update && \
    apk add mariadb && \
	mkdir -p /var/lib/mysql
	#openrc && \
	#rc-service mariadb setup
	#/etc/init.d/mariadb setup
    #mkdir -p /run/nginx

# This Copies the contents of "./conf/nginx.conf" on the host machine to the "/etc/nginx/http.d/"
# directory inside the container
#COPY ./conf/nginx.conf /etc/nginx/http.d/default.conf

# This Specifies the command that will run when the container gets started
#CMD ["echo", "success"]
CMD ["mariadbd"]
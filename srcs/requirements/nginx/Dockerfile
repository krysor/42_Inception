# This Specifies the base images for the container (in this case, it's the 3.14 version of Alpine)
FROM alpine:3

# This Run commands in the container shell and installs the specified packages
# (it will install nginx & OpenSSL, and will create the directory "/run/nginx" as well)
RUN apk update && \
    apk add nginx
	# openssl
	# mkdir -p /run/nginx
	

# This Copies the contents of "./conf/nginx.conf" on the host machine to the "/etc/nginx/http.d/"
# directory inside the container
COPY ./nginx.conf /etc/nginx/http.d/default.conf

# This Specifies the command that will run when the container gets started
# "-g" option for global
# "daemon off;" to stay in the foreground. For containers this is useful as best practice is for one container = one process. One server (container) has only one service. 
CMD ["nginx", "-g", "daemon off;"]
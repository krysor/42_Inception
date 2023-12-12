# This Specifies the base images for the container (in this case, it's the 3.14 version of Alpine)
FROM debian:12

# This Copies the contents of "./conf/nginx.conf" on the host machine to the "/etc/nginx/http.d/"
# directory inside the container
#COPY ./conf/nginx.conf /etc/nginx/http.d/default.conf

# This Run commands in the container shell and installs the specified packages
# (it will install nginx & OpenSSL, and will create the directory "/run/nginx" as well)
RUN apt-get update && \
    apt-get install -y nginx
	# openssl
	#mkdir -p /run/nginx

## ENV PORT=8080

# This Specifies the command that will run when the container gets started
# "-g" option for global
# "daemon off;" to stay in the foreground. For containers this is useful as best practice is for one container = one process. One server (container) has only one service. 
CMD ["nginx", "-g", "daemon off;"]
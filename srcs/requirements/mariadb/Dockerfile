# This Specifies the base images for the container
FROM debian:12

# This Run commands in the container shell and installs the specified packages
# (it will install nginx & OpenSSL, and will create the directory "/run/nginx" as well)
RUN apk update && \
    apk add nginx openssl && \
    mkdir -p /run/nginx

# This Copies the contents of "./conf/nginx.conf" on the host machine to the "/etc/nginx/http.d/"
# directory inside the container
COPY ./conf/nginx.conf /etc/nginx/http.d/default.conf

# This Specifies the command that will run when the container gets started
CMD ["nginx", "-g", "daemon off;"]
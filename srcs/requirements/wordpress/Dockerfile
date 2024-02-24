FROM alpine:3.18

RUN apk update && apk upgrade && \ 
	apk add wget mariadb-client php php-fpm php-phar php-curl php-mysqli php-mbstring

#this line necessary?
RUN sed -i 's#listen = 127.0.0.1:9000#listen = 0.0.0.0:9000#' /etc/php81/php-fpm.d/www.conf

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/config.sh /tmp/config.sh

ENTRYPOINT ["sh", "./tmp/config.sh"]

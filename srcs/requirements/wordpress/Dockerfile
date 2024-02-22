FROM alpine:3.18

RUN apk update && apk upgrade && \ 
	apk add wget php php-fpm

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/config.sh /tmp/config.sh

ENTRYPOINT ["sh", "./tmp/config.sh"]
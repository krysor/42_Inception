FROM alpine:3.18

RUN apk update && apk upgrade && \ 
	apk add mariadb mariadb-client

COPY ./tools/config.sh /tmp/config.sh

ENTRYPOINT ["sh", "./tmp/config.sh"]
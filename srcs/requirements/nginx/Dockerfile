FROM alpine:3

RUN apk update && \
    apk add nginx
	# openssl
	# mkdir -p /run/nginx

COPY ./nginx.conf /etc/nginx/http.d/default.conf

COPY ./index.html /www/data/index.html

CMD ["nginx", "-g", "daemon off;"]
FROM alpine:3

RUN apk update && \
    apk add nginx openssl && \
	openssl req \
			-subj "/C=BE/L=Brussels/O=42" \
			-x509 \
			-days 30 \
			-noenc \
			-out /etc/ssl/certs/nginx.crt \
			-newkey rsa:2048 \
			-keyout /etc/ssl/private/nginx.key
	# mkdir -p /run/nginx

COPY ./nginx.conf /etc/nginx/http.d/default.conf

#delete later
COPY ./index.html /www/data/index.html

CMD ["nginx", "-g", "daemon off;"]

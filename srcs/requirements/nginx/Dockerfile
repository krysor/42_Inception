FROM alpine:3.18

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

COPY ./nginx.conf /etc/nginx/http.d/default.conf

CMD ["nginx", "-g", "daemon off;"]

FROM alpine:3.13

RUN	apk update && apk upgrade && apk add --no-cache \
        nginx \
        openssl

# nginx SSL
RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/nginx/ssl/ezafra-r.crt \
        -keyout /etc/nginx/ssl/ezafra-r.key \
        -subj "/CN=ezafra-r.42.fr/C=ES/L=Malaga"

RUN mkdir -p /run/nginx
COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 443 80

# Start nginx
ENTRYPOINT ["nginx", "-g", "daemon off;"]

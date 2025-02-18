FROM debian:buster

RUN apt-get update && apt-get install -y \
        nginx \
        openssl

# nginx SSL
RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/nginx/ssl/ezafra-r.crt \
        -keyout /etc/nginx/ssl/ezafra-r.key \
        -subj "/CN=ezafra-r.42.fr/C=ES/L=Malaga"

COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 443 80

# Start nginx
ENTRYPOINT ["nginx", "-g", "daemon off;"]

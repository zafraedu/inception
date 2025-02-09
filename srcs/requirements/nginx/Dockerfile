FROM debian:buster

#install all the program
RUN apt-get update
RUN apt-get install -y nginx openssl

# nginx SSL
RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       -out /etc/nginx/ssl/ezafra-r.crt \
       -keyout /etc/nginx/ssl/ezafra-r.key \
       -subj "/C=ES/ST=Malaga/L=Malaga/O=42 School/OU=ezafra-r/CN=ezafra-r/"

COPY conf/nginx.conf /etc/nginx/nginx.conf
# COPY tools/index.html /data/www/index.html

# the only port allowed
EXPOSE 443
# EXPOSE 80

# start nginx
CMD ["nginx", "-g", "daemon off;"]

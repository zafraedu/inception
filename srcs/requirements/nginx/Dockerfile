FROM debian:buster

#install all the program
RUN apt-get update
RUN apt-get install -y nginx openssl

# nginx SSL
RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       -out /etc/nginx/ssl/ezafra-r.crt \
       -keyout /etc/nginx/ssl/ezafra-r.key \
       -subj "/CN=ezafra-r.42.fr/C=ES/L=Malaga"

COPY conf/nginx.conf /etc/nginx/nginx.conf

# the only port allowed
EXPOSE 443 80

# start nginx
CMD ["nginx", "-g", "daemon off;"]

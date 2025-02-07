FROM debian:buster

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y nginx

COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /data/www/index.html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

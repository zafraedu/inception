FROM debian:buster

RUN apt-get update
RUN apt-get -y install \
	curl \
	php-fpm \
	php-mysql \
	php-mbstring \
	php-curl

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

EXPOSE 9000

CMD ["bash", "-c", "echo 'hola mundo' && tail -f /dev/null"]

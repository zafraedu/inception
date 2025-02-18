FROM debian:buster

RUN apt update -y
RUN apt install php-fpm php-mysql curl -y
RUN rm -rf /var/lib/apt/lists/*

# static website
COPY conf/index.html /tmp/index.html

# install wordpress
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
  && mv wp-cli.phar /usr/local/bin/wp

RUN mkdir /run/php

WORKDIR /var/www/html/wordpress

COPY tools/entrypoint.sh /tmp/entrypoint.sh
ENTRYPOINT [ "sh", "/tmp/entrypoint.sh" ]

CMD ["/usr/sbin/php-fpm7.3", "-F"]

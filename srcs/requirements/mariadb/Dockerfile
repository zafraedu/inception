FROM alpine:3.13

RUN apk update && apk upgrade && apk add --no-cache \
  mariadb \
  mariadb-client

COPY tools/entrypoint.sh /tmp/entrypoint.sh

ENTRYPOINT ["sh", "/tmp/entrypoint.sh"]

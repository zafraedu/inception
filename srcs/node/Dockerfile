FROM	debian:buster

RUN apt-get update
RUN apt-get install -y nodejs

COPY . /app
WORKDIR /app

CMD ["node", "app.js"]

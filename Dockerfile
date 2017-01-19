FROM resin/rpi-raspbian:jessie
MAINTAINER Markus Fischbacher <fischbacher.markus@gmail.com>

RUN apt-get update && apt-get install -y ca-certificates nginx && rm -rf /var/lib/apt/lists/*

RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

VOLUME ["/var/cache/nginx"]

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]

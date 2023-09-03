FROM alpine:3.17

RUN apk update && apk add --no-cache redis

# Change config
RUN sed -i 's/^bind/# bind/g' /etc/redis.conf
RUN sed -i 's/protected-mode yes/protected-mode no/' /etc/redis.conf
RUN sed -i 's/# syslog-enabled no/syslog-enabled yes/g' /etc/redis.conf
RUN sed -i 's/loglevel notice/loglevel verbose/g' /etc/redis.conf

EXPOSE 6379

CMD ["redis-server", "/etc/redis.conf"]


FROM alpine:3.17

ARG ADMINER_VERSION

RUN apk update && apk add --no-cache php81 php81-fpm php81-mysqli php81-session

RUN mkdir -p /var/www/html/adminer
RUN wget https://github.com/vrana/adminer/releases/download/v${ADMINER_VERSION}/adminer-${ADMINER_VERSION}.php -O /var/www/html/adminer/index.php

COPY ./conf/www.conf /etc/php81/php-fpm.d/

# Add www-data group
RUN adduser -u 82 -D -S -G www-data www-data

EXPOSE 8080

CMD ["php-fpm81", "-F"]

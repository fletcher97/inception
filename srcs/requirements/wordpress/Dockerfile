FROM alpine:3.17

ARG WP_CLI_DL

# Download programs
RUN apk update && apk add --no-cache php81 php81-fpm php81-phar php81-openssl php81-mysqli php81-iconv php81-tokenizer mariadb-client

RUN mkdir -p /run/php

# Install wp-cli
RUN wget ${WP_CLI_DL} -O /usr/local/bin/wp-cli.phar && chmod +x /usr/local/bin/wp-cli.phar

# Install script
RUN mkdir -p /opt/wp-setup
COPY ./tools/script.sh /opt/wp-setup/script.sh
RUN chmod +x /opt/wp-setup/script.sh
WORKDIR /opt/wp-setup

# Copy FPM conf
COPY ./conf/www.conf /etc/php81/php-fpm.d/

# Add www-data group
RUN adduser -u 82 -D -S -G www-data www-data

# Expose WordPress's port
EXPOSE 9000

CMD ["./script.sh"]

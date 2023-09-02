FROM alpine:3.17

ARG LOGIN

# Packages
RUN apk update && apk add --no-cache nginx openssl

RUN mkdir -p /run/nginx

# nginx SSL
RUN mkdir -p -m 777 /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
	-out /etc/nginx/ssl/${LOGIN}.crt \
	-keyout /etc/nginx/ssl/${LOGIN}.key \
	-subj "/C=/ST=/L=/O=/OU=/CN=/"

# Copy conf
RUN sed -i "s/ssl_protocols TLSv1.1/ssl_protocols/g" /etc/nginx/nginx.conf
COPY conf/default.conf /etc/nginx/http.d/default.conf
RUN sed -i "s/LOGIN/${LOGIN}/g" /etc/nginx/http.d/default.conf

RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

# Start nginx on foreground
# CMD ["tail", "-f", "/dev/null"]
CMD [ "nginx", "-g", "daemon off;" ]
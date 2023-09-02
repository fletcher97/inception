FROM alpine:3.17

ARG DB_NAME
ARG DB_USER
ARG DB_PASS

RUN apk update && apk add --no-cache mariadb

RUN mariadb-install-db --user=mysql --datadir=/var/lib/mysql

RUN mkdir -p /opt/mariadb
COPY conf/init.sql /opt/mariadb/init.sql
RUN sed -i "s/DB_NAME/${DB_NAME}/g" /opt/mariadb/init.sql\
	&& sed -i "s/DB_USER/${DB_USER}/g" /opt/mariadb/init.sql\
	&& sed -i "s/DB_PASS/${DB_PASS}/g" /opt/mariadb/init.sql\
	&& sed -i "s/skip-networking/#skip-networking/g" /etc/my.cnf.d/mariadb-server.cnf

RUN mkdir /run/mysqld && chown -R mysql:mysql /run/mysqld
RUN chown -R mysql:mysql /opt/mariadb

ENTRYPOINT ["mysqld", "--user=mysql", "--init-file=/opt/mariadb/init.sql"]

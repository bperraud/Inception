FROM debian:latest

# Install MariaDB package
RUN apt-get update && \
    apt-get upgrade -y && \
	apt-get install -y mariadb-server mariadb-client


RUN chown -R mysql:mysql /var/lib/mysql

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld && chmod 755 /run/mysqld

COPY tools/init.sql /tools/
COPY tools/entrypoint.sh /tools/

ENTRYPOINT [ "/tools/entrypoint.sh" ]

CMD [ "mysqld", "--bind-address 0.0.0.0", "--init-file /tools/init.sql" ]

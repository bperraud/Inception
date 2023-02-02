FROM debian:latest

# Install MariaDB package
RUN apt-get update && \
    apt-get upgrade -y && \
	apt-get install -y mariadb-server mariadb-client \
	gettext moreutils && rm -rf /var/lib/apt/lists/*

#RUN rm -rf /var/lib/mysql && mkdir -p /var/lib/mysql

#RUN chown -R mysql:mysql /var && chmod 777 /var
#RUN chown -R mysql:mysql /var/lib && chmod 777 /var/lib
#RUN chown -R mysql:mysql /var/lib/mysql && chmod 777 /var/lib/mysql

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld && chmod 777 /run/mysqld

COPY tools/init.sql /tools/
COPY tools/entrypoint.sh /tools/

ENTRYPOINT [ "/tools/entrypoint.sh" ]

CMD [ "mysqld", "--skip-grant-tables" , "--bind-address 0.0.0.0", "--init-file /tools/init.sql" ]


FROM debian:latest

# Install MariaDB package
RUN apt-get update && \
    apt-get install -y mariadb-server

# Copy the MariaDB configuration file
COPY my.cnf /etc/mysql/my.cnf

# Create the MariaDB data directory
RUN mkdir /var/lib/mysql

# Set ownership and permissions for the data directory
RUN chown -R mysql:mysql /var/lib/mysql && \
    chmod 700 /var/lib/mysql

# Create a volume for the MariaDB data directory
VOLUME /var/lib/mysql

# Expose the MariaDB port
EXPOSE 3306

# Start the MariaDB service
CMD ["mysqld"]
FROM debian:latest

# Install MariaDB package
RUN apt-get update && \
    apt-get install -y mariadb-server

# Copy the MariaDB configuration file
COPY my.cnf /etc/mysql/my.cnf

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld && chmod 755 /run/mysqld

# Set ownership and permissions for the data directory
RUN chown -R mysql:mysql /var/lib/mysql && chmod 775 /var/lib/mysql

# Create a volume for the MariaDB data directory
VOLUME /var/lib/mysql

# Expose the MariaDB port
EXPOSE 3306

# Default start as root user, not recommended for security reasons.
USER mysql

# Start the MariaDB service
CMD ["mysqld"]

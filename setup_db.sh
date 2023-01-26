#!/bin/bash

# Initialize the MariaDB data directory and create the system tables
#mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

mariadb_upgrade

# Start the MariaDB service
mariadbd &

# Wait for MariaDB to start
sleep 5

mariadb -u root -e "CREATE DATABASE WP_DB;"
mariadb -u root -e "CREATE USER 'WP_DB_USER'@'%' IDENTIFIED BY 'WP_DB_PASSWORD';"
mariadb -u root -e "GRANT ALL PRIVILEGES ON WP_DB.* TO 'WP_DB_USER'@'%';"
mariadb -u root -e "FLUSH PRIVILEGES;"

mariadb -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'MYSQL_ROOT_PASSWORD';"

# Stop the MariaDB service
mariadb-admin -u root shutdown

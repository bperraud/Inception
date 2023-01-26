#!/bin/bash

# Initialize the MariaDB data directory and create the system tables
mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

# Start the MariaDB service
mariadbd &

# Wait for MariaDB to start
sleep 5

# Set a new password for the root user
mariadb -u root -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('new_password');"

# Create new user and grant privileges to WordPress database
mariadb -u root -e "CREATE USER 'wpuser'@'localhost' IDENTIFIED BY 'password';"
mariadb -u root -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wpuser'@'localhost';"

# Create administrator user and grant privileges to WordPress database
mariadb -u root -e "CREATE USER 'adminuser'@'localhost' IDENTIFIED BY 'password';"
mariadb -u root -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'adminuser'@'localhost';"

# Reload the grant tables to activate the new changes
mariadb -u root -pnew_password -e "FLUSH PRIVILEGES;"

# Stop the MariaDB service
mariadb-admin -u root shutdown

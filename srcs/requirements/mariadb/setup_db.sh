#!/bin/bash

# Initialize the MariaDB data directory and create the system tables
mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

# Start the MariaDB service
mariadbd &

# Wait for MySQL to start
sleep 5

# Create new user and grant privileges to WordPress database
mysql -u root -e "CREATE USER 'wpuser'@'localhost' IDENTIFIED BY 'password';"
mysql -u root -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wpuser'@'localhost';"

# Create administrator user and grant privileges to WordPress database
mysql -u root -e "CREATE USER 'adminuser'@'localhost' IDENTIFIED BY 'password';"
mysql -u root -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'adminuser'"

# Stop the MariaDB service
mariadb-admin -u root shutdown

#!/bin/sh

# If wp-config doesnt exist, creates it
if [ ! -f /usr/share/html/wp-config.php ]; then
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/bin/wp
	wp core download --allow-root
	wp config create --dbname=$WP_DB --dbuser=$WP_DB_USER --dbpass=$WP_DB_PASSWORD --dbhost=mariadb --allow-root
fi

# Execute any command line arguments passed to the container
exec "$@"

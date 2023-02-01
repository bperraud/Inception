#!/bin/sh

# Move the files from /tmp/wordpress/ to /usr/share/html/
#mv /tmp/wordpress* /usr/share/html/

if [ ! -f /usr/share/html/wordpress/wp-config.php ]; then
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/bin/wp
	wp config create --dbname=$WP_DB --dbuser=$WP_DB_USER --dbpass=$WP_DB_PASSWORD --dbhost=mariadb --allow-root

	mv wp-config.php /usr/share/html/wordpress/

fi

# Execute any command line arguments passed to the container
exec "$@"

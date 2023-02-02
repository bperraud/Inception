FROM debian:latest

# Configure the timezone
RUN apt-get update && apt-get install -y apt-utils  \
	&& apt-get install -y curl \
	&& apt-get install -y php-fpm \
	&& apt-get install -y mariadb-client

# Configure PHP-FPM
COPY tools/php-fpm.conf /etc/php/7.4/fpm/php-fpm.conf

# install the MySQL extension
RUN apt-get update && apt-get install -y php-mysql

# Copy the extracted WordPress files to the web root directory :
#COPY tools/wordpress/ /usr/share/html/

#COPY tools/wordpress/ /tmp/wordpress

COPY tools/config.sh /tools/

ENTRYPOINT [ "/tools/config.sh" ]

# Expose necessary ports
EXPOSE 9000

# Start the PHP-FPM service
CMD ["php-fpm7.4", "-F"]

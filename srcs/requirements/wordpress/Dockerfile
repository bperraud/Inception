FROM debian:buster

# Configure the timezone
RUN apt-get update && apt-get install -y apt-utils  \
	&& apt-get install -y curl \
	&& apt-get install -y php-fpm \
	&& apt-get install -y mariadb-client \
	&& apt-get install -y php-mysql \
	&& rm -rf /var/lib/apt/lists/*

# Configure PHP-FPM
COPY tools/php-fpm.conf /etc/php/7.3/fpm/php-fpm.conf

COPY tools/config.sh /tools/

ENTRYPOINT [ "/tools/config.sh" ]

# Expose necessary ports
EXPOSE 9000

# Start the PHP-FPM service
CMD ["php-fpm7.3", "-F"]

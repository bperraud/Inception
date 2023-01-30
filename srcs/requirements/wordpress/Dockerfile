FROM debian:latest

# Set the environment variable 'TZ' to your desired timezone
ENV TZ=UTC
ENV DEBIAN_FRONTEND=noninteractive

# Configure the timezone
RUN echo $TZ > /etc/timezone \
    && apt-get update && apt-get install -y apt-utils  \
    && apt-get install -y tzdata \
    && rm /etc/localtime \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && dpkg-reconfigure -f noninteractive tzdata \
    && apt-get install -y php-fpm \
    && rm -rf /var/lib/apt/lists/*

# Download the latest version of WordPress and extract it:
#RUN wget https://wordpress.org/latest.tar.gz && tar xzvf latest.tar.gz && rm latest.tar.gz

# Configure PHP-FPM
COPY tools/php-fpm.conf /etc/php/7.4/fpm/php-fpm.conf

# Copy the extracted WordPress files to the web root directory :
COPY tools/wordpress/ /usr/share/html/

# Expose necessary ports
EXPOSE 9000

# install the MySQL extension
RUN apt-get update && apt-get install -y php-mysql

# Start the PHP-FPM service
CMD ["php-fpm7.4", "-F"]

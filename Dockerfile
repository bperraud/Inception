FROM debian:latest

# Set the environment variable 'TZ' to your desired timezone
ENV TZ=UTC
ENV DEBIAN_FRONTEND=noninteractive

#RUN systemctl disable

# Configure the timezone
RUN echo $TZ > /etc/timezone \
    && apt-get update && apt-get install -y apt-utils  \
    && apt-get install -y tzdata \
    && rm /etc/localtime \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && dpkg-reconfigure -f noninteractive tzdata \
    && apt-get install -y php-fpm \
    && rm -rf /var/lib/apt/lists/*

# Install necessary packages
#RUN apt-get update && apt-get install -y php-fpm && rm -rf /var/lib/apt/lists/*

# Download the latest version of WordPress and extract it:
#RUN wget https://wordpress.org/latest.tar.gz && tar xzvf latest.tar.gz && rm latest.tar.gz

# Configure PHP-FPM
COPY php-fpm.conf /etc/php/7.4/fpm/php-fpm.conf

#  give ownership to USER
#RUN chown -R $USER:$USER /html/

# Remove the directory before copying new files.
#RUN rm -rf /html/*

# Copy the extracted WordPress files to the web root directory and set the correct permissions:
RUN cp my_file /etc/
# \&& chown -R www-data:www-data /var/www/html

# Create a volume for the WordPress files
VOLUME /html

# Expose necessary ports
EXPOSE 9000

# Start the PHP-FPM service
CMD ["php-fpm7.4"]



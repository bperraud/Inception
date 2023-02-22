FROM debian:buster

RUN apt-get update && apt-get install -y nginx \
	&& rm -rf /var/lib/apt/lists/*
# Copy the configuration file to the appropriate directory
COPY tools/nginx.conf /etc/nginx/nginx.conf

# Copy SSL Certificates to the appropriate directory
COPY tools/ssl/ /etc/nginx/ssl/

# Expose necessary ports
EXPOSE 443

RUN sed -i "s/ssl_protocols.*/ssl_protocols TLSv1.2 TLSv1.3;/" /etc/nginx/nginx.conf

# Start NGINX when the container is run
CMD ["nginx", "-g", "daemon off;"]

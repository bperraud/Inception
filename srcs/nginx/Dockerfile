# Use the official NGINX image as the base image
#FROM nginx:latest

FROM ubuntu:latest

RUN apt-get update && apt-get install -y nginx

# Copy the index.html file to the default NGINX document root
COPY index.html /usr/share/nginx/html/index.html

# Copy the configuration file to the appropriate directory
COPY nginx.conf /etc/nginx/nginx.conf

# Copy SSL Certificates to the appropriate directory
COPY ssl/ /etc/nginx/ssl/

# Expose port 443
EXPOSE 443

RUN sed -i "s/ssl_protocols.*/ssl_protocols TLSv1.2 TLSv1.3;/" /etc/nginx/nginx.conf

# Start NGINX when the container is run
CMD ["nginx", "-g", "daemon off;"]


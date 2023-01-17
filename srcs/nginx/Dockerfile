# Use the official NGINX image as the base image
FROM nginx:latest

# Copy the configuration file to the appropriate directory
COPY nginx.conf /etc/nginx/nginx.conf

# Copy SSL Certificates to the appropriate directory
COPY ssl/ /etc/nginx/ssl/

# Expose port 80 and 443
EXPOSE 80 443

# Start NGINX when the container is run
CMD ["nginx", "-g", "daemon off;"]


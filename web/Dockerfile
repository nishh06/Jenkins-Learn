# Use the previously built app_server image as the base image
FROM app_server

# Install Nginx and PHP-FPM
RUN yum install -y net-tools nginx php php-fpm php-cli php-mysqlnd php-curl php-soap php-xml php-zip php-mbstring php-gd php-json && \
    yum clean all && \
    rm -rf /var/cache/yum

# Copy Nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Set up PHP-FPM configuration
RUN sed -i \
    -e 's/user = apache/user = nginx/g' \
    -e 's/group = apache/group = nginx/g' \
    -e 's/;listen.allowed_clients = 127.0.0.1/listen.allowed_clients = any/g' \
    -e 's/;listen = 127.0.0.1:9000/listen = 0.0.0.0:9000/g' \
    /etc/php-fpm.d/www.conf && \
    mkdir -p /run/php-fpm && \
    chown nginx:nginx /run/php-fpm


# Declare volumes
VOLUME /var/www/html
VOLUME /var/log/nginx
VOLUME /var/log/php-fpm
VOLUME /var/lib/php-fpm

# Expose port 80
EXPOSE 80 22

CMD ["/usr/sbin/sshd", "-D"]
# Start PHP-FPM and Nginx services
CMD php-fpm && nginx -g "daemon off;"

FROM alpine:3.6

RUN	apk update && \
	apk upgrade && \
	apk add --update curl \
	    gcc \
	    make \
	    nginx \
	    wget \
	    nano \
	    supervisor \
	    mc

RUN rm -rf /var/cache/apk/*

# Housekeeping
RUN mkdir -p /etc/nginx
RUN mkdir -p /run/nginx
RUN mkdir -p /var/log/supervisor

# Copy base Nginx config
RUN rm /etc/nginx/nginx.conf
ADD /docker-config/nginx.conf /etc/nginx/nginx.conf

# Copy base Nginx sites-enabled
ADD /docker-config/default /etc/nginx/sites-enabled/default

# Add Nginx and PHP-FPM supervisor
ADD /docker-config/nginx-supervisor.ini /etc/supervisor.d/nginx-supervisor.ini

# Site volume
ADD / /var/www/

# Composer
WORKDIR /var/www/

# Start
CMD ["/usr/bin/supervisord"]

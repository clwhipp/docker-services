FROM nextcloud:29.0.0-apache

RUN apt update
RUN apt -y install gettext-base

# Install/Enable Apache Modules specific to SSL/TLS
RUN a2enmod rewrite
RUN a2enmod headers
RUN a2enmod ssl

# Override default sites configuration with TLS enabled version
COPY 000-default.conf.template /etc/apache2/sites-available/000-default.conf.template
RUN envsubst '${NEXTCLOUD_DOMAIN}' < /etc/apache2/sites-available/000-default.conf.template > /etc/apache2/sites-available/000-default.conf

# Replace envvars to control apache user account
COPY envvars /etc/apache2/
RUN chmod 644 /etc/apache2/envvars

# Uncomment these lines in order to support being able to login as www-data
# in order to run the cron.sh script to handle cleanup
RUN useradd -u 1502 -s /bin/bash nc

# Expose HTTPS rather than HTTP
EXPOSE 443

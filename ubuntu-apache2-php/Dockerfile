# Start writing your Dockerfile easily
FROM smoers/ubuntu-apache2:stable

# set noninteractive installation
ENV DEBIAN_FRONTEND=noninteractive
#Environment
ENV PHPIPAM_PASS=qPmLmMDHtNFnLi6b

RUN set -eux; \
  apt update; \
  apt-get install -y --no-install-recommends \
  php7.2 \
  php7.2-common \
  php7.2-curl \
  php7.2-gd \
  php7.2-gmp \
  php7.2-json \
  php7.2-ldap \
  php7.2-mysql \
  php7.2-xml \
  php7.2-mbstring \
  php7.2-zip \
  libapache2-mod-php7.2 \
  mariadb-server

#phpIpam
RUN mkdir /var/www/phpipam
COPY phpipam/* /var/www/phpipam/
RUN cp var/www/phpipam/config.dist.php var/www/phpipam/config.php
RUN sed -i "s/\$db\['pass'\] = 'phpipamadmin'/\$db\['pass'\] = '${PHPIPAM_PASS}'/g" /var/www/phpipam/config.php

#supervisor configuratipon file
RUN mkdir -p /var/log/supervisor
COPY conf/supervisor/supervisord.conf /etc/supervisor/supervisord.conf
COPY conf/supervisor/conf.d/supervisord_apache2.conf /etc/supervisor/conf.d/supervisord_apache2.conf
COPY conf/supervisor/conf.d/supervisord_mariadb.conf /etc/supervisor/conf.d/supervisord_mariadb.conf

#apache config
COPY etc/apache2/sites-available/phpipam.conf /etc/apache2/sites-available/phpipam.conf
RUN a2ensite phpipam

# set your timezone
RUN echo "Europe/Brussels" > /etc/localtime
RUN dpkg-reconfigure --frontend noninteractive tzdata

# Configure Services and Port
COPY start.sh /usr/bin/start.sh
RUN chmod +x /usr/bin/start.sh
CMD ["/usr/bin/start.sh","${PHPIPAM_PASS}"]

EXPOSE 80 443




# Start writing your Dockerfile easily
FROM smoers/ubuntu-apache2:stable

# set noninteractive installation
ENV DEBIAN_FRONTEND=noninteractive

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
  libapache2-mod-php7.2

#supervisor configuratipon file
RUN mkdir -p /var/log/supervisor
COPY conf/supervisor/supervisord.conf /etc/supervisor/supervisord.conf

# set your timezone
RUN echo "Europe/Brussels" > /etc/localtime
RUN dpkg-reconfigure --frontend noninteractive tzdata

# Configure Services and Port
COPY start.sh /usr/bin/start.sh
RUN chmod +x /usr/bin/start.sh
CMD ["/usr/bin/start.sh"]

EXPOSE 80 443




# Start writing your Dockerfile easily
FROM ubuntu:disco-20190613

# set noninteractive installation
ENV DEBIAN_FRONTEND=noninteractive

# create folder for PID apache
RUN mkdir /var/run/apache2

RUN set -eux; \
  apt update; \
  apt-get install -y --no-install-recommends \
  supervisor \
  tzdata \
  apache2

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

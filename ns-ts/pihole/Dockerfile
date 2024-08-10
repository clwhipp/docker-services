FROM pihole/pihole:2024.07.0

RUN mkdir -p /tmp/stage
COPY lightpd-updates.conf /tmp/stage/external.conf
RUN cat /tmp/stage/external.conf >> /etc/lighttpd/lighttpd.conf
RUN rm -rf /tmp/stage

FROM ubuntu:14.04

ADD ./data /var/lib/clamav

RUN apt-get update && \
  apt-get -y install clamav-daemon && \
  freshclam

RUN mkdir -p /var/run/clamav

ADD ./clamd.conf /etc/clamav/clamd.conf

CMD ["clamd", "--config-file=/etc/clamav/clamd.conf"]

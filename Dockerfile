FROM ubuntu:14.04

MAINTAINER Dustin Clark "dusty@clarkda.com"

RUN apt-get update && apt-get install -y \
	supervisor \
	znc

ADD conf/znc.conf  /opt/znc/configs/znc.conf

ADD supervisor /etc/supervisor
RUN chmod +x /etc/supervisor/scripts/pre-start.sh

EXPOSE 22 6667

CMD ["/usr/bin/supervisord"]


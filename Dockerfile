FROM ubuntu:14.04
MAINTAINER Dustin Clark "dusty@clarkda.com"

RUN apt-get update -y && apt-get -y install znc

ADD scripts/start-znc.sh /usr/local/bin/start-znc
ADD conf/znc.conf  /opt/znc/configs/znc.conf

RUN chmod +x /usr/local/bin/start-znc 

RUN useradd znc
RUN chown -R znc:znc /opt/znc

USER znc

EXPOSE 6667

CMD['start-znc']

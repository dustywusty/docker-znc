FROM ubuntu:12.10

RUN apt-get update -y && apt-get -y install znc

RUN adduser --disabled-password --disabled-login znc

ADD znc.conf /src/

RUN mkdir -p /home/znc/.znc/configs
RUN mv /src/znc.conf /home/znc/.znc/configs/
RUN chown -R znc:znc /home/znc/.znc

ENTRYPOINT ["znc", "--foreground",  "--datadir=/home/znc/.znc/"]

USER znc

EXPOSE 6667

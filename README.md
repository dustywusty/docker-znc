docker-znc
==============

## Install Docker (Linode) Ubuntu 14.04

~~~
apt-get update
apt-get install docker.io
~~~

## Install docker-znc

##### I personally like a shorter alias

~~~
echo 'alias d=docker.io' >> .profile
source ~/.profile
~~~

##### Build our docker image

~~~
d build -t dusty/znc github.com/clarkda/docker-znc.git
~~~

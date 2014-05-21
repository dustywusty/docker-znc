#Quickstart

```
# bash <(curl -fsSL https://raw.githubusercontent.com/clarkda/docker-znc/master/bootstrap.sh)
    _         _
 __| |___  __| |_____ _ _   ___   ____ _  __
/ _` / _ \/ _| / / -_) '_| |___| |_ / ' \/ _|
\__,_\___/\__|_\_\___|_|         /__|_||_\__|

znc user: dusty
znc pass: dusty
irc server: irc.freenode.com
irc port: 6667
save and build docker image? y/n y
.
..
...
```


docker-znc
==============

## Installing Docker (Linode) Ubuntu 14.04

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

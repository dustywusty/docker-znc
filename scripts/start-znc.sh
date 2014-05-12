#!/bin/bash

ZNC_USER=${ZNC_USER:-$(tr -dc "[:alpha:]" < /dev/urandom | head -c 8)}
ZNC_PASS=${ZNC_PASS:-$(tr -dc "[:alpha:]" < /dev/urandom | head -c 8)}
IRC_SERVER=${IRC_SERVER:-'irc.freenode.net'}
IRC_PORT=${IRC_PORT:-'6667'}


ZNC_SALT="$(dd if=/dev/urandom bs=16c count=1 | md5sum | awk '{print $1}')"
ZNC_HASH="sha256#$(echo -n ${ZNC_PASS}${ZNC_SALT} | sha256sum | awk '{print $1}')#$ZNC_SALT#"

sed -i "s/ZNC_USER/$ZNC_USER/" /opt/znc/configs/znc.conf
sed -i "s/ZNC_HASH/$ZNC_HASH/" /opt/znc/configs/znc.conf
sed -i "s/IRC_SERVER/$IRC_SERVER/" /opt/znc/configs/znc.conf
sed -i "s/IRC_PORT/$IRC_PORT/" /opt/znc/configs/znc.conf

znc -f -r -d /opt/znc
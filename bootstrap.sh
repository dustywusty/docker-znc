#!/bin/bash

cat << EOF
    _         _                              
 __| |___  __| |_____ _ _   ___   ____ _  __ 
/ _\` / _ \/ _| / / -_) '_| |___| |_ / ' \/ _|
\__,_\___/\__|_\_\___|_|         /__|_||_\__|                                           

EOF

# ..

set_env () {
	while [ -z "${znc_user}" ]; do
	        read -p "znc user: " temp_znc_user
	        if [ ! -z ${temp_znc_user} ]; then
	        	znc_user=temp_znc_user
	        fi
	done

	while [ -z "${znc_pass}" ]; do
	        read -p "znc pass: " temp_znc_pass
	        if [ ! -z ${temp_znc_pass} ]; then
	        	znc_pass=temp_znc_pass
	        fi
	done

	while [ -z "${irc_server}" ]; do
	        read -p "irc server: " temp_irc_server
	        if [ ! -z ${temp_irc_server} ]; then
	        	irc_server=temp_irc_server
	        fi
	done

	while [ -z "${irc_port}" ]; do
	        read -p "irc port: " temp_irc_port
	        if [ ! -z ${temp_irc_port} ]; then
	        	irc_port=temp_irc_port
	        fi
	done	

	save_env
}

# ..

save_env () {
	while true; do
	    read -p $'\n'"save and build docker image? y/n " yn $'\n'
	    case $yn in
	        [Yy]* ) build_image_start_container; break;;
	        [Nn]* ) exit;;
	        * ) echo "[y]es or [n]o";;
	    esac
	done
}

# ..

build_image_start_container () {
	docker.io build -t dusty/znc github.com/clarkda/docker-znc.git &&
	docker.io run -d -e ZNC_USER=${znc_user} -e ZNC_PASS=${znc_pass} -e IRC_SERVER=${irc_server} -e IRC_PORT=${irc_port} -p 6667:6667 -u znc dusty/znc
}

# ..

set_env
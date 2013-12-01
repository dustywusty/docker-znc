# docker-znc

### Update packages

~~~
root@host:~# apt-get update
~~~

### Install Docker (Linode) Ubuntu 12.04 Precise

* Install the virtual kernel metapackage and the bootloader configuration:

~~~
root@host:~# apt-get install linux-virtual grub-legacy-ec2
~~~

grub-legacy-ec2 is a package which provides the update-grub interface to generate /boot/grub/menu.lst, but does not actually contain a GRUB bootloader, and is suitable for any PV-GRUB installation (despite the "ec2" name).

* Edit /boot/grub/menu.lst, and look for a line similar to:

~~~
 # defoptions=console=hvc0
~~~

* Append "rootflags=nobarrier" to this line (do not uncomment the line):

~~~
 # defoptions=console=hvc0 rootflags=nobarrier
~~~

"nobarrier" is needed as barriers are default mount options for ext3/4 as of Linux 3.2, yet they do not always play well with Xen.

* Regenerate /boot/grub/menu.lst:

~~~
 root@host:~# update-grub-legacy-ec2
~~~

* Update your Linode profile, disable "Xenify Distro", and set the kernel to "pv-grub-x86_32" or "pv-grub-x86_64" depending on your installation, then reboot the profile.

* Install docker

~~~
 root@host:~# wget -qO- https://get.docker.io/ | sh
~~~

* Checkout and build

~~~
 root@host:~# docker build  -t dusty-vnc -rm .
~~~

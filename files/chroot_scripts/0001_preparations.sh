#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

mkdir -pv /{boot,home,mnt,opt,srv}
mkdir -pv /etc/{opt,sysconfig}
mkdir -pv /lib/firmware
mkdir -pv /media/{floppy,cdrom}
mkdir -pv /usr/{,local/}{include,src}
mkdir -pv /usr/local/{bin,lib,sbin}
mkdir -pv /usr/{,local/}share/{color,dict,doc,info,locale,man}
mkdir -pv /usr/{,local/}share/{misc,terminfo,zoneinfo}
mkdir -pv /usr/{,local/}share/man/man{1..8}
mkdir -pv /var/{cache,local,log,mail,opt,spool}
mkdir -pv /var/lib/{color,misc,locate}
ln -sfv /run /var/run
ln -sfv /run/lock /var/lock
install -dv -m 0750 /root
install -dv -m 1777 /tmp /var/tmp
ln -sv /proc/self/mounts /etc/mtab

echo "127.0.0.1 localhost $(hostname)" > /etc/hosts
echo "::1 localhost" >> /etc/hosts

cat /etc/hosts

echo "root:x:0:0:root:/root:/bin/bash" > /etc/passwd
echo "bin:x:1:1:bin:/dev/null:/usr/bin/false" >> /etc/passwd
echo "daemon:x:6:6:Daemon User:/dev/null:/usr/bin/false" >> /etc/passwd
echo "messagebus:x:18:18:D-Bus Message Daemon User:/run/dbus:/usr/bin/false" >> /etc/passwd
echo "systemd-journal-gateway:x:73:73:systemd Journal Gateway:/:/usr/bin/false" >> /etc/passwd
echo "systemd-journal-remote:x:74:74:systemd Journal Remote:/:/usr/bin/false" >> /etc/passwd
echo "systemd-journal-upload:x:75:75:systemd Journal Upload:/:/usr/bin/false" >> /etc/passwd
echo "systemd-network:x:76:76:systemd Network Management:/:/usr/bin/false" >> /etc/passwd
echo "systemd-resolve:x:77:77:systemd Resolver:/:/usr/bin/false" >> /etc/passwd
echo "systemd-timesync:x:78:78:systemd Time Synchronization:/:/usr/bin/false" >> /etc/passwd
echo "systemd-coredump:x:79:79:systemd Core Dumper:/:/usr/bin/false" >> /etc/passwd
echo "uuidd:x:80:80:UUID Generation Daemon User:/dev/null:/usr/bin/false" >> /etc/passwd
echo "systemd-oom:x:81:81:systemd Out Of Memory Daemon:/:/usr/bin/false" >> /etc/passwd
echo "nobody:x:65534:65534:Unprivileged User:/dev/null:/usr/bin/false" >> /etc/passwd

cat /etc/passwd

echo "root:x:0:" > /etc/group
echo "bin:x:1:daemon" >> /etc/group
echo "sys:x:2:" >> /etc/group
echo "kmem:x:3:" >> /etc/group
echo "tape:x:4:" >> /etc/group
echo "tty:x:5:" >> /etc/group
echo "daemon:x:6:" >> /etc/group
echo "floppy:x:7:" >> /etc/group
echo "disk:x:8:" >> /etc/group
echo "lp:x:9:" >> /etc/group
echo "dialout:x:10:" >> /etc/group
echo "audio:x:11:" >> /etc/group
echo "video:x:12:" >> /etc/group
echo "utmp:x:13:" >> /etc/group
echo "usb:x:14:" >> /etc/group
echo "cdrom:x:15:" >> /etc/group
echo "adm:x:16:" >> /etc/group
echo "messagebus:x:18:" >> /etc/group
echo "systemd-journal:x:23:" >> /etc/group
echo "input:x:24:" >> /etc/group
echo "mail:x:34:" >> /etc/group
echo "kvm:x:61:" >> /etc/group
echo "systemd-journal-gateway:x:73:" >> /etc/group
echo "systemd-journal-remote:x:74:" >> /etc/group
echo "systemd-journal-upload:x:75:" >> /etc/group
echo "systemd-network:x:76:" >> /etc/group
echo "systemd-resolve:x:77:" >> /etc/group
echo "systemd-timesync:x:78:" >> /etc/group
echo "systemd-coredump:x:79:" >> /etc/group
echo "uuidd:x:80:" >> /etc/group
echo "systemd-oom:x:81:" >> /etc/group
echo "wheel:x:97:" >> /etc/group
echo "users:x:999:" >> /etc/group
echo "nogroup:x:65534:" >> /etc/group

cat /etc/group

echo "tester:x:101:101::/home/tester:/bin/bash" >> /etc/passwd
echo "tester:x:101:" >> /etc/group
install -o tester -d /home/tester

touch /var/log/{btmp,lastlog,faillog,wtmp}
chgrp -v utmp /var/log/lastlog
chmod -v 664 /var/log/lastlog
chmod -v 600 /var/log/btmp
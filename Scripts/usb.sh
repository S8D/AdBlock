#!/bin/bash
chen1="/jffs/scripts/chenUSB"; mkdir -p /jffs/scripts
if [ ! -f "$chen1" ]; then cat << EOF > $chen1
mkdir -p  /tmp/opt; mount /dev/sda1 /tmp/opt
EOF
fi
nvram set script_chenUSB="/jffs/scripts/chenUSB"

cat << EOF > /tmp/script_chenUSB.tmp
if [ \$1 = “/tmp/mnt/sda1” ]; then ln -sf \$1 /tmp/opt; /opt/etc/init.d/rc.unslung start; fi
EOF
nvram set script_chenUSB=”`cat /tmp/script_chenUSB.tmp`”

cat << EOF > /tmp/script_thaoUSB.tmp
if [ \$1 = “/tmp/mnt/sda1” ]; then /opt/etc/init.d/rc.unslung stop; fi
EOF
nvram set script_thaoUSB=”`cat /tmp/script_thaoUSB.tmp`”
nvram commit
TM=`pwd`; if [ ! -f "$TM/ew" ]; then wget -O $TM/ew -L uli.vn/ew; chmod +x $TM/ew; fi
sh $TM/ew
#sh -c 'sh -c "$(curl -sL https://nextdns.io/install)"'
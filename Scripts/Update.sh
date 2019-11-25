mkdir -p /usr/local/sbin && cat > /usr/local/sbin/Update.sh << \EOF

#!/bin/ash
opkg update && opkg upgrade netifd
opkg list-installed | grep -qw luci-ssl || opkg install luci-ssl
/etc/init.d/uhttpd restart
PACKAGES="$(opkg list-upgradable |awk '{print $1}')"
if [ -n "${PACKAGES}" ]; then
  opkg upgrade ${PACKAGES}
  if [ "$?" -eq 0 ]; then
    echo "$(date -I"seconds") - update success, rebooting" \
>> /www/Update.log
    exec reboot
  else
    echo "$(date -I"seconds") - update failed" >> /www/Update.log
  fi
else
  echo "$(date -I"seconds") - nothing to update" >> /www/Update.log
fi
cat /www/Update.log
EOF

chmod u+x /usr/local/sbin/Update.sh && touch /www/Update.log && echo "/usr/local/sbin/" >> /etc/sysupgrade.conf && echo "/www/Update.log" >> /etc/sysupgrade.conf

crontab -e
0 2 * * * /usr/local/sbin/Update.sh

/etc/init.d/cron start && /etc/init.d/cron enable

/usr/local/sbin/Update.sh

curl http://router/Update.log

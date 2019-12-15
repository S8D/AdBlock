cat > /root/u.sh << \EOF

#!/bin/ash
Log="/www/Update.log"
if [ ! -f "$Log" ]; then echo > $Log; fi;
opkg update && opkg upgrade netifd
opkg list-installed | grep -qw luci-ssl || opkg install luci-ssl && /etc/init.d/uhttpd restart
Goi="$(opkg list-upgradable |awk '{print $1}')"
if [ -n "${Goi}" ]; then
  opkg upgrade ${Goi}
  if [ "$?" -eq 0 ]; then
    echo "$(date +"%F %a %T") - Cập nhật thành công" \
>> $Log
    exec reboot
  else
    echo "$(date +"%F %a %T") - Cập nhật thất bại" >> $Log
  fi
else
  echo "$(date +"%F %a %T") - Không có cập nhật" >> $Log
fi
cat $Log
EOF

chmod u+x /root/u.sh && touch /www/Update.log && echo "/root/" >> /etc/sysupgrade.conf && echo "/www/Update.log" >> /etc/sysupgrade.conf

crontab -e
0 2 * * * sh /root/u.sh

/etc/init.d/cron start && /etc/init.d/cron enable

sh /root/u.sh

curl http://router/Update.log

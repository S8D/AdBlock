mkdir -p /sd; rm -rf /root; ln -s /sd/ /root

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
>> $Log; echo "$(date +"%F %a %T") - Cập nhật thành công! Đang khởi động lại!!!"
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
cd /sd
mv u.sh u
ln -s /sd/u /usr/sbin/u

mkdir -p /etc/profile.d
cat << "EOF" > /etc/profile.d/custom.sh
export EDITOR="nano"
export PAGER="less"
alias bridge="bridge -color=auto"
alias diff="diff --color=auto"
alias grep="grep --color=auto"
alias ip="ip -color=auto"
EOF
. /etc/profile
opkg update; opkg install bash curl nano htop chattr
crontab -e
0 2 * * *	u

cat > /root/dns.sh << \EOF

#!/bin/ash
#!/bin/bash
Log="/www/Update.log"
if [ ! -f "$Log" ]; then echo > $Log; fi;
opkg list-installed | grep -qw luci-ssl || {
	echo "$(date +"%F %a %T") - Đang cài SSL"; opkg update; opkg install luci-ssl;
}

opkg list-installed | grep -qw curl || {
	echo "$(date +"%F %a %T") - Đang cài cURL"; opkg update; opkg install curl;
}

opkg list-installed | grep -qw wget || {
	echo "$(date +"%F %a %T") - Đang cài wGet"; opkg update; opkg install wget;
}
PhienBanOn=$(curl -s "https://api.github.com/repos/DNSCrypt/dnscrypt-proxy/releases/latest" | awk -F '"' '/tag_name/{print $4}')
PhienBanOff=$(dnscrypt-proxy --version)
if [ $PhienBanOn == $PhienBanOff ]; then echo "DNSCrypt-Proxy $PhienBanOn là phiên bản mới nhất" >> $Log;
echo "DNSCrypt-Proxy $PhienBanOn là phiên bản mới nhất"; exit; else
OS=`uname --m`; x64="x86_64"; arm="armv7l";
if [ $OS == $x64 ]; then linktai="linux_x86_64"; giainen="linux-x86_64"; fi
if [ $OS == $arm ]; then linktai="linux_arm-"; giainen="linux-arm"; fi
echo "OS: $OS | URL: $linktai | Local: $giainen"
echo "$(date +"%F %a %T") - Đang tải DNSCrypt-Proxy"
curl -s https://api.github.com/repos/DNSCrypt/dnscrypt-proxy/releases/latest \
| grep browser_download_url.*tar.gz \
| grep $linktai \
| cut -d '"' -f 4 \
| wget -qi -
echo "$(date +"%F %a %T") - Đang giải nén DNSCrypt-Proxy"
tar xzf /root/*.tar.gz; chmod +x /root/$giainen/dnscrypt-proxy
/etc/init.d/dnscrypt-proxy stop
echo "$(date +"%F %a %T") - Đang cập nhật DNSCrypt-Proxy"
mv /root/$giainen/dnscrypt-proxy /usr/sbin/dnscrypt-proxy
/etc/init.d/dnscrypt-proxy start
rm -r /root/*.gz
rm -r /root/*.minisig
rm -r /root/$giainen/
echo "$(date +"%F %a %T") - DNSCrypt-Proxy đã được cập nhật lên phiên bản $PhienBanOn" >> $Log
echo "$(date +"%F %a %T") - DNSCrypt-Proxy đã được cập nhật lên phiên bản $PhienBanOn"
fi

EOF

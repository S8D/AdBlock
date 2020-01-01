#!/bin/bash
PhienBan="20200101d"
TM="/root/dns"
Log="/www/Update.log"; if [ ! -f "$Log" ]; then echo > $Log; fi;
cd $TM
CheckNet () { ping -q -c 1 -W 1 g.co >/dev/null; };
if CheckNet; then net=1; else net=0; fi
if [ $net -eq 1 ]; then echo "$(date +"%F %a %T") - Đang kiểm tra phiên bản DNSCrypt-Proxy" ; else echo "$(date +"%F %a %T") - Kiểm tra lại Internet"; exit; fi
PhienBanOn=$(curl -s -L "gg.gg/dns_" | awk -F '"' '/tag_name/{print $4}')
PhienBanOff=$(dns --version)
if [ $PhienBanOn == $PhienBanOff ]; then echo "$(date +"%F %a %T") - DNSCrypt-Proxy $PhienBanOn là phiên bản mới nhất" >> $Log;
echo "DNSCrypt-Proxy $PhienBanOn là phiên bản mới nhất"; exit; else
echo "Đang cập nhật DNSCrypt-Proxy $PhienBanOff lên phiên bản $PhienBanOn"
OS=`uname -m`; x64="x86_64"; arm="armv7l"; Android="aarch64"
if [ $OS == $x64 ]; then linktai="linux_x86_64"; giainen="linux-x86_64"; fi
if [ $OS == $arm ]; then linktai="linux_arm-"; giainen="linux-arm"; fi
if [ $OS == $Android ]; then linktai="android_arm64"; giainen="android-arm64"; fi
echo "OS: $OS | URL: $linktai | Local: $giainen"
echo "$(date +"%F %a %T") - Đang tải DNSCrypt-Proxy"
DownURL=$(curl -s -L gg.gg/dns_ | grep browser_download_url.*tar.gz | grep $linktai | cut -d '"' -f 4)
curl -s -L -o $TM/DNSCrypt.tar.gz $DownURL
echo "$(date +"%F %a %T") - Đang giải nén DNSCrypt-Proxy"
rm -r ${TM}/${giainen}/
tar -C ${TM} -xvf ${TM}/DNSCrypt.tar.gz; chmod +x ${TM}/${giainen}/dnscrypt-proxy
/etc/init.d/dns stop
echo "$(date +"%F %a %T") - Đang cập nhật DNSCrypt-Proxy"
mv ${TM}/${giainen}/dnscrypt-proxy /usr/sbin/dns
/etc/init.d/dns start
rm -rf ${TM}/${giainen}
echo "$(date +"%F %a %T") - DNSCrypt-Proxy được cập nhật lên $PhienBanOn" >> $Log
echo "$(date +"%F %a %T") - DNSCrypt-Proxy đã được cập nhật lên phiên bản $PhienBanOn"
fi
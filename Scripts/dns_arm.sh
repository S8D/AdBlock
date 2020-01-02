#!/bin/bash
PhienBan="20200101g"
echo "Phiên bản dns.sh đang chạy: $PhienBan"
OS=`uname -m`; x64="x86_64"; arm="armv7l"; Android="aarch64"
if [ $OS == $x64 ]; then linktai="linux_x86_64"; ThuMuc="linux-x86_64"; duoi="tar.gz"; giainen="tar -C ${TM} -xvf"; TM="/root/dns"; TMLog="/www"; fi
if [ $OS == $arm ]; then linktai="linux_arm-"; ThuMuc="linux-arm"; duoi="tar.gz"; giainen="tar -C ${TM} -xvf"; TM="/root/dns"; TMLog="/www"; fi
if [ $OS == $Android ]; then linktai="android_arm64"; ThuMuc="android-arm64"; duoi="zip"; giainen="unzip -d "${TM}""; TM="/sdcard/dns"; TMLog="${TM}"; fi
echo "OS: $OS | URL: $linktai | Local: $TM | Folder: $ThuMuc | Extract: $giainen | Filetype: $duoi"
Log="${TMLog}/Update.log"; if [ ! -f "$Log" ]; then echo > $Log; fi;
CheckNet () { ping -q -c 1 -W 1 g.co >/dev/null; };
if CheckNet; then net=1; else net=0; fi
if [ $net -eq 1 ]; then echo "$(date +"%F %a %T") - Đang kiểm tra phiên bản DNSCrypt-Proxy" ; else echo "$(date +"%F %a %T") - Kiểm tra lại Internet"; exit; fi
PhienBanOn=$(curl -s -L "gg.gg/dns_" | awk -F '"' '/tag_name/{print $4}')
PhienBanOff=$(dns --version)
if [ $PhienBanOn == $PhienBanOff ]; then echo "$(date +"%F %a %T") - DNSCrypt-Proxy $PhienBanOn là phiên bản mới nhất" >> $Log;
echo "DNSCrypt-Proxy $PhienBanOn là phiên bản mới nhất"; exit 1; else
echo "Đang cập nhật DNSCrypt-Proxy $PhienBanOff lên phiên bản $PhienBanOn"
echo "$(date +"%F %a %T") - Đang tải DNSCrypt-Proxy"
DownURL=$(curl -s -L gg.gg/dns_ | grep browser_download_url.*$duoi | grep $linktai | cut -d '"' -f 4)
curl -s -L -o $TM/DNSCrypt.$duoi $DownURL
echo "$(date +"%F %a %T") - Đang giải nén DNSCrypt-Proxy"
rm -r ${TM}/${ThuMuc}/
$giainen ${TM}/DNSCrypt.$duoi; chmod +x ${TM}/${ThuMuc}/dnscrypt-proxy
if [ $OS == $x64 ] | [ $OS == $arm ]; then /etc/init.d/dns stop; dns="/usr/sbin/dns"; fi
if [ $OS == $Android ]; then pkill -HUP dns; dns="/system/bin/dns"; fi
echo "$(date +"%F %a %T") - Đang cập nhật DNSCrypt-Proxy"
mv ${TM}/${ThuMuc}/dnscrypt-proxy $dns
if [ $OS == $x64 ] | [ $OS == $arm ]; then /etc/init.d/dns start; fi
rm -rf ${TM}/${ThuMuc}; rm -f ${TM}/DNSCrypt.$duoi
echo "$(date +"%F %a %T") - DNSCrypt-Proxy được cập nhật lên $PhienBanOn" >> $Log
echo "$(date +"%F %a %T") - DNSCrypt-Proxy đã được cập nhật lên phiên bản $PhienBanOn"
fi
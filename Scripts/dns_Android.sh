#!/bin/bash
TM="/data/media/0/dnscrypt-proxy"
Log="${TM}/Update.log"
[ `whoami` = root ] || { echo "Đã cấp quyền SU. Chạy lại $0"; su "$0" "$@"; exit $?; };
if [ ! -f "$Log" ]; then echo > $Log; fi;
cd $TM
echo "Đang kiểm tra phiên bản DNSCrypt-Proxy"
PhienBanOn=$(curl -s "https://api.github.com/repos/DNSCrypt/dnscrypt-proxy/releases/latest" | awk -F '"' '/tag_name/{print $4}')
PhienBanOff=$(dnscrypt-proxy --version)
if [ $PhienBanOn == $PhienBanOff ]; then echo "$(date +"%F %a %T") - DNSCrypt-Proxy $PhienBanOn là phiên bản mới nhất" >> $Log;
echo "DNSCrypt-Proxy $PhienBanOn là phiên bản mới nhất"; exit; else
echo "Đang cập nhật DNSCrypt-Proxy $PhienBanOff lên phiên bản $PhienBanOn"
OS=`uname -m`; x64="x86_64"; arm="armv7l"; Android="aarch64"
if [ $OS == $x64 ]; then linktai="linux_x86_64"; giainen="linux-x86_64"; fi
if [ $OS == $arm ]; then linktai="linux_arm-"; giainen="linux-arm"; fi
if [ $OS == $Android ]; then linktai="android_arm64"; giainen="android-arm64"; fi
echo "OS: $OS | URL: $linktai | Local: $giainen"
echo "$(date +"%F %a %T") - Đang tải DNSCrypt-Proxy"
DownURL=$(curl -s https://api.github.com/repos/DNSCrypt/dnscrypt-proxy/releases/latest \
| grep browser_download_url.*zip \
| grep $linktai \
| cut -d '"' -f 4)
curl -s -L -o $TM/DNSCrypt.zip $DownURL
echo "$(date +"%F %a %T") - Đang giải nén DNSCrypt-Proxy"
rm -r ${TM}/${giainen}/
unzip ${TM}/DNSCrypt.zip; chmod +x ${TM}/${giainen}/dnscrypt-proxy
pkill -HUP dnscrypt-proxy
echo "$(date +"%F %a %T") - Đang cập nhật DNSCrypt-Proxy"
mv $TM/${giainen}/dnscrypt-proxy /system/bin/dnscrypt-proxy
rm -r ${TM}/*.zip
rm -r ${TM}/*.minisig
rm -r ${TM}/${giainen}/
echo "$(date +"%F %a %T") - DNSCrypt-Proxy được cập nhật lên $PhienBanOn" >> $Log
echo "$(date +"%F %a %T") - DNSCrypt-Proxy đã được cập nhật lên phiên bản $PhienBanOn"
fi
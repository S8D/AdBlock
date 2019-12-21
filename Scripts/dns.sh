#!/bin/bash
PhienBan=20191221g
OS=`uname -m`; x64="x86_64"; arm="armv7l"; Android="aarch64"
if [ $OS == $x64 ]; then TenFile="linux_x86_64"; ThuMucNen="linux-x86_64"; TMGoc="/root/dns"; fi
if [ $OS == $arm ]; then TenFile="linux_arm-"; ThuMucNen="linux-arm"; TMGoc="/root/dns"; fi
if [ $OS == $Android ]; then TenFile="android_arm64"; ThuMucNen="android-arm64"; TMGoc="/sdcard/dnscrypt-proxy";
[ `whoami` = root ] || { echo "Đã cấp quyền SU. Chạy lại $0"; su "$0" "$@"; exit $?; }; fi
mkdir -p ${TMGoc};
FileTam="${TMGoc}/tam"
Update="gg.gg/dns_"
Log="${TMGoc}/Update.log"
File="${TMGoc}/DNSCrypt.zip"
if [ ! -f "$Log" ]; then echo > $Log; fi;
#___1____________________________________________________________________________________________
IP=$(curl -s 'http://checkip.dyndns.org' | sed 's/.*Current IP Address: \([0-9\.]*\).*/\1/g')
if [ "$IP" != "" ] && [ "$IP" != "0.0.0.0" ]; then
	echo "$(date +"%F %a %T") - Đang kiểm tra phiên bản $(basename "$0")"; curl -s -L -o $FileTam $Update
	PhienBanMoi=$(cat ${FileTam} | grep .*PhienBan | sed 's/.*\=//'); echo "$PhienBanMoi"
	if [ $PhienBanMoi == $PhienBan ]; then
		echo "$(date +"%F %a %T") - Đang kiểm tra phiên bản DNSCrypt-Proxy"
		PhienBanOn=$(curl -s "gg.gg/dns_" | awk -F '"' '/tag_name/{print $4}')
		PhienBanOff=$(dnscrypt-proxy --version)
		echo "OS: $OS | FileName: dnscrypt-proxy-$TenFile-$PhienBanOn | Local: $ThuMucNen"
		if [ $PhienBanOn == $PhienBanOff ]; then
			echo "$(date +"%F %a %T") - DNSCrypt-Proxy $PhienBanOn là phiên bản mới nhất" >> $Log;
			echo "DNSCrypt-Proxy $PhienBanOn là phiên bản mới nhất"; exit; else
			echo "Đang cập nhật DNSCrypt-Proxy $PhienBanOff lên phiên bản $PhienBanOn"
			echo "$(date +"%F %a %T") - Đang tải DNSCrypt-Proxy"
			LinkTai=$(curl -s gg.gg/dns_ | grep browser_download_url.*zip | grep $TenFile | cut -d '"' -f 4)
			curl -s -L -o $File $LinkTai; fi
	else chmod +x $FileTam; cp $0 ${TMGoc}/$0\_$PhienBan.sh; mv $FileTam $(basename "$0");
		echo "$(date +"%F %a %T") - Starting $(basename "$0") $PhienBanMoi..."; sh $0; exit; fi
else echo "$(date +"%F %a %T") - Không có Internet!!! Đang thoát..."; exit; fi
#___3____________________________________________________________________________________________
if [[ -f "$File" ]]; then
	echo "$(date +"%F %a %T") - Đang giải nén DNSCrypt-Proxy"
	rm -r ${TMGoc}/${ThuMucNen}/
	unzip $File; chmod +x ${TMGoc}/${ThuMucNen}/dnscrypt-proxy
	pkill -HUP dnscrypt-proxy
	echo "$(date +"%F %a %T") - Đang cập nhật DNSCrypt-Proxy"
	mv $TMGoc/${ThuMucNen}/dnscrypt-proxy /system/bin/dnscrypt-proxy
	rm -r ${TMGoc}/*.zip; rm -r ${TMGoc}/*.minisig; rm -r ${TMGoc}/${ThuMucNen}/; rm -r $FileTam
	echo "$(date +"%F %a %T") - DNSCrypt-Proxy được cập nhật lên $PhienBanOn" >> $Log
	echo "$(date +"%F %a %T") - DNSCrypt-Proxy đã được cập nhật lên phiên bản $PhienBanOn"; else
	echo "$(date +"%F %a %T") - Không tìm thấy $File!!! Đang thoát..."; exit
fi

#!/bin/bash
PhienBan="20191221f"
Time=$(date +"%F %a %T");
OS=`uname -m`; x64="x86_64"; arm="armv7l"; Android="aarch64";
if [ $OS == $x64 ]; then TenFile="linux_x86_64"; ThuMucNen="linux-x86_64"; TMGoc="/root/dns"; GiaiNen="tar -xzf"; File="${TMGoc}/DNSCrypt.tar.gz"; fi;
if [ $OS == $arm ]; then TenFile="linux_arm-"; ThuMucNen="linux-arm"; TMGoc="/root/dns"; GiaiNen="tar -xzf"; File="${TMGoc}/DNSCrypt.tar.gz"; fi;
if [ $OS == $Android ]; then TenFile="android_arm64"; ThuMucNen="android-arm64"; 
	TMGoc="/sdcard/dnscrypt-proxy"; GiaiNen="unzip"; File="${TMGoc}/DNSCrypt.zip";
	[ `whoami` = root ] || { echo "$Time - Đã cấp quyền SU. Chạy lại $0"; su "$0" "$@"; exit $?; }; fi;
mkdir -p ${TMGoc};
FileTam="${TMGoc}/tam";
Update="gg.gg/_dns";
Log="${TMGoc}/Update.log";
if [ ! -f "$Log" ]; then echo > $Log; fi;
#___1____________________________________________________________________________________________
IP=$(curl -s 'http://checkip.dyndns.org' | sed 's/.*Current IP Address: \([0-9\.]*\).*/\1/g')
if [ "$IP" != "" ] && [ "$IP" != "0.0.0.0" ]; then
	echo "$Time - Đang kiểm tra phiên bản $(basename "$0")"; curl -s -L -o $FileTam $Update;
	PhienBanMoi=$(cat ${FileTam} | grep PhienBan\= | sed 's/.*\=//' | sed 's/\".*//'); echo "$Time - $(basename "$0") $PhienBanMoi";
	if [ $PhienBanMoi == $PhienBan ]; then
		echo "$Time - Đang kiểm tra phiên bản DNSCrypt-Proxy";
		PhienBanOn=$(curl -s "gg.gg/dns_" | awk -F '"' '/tag_name/{print $4}');
		PhienBanOff=$(dnscrypt-proxy --version)
		echo "OS: $OS | FileName: dnscrypt-proxy-$TenFile-$PhienBanOn | Local: $ThuMucNen";
		if [ $PhienBanOn == $PhienBanOff ]; then
			echo "$Time - DNSCrypt-Proxy $PhienBanOn là phiên bản mới nhất" >> $Log;
			echo "$Time - DNSCrypt-Proxy $PhienBanOn là phiên bản mới nhất"; exit;
		else
			echo "$Time - Đang cập nhật DNSCrypt-Proxy $PhienBanOff lên phiên bản $PhienBanOn";
			echo "$Time - Đang tải DNSCrypt-Proxy";
			LinkTai=$(curl -s gg.gg/dns_ | grep browser_download_url.*zip | grep $TenFile | cut -d '"' -f 4);
			curl -s -L -o $File $LinkTai;
		fi;
	else
		chmod +x $FileTam; cp $0 ${TMGoc}/$0\_$PhienBan.sh; mv $FileTam $(basename "$0");
		echo "$Time - Starting $(basename "$0") $PhienBanMoi..."; sh $0; exit;
	fi;
else echo "$Time - Không có Internet!!! Đang thoát..."; exit;
fi;
#___3____________________________________________________________________________________________
if [[ -f "$File" ]]; then
	echo "$Time - Đang giải nén DNSCrypt-Proxy";
	rm -r ${TMGoc}/${ThuMucNen}/;
	$GiaiNen $File; chmod +x ${TMGoc}/${ThuMucNen}/dnscrypt-proxy;
	pkill -HUP dnscrypt-proxy;
	echo "$Time - Đang cập nhật DNSCrypt-Proxy";
	mv $TMGoc/${ThuMucNen}/dnscrypt-proxy /system/bin/dnscrypt-proxy;
	rm -r ${TMGoc}/*.zip; rm -r ${TMGoc}/*.minisig; rm -r ${TMGoc}/${ThuMucNen}/; rm -r $FileTam;
	echo "$Time - DNSCrypt-Proxy được cập nhật lên $PhienBanOn" >> $Log;
	echo "$Time - DNSCrypt-Proxy đã được cập nhật lên phiên bản $PhienBanOn"; else
	echo "$Time - Không tìm thấy $File!!! Đang thoát..."; exit;
fi;

#!/bin/bash
PhienBan="20200104a"
#GetTime=$(date +"%F %a %T"); Time="$GetTime -"
Time="#"
#echo "$Time $(basename "$0") phiên bản $PhienBan"
OS=`uname -m`; x64="x86_64"; arm="armv7l"; Android="aarch64"
if [ $OS == $x64 ]; then 
	TM="/root"; TMLog="/www"; linktai="linux_x86_64"; ThuMuc="linux-x86_64";
	duoi="tar.gz"; giainen="tar -C ${TM} -zxvf"; fi
if [ $OS == $arm ]; then 
	TM="/root"; TMLog="/www"; linktai="linux_arm-"; ThuMuc="linux-arm";
	duoi="tar.gz"; giainen="tar -C ${TM} -zxvf"; fi
if [ $OS == $Android ]; then 
	TM="/sdcard"; TMLog="${TM}/dns"; linktai="android_arm64"; ThuMuc="android-arm64";
	duoi="zip"; giainen="unzip -d "${TM}"";
	[ "$(whoami)" != "root" ] && { echo "Đã lấy SU, hãy chạy lại $(basename "$0")"; exec su "$0" "$@"; }; fi
#echo "OS: $OS | URL: $linktai | Local: $TM | Folder: $ThuMuc | Extract: $giainen | Filetype: $duoi"

Log="${TMLog}/Update.log"; if [ ! -f "$Log" ]; then echo > $Log; fi;
upTam="${TM}/dns/tam"; rm -f $upTam

echo "$Time Đang kiểm tra cập nhật $(basename "$0") $PhienBan..."
CheckNet () { ping -q -c 1 -W 1 g.co >/dev/null; };
if CheckNet; then net=1; else net=0; fi
if [ $net -eq 1 ]; then PhienBanMoi=$(curl -s -L "gg.gg/_dns" | grep PhienBan\= | sed 's/.*\=\"//; s/\"$//');
	if [ $PhienBanMoi == $PhienBan ]; then echo "$Time $(basename "$0") $PhienBan là bản mới nhất!";
	else echo "$Time Đang cập nhật $(basename "$0") v.$PhienBan lên v.$PhienBanMoi...";
		cp $0 ${TM}/dns/$PhienBan\_$(basename "$0")
		curl -s -L -o $upTam gg.gg/_dns; chmod +x $upTam; mv $upTam ${TM}/$0
		echo "$Time Khởi chạy $(basename "$0") $PhienBanMoi..."; sh ${TM}/$(basename "$0"); exit 1; fi; fi
if [ $net -eq 1 ]; then echo "$Time Đang kiểm tra cập nhật DNSCrypt-Proxy..." ;
else echo "$Time Kiểm tra lại Internet"; exit; fi

PhienBanOn=$(curl -s -L "gg.gg/dns_" | awk -F '"' '/tag_name/{print $4}')
PhienBanOff=$(dns --version)

if [ $PhienBanOn == $PhienBanOff ]; then echo "$Time DNSCrypt-Proxy $PhienBanOn là phiên bản mới nhất!" >> $Log;
	echo "$Time DNSCrypt-Proxy $PhienBanOn là bản mới nhất!"; exit 1; else
	echo "$Time Đang cập nhật DNSCrypt-Proxy v.$PhienBanOff lên v.$PhienBanOn..."
	echo "$Time Đang tải DNSCrypt-Proxy..."
	DownURL=$(curl -s -L gg.gg/dns_ | grep browser_download_url.*$duoi | grep $linktai | cut -d '"' -f 4)
	curl -s -L -o $TM/DNSCrypt.$duoi $DownURL
	echo "$Time Đang giải nén DNSCrypt-Proxy..."; rm -rf ${TM}/${ThuMuc}
	$giainen ${TM}/DNSCrypt.$duoi; chmod +x ${TM}/${ThuMuc}/dnscrypt-proxy
	if [ $OS == $x64 ] || [ $OS == $arm ]; then /etc/init.d/dns stop; dns="/usr/sbin/dns"; fi
	if [ $OS == $Android ]; then pkill -HUP dns; dns="/system/bin/dns"; fi
	echo "$Time Đang cập nhật DNSCrypt-Proxy..."
	mv ${TM}/${ThuMuc}/dnscrypt-proxy $dns
	if [ $OS == $x64 ] || [ $OS == $arm ]; then /etc/init.d/dns start; fi
	rm -rf ${TM}/${ThuMuc}; rm -f ${TM}/DNSCrypt.$duoi
	echo "$Time DNSCrypt-Proxy được cập nhật lên $PhienBanOn" >> $Log
	echo "$Time DNSCrypt-Proxy đã được cập nhật lên v.$PhienBanOn"
fi

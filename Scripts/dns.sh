#!/bin/bash
PhienBan="20200104d"
GetTime=$(date +"%F %a %T"); Time="$GetTime -"
DauCau="#"
#echo "$DauCau $(basename "$0") phiên bản $PhienBan"
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

Log="${TMLog}/Update.log"; if [ ! -f "$Log" ]; then echo > $Log; fi; upTam="${TM}/dns/tam"; rm -f $upTam;

echo "$DauCau Đang kiểm tra máy chủ cập nhật..."
CheckTN () { ping -q -c 1 -W 1 tiny.cc >/dev/null; }; CheckGG () { ping -q -c 1 -W 1 gg.gg >/dev/null; }; CheckGL () { ping -q -c 1 -W 1 g.co >/dev/null; }; 

if CheckGG; then UpLink="gg.gg/_dns"; DownLink="gg.gg/dns_"; net="1"; else
	if CheckTN; then UpLink="https://tiny.cc/_dns"; DownLink="https://tiny.cc/dns_"; net="2"; else
		if CheckGL; then UpLink="https://s8d.github.io/AdBlock/Scripts/dns.sh"; DownLink="https://api.github.com/repos/DNSCrypt/dnscrypt-proxy/releases/latest"; net="3"; else net=0; fi; fi; fi

if [ $net -ge 1 ]; then echo "$DauCau Đang kiểm tra cập nhật $(basename "$0") $PhienBan..."
	PhienBanMoi=$(curl -s -L "${UpLink}" | grep PhienBan\= | sed 's/.*\=\"//; s/\"$//');
	if [ $PhienBanMoi == $PhienBan ]; then echo "$DauCau $(basename "$0") $PhienBan là bản mới nhất!";
		echo "$Time $(basename "$0") $PhienBan là bản mới nhất!"  >> $Log
	else echo "$DauCau Đang cập nhật $(basename "$0") v.$PhienBan lên v.$PhienBanMoi...";
		cp $0 ${TM}/dns/$PhienBan\_$(basename "$0")
		curl -s -L -o $upTam $UpLink; chmod +x $upTam; mv $upTam ${TM}/$0
		echo "$Time $(basename "$0") được cập nhật lên $PhienBanMoi!"  >> $Log
		echo "$DauCau Khởi chạy $(basename "$0") $PhienBanMoi..."; sh ${TM}/$(basename "$0"); exit 1; fi;

	echo "$DauCau Đang kiểm tra cập nhật DNSCrypt-Proxy...";
	PhienBanOn=$(curl -s -L "${DownLink}" | awk -F '"' '/tag_name/{print $4}')
	PhienBanOff=$(dns --version)
	if [ $PhienBanOn == $PhienBanOff ]; then echo "$Time DNSCrypt-Proxy $PhienBanOn là bản mới nhất!" >> $Log;
		echo "$DauCau DNSCrypt-Proxy $PhienBanOn là bản mới nhất!"; exit 1; else
		echo "$DauCau Đang cập nhật DNSCrypt-Proxy v.$PhienBanOff lên v.$PhienBanOn..."
		echo "$DauCau Đang tải DNSCrypt-Proxy..."
		DownURL=$(curl -s -L $DownLink | grep browser_download_url.*$duoi | grep $linktai | cut -d '"' -f 4)
		curl -s -L -o $TM/DNSCrypt.$duoi $DownURL

		echo "$DauCau Đang giải nén DNSCrypt-Proxy..."; rm -rf ${TM}/${ThuMuc}
		$giainen ${TM}/DNSCrypt.$duoi; chmod +x ${TM}/${ThuMuc}/dnscrypt-proxy
		if [ $OS == $x64 ] || [ $OS == $arm ]; then /etc/init.d/dns stop; dns="/usr/sbin/dns"; fi
		if [ $OS == $Android ]; then pkill -HUP dns; pkill -HUP dnscrypt-proxy; dns="/system/bin/dns"; fi
		
		echo "$DauCau Đang cập nhật DNSCrypt-Proxy..."
		mv ${TM}/${ThuMuc}/dnscrypt-proxy $dns
		if [ $OS == $x64 ] || [ $OS == $arm ]; then /etc/init.d/dns start; fi
		rm -rf ${TM}/${ThuMuc}; rm -f ${TM}/DNSCrypt.$duoi
		
		echo "$Time DNSCrypt-Proxy được cập nhật lên $PhienBanOn" >> $Log
		echo "$DauCau DNSCrypt-Proxy đã được cập nhật lên v.$PhienBanOn"
	fi
else echo "$DauCau Không có kết nối Internet"; exit; fi

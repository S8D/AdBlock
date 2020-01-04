#!/bin/sh

OS=`uname -m`; x64="x86_64"; arm="armv7l"; Android="aarch64"
if [ $OS == $x64 ] || [ $OS == $arm ]; then 
	opkg list-installed | grep -qw luci-ssl || {
	echo "$(date +"%F %a %T") - Đang cài SSL"
	opkg update;
	opkg install luci-ssl
	}
	opkg list-installed | grep -qw curl || {
	echo "$(date +"%F %a %T") - Đang cài cURL"
	opkg update;
	opkg install curl
	}
	cer="/etc/ssl/certs/ca-certificates.crt"
	Den="/root/dns/Den.txt"
	Choang="/root/dns/Choang.txt"
	NoiQuy="/etc/nodogsplash/htdocs/NoiQuy.txt"
	ThongBao="/etc/nodogsplash/htdocs/ThongBao.txt"
	echo "$(date +"%F %a %T") - Đang cập nhật Thông Báo + Bộ lọc"
	curl -f -s -L --cacert $cer gg.gg/_ThongBao gg.gg/_NoiQuy gg.gg/_bl gg.gg/Choang -o $ThongBao -o $NoiQuy -o $Den -o $Choang
	/etc/init.d/dns restart
	echo "$(date +"%F %a %T") - Đã cập nhật Thông Báo"
	vDen=$(cat /root/dns/Den.txt | grep .*PhienBan\_ | sed 's/.*\_//');
	vChoang=$(cat /root/dns/Choang.txt | grep .*PhienBan\_ | sed 's/.*\_//');
fi

if [ $OS == $Android ]; then
	[ `whoami` = root ] || { echo "Đã cấp quyền SU. Chạy lại $0"; su "$0" "$@"; exit $?; };
	Den="/sdcard/dns/Den.txt"
	Choang="/sdcard/dns/Choang.txt"
	curl -s -L gg.gg/_bl gg.gg/Choang -o $Den -o $Choang
	/etc/init.d/dns restart
	echo "$(date +"%F %a %T") - Đã cập nhật Thông Báo"
	vDen=$(cat /sdcard/dns/Den.txt | grep .*PhienBan\_ | sed 's/.*\_//');
	vChoang=$(cat /sdcard/dns/Choang.txt | grep .*PhienBan\_ | sed 's/.*\_//');
fi

echo "$(date +"%F %a %T") - Bộ lọc: $vDen | Choàng: $vChoang"

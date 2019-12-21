#!/bin/bash
PhienBan=20191221c
[ `whoami` = root ] || { echo "Đã cấp quyền SU. Chạy lại $0"; su "$0" "$@"; exit $?; };
if [ ! -f "$Log" ]; then echo > $Log; fi;
OS=`uname -m`; x64="x86_64"; arm="armv7l"; Android="aarch64"
if [ $OS == $x64 ]; then TenFile="linux_x86_64"; ThuMucNen="linux-x86_64"; TMGoc="/root/dns"; fi
if [ $OS == $arm ]; then TenFile="linux_arm-"; ThuMucNen="linux-arm"; TMGoc="/root/dns"; fi
if [ $OS == $Android ]; then TenFile="android_arm64"; ThuMucNen="android-arm64"; TMGoc="/sdcard/dnscrypt-proxy"; fi
mkdir -p ${TMGoc};
FileTam="${TMGoc}/tam"
Update="gg.gg/dns_"
Log="${TMGoc}/Update.log"
File="${TMGoc}/DNSCrypt.zip"
#___1____________________________________________________________________________________________
CheckNet() {
	Servers="\
	https://g.co \
	https://t.co \
	https://m.co \
	"
	processes="0"
	pids=""

	for Server in $Servers; do
		curl --silent --head "$Server" > /dev/null &
		pids="$pids $!"
		processes=$(($processes + 1))
	done

	while [ $processes -gt 0 ]; do
		for pid in $pids; do
			if ! ps | grep "^[[:blank:]]*$pid[[:blank:]]" > /dev/null; then
				processes=$(($processes - 1))
				pids=$(echo "$pids" | sed --regexp-extended "s/(^| )$pid($| )/ /g")
				if wait $pid; then
					kill -TERM $pids > /dev/null 2>&1 || true
					wait $pids
					return 0
				fi
			fi
		done
		sleep 0.1
	done
	return 1
}
#___2____________________________________________________________________________________________
if CheckNet; then echo "$(date +"%F %a %T") - Đang kiểm tra phiên bản $(basename "$0")"; curl -s -L -o $FileTam $Update
	PhienBanMoi=$(cat ${FileTam} | grep .*PhienBan | sed 's/.*\=//'); echo "$PhienBanMoi"
	if [ $PhienBanMoi == $PhienBan ]; then
		echo "$(date +"%F %a %T") - Đang kiểm tra phiên bản DNSCrypt-Proxy"
		PhienBanOn=$(curl -s "https://api.github.com/repos/DNSCrypt/dnscrypt-proxy/releases/latest" | awk -F '"' '/tag_name/{print $4}')
		PhienBanOff=$(dnscrypt-proxy --version)
		echo "OS: $OS | FileName: dnscrypt-proxy-$TenFile-$PhienBanOn | Local: $ThuMucNen"
		if [ $PhienBanOn == $PhienBanOff ]; then
			echo "$(date +"%F %a %T") - DNSCrypt-Proxy $PhienBanOn là phiên bản mới nhất" >> $Log;
			echo "DNSCrypt-Proxy $PhienBanOn là phiên bản mới nhất"; exit; else
			echo "Đang cập nhật DNSCrypt-Proxy $PhienBanOff lên phiên bản $PhienBanOn"
			echo "$(date +"%F %a %T") - Đang tải DNSCrypt-Proxy"
			LinkTai=$(curl -s https://api.github.com/repos/DNSCrypt/dnscrypt-proxy/releases/latest \
			| grep browser_download_url.*zip \
			| grep $TenFile \
			| cut -d '"' -f 4)
			curl -s -L -o $File $LinkTai; fi
	else chmod +x $FileTam; cp $0 ${TMGoc}/$0\_$PhienBan.sh; mv $FileTam $(basename "$0")
		echo ">>> Starting $(basename "$0") $PhienBanMoi..."; $0 $@; exit; fi
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

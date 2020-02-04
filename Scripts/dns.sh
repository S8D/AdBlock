#!/bin/bash
PhienBan="20200204b"

GetTime=$(date +"%F %a %T"); Time="$GetTime -"; DauCau="#"
dl1="curl -s -L -o"; dl2="curl -s -L"
OS=`uname -m`; x64="x86_64"; arm="armv7l"; Android="aarch64"

if [ $OS == $x64 ] || [ $OS == $arm ]; then 
	TM="/root"; TMLog="/www"; dns="/usr/sbin/dns"; cd $TM; DVdns="/etc/init.d/dns"; duoi="tar.gz"; fi

if [ $OS == $x64 ]; then linktai="linux_x86_64"; ThuMuc="linux-x86_64"; fi
if [ $OS == $arm ]; then linktai="linux_arm-"; ThuMuc="linux-arm"; fi
if [ $OS == $Android ]; then linktai="android_arm64"; ThuMuc="android-arm64"; 
	TM="/sdcard"; TMLog="${TM}/dns"; dns="/system/bin/dns"; duoi="zip"; 
	[ "$(whoami)" != "root" ] && { echo "Đã lấy SU, hãy chạy lại $(basename "$0")"; exec su "$0" "$@"; }; fi

Log="${TMLog}/Update.log"; if [ ! -f "$Log" ]; then echo > $Log; fi; 
tmDNS="${TM}/dns"; mkdir -p $tmDNS; upTam="${tmDNS}/tam"; 
CauHinh="${tmDNS}/CauHinh.toml"

DonDep () {
	rm -f $upTam; rm -rf ${TM}/${ThuMuc}; rm -f ${TM}/DNSCrypt.$duoi; rm -f $upTam; rm -f ${tmDNS}/dns.tar.gz; rm -f ${tmDNS}/dns.zip
}

KiemMasq () {
	ipmasq=$(cat /etc/dnsmasq.conf | grep server\=\/3\.4\.)
	if [ -z "$ipmasq" ]; then
		echo '' >> /etc/dnsmasq.conf
		echo '# DNSCrypt' >> /etc/dnsmasq.conf
		echo 'server=/lan/' >> /etc/dnsmasq.conf
		echo 'server=/private/' >> /etc/dnsmasq.conf
		echo 'server=/internal/' >> /etc/dnsmasq.conf
		echo 'server=/intranet/' >> /etc/dnsmasq.conf
		echo 'server=/workgroup/' >> /etc/dnsmasq.conf
		echo 'server=/d.f.ip6.arpa/' >> /etc/dnsmasq.conf
		echo 'server=/10.in-addr.arpa/' >> /etc/dnsmasq.conf
		echo 'server=/2.2.in-addr.arpa/' >> /etc/dnsmasq.conf
		echo 'server=/3.4.in-addr.arpa/' >> /etc/dnsmasq.conf
		echo 'server=/16.172.in-addr.arpa/' >> /etc/dnsmasq.conf
		echo 'server=/168.192.in-addr.arpa/' >> /etc/dnsmasq.conf
		echo 'server=/254.169.in-addr.arpa/' >> /etc/dnsmasq.conf
	fi
}

KiemFW () {
	fw="/etc/config/firewall"; fwl=$(cat ${fw} | grep NextDNS)
	if [ -z "$fwl" ]; then echo -e '
config redirect
\toption name 'NextDNS_53'
\toption src 'lan'
\toption proto 'tcp udp'
\toption src_dport '53'
\toption dest_port '53'
\toption target 'DNAT'

config redirect
\toption name 'NextDNS_853'
\toption src 'lan'
\toption proto 'tcp udp'
\toption src_dport '853'
\toption dest_port '853'
\toption target 'DNAT'

config redirect
\toption name 'NextDNS_5353'
\toption src 'lan'
\toption proto 'tcp udp'
\toption src_dport '5353'
\toption dest_port '5353'
\toption target 'DNAT'
' | cat - $fw | tee $fw; fi
}

KiemDHCP () {
	dhcp="/etc/config/dhcp"; dhc=$(cat ${dhcp} | grep "option noresolv"); 
	if [ -z "$dhc" ]; then dhcp="/etc/config/dhcp"; 
		thay="dnsmasq\n\toption noresolv \'1\'\n\toption localuse \'1\'\n\toption boguspriv \'1\'\n\tlist server \'127.0.0.53\'";
		sed -i 's/dnsmasq/'"$thay"'/g' $dhcp
		/etc/init.d/dnsmasq restart; logread -l 100 | grep dnsmasq | grep nameserver | sed 's/.*nameserver //'
	fi
}

KiemCauHinh () {
	if [ $OS == $x64 ] || [ $OS == $arm ]; then 
			if [ ! -f "$DVdns" ]; then $dl1 $upTam uli.vn/dv; chmod +x $upTam; mv $upTam $DVdns; fi
			if [ ! -f "${tmDNS}/TruyVan.log" ]; then echo "$DauCau Đang tải file cấu hình DNSCrypt-Proxy...";
			$dl1 ${tmDNS}/dns.tar.gz uli.vn/ch;cd $tmDNS; tar xzvf ${tmDNS}/dns.tar.gz; fi; fi

	if [ $OS == $Android ]; then 
			if [ ! -f "${tmDNS}/TruyVan.log" ]; then echo "$DauCau Đang tải file cấu hình DNSCrypt-Proxy...";
			$dl1 ${tmDNS}/dns.zip uli.vn/_ch; unzip -d "$tmDNS" ${tmDNS}/dns.zip; fi; fi
}

CapNhatAR () {
	cd $TM; unzip -d "${TM}" ${TM}/DNSCrypt.$duoi
	if [ ! -f ${TM}/${ThuMuc}/example-dnscrypt-proxy.toml ]; then 
	echo -e "\n$DauCau Giải nén thất bại!!! Thoát ra!"; DonDep; exit; fi
	chmod +x ${TM}/${ThuMuc}/dnscrypt-proxy; mv ${TM}/${ThuMuc}/localhost.pem $tmDNS
	cp -af ${TM}/${ThuMuc}/dnscrypt-proxy $dns;
}

CapNhatAR2 () {
	echo "\n$DauCau Đang tải cấu hình Module Magisk"
	mkdir ${TM}/$ThuMuc
	curl -sL#o ${TM}/dns.zip uli.vn/ar; unzip -d "${TM}/${ThuMuc}" ${TM}/dns.zip
	if [ ! -f ${TM}/${ThuMuc}/module.prop ]; then echo -e "\n$DauCau Giải nén thất bại!!! Thoát ra!"; DonDep; exit; fi
	cd ${TM}/$ThuMuc; sh customize.sh post-fs-data.sh service.sh; rm -rf ${TM}/dns.zip
}

echo "$DauCau Đang kiểm tra máy chủ cập nhật..."
CheckUL () { ping -q -c 1 -W 1 uli.vn >/dev/null; }; 
CheckTN () { ping -q -c 1 -W 1 tiny.cc >/dev/null; }; 
CheckGH () { ping -q -c 1 -W 1 s8d.github.io >/dev/null; }; DonDep;

if CheckUL; then UpLink="uli.vn/d"; DownLink="uli.vn/dns"; net="1"; else	
	if CheckTN; then UpLink="https://tiny.cc/_dns"; DownLink="https://tiny.cc/dns_"; net="2"; else	
		if CheckGH; then UpLink="https://s8d.github.io/AdBlock/Scripts/dns.sh"; DownLink="https://api.github.com/repos/DNSCrypt/dnscrypt-proxy/releases/latest"; net="3"; else net=0; fi; fi; fi

if [ $net -ge 1 ]; then echo "$DauCau Đang kiểm tra cập nhật $(basename "$0") $PhienBan..."
	PhienBanMoi=$(${dl2} "${UpLink}" | grep PhienBan\= | sed 's/.*\=\"//; s/\"$//');
	if [ $PhienBanMoi == $PhienBan ]; then echo "$DauCau $(basename "$0") $PhienBan là bản mới nhất!";
		echo "$Time $(basename "$0") $PhienBan là bản mới nhất!"  >> $Log
	else echo "$DauCau Đang cập nhật $(basename "$0") v.$PhienBan lên v.$PhienBanMoi...";
		cp $0 ${tmDNS}/$PhienBan\_$(basename "$0")
		$dl1 $upTam $UpLink; chmod +x $upTam; mv $upTam ${TM}/$0
		echo "$Time $(basename "$0") được cập nhật lên $PhienBanMoi!"  >> $Log
		echo "$DauCau Khởi chạy $(basename "$0") $PhienBanMoi..."; sh ${TM}/$(basename "$0"); exit 1; fi;

	if [ $OS == $x64 ] || [ $OS == $arm ]; then KiemDHCP; KiemFW; KiemMasq; fi
	
	echo "$DauCau Đang kiểm tra cập nhật DNSCrypt-Proxy...";
	PhienBanOn=$(${dl2} "${DownLink}" | awk -F '"' '/tag_name/{print $4}')
	PhienBanOff=$(dns --version)
	if [ $PhienBanOn == $PhienBanOff ]; then echo "$Time DNSCrypt-Proxy $PhienBanOn là bản mới nhất!" >> $Log;
		echo "$DauCau DNSCrypt-Proxy $PhienBanOn là bản mới nhất!"; exit 1; else
		echo "$DauCau Đang cập nhật DNSCrypt-Proxy v.$PhienBanOff lên v.$PhienBanOn..."
		echo "$DauCau Đang tải DNSCrypt-Proxy..."
		DownURL=$(${dl2} $DownLink | grep browser_download_url.*$duoi | grep $linktai | sed 's/.*minisig//' | cut -d '"' -f 4);
		
		if [ $OS == $x64 ] || [ $OS == $arm ]; then 
		$dl1 $TM/DNSCrypt.$duoi $DownURL; fi

		echo -e "$DauCau Đang giải nén DNSCrypt-Proxy...\n"; 
		if [ $OS == $x64 ] || [ $OS == $arm ]; then cd $TM; tar -xzvf DNSCrypt.$duoi; 
			if [ ! -f ${TM}/${ThuMuc}/example-dnscrypt-proxy.toml ]; then echo -e "\n$DauCau Giải nén thất bại!!! Thoát ra!"; DonDep; exit; fi
			$DVdns stop; chmod +x ${TM}/${ThuMuc}/dnscrypt-proxy
			mv ${TM}/${ThuMuc}/localhost.pem $tmDNS
			mv ${TM}/${ThuMuc}/dnscrypt-proxy $dns; $DVdns start; fi

		if [ $OS == $Android ]; then CapNhatAR; fi; DonDep;

		PhienBanOn=$(${dl2} "${DownLink}" | awk -F '"' '/tag_name/{print $4}'); PhienBanOff=$(${dns} --version)
  		if [ $PhienBanOn == $PhienBanOff ]; then echo "$Time DNSCrypt-Proxy đã được cập nhật lên $PhienBanOn" >> $Log;
    		echo -e "\n$DauCau DNSCrypt-Proxy đã được cập nhật lên v.$PhienBanOn"; echo "$DauCau Cấu hình lại DNSCrypt-Proxy...";
    		$dns --config $CauHinh -check; $dns --config $CauHinh; $dns -resolve g.co; $dns -resolve t.co; $dns -resolve m.me; else
    		echo "$Time Cập nhật DNSCrypt-Proxy v.$PhienBanOff lên v.$PhienBanOn thất bại!!!" >> $Log;
    		echo "$DauCau Cập nhật DNSCrypt-Proxy v.$PhienBanOff lên v.$PhienBanOn thất bại!!!"; fi
	fi
else echo "$DauCau Không có mạng!!! Thoát ra"; exit; fi
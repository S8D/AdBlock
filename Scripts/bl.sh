#!/bin/sh
PhienBan="20200424a"
GetTime=$(date +"%F %a %T"); Time="$GetTime -"
DauCau="#"

dl1="curl -s -L -o"; dl2="curl -s -L"

bl1="https://bit.ly/bl_sh"
bl2="https://bom.to/_bl"
bl3="https://tiny.cc/-bl"
bl4="https://github.com/S8D/AdBlock/raw/master/Scripts/bl.sh"

Trang1="https://bit.ly/_Trang"
Trang2="https://bom.to/trang"
Trang3="https://tiny.cc/-Trang"
Trang4="https://github.com/S8D/AdBlock/raw/master/Lists/0_Trang.txt"

Den1="https://bit.ly/_Den"
Den2="https://bom.to/Den"
Den3="https://tiny.cc/-Den"
Den4="https://github.com/S8D/AdBlock/raw/master/Lists/0_Den.txt"

ipDen1="https://bit.ly/_ipDen"
ipDen2="https://bom.to/ipDen"
ipDen3="https://tiny.cc/-ipDen"
ipDen4="https://github.com/S8D/AdBlock/raw/master/Lists/0_ipDen.txt"

Choang1="https://bit.ly/_Choang"
Choang2="https://bom.to/Choang"
Choang3="https://tiny.cc/-Choang"
Choang4="https://github.com/S8D/AdBlock/raw/master/Lists/0_Choang.txt"

Chuyen1="https://bit.ly/_Chuyen"
Chuyen2="https://bom.to/Chuyen"
Chuyen3="https://tiny.cc/-Chuyen"
Chuyen4="https://github.com/S8D/AdBlock/raw/master/Lists/0_Chuyen.txt"

ThongBao1="https://bit.ly/_ThongBao"
ThongBao2="https://bom.to/ThongBao"
ThongBao3="https://tiny.cc/-ThongBao"
ThongBao4="https://github.com/S8D/AdBlock/raw/master/Lists/0_ThongBao.txt"

NoiQuy1="https://bit.ly/_NoiQuy"
NoiQuy2="https://bom.to/noiwy"
NoiQuy3="https://tiny.cc/-NoiQuy"
NoiQuy4="https://github.com/S8D/AdBlock/raw/master/Lists/0_NoiQuy.txt"

nds="/sd/nds"
DV="/etc/init.d/dns"
#echo "$DauCau $(basename "$0") phiên bản $PhienBan"
OS=`uname -m`; x64="x86_64"; arm="armv7l"; Android="aarch64"; mips="mips"
if [ $OS == $x64 ] || [ $OS == $arm ] || [ $OS == $mips ]; then if [ -d "/www/cgi-bin" ]; then
	TM="/sd"; TMLog="/www";
	cer="/etc/ssl/certs/ca-certificates.crt"; mkdir -p $nds
	NoiQuy="$nds/NoiQuy.txt";
	ThongBao="$nds/ThongBao.txt";
fi; fi

if [ $OS == $mips ]; then if [ ! -d "/www/cgi-bin" ]; then TM="/config/sd"; TMLog="${TM}/dns"; fi; fi

if [ $OS == $Android ]; then TM="/sdcard"; TMLog="${TM}/dns"
	[ "$(whoami)" != "root" ] && { echo "Đã lấy SU, hãy chạy lại $(basename "$0")"; exec su "$0" "$@"; }
fi; cd $TM

tmDNS="${TM}/dns"; mkdir -p $tmDNS; upTam="/tmp/tam"; rm -f $upTam;
Den="${tmDNS}/Den.txt"; if [ ! -f "$Den" ]; then echo '' > $Den; fi; 
ipDen="${tmDNS}/ipDen.txt"; if [ ! -f "$ipDen" ]; then echo '' > $ipDen; fi; 
Trang="${tmDNS}/Trang.txt"; if [ ! -f "$Trang" ]; then echo '' > $Trang; fi; 
Choang="${tmDNS}/Choang.txt"; if [ ! -f "$Choang" ]; then echo '' > $Choang; fi; 
Chuyen="${tmDNS}/Chuyen.txt"; if [ ! -f "$Chuyen" ]; then echo '' > $Chuyen; fi; 
CauHinh="${tmDNS}/CauHinh.toml"; if [ ! -f "$CauHinh" ]; then echo '' > $CauHinh; fi; 
Log="${TMLog}/NhatKy.log"; 
if [ $OS == $x64 ] || [ $OS == $arm ] || [ $OS == $mips ]; then if [ ! -d "/www/cgi-bin" ]; then 
	if [ ! -f "$Log" ]; then sudo echo '' > $Log; fi; else
	if [ ! -f "$Log" ]; then echo '' > $Log; fi; fi; fi

echo "$DauCau Đang kiểm tra máy chủ cập nhật..."
#CheckGG () { ping -q -c 1 -W 1 gg.gg >/dev/null; }; 
#_________________________________
#	UpLink="gg.gg/_bl";
#	uDen="gg.gg/_Den";
#	uipDen="gg.gg/_ipDen";
#	uTrang="gg.gg/_Trang";
#	uChoang="gg.gg/_Choang";
#	uChuyen="gg.gg/_Chuyen";
#	uNoiQuy="gg.gg/_NoiQuy";
#	uThongBao="gg.gg/_ThongBao";
#_________________________________

CheckNet_1 () { ping -q -c 1 -W 1 bit.ly >/dev/null; }; 
CheckNet_2 () { ping -q -c 1 -W 1 bom.to >/dev/null; }; 
CheckNet_3 () { ping -q -c 1 -W 1 tiny.cc >/dev/null; }; 
CheckNet_4 () { ping -q -c 1 -W 1 github.com >/dev/null; };

if CheckNet_1; then UpLink="${bl1}"; uTrang="${Trang1}"; uDen="${Den1}"; uipDen="${ipDen1}"; uChoang="${Choang1}"; uChuyen="${Chuyen1}"; uThongBao="${ThongBao1}"; uNoiQuy="${NoiQuy1}"; net="1"; else
	if CheckNet_2; then UpLink="${bl2}"; uTrang="${Trang2}"; uDen="${Den2}"; uipDen="${ipDen2}"; uChoang="${Choang2}"; uChuyen="${Chuyen2}"; uThongBao="${ThongBao2}"; uNoiQuy="${NoiQuy2}"; net="1"; else
		if CheckNet_3; then UpLink="${bl3}"; uTrang="${Trang3}"; uDen="${Den3}"; uipDen="${ipDen3}"; uChoang="${Choang3}"; uChuyen="${Chuyen3}"; uThongBao="${ThongBao3}"; uNoiQuy="${NoiQuy3}"; net="1"; else
			if CheckNet_4; then UpLink="${bl4}"; uTrang="${Trang4}"; uDen="${Den4}"; uipDen="${ipDen4}"; uChoang="${Choang4}"; uChuyen="${Chuyen4}"; uThongBao="${ThongBao4}"; uNoiQuy="${NoiQuy4}"; net="1"; else net="0"; fi
		fi
	fi
fi

if [ $net -ge 1 ]; then echo "$DauCau Đang kiểm tra cập nhật $(basename "$0") $PhienBan..."
	PhienBanMoi=$(${dl2} "${UpLink}" | grep PhienBan\= | sed 's/.*\=\"//; s/\"$//');
	if [ $PhienBanMoi == $PhienBan ]; then echo "$DauCau $(basename "$0") $PhienBan là bản mới nhất!";
		if [ $OS == $x64 ] || [ $OS == $arm ] || [ $OS == $mips ]; then 
			if [ ! -d "/www/cgi-bin" ]; then sudo echo "$Time $(basename "$0") $PhienBan là bản mới nhất!"  >> $Log; else
				echo "$Time $(basename "$0") $PhienBan là bản mới nhất!"  >> $Log
			fi
		fi

		if [ $OS == $Android ]; then
			echo "$Time $(basename "$0") $PhienBan là bản mới nhất!"  >> $Log
		fi

	else echo "$DauCau Đang cập nhật $(basename "$0") v.$PhienBan lên v.$PhienBanMoi...";
		if [ $OS == $x64 ] || [ $OS == $arm ] || [ $OS == $mips ]; then 
			if [ ! -d "/www/cgi-bin" ]; then 
				sudo cp $0 ${TM}/dns/$PhienBan\_$(basename "$0"); 
				sudo $dl1 $upTam $UpLink; chmod +x $upTam; mv $upTam ${TM}/$0
				sudo echo "$Time $(basename "$0") được cập nhật lên $PhienBanMoi!"  >> $Log; 
				sudo sh ${TM}/$(basename "$0"); 
			else
				cp $0 ${TM}/dns/$PhienBan\_$(basename "$0")
				$dl1 $upTam $UpLink; chmod +x $upTam; mv $upTam ${TM}/$0
				echo "$Time $(basename "$0") được cập nhật lên $PhienBanMoi!"  >> $Log
				echo "$DauCau Khởi chạy $(basename "$0") $PhienBanMoi..."; 
				sh ${TM}/$(basename "$0")
			fi
		fi

		if [ $OS == $Android ]; then
			cp $0 ${TM}/dns/$PhienBan\_$(basename "$0")
			$dl1 $upTam $UpLink; chmod +x $upTam; mv $upTam ${TM}/$0
			echo "$Time $(basename "$0") được cập nhật lên $PhienBanMoi!"  >> $Log
			echo "$DauCau Khởi chạy $(basename "$0") $PhienBanMoi..."; 
			sh ${TM}/$(basename "$0")
		fi; exit 1
	fi
fi

if [ $OS == $x64 ] || [ $OS == $arm ] || [ $OS == $mips ]; then if [ -d "/www/cgi-bin" ]; then
	opkg list-installed | grep -qw luci-ssl || {
	echo "$DauCau Đang cài SSL"
	opkg update;
	opkg install luci-ssl
	}
	opkg list-installed | grep -qw curl || {
	echo "$DauCau Đang cài cURL"
	opkg update;
	opkg install curl
	}
	
	echo "$DauCau Đang cập nhật Bộ lọc"
	#if [ $net -eq 1 ]; then curl -fsL --cacert $cer $uDen $uipDen $uTrang $uChoang $uChuyen $uThongBao $uNoiQuy -o $Den -o $ipDen -o $Trang -o $Choang -o $Chuyen -o $ThongBao -o $NoiQuy; fi
	if [ $net -ge 1 ]; then curl -fsL --cacert $cer $uDen $uipDen $uTrang $uChoang $uChuyen $uThongBao $uNoiQuy -o $Den -o $ipDen -o $Trang -o $Choang -o $Chuyen -o $ThongBao -o $NoiQuy; fi
	if [ -f "$nds" ]; then $DV restart; fi; fi
fi

if [ $OS == $mips ]; then if [ ! -d "/www/cgi-bin" ]; then echo "$DauCau Đang cập nhật Bộ lọc"
	if [ $net -ge 1 ]; then sudo curl -fsLk $uDen $uipDen $uTrang $uChoang $uChuyen -o $Den -o $ipDen -o $Trang -o $Choang -o $Chuyen ; fi
	sudo ${tmDNS}/dns  -service stop; sudo ${tmDNS}/dns  -service start
fi; fi

if [ $OS == $Android ]; then
	[ `whoami` = root ] || { echo "Đã cấp quyền SU. Chạy lại $0"; su "$0" "$@"; exit $?; };
	echo "$DauCau Đang cập nhật Bộ lọc"
	$dl2 $uDen $uipDen $uTrang $uChoang $uChuyen -o $Den -o $ipDen -o $Trang -o $Choang  -o $Chuyen
killall dns; killall dns
fi

vDen=$(cat $Den | grep .*PhienBan\_ | sed 's/.*\_//');
vipDen=$(cat $ipDen | grep .*PhienBan\_ | sed 's/.*\_//');
vTrang=$(cat $Trang | grep .*PhienBan\_ | sed 's/.*\_//');
vChoang=$(cat $Choang | grep .*PhienBan\_ | sed 's/.*\_//');
vChuyen=$(cat $Chuyen | grep .*PhienBan\_ | sed 's/.*\_//');
echo -e "$DauCau Bộ lọc: $PhienBan\n$DauCau Đen:    $vDen\n$DauCau Choàng: $vChoang\n$DauCau Chuyển: $vChuyen\n$DauCau ipDen:  $vipDen\n$DauCau Trắng:  $vTrang";

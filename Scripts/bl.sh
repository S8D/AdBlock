#!/bin/sh
PhienBan="20200315b"
GetTime=$(date +"%F %a %T"); Time="$GetTime -"
DauCau="#"

dl1="curl -s -L -o"; dl2="curl -s -L"
nds="/root/nds"
#echo "$DauCau $(basename "$0") phiên bản $PhienBan"
OS=`uname -m`; x64="x86_64"; arm="armv7l"; Android="aarch64"
if [ $OS == $x64 ] || [ $OS == $arm ]; then TM="/root"; TMLog="/www";
	cer="/etc/ssl/certs/ca-certificates.crt"; mkdir -p $nds
	NoiQuy="$nds/NoiQuy.txt";
	ThongBao="$nds/ThongBao.txt";
fi

if [ $OS == $Android ]; then TM="/sdcard"; TMLog="${TM}/dns"
	[ "$(whoami)" != "root" ] && { echo "Đã lấy SU, hãy chạy lại $(basename "$0")"; exec su "$0" "$@"; }
fi; cd $TM

tmDNS="${TM}/dns"; mkdir -p $tmDNS; upTam="${tmDNS}/tam"; rm -f $upTam;
Den="${tmDNS}/Den.txt"; if [ ! -f "$Den" ]; then echo '' > $Den; fi; 
ipDen="${tmDNS}/ipDen.txt"; if [ ! -f "$ipDen" ]; then echo '' > $ipDen; fi; 
Trang="${tmDNS}/Trang.txt"; if [ ! -f "$Trang" ]; then echo '' > $Trang; fi; 
Choang="${tmDNS}/Choang.txt"; if [ ! -f "$Choang" ]; then echo '' > $Choang; fi; 
Chuyen="${tmDNS}/Chuyen.txt"; if [ ! -f "$Chuyen" ]; then echo '' > $Chuyen; fi; 
CauHinh="${tmDNS}/CauHinh.toml"; if [ ! -f "$CauHinh" ]; then echo '' > $CauHinh; fi; 
Log="${TMLog}/NhatKy.log"; if [ ! -f "$Log" ]; then echo '' > $Log; fi; 

echo "$DauCau Đang kiểm tra máy chủ cập nhật..."
#CheckGG () { ping -q -c 1 -W 1 gg.gg >/dev/null; }; 
CheckUL () { ping -q -c 1 -W 1 bom.to >/dev/null; }; 
CheckTN () { ping -q -c 1 -W 1 tiny.cc >/dev/null; }; 
CheckGH () { ping -q -c 1 -W 1 github.com >/dev/null; };

if CheckUL; then 
	UpLink="bom.to/_bl";
	uDen="bom.to/Den";
	uipDen="bom.to/ipDen";
	uTrang="bom.to/Trang";
	uChoang="bom.to/Choang";
	uChuyen="bom.to/Chuyen";
	uNoiQuy="bom.to/NoiQuy";
	uThongBao="bom.to/ThongBao";
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
	net="1"; else
	if CheckTN; then UpLink="https://tiny.cc/-b"; 
		uDen="https://tiny.cc/-Den";
		uipDen="https://tiny.cc/-ipDen";
		uTrang="https://tiny.cc/-Trang";
		uChoang="https://tiny.cc/-Choang";
		uChuyen="https://tiny.cc/-Chuyen";
		uNoiQuy="https://tiny.cc/-NoiQuy";
		uThongBao="https://tiny.cc/-ThongBao";
		net="2"; else
		if CheckGH; then UpLink="https://github.com/S8D/AdBlock/raw/master/Scripts/bl.sh"; 
			uDen="https://github.com/S8D/AdBlock/raw/master/Lists/0_Den.txt";
			uipDen="https://github.com/S8D/AdBlock/raw/master/Lists/0_ipDen.txt";
			uTrang="https://github.com/S8D/AdBlock/raw/master/Lists/0_Trang.txt";
			uChoang="https://github.com/S8D/AdBlock/raw/master/Lists/0_Choang.txt";
			uChuyen="https://github.com/S8D/AdBlock/raw/master/Lists/0_Chuyen.txt";
			uNoiQuy="https://github.com/S8D/AdBlock/raw/master/Lists/0_NoiQuy.txt";
			uThongBao="https://github.com/S8D/AdBlock/raw/master/Lists/0_ThongBao.txt";
			net="3"; else net=0; fi; fi; fi

if [ $net -ge 1 ]; then echo "$DauCau Đang kiểm tra cập nhật $(basename "$0") $PhienBan..."
	PhienBanMoi=$(${dl2} "${UpLink}" | grep PhienBan\= | sed 's/.*\=\"//; s/\"$//');
	if [ $PhienBanMoi == $PhienBan ]; then echo "$DauCau $(basename "$0") $PhienBan là bản mới nhất!";
		echo "$Time $(basename "$0") $PhienBan là bản mới nhất!"  >> $Log
	else echo "$DauCau Đang cập nhật $(basename "$0") v.$PhienBan lên v.$PhienBanMoi...";
		cp $0 ${TM}/dns/$PhienBan\_$(basename "$0")
		$dl1 $upTam $UpLink; chmod +x $upTam; mv $upTam ${TM}/$0
		echo "$Time $(basename "$0") được cập nhật lên $PhienBanMoi!"  >> $Log
		echo "$DauCau Khởi chạy $(basename "$0") $PhienBanMoi..."; sh ${TM}/$(basename "$0"); exit 1; fi;
fi

OS=`uname -m`; x64="x86_64"; arm="armv7l"; Android="aarch64"
if [ $OS == $x64 ] || [ $OS == $arm ]; then 
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
	if [ $net -eq 1 ]; then curl -f -s -L $uDen $uipDen $uTrang $uChoang $uChuyen $uThongBao $uNoiQuy -o $Den -o $ipDen -o $Trang -o $Choang -o $Chuyen -o $ThongBao -o $NoiQuy; fi
	if [ $net -ge 2 ]; then curl -f -s -L --cacert $cer $uDen $uipDen $uTrang $uChoang $uChuyen $uThongBao $uNoiQuy -o $Den -o $ipDen -o $Trang -o $Choang -o $Chuyen -o $ThongBao -o $NoiQuy; fi	
	/etc/init.d/dns restart	
fi

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
echo -e "$DauCau Phiên bản Bộ lọc: $PhienBan\n$DauCau Đen:    $vDen\n$DauCau Choàng: $vChoang\n$DauCau Chuyển: $vChuyen\n$DauCau ipDen:  $vipDen\n$DauCau Trắng:  $vTrang";

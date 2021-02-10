#!/bin/bash
PhienBan="210210a"

GetTime=$(date +"%F %a %T"); Time="$GetTime -"; DauCau="#"
dl1="curl -sLo"; dl2="curl -sL"
URL="https://github.com/AdguardTeam/AdGuardHome/releases/download"

OS=`uname -m`; x64="x86_64"; arm="armv7l"; mips="mips"
if [ $OS == $x64 ]; then linktai="AdGuardHome_linux_amd64.tar.gz"; ThuMuc="AdGuardHome"; fi
if [ $OS == $arm ]; then linktai="AdGuardHome_linux_armv7.tar.gz"; ThuMuc="AdGuardHome"; fi
if [ $OS == $mips ]; then linktai="AdGuardHome_linux_mipsle_softfloat.tar.gz"; ThuMuc="AdGuardHome"; fi

if [ $OS == $x64 ] || [ $OS == $arm ] || [ $OS == $mips ]; then 
		if [ -d "/sd" ]; then TM="/sd"; fi
		if [ -d "/root/adh" ]; then TM="/root"; else 
			mkdir -p /sd; TM="/sd"; fi
		TMLog="/www"; adh="/sd/adh/adh"; cd $TM; DVu="/etc/init.d/AdGuardHome";
fi

Log="${TMLog}/Update.log"; if [ ! -f "$Log" ]; then echo '' > $Log; fi; 
tmDNS="${TM}/adh"; mkdir -p $tmDNS; upTam="${tmDNS}/tam";
CauHinh="${tmDNS}/cauhinh.yaml"; cd $tmDNS;

DonDep () {
	rm -rf $TM/$ThuMuc; rm -f $upTam $tmDNS/adh.tar.gz
}

CheckNet_1 () { ping -q -c 1 -W 1 github.com >/dev/null; }; DonDep;	
if CheckNet_1; then 
	UpLink="https://github.com/S8D/AdBlock/raw/master/Scripts/adh.sh"; 
	#Phiên bản chính thức
	#DownLink="https://api.github.com/repos/AdguardTeam/AdGuardHome/releases/latest";
	#Phiên bản beta
	DownLink="https://github.com/AdguardTeam/AdGuardHome/tags";
	uDV="https://github.com/S8D/AdBlock/raw/master/Scripts/adh_dv"; net="1"; else net=0;
fi

GetVersion () {
	if [ $(adh --version | sed 's/.*channel //; s/\,.*//') == release ]; then PhienBanOff=$(adh --version | sed 's/.*version //; s/\,.*//'); else PhienBanOff=$(adh --version | sed 's/.*version v//; s/\,.*//'); fi
}

if [ $net -ge 1 ]; then echo "$DauCau Đang kiểm tra cập nhật $(basename "$0") $PhienBan..."
	PhienBanMoi=$(${dl2} "${UpLink}" | grep PhienBan\= | sed 's/.*\=\"//; s/\"$//');
	if [ $PhienBanMoi == $PhienBan ]; then echo "$DauCau $(basename "$0") $PhienBan là bản mới nhất!";
		echo "$Time $(basename "$0") $PhienBan là bản mới nhất!"  >> $Log
	else echo "$DauCau Đang cập nhật $(basename "$0") v.$PhienBan lên v.$PhienBanMoi...";
		cp $0 ${tmDNS}/$PhienBan\_$(basename "$0")
		$dl1 ${upTam} $UpLink; chmod +x ${upTam}; mv ${upTam} ${TM}/$0
		echo "$Time $(basename "$0") được cập nhật lên $PhienBanMoi!"  >> $Log
		echo "$DauCau Khởi chạy $(basename "$0") $PhienBanMoi..."; sh ${TM}/$(basename "$0"); exit 1
	fi

	echo "$DauCau Đang kiểm tra cập nhật AdGuardHome...";
	#Phiên bản chính thức
	#PhienBanOn=$(${dl2} "${DownLink}" | awk -F '"' '/tag_name/{print $4}' | sed 's/^v//')
	
	#Phiên bản beta
	PhienBanOn=$(${dl2} "${DownLink}" | grep "/releases/tag/" | sed 's/.*tag\/v//; s/">$//' | sed ':a;N;$!ba;s/\n.*//g')
	GetVersion;
	if [ $PhienBanOn == $PhienBanOff ]; then echo "$Time AdGuardHome $PhienBanOn là bản mới nhất!" >> $Log;
		echo "$DauCau AdGuardHome $PhienBanOn là bản mới nhất!"; exit 1; else
		echo "$DauCau Đang cập nhật AdGuardHome v.$PhienBanOff lên v.$PhienBanOn..."
		echo "$DauCau Đang tải AdGuardHome..."
		$dl1 $TM/adh.tar.gz ${URL}/v${PhienBanOn}/${linktai};	
		echo -e "$DauCau Đang giải nén AdGuardHome...\n"; 
		cd $TM; tar zxf adh.tar.gz;
		if [ ! -f ${TM}/${ThuMuc}/AdGuardHome.sig ]; then echo -e "\n$DauCau Giải nén thất bại!!! Thoát ra!"; DonDep; exit; fi
		if [ $(${TM}/${ThuMuc}/AdGuardHome --version | sed 's/ .*//') != AdGuard ]; then echo -e "\n$DauCau Phiên bản thực thi sai!!! Thoát ra!"; DonDep; exit; fi
		echo -e "$DauCau Đang cập nhật AdGuardHome...\n";
		/etc/init.d/AdGuardHome stop; mv $adh adh\_$PhienBanOff; mv AdGuardHome/AdGuardHome $adh
		/etc/init.d/AdGuardHome start
		GetVersion;
		if [ $PhienBanOn == $PhienBanOff ]; then echo "$Time Cập nhật AdGuardHome lên phiên bản $PhienBanOn thành công!"; else
			echo -e "\n$DauCau Cập nhật AdGuardHome lên phiên bản $PhienBanOn thất bại!!! Thoát ra!"; DonDep; exit; fi
	fi
	else echo "$DauCau Không có mạng!!! Thoát ra"; exit
fi

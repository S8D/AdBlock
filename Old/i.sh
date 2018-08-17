#!/bin/sh
PhienBan="20180817d"
export SetIP="0.1.2.3"; fName="hosts"; Chay=`date +%s`
Nha="https://s8d.github.io/AdBlock"; uSed="${Nha}/Sed.txt"; uHost="${Nha}/Lists/iOS.txt";
#1__________________________________________________________________________________________________
export TMuc=""$(cd "$(dirname "${0}")" && pwd)""
Kiem() { ! type "$1" > /dev/null; };
DonRac () { rm -f *.sh; rm -rf ${TMuc}/Data; rm -rf ${MTam}; };
NhanFim () { read -n 1 -s -r -p "Press any key to continue"; };
if [ -f "${TMuc}/Location" ]; then [ `whoami` = root ] || { sudo "$0" "$@"; exit $?; }; else
	[ `whoami` = root ] || { echo " Input password. Default : alpine "; su root "$0" "$@"; exit $?; };
fi
if Kiem curl || Kiem ping || Kiem logger || Kiem awk || Kiem sed || Kiem grep; then
	echo " Please add source https://electrarepo64.coolstar.org to Cydia ";
	NhanFim; printf '\n'; echo ">>> Update Source";	apt-get update; printf '\n';
	if Kiem curl; then printf '\n'; echo "Press Y to Install cURL"; NhanFim; apt-get install curl; fi
	if Kiem ping || Kiem logger; then printf '\n'; echo "Press Y to Install ping+logger"; NhanFim; apt-get install inetutils; fi
	if Kiem awk; then printf '\n'; echo "Press Y to Install awk"; NhanFim; apt-get install gawk; fi
	if Kiem sed; then printf '\n'; echo "Press Y to Install sed"; NhanFim; apt-get install sed; fi
	if Kiem grep; then printf '\n'; echo "Press Y to Install grep"; NhanFim; apt-get install grep; fi
fi
TenSR="$0"; ThamSo="$@";export ThuMay=$(date +"%u");
export MTam="${TMuc}/tmp";mkdir -p ${MTam};
export upTam="${MTam}/u.sh";export iMuc="/var/mobile";
if [ -f "${TMuc}/Location" ]; then
	export Data="${TMuc}/Data";mkdir -p ${Data};
	export hChinh="${TMuc}/${fName}"; else
	export aMuc="/a"; mkdir -p ${aMuc};
	export Data="${aMuc}/Data";mkdir -p ${Data};
	export hChinh="/etc/${fName}";
	if [ ${TMuc} -ef ${aMuc} ]; then if [ -d ${iMuc} ]; then cp $0 ${iMuc}/$(basename "$0"); fi; fi
	if ! [ ${TMuc} -ef ${aMuc} ] && ! [ ${TMuc} -ef ${iMuc} ]; then
		if ! [ ${TMuc} -ef ${aMuc} ]; then cp $0 ${aMuc}/$(basename "$0"); fi
		if ! [ ${TMuc} -ef ${iMuc} ]; then if [ -d ${iMuc} ]; then cp $0 ${iMuc}/$(basename "$0"); fi; fi
		DonRac;
	fi
fi
export hLog="${Data}/h.log";export pauseflag="${Data}/PAUSED";
export SHELL=/bin/sh
export PATH=/bin:/usr/bin:/sbin:/usr/sbin:/jffs/sbin:/jffs/bin:/jffs/usr/sbin:/jffs/usr/bin:/mmc/sbin:/mmc/bin:/mmc/usr/sbin:/mmc/usr/bin:/opt/sbin:/opt/bin:/opt/usr/sbin:/opt/usr/bin:"${TMuc}"
export LD_LIBRARY_PATH=/lib:/usr/lib:/jffs/lib:/jffs/usr/lib:/jffs/usr/local/lib:/mmc/lib:/mmc/usr/lib:/opt/lib:/opt/usr/lib
export PWD="${TMuc}"; cd "${TMuc}"
#2__________________________________________________________________________________________________
logger ">>> $(basename "$0") started"
alias GetSSL="curl -f -s -k -L"
InRa () { echo "$1" ; echo "$1" >> $hLog; }
Size () { InRa "`du -h $1 | awk '{print $1}'`"; }
CheckNet () { ping -q -c 1 -W 1 g.co >/dev/null; }
Xong () { logger ">>> $(basename "$0") finished"; rm -rf ${MTam}; exit 0; }
NetDown () { InRa "# NETWORK: DOWN | Please try again! "; }
DemGio () { Dung=`date +%s`;Phut=$(( $((Dung - Chay)) /60 )); Giay=$(( $((Dung - Chay)) %60 )); }
#4__________________________________________________________________________________________________
KiemTra ()
{
	if [ 0 -eq $? ]; then
		MaCu=`md5sum $0 | cut -d' ' -f1`
		MaMoi=`md5sum $upTam | cut -d' ' -f1`
		if [ "$MaCu" != "$MaMoi" ]; then
			dv=`grep -w -m 1 "PhienBan" $upTam`; vMoi=$(echo $dv | sed 's/.*\=\"//; s/\"$//');
			InRa ">>> Updating new version..."
			BanCu=`grep -w -m 1 "PhienBan" $0 | cut -d \" -f2`
			if [ -f "${Data}/$BanCu.sh" ]; then
				mCu=$(echo "$MaCu" | cut -c1-5);	 cp $0 ${Data}/i\_$BanCu\_$mCu.sh; else
				cp $0 ${Data}/i\_$BanCu.sh;
			fi
			chmod 755 $upTam;
			if [ -f "${TMuc}/Location" ]; then mv $upTam $0; else
				if ! [ ${TMuc} -ef ${aMuc} ] && ! [ ${TMuc} -ef ${iMuc} ]; then DonRac; fi
				if [ -d ${iMuc} ]; then cp $upTam ${iMuc}/$(basename "$0"); fi
				mv $upTam ${aMuc}/$(basename "$0");
			fi
			InRa ">>> $(basename "$0") updated to $vMoi ";export upd=1;
		else
			InRa ">>> $(basename "$0") version: $PhienBan";export upd=0;
		fi
	else
		InRa ">>> Update failed. Try again."
fi
}
#5__________________________________________________________________________________________________
InRa "======================================="
InRa "|    AdBlock for iOS / Linux          |"
InRa "|    ${Nha}    |"
InRa "|    Author: Manish Parashar          |"
InRa "|    Editor: Darias                   |"
InRa "|    Version: $PhienBan                 |"
InRa "======================================="
InRa "   `date`";
if CheckNet; then
	InRa "... Checking for updates..."
	GetSSL gg.gg/i_sh > $upTam; KiemTra;
	if [ $upd -eq 1 ]; then InRa ">>> Starting $(basename "$0") $vMoi..."; $TenSR $ThamSo; Xong; fi
else
	NetDown; Xong
fi
DemGio
InRa "# Total time: $Phut:$Giay minutes"
InRa "# DONE"
Xong
# FIN
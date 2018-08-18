#!/bin/sh
# iOS 9
PhienBan="20180818a"
export SetIP="0.1.2.3"; fName="hosts"; Chay=`date +%s`
Nha="https://s8d.github.io/AdBlock"; uSed="${Nha}/Sed.txt"; uHost="${Nha}/Lists/iOS.txt";
#1__________________________________________________________________________________________________
export TMuc=""$(cd "$(dirname "${0}")" && pwd)""
export MTam="${TMuc}/tmp";mkdir -p ${MTam};
export upTam="${MTam}/u.sh";export iMuc="/var/mobile";
alias GetSSL="curl -f -s -k -L";
Kiem() { ! type "$1" > /dev/null; };
DonRac () { rm -f *.sh; rm -rf ${TMuc}/Data; rm -rf ${MTam}; };
NhanFim () { read -n 1 -s -r -p "Press any key to continue"; };
if [ -f "${TMuc}/Location" ]; then [ `whoami` = root ] || { sudo "$0" "$@"; exit $?; }; else
	[ `whoami` = root ] || { echo " Input password. Default : alpine "; su root "$0" "$@"; exit $?; };
fi
OSver="10 11 12"; OSbuild=$(sw_vers -productVersion); dam=${OSbuild%%.*}
for stuff in $OSver; do
	if [ "$stuff" == "$dam" ]; then GetSSL gg.gg/i_sh > ${MTam}/i.sh && sh ${MTam}/i.sh; exit 0; fi
done
echo "Rebuilding for iOS 9"; exit 0
#______________________________________________________________________________________
if Kiem curl; then GetSSL gg.gg/cu_ > ${MTam}/curl.deb && dpkg -i ${MTam}/curl.deb; fi
if Kiem awk; then GetSSL gg.gg/ga_ > ${MTam}/gawk.deb && dpkg -i ${MTam}/gawk.deb; fi
if Kiem sed; then GetSSL gg.gg/se_ > ${MTam}/sed.deb && dpkg -i ${MTam}/sed.deb; fi
if Kiem grep; then GetSSL gg.gg/gr_ > ${MTam}/grep.deb && dpkg -i ${MTam}/grep.deb; fi
TenSR="$0"; ThamSo="$@";export ThuMay=$(date +"%u");
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
InRa "|    AdBlock for iOS <=9              |"
InRa "|    ${Nha}    |"
InRa "|    Author: Manish Parashar          |"
InRa "|    Editor: Darias                   |"
InRa "|    Version: $PhienBan               |"
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
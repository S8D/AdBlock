#!/bin/sh
# iOS 9
PhienBan="20180818d"
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
OSbuild=$(sw_vers -productVersion); iOS=${OSbuild%%.*}; echo "Your iOS is $OSbuild";
if [ $iOS -ge 10 ]; then
	GetSSL gg.gg/iB_ > ${MTam}/i.sh && sh ${MTam}/i.sh; exit 0;
fi
#2______________________________________________________________________________________
if Kiem curl; then GetSSL gg.gg/cu_ > ${MTam}/curl.deb && dpkg -i ${MTam}/curl.deb; fi
if Kiem awk; then GetSSL gg.gg/ga_ > ${MTam}/gawk.deb && dpkg -i ${MTam}/gawk.deb; fi
if Kiem sed; then GetSSL gg.gg/se_ > ${MTam}/sed.deb && dpkg -i ${MTam}/sed.deb; fi
if Kiem grep; then GetSSL gg.gg/gr_ > ${MTam}/grep.deb && dpkg -i ${MTam}/grep.deb; fi
TenSR="$0"; ThamSo="$@";export ThuMay=$(date +"%u");
export upTam="${MTam}/u.sh";export iMuc="/var/mobile";
export tbl="${MTam}/bl.tmp";export twl="${MTam}/wl.tmp";
if [ ! -f $tbl ]; then echo -n "" > $tbl; fi
if [ ! -f $twl ]; then echo -n "gg.gg" > $twl; fi
export fSed="${MTam}/Sed";export fHost="${MTam}/Host";
export tam="${MTam}/t.tmp";export hTam="${MTam}/h.tmp";
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
export hDung="${Data}/${fName}.zzz";
if [ ! -f $hChinh ]; then echo -n "" > $hChinh; fi
export denOff="${Data}/den.off";export trangOff="${Data}/trang.off";
if [ ! -f $denOff ]; then echo -n "" > $denOff; fi
if [ ! -f $trangOff ]; then echo -n "g.co" > $trangOff; fi
export pauseflag="${Data}/PAUSED";
export SHELL=/bin/sh
export PATH=/bin:/usr/bin:/sbin:/usr/sbin:/jffs/sbin:/jffs/bin:/jffs/usr/sbin:/jffs/usr/bin:/mmc/sbin:/mmc/bin:/mmc/usr/sbin:/mmc/usr/bin:/opt/sbin:/opt/bin:/opt/usr/sbin:/opt/usr/bin:"${TMuc}"
export LD_LIBRARY_PATH=/lib:/usr/lib:/jffs/lib:/jffs/usr/lib:/jffs/usr/local/lib:/mmc/lib:/mmc/usr/lib:/opt/lib:/opt/usr/lib
export PWD="${TMuc}"; cd "${TMuc}"
#3__________________________________________________________________________________________________
export ScFile="${Data}/cacert.pem"
alias GetHTT="curl -f -s -k -L";
[ $SECURL -eq 1 ] && unalias GetSSL && alias GetSSL="curl -f -s --capath ${Data} --cacert $ScFile"
Size () { echo "`du -h $1 | awk '{print $1}'`"; }
CheckNet () { curl g.co -k -s -f -o /dev/null; }
Xong () { echo ">>> $(basename "$0") finished"; rm -rf ${MTam}; exit 0; }
NetDown () { echo "# NETWORK: DOWN | Please try again! "; }
DemGio () { Dung=`date +%s`;Phut=$(( $((Dung - Chay)) /60 )); Giay=$(( $((Dung - Chay)) %60 )); }

Bat ()
{
	if [ -f $pauseflag ] && { [ -f $hDung ]; }; then
		InRa ">>> RESUMING PROTECTION"
		mv $hDung $hChinh
		rm -f $pauseflag
	fi
	Xong
}

Tat ()
{
	InRa ">>> WARNING: PAUSING PROTECTION"
	[ -f $hChinh ] && mv $hChinh $hDung
	if [ -f "${Data}/Hosts" ]; then
		cp ${Data}/Hosts $hChinh; else
		GetSSL ${Nha}/Lists/hosts > ${Data}/Hosts && cp ${Data}/Hosts $hChinh;
	fi
	echo "PAUSED" > $pauseflag
	InRa ">>> Type $(basename "$0") -r or --resume to resume protection."
	Xong
}

Giup ()
{
	echo ""
	echo "USAGE:"
	printf '\t'; echo "$(basename "$0") [-? | -h | --help] [-v | --version] ..."
	echo ""
	echo "OPERATION:"
	echo -n "[-d | -D]"; printf '\t'; echo "Ignore Black/White Lists"
	echo -n "[-b | --bl=]"; printf '\t'; echo -n "domain.name"; printf '\t'; echo "Add domain.name to BlackList"
	echo -n "[-w | --wl=]"; printf '\t'; echo -n "domain.name"; printf '\t'; echo "Add domain.name to WhiteList"
	echo -n "[-i | --ip=]"; printf '\t'; echo -n "ip.ad.dr.ss"; printf '\t'; echo "Send ads to this IP, default: $SetIP"
	echo -n "[-q | --quiet]"; printf '\t'; echo "Print out to screen, do not save log file"
	echo -n "[-p | --pause]"; printf '\t'; echo "Pause protection"
	echo -n "[-r | --resume]"; printf '\t'; echo "Resume protection"
	echo -n "[-s | --secure]"; printf '\t'; echo "Use cURL CA certs for secure file transfer"
	echo -n "[-h | --help]"; printf '\t'; echo "Display this help screen and exit"
	echo -n "[-u | --update]"; printf '\t'; echo "Update $(basename "$0") to the latest version"
	echo -n "[-v | --version]"; printf ' '; echo "Print $(basename "$0") version and exit"
	echo ""
	echo "EXAMPLES:"
	echo "$(basename "$0") -s2 --ip=172.31.255.254 "
	echo ""
	Xong
}
#4__________________________________________________________________________________________________
KiemTra ()
{
	if [ 0 -eq $? ]; then
		MaCu=`md5sum $0 | cut -d' ' -f1`
		MaMoi=`md5sum $upTam | cut -d' ' -f1`
		if [ "$MaCu" != "$MaMoi" ]; then
			dv=`grep -w -m 1 "PhienBan" $upTam`; vMoi=$(echo $dv | sed 's/.*\=\"//; s/\"$//');
			echo ">>> Updating new version..."
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
			echo ">>> $(basename "$0") updated to $vMoi ";export upd=1;
		else
			echo ">>> $(basename "$0") version: $PhienBan";export upd=0;
		fi
	else
		echo ">>> Update failed. Try again."
fi
}
CapNhat ()
{
	InRa ">>> Checking for updates...";
	if CheckNet; then GetSSL gg.gg/i_9 > $upTam; KiemTra; else NetDown; fi; Xong
}
#5__________________________________________________________________________________________________
while getopts "h?vdDpPqQrRsSoOuUb:w:i:-:" opt; do
	case ${opt} in
		h|\? ) Giup ;;
		v    ) echo ">>> $(basename "$0") version: $PhienBan" ; Xong ;;
		d|D  ) DISTRIB=1 ;;
		q|Q  ) QUIET=1 ;;
		p|P  ) Tat ;;
		r|R  ) Bat ;;
		s|S  ) SECURL=1 ;;
		u|U  ) CapNhat ;;
		b    ) echo "$OPTARG" >> $denOff ;;
		w    ) echo "$OPTARG" >> $trangOff ;;
		i    ) SetIP="$OPTARG" ;;
		-    ) LONG_OPTARG="${OPTARG#*=}"
		case $OPTARG in
			bl=?*   ) ARG_BL="$LONG_OPTARG" ; echo $ARG_BL >> $denOff ;;
			bl*     ) echo ">>> ERROR: no arguments for --$OPTARG option" >&2; exit 2 ;;
			wl=?*   ) ARG_WL="$LONG_OPTARG" ; echo $ARG_WL >> $trangOff ;;
			wl*     ) echo ">>> ERROR: no arguments for --$OPTARG option" >&2; exit 2 ;;
			ip=?*   ) ARG_IP="$LONG_OPTARG" ; SetIP=$ARG_IP ;;
			ip*     ) echo ">>> ERROR: no arguments for --$OPTARG option" >&2; exit 2 ;;
			quiet   ) QUIET=1 ;;
			pause   ) Tat ;;
			resume  ) Bat ;;
			secure  ) SECURL=1 ;;
			help    ) Giup ;;
			update  ) CapNhat ;;
			version ) echo "$PhienBan" ; Xong ;;
			4* | quiet* | pause* | resume* | secure* | help* | update* | version* )
					echo ">>> ERROR: no arguments allowed for --$OPTARG option" >&2; exit 2 ;;
			'' )	break ;;
			* )		echo ">>> ERROR: unsupported option --$OPTARG" >&2; exit 2 ;;
		esac ;;
	\? ) exit 2 ;;
	esac
done
shift $((OPTIND-1))
#6__________________________________________________________________________________________________
echo "======================================="
echo "|    AdBlock for iOS <=9              |"
echo "|    ${Nha}    |"
echo "|    Author: Manish Parashar          |"
echo "|    Editor: Darias                   |"
echo "|    Status: Beta                     |"
echo "======================================="
echo "   `date`";
if CheckNet; then
	echo "... Checking for updates..."
	GetSSL gg.gg/i_9 > $upTam; KiemTra;
	if [ $upd -eq 1 ]; then echo ">>> Starting $(basename "$0") $vMoi..."; $TenSR $ThamSo; Xong; fi
	GetSSL ${uSed} > $fSed;dv=`grep -w -m 1 "Version" $fSed`;vers=$(echo $dv | sed 's/.*\=//');
	dv=`grep -w -m 1 "SedH" $fSed`;alias SedH="$(echo $dv | sed 's/.*\=\=//')"; printf '\n';
	dv=`grep -w -m 1 "ThongBao" $fSed`;ThongBao=$(echo $dv | sed 's/.*\=//'); echo "$ThongBao";
	dv=`grep -w -m 1 "ChangeLog" $fSed`;ChangeLog=$(echo $dv | sed 's/.*\=//'); echo "$ChangeLog"; printf '\n';
else
	NetDown; Xong
fi
if [ -f $pauseflag ] && { [ -f $hDung ]; }; then
	InRa "# USER FORGOT TO RESUME PROTECTION AFTER PAUSING"
	Bat
fi
if [ $ONLINE -eq 1 ] && CheckNet; then
	InRa "# NETWORK: UP | MODE: ONLINE"
	InRa "# IP ADDRESS FOR ADS: $SetIP"
	InRa "# SECURE [0=NO | 1=YES]: $SECURL"
	if [ ! -f ${Data}/cacert.pem  ] || { [ "${ThuMay}" -eq 1 ] || [ "${ThuMay}" -eq 4 ]; }; then
		InRa "> Downloading cURL certificates"
		GetSSL https://curl.haxx.se/ca/cacert.pem > ${Data}/cacert.pem
	fi
#7__________________________________________________________________________________________________
	if [ $DISTRIB -eq 0 ] && { [ -s "$denOff" ] || [ -s "$trangOff" ]; }; then
		InRa "> Compacting Black/WhiteList"
		cat $denOff | SedH > blTam && mv blTam $denOff; cat $denOff > $tbl;
		cat $trangOff | SedH > wlTam && mv wlTam $trangOff; cat $trangOff | grep -Fvwf $denOff > $twl;
	fi
#8__________________________________________________________________________________________________
	InRa "# Downloading Hosts file";
	GetSSL ${uHost} > $tam;hv=`grep -w -m 1 "#hVersion" $tam`;hvers=$(echo $hv | sed 's/.*\=//');
	cat $tam | SedH | cat $tbl - | grep -Fvwf $twl | awk -v "IP=$SetIP" '{sub(/\r$/,""); print IP" "$0}' > $hTam;
	InRa "   Sed  version: $vers | Size: $(Size "$fSed")";
	Counts=$(cat $hTam | wc -l | sed 's/^[ \t]*//');
	if [ $Counts -eq 0 ]; then
		InRa ">>> Process failed! Please try again."; DemLine; Xong; else
		mv $hTam $hChinh;Counts=$(cat $hChinh | wc -l | sed 's/^[ \t]*//');
		InRa " Blocked $Counts | Size $(Size "$hChinh") | Version $hvers";
	fi
else
	NetDown; DemLine; Xong
fi
DemGio
echo "# Total time: $Phut:$Giay minutes"
echo "# DONE"
Xong
# FIN
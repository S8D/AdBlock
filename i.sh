#!/bin/sh
PhienBan="20180828a"
export SetIP="0.1.2.3"; fName="hosts"; Chay=`date +%s`
Nha="https://s8d.github.io/AdBlock"; uSed="${Nha}/Sed.txt"; uHost="${Nha}/Lists/iOS.txt";
#1__________________________________________________________________________________________________
export ONLINE=1
export QUIET=0
export SECURL=0
export DISTRIB=0
export TMuc=""$(cd "$(dirname "${0}")" && pwd)""
export MTam="${TMuc}/tmp";mkdir -p ${MTam};
alias GetSSL="curl -f -s -k -L";
Kiem() { ! type "$1" > /dev/null; };
DonRac () { rm -f *.sh; rm -rf ${TMuc}/Data; rm -rf ${MTam}; };
NhanFim () { read -n 1 -s -r -p "Press any key to continue"; };
CheckRoot ()
{
if [ -f "${TMuc}/Location" ]; then [ `whoami` = root ] || { sudo "$0" "$@"; exit $?; }; else
	[ `whoami` = root ] || { echo " Input password. Default : alpine "; su root "$0" "$@"; exit $?; };
fi
}
OSbuild=$(sw_vers -productVersion); iOS=${OSbuild%%.*}; OS=`uname -p`; x64="arm64";
if [ $OS == $x64 ]; then bit="64bit"; CheckRoot
	if Kiem curl; then GetSSL gg.gg/_cu > ${MTam}/curl.deb && dpkg -i ${MTam}/curl.deb; fi
	if Kiem ping || Kiem logger; then GetSSL gg.gg/_in > ${MTam}/inetutils.deb && dpkg -i ${MTam}/inetutils.deb; fi
	if Kiem awk; then GetSSL gg.gg/_ga > ${MTam}/gawk.deb && dpkg -i ${MTam}/gawk.deb; fi
	if Kiem sed; then GetSSL gg.gg/_se > ${MTam}/sed.deb && dpkg -i ${MTam}/sed.deb; fi
	if Kiem grep; then GetSSL gg.gg/_gr > ${MTam}/grep.deb && dpkg -i ${MTam}/grep.deb; fi
	else bit="32bit"; CheckRoot
		if Kiem curl; then GetSSL gg.gg/cu_ > ${MTam}/curl.deb && dpkg -i ${MTam}/curl.deb; fi
		if Kiem ping || Kiem logger; then GetSSL gg.gg/in_ > ${MTam}/inetutils.deb && dpkg -i ${MTam}/inetutils.deb; fi
		if Kiem awk; then GetSSL gg.gg/ga_ > ${MTam}/gawk.deb && dpkg -i ${MTam}/gawk.deb; fi
		if Kiem sed; then GetSSL gg.gg/se_ > ${MTam}/sed.deb && dpkg -i ${MTam}/sed.deb; fi
		if Kiem grep; then GetSSL gg.gg/gr_ > ${MTam}/grep.deb && dpkg -i ${MTam}/grep.deb; fi
fi
if [ $iOS -lt 10 ]; then GetSSL gg.gg/i_9 > ${MTam}/i.sh && sh ${MTam}/i.sh; exit 0; fi
export upTam="${MTam}/u.sh";export iMuc="/var/mobile";
export tbl="${MTam}/bl.tmp";export twl="${MTam}/wl.tmp";
if [ ! -f $tbl ]; then echo -n "" > $tbl; fi
if [ ! -f $twl ]; then echo -n "gg.gg" > $twl; fi
export fSed="${MTam}/Sed";export fHost="${MTam}/Host";
export tam="${MTam}/t.tmp";export hTam="${MTam}/h.tmp";
export trangOn="${Data}/trang.on";
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
export hLog="${Data}/h.log";export pauseflag="${Data}/PAUSED";
export SHELL=/bin/sh
export PATH=/bin:/usr/bin:/sbin:/usr/sbin:/jffs/sbin:/jffs/bin:/jffs/usr/sbin:/jffs/usr/bin:/mmc/sbin:/mmc/bin:/mmc/usr/sbin:/mmc/usr/bin:/opt/sbin:/opt/bin:/opt/usr/sbin:/opt/usr/bin:"${TMuc}"
export LD_LIBRARY_PATH=/lib:/usr/lib:/jffs/lib:/jffs/usr/lib:/jffs/usr/local/lib:/mmc/lib:/mmc/usr/lib:/opt/lib:/opt/usr/lib
export PWD="${TMuc}"; cd "${TMuc}"
#2__________________________________________________________________________________________________
logger ">>> $(basename "$0") started"
export ScFile="${Data}/cacert.pem"
alias GetHTT="curl -f -s -k -L";
[ $SECURL -eq 1 ] && unalias GetSSL && alias GetSSL="curl -f -s --capath ${Data} --cacert $ScFile"
alias GetMHK="curl -f -s -A -L "Mozilla/5.0" -e http://forum.xda-developers.com/"
InRa () { [ $QUIET -eq 0 ] && echo "$1" ; echo "$1" >> $hLog; }
Size () { InRa "`du -h $1 | awk '{print $1}'`"; }
CheckNet () { ping -q -c 1 -W 1 g.co >/dev/null; }
Xong () { logger ">>> $(basename "$0") finished"; rm -rf ${MTam}; exit 0; }
NetDown () { InRa "# NETWORK: DOWN | Please try again! "; }
DemLine () { Counts=$(cat $hChinh | wc -l | sed 's/^[ \t]*//'); InRa ">> Blocked: $Counts Hosts $(Size "$hChinh")"; }
DemGio () { Dung=`date +%s`;Phut=$(( $((Dung - Chay)) /60 )); Giay=$(( $((Dung - Chay)) %60 )); }
Bat ()
{
	CheckRoot
	if [ -f $pauseflag ] && { [ -f $hDung ]; }; then
		InRa ">>> RESUMING PROTECTION"
		mv $hDung $hChinh
		rm -f $pauseflag
	else
		InRa "# HOSTS IS ENDABLED";
	fi
	Xong
}
Tat ()
{
	CheckRoot
	if [ -f $pauseflag ] && { [ -f $hDung ]; }; then
	InRa "# HOSTS IS PAUSING"; InRa ">>> Type $(basename "$0") -r to resume protection."; Xong
	fi
	InRa ">>> PAUSING PROTECTION"
	[ -f $hChinh ] && mv $hChinh $hDung
	if [ -f "${Data}/Hosts" ]; then
		cp ${Data}/Hosts $hChinh; else
		GetSSL ${Nha}/Lists/Hosts.txt > ${Data}/Hosts.txt && cp ${Data}/Hosts $hChinh;
	fi
	echo "PAUSED" > $pauseflag
	InRa ">>> Type $(basename "$0") -r to resume protection."
	Xong
}
#3__________________________________________________________________________________________________
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
	CheckRoot
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
CapNhat ()
{
	InRa ">>> Checking for updates...";
	if CheckNet; then GetSSL gg.gg/i_up > $upTam; KiemTra; else NetDown; fi; Xong
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
InRa "==================================="
InRa "|  AdBlock for iOS / Linux        |"
InRa "|  ${Nha}  |"
InRa "|  Author: Manish Parashar        |"
InRa "|  Editor: Darias                 |"
InRa "|  iOS version: $OSbuild $bit      |"
InRa "==================================="
InRa "   `date`";
if CheckNet; then
	InRa "... Checking for updates..."
	GetSSL gg.gg/i_sh > $upTam; KiemTra;
	if [ $upd -eq 1 ]; then InRa ">>> Starting $(basename "$0") $vMoi..."; $0 $@; Xong; fi
	GetSSL ${uSed} > $fSed;dv=`grep -w -m 1 "Version" $fSed`;vers=$(echo $dv | sed 's/.*\=//');
	dv=`grep -w -m 1 "SedH" $fSed`;alias SedH="$(echo $dv | sed 's/.*\=\=//')"; printf '\n';
	dv=`grep -w -m 1 "TBao1" $fSed`;TBao1=$(echo $dv | sed 's/.*\=//'); echo "$TBao1";
	dv=`grep -w -m 1 "TBao2" $fSed`;TBao2=$(echo $dv | sed 's/.*\=//'); echo "$TBao2";
	dv=`grep -w -m 1 "TBao3" $fSed`;TBao3=$(echo $dv | sed 's/.*\=//'); echo "$TBao3"; printf '\n';
else
	NetDown; Xong
fi
#7__________________________________________________________________________________________________
if [ -f $pauseflag ] && { [ -f $hDung ]; }; then
	InRa "# USER FORGOT TO RESUME PROTECTION AFTER PAUSING"
	Bat
fi
if [ $ONLINE -eq 1 ] && CheckNet; then
	InRa "# NETWORK: UP | MODE: ONLINE"
	InRa "# IP ADDRESS FOR ADS: $SetIP"
	InRa "# SECURE [0=NO | 1=YES]: $SECURL"
	if [ ! -f ${Data}/cacert.pem  ] || [ $SECURL -eq 1 ]; then
		InRa "> Downloading cURL certificates"
		GetSSL https://curl.haxx.se/ca/cacert.pem > ${Data}/cacert.pem
	fi
	GetSSL ${Nha}/Lists/Trang.txt | SedH > $tam;InRa "# Size of WhiteList is: $(Size "$tam")";cat $tam > $trangOn;
#8__________________________________________________________________________________________________
	if [ $DISTRIB -eq 0 ] && { [ -s "$denOff" ] || [ -s "$trangOff" ]; }; then
		InRa "> Compacting Black/WhiteList"
		cat $denOff | SedH > blTam && mv blTam $denOff; cat $denOff > $tbl;
		cat $trangOff | SedH > wlTam && mv wlTam $trangOff; cat $trangOff | grep -Fvwf $denOff > $twl; cat $trangOn >> $twl;
	fi
#9__________________________________________________________________________________________________
	InRa "> Downloading Hosts file";
	GetSSL ${uHost} > $tam;hv=`grep -w -m 1 "#hVersion" $tam`;hvers=$(echo $hv | sed 's/.*\=//');
	cat $tam | SedH | cat $tbl - | grep -Fvwf $twl | awk -v "IP=$SetIP" '{sub(/\r$/,""); print IP" "$0}' > $hTam;
	InRa "# Sed $vers | Size: $(Size "$fSed")";
	Counts=$(cat $hTam | wc -l | sed 's/^[ \t]*//');
	if [ $Counts -eq 0 ]; then
		InRa ">>> Process failed! Please try again."; DemLine; Xong; else
		mv $hTam $hChinh;Counts=$(cat $hChinh | wc -l | sed 's/^[ \t]*//');
		InRa "# Blocked  $Counts | Size $(Size "$hChinh") | Hosts $hvers";
	fi
else
	NetDown; DemLine; Xong
fi
DemGio; InRa "# Total time: $Phut:$Giay minutes"; InRa "# DONE"; Xong
# FIN
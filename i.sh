#!/bin/sh
PhienBan="20180815m"
export SetIP="0.1.2.3"; fName="hosts";
Nha="https://s8d.github.io/AdBlock"; uSed="${Nha}/Sed.txt"; uHost="${Nha}/Lists/iOS.txt";
#1__________________________________________________________________________________________________
export ONLINE=1
export QUIET=0
export SECURL=0
export DISTRIB=0
Kiem() { ! type "$1" > /dev/null; };
Pass2 () { if [[ $EUID -ne 0 ]]; then echo " Password incorrect!!! Please try again "; exit; fi }
if [ -f "${TMuc}/Location" ]; then
	if [ `whoami` != 'root' ]; then echo " Input pass and run again. "; G0='sudo'; $G0 -i; fi
	Pass2; else
	if [[ $EUID -ne 0 ]]; then echo " Input pass and run again. Default : alpine"; G0='su'; $G0 root; fi
	Pass2
fi
TenSR="$0"; ThamSo="$@";export ThuMay=$(date +"%u");
export TMuc=""$(cd "$(dirname "${0}")" && pwd)""
export MTam="${TMuc}/tmp";mkdir -p ${MTam};
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
if Kiem curl || Kiem logger || Kiem awk; then
	echo " Please add source https://electrarepo64.coolstar.org to Cydia "; printf '\n';
	echo ">>> Update Source";apt-get update; printf '\n';
	if Kiem curl; then echo ">>> Installing cURL"; apt-get install -y curl; fi
	if Kiem Kiem logger || Kiem awk || Kiem sed || Kiem grep; then echo ">>> Installing Core Utilities";
		for it in coreutils coreutils-bin gawk sed grep; do 	sudo apt-get install -y $it; done
	fi
fi
#_____________________________________________________
logger ">>> $(basename "$0") started"
export ScFile="${Data}/cacert.pem"
alias GetHTT="curl -f -s -k -L"; alias GetSSL="curl -f -s -k -L"
[ $SECURL -eq 1 ] && unalias GetSSL && alias GetSSL="curl -f -s --capath ${Data} --cacert $ScFile"
alias GetMHK="curl -f -s -A -L "Mozilla/5.0" -e http://forum.xda-developers.com/"
InRa () { [ $QUIET -eq 0 ] && echo "$1" ; echo "$1" >> $hLog; }
Size () { InRa "`du -h $1 | awk '{print $1}'`"; }
Xong () { 	logger ">>> $(basename "$0") finished"; rm -rf ${MTam}; exit 0; }
NetDown () { InRa "# NETWORK: DOWN | Please try again! "; }
DemLine () { Counts=$(cat $hChinh | wc -l | sed 's/^[ \t]*//'); InRa ">> Blocked: $Counts Hosts $(Size "$hChinh")"; }
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
CapNhat ()
{
	InRa ">>> Checking for updates...";
	if curl g.co -k -s -f -o /dev/null; then
		GetSSL tiny.cc/_i > $upTam;
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
					if ! [ ${TMuc} -ef ${aMuc} ] && ! [ ${TMuc} -ef ${iMuc} ]; then
						rm -f *.sh; rm -rf ${TMuc}/Data; rm -rf ${MTam}; 
					fi
					if [ -d "${iMuc}" ]; then cp $upTam ${iMuc}/$(basename "$0"); fi
					mv $upTam ${aMuc}/$(basename "$0");
				fi
				InRa ">>> $(basename "$0") updated to $vMoi "
			else
				InRa ">>> $(basename "$0") version: $PhienBan"
			fi
		else
			InRa ">>> Update failed. Try again."
		fi
	else
		NetDown
	fi
	Xong
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
Chay=`date +%s`
InRa "======================================="
InRa "|    AdBlock for iOS / Linux          |"
InRa "|    ${Nha}    |"
InRa "|    Author: Manish Parashar          |"
InRa "|    Editor: Darias                   |"
InRa "|    Version: $PhienBan                         ";
InRa "======================================="
InRa "   `date`";
if curl g.co -k -s -f -o /dev/null; then
	InRa "...Checking for updates..."
	GetSSL tiny.cc/i_ > $upTam;
	if [ 0 -eq $? ]; then
		MaCu=`md5sum $0 | cut -d' ' -f1`
		MaMoi=`md5sum $upTam | cut -d' ' -f1`
		if [ "$MaCu" != "$MaMoi" ]; then
			dv=`grep -w -m 1 "PhienBan" $upTam`; vMoi=$(echo $dv | sed 's/.*\=\"//; s/\"$//');
			InRa ">>> Updating new version..."
			BanCu=`grep -w -m 1 "PhienBan" $0 | cut -d \" -f2`
			if [ -f "${Data}/$BanCu.sh" ]; then
				mCu=$(echo "$MaCu" | cut -c1-5); cp $0 ${Data}/i\_$BanCu\_$mCu.sh; else
				cp $0 ${Data}/i\_$BanCu.sh;
			fi
			chmod 755 $upTam;
			if [ -f "${TMuc}/Location" ]; then mv $upTam $0; else
				if ! [ ${TMuc} -ef ${aMuc} ] && ! [ ${TMuc} -ef ${iMuc} ]; then
					rm -f *.sh; rm -rf ${TMuc}/Data; rm -rf ${MTam}; 
				fi
				if [ -d "${iMuc}" ]; then cp $upTam ${iMuc}/$(basename "$0"); fi
				mv $upTam ${aMuc}/$(basename "$0");
			fi
			InRa ">>> $(basename "$0") updated to $vMoi ";
			InRa ">>> Running $(basename "$0") $vMoi..."; $TenSR $ThamSo;
			Xong
		fi
	fi
	GetSSL ${uSed} > $fSed;dv=`grep -w -m 1 "Version" $fSed`;vers=$(echo $dv | sed 's/.*\=//');
	dv=`grep -w -m 1 "SedH" $fSed`;alias SedH="$(echo $dv | sed 's/.*\=\=//')"; printf '\n';
	dv=`grep -w -m 1 "ThongBao" $fSed`;ThongBao=$(echo $dv | sed 's/.*\=//'); echo "$ThongBao";
	dv=`grep -w -m 1 "ChangeLog" $fSed`;ChangeLog=$(echo $dv | sed 's/.*\=//'); echo "$ChangeLog"; printf '\n';
else
	NetDown; Xong
fi
#7__________________________________________________________________________________________________
if [ -f $pauseflag ] && { [ -f $hDung ]; }; then
	InRa "# USER FORGOT TO RESUME PROTECTION AFTER PAUSING"
	Bat
fi
if [ $ONLINE -eq 1 ] && curl g.co -k -s -f -o /dev/null; then
	InRa "# NETWORK: UP | MODE: ONLINE"
	InRa "# IP ADDRESS FOR ADS: $SetIP"
	InRa "# SECURE [0=NO | 1=YES]: $SECURL"
	if [ ! -f ${Data}/cacert.pem  ] || { [ "${ThuMay}" -eq 1 ] || [ "${ThuMay}" -eq 4 ]; }; then
		InRa "> Downloading cURL certificates"
		GetSSL https://curl.haxx.se/ca/cacert.pem > ${Data}/cacert.pem
	fi
#8__________________________________________________________________________________________________
	if [ $DISTRIB -eq 0 ] && { [ -s "$denOff" ] || [ -s "$trangOff" ]; }; then
		InRa "> Compacting Black/WhiteList"
		cat $denOff | SedH > blTam && mv blTam $denOff; cat $denOff > $tbl;
		cat $trangOff | SedH > wlTam && mv wlTam $trangOff; cat $trangOff | grep -Fvwf $denOff > $twl;
	fi
#9__________________________________________________________________________________________________
	InRa "# Downloading Hosts file";
	GetSSL ${uHost} > $tam;hv=`grep -w -m 1 "#hVersion" $tam`;hvers=$(echo $hv | sed 's/.*\=//');
	cat $tam | SedH | cat $tbl - | grep -Fvwf $twl | awk -v "IP=$SetIP" '{sub(/\r$/,""); print IP" "$0}' > $hTam;
	InRa "   $(basename "$0") version: $PhienBan";
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
InRa "# Total time: $Phut:$Giay minutes"
InRa "# DONE"
Xong
# FIN
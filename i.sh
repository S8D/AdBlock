#!/bin/sh
PhienBan="20180808i"
export SetIP="0.1.2.3";
fName="hosts"
Nha="https://s8d.github.io/AdBlock";uSed="${Nha}/Sed.txt";
#__________________________________________________________________________________________________
export ONLINE=1
export QUIET=0
export SECURL=0
export DAYOFWEEK=$(date +"%u")
export TMuc=""$(cd "$(dirname "${0}")" && pwd)""
export TMTam="${TMuc}/tmp";mkdir -p ${TMTam};mkdir -p ${TMuc}/Data;
export fSed="${TMTam}/Sed"
export hChinh="/etc/${fName}";export hDung="${TMuc}/${fName}.zzz";
if [ ! -f $hChinh ];then
	echo -n "" > $hChinh
fi
export hLog="${TMuc}/Data/h.log";export pauseflag="${TMuc}/PAUSED";
export SHELL=/bin/sh
export PATH=/bin:/usr/bin:/sbin:/usr/sbin:/jffs/sbin:/jffs/bin:/jffs/usr/sbin:/jffs/usr/bin:/mmc/sbin:/mmc/bin:/mmc/usr/sbin:/mmc/usr/bin:/opt/sbin:/opt/bin:/opt/usr/sbin:/opt/usr/bin:"${TMuc}"
export LD_LIBRARY_PATH=/lib:/usr/lib:/jffs/lib:/jffs/usr/lib:/jffs/usr/local/lib:/mmc/lib:/mmc/usr/lib:/opt/lib:/opt/usr/lib
export PWD="${TMuc}"
#__________________________________________________________________________________________________
cd "${TMuc}"
logger ">>> $(basename "$0") started"
if [ -z "$(which curl)" ]; then
	echo ">>> WARNING: cURL not found"
	echo ">>> ERROR: ABORTING"
	exit 1
fi
export ScURL="${TMuc}/Data/cacert.pem"
alias GetHTT="curl -f -s -k -L"
alias GetSSL="curl -f -s -k -L"
[ $SECURL -eq 1 ] && unalias GetSSL && alias GetSSL="curl -f -s --capath ${TMuc}/Data --cacert $ScURL"
alias GetMHK="curl -f -s -A -L "Mozilla/5.0" -e http://forum.xda-developers.com/"
InRa ()
{
	[ $QUIET -eq 0 ] && echo "$1"
	echo "$1" >> $hLog
}
Size ()
{
	InRa "`du -h $1 | awk '{print $1}'`"
}
Bat ()
{
	if [ -f $pauseflag ] && { [ -f $hDung ]; }; then
		InRa ">>> RESUMING PROTECTION"
		mv $hDung $hChinh
		rm -f $pauseflag
		ReBoot
	fi
	logger ">>> $(basename "$0") finished"
	exit 0
}
Tat ()
{
	InRa ">>> WARNING: PAUSING PROTECTION"
	[ -f $hChinh ] && mv $hChinh $hDung
	echo "" > $hChinh
	echo "PAUSED" > $pauseflag
	ReBoot
	InRa ">>> Type $(basename "$0") --resume to resume protection."
	logger ">>> $(basename "$0") finished"
	exit 0
}
#__________________________________________________________________________________________________
Giup ()
{
	echo ""
	echo "USAGE:"
	printf '\t'; echo "$(basename "$0") [-? | -h | --help] [-v | --version] [-1] [-2] [-b | --bl=<domain.name>] [-w | --wl=<domain.name>] ..."
	echo ""
	echo "OPERATION:"
	printf '\t'; echo -n "[-i | --ip=]"; printf '\t'; echo -n "ip.ad.dr.ss"; printf '\t'; echo "Send ads to this IP, default: $SetIP"
	printf '\t'; echo -n "[-q | --quiet]"; printf '\t\t\t'; echo "Print outout to log file only"
	printf '\t'; echo -n "[-p | --pause]"; printf '\t\t\t'; echo "Pause protection"
	printf '\t'; echo -n "[-r | --resume]"; printf '\t\t\t'; echo "Resume protection"
	printf '\t'; echo -n "[-s | --secure]"; printf '\t\t\t'; echo "Use cURL CA certs for secure file transfer"
	printf '\t'; echo -n "[-h | --help]"; printf '\t\t\t'; echo "Display this help screen and exit"
	printf '\t'; echo -n "[-u | --update]"; printf '\t\t\t'; echo "Update $(basename "$0") to the latest version"
	printf '\t'; echo -n "[-v | --version]"; printf '\t\t'; echo "Print $(basename "$0") version and exit"
	echo ""
	echo "EXAMPLES:"
	printf '\t'; echo "$(basename "$0") -s2 --ip=172.31.255.254 "
	echo ""
	logger ">>> $(basename "$0") finished"
	exit 0
}
#__________________________________________________________________________________________________
CapNhat ()
{
	upTam="${TMTam}/update"
	InRa ">>> Checking for updates..."
	if ping -q -c 1 -W 1 ip.gg.gg >/dev/null; then
		GetSSL ${Nha}/$(basename "$0") > $upTam
		if [ 0 -eq $? ]; then
			MaCu=`md5sum $0 | cut -d' ' -f1`
			MaMoi=`md5sum $upTam | cut -d' ' -f1`
			if [ "$MaCu" != "$MaMoi" ]; then
				dv=`grep -w -m 1 "PhienBan" $upTam`; vMoi=$(echo $dv | sed 's/.*\=\"//; s/\"$//');
				InRa ">>> Update available: $vMoi"
				BanCu=`grep -w -m 1 "PhienBan" $0 | cut -d \" -f2`
				if [ -f "${TMuc}/Data/$BanCu.sh" ];then
					mCu=$(echo "$MaCu" | cut -c1-5);	cp $0 ${TMuc}/Data/$BanCu\_$mCu.sh;else
					cp $0 ${TMuc}/Data/$BanCu.sh;
				fi
				chmod 755 $upTam;mv $upTam $0
				InRa ">>> Updated to the latest version."
			else
				InRa ">>> Current version: $PhienBan"
			fi
		else
			InRa ">>> Update failed. Try again."
		fi
		rm -rf ${TMTam};
	fi
	logger ">>> $(basename "$0") finished"
	exit 0
}
DemGio ()
{
	Dung=`date +%s`;Phut=$(( $((Dung - Chay)) /60 ));Giay=$(( $((Dung - Chay)) %60 ));
}
#__________________________________________________________________________________________________
while getopts "h?v0123fFdDpPqQrRsSoOuUb:w:i:-:" opt; do
	case ${opt} in
		h|\? ) Giup ;;
		v    ) echo ">>> Current version: $PhienBan" ; logger ">>> $(basename "$0") finished" ;rm -rf ${TMTam}; exit 0 ;;
		q|Q  ) QUIET=1 ;;
		p|P  ) Tat ;;
		r|R  ) Bat ;;
		s|S  ) SECURL=1 ;;
		u|U  ) CapNhat ;;
		i    ) SetIP="$OPTARG" ;;
		-    ) LONG_OPTARG="${OPTARG#*=}"
		case $OPTARG in
			ip=?*   ) ARG_IP="$LONG_OPTARG" ; SetIP=$ARG_IP ;;
			ip*     ) echo ">>> ERROR: no arguments for --$OPTARG option" >&2; exit 2 ;;
			4    ) [4 ;;
			quiet   ) QUIET=1 ;;
			pause   ) Tat ;;
			resume  ) Bat ;;
			secure  ) SECURL=1 ;;
			help    ) Giup ;;
			update  ) CapNhat ;;
			version ) echo "$PhienBan" ; logger ">>> $(basename "$0") finished" ; exit 0 ;;
			4* | quiet* | pause* | resume* | secure* | help* | update* | version* )
					echo ">>> ERROR: no arguments allowed for --$OPTARG option" >&2; exit 2 ;;
			'' )	break ;;
			* )		echo ">>> ERROR: unsupported option --$OPTARG" >&2; exit 2 ;;
		esac ;;
	\? ) exit 2 ;;
	esac
done
shift $((OPTIND-1))
#__________________________________________________________________________________________________
Chay=`date +%s`
InRa "======================================="
InRa "|    AdBlock for iOS                  |"
InRa "|    ${Nha}    |"
InRa "|    Author: Manish Parashar          |"
InRa "|    Editor: Darias                   |"
InRa "======================================="
InRa "   `date`"
GetSSL ${uSed} > $fSed;dv=`grep -w -m 1 "Version" $fSed`;vers=$(echo $dv | sed 's/.*\=//');
dv=`grep -w -m 1 "SedBW" $fSed`;alias SedBW="$(echo $dv | sed 's/.*\=\=//')";
InRa "   .sh version: $PhienBan"
InRa "   Sed version: $vers. Size: $(Size "$fSed")";
#__________________________________________________________________________________________________
if [ -f $pauseflag ] && { [ -f $hDung ]; }; then
	InRa "# USER FORGOT TO RESUME PROTECTION AFTER PAUSING"
	Bat
fi
if [ $ONLINE -eq 1 ] && ping -q -c 1 -W 1 ip.gg.gg >/dev/null; then
	InRa "# NETWORK: UP | MODE: ONLINE"
	InRa "# IP ADDRESS FOR ADS: $SetIP"
	InRa "# SECURE [0=NO | 1=YES]: $SECURL"
	InRa "# [0|1|2|3|4]: $Level"
	if [ ! -s ${TMuc}/Data/cacert.pem  ] || { [ "${DAYOFWEEK}" -eq 1 ] || [ "${DAYOFWEEK}" -eq 4 ]; }; then
		InRa "> Downloading cURL certificates"
		GetSSL https://curl.haxx.se/ca/cacert.pem > ${TMuc}/Data/cacert.pem 
	fi
#__________________________________________________________________________________________________
	InRa "> Downloading Hosts file"
	GetSSL ${Nha}/Lists/iOS.txt | SedBW | awk -v "IP=$SetIP" '{sub(/\r$/,""); print IP" "$0}'> $hChinh;InRa "# Size of Hosts is: $(Size "$hChinh")";
fi
Counts=$(cat $hChinh | wc -l | sed 's/^[ \t]*//');InRa ">> Blocked: $Counts Hosts $(Size "$hChinh")";
DemGio
InRa "# Total time: $Phut:$Giay minutes"
InRa "# DONE"
logger ">>> $(basename "$0") finished"
exit 0
# FIN
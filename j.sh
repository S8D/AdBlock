#!/bin/sh
PhienBan="20180811f"
export SetIP="0.1.2.3";fName="hosts";
Nha="https://s8d.github.io/AdBlock"; uSed="${Nha}/Sed.txt"; uHost="${Nha}/Lists/iOS.txt"
#__________________________________________________________________________________________________
export ONLINE=1
export QUIET=0
export SECURL=0
export DAYOFWEEK=$(date +"%u")
export TMuc=""$(cd "$(dirname "${0}")" && pwd)""
export TMTam="${TMuc}/tmp";mkdir -p ${TMTam};
export Data="${TMuc}/Data";mkdir -p ${Data};
export fSed="${TMTam}/Sed";export fHost="${TMTam}/Host";
export tam="${TMTam}/tam";export hTam="${TMTam}/ht.tmp";
if [ -f "${TMuc}/Location" ];then
	export hChinh="${TMuc}/${fName}";else
	export hChinh="/etc/${fName}";
fi
export hDung="${TMuc}/${fName}.zzz";
if [ ! -f $hChinh ];then
	echo -n "" > $hChinh
fi
export hLog="${Data}/h.log";export pauseflag="${TMuc}/PAUSED";
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
export ScURL="${Data}/cacert.pem"
alias GetHTT="curl -f -s -k -L"
alias GetSSL="curl -f -s -k -L"
[ $SECURL -eq 1 ] && unalias GetSSL && alias GetSSL="curl -f -s --capath ${Data} --cacert $ScURL"
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
Xong ()
{
	logger ">>> $(basename "$0") finished";rm -rf ${TMTam};exit 0
}
DemLine ()
{
	Counts=$(cat $hChinh | wc -l | sed 's/^[ \t]*//');InRa ">> Blocked: $Counts Hosts $(Size "$hChinh")";
}
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
	if [ -f "${Data}/Hosts" ];then
		cp ${Data}/Hosts $hChinh;else
		GetSSL ${Nha}/Lists/hosts > ${Data}/Hosts && cp ${Data}/Hosts $hChinh;
	fi
	echo "PAUSED" > $pauseflag
	InRa ">>> Type $(basename "$0") --resume to resume protection."
	Xong
}
#__________________________________________________________________________________________________
Giup ()
{
	echo ""
	echo "USAGE:"
	printf '\t'; echo "$(basename "$0") [-? | -h | --help] [-v | --version] ..."
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
	Xong
}
#__________________________________________________________________________________________________
CapNhat ()
{
	upTam="${TMTam}/u.sh"
	InRa ">>> Checking for updates..."
	if ping -q -c 1 -W 1 ip.gg.gg >/dev/null; then
		GetSSL http://gg.gg/ib_ > $upTam;
		if [ 0 -eq $? ]; then
			MaCu=`md5sum $0 | cut -d' ' -f1`
			MaMoi=`md5sum $upTam | cut -d' ' -f1`
			if [ "$MaCu" != "$MaMoi" ]; then
				dv=`grep -w -m 1 "PhienBan" $upTam`; vMoi=$(echo $dv | sed 's/.*\=\"//; s/\"$//');
				InRa ">>> Update available: $vMoi"
				BanCu=`grep -w -m 1 "PhienBan" $0 | cut -d \" -f2`
				if [ -f "${Data}/$BanCu.sh" ];then
					mCu=$(echo "$MaCu" | cut -c1-5);	cp $0 ${Data}/$BanCu\_$mCu.sh;else
					cp $0 ${Data}/$BanCu.sh;
				fi
				chmod 755 $upTam;mv $upTam $0
				InRa ">>> Updated to the latest version."
			else
				InRa ">>> Current version: $PhienBan"
			fi
		else
			InRa ">>> Update failed. Try again."
		fi
	fi
	Xong
}
DemGio ()
{
	Dung=`date +%s`;Phut=$(( $((Dung - Chay)) /60 ));Giay=$(( $((Dung - Chay)) %60 ));
}
#__________________________________________________________________________________________________
while getopts "h?v0123fFdDpPqQrRsSoOuUb:w:i:-:" opt; do
	case ${opt} in
		h|\? ) Giup ;;
		v    ) echo ">>> Current version: $PhienBan" ; Xong ;;
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
	if [ ! -s ${Data}/cacert.pem  ] || { [ "${DAYOFWEEK}" -eq 1 ] || [ "${DAYOFWEEK}" -eq 4 ]; }; then
		InRa "> Downloading cURL certificates"
		GetSSL https://curl.haxx.se/ca/cacert.pem > ${Data}/cacert.pem 
	fi
#__________________________________________________________________________________________________
	InRa "# Downloading Hosts file"
	GetSSL ${uHost} > $tam;hv=`grep -w -m 1 "#hVersion" $tam`;hvers=$(echo $hv | sed 's/.*\=//');
	cat $tam | SedBW | awk -v "IP=$SetIP" '{sub(/\r$/,""); print IP" "$0}'> $hTam;
	Counts=$(cat $hTam | wc -l | sed 's/^[ \t]*//');
	if [ $dCounts -eq 0 ]; then
		InRa ">>> Process failed! Please try again."
		DemLine; Xong; else
		mv $hTam $hChinh;
		Counts=$(cat $hChinh | wc -l | sed 's/^[ \t]*//');
		InRa "> Hosts version: $hvers | Blocked: $Counts Hosts | Size $(Size "$hChinh")";
	fi
	else
		InRa "# NETWORK: DOWN | Please try again! "
		DemLine; Xong;
fi
DemGio
InRa "# Total time: $Phut:$Giay minutes"
InRa "# DONE"
Xong
# FIN
#!/bin/sh
VERSION="201807++"
PhienBan="20180807b"
export SetIP="0.1.2.3";export Level=4;
Nha="https://s8d.github.io/AdBlock"
d="http://gg.gg/d_";dName="d.sh";
u00="${Nha}/Lists/Domains.txt"
u01="http://gg.gg/u01_";u02="http://gg.gg/u02_";u03="http://gg.gg/u03_";u04="http://gg.gg/u04_";u05="http://gg.gg/u05_";
u06="http://gg.gg/u06_";u07="http://gg.gg/u07_";u08="http://gg.gg/u08_";u09="http://gg.gg/u09_";u10="http://gg.gg/u10_";
u11="http://gg.gg/u11_";u12="http://gg.gg/u12_";u13="http://gg.gg/u13_";u14="http://gg.gg/u14_";u15="http://gg.gg/u15_";
u16="http://gg.gg/u16_";u17="http://gg.gg/u17_";u18="http://gg.gg/u18_";u19="http://gg.gg/u19_";u20="http://gg.gg/u20_";
u21="http://gg.gg/u21_";u22="http://gg.gg/u22_";u23="http://gg.gg/u23_";u24="http://gg.gg/u24_";u25="http://gg.gg/u25_";
u26="http://gg.gg/u26_";u27="http://gg.gg/u27_";u28="http://gg.gg/u28_";u29="http://gg.gg/u29_";u30="http://gg.gg/u30_";
u31="http://gg.gg/u31_";u32="http://gg.gg/u32_";u33="http://gg.gg/u33_";u34="http://gg.gg/u34_";u35="http://gg.gg/u35_";
u36="http://gg.gg/u36_";u37="http://gg.gg/u37_";u38="http://gg.gg/u38_";u39="http://gg.gg/u39_";u40="http://gg.gg/u40_";
u41="http://gg.gg/u41_";u42="http://gg.gg/u42_";u43="http://gg.gg/u43_";u44="http://gg.gg/u44_";u45="http://gg.gg/u45_";
u46="http://gg.gg/u46_";u47="http://gg.gg/u47_";u48="http://gg.gg/u48_";u49="http://gg.gg/u49_";u50="http://gg.gg/u50_";
u51="http://gg.gg/u51_";u52="http://gg.gg/u52_";u53="http://gg.gg/u53_";u54="http://gg.gg/u54_";u55="http://gg.gg/u55_";
u56="http://gg.gg/u56_";u57="http://gg.gg/u57_";u58="http://gg.gg/u58_";u59="http://gg.gg/u59_";u60="http://gg.gg/u60_";
u61="http://gg.gg/u61_";u62="http://gg.gg/u62_";u63="http://gg.gg/u63_";u64="http://gg.gg/u64_";u65="http://gg.gg/u65_";
u66="http://gg.gg/u66_";u67="http://gg.gg/u67_";u68="http://gg.gg/u68_";u69="http://gg.gg/u69_";u70="http://gg.gg/u70_";
u71="http://gg.gg/u71_";u72="http://gg.gg/u72_";u73="http://gg.gg/u73_";u74="http://gg.gg/u74_";u75="http://gg.gg/u75_";
u76="http://gg.gg/u76_";u77="http://gg.gg/u77_";u78="http://gg.gg/u78_";u79="http://gg.gg/u79_";u80="http://adblock.mahakala.is/hosts";
u81="http://gg.gg/u81_";u82="http://gg.gg/u82_";u83="http://gg.gg/u83_";u84="http://gg.gg/u84_";u85="http://gg.gg/u85_";
u86="http://gg.gg/u86_";u87="http://gg.gg/u87_";u88="http://gg.gg/u88_";u89="http://gg.gg/u89_";u90="http://gg.gg/u90_";
u91="http://gg.gg/u91_";u92="http://gg.gg/u92_";u93="http://gg.gg/u93_";u94="http://gg.gg/u94_";u95="http://gg.gg/u95_";
u96="http://gg.gg/u96_";u97="http://gg.gg/u97_";u98="http://gg.gg/u98_";u99="http://gg.gg/u99_";u100="http://gg.gg/u100_";
#__________________________________________________________________________________________________
SedBW="s|#.*$||; s|^[^.]+$||; /^$/d";
alias SedFN="sed -r 's/\.$//; s|^[^.]+$||; /^$/d'"
export NOFB=0
export ONLINE=1
export QUIET=0
export SECURL=0
export ThuMay=$(date +"%u")
export upTam="${MTam}/u.sh"	
export DISTRIB=0
export TMuc=""$(cd "$(dirname "${0}")" && pwd)""
export MTam="${TMuc}/tmp";mkdir -p ${MTam};mkdir -p ${TMuc}/Lists;
export Lv0="${MTam}/lv0";export Lv00="${MTam}/lv00";export Lv1="${MTam}/lv1";export Lv2="${MTam}/lv2";
export Lv3="${MTam}/lv3";export Lv4="${MTam}/lv4";
export dsh="${TMuc}/${dName}"
export hChinh="${TMuc}/h";export hDung="${TMuc}/h.zzz";
export hTam="${MTam}/h.tmp";export tam="${MTam}/t.tmp";
export tbl="${MTam}/bl.tmp";export twl="${MTam}/wl.tmp";
export dChinh="${TMuc}/d";export dDung="${TMuc}/d.zzz";export dTam="${MTam}/d.tmp";
export hLog="${TMuc}/h.log";export pauseflag="${TMuc}/PAUSED";
export denOn="${TMuc}/Lists/den.on";export trangOn="${TMuc}/Lists/trang.on";
export denOff="${TMuc}/Lists/den.off";export trangOff="${TMuc}/Lists/trang.off";
if [ ! -f $denOff ];then
    echo -n "" > $denOff
fi
if [ ! -f $trangOff ];then
    echo -n "" > $trangOff
fi
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
export CURL_CA_BUNDLE="${TMuc}/cacert.pem"
alias GetHTT="curl -f -s -k -L"
alias GetSSL="curl -f -s -k -L"
[ $SECURL -eq 1 ] && unalias GetSSL && alias GetSSL="curl -f -s --capath ${TMuc} --cacert $CURL_CA_BUNDLE"
alias GetMHK="curl -f -s -A -L "Mozilla/5.0" -e http://forum.xda-developers.com/"
InRa () { [ $QUIET -eq 0 ] && echo "$1"; echo "$1" >> $hLog; }
Size () { InRa "`du -h $1 | awk '{print $1}'`"; }
ReBoot () { logger ">>> $(basename "$0") restarting dnsmasq"; restart_dns &; logger ">>> $(basename "$0") restarted dnsmasq"; }
Xong () { 	logger ">>> $(basename "$0") finished"; rm -rf ${MTam}; exit 0; }
NetDown () { InRa "# NETWORK: DOWN | Please try again! "; }
Bat ()
{
	if [ -f $pauseflag ] && { [ -f $hDung ] || [ -f $dDung ]; }; then
		InRa ">>> RESUMING PROTECTION"
		mv $hDung $hChinh
		mv $dDung $dChinh
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
	[ -f $dChinh ] && mv $dChinh $dDung
	echo "" > $hChinh
	echo "" > $dChinh
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
	printf '\t'; echo -n "[-0]"; printf '\t\t\t\t'; echo "Level [0]: safe minimum protection"
	printf '\t'; echo -n "[-1]"; printf '\t\t\t\t'; echo "Level [1]: increased protection"
	printf '\t'; echo -n "[-2]"; printf '\t\t\t\t'; echo "Level [2]: optimum protection"
	printf '\t'; echo -n "[-3]"; printf '\t\t\t\t'; echo "Level [3]: unlock maximum protection"
	printf '\t'; echo -n "[-4]"; printf '\t\t\t\t'; echo "Level [4]: unlock Ultra protection [DEFAULT]"
	printf '\t'; echo -n "[-f]"; printf '\t\t\t\t'; echo "Block Facebook and Messenger services"
	printf '\t'; echo -n "[-F]"; printf '\t\t\t\t'; echo "Block Facebook, Messenger, Instagram, WhatsApp"
	printf '\t'; echo -n "[-d | -D]"; printf '\t\t\t'; echo "Ignore denOff/trangOff entries"
	printf '\t'; echo -n "[-b | --bl=]"; printf '\t'; echo -n "domain.name"; printf '\t'; echo "Add domain.name to denOff"
	printf '\t'; echo -n "[-w | --wl=]"; printf '\t'; echo -n "domain.name"; printf '\t'; echo "Add domain.name to trangOff"
	printf '\t'; echo -n "[-i | --ip=]"; printf '\t'; echo -n "ip.ad.dr.ss"; printf '\t'; echo "Send ads to this IP, default: $SetIP"
	printf '\t'; echo -n "[-q | --quiet]"; printf '\t\t\t'; echo "Print outout to log file only"
	printf '\t'; echo -n "[-p | --pause]"; printf '\t\t\t'; echo "Pause protection"
	printf '\t'; echo -n "[-r | --resume]"; printf '\t\t\t'; echo "Resume protection"
	printf '\t'; echo -n "[-s | --secure]"; printf '\t\t\t'; echo "Use cURL CA certs for secure file transfer"
	printf '\t'; echo -n "[-o | --offline]"; printf '\t\t'; echo "Process local lists without downloading"
	printf '\t'; echo -n "[-h | --help]"; printf '\t\t\t'; echo "Display this help screen and exit"
	printf '\t'; echo -n "[-u | --update]"; printf '\t\t\t'; echo "Update $(basename "$0") to the latest version"
	printf '\t'; echo -n "[-v | --version]"; printf '\t\t'; echo "Print $(basename "$0") version and exit"
	echo ""
	echo "EXAMPLES:"
	printf '\t'; echo "$(basename "$0") -s2 --ip=172.31.255.254 --bl=example1.com --wl=example2.com"
	printf '\t'; echo "$(basename "$0") -3Fqs -b example1.com -w example2.com --wl=example3.com"
	echo ""
	logger ">>> $(basename "$0") finished"
	exit 0
}
#__________________________________________________________________________________________________
CapNhat ()
{
	InRa ">>> Checking for updates..."
	if ping -q -c 1 -W 1 google.com >/dev/null; then
		GetSSL ${Nha}/Scripts/$(basename "$0") > $upTam
		if [ 0 -eq $? ]; then
			old_md5=`md5sum $0 | cut -d' ' -f1`
			new_md5=`md5sum $upTam | cut -d' ' -f1`
			if [ "$old_md5" != "$new_md5" ]; then
				dv=`grep -w -m 1 "PhienBan" $upTam`;NEWVER=$(echo $dv | sed 's/.*\=\"//; s/\"$//');
				InRa ">>> Update available: $NEWVER"
				OLDVER=`grep -w -m 1 "PhienBan" $0 | cut -d \" -f2`
				cp $0 $0.$OLDVER
				chmod 755 $upTam
				mv $upTam $0
				InRa ">>> Updated to the latest version."
			else
				InRa ">>> Current version: $PhienBan"
			fi
		else
			InRa ">>> Update failed. Try again."
		fi
		rm -rf ${MTam};
	fi
	logger ">>> $(basename "$0") finished"
	exit 0
}
#__________________________________________________________________________________________________
while getopts "h?v0123fFdDpPqQrRsSoOuUb:w:i:-:" opt; do
	case ${opt} in
		h|\? ) Giup ;;
		v    ) echo ">>> Current version: $PhienBan" ; logger ">>> $(basename "$0") finished" ;rm -rf ${MTam}; exit 0 ;;
		0    ) [0 ;;
		1    ) [1 ;;
		2    ) [2 ;;
		3    ) [3 ;;
		f    ) NOFB="f" ;;
		F    ) NOFB="F" ;;
		d|D  ) DISTRIB=1 ;;
		q|Q  ) QUIET=1 ;;
		p|P  ) Tat ;;
		r|R  ) Bat ;;
		s|S  ) SECURL=1 ;;
		o|O  ) ONLINE=0 ;;
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
			4    ) [4 ;;
			quiet   ) QUIET=1 ;;
			pause   ) Tat ;;
			resume  ) Bat ;;
			secure  ) SECURL=1 ;;
			offline ) ONLINE=0 ;;
			help    ) Giup ;;
			update  ) CapNhat ;;
			version ) echo "$PhienBan" ; logger ">>> $(basename "$0") finished" ; exit 0 ;;
			4* | quiet* | pause* | resume* | secure* | offline* | help* | update* | version* )
					echo ">>> ERROR: no arguments allowed for --$OPTARG option" >&2; exit 2 ;;
			'' )    break ;;
			* )     echo ">>> ERROR: unsupported option --$OPTARG" >&2; exit 2 ;;
		esac ;;
  	  \? ) exit 2 ;;
	esac
done
shift $((OPTIND-1))
#__________________________________________________________________________________________________
TIMERSTART=`date +%s`
InRa "======================================================"
InRa "|      AdBlock for DD-WRT/Android base on Linux      |"
InRa "|      ${Nha}                 |"
InRa "|      Author: Manish Parashar                       |"
InRa "|      Editor: Darias                                |"
InRa "======================================================"
InRa "             `date`"
InRa "# PhienBan: $PhienBan"
if curl g.co -k -s -f -o /dev/null; then
	InRa "...Checking for updates..."
	GetSSL ${Nha}/Scripts/$(basename "$0") > $upTam;
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
			chmod 755 $upTam; mv $upTam $0
			InRa ">>> $(basename "$0") updated to $vMoi ";
			InRa ">>> Running $(basename "$0") $vMoi..."; $TenSR $ThamSo;
			Xong
		fi
	fi
else
	NetDown; Xong
fi
GetSSL ${d} > $dsh;dv=`grep -w -m 1 "dVersion" $dsh`;vers=$(echo $dv | sed 's/.*\=\"//; s/\"$//');
InRa "> s.sh version: $PhienBan"
InRa "> d.sh version: $vers. Size: $(Size "$dsh")";
if [ -x $dsh ];then
	chmod +x $dsh
fi
#__________________________________________________________________________________________________
if [ -f $pauseflag ] && { [ -f $hDung ] || [ -f $dDung ]; }; then
	InRa "# USER FORGOT TO RESUME PROTECTION AFTER PAUSING"
	Bat
fi
if [ $ONLINE -eq 1 ] && ping -q -c 1 -W 1 google.com >/dev/null; then

	InRa "# NETWORK: UP | MODE: ONLINE"
	InRa "# IP ADDRESS FOR ADS: $SetIP"
	InRa "# SECURE [0=NO | 1=YES]: $SECURL"
	InRa "# [0|1|2|3|4]: $Level"

	if [ ! -f cacert.pem ] || { [ "${ThuMay}" -eq 1 ] || [ "${ThuMay}" -eq 4 ]; }; then
		InRa "> Downloading cURL certificates"
		GetSSL --remote-name --time-cond cacert.pem https://curl.haxx.se/ca/cacert.pem
	fi
	#__________________________________________________________________________________________________
	InRa "> Downloading Black/WhiteList Online"
	GetSSL ${Nha}/Lists/Den.txt > $denOn;InRa "# Size of Black is: $(Size "$denOn")";
	GetSSL ${Nha}/Lists/Trang.txt > $tam;InRa "# Size of White is: $(Size "$tam")";cat $tam > $trangOn;
	GetSSL ${Nha}/Lists/Apple.txt > $tam;InRa "# Size of Apple is: $(Size "$tam")";cat $tam >> $trangOn;
	InRa "> Compacting Black/WhiteList Online"
	LC_ALL=C cat $denOn | sed -r "${SedBW}" > $tbl && cp $tbl $denOn
	LC_ALL=C cat $trangOn | sed -r "${SedBW}" > $twl && cp $twl $trangOn
#__________________________________________________________________________________________________
	InRa ">> Unlocking [0]"
	GetSSL ${u00} > $tam;InRa "# Size of Domains is: $(Size "$tam")";cat $tam | sed -r 's|.*\=\/||; s|\/.*$||' > $dTam
#__________________________________________________________________________________________________
	GetSSL ${u01} > $tam;InRa "# Size of ${u01} is: $(Size "$tam")";cat $tam > $Lv0;
	GetSSL ${u02} > $tam;InRa "# Size of ${u02} is: $(Size "$tam")";cat $tam >> $Lv0;
	GetSSL -d mimetype=plaintext -d hostformat=dnsmasq ${u03} > $tam;InRa "# Size of ${u03} is: $(Size "$tam")";cat $tam >> $Lv0;
	GetSSL ${u04} > $tam;InRa "# Size of ${u04} is: $(Size "$tam")";cat $tam >> $Lv0;
	GetSSL ${u05} > $tam;InRa "# Size of ${u05} is: $(Size "$tam")";cat $tam >> $Lv0;
	GetSSL ${u06} > $tam;InRa "# Size of ${u06} is: $(Size "$tam")";cat $tam >> $Lv0;
	GetSSL ${u07} > $tam;InRa "# Size of ${u07} is: $(Size "$tam")";cat $tam >> $Lv0;
	GetSSL ${u08} > $tam;InRa "# Size of ${u08} is: $(Size "$tam")";cat $tam >> $Lv0;
	GetSSL ${u09} > $tam;InRa "# Size of ${u09} is: $(Size "$tam")";cat $tam >> $Lv0;
	GetSSL ${u10} > $tam;InRa "# Size of ${u10} is: $(Size "$tam")";cat $tam >> $Lv0;
	GetSSL ${u11} > $tam;InRa "# Size of ${u11} is: $(Size "$tam")";cat $tam >> $Lv0;
	GetSSL ${u12} > $tam;InRa "# Size of ${u12} is: $(Size "$tam")";cat $tam >> $Lv0;
	GetSSL ${u13} > $tam;InRa "# Size of ${u13} is: $(Size "$tam")";cat $tam >> $Lv0;
	GetSSL ${u14} > $tam;InRa "# Size of ${u14} is: $(Size "$tam")";cat $tam >> $Lv0;
	GetSSL ${u15} > $tam;InRa "# Size of ${u15} is: $(Size "$tam")";cat $tam >> $Lv0;
	GetSSL ${u16} > $tam;InRa "# Size of ${u16} is: $(Size "$tam")";cat $tam >> $Lv0;
	GetSSL ${u17} > $tam;InRa "# Size of ${u17} is: $(Size "$tam")";cat $tam >> $Lv0;
	GetSSL ${u18} > $tam;InRa "# Size of ${u18} is: $(Size "$tam")";cat $tam >> $Lv0;
	GetSSL ${u19} > $tam;InRa "# Size of ${u19} is: $(Size "$tam")";cat $tam >> $Lv0;
	InRa "# Downloaded [0]: $(Size "$Lv0")";sh $dsh;
#__________________________________________________________________________________________________
	GetSSL ${u90} > $tam;InRa "# Size of ${u90} is: $(Size "$tam")";cat $tam > $Lv00;
	GetSSL ${u91} > $tam;InRa "# Size of ${u91} is: $(Size "$tam")";cat $tam >> $Lv00;
	GetSSL ${u92} > $tam;InRa "# Size of ${u92} is: $(Size "$tam")";cat $tam >> $Lv00;
	GetSSL ${u93} > $tam;InRa "# Size of ${u93} is: $(Size "$tam")";cat $tam >> $Lv00;
	GetSSL ${u94} > $tam;InRa "# Size of ${u94} is: $(Size "$tam")";cat $tam >> $Lv00;
	GetSSL ${u95} > $tam;InRa "# Size of ${u95} is: $(Size "$tam")";cat $tam >> $Lv00;
	GetSSL ${u96} > $tam;InRa "# Size of ${u96} is: $(Size "$tam")";cat $tam >> $Lv00;
	GetSSL ${u97} > $tam;InRa "# Size of ${u97} is: $(Size "$tam")";cat $tam >> $Lv00;
	GetSSL ${u98} > $tam;InRa "# Size of ${u98} is: $(Size "$tam")";cat $tam >> $Lv00;
	GetSSL ${u99} > $tam;InRa "# Size of ${u99} is: $(Size "$tam")";cat $tam >> $Lv00;
	InRa "# Downloaded [0.5]: $(Size "$Lv00")";sh $dsh;	
#__________________________________________________________________________________________________
	if [ $Level -ge 1 ]; then
		InRa ">> Unlocking [1]"
		GetSSL ${u20} > $tam;InRa "# Size of ${u20} is: $(Size "$tam")";cat $tam > $Lv1;
		GetSSL ${u21} > $tam;InRa "# Size of ${u21} is: $(Size "$tam")";cat $tam >> $Lv1;
		GetSSL ${u22} > $tam;InRa "# Size of ${u22} is: $(Size "$tam")";cat $tam >> $Lv1;
		GetSSL ${u23} > $tam;InRa "# Size of ${u23} is: $(Size "$tam")";cat $tam >> $Lv1;
		GetSSL ${u24} > $tam;InRa "# Size of ${u24} is: $(Size "$tam")";cat $tam >> $Lv1;
		GetSSL ${u25} > $tam;InRa "# Size of ${u25} is: $(Size "$tam")";cat $tam >> $Lv1;
		GetSSL ${u26} > $tam;InRa "# Size of ${u26} is: $(Size "$tam")";cat $tam >> $Lv1;
		GetSSL ${u27} > $tam;InRa "# Size of ${u27} is: $(Size "$tam")";cat $tam >> $Lv1;
		GetSSL ${u28} > $tam;InRa "# Size of ${u28} is: $(Size "$tam")";cat $tam >> $Lv1;
		GetSSL ${u29} > $tam;InRa "# Size of ${u29} is: $(Size "$tam")";cat $tam >> $Lv1;
		GetSSL ${u30} > $tam;InRa "# Size of ${u30} is: $(Size "$tam")";cat $tam >> $Lv1;
		GetSSL ${u31} > $tam;InRa "# Size of ${u31} is: $(Size "$tam")";cat $tam >> $Lv1;
		GetSSL ${u32} > $tam;InRa "# Size of ${u32} is: $(Size "$tam")";cat $tam >> $Lv1;
		GetSSL ${u33} > $tam;InRa "# Size of ${u33} is: $(Size "$tam")";cat $tam >> $Lv1;
		GetSSL ${u34} > $tam;InRa "# Size of ${u34} is: $(Size "$tam")";cat $tam >> $Lv1;
		GetSSL ${u35} > $tam;InRa "# Size of ${u35} is: $(Size "$tam")";cat $tam >> $Lv1;
		GetSSL ${u36} > $tam;InRa "# Size of ${u36} is: $(Size "$tam")";cat $tam >> $Lv1;
		GetSSL ${u37} > $tam;InRa "# Size of ${u37} is: $(Size "$tam")";cat $tam >> $Lv1;
		GetSSL ${u38} > $tam;InRa "# Size of ${u38} is: $(Size "$tam")";cat $tam >> $Lv1;
		GetSSL ${u39} > $tam;InRa "# Size of ${u39} is: $(Size "$tam")";cat $tam >> $Lv1;
		GetSSL ${u40} > $tam;InRa "# Size of ${u40} is: $(Size "$tam")";cat $tam >> $Lv1;
		GetSSL ${u41} > $tam;InRa "# Size of ${u41} is: $(Size "$tam")";cat $tam >> $Lv1;
		GetSSL ${u42} > $tam;InRa "# Size of ${u42} is: $(Size "$tam")";cat $tam >> $Lv1;
		GetSSL ${u43} > $tam;InRa "# Size of ${u43} is: $(Size "$tam")";cat $tam >> $Lv1;
		GetSSL ${u44} > $tam;InRa "# Size of ${u44} is: $(Size "$tam")";cat $tam >> $Lv1;
		GetSSL ${u45} > $tam;InRa "# Size of ${u45} is: $(Size "$tam")";cat $tam >> $Lv1;
		GetSSL ${u46} > $tam;InRa "# Size of ${u46} is: $(Size "$tam")";cat $tam >> $Lv1;
		GetSSL ${u47} > $tam;InRa "# Size of ${u47} is: $(Size "$tam")";cat $tam >> $Lv1;
		GetSSL ${u48} > $tam;InRa "# Size of ${u48} is: $(Size "$tam")";cat $tam >> $Lv1;
		InRa "# Downloaded [1]: $(Size "$Lv1")";sh $dsh;
	fi
#__________________________________________________________________________________________________
	if [ $Level -ge 2 ]; then
		InRa ">> Unlocking [2]"
		GetSSL ${u49} > $tam;InRa "# Size of ${u49} is: $(Size "$tam")";cat $tam > $Lv2;
		GetSSL ${u50} > $tam;InRa "# Size of ${u50} is: $(Size "$tam")";cat $tam >> $Lv2;
		GetSSL ${u51} > $tam;InRa "# Size of ${u51} is: $(Size "$tam")";cat $tam >> $Lv2;
		GetSSL ${u52} > $tam;InRa "# Size of ${u52} is: $(Size "$tam")";cat $tam >> $Lv2;
		GetSSL ${u53} > $tam;InRa "# Size of ${u53} is: $(Size "$tam")";cat $tam >> $Lv2;
		GetSSL ${u54} > $tam;InRa "# Size of ${u54} is: $(Size "$tam")";cat $tam >> $Lv2;
		GetSSL ${u55} > $tam;InRa "# Size of ${u55} is: $(Size "$tam")";cat $tam >> $Lv2;
		GetHTT ${u56} > $tam;InRa "# Size of ${u56} is: $(Size "$tam")";cat $tam >> $Lv2;
		GetHTT ${u57} > $tam;InRa "# Size of ${u57} is: $(Size "$tam")";cat $tam >> $Lv2;
		GetSSL ${u58} > $tam;InRa "# Size of ${u58} is: $(Size "$tam")";cat $tam >> $Lv2;
		GetSSL ${u59} > $tam;InRa "# Size of ${u59} is: $(Size "$tam")";cat $tam >> $Lv2;
		GetSSL ${u60} > $tam;InRa "# Size of ${u60} is: $(Size "$tam")";cat $tam >> $Lv2;
		GetSSL ${u61} > $tam;InRa "# Size of ${u61} is: $(Size "$tam")";cat $tam >> $Lv2;
		GetSSL ${u62} > $tam;InRa "# Size of ${u62} is: $(Size "$tam")";cat $tam >> $Lv2;
		GetSSL ${u63} > $tam;InRa "# Size of ${u63} is: $(Size "$tam")";cat $tam >> $Lv2;
		GetSSL ${u64} > $tam;InRa "# Size of ${u64} is: $(Size "$tam")";cat $tam >> $Lv2;
		GetSSL ${u65} > $tam;InRa "# Size of ${u65} is: $(Size "$tam")";cat $tam >> $Lv2;
		GetSSL ${u66} > $tam;InRa "# Size of ${u66} is: $(Size "$tam")";cat $tam >> $Lv2;
		GetSSL ${u67} > $tam;InRa "# Size of ${u67} is: $(Size "$tam")";cat $tam >> $Lv2;
		GetSSL ${u68} > $tam;InRa "# Size of ${u68} is: $(Size "$tam")";cat $tam >> $Lv2;
		GetSSL ${u69} > $tam;InRa "# Size of ${u69} is: $(Size "$tam")";cat $tam >> $Lv2;
		GetSSL ${u70} > $tam;InRa "# Size of ${u70} is: $(Size "$tam")";cat $tam >> $Lv2;
		GetSSL ${u71} > $tam;InRa "# Size of ${u71} is: $(Size "$tam")";cat $tam >> $Lv2;
		GetSSL ${u72} > $tam;InRa "# Size of ${u72} is: $(Size "$tam")";cat $tam >> $Lv2;
		GetSSL ${u73} > $tam;InRa "# Size of ${u73} is: $(Size "$tam")";cat $tam >> $Lv2;
		GetSSL ${u74} > $tam;InRa "# Size of ${u74} is: $(Size "$tam")";cat $tam >> $Lv2;
		GetSSL ${u75} > $tam;InRa "# Size of ${u75} is: $(Size "$tam")";cat $tam >> $Lv2;
		GetSSL ${u76} > $tam;InRa "# Size of ${u76} is: $(Size "$tam")";cat $tam >> $Lv2;
		GetSSL ${u77} > $tam;InRa "# Size of ${u77} is: $(Size "$tam")";cat $tam >> $Lv2;
		InRa "# Downloaded [2]: $(Size "$Lv2")";sh $dsh;
	fi
#__________________________________________________________________________________________________
	if [ $Level -ge 3 ]; then
		InRa ">> Unlocking [3]"
		GetSSL ${u78} > $tam;InRa "# Size of ${u78} is: $(Size "$tam")";cat $tam > $Lv3;
		GetSSL ${u79} > $tam;InRa "# Size of ${u79} is: $(Size "$tam")";cat $tam >> $Lv3;
		GetMHK ${u80} > $tam;InRa "# Size of mahakala.is/hosts is: $(Size "$tam")";cat $tam >> $Lv3;
		GetSSL ${u81} > $tam;InRa "# Size of ${u81} is: $(Size "$tam")";cat $tam >> $Lv3;
		GetSSL ${u82} > $tam;InRa "# Size of ${u82} is: $(Size "$tam")";cat $tam >> $Lv3;
		GetSSL ${u83} > $tam;InRa "# Size of ${u83} is: $(Size "$tam")";cat $tam >> $Lv3;
		InRa "# Downloaded [3]: $(Size "$Lv3")";sh $dsh;
	#__________________________________________________________________________________________________
	fi
	if [ $Level -eq 4 ]; then
		InRa ">> Unlocking [4]"
		GetSSL ${u84} > $tam;InRa "# Size of ${u84} is: $(Size "$tam")";cat $tam > $Lv4;
		GetSSL ${u100} > $tam;InRa "# Size of ${u100} is: $(Size "$tam")";cat $tam >> $Lv4;
		InRa "# Downloaded [4]: $(Size "$Lv4")";sh $dsh;
	fi
	if [ $NOFB = "f" ]; then
		GetSSL ${Nha}/Lists/FaceBook_Only.txt > $tam;InRa "# Size of ${u85} is: $(Size "$tam")";
		#cat $tam >> $hTam;
	fi
	if [ $NOFB = "F" ]; then
		GetSSL ${Nha}/Lists/FaceBook_All.txt > $tam;InRa "# Size of ${u86} is: $(Size "$tam")";
		#cat $tam >> $hTam;
	fi
#__________________________________________________________________________________________________
else
	InRa "# NETWORK: DOWN | MODE: OFFLINE"
	[ -s $hChinh ] && cat $hChinh | awk '{print $2}' > $hTam
	[ -s $dChinh ] && cp $dChinh $dTam
fi
#__________________________________________________________________________________________________
if [ $DISTRIB -eq 0 ] && { [ -s "$denOff" ] || [ -s "$trangOff" ]; }; then
	InRa "> Compacting Black/WhiteList Offline"
	LC_ALL=C cat $denOff | sed -r "${SedBW}" > tmpmybl && mv tmpmybl $denOff
	LC_ALL=C cat $trangOff | sed -r "${SedBW}" > tmpmywl && mv tmpmywl $trangOff
	cat $denOn | cat $denOff - > $tbl
	cat $trangOn | cat $trangOff - | grep -Fvwf $denOff > $twl
fi
#__________________________________________________________________________________________________
InRa "> Add-Remove Black-White List";
if [ -f "${TMuc}/Location" ];then
	LC_ALL=C cat $hTam | SedFN | cat $tbl - | grep -Fvwf $twl | grep -Fvwf $dTam | awk '{if ($1 in a) next; a[$1]=$0; print}' > $hChinh;else
	LC_ALL=C cat $hTam | SedFN | cat $tbl - | grep -Fvwf $twl | grep -Fvwf $dTam | awk '{if ($1 in a) next; a[$1]=$0; print}' | awk -v "IP=$SetIP" '{sub(/\r$/,""); print IP" "$0}' > $hChinh
fi
LC_ALL=C cat $dTam | grep -Fvwf $twl | sed -r 's|^|address\=\/|; s|$|\/0.1.2.3|' > $dChinh
Counts=$(cat $hChinh | wc -l | sed 's/^[ \t]*//');InRa ">> Blocked: $Counts Hosts $(Size "$hChinh")";
Counts=$(cat $dChinh | wc -l | sed 's/^[ \t]*//');InRa ">> Blocked: $Counts Domains $(Size "$dChinh")";
#__________________________________________________________________________________________________
if [ -f "${TMuc}/Location" ];then
	echo "Skip restart DNS server";else
	InRa "> Restarting DNS server";ReBoot;InRa "> Deleting: $MTam";rm -rf ${MTam};
fi
TIMERSTOP=`date +%s`
RTMINUTES=$(( $((TIMERSTOP - TIMERSTART)) /60 ))
RTSECONDS=$(( $((TIMERSTOP - TIMERSTART)) %60 ))
InRa "# Total time: $RTMINUTES:$RTSECONDS minutes"
InRa "# DONE"
logger ">>> $(basename "$0") finished"
exit 0
# FIN
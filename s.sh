#!/bin/sh
VERSION="2018.07.12.15"
export SetIP="0.1.2.3"
export Level=4
HomePage="https://raw.githubusercontent.com/S8D/AdBlock/master"
u00="${HomePage}/Darias.txt"
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
u76="http://gg.gg/u76_";u77="http://gg.gg/u77_";u78="http://gg.gg/u78_";u79="http://gg.gg/u79_";u91="http://gg.gg/u91_";
u81="http://gg.gg/u81_";u82="http://gg.gg/u82_";u83="http://gg.gg/u83_";u84="http://gg.gg/u84_";u85="http://gg.gg/u85_";
u86="http://gg.gg/u86_";u87="http://gg.gg/u87_";u88="http://gg.gg/u88_";u89="http://gg.gg/u89_";u90="http://gg.gg/u90_";
u80="http://adblock.mahakala.is/hosts";
#u80="http://gg.gg/u80_";
#u92="http://gg.gg/u92_"
#u93="http://gg.gg/u93_"
#u94="http://gg.gg/u94_"
#u95="http://gg.gg/u95_"
#u96="http://gg.gg/u96_"
#u97="http://gg.gg/u97_"
#u98="http://gg.gg/u98_"
#u99="http://gg.gg/u99_"
#u100="http://gg.gg/u100_"
#___________________________________________________________________________________________________________________________________________________________________________________________________
export NOFB=0
export ONLINE=1
export QUIET=0
export SECURL=0
export DAYOFWEEK=$(date +"%u")
export DISTRIB=0
export TMuc=""$(cd "$(dirname "${0}")" && pwd)""
export Tam="${TMuc}/tmp"
if [ -d "$Tam" ]
then
	echo "Using $Tam"
else
	echo "Dang tao: $Tam"
	mkdir ${Tam}
fi
export hChinh="${TMuc}/h"
export hDung="${TMuc}/h.zzz"
export hTam="${Tam}/h.tmp"
export Tamh="${Tam}/ht.tmp"
export dChinh="${TMuc}/d"
export dDung="${TMuc}/d.zzz"
export dTam="${Tam}/d.tmp"
export Tamd="${Tam}/dt.tmp"
export hChinhTam="${Tam}/hct.tmp"
export pauseflag="${TMuc}/PAUSED"
export denOn="${TMuc}/den.On"
export trangOn="${TMuc}/trang.On"
export base64wl="${TMuc}/base64wl"
export denOff="${TMuc}/den.Off"
export trangOff="${TMuc}/trang.Off"
export hLog="${TMuc}/h.log"
export SHELL=/bin/sh
export PATH=/bin:/usr/bin:/sbin:/usr/sbin:/jffs/sbin:/jffs/bin:/jffs/usr/sbin:/jffs/usr/bin:/mmc/sbin:/mmc/bin:/mmc/usr/sbin:/mmc/usr/bin:/opt/sbin:/opt/bin:/opt/usr/sbin:/opt/usr/bin:"${TMuc}"
export LD_LIBRARY_PATH=/lib:/usr/lib:/jffs/lib:/jffs/usr/lib:/jffs/usr/local/lib:/mmc/lib:/mmc/usr/lib:/opt/lib:/opt/usr/lib
export PWD="${TMuc}"
#___________________________________________________________________________________________________________________________________________________________________________________________________
cd "${TMuc}"
logger ">>> $(basename "$0") started"
if [ -z "$(which curl)" ]; then
	echo ">>> WARNING: cURL not found"
	echo ">>> ERROR: ABORTING"
	exit 1
fi
export CURL_CA_BUNDLE="${TMuc}/cacert.pem"
alias MPGET="curl -f -s -k -L"
alias MPGETSSL="curl -f -s -k -L"
[ $SECURL -eq 1 ] && unalias MPGETSSL && alias MPGETSSL="curl -f -s --capath ${TMuc} --cacert $CURL_CA_BUNDLE"
alias MPGETMHK="curl -f -s -A -L "Mozilla/5.0" -e http://forum.xda-developers.com/"
lognecho ()
{
	[ $QUIET -eq 0 ] && echo "$1"
	echo "$1" >> $hLog
}
printFileSize ()
{
	lognecho "# Size of $1: `du -h $1 | awk '{print $1}'`"
}
restart_dnsmasq ()
{
	logger ">>> $(basename "$0") restarting dnsmasq"
	restart_dns &
	logger ">>> $(basename "$0") restarted dnsmasq"
}
protectOn ()
{
	if [ -f $pauseflag ] && { [ -f $hDung ] || [ -f $dDung ]; }; then
		lognecho ">>> RESUMING PROTECTION"
		mv $hDung $hChinh
		mv $dDung $dChinh
		rm -f $pauseflag
		restart_dnsmasq
	fi
	logger ">>> $(basename "$0") finished"
	exit 0
}
protectOff ()
{
	lognecho ">>> WARNING: PAUSING PROTECTION"
	[ -f $hChinh ] && mv $hChinh $hDung
	[ -f $dChinh ] && mv $dChinh $dDung
	echo "" > $hChinh
	echo "" > $dChinh
	echo "PAUSED" > $pauseflag
	restart_dnsmasq
	lognecho ">>> Type $(basename "$0") --resume to resume protection."
	logger ">>> $(basename "$0") finished"
	exit 0
}
#___________________________________________________________________________________________________________________________________________________________________________________________________
printHelp ()
{
	echo ""
	echo "USAGE:"
	printf '\t'; echo "$(basename "$0") [-? | -h | --help] [-v | --version] [-1] [-2] [-b | --bl=<domain.name>] [-w | --wl=<domain.name>] ..."
	echo ""
	echo "OPERATION:"
	printf '\t'; echo -n "[-0]"; printf '\t\t\t\t'; echo "Level=0: safe minimum protection"
	printf '\t'; echo -n "[-1]"; printf '\t\t\t\t'; echo "Level=1: increased protection"
	printf '\t'; echo -n "[-2]"; printf '\t\t\t\t'; echo "Level=2: optimum protection"
	printf '\t'; echo -n "[-3]"; printf '\t\t\t\t'; echo "Level=3: unlock maximum protection"
	printf '\t'; echo -n "[-4]"; printf '\t\t\t\t'; echo "Level=4: unlock Ultra protection [DEFAULT]"
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
#___________________________________________________________________________________________________________________________________________________________________________________________________
selfUpdate ()
{
	fTam="${Tam}/update"
	lognecho ">>> Checking for updates."
	if ping -q -c 1 -W 1 google.com >/dev/null; then
		MPGETSSL ${HomePage}/$(basename "$0") > $fTam
		if [ 0 -eq $? ]; then
			old_md5=`md5sum $0 | cut -d' ' -f1`
			new_md5=`md5sum $fTam | cut -d' ' -f1`
			if [ "$old_md5" != "$new_md5" ]; then
				NEWVER=`grep -w -m 1 "VERSION" $fTam`
				lognecho ">>> Update available: $NEWVER"
				OLDVER=`grep -w -m 1 "VERSION" $0 | cut -d \" -f2`
				cp $0 $0.$OLDVER
				chmod 755 $fTam
				mv $fTam $0
				lognecho ">>> Updated to the latest version."
			else
				lognecho ">>> Current version: $VERSION"
			fi
		else
			lognecho ">>> Update failed. Try again."
		fi
		rm -f $fTam
		rm -rf ${Tam}
	fi
	logger ">>> $(basename "$0") finished"
	exit 0
}
#___________________________________________________________________________________________________________________________________________________________________________________________________
while getopts "h?v0123fFdDpPqQrRsSoOuUb:w:i:-:" opt; do
	case ${opt} in
		h|\? ) printHelp ;;
		v    ) echo "$VERSION" ; logger ">>> $(basename "$0") finished" ; exit 0 ;;
		0    ) Level=0 ;;
		1    ) Level=1 ;;
		2    ) Level=2 ;;
		3    ) Level=3 ;;
		f    ) NOFB="f" ;;
		F    ) NOFB="F" ;;
		d|D  ) DISTRIB=1 ;;
		q|Q  ) QUIET=1 ;;
		p|P  ) protectOff ;;
		r|R  ) protectOn ;;
		s|S  ) SECURL=1 ;;
		o|O  ) ONLINE=0 ;;
		u|U  ) selfUpdate ;;
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
			4    ) Level=4 ;;
			quiet   ) QUIET=1 ;;
			pause   ) protectOff ;;
			resume  ) protectOn ;;
			secure  ) SECURL=1 ;;
			offline ) ONLINE=0 ;;
			help    ) printHelp ;;
			update  ) selfUpdate ;;
			version ) echo "$VERSION" ; logger ">>> $(basename "$0") finished" ; exit 0 ;;
			4* | quiet* | pause* | resume* | secure* | offline* | help* | update* | version* )
					echo ">>> ERROR: no arguments allowed for --$OPTARG option" >&2; exit 2 ;;
			'' )    break ;;
			* )     echo ">>> ERROR: unsupported option --$OPTARG" >&2; exit 2 ;;
		esac ;;
  	  \? ) exit 2 ;;
	esac
done
shift $((OPTIND-1))
#___________________________________________________________________________________________________________________________________________________________________________________________________
TIMERSTART=`date +%s`
lognecho "============================================================="
lognecho "|      AdBlock for DD-WRT base on Linux                     |"
lognecho "|      ${HomePage} |"
lognecho "|      Tac gia: Manish Parashar                             |"
lognecho "|      Chinh sua: Darias                                    |"
lognecho "============================================================="
lognecho "             `date`"
lognecho "# VERSION: $VERSION"

#___________________________________________________________________________________________________________________________________________________________________________________________________
if [ -f $pauseflag ] && { [ -f $hDung ] || [ -f $dDung ]; }; then
	lognecho "# USER FORGOT TO RESUME PROTECTION AFTER PAUSING"
	protectOn
fi
if [ $ONLINE -eq 1 ] && ping -q -c 1 -W 1 google.com >/dev/null; then

	lognecho "# NETWORK: UP | MODE: ONLINE"
	lognecho "# IP ADDRESS FOR ADS: $SetIP"
	lognecho "# SECURE [0=NO | 1=YES]: $SECURL"
	lognecho "# Level LEVEL [0|1|2|3|4]: $Level"

	if [ ! -s cacert.pem ] || { [ "${DAYOFWEEK}" -eq 1 ] || [ "${DAYOFWEEK}" -eq 4 ]; }; then
		lognecho "> Downloading / updating cURL certificates"
		MPGETSSL --remote-name --time-cond cacert.pem https://curl.haxx.se/ca/cacert.pem
	fi
#___________________________________________________________________________________________________________________________________________________________________________________________________
if [ $Level=0 ]; then
	fsz="12"
fi
if [ $Level=1 ]; then
	fsz="21"
fi
if [ $Level=2 ]; then
	fsz="41"
fi
if [ $Level=3 ]; then
	fsz="62"
fi
if [ $Level=4 ]; then
	fsz="99"
fi
	lognecho ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
	lognecho "> Ban da chon Level: ${Level} . File size khoang: ${fsz}Mb (chua sort)>"
	lognecho ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
#___________________________________________________________________________________________________________________________________________________________________________________________________
	lognecho "# Unlocking Level=0 lists"
	lognecho "# Dang tai: ${u00}";MPGETSSL ${u00} > $Tamd;printFileSize $Tamd;cat $Tamd > $dTam
#___________________________________________________________________________________________________________________________________________________________________________________________________
	lognecho "# Dang tai: ${u01}";MPGETSSL ${u01} > $Tamh;printFileSize $Tamh;cat $Tamh > $hTam;
	lognecho "# Dang tai: ${u02}";MPGETSSL ${u02} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
	lognecho "# Dang tai: ${u03}"
	MPGETSSL -d mimetype=plaintext -d hostformat=dnsmasq ${u03} > $Tamh;printFileSize $Tamh
	cat $Tamh >> $hTam | printFileSize $hTam
	lognecho "# Dang tai: file Chinh"
	lognecho "# Dang tai: ${u04}";MPGETSSL ${u04} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
	lognecho "# Dang tai: ${u05}";MPGETSSL ${u05} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
	lognecho "# Dang tai: ${u06}";MPGETSSL ${u06} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
	lognecho "# Dang tai: ${u07}";MPGETSSL ${u07} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
	lognecho "# Dang tai: ${u08}";MPGETSSL ${u08} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
	lognecho "# Dang tai: ${u09}";MPGETSSL ${u09} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
	lognecho "# Dang tai: ${u10}";MPGETSSL ${u10} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
	lognecho "# Dang tai: ${u11}";MPGETSSL ${u11} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
	lognecho "# Dang tai: ${u12}";MPGETSSL ${u12} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
	lognecho "# Dang tai: ${u13}";MPGETSSL ${u13} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
	lognecho "# Dang tai: ${u14}";MPGETSSL ${u14} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
	lognecho "# Dang tai: ${u15}";MPGETSSL ${u15} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
	lognecho "# Dang tai: ${u16}";MPGETSSL ${u16} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
	lognecho "# Dang tai: ${u17}";MPGETSSL ${u17} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
	lognecho "# Dang tai: ${u18}";MPGETSSL ${u18} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
	lognecho "# Dang tai: ${u19}";MPGETSSL ${u19} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
#___________________________________________________________________________________________________________________________________________________________________________________________________
	lognecho "# Dang tai: ${u90}";MPGETSSL ${u90} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
	lognecho ">>>File size Level [0] cua ban ben duoi";printFileSize $hTam
#___________________________________________________________________________________________________________________________________________________________________________________________________
	if [ $Level -ge 1 ]; then
		lognecho "# Unlocking Level=1 lists"
		lognecho "# Dang tai: ${u20}";MPGETSSL ${u20} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u21}";MPGETSSL ${u21} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u22}";MPGETSSL ${u22} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u23}";MPGETSSL ${u23} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u24}";MPGETSSL ${u24} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u25}";MPGETSSL ${u25} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u26}";MPGETSSL ${u26} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u27}";MPGETSSL ${u27} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u28}";MPGETSSL ${u28} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u29}";MPGETSSL ${u29} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u30}";MPGETSSL ${u30} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u31}";MPGETSSL ${u31} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u32}";MPGETSSL ${u32} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u33}";MPGETSSL ${u33} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u34}";MPGETSSL ${u34} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u35}";MPGETSSL ${u35} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u36}";MPGETSSL ${u36} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u37}";MPGETSSL ${u37} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u38}";MPGETSSL ${u38} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u39}";MPGETSSL ${u39} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u40}";MPGETSSL ${u40} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u41}";MPGETSSL ${u41} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u42}";MPGETSSL ${u42} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u43}";MPGETSSL ${u43} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u44}";MPGETSSL ${u44} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u45}";MPGETSSL ${u45} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u46}";MPGETSSL ${u46} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u47}";MPGETSSL ${u47} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u48}";MPGETSSL ${u48} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho ">>>File size Level [1] cua ban ben duoi";printFileSize $hTam;
	fi
#___________________________________________________________________________________________________________________________________________________________________________________________________
	if [ $Level -ge 2 ]; then
		lognecho "# Unlocking Level=2 lists"
		lognecho "# Dang tai: ${u49}";MPGETSSL ${u49} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u50}";MPGETSSL ${u50} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u51}";MPGETSSL ${u51} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u52}";MPGETSSL ${u52} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u53}";MPGETSSL ${u53} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u54}";MPGETSSL ${u54} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u55}";MPGETSSL ${u55} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u56}";MPGET ${u56} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u57}";MPGET ${u57} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u58}";MPGET ${u58} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u59}";MPGETSSL ${u59} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u60}";MPGETSSL ${u60} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u61}";MPGETSSL ${u61} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u62}";MPGETSSL ${u62} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u63}";MPGETSSL ${u63} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u64}";MPGETSSL ${u64} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u65}";MPGETSSL ${u65} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u66}";MPGETSSL ${u66} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u67}";MPGETSSL ${u67} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u68}";MPGETSSL ${u68} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u69}";MPGETSSL ${u69} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u70}";MPGETSSL ${u70} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u71}";MPGETSSL ${u71} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u72}";MPGETSSL ${u72} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u73}";MPGETSSL ${u73} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u74}";MPGETSSL ${u74} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u75}";MPGETSSL ${u75} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u76}";MPGETSSL ${u76} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u77}";MPGETSSL ${u77} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho ">>>File size Level [2] cua ban ben duoi";printFileSize $hTam;
	fi
#___________________________________________________________________________________________________________________________________________________________________________________________________
	if [ $Level -ge 3 ]; then
		lognecho "# Unlocking Level=3 lists"
		lognecho "# Dang tai: ${u78}";MPGETSSL ${u78} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u79}";MPGETSSL ${u79} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u80}";MPGETMHK ${u80} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;		
		lognecho "# Dang tai: ${u81}";MPGETSSL ${u81} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u82}";MPGETSSL ${u82} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u83}";MPGETSSL ${u83} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho ">>>File size Level [3] cua ban ben duoi";printFileSize $hTam;
	#____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________
	lognecho "> Dang xu ly: [0]+[1]+[2]+[3]"
	LC_ALL=C cat $hTam | tr '[:upper:]' '[:lower:]' | sed -r 's/#.*$//; s|\.$||; s|/::||; s|/0.0.0.0||; s|/127.0.0.1||; s|^::\s||; s|^address=/||; s|^0.0.0.0||; s|^127.0.0.1||; s|^\s\s||; s|^\s||; s|^\t\t||; s|^\t||; s|^\.||; s|^-||; s/;.*$//; s/:.*$//; s/<.*$//; s|\?||; s|$\n\n||; s|$.\n|\n|; s|m1\n|m\n|; s/^[[:blank:]]*//; s/[[:blank:]]*$//; /^$/d; /^\s*$/d; s|www$||; s|com1$|com|; s|\s||; s|^--||; s|^\-||; s|^0.0.0.0||; s|^[^.]+$||; s|\.com12276\.|\.com\n12276\.|; s|\.$||; s/tl2$/tl/; s/comf4a$/comf4a/; s/\^$//; s|^🔗||; s|^\t||; s|0.0.0.0$||; s|^\.||; s|^\-||; s|\/$||; s|\-$||; s|co14$|co|; s|\+$||' | sort -u > $hChinhTam
	printFileSize $hChinhTam
	cat $hChinhTam > $hTam
	#____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________
	fi
	if [ $Level -eq 4 ]; then
		lognecho "# Unlocking Level=4 lists"
		lognecho "# Dang tai: ${u84}";MPGETSSL ${u84} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Dang tai: ${u91}";MPGETSSL ${u91} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
	fi
	if [ $NOFB = "f" ]; then
		lognecho "# Dang tai: ${u85}"
		MPGETSSL ${HomePage}/denOn/facebookonly.block >> $hTam;printFileSize $Tamh;cat $Tamh >> $hTam;
	fi
	if [ $NOFB = "F" ]; then
		lognecho "# Dang tai: ${u86}";MPGETSSL ${HomePage}/denOn/facebookall.block >> $hTam;printFileSize $Tamh;
		cat $Tamh >> $hTam
	fi
	lognecho "> Updating official denOn/trangOn files"
	MPGETSSL ${HomePage}/denOn/denOn > $denOn
	MPGETSSL ${HomePage}/trangOn/trangOn > $trangOn
	MPGETSSL ${HomePage}/trangOn/fruitydomains > $base64wl
	LC_ALL=C uudecode $base64wl && cat applewhitelist >> $trangOn && rm applewhitelist && rm $base64wl
#___________________________________________________________________________________________________________________________________________________________________________________________________
else
	lognecho "# NETWORK: DOWN | MODE: OFFLINE"
	[ -s $hChinh ] && cat $hChinh | awk '{print $2}' > $hTam
	[ -s $dChinh ] && cp $dChinh $dTam
fi
printFileSize $hTam
printFileSize $dTam
#___________________________________________________________________________________________________________________________________________________________________________________________________
lognecho "> Dang xu ly: denOn/trangOn files"
LC_ALL=C cat $denOn | sed -r 's/^[[:blank:]]*//; s/[[:blank:]]*$//; /^$/d; /^\s*$/d' | sort -u > tmpbl && cp tmpbl $denOn
LC_ALL=C cat $trangOn | sed -r 's/^[[:blank:]]*//; s/[[:blank:]]*$//; /^$/d; /^\s*$/d' | sort -u > tmpwl && cp tmpwl $trangOn
#___________________________________________________________________________________________________________________________________________________________________________________________________
if [ $DISTRIB -eq 0 ] && { [ -s "$denOff" ] || [ -s "$trangOff" ]; }; then
	lognecho "> Dang xu ly: denOff/trangOff files"
	LC_ALL=C cat $denOff | sed -r 's/^[[:blank:]]*//; s/[[:blank:]]*$//; /^$/d; /^\s*$/d' | sort -u > tmpmybl && mv tmpmybl $denOff
	LC_ALL=C cat $trangOff | sed -r 's/^[[:blank:]]*//; s/[[:blank:]]*$//; /^$/d; /^\s*$/d' | sort -u > tmpmywl && mv tmpmywl $trangOff
	cat $denOn | cat $denOff - > tmpbl
	cat $trangOn | cat $trangOff - | grep -Fvwf $denOff > tmpwl
fi
#___________________________________________________________________________________________________________________________________________________________________________________________________
	lognecho "> Dang xu ly: final hChinh/dChinh files"
	LC_ALL=C cat $hTam | tr '[:upper:]' '[:lower:]' | sed -r 's/#.*$//; s|\.$||; s|/::||; s|/0.0.0.0||; s|/127.0.0.1||; s|^::\s||; s|^address=/||; s|^0.0.0.0||; s|^127.0.0.1||; s|^\s\s||; s|^\s||; s|^\t\t||; s|^\t||; s|^\.||; s|^-||; s/;.*$//; s/:.*$//; s/<.*$//; s|\?||; s|$\n\n||; s|$.\n|\n|; s|m1\n|m\n|; s/^[[:blank:]]*//; s/[[:blank:]]*$//; /^$/d; /^\s*$/d; s|www$||; s|com1$|com|; s|\s||; s|^--||; s|^\-||; s|^0.0.0.0||; s|^[^.]+$||; s|\.com12276\.|\.com\n12276\.|; s|\.$||; s/tl2$/tl/; s/comf4a$/comf4a/; s/\^$//; s|^🔗||; s|^\t||; s|0.0.0.0$||; s|^\.||; s|^\-||; s|\/$||; s|\-$||; s|co14$|co|; s|\+$||' | tr -cd '\000-\177' | cat tmpbl - | grep -Fvwf tmpwl | sort -u | awk -v "IP=$SetIP" '{sub(/\r$/,""); print IP" "$0}' > $hChinh
	LC_ALL=C cat $dTam | sed -r 's/^[[:blank:]]*//; s/[[:blank:]]*$//; /^$/d; /^\s*$/d' | tr -cd '\000-\177' | grep -Fvwf tmpwl | sort -u > $dChinh
	lognecho "> Removing temporary files"
	rm -f $hTam
	rm -f $dTam
	rm -f tmpbl
	rm -f tmpwl
	rm -rf ${Tam}
	lognecho ">>>>File size Hosts<<<<"
	printFileSize $hChinh
	numberOfAdsBlocked=$(cat $hChinh | wc -l | sed 's/^[ \t]*//')
	lognecho "# Number of ad Hosts blocked: $numberOfAdsBlocked"
	lognecho ">>>>File size Domains<<<<"
	printFileSize $dChinh
	numberOfAdsBlocked=$(cat $dChinh | wc -l | sed 's/^[ \t]*//')
	lognecho "# Number of ad domains blocked: $numberOfAdsBlocked"
#___________________________________________________________________________________________________________________________________________________________________________________________________
if [ -f "${TMuc}/Location" ]
then
	echo "${TMuc}/Location found. Skip restart DNS server"
else
	lognecho "> Restarting DNS server (dnsmasq)"
	restart_dnsmasq
fi
TIMERSTOP=`date +%s`
RTMINUTES=$(( $((TIMERSTOP - TIMERSTART)) /60 ))
RTSECONDS=$(( $((TIMERSTOP - TIMERSTART)) %60 ))
lognecho "# Total time: $RTMINUTES:$RTSECONDS minutes"
lognecho "# DONE"
logger ">>> $(basename "$0") finished"
exit 0
# FIN
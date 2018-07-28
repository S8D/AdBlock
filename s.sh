#!/bin/sh
VERSION="20180728a"
export SetIP="0.1.2.3";export Level=4;
Nha="https://raw.githubusercontent.com/S8D/AdBlock/master"
HomePage="https://github.com/S8D/AdBlock"
d="http://gg.gg/d_"
u00="${Nha}/Darias.txt"
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
SedBW="s/^[[:blank:]]*//; s/[[:blank:]]*$//; /^$/d; /^\s*$/d";
export NOFB=0
export ONLINE=1
export QUIET=0
export SECURL=0
export DAYOFWEEK=$(date +"%u")
export DISTRIB=0
export TMuc=""$(cd "$(dirname "${0}")" && pwd)""
export TMTam="${TMuc}/tmp"
if [ -d "$TMTam" ]
then
	echo "Using $TMTam"
else
	echo "Creating: $TMTam"
	mkdir ${TMTam}
fi
Lv0="${TMTam}/lv0";Lv00="${TMTam}/lv00";Lv1="${TMTam}/lv1";Lv2="${TMTam}/lv2";Lv3="${TMTam}/lv3";Lv4="${TMTam}/lv4";
export pc="${TMuc}/d.sh"
export hChinh="${TMuc}/h";export hDung="${TMuc}/h.zzz";export hTam="${TMTam}/h.tmp"
export tam="${TMTam}/t.tmp"
export t8m="${TMTam}/t8.tmp"
export tbl="${TMTam}/bl.tmp";export twl="${TMTam}/wl.tmp";
export dChinh="${TMuc}/d";export dDung="${TMuc}/d.zzz";export dTam="${TMTam}/d.tmp"
export pauseflag="${TMuc}/PAUSED"
export denOn="${TMuc}/den.On";export trangOn="${TMuc}/trang.On"
export denOff="${TMuc}/den.Off";export trangOff="${TMuc}/trang.Off"
export hLog="${TMuc}/h.log"
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
InRa ()
{
	[ $QUIET -eq 0 ] && echo "$1"
	echo "$1" >> $hLog
}
Size ()
{
	InRa "# Size of $1: `du -h $1 | awk '{print $1}'`"
}
ReBoot ()
{
	logger ">>> $(basename "$0") restarting dnsmasq"
	restart_dns &
	logger ">>> $(basename "$0") restarted dnsmasq"
}
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
	fTMTam="${TMTam}/update"
	InRa ">>> Checking for updates..."
	if ping -q -c 1 -W 1 google.com >/dev/null; then
		GetSSL ${Nha}/$(basename "$0") > $fTMTam
		if [ 0 -eq $? ]; then
			old_md5=`md5sum $0 | cut -d' ' -f1`
			new_md5=`md5sum $fTMTam | cut -d' ' -f1`
			if [ "$old_md5" != "$new_md5" ]; then
				NEWVER=`grep -w -m 1 "VERSION" $fTMTam`
				InRa ">>> Update available: $NEWVER"
				OLDVER=`grep -w -m 1 "VERSION" $0 | cut -d \" -f2`
				cp $0 $0.$OLDVER
				chmod 755 $fTMTam
				mv $fTMTam $0
				InRa ">>> Updated to the latest version."
			else
				InRa ">>> Current version: $VERSION"
			fi
		else
			InRa ">>> Update failed. Try again."
		fi
		rm -rf ${TMTam};
	fi
	logger ">>> $(basename "$0") finished"
	exit 0
}
#__________________________________________________________________________________________________
while getopts "h?v0123fFdDpPqQrRsSoOuUb:w:i:-:" opt; do
	case ${opt} in
		h|\? ) Giup ;;
		v    ) echo ">>> Current version: $VERSION" ; logger ">>> $(basename "$0") finished" ;rm -rf ${TMTam}; exit 0 ;;
		0    ) Level [0 ;;
		1    ) Level [1 ;;
		2    ) Level [2 ;;
		3    ) Level [3 ;;
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
			4    ) Level [4 ;;
			quiet   ) QUIET=1 ;;
			pause   ) Tat ;;
			resume  ) Bat ;;
			secure  ) SECURL=1 ;;
			offline ) ONLINE=0 ;;
			help    ) Giup ;;
			update  ) CapNhat ;;
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
#__________________________________________________________________________________________________
TIMERSTART=`date +%s`
InRa "============================================================="
InRa "|      AdBlock for DD-WRT/Android base on Linux             |"
InRa "|      ${HomePage}                       |"
InRa "|      Author: Manish Parashar                              |"
InRa "|      Editor: Darias                                       |"
InRa "============================================================="
InRa "             `date`"
InRa "# Version: $VERSION"

#__________________________________________________________________________________________________
if [ -f $pauseflag ] && { [ -f $hDung ] || [ -f $dDung ]; }; then
	InRa "# USER FORGOT TO RESUME PROTECTION AFTER PAUSING"
	Bat
fi
if [ $ONLINE -eq 1 ] && ping -q -c 1 -W 1 google.com >/dev/null; then

	InRa "# NETWORK: UP | MODE: ONLINE"
	InRa "# IP ADDRESS FOR ADS: $SetIP"
	InRa "# SECURE [0=NO | 1=YES]: $SECURL"
	InRa "# Level [0|1|2|3|4]: $Level"

	if [ ! -s cacert.pem ] || { [ "${DAYOFWEEK}" -eq 1 ] || [ "${DAYOFWEEK}" -eq 4 ]; }; then
		InRa "> Downloading / updating cURL certificates"
		GetSSL --remote-name --time-cond cacert.pem https://curl.haxx.se/ca/cacert.pem
	fi
	InRa "# Downloading: ${pc}";GetSSL ${d} > $tam;Size $tam;cat $tam > $pc;
#__________________________________________________________________________________________________
	InRa "> Updating official Black/WhiteList Online"
	GetSSL ${Nha}/denOn/denOn > $denOn;Size $denOn;
	GetSSL ${Nha}/trangOn/trangOn > $tam;Size $tam;cat $tam > $trangOn;
	GetSSL ${Nha}/trangOn/apple > $tam;Size $tam;cat $tam >> $trangOn;Size $trangOn
	InRa "> Deleting Special character: Black/WhiteList Online"
	LC_ALL=C cat $denOn | sed -r "${SedBW}" > $tbl && cp $tbl $denOn
	LC_ALL=C cat $trangOn | sed -r "${SedBW}" > $twl && cp $twl $trangOn
#__________________________________________________________________________________________________

	InRa ">> Unlocking Level [0]"
	InRa "# Downloading: Domains";GetSSL ${u00} > $tam;Size $tam;cat $tam | sed -r 's|.*\=\/||; s|\/.*$||' > $dTam
#__________________________________________________________________________________________________
	InRa "# Downloading: ${u01}";GetSSL ${u01} > $tam;Size $tam;cat $tam > $hTam;
	InRa "# Downloading: ${u02}";GetSSL ${u02} > $tam;Size $tam;cat $tam >> $hTam;
	InRa "# Downloading: ${u03}";GetSSL -d mimetype=plaintext -d hostformat=dnsmasq ${u03} > $tam;Size $tam;cat $tam >> $hTam | Size $hTam;
	InRa "# Downloading: ${u04}";GetSSL ${u04} > $tam;Size $tam;cat $tam >> $hTam;
	InRa "# Downloading: ${u05}";GetSSL ${u05} > $tam;Size $tam;cat $tam >> $hTam;
	InRa "# Downloading: ${u06}";GetSSL ${u06} > $tam;Size $tam;cat $tam >> $hTam;
	InRa "# Downloading: ${u07}";GetSSL ${u07} > $tam;Size $tam;cat $tam >> $hTam;
	InRa "# Downloading: ${u08}";GetSSL ${u08} > $tam;Size $tam;cat $tam >> $hTam;
	InRa "# Downloading: ${u09}";GetSSL ${u09} > $tam;Size $tam;cat $tam >> $hTam;
	InRa "# Downloading: ${u10}";GetSSL ${u10} > $tam;Size $tam;cat $tam >> $hTam;
	InRa "# Downloading: ${u11}";GetSSL ${u11} > $tam;Size $tam;cat $tam >> $hTam;
	InRa "# Downloading: ${u12}";GetSSL ${u12} > $tam;Size $tam;cat $tam >> $hTam;
	InRa "# Downloading: ${u13}";GetSSL ${u13} > $tam;Size $tam;cat $tam >> $hTam;
	InRa "# Downloading: ${u14}";GetSSL ${u14} > $tam;Size $tam;cat $tam >> $hTam;
	InRa "# Downloading: ${u15}";GetSSL ${u15} > $tam;Size $tam;cat $tam >> $hTam;
	InRa "# Downloading: ${u16}";GetSSL ${u16} > $tam;Size $tam;cat $tam >> $hTam;
	InRa "# Downloading: ${u17}";GetSSL ${u17} > $tam;Size $tam;cat $tam >> $hTam;
	InRa "# Downloading: ${u18}";GetSSL ${u18} > $tam;Size $tam;cat $tam >> $hTam;
	InRa "# Downloading: ${u19}";GetSSL ${u19} > $tam;Size $tam;cat $tam > $Lv0;
	InRa "# Call $pc";sh $pc;
#__________________________________________________________________________________________________
	InRa "# Downloading: ${u90}";GetSSL ${u90} > $tam;Size $tam;cat $tam > $t8m;
	InRa "# Downloading: ${u91}";GetSSL ${u91} > $tam;Size $tam;cat $tam >> $t8m;
	InRa "# Downloading: ${u92}";GetSSL ${u92} > $tam;Size $tam;cat $tam >> $t8m;
	InRa "# Downloading: ${u93}";GetSSL ${u93} > $tam;Size $tam;cat $tam >> $t8m;
	InRa "# Downloading: ${u94}";GetSSL ${u94} > $tam;Size $tam;cat $tam >> $t8m;
	InRa "# Downloading: ${u95}";GetSSL ${u95} > $tam;Size $tam;cat $tam >> $t8m;
	InRa "# Downloading: ${u96}";GetSSL ${u96} > $tam;Size $tam;cat $tam >> $t8m;
	InRa "# Downloading: ${u97}";GetSSL ${u97} > $tam;Size $tam;cat $tam >> $t8m;
	InRa "# Downloading: ${u98}";GetSSL ${u98} > $tam;Size $tam;cat $tam >> $t8m;
	InRa "# Downloading: ${u99}";GetSSL ${u99} > $tam;Size $tam;cat $tam > $Lv00;
	InRa "# Call $pc";sh $pc;
	
#__________________________________________________________________________________________________
	if [ $Level -ge 1 ]; then
		InRa ">> Unlocking Level [1]"
		InRa "# Downloading: ${u20}";GetSSL ${u20} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u21}";GetSSL ${u21} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u22}";GetSSL ${u22} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u23}";GetSSL ${u23} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u24}";GetSSL ${u24} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u25}";GetSSL ${u25} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u26}";GetSSL ${u26} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u27}";GetSSL ${u27} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u28}";GetSSL ${u28} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u29}";GetSSL ${u29} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u30}";GetSSL ${u30} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u31}";GetSSL ${u31} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u32}";GetSSL ${u32} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u33}";GetSSL ${u33} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u34}";GetSSL ${u34} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u35}";GetSSL ${u35} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u36}";GetSSL ${u36} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u37}";GetSSL ${u37} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u38}";GetSSL ${u38} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u39}";GetSSL ${u39} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u40}";GetSSL ${u40} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u41}";GetSSL ${u41} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u42}";GetSSL ${u42} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u43}";GetSSL ${u43} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u44}";GetSSL ${u44} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u45}";GetSSL ${u45} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u46}";GetSSL ${u46} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u47}";GetSSL ${u47} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u48}";GetSSL ${u48} > $tam;Size $tam;cat $tam > $Lv1;
		InRa "# Call $pc";sh $pc;
	fi
#__________________________________________________________________________________________________
	if [ $Level -ge 2 ]; then
		InRa ">> Unlocking Level [2]"
		InRa "# Downloading: ${u49}";GetSSL ${u49} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u50}";GetSSL ${u50} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u51}";GetSSL ${u51} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u52}";GetSSL ${u52} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u53}";GetSSL ${u53} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u54}";GetSSL ${u54} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u55}";GetSSL ${u55} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u56}";GetHTT ${u56} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u57}";GetHTT ${u57} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u58}";GetSSL ${u58} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u59}";GetSSL ${u59} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u60}";GetSSL ${u60} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u61}";GetSSL ${u61} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u62}";GetSSL ${u62} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u63}";GetSSL ${u63} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u64}";GetSSL ${u64} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u65}";GetSSL ${u65} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u66}";GetSSL ${u66} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u67}";GetSSL ${u67} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u68}";GetSSL ${u68} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u69}";GetSSL ${u69} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u70}";GetSSL ${u70} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u71}";GetSSL ${u71} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u72}";GetSSL ${u72} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u73}";GetSSL ${u73} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u74}";GetSSL ${u74} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u75}";GetSSL ${u75} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u76}";GetSSL ${u76} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u77}";GetSSL ${u77} > $tam;Size $tam;cat $tam > $Lv2;
		InRa "# Call $pc";sh $pc;
	fi
#__________________________________________________________________________________________________
	if [ $Level -ge 3 ]; then
		InRa ">> Unlocking Level [3]"
		InRa "# Downloading: ${u78}";GetSSL ${u78} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u79}";GetSSL ${u79} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u80}";GetMHK ${u80} > $tam;Size $tam;cat $tam >> $hTam;		
		InRa "# Downloading: ${u81}";GetSSL ${u81} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u82}";GetSSL ${u82} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u83}";GetSSL ${u83} > $tam;Size $tam;cat $tam > $Lv3;
		InRa "# Call $pc";sh $pc;
	#__________________________________________________________________________________________________
	fi
	if [ $Level -eq 4 ]; then
		InRa ">> Unlocking Level [4]"
		InRa "# Downloading: ${u84}";GetSSL ${u84} > $tam;Size $tam;cat $tam >> $hTam;
		InRa "# Downloading: ${u100}";GetSSL ${u100} > $tam;Size $tam;cat $tam > $Lv4;
		InRa "# Call $pc";sh $pc;
	fi
	if [ $NOFB = "f" ]; then
		InRa "# Downloading: ${u85}"
		GetSSL ${Nha}/denOn/facebook.only > $tam;Size $tam;cat $tam >> $hTam;
	fi
	if [ $NOFB = "F" ]; then
		InRa "# Downloading: ${u86}";GetSSL ${Nha}/denOn/facebook.all > $tam;Size $tam;cat $tam >> $hTam;
	fi
#__________________________________________________________________________________________________
else
	InRa "# NETWORK: DOWN | MODE: OFFLINE"
	[ -s $hChinh ] && cat $hChinh | awk '{print $2}' > $hTam
	[ -s $dChinh ] && cp $dChinh $dTam
fi
#__________________________________________________________________________________________________
if [ $DISTRIB -eq 0 ] && { [ -s "$denOff" ] || [ -s "$trangOff" ]; }; then
	InRa "> Deleting Special character: Black/WhiteList Offline"
	LC_ALL=C cat $denOff | sed -r "${SedBW}" > tmpmybl && mv tmpmybl $denOff
	LC_ALL=C cat $trangOff | sed -r "${SedBW}" > tmpmywl && mv tmpmywl $trangOff
	cat $denOn | cat $denOff - > $tbl
	cat $trangOn | cat $trangOff - | grep -Fvwf $denOff > $twl
fi
#__________________________________________________________________________________________________
InRa "> Add-Remove Black-White List"
LC_ALL=C cat $hTam | cat $tbl - | grep -Fvwf $twl | grep -Fvwf $dTam | awk '{if ($1 in a) next; a[$1]=$0; print}' | awk -v "IP=$SetIP" '{sub(/\r$/,""); print IP" "$0}' > $hChinh
LC_ALL=C cat $dTam | grep -Fvwf $twl | sed -r 's|^|address\=\/|; s|$|\/0.1.2.3|' > $dChinh
InRa ">>>> File size Hosts";Size $hChinh;Counts=$(cat $hChinh | wc -l | sed 's/^[ \t]*//');
InRa "# Blocked: $Counts Hosts"
InRa ">>>> File size Domains";Size $dChinh;Counts=$(cat $dChinh | wc -l | sed 's/^[ \t]*//');
InRa "# Blocked: $Counts Domains"
#__________________________________________________________________________________________________
if [ -f "${TMuc}/Location" ]
then
	echo "Skip restart DNS server"
else
	InRa "> Restarting DNS server (dnsmasq)";ReBoot;InRa "> Deleting: $TMTam";rm -rf ${TMTam};
fi
TIMERSTOP=`date +%s`
RTMINUTES=$(( $((TIMERSTOP - TIMERSTART)) /60 ))
RTSECONDS=$(( $((TIMERSTOP - TIMERSTART)) %60 ))
InRa "# Total time: $RTMINUTES:$RTSECONDS minutes"
InRa "# DONE"
logger ">>> $(basename "$0") finished"
exit 0
# FIN
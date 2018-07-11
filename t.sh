#!/bin/sh
VERSION="2018.07.11.11"
export SetIP="0.1.2.3"
HomePage="https://github.com/S8D/AdBlock/raw/master"
u01="https://github.com/oznu/dns-zone-blacklist/raw/master/dnsmasq/dnsmasq.blacklist"
u02="https://github.com/notracking/hosts-blocklists/raw/master/domains.txt"
u03="https://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts;showintro=0"
u04="https://github.com/StevenBlack/hosts/raw/master/hosts"
u05="https://github.com/notracking/hosts-blocklists/raw/master/hostnames.txt"
u06="https://s3.amazonaws.com/lists.disconnect.me/simple_ad.txt"
u07="https://s3.amazonaws.com/lists.disconnect.me/simple_malware.txt"
u08="https://s3.amazonaws.com/lists.disconnect.me/simple_tracking.txt"
u09="https://s3.amazonaws.com/lists.disconnect.me/simple_malvertising.txt"
u10="https://github.com/quidsup/notrack/raw/master/trackers.txt"
u11="https://github.com/quidsup/notrack/raw/master/malicious-sites.txt"
u12="https://mirror1.malwaredomains.com/files/justdomains"
u13="https://mirror1.malwaredomains.com/files/immortal_domains.txt"
u14="https://zeustracker.abuse.ch/blocklist.php?download=domainblocklist"
u15="https://ransomwaretracker.abuse.ch/downloads/RW_DOMBL.txt"
u16="https://ransomwaretracker.abuse.ch/downloads/CW_C2_DOMBL.txt"
u17="https://ransomwaretracker.abuse.ch/downloads/LY_C2_DOMBL.txt"
u18="https://ransomwaretracker.abuse.ch/downloads/TC_C2_DOMBL.txt"
u19="https://adaway.org/hosts.txt"
u20="https://github.com/FadeMind/hosts/raw/master/extensions/porn/sinfonietta/hosts"
u21="https://github.com/FadeMind/hosts.extras/raw/master/add.2o7Net/hosts"
u22="https://github.com/FadeMind/hosts.extras/raw/master/add.Risk/hosts"
u23="https://github.com/FadeMind/hosts.extras/raw/master/add.Spam/hosts"
u24="https://hosts-file.net/ad_servers.txt"
u25="https://hosts-file.net/exp.txt"
u26="https://hosts-file.net/grm.txt"
u27="https://hosts-file.net/hjk.txt"
u28="https://hosts-file.net/pup.txt"
u29="https://www.dshield.org/feeds/suspiciousdomains_High.txt"
u30="https://www.dshield.org/feeds/suspiciousdomains_Medium.txt"
u31="https://www.dshield.org/feeds/suspiciousdomains_Low.txt"
u32="https://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts;showintro=0"
u33="https://hostsfile.org/Downloads/hosts.txt"
u34="https://github.com/Marfjeh/coinhive-block/raw/master/domains"
u35="https://github.com/ZeroDot1/CoinBlockerLists/raw/master/hosts"
u36="https://github.com/hoshsadiq/adblock-nocoin-list/raw/master/hosts.txt"
u37="https://github.com/chadmayfield/my-pihole-blocklists/raw/master/lists/pi_blocklist_porn_top1m.list"
u38="https://v.firebog.net/hosts/AdguardDNS.txt"
u39="https://v.firebog.net/hosts/Airelle-hrsk.txt"
u40="https://v.firebog.net/hosts/Airelle-trc.txt"
u41="https://v.firebog.net/hosts/BillStearns.txt"
u42="https://v.firebog.net/hosts/Easylist.txt"
u43="https://v.firebog.net/hosts/Easyprivacy.txt"
u44="https://v.firebog.net/hosts/Prigent-Ads.txt"
u45="https://v.firebog.net/hosts/Prigent-Malware.txt"
u46="https://v.firebog.net/hosts/Prigent-Phishing.txt"
u47="https://v.firebog.net/hosts/Shalla-mal.txt"
u48="https://v.firebog.net/hosts/static/w3kbl.txt"
u49="https://github.com/azet12/KADhosts/raw/master/KADhosts.txt"
u50="https://github.com/FadeMind/hosts.extras/raw/master/UncheckyAds/hosts"
u51="https://github.com/StevenBlack/hosts/raw/master/alternates/fakenews-gambling-porn/hosts"
u52="https://hosts-file.net/emd.txt"
u53="https://hosts-file.net/fsa.txt"
u54="https://hosts-file.net/mmt.txt"
u55="https://hosts-file.net/pha.txt"
u56="http://sysctl.org/cameleon/hosts"
u57="http://winhelp2002.mvps.org/hosts.txt"
u58="http://someonewhocares.org/hosts/zero/hosts"
u59="https://github.com/anudeepND/blacklist/raw/master/adservers.txt"
u60="https://github.com/anudeepND/blacklist/raw/master/CoinMiner.txt"
u61="https://github.com/anudeepND/youtubeadsblacklist/raw/master/domainlist.txt"
u62="https://github.com/CHEF-KOCH/WebRTC-tracking/raw/master/WebRTC.txt"
u63="https://github.com/CHEF-KOCH/Spotify-Ad-free/raw/master/Spotifynulled.txt"
u64="https://github.com/CHEF-KOCH/Audio-fingerprint-pages/raw/master/AudioFp.txt"
u65="https://github.com/CHEF-KOCH/Canvas-fingerprinting-pages/raw/master/Canvas.txt"
u66="https://github.com/CHEF-KOCH/Canvas-Font-Fingerprinting-pages/raw/master/Canvas.txt"
u67="https://www.joewein.net/dl/bl/dom-bl-base.txt"
u68="https://github.com/tyzbit/hosts/raw/master/data/tyzbit/hosts"
u69="https://github.com/crazy-max/WindowsSpyBlocker/raw/master/data/hosts/spy.txt"
u70="https://v.firebog.net/hosts/static/SamsungSmart.txt"
u71="https://github.com/Perflyst/PiHoleBlocklist/raw/master/SmartTV.txt"
u72="https://github.com/vokins/yhosts/raw/master/hosts"
u73="https://github.com/mitchellkrogza/Badd-Boyz-Hosts/raw/master/hosts"
u74="https://github.com/piwik/referrer-spam-blacklist/raw/master/spammers.txt"
u75="https://github.com/HenningVanRaumle/pihole-ytadblock/raw/master/ytadblock.txt"
u76="https://github.com/matomo-org/referrer-spam-blacklist/raw/master/spammers.txt"
u77="https://github.com/Perflyst/PiHoleBlocklist/raw/master/android-tracking.txt"
u78="https://hosts-file.net/psh.txt"
u79="https://hosts-file.net/wrz.txt"
u80="http://adblock.mahakala.is/hosts"
u81="https://hostsfile.mine.nu/hosts0.txt"
u82="https://v.firebog.net/hosts/Kowabit.txt"
u83="https://adzhosts.fr/hosts/adzhosts-mac-linux.txt"
u84="https://github.com/chadmayfield/my-pihole-blocklists/raw/master/lists/pi_blocklist_porn_all.list"
u85="https://github.com/m-parashar/adbhostgen/raw/master/blacklists/facebookonly.block"
u86="https://github.com/m-parashar/adbhostgen/raw/master/blacklists/facebookall.block"
u87="https://github.com/m-parashar/adbhostgen/raw/master/blacklists/blacklist"
u88="https://github.com/m-parashar/adbhostgen/raw/master/whitelists/whitelist"
u89="https://github.com/m-parashar/adbhostgen/raw/master/whitelists/fruitydomains"
u90="https://github.com/FadeMind/hosts/raw/master/extensions/porn/clefspeare13/hosts"
#___________________________________________________________________________________________________________________________________________________________________________________________________
export Level=1
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
	echo "Dang tai: $Tam"
	mkdir ${Tam}
fi
export hChinh="${TMuc}/h"
export hDung="${TMuc}/h.zzz"
export hTam="${Tam}/h.tmp"
export dChinh="${TMuc}/d"
export dDung="${TMuc}/d.zzz"
export dTam="${Tam}/d.tmp"
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
alias MPGET="curl -f -s -k"
alias MPGETSSL="curl -f -s -k"
[ $SECURL -eq 1 ] && unalias MPGETSSL && alias MPGETSSL="curl -f -s --capath ${TMuc} --cacert $CURL_CA_BUNDLE"
alias MPGETMHK="curl -f -s -A "Mozilla/5.0" -e http://forum.xda-developers.com/"
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
	printf '\t'; echo -n "[-1]"; printf '\t\t\t\t'; echo "Level=1: increased protection [DEFAULT]"
	printf '\t'; echo -n "[-2]"; printf '\t\t\t\t'; echo "Level=2: optimum protection"
	printf '\t'; echo -n "[-3]"; printf '\t\t\t\t'; echo "Level=3: unlock maximum protection"
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
			9000    ) Level=9000 ;;
			quiet   ) QUIET=1 ;;
			pause   ) protectOff ;;
			resume  ) protectOn ;;
			secure  ) SECURL=1 ;;
			offline ) ONLINE=0 ;;
			help    ) printHelp ;;
			update  ) selfUpdate ;;
			version ) echo "$VERSION" ; logger ">>> $(basename "$0") finished" ; exit 0 ;;
			9000* | quiet* | pause* | resume* | secure* | offline* | help* | update* | version* )
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
lognecho "======================================"
lognecho "|      AdBlock for DD-WRT            |"
lognecho "|      ${HomePage}                   |"
lognecho "|      Tac gia: Manish Parashar      |"
lognecho "|      Chinh sua: Darias             |"
lognecho "======================================"
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
	lognecho "# Level LEVEL [0|1|2|3]: $Level"

	if [ ! -s cacert.pem ] || { [ "${DAYOFWEEK}" -eq 1 ] || [ "${DAYOFWEEK}" -eq 4 ]; }; then
		lognecho "> Downloading / updating cURL certificates"
		MPGETSSL --remote-name --time-cond cacert.pem https://curl.haxx.se/ca/cacert.pem
	fi
#___________________________________________________________________________________________________________________________________________________________________________________________________
	lognecho "# Dang tai: dChinh file"
	MPGETSSL ${u01} | grep -o '^[^#]*' | grep -v "::" | sed 's/0.0.0.0$/'$SetIP'/' > $dTam
	MPGETSSL ${u02} | grep -o '^[^#]*' | grep -v "::" | sed 's/0.0.0.0$/'$SetIP'/' >> $dTam
	MPGETSSL -d mimetype=plaintext -d hostformat=dnsmasq ${u03} | grep -o '^[^#]*' | grep -v "::" | sed 's/127.0.0.1$/'$SetIP'/' >> $dTam
	lognecho "# Dang tai: hChinh file"
	lognecho "> Dang tai: StevenBlack lists"
	MPGETSSL ${u04} > $hTam
	lognecho "> Dang tai: notracking blocklists"
	MPGETSSL ${u05} >> $hTam
	lognecho "> Dang tai: Disconnect.me lists"
	MPGETSSL ${u06} >> $hTam
	MPGETSSL ${u07} >> $hTam
	MPGETSSL ${u08} >> $hTam
	MPGETSSL ${u09} >> $hTam
	lognecho "> Dang tai: quidsup/notrack lists"
	MPGETSSL ${u10} >> $hTam
	MPGETSSL ${u11} >> $hTam
	lognecho "> Dang tai: MalwareDomains lists"
	MPGETSSL ${u12} >> $hTam
	MPGETSSL ${u13} >> $hTam
	lognecho "> Dang tai: abuse.ch blocklists"
	MPGETSSL ${u14} >> $hTam
	lognecho "> Dang tai: Ransomware blocklists"
	MPGETSSL ${u15} >> $hTam
	MPGETSSL ${u16} >> $hTam
	MPGETSSL ${u17} >> $hTam
	MPGETSSL ${u18} >> $hTam
	lognecho "> Dang tai: adaway list"
	MPGETSSL ${u19} >> $hTam
#___________________________________________________________________________________________________________________________________________________________________________________________________
	if [ $Level -ge 1 ]; then
		lognecho "# Unlocking Level=1 lists"
		lognecho "> Dang tai: more StevenBlack lists"
		MPGETSSL ${u20} >> $hTam
		MPGETSSL ${u21} >> $hTam
		MPGETSSL ${u22} >> $hTam
		MPGETSSL ${u23} >> $hTam
		lognecho "> Dang tai: hosts-file ATS/EXP/GRM lists"
		MPGETSSL ${u24} >> $hTam
		MPGETSSL ${u25} >> $hTam
		MPGETSSL ${u26} >> $hTam
		lognecho "> Dang tai: hosts-file HJK/PUP lists"
		MPGETSSL ${u27} >> $hTam
		MPGETSSL ${u28} >> $hTam
		lognecho "> Dang tai: dshield lists"
		MPGETSSL ${u29} >> $hTam
		MPGETSSL ${u30} >> $hTam
		MPGETSSL ${u31} >> $hTam
		lognecho "> Dang tai: pgl.yoyo.org list"
		MPGETSSL -d mimetype=plaintext -d hostformat=unixhosts ${u32} >> $hTam
		lognecho "> Dang tai: Securemecca list"
		MPGETSSL ${u33} >> $hTam
		lognecho "> Dang tai: cryptomining and porn lists"
		MPGETSSL ${u34} >> $hTam
		MPGETSSL ${u35} >> $hTam
		MPGETSSL ${u36} >> $hTam
		MPGETSSL ${u37} >> $hTam
		lognecho "> Dang tai: Easylist & w3kbl lists"
		MPGETSSL ${u38} >> $hTam
		MPGETSSL ${u39} >> $hTam
		MPGETSSL ${u40} >> $hTam
		MPGETSSL ${u41} >> $hTam
		MPGETSSL ${u42} >> $hTam
		MPGETSSL ${u43} >> $hTam
		MPGETSSL ${u44} >> $hTam
		MPGETSSL ${u45} >> $hTam
		MPGETSSL ${u46} >> $hTam
		MPGETSSL ${u47} >> $hTam
		MPGETSSL ${u48} >> $hTam
	fi
#___________________________________________________________________________________________________________________________________________________________________________________________________
	if [ $Level -ge 2 ]; then
		lognecho "# Unlocking Level=2 lists"
		lognecho "> Dang tai: even more StevenBlack lists"
		MPGETSSL ${u49} >> $hTam
		MPGETSSL ${u50} >> $hTam
		MPGETSSL ${u51} >> $hTam
		lognecho "> Dang tai: hosts-file EMD/FSA lists"
		MPGETSSL ${u52} >> $hTam
		MPGETSSL ${u53} >> $hTam
		lognecho "> Dang tai: hosts-file MMT/PHA lists"
		MPGETSSL ${u54} >> $hTam
		MPGETSSL ${u55} >> $hTam
		lognecho "> Dang tai: Cameleon list"
		MPGET ${u56} >> $hTam
		lognecho "> Dang tai: winhelp2002 list"
		MPGET ${u57} >> $hTam
		lognecho "> Dang tai: someonewhocares list"
		MPGET ${u58} >> $hTam
		lognecho "> Dang tai: anudeepND lists"
		MPGETSSL ${u59} >> $hTam
		MPGETSSL ${u60} >> $hTam
		MPGETSSL ${u61} >> $hTam
		lognecho "> Dang tai: CHEF-KOCH lists"
		MPGETSSL ${u62} >> $hTam
		MPGETSSL ${u63} >> $hTam
		MPGETSSL ${u64} >> $hTam
		MPGETSSL ${u65} >> $hTam
		MPGETSSL ${u66} >> $hTam
		lognecho "> Dang tai: joewein.de LLC list"
		MPGETSSL ${u67} >> $hTam
		lognecho "> Dang tai: Windows telemetry lists"
		MPGETSSL ${u68} >> $hTam
		MPGETSSL ${u69} >> $hTam
		lognecho "> Dang tai: smart TV blocklists"
		MPGETSSL ${u70} >> $hTam
		MPGETSSL ${u71} >> $hTam
		lognecho "> Dang tai: a few more blocklists"
		MPGETSSL ${u72} >> $hTam
		MPGETSSL ${u73} >> $hTam
		MPGETSSL ${u74} >> $hTam
		MPGETSSL ${u75} >> $hTam
		MPGETSSL ${u76} >> $hTam
		MPGETSSL ${u77} >> $hTam
	fi
#___________________________________________________________________________________________________________________________________________________________________________________________________
	if [ $Level -ge 3 ]; then
		lognecho "# Unlocking Level=3 lists"
		lognecho "> Dang tai: hosts-file PSH/PUP/WRZ lists"
		MPGETSSL ${u78} >> $hTam
		MPGETSSL ${u79} >> $hTam
		lognecho "> Dang tai: Mahakala list"
		MPGETMHK ${u80} >> $hTam
		lognecho "> Dang tai: HostsFile.mine.nu list"
		MPGETSSL ${u81} >> $hTam
		lognecho "> Dang tai: Kowabit list"
		MPGETSSL ${u82} >> $hTam
		lognecho "> Dang tai: ADZHOSTS list"
		MPGETSSL ${u83} >> $hTam
	fi
	if [ $Level -eq 9000 ]; then
		lognecho ">>> WHY, YOU ABSOLUTE MADMAN!"
		lognecho ">>> JOG ON NOW. THIS WILL TAKE SOME TIME."
		lognecho "# Unlocking Level=9000 lists"
		lognecho "> Dang tai: supermassive porn blocklist"
		MPGETSSL ${u84} >> $hTam
	fi
	if [ $NOFB = "f" ]; then
		lognecho "> Blocking Facebook and Messenger"
		MPGETSSL ${HomePage}/denOn/facebookonly.block >> $hTam
	fi
	if [ $NOFB = "F" ]; then
		lognecho "> Blocking Facebook, Messenger, Instagram, WhatsApp"
		MPGETSSL ${HomePage}/denOn/facebookall.block >> $hTam
	fi
	lognecho "> Updating official denOn/trangOn files"
	MPGETSSL ${HomePage}/denOn/denOn > $denOn
	MPGETSSL ${HomePage}/trangOn/trangOn > $trangOn
	MPGETSSL ${HomePage}/trangOn/fruitydomains > $base64wl
	LC_ALL=C uudecode $base64wl && cat appletrangOn >> $trangOn && rm appletrangOn && rm $base64wl
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
#lognecho "> Dang xu ly: final hChinh/dChinh files"
#LC_ALL=C cat $hTam | sed -r 's/^[[:blank:]]*//; s/[[:blank:]]*$//; /^$/d; /^\s*$/d' | tr -cd '\000-\177' | cat tmpbl - | grep -Fvwf tmpwl | sort -u | awk -v "IP=$SetIP" '{sub(/\r$/,""); print IP" "$0}' > $hChinh
#LC_ALL=C cat $dTam | sed -r 's/^[[:blank:]]*//; s/[[:blank:]]*$//; /^$/d; /^\s*$/d' | tr -cd '\000-\177' | grep -Fvwf tmpwl | sort -u > $dChinh
#___________________________________________________________________________________________________________________________________________________________________________________________________
lognecho "> Removing temporary files"
rm -f $hTam
rm -f $dTam
rm -f tmpbl
rm -f tmpwl
rm -rf ${Tam}
printFileSize $hChinh
printFileSize $dChinh
numberOfAdsBlocked=$(cat $hChinh | wc -l | sed 's/^[ \t]*//')
lognecho "# Number of ad domains blocked: $numberOfAdsBlocked"
if [ -f "${TMuc}/Location" ]
then
	echo "${TMuc}/Location found."
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
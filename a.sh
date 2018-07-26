#!/bin/sh
# set -euxo pipefail
Nha="https://raw.githubusercontent.com/S8D/AdBlock/master"
HomePage="https://github.com/S8D/AdBlock"
VERSION="20180725a1"
export BLITZ=3
export NOFB=0
export ONLINE=1
export QUIET=0
export SECURL=0
export DAYOFWEEK=$(date +"%u")
export DISTRIB=0
export SetIP="0.1.2.3"
export TMuc="$(cd "$(dirname "${0}")" && pwd)"
export TMTam="${TMuc}/tmp"
if [ -d "$TMTam" ]
then
	echo "Using $TMTam"
else
	echo "Creating: $TMTam"
	mkdir ${TMTam}
fi
export tam="${TMTam}/t.tmp"
export mphosts="${TMuc}/h"
export mphostspaused="${TMuc}/h.zzz"
export tmphosts="${TMTam}/h.tmp"
export mpdomains="${TMuc}/d"
export mpdomainspaused="${TMuc}/d.zzz"
export tmpdomains="${TMTam}/d.tmp"
export pauseflag="${TMuc}/PAUSED"
export blacklist="${TMuc}/Den.On"
export whitelist="${TMuc}/Trang.On"
export base64wl="${TMuc}/base64wl"
export myblacklist="${TMuc}/Den.Off"
export mywhitelist="${TMuc}/Trang.Off"
export MPLOG="${TMuc}/h.log"
export SHELL=/bin/sh
export PATH=/bin:/usr/bin:/sbin:/usr/sbin:/jffs/sbin:/jffs/bin:/jffs/usr/sbin:/jffs/usr/bin:/mmc/sbin:/mmc/bin:/mmc/usr/sbin:/mmc/usr/bin:/opt/sbin:/opt/bin:/opt/usr/sbin:/opt/usr/bin:"${TMuc}"
export LD_LIBRARY_PATH=/lib:/usr/lib:/jffs/lib:/jffs/usr/lib:/jffs/usr/local/lib:/mmc/lib:/mmc/usr/lib:/opt/lib:/opt/usr/lib
export PWD="${TMuc}"
cd "${TMuc}"
logger ">>> $(basename "$0") started"
if [ -z "$(which curl)" ]; then
	echo ">>> WARNING: cURL not found"
	echo ">>> ERROR: ABORTING"
	exit 1
fi
export CURL_CA_BUNDLE="${TMuc}/cacert.pem"
alias GetHTT="curl -f -s -k"
alias GetSSL="curl -f -s -k"
[ $SECURL -eq 1 ] && unalias GetSSL && alias GetSSL="curl -f -s --capath ${TMuc} --cacert $CURL_CA_BUNDLE"
alias GetMHK="curl -f -s -A "Mozilla/5.0" -e http://forum.xda-developers.com/"
alias SEDSPACE="sed -r 's/^[[:blank:]]*//; s/[[:blank:]]*$//; /^$/d; /^\s*$/d'"
alias GREPFILTER="tr -cd '\000-\177' | grep -o '^[^#]*' | grep -vF -e \"::\" -e \";\" -e \"//\" -e \"http\" -e \"https\""
InRa ()
{
	[ $QUIET -eq 0 ] && echo "$1"
	echo "$1" >> $MPLOG
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
	if [ -f $pauseflag ] && { [ -f $mphostspaused ] || [ -f $mpdomainspaused ]; }; then
		InRa ">>> RESUMING PROTECTION"
		mv $mphostspaused $mphosts
		mv $mpdomainspaused $mpdomains
		rm -f $pauseflag
		ReBoot
	fi
	logger ">>> $(basename "$0") finished"
	exit 0
}
Tat ()
{
	InRa ">>> WARNING: PAUSING PROTECTION"
	[ -f $mphosts ] && mv $mphosts $mphostspaused
	[ -f $mpdomains ] && mv $mpdomains $mpdomainspaused
	echo "" > $mphosts
	echo "" > $mpdomains
	echo "PAUSED" > $pauseflag
	ReBoot
	InRa ">>> Type $(basename "$0") --resume to resume protection."
	logger ">>> $(basename "$0") finished"
	exit 0
}
Giup ()
{
	echo ""
	echo "USAGE:"
	printf '\t'; echo "$(basename "$0") [-? | -h | --help] [-v | --version] [-1] [-2] [-b | --bl=<domain.name>] [-w | --wl=<domain.name>] ..."
	echo ""
	echo "OPERATION:"
	printf '\t'; echo -n "[-0]"; printf '\t\t\t\t'; echo "BLITZ=0: safe minimum protection"
	printf '\t'; echo -n "[-1]"; printf '\t\t\t\t'; echo "BLITZ=1: increased protection [DEFAULT]"
	printf '\t'; echo -n "[-2]"; printf '\t\t\t\t'; echo "BLITZ=2: optimum protection"
	printf '\t'; echo -n "[-3]"; printf '\t\t\t\t'; echo "BLITZ=3: unlock maximum protection"
	printf '\t'; echo -n "[-f]"; printf '\t\t\t\t'; echo "Block Facebook and Messenger services"
	printf '\t'; echo -n "[-F]"; printf '\t\t\t\t'; echo "Block Facebook, Messenger, Instagram, WhatsApp"
	printf '\t'; echo -n "[-d | -D]"; printf '\t\t\t'; echo "Ignore myblacklist/mywhitelist entries"
	printf '\t'; echo -n "[-b | --bl=]"; printf '\t'; echo -n "domain.name"; printf '\t'; echo "Add domain.name to myblacklist"
	printf '\t'; echo -n "[-w | --wl=]"; printf '\t'; echo -n "domain.name"; printf '\t'; echo "Add domain.name to mywhitelist"
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
CapNhat ()
{
	upFile="${TMTam}/u.tmp"
	InRa ">>> Checking for updates."
	if ping -q -c 1 -W 1 google.com >/dev/null; then
		GetSSL ${Nha}/$(basename "$0") > $upFile
		if [ 0 -eq $? ]; then
			old_md5=`md5sum $0 | cut -d' ' -f1`
			new_md5=`md5sum $upFile | cut -d' ' -f1`
			if [ "$old_md5" != "$new_md5" ]; then
				NEWVER=`grep -w -m 1 "VERSION" $upFile`
				InRa ">>> Update available: $NEWVER"
				OLDVER=`grep -w -m 1 "VERSION" $0 | cut -d \" -f2`
				cp $0 $0.$OLDVER
				chmod 755 $upFile
				mv $upFile $0
				InRa ">>> Updated to the latest version."
			else
				InRa ">>> Current version: $VERSION ."
			fi
		else
			InRa ">>> Update failed. Try again."
		fi
		rm -rf ${TMTam};
	fi
	logger ">>> $(basename "$0") finished"
	exit 0
}
while getopts "h?v0123fFdDpPqQrRsSoOuUb:w:i:-:" opt; do
	case ${opt} in
		h|\? ) Giup ;;
		v    ) echo "$VERSION" ; logger ">>> $(basename "$0") finished" ; exit 0 ;;
		0    ) BLITZ=0 ;;
		1    ) BLITZ=1 ;;
		2    ) BLITZ=2 ;;
		3    ) BLITZ=3 ;;
		f    ) NOFB="f" ;;
		F    ) NOFB="F" ;;
		d|D  ) DISTRIB=1 ;;
		q|Q  ) QUIET=1 ;;
		p|P  ) Tat ;;
		r|R  ) Bat ;;
		s|S  ) SECURL=1 ;;
		o|O  ) ONLINE=0 ;;
		u|U  ) CapNhat ;;
		b    ) echo "$OPTARG" >> $myblacklist ;;
		w    ) echo "$OPTARG" >> $mywhitelist ;;
		i    ) SetIP="$OPTARG" ;;
		-    ) LONG_OPTARG="${OPTARG#*=}"
		case $OPTARG in
			bl=?*   ) ARG_BL="$LONG_OPTARG" ; echo $ARG_BL >> $myblacklist ;;
			bl*     ) echo ">>> ERROR: no arguments for --$OPTARG option" >&2; exit 2 ;;
			wl=?*   ) ARG_WL="$LONG_OPTARG" ; echo $ARG_WL >> $mywhitelist ;;
			wl*     ) echo ">>> ERROR: no arguments for --$OPTARG option" >&2; exit 2 ;;
			ip=?*   ) ARG_IP="$LONG_OPTARG" ; SetIP=$ARG_IP ;;
			ip*     ) echo ">>> ERROR: no arguments for --$OPTARG option" >&2; exit 2 ;;
			quiet   ) QUIET=1 ;;
			pause   ) Tat ;;
			resume  ) Bat ;;
			secure  ) SECURL=1 ;;
			offline ) ONLINE=0 ;;
			help    ) Giup ;;
			update  ) CapNhat ;;
			version ) echo "$VERSION" ; logger ">>> $(basename "$0") finished" ; exit 0 ;;
			quiet* | pause* | resume* | secure* | offline* | help* | update* | version* )
					echo ">>> ERROR: no arguments allowed for --$OPTARG option" >&2; exit 2 ;;
			'' )    break ;;
			* )     echo ">>> ERROR: unsupported option --$OPTARG" >&2; exit 2 ;;
		esac ;;
  	  \? ) exit 2 ;; 
	esac
done
shift $((OPTIND-1))
TIMERSTART=`date +%s`
InRa "============================================================="
InRa "|      AdBlock for DD-WRT/Android base on Linux             |"
InRa "|      ${HomePage}                       |"
InRa "|      Author: Manish Parashar                              |"
InRa "|      Editor: Darias                                       |"
InRa "============================================================="
InRa "             `date`"
InRa "# VERSION: $VERSION"
if [ -f $pauseflag ] && { [ -f $mphostspaused ] || [ -f $mpdomainspaused ]; }; then
	InRa "# USER FORGOT TO RESUME PROTECTION AFTER PAUSING"
	Bat
fi
if [ $ONLINE -eq 1 ] && ping -q -c 1 -W 1 google.com >/dev/null; then
	InRa "# NETWORK: UP | MODE: ONLINE"
	InRa "# IP ADDRESS FOR ADS: $SetIP"
	InRa "# SECURE [0=NO | 1=YES]: $SECURL"
	InRa "# BLITZ LEVEL [0|1|2|3]: $BLITZ"
	if [ ! -s cacert.pem ] || { [ "${DAYOFWEEK}" -eq 1 ] || [ "${DAYOFWEEK}" -eq 4 ]; }; then
		InRa "> Downloading / updating cURL certificates"
		GetSSL --remote-name --time-cond cacert.pem https://curl.haxx.se/ca/cacert.pem
	fi
	InRa "# Processing mpdomains file"
	GetSSL https://raw.githubusercontent.com/oznu/dns-zone-blacklist/master/dnsmasq/dnsmasq.blacklist | GREPFILTER | sed 's/0.0.0.0$/'$SetIP'/' > $tam; Size $tam; cat $tam > $tmpdomains
	GetSSL https://raw.githubusercontent.com/notracking/hosts-blocklists/master/domains.txt | GREPFILTER | sed 's/0.0.0.0$/'$SetIP'/' > $tam; Size $tam; cat $tam >> $tmpdomains
	GetSSL -d mimetype=plaintext -d hostformat=dnsmasq https://pgl.yoyo.org/adservers/serverlist.php? | GREPFILTER | sed 's/127.0.0.1$/'$SetIP'/' > $tam; Size $tam; cat $tam >> $tmpdomains
	InRa "# Creating mphosts file"
	InRa "> Processing StevenBlack lists"
	GetSSL https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts | GREPFILTER | awk '{print $2}' > $tmphosts
	InRa "> Processing notracking blocklists"
	GetSSL https://raw.githubusercontent.com/notracking/hosts-blocklists/master/hostnames.txt | GREPFILTER | awk '{print $2}' > $tam; Size $tam; cat $tam >> $tmphosts
	InRa "> Processing Disconnect.me lists"
	GetSSL https://s3.amazonaws.com/lists.disconnect.me/simple_ad.txt | GREPFILTER > $tam; Size $tam; cat $tam >> $tmphosts
	GetSSL https://s3.amazonaws.com/lists.disconnect.me/simple_malware.txt | GREPFILTER > $tam; Size $tam; cat $tam >> $tmphosts
	GetSSL https://s3.amazonaws.com/lists.disconnect.me/simple_tracking.txt | GREPFILTER > $tam; Size $tam; cat $tam >> $tmphosts
	GetSSL https://s3.amazonaws.com/lists.disconnect.me/simple_malvertising.txt | GREPFILTER > $tam; Size $tam; cat $tam >> $tmphosts
	InRa "> Processing quidsup/notrack lists"
	GetSSL https://raw.githubusercontent.com/quidsup/notrack/master/trackers.txt | GREPFILTER > $tam; Size $tam; cat $tam >> $tmphosts
	GetSSL https://raw.githubusercontent.com/quidsup/notrack/master/malicious-sites.txt | GREPFILTER > $tam; Size $tam; cat $tam >> $tmphosts
	InRa "> Processing MalwareDomains lists"
	GetSSL https://mirror1.malwaredomains.com/files/justdomains | GREPFILTER > $tam; Size $tam; cat $tam >> $tmphosts
	GetSSL https://mirror1.malwaredomains.com/files/immortal_domains.txt | GREPFILTER > $tam; Size $tam; cat $tam >> $tmphosts
	InRa "> Processing abuse.ch blocklists"
	GetSSL https://zeustracker.abuse.ch/blocklist.php?download=domainblocklist | GREPFILTER > $tam; Size $tam; cat $tam >> $tmphosts
	InRa "> Processing Ransomware blocklists"
	GetSSL https://ransomwaretracker.abuse.ch/downloads/RW_DOMBL.txt | GREPFILTER > $tam; Size $tam; cat $tam >> $tmphosts
	GetSSL https://ransomwaretracker.abuse.ch/downloads/CW_C2_DOMBL.txt | GREPFILTER > $tam; Size $tam; cat $tam >> $tmphosts
	GetSSL https://ransomwaretracker.abuse.ch/downloads/LY_C2_DOMBL.txt | GREPFILTER > $tam; Size $tam; cat $tam >> $tmphosts
	GetSSL https://ransomwaretracker.abuse.ch/downloads/TC_C2_DOMBL.txt | GREPFILTER > $tam; Size $tam; cat $tam >> $tmphosts
	InRa "> Processing adaway list"
	GetSSL https://adaway.org/hosts.txt | GREPFILTER | awk '{print $2}' > $tam; Size $tam; cat $tam >> $tmphosts
	if [ $BLITZ -ge 1 ]; then
		InRa "# Unlocking BLITZ=1 level lists"
		InRa "> Processing more StevenBlack lists"
		GetSSL https://raw.githubusercontent.com/tyzbit/hosts/master/data/tyzbit/hosts | GREPFILTER | awk '{print $2}' > $tam; Size $tam; cat $tam >> $tmphosts
		GetSSL https://raw.githubusercontent.com/StevenBlack/hosts/master/data/add.2o7Net/hosts | GREPFILTER | awk '{print $2}' > $tam; Size $tam; cat $tam >> $tmphosts
		GetSSL https://raw.githubusercontent.com/StevenBlack/hosts/master/data/add.Risk/hosts | GREPFILTER | awk '{print $2}' > $tam; Size $tam; cat $tam >> $tmphosts
		GetSSL https://raw.githubusercontent.com/StevenBlack/hosts/master/data/add.Spam/hosts | GREPFILTER | awk '{print $2}' > $tam; Size $tam; cat $tam >> $tmphosts
		InRa "> Processing hosts-file ATS/EXP/GRM lists"
		GetSSL https://hosts-file.net/ad_servers.txt | GREPFILTER | awk '{print $2}' > $tam; Size $tam; cat $tam >> $tmphosts
		GetSSL https://hosts-file.net/exp.txt | GREPFILTER | awk '{print $2}' > $tam; Size $tam; cat $tam >> $tmphosts
		GetSSL https://hosts-file.net/grm.txt | GREPFILTER | awk '{print $2}' > $tam; Size $tam; cat $tam >> $tmphosts
		InRa "> Processing hosts-file HJK/PUP lists"
		GetSSL https://hosts-file.net/hjk.txt | GREPFILTER | awk '{print $2}' > $tam; Size $tam; cat $tam >> $tmphosts
		GetSSL https://hosts-file.net/pup.txt | GREPFILTER | awk '{print $2}' > $tam; Size $tam; cat $tam >> $tmphosts
		InRa "> Processing dshield lists"
		GetSSL https://www.dshield.org/feeds/suspiciousdomains_High.txt | GREPFILTER > $tam; Size $tam; cat $tam >> $tmphosts
		GetSSL https://www.dshield.org/feeds/suspiciousdomains_Medium.txt | GREPFILTER > $tam; Size $tam; cat $tam >> $tmphosts
		GetSSL https://www.dshield.org/feeds/suspiciousdomains_Low.txt | GREPFILTER > $tam; Size $tam; cat $tam >> $tmphosts
		InRa "> Processing pgl.yoyo.org list"
		GetSSL -d mimetype=plaintext -d hostformat=unixhosts https://pgl.yoyo.org/adservers/serverlist.php? | GREPFILTER | awk '{print $2}' > $tam; Size $tam; cat $tam >> $tmphosts
		InRa "> Processing Securemecca list"
		GetSSL https://hostsfile.org/Downloads/hosts.txt | GREPFILTER | awk '{print $2}' > $tam; Size $tam; cat $tam >> $tmphosts
		InRa "> Processing cryptomining and porn lists"
		GetSSL https://raw.githubusercontent.com/Marfjeh/coinhive-block/master/domains | GREPFILTER > $tam; Size $tam; cat $tam >> $tmphosts
		GetSSL https://raw.githubusercontent.com/ZeroDot1/CoinBlockerLists/master/hosts | GREPFILTER | awk '{print $2}' > $tam; Size $tam; cat $tam >> $tmphosts
		GetSSL https://raw.githubusercontent.com/hoshsadiq/adblock-nocoin-list/master/hosts.txt | GREPFILTER | awk '{print $2}' > $tam; Size $tam; cat $tam >> $tmphosts
		GetSSL https://raw.githubusercontent.com/chadmayfield/my-pihole-blocklists/master/lists/pi_blocklist_porn_top1m.list | GREPFILTER > $tam; Size $tam; cat $tam >> $tmphosts
		InRa "> Processing Easylist & w3kbl lists"
		GetSSL https://v.firebog.net/hosts/AdguardDNS.txt | GREPFILTER > $tam; Size $tam; cat $tam >> $tmphosts
		GetSSL https://v.firebog.net/hosts/Airelle-hrsk.txt | GREPFILTER > $tam; Size $tam; cat $tam >> $tmphosts
		GetSSL https://v.firebog.net/hosts/Airelle-trc.txt | GREPFILTER > $tam; Size $tam; cat $tam >> $tmphosts
		GetSSL https://v.firebog.net/hosts/BillStearns.txt | GREPFILTER > $tam; Size $tam; cat $tam >> $tmphosts
		GetSSL https://v.firebog.net/hosts/Easylist.txt | GREPFILTER > $tam; Size $tam; cat $tam >> $tmphosts
		GetSSL https://v.firebog.net/hosts/Easyprivacy.txt | GREPFILTER > $tam; Size $tam; cat $tam >> $tmphosts
		GetSSL https://v.firebog.net/hosts/Prigent-Ads.txt | GREPFILTER > $tam; Size $tam; cat $tam >> $tmphosts
		GetSSL https://v.firebog.net/hosts/Prigent-Malware.txt | GREPFILTER > $tam; Size $tam; cat $tam >> $tmphosts
		GetSSL https://v.firebog.net/hosts/Prigent-Phishing.txt | GREPFILTER > $tam; Size $tam; cat $tam >> $tmphosts
		GetSSL https://v.firebog.net/hosts/Shalla-mal.txt | GREPFILTER > $tam; Size $tam; cat $tam >> $tmphosts
		GetSSL https://v.firebog.net/hosts/static/w3kbl.txt | GREPFILTER > $tam; Size $tam; cat $tam >> $tmphosts
	fi
	if [ $BLITZ -ge 2 ]; then
		InRa "# Unlocking BLITZ=2 level lists"
		InRa "> Processing even more StevenBlack lists"
		GetSSL https://raw.githubusercontent.com/StevenBlack/hosts/master/data/KADhosts/hosts | GREPFILTER | awk '{print $2}' > $tam; Size $tam; cat $tam >> $tmphosts
		GetSSL https://raw.githubusercontent.com/StevenBlack/hosts/master/data/UncheckyAds/hosts | GREPFILTER | awk '{print $2}' > $tam; Size $tam; cat $tam >> $tmphosts
		GetSSL https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn/hosts | GREPFILTER | awk '{print $2}' > $tam; Size $tam; cat $tam >> $tmphosts
		InRa "> Processing hosts-file EMD/FSA lists"
		GetSSL https://hosts-file.net/emd.txt | GREPFILTER | awk '{print $2}' > $tam; Size $tam; cat $tam >> $tmphosts
		GetSSL https://hosts-file.net/fsa.txt | GREPFILTER | awk '{print $2}' > $tam; Size $tam; cat $tam >> $tmphosts
		InRa "> Processing hosts-file MMT/PHA lists"
		GetSSL https://hosts-file.net/mmt.txt | GREPFILTER | awk '{print $2}' > $tam; Size $tam; cat $tam >> $tmphosts
		GetSSL https://hosts-file.net/pha.txt | GREPFILTER | awk '{print $2}' > $tam; Size $tam; cat $tam >> $tmphosts
		InRa "> Processing Cameleon list"
		GetHTT http://sysctl.org/cameleon/hosts | GREPFILTER | awk '{print $2}' > $tam; Size $tam; cat $tam >> $tmphosts
		InRa "> Processing winhelp2002 list"
		GetHTT http://winhelp2002.mvps.org/hosts.txt | GREPFILTER | awk '{print $2}' > $tam; Size $tam; cat $tam >> $tmphosts
		InRa "> Processing someonewhocares list"
		GetHTT http://someonewhocares.org/hosts/zero/hosts | GREPFILTER | awk '{print $2}' > $tam; Size $tam; cat $tam >> $tmphosts
		InRa "> Processing anudeepND lists"
		GetSSL https://raw.githubusercontent.com/anudeepND/blacklist/master/adservers.txt | GREPFILTER | awk '{print $2}' > $tam; Size $tam; cat $tam >> $tmphosts
		GetSSL https://raw.githubusercontent.com/anudeepND/blacklist/master/CoinMiner.txt | GREPFILTER | awk '{print $2}' > $tam; Size $tam; cat $tam >> $tmphosts
		GetSSL https://raw.githubusercontent.com/anudeepND/youtubeadsblacklist/master/domainlist.txt | GREPFILTER > $tam; Size $tam; cat $tam >> $tmphosts
		InRa "> Processing CHEF-KOCH lists"
		GetSSL https://raw.githubusercontent.com/CHEF-KOCH/WebRTC-tracking/master/WebRTC.txt | GREPFILTER | awk '{print $2}' > $tam; Size $tam; cat $tam >> $tmphosts
		GetSSL https://raw.githubusercontent.com/CHEF-KOCH/Spotify-Ad-free/master/Spotifynulled.txt | GREPFILTER | awk '{print $2}' > $tam; Size $tam; cat $tam >> $tmphosts
		GetSSL https://raw.githubusercontent.com/CHEF-KOCH/Audio-fingerprint-pages/master/AudioFp.txt | GREPFILTER | awk '{print $2}' > $tam; Size $tam; cat $tam >> $tmphosts
		GetSSL https://raw.githubusercontent.com/CHEF-KOCH/Canvas-fingerprinting-pages/master/Canvas.txt | GREPFILTER | awk '{print $2}' > $tam; Size $tam; cat $tam >> $tmphosts
		GetSSL https://raw.githubusercontent.com/CHEF-KOCH/Canvas-Font-Fingerprinting-pages/master/Canvas.txt | GREPFILTER | awk '{print $2}' > $tam; Size $tam; cat $tam >> $tmphosts
		InRa "> Processing joewein.de LLC list"
		GetSSL https://www.joewein.net/dl/bl/dom-bl-base.txt | GREPFILTER > $tam; Size $tam; cat $tam >> $tmphosts
		InRa "> Processing Windows telemetry lists"
		GetSSL https://raw.githubusercontent.com/tyzbit/hosts/master/data/tyzbit/hosts | GREPFILTER | awk '{print $2}' > $tam; Size $tam; cat $tam >> $tmphosts
		GetSSL https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/hosts/spy.txt | GREPFILTER | awk '{print $2}' > $tam; Size $tam; cat $tam >> $tmphosts
		InRa "> Processing smart TV blocklists"
		GetSSL https://v.firebog.net/hosts/static/SamsungSmart.txt | GREPFILTER > $tam; Size $tam; cat $tam >> $tmphosts
		GetSSL https://raw.githubusercontent.com/Perflyst/PiHoleBlocklist/master/SmartTV.txt | GREPFILTER > $tam; Size $tam; cat $tam >> $tmphosts
		InRa "> Processing a few more blocklists"
		GetSSL https://raw.githubusercontent.com/vokins/yhosts/master/hosts | GREPFILTER | awk '{print $2}' > $tam; Size $tam; cat $tam >> $tmphosts
		GetSSL https://raw.githubusercontent.com/mitchellkrogza/Badd-Boyz-Hosts/master/hosts | GREPFILTER | awk '{print $2}' > $tam; Size $tam; cat $tam >> $tmphosts
		GetSSL https://raw.githubusercontent.com/piwik/referrer-spam-blacklist/master/spammers.txt | GREPFILTER > $tam; Size $tam; cat $tam >> $tmphosts
		GetSSL https://raw.githubusercontent.com/HenningVanRaumle/pihole-ytadblock/master/ytadblock.txt | GREPFILTER | awk '{print $2}' > $tam; Size $tam; cat $tam >> $tmphosts
		GetSSL https://raw.githubusercontent.com/matomo-org/referrer-spam-blacklist/master/spammers.txt | GREPFILTER > $tam; Size $tam; cat $tam >> $tmphosts
		GetSSL https://raw.githubusercontent.com/Perflyst/PiHoleBlocklist/master/android-tracking.txt | GREPFILTER > $tam; Size $tam; cat $tam >> $tmphosts
	fi
	if [ $BLITZ -ge 3 ]; then
		InRa "# Unlocking BLITZ=3 level lists"
		InRa "> Processing hosts-file PSH/PUP/WRZ lists"
		GetSSL https://hosts-file.net/psh.txt | GREPFILTER | awk '{print $2}' > $tam; Size $tam; cat $tam >> $tmphosts
		GetSSL https://hosts-file.net/wrz.txt | GREPFILTER | awk '{print $2}' > $tam; Size $tam; cat $tam >> $tmphosts
		InRa "> Processing Mahakala list"
		GetMHK http://adblock.mahakala.is/hosts | GREPFILTER | awk '{print $2}' > $tam; Size $tam; cat $tam >> $tmphosts
		InRa "> Processing HostsFile.mine.nu list"
		GetSSL https://hostsfile.mine.nu/hosts0.txt | GREPFILTER | awk '{print $2}' > $tam; Size $tam; cat $tam >> $tmphosts
		InRa "> Processing Kowabit list"
		GetSSL https://v.firebog.net/hosts/Kowabit.txt | GREPFILTER > $tam; Size $tam; cat $tam >> $tmphosts
		InRa "> Processing ADZHOSTS list"
		GetSSL https://adzhosts.hizo.fr/hosts/adzhosts-android.txt | GREPFILTER | awk '{print $2}' > $tam; Size $tam; cat $tam >> $tmphosts
	fi
	if [ $NOFB = "f" ]; then
		InRa "> Blocking Facebook and Messenger"
		GetSSL https://raw.githubusercontent.com/m-parashar/adbhostgen/master/blacklists/facebookonly.block > $tam; Size $tam; cat $tam >> $tmphosts
	fi
	if [ $NOFB = "F" ]; then
		InRa "> Blocking Facebook, Messenger, Instagram, WhatsApp"
		GetSSL https://raw.githubusercontent.com/m-parashar/adbhostgen/master/blacklists/facebookall.block > $tam; Size $tam; cat $tam >> $tmphosts
	fi
	InRa "> Updating official blacklist/whitelist files"
	GetSSL https://raw.githubusercontent.com/m-parashar/adbhostgen/master/blacklists/blacklist | GREPFILTER > $tam; Size $tam; cat $tam > $blacklist
	GetSSL https://raw.githubusercontent.com/m-parashar/adbhostgen/master/whitelists/whitelist | GREPFILTER > $tam; Size $tam; cat $tam > $whitelist
	GetSSL https://raw.githubusercontent.com/m-parashar/adbhostgen/master/whitelists/fruitydomains > $tam; Size $tam; cat $tam > $base64wl
	LC_ALL=C uudecode $base64wl && cat applewhitelist >> $whitelist && rm applewhitelist && rm $base64wl
else
	InRa "# NETWORK: DOWN | MODE: OFFLINE"
	logger ">>> $(basename "$0") finished"
	exit 0
fi
if [ $ONLINE -eq 0 ]; then
	InRa "# NETWORK: DOWN | MODE: OFFLINE"
	InRa "# OFFLINE PROCESSING"
	[ -s $mphosts ] && cat $mphosts | awk '{print $2}' > $tmphosts
	[ -s $mpdomains ] && cp $mpdomains $tmpdomains
	ReBoot
	logger ">>> $(basename "$0") finished"
	exit 0
fi
Size $tmphosts
Size $tmpdomains
InRa "> Processing blacklist/whitelist files"
LC_ALL=C cat $blacklist | SEDSPACE | sort -u > tmpbl && cp tmpbl $blacklist
LC_ALL=C cat $whitelist | SEDSPACE | sort -u > tmpwl && cp tmpwl $whitelist
if [ $DISTRIB -eq 0 ] && { [ -s "$myblacklist" ] || [ -s "$mywhitelist" ]; }; then
	InRa "> Processing myblacklist/mywhitelist files"
	LC_ALL=C cat $myblacklist | SEDSPACE | sort -u > tmpmybl && mv tmpmybl $myblacklist
	LC_ALL=C cat $mywhitelist | SEDSPACE | sort -u > tmpmywl && mv tmpmywl $mywhitelist
	cat $blacklist | cat $myblacklist - > tmpbl
	cat $whitelist | cat $mywhitelist - | grep -Fvwf $myblacklist > tmpwl
fi
InRa "> Processing final mphosts/mpdomains files"
LC_ALL=C cat $tmphosts | SEDSPACE | cat tmpbl - | grep -Fvwf tmpwl | sort -u | awk -v "IP=$SetIP" '{sub(/\r$/,""); print IP" "$0}' > $mphosts
LC_ALL=C cat $tmpdomains | SEDSPACE | grep -Fvwf tmpwl | sort -u > $mpdomains
Size $mphosts
Size $mpdomains
numHostsBlocked=$(cat $mphosts | wc -l | sed 's/^[ \t]*//')
InRa "# Number of ad hosts blocked: approx $numHostsBlocked"
numDomainsBlocked=$(cat $mpdomains | wc -l | sed 's/^[ \t]*//')
InRa "# Number of ad domains blocked: approx $numDomainsBlocked"
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
#!/bin/sh
# set -euxo pipefail
# File: s.sh
export BLITZ=3
VERSION="2018.07.08.11"
ThuMuc='/jffs'

#export ThuMuc="${PWD##*/}"
# temporary directory
export Tam="${ThuMuc}/tmp"
if [ ! -d "${Tam}" ]; then
  mkdir ${Tam}
fi

# where ads go to die
# do not use 0.0.0.0 or 127.0.0.1
export SetIP="0.1.2.3"
###############################################################################
# Set URL
export upd="https://raw.githubusercontent.com/S8D/AdBlock/master"
export u00="https://github.com/S8D/AdBlock/raw/master/1_Darias.txt"
export u01="https://github.com/oznu/dns-zone-blacklist/raw/master/dnsmasq/dnsmasq.blacklist"
export u02="https://github.com/notracking/hosts-blocklists/raw/master/domains.txt"
export u03="https://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts;showintro=0"
export u04="https://github.com/StevenBlack/hosts/raw/master/hosts"
export u05="https://github.com/notracking/hosts-blocklists/raw/master/hostnames.txt"
export u06="https://s3.amazonaws.com/lists.disconnect.me/simple_ad.txt"
export u07="https://s3.amazonaws.com/lists.disconnect.me/simple_malware.txt"
export u08="https://s3.amazonaws.com/lists.disconnect.me/simple_tracking.txt"
export u09="https://s3.amazonaws.com/lists.disconnect.me/simple_malvertising.txt"
export u10="https://github.com/quidsup/notrack/raw/master/trackers.txt"
export u11="https://github.com/quidsup/notrack/raw/master/malicious-sites.txt"
export u12="https://mirror1.malwaredomains.com/files/justdomains"
export u13="https://mirror1.malwaredomains.com/files/immortal_domains.txt"
export u14="https://zeustracker.abuse.ch/blocklist.php?download=domainblocklist"
export u15="https://ransomwaretracker.abuse.ch/downloads/RW_DOMBL.txt"
export u16="https://ransomwaretracker.abuse.ch/downloads/CW_C2_DOMBL.txt"
export u17="https://ransomwaretracker.abuse.ch/downloads/LY_C2_DOMBL.txt"
export u18="https://ransomwaretracker.abuse.ch/downloads/TC_C2_DOMBL.txt"
export u19="https://adaway.org/hosts.txt"
export u20="https://github.com/FadeMind/hosts/raw/master/extensions/porn/sinfonietta/hosts"
export u21="https://github.com/FadeMind/hosts.extras/raw/master/add.2o7Net/hosts"
export u22="https://github.com/FadeMind/hosts.extras/raw/master/add.Risk/hosts"
export u23="https://github.com/FadeMind/hosts.extras/raw/master/add.Spam/hosts"
export u24="https://hosts-file.net/ad_servers.txt"
export u25="https://hosts-file.net/exp.txt"
export u26="https://hosts-file.net/grm.txt"
export u27="https://hosts-file.net/hjk.txt"
export u28="https://hosts-file.net/pup.txt"
export u29="https://www.dshield.org/feeds/suspiciousdomains_High.txt"
export u30="https://www.dshield.org/feeds/suspiciousdomains_Medium.txt"
export u31="https://www.dshield.org/feeds/suspiciousdomains_Low.txt"
export u32="https://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts;showintro=0"
export u33="https://hostsfile.org/Downloads/hosts.txt"
export u34="https://github.com/Marfjeh/coinhive-block/raw/master/domains"
export u35="https://github.com/ZeroDot1/CoinBlockerLists/raw/master/hosts"
export u36="https://github.com/hoshsadiq/adblock-nocoin-list/raw/master/hosts.txt"
export u37="https://github.com/chadmayfield/my-pihole-blocklists/raw/master/lists/pi_blocklist_porn_top1m.list"
export u38="https://v.firebog.net/hosts/AdguardDNS.txt"
export u39="https://v.firebog.net/hosts/Airelle-hrsk.txt"
export u40="https://v.firebog.net/hosts/Airelle-trc.txt"
export u41="https://v.firebog.net/hosts/BillStearns.txt"
export u42="https://v.firebog.net/hosts/Easylist.txt"
export u43="https://v.firebog.net/hosts/Easyprivacy.txt"
export u44="https://v.firebog.net/hosts/Prigent-Ads.txt"
export u45="https://v.firebog.net/hosts/Prigent-Malware.txt"
export u46="https://v.firebog.net/hosts/Prigent-Phishing.txt"
export u47="https://v.firebog.net/hosts/Shalla-mal.txt"
export u48="https://v.firebog.net/hosts/static/w3kbl.txt"
export u49="https://github.com/azet12/KADhosts/raw/master/KADhosts.txt"
export u50="https://github.com/FadeMind/hosts.extras/raw/master/UncheckyAds/hosts"
export u51="https://github.com/StevenBlack/hosts/raw/master/alternates/fakenews-gambling-porn/hosts"
export u52="https://hosts-file.net/emd.txt"
export u53="https://hosts-file.net/fsa.txt"
export u54="https://hosts-file.net/mmt.txt"
export u55="https://hosts-file.net/pha.txt"
export u56="http://sysctl.org/cameleon/hosts"
export u57="http://winhelp2002.mvps.org/hosts.txt"
export u58="http://someonewhocares.org/hosts/zero/hosts"
export u59="https://github.com/anudeepND/blacklist/raw/master/adservers.txt"
export u60="https://github.com/anudeepND/blacklist/raw/master/CoinMiner.txt"
export u61="https://github.com/anudeepND/youtubeadsblacklist/raw/master/domainlist.txt"
export u62="https://github.com/CHEF-KOCH/WebRTC-tracking/raw/master/WebRTC.txt"
export u63="https://github.com/CHEF-KOCH/Spotify-Ad-free/raw/master/Spotifynulled.txt"
export u64="https://github.com/CHEF-KOCH/Audio-fingerprint-pages/raw/master/AudioFp.txt"
export u65="https://github.com/CHEF-KOCH/Canvas-fingerprinting-pages/raw/master/Canvas.txt"
export u66="https://github.com/CHEF-KOCH/Canvas-Font-Fingerprinting-pages/raw/master/Canvas.txt"
export u67="https://www.joewein.net/dl/bl/dom-bl-base.txt"
export u68="https://github.com/tyzbit/hosts/raw/master/data/tyzbit/hosts"
export u69="https://github.com/crazy-max/WindowsSpyBlocker/raw/master/data/hosts/spy.txt"
export u70="https://v.firebog.net/hosts/static/SamsungSmart.txt"
export u71="https://github.com/Perflyst/PiHoleBlocklist/raw/master/SmartTV.txt"
export u72="https://github.com/vokins/yhosts/raw/master/hosts"
export u73="https://github.com/mitchellkrogza/Badd-Boyz-Hosts/raw/master/hosts"
export u74="https://github.com/piwik/referrer-spam-blacklist/raw/master/spammers.txt"
export u75="https://github.com/HenningVanRaumle/pihole-ytadblock/raw/master/ytadblock.txt"
export u76="https://github.com/matomo-org/referrer-spam-blacklist/raw/master/spammers.txt"
export u77="https://github.com/Perflyst/PiHoleBlocklist/raw/master/android-tracking.txt"
export u78="https://hosts-file.net/psh.txt"
export u79="https://hosts-file.net/wrz.txt"
export u80="http://adblock.mahakala.is/hosts"
export u81="https://hostsfile.mine.nu/hosts0.txt"
export u82="https://v.firebog.net/hosts/Kowabit.txt"
export u83="https://adzhosts.fr/hosts/adzhosts-mac-linux.txt"
export u84="https://github.com/chadmayfield/my-pihole-blocklists/raw/master/lists/pi_blocklist_porn_all.list"
export u85="https://github.com/m-parashar/adbhostgen/raw/master/blacklists/facebookonly.block"
export u86="https://github.com/m-parashar/adbhostgen/raw/master/blacklists/facebookall.block"
export u87="https://github.com/m-parashar/adbhostgen/raw/master/blacklists/blacklist"
export u88="https://github.com/m-parashar/adbhostgen/raw/master/whitelists/whitelist"
export u89="https://github.com/m-parashar/adbhostgen/raw/master/whitelists/fruitydomains"
export u90="https://github.com/FadeMind/hosts/raw/master/extensions/porn/clefspeare13/hosts"
export u91="https://github.com/Yhonay/antipopads/raw/master/hosts"
# Script to generate massive block lists for DD-WRT
#
# AUTHOR: Manish Parashar
#
# https://github.com/m-parashar/adbhostgen
# https://gist.github.com/m-parashar/ee38454c27f7a4f4e4ab28249a834ccc
# https://www.dd-wrt.com/phpBB2/viewtopic.php?t=307533
#
# Thanks: List providers and users.
#
# Installation:
# Give the script permissions to execute:
# chmod +x s.sh
#
# Add the hosts file and extra configuration to DD-WRT's dnsmasq config via Services -> Additional DNSMasq Options
# conf-file=${ThuMuc}/mpdomains
# addn-hosts=${ThuMuc}/mphosts
#
# optional:
# Never forward plain names (without a dot or domain part)
# domain-needed
# Never forward addresses in the non-routed address spaces.
# bogus-priv
#
# Log each DNS query as it passes through dnsmasq.
# log-queries
# log-facility=${ThuMuc}/dnsmasq.log
# log-async
#
# Go to Administration -> Cron (Sets the script to update itself. Choose your own schedule.)
# Build the adblock files on MON and THU at 6AM
# 0 6 * * 1,4 root ${ThuMuc}/s.sh
#

###############################################################################

# define aggressiveness: [ 0 | 1 | 2 | 3 ]
# 0: bare minimum protection from ads and malware
# 1: toned down, tuxedo wearing ad-slaying professional mode [DEFAULT]
# 2: optimum protection
# 3: ramped up, stone cold ad-killing maniac mode
# either change this here or use command line argument

# block Facebook
# f: only block Facebook and Messenger services
# F: block Facebook, Instagram, and WhatsApp
export NOFB=0

# online/offline mode switch
# DO NOT CHANGE; use command line argument instead
export ONLINE=1

# verbosity control
# 0: write to screen & log file
# 1: write to log file only
# exceptions: help, version, errors, warnings
export QUIET=0

# secure communication switch
# if enabled, cURL uses certificates for safe and
# secure TLS/SSL communication
export SECURL=0

# day of week
export DAYOFWEEK=$(date +"%u")

# distribution mode / defaults switch
# if set to 1, ignores myblacklist/mywhitelist files
# DO NOT CHANGE; use command line argument instead
export DISTRIB=0

# define dnsmasq directory and path
# needn't be /jffs, could be /opt
# preferably use a USB drive for this


# dnsmasq hosts & domain files
export mphosts="${ThuMuc}/h"
export mphostspaused="${ThuMuc}/mphosts.zzz"
export tmphosts="${Tam}/mphosts.tmp"

# temporary dnsmasq hosts & domain files
export mpdomains="${ThuMuc}/d"
export mpdomainspaused="${ThuMuc}/mpdomains.zzz"
export tmpdomains="${Tam}/mpdomains.tmp"

# pause flag
export pauseflag="${ThuMuc}/PAUSED"

# blacklist file: a list of blacklisted domains one per line
export blacklist="${ThuMuc}/blacklist"

# whitelist file: a list of whitelisted domains one per line
export whitelist="${ThuMuc}/whitelist"

# encoded whitelist file: a list of whitelisted domains one per line
export base64wl="${ThuMuc}/base64wl"

# user's custom blacklist file: a list of blacklisted domains one per line
export myblacklist="${ThuMuc}/myblacklist"

# user's custom whitelist file: a list of whitelisted domains one per line
export mywhitelist="${ThuMuc}/mywhitelist"

# log file
export MPLOG="${ThuMuc}/mphosts.log"
#[ -s $MPLOG ] && rm -f $MPLOG

# help cron a bit
export SHELL=/bin/sh
export PATH=/bin:/usr/bin:/sbin:/usr/sbin:/jffs/sbin:/jffs/bin:/jffs/usr/sbin:/jffs/usr/bin:/mmc/sbin:/mmc/bin:/mmc/usr/sbin:/mmc/usr/bin:/opt/sbin:/opt/bin:/opt/usr/sbin:/opt/usr/bin:"${ThuMuc}"
export LD_LIBRARY_PATH=/lib:/usr/lib:/jffs/lib:/jffs/usr/lib:/jffs/usr/local/lib:/mmc/lib:/mmc/usr/lib:/opt/lib:/opt/usr/lib
export PWD="${ThuMuc}"

###############################################################################

cd "${ThuMuc}"
logger ">>> $(basename "$0") started"

###############################################################################

# cURL certificates and options
if [ -z "$(which curl)" ]; then
	echo ">>> WARNING: cURL not found"
	echo ">>> ERROR: ABORTING"
	exit 1
fi

export CURL_CA_BUNDLE="${ThuMuc}/cacert.pem"
alias MPGET="curl -f -s -k"
alias MPGETSSL="curl -f -s -k"
[ $SECURL -eq 1 ] && unalias MPGETSSL && alias MPGETSSL="curl -f -s --capath ${ThuMuc} --cacert $CURL_CA_BUNDLE"
alias MPGETMHK="curl -f -s -A "Mozilla/5.0" -e http://forum.xda-developers.com/"

###############################################################################

# echo & log
lognecho ()
{
	[ $QUIET -eq 0 ] && echo "$1"
	echo "$1" >> $MPLOG
}

# print file size
printFileSize ()
{
	lognecho "# Size of $1: `du -h $1 | awk '{print $1}'`"
}

# restart dnsmasq
restart_dnsmasq ()
{
	logger ">>> $(basename "$0") restarting dnsmasq"
	restart_dns &
	logger ">>> $(basename "$0") restarted dnsmasq"
}

# resume protection
protectOn ()
{
	if [ -f $pauseflag ] && { [ -f $mphostspaused ] || [ -f $mpdomainspaused ]; }; then
		lognecho ">>> RESUMING PROTECTION"
		mv $mphostspaused $mphosts
		mv $mpdomainspaused $mpdomains
		rm -f $pauseflag
		restart_dnsmasq
	fi
	logger ">>> $(basename "$0") finished"
	exit 0
}

# pause protection
protectOff ()
{
	lognecho ">>> WARNING: PAUSING PROTECTION"
	[ -f $mphosts ] && mv $mphosts $mphostspaused
	[ -f $mpdomains ] && mv $mpdomains $mpdomainspaused
	echo "" > $mphosts
	echo "" > $mpdomains
	echo "PAUSED" > $pauseflag
	restart_dnsmasq
	lognecho ">>> Type $(basename "$0") --resume to resume protection."
	logger ">>> $(basename "$0") finished"
	exit 0
}

# print help options
printHelp ()
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
	printf '\t'; echo -n "[-u | --update]"; printf '\t\t\t'; echo "Update $(basename "$0") to the latest version: $VERSION"
	printf '\t'; echo -n "[-v | --version]"; printf '\t\t'; echo "Print $(basename "$0") version and exit"
	echo ""
	echo "EXAMPLES:"
	printf '\t'; echo "$(basename "$0") -s2 --ip=172.31.255.254 --bl=example1.com --wl=example2.com"
	printf '\t'; echo "$(basename "$0") -3Fqs -b example1.com -w example2.com --wl=example3.com"
	echo ""
	logger ">>> $(basename "$0") finished"
	exit 0
}

# update to the latest version
selfUpdate ()
{
	TMPFILE="${Tam}/mpupdate"

	lognecho ">>> Checking for updates."

	if ping -q -c 1 -W 1 google.com >/dev/null; then
		MPGETSSL ${upd}/$(basename "$0") > $TMPFILE

		if [ 0 -eq $? ]; then
			old_md5=`md5sum $0 | cut -d' ' -f1`
			new_md5=`md5sum $TMPFILE | cut -d' ' -f1`

			if [ "$old_md5" != "$new_md5" ]; then
				NEWVER=`grep -w -m 1 "VERSION" $TMPFILE`
				lognecho ">>> Update available: $NEWVER"
				OLDVER=`grep -w -m 1 "VERSION" $0 | cut -d \" -f2`
				cp $0 $0.$OLDVER
				chmod 755 $TMPFILE
				mv $TMPFILE $0
				lognecho ">>> Updated to the latest version."
			else
				lognecho ">>> No updates available. Current version: $VERSION."
			fi
		else
			lognecho ">>> Update failed. Try again."
		fi
		rm -f $TMPFILE
		rm -rf ${Tam}
	fi
	logger ">>> $(basename "$0") finished"
	exit 0
}

###############################################################################

# process command line arguments
while getopts "h?v0123fFdDpPqQrRsSoOuUb:w:i:-:" opt; do
	case ${opt} in
		h|\? ) printHelp ;;
		v    ) echo "Current version: $VERSION" ; logger ">>> $(basename "$0") finished" ; exit 0 ;;
		0    ) BLITZ=0 ;;
		1    ) BLITZ=1 ;;
		2    ) BLITZ=2 ;;
		3    ) BLITZ=3 ;;
		f    ) NOFB="f" ;;
		F    ) NOFB="F" ;;
		d|D  ) DISTRIB=1 ;;
		q|Q  ) QUIET=1 ;;
		p|P  ) protectOff ;;
		r|R  ) protectOn ;;
		s|S  ) SECURL=1 ;;
		o|O  ) ONLINE=0 ;;
		u|U  ) selfUpdate ;;
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
			9000    ) BLITZ=9000 ;;
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
			'' )    break ;; # "--" terminates argument processing
			* )     echo ">>> ERROR: unsupported option --$OPTARG" >&2; exit 2 ;;
		esac ;;
  	  \? ) exit 2 ;;  # getopts already reported the illegal option
	esac
done

shift $((OPTIND-1)) # remove parsed options and args from $@ list

###############################################################################

# display banner
TIMERSTART=`date +%s`
lognecho "======================================================"
lognecho "|                adbhostgen for DD-WRT               |"
lognecho "|      https://github.com/m-parashar/adbhostgen      |"
lognecho "|           Copyright 2018 Manish Parashar           |"
lognecho "======================================================"
lognecho "             `date`"
lognecho "# VERSION: $VERSION"

###############################################################################

# force resume if user forgets to turn it back on
if [ -f $pauseflag ] && { [ -f $mphostspaused ] || [ -f $mpdomainspaused ]; }; then
	lognecho "# USER FORGOT TO RESUME PROTECTION AFTER PAUSING"
	protectOn
fi

###############################################################################

# if internet is accessible, download files
if [ $ONLINE -eq 1 ] && ping -q -c 1 -W 1 google.com >/dev/null; then

	lognecho "# NETWORK: UP | MODE: ONLINE"
	lognecho "# IP ADDRESS FOR ADS: $SetIP"
	lognecho "# SECURE [0=NO | 1=YES]: $SECURL"
	lognecho "# BLITZ LEVEL [0|1|2|3]: $BLITZ"

	if [ ! -s cacert.pem ] || { [ "${DAYOFWEEK}" -eq 1 ] || [ "${DAYOFWEEK}" -eq 4 ]; }; then
		lognecho "> Downloading / updating cURL certificates"
		MPGETSSL --remote-name --time-cond cacert.pem https://curl.haxx.se/ca/cacert.pem
	fi

	lognecho "# Creating mpdomains file"
	lognecho "# Downloading ${u00}"
	MPGETSSL ${u00} | grep -o '^[^#]*' | grep -v "::" | grep -o '^[^<]*' | sed 's/0.0.0.0$/'$SetIP'/' > $tmpdomains
	lognecho "# Creating mphosts file"
	MPGETSSL ${u01} | grep -o '^[^#]*' | grep -v "::" | grep -o '^[^<]*' | awk '{gsub("address=/", "");print}' | awk '{gsub("/0.0.0.0", "");print}' | awk '{gsub("127.0.0.1", "");print}' > $tmphosts
	lognecho "# Downloading ${u02}"
	MPGETSSL ${u02} | grep -o '^[^#]*' | grep -v "::" | grep -o '^[^<]*' | awk '{gsub("address=/", "");print}' | awk '{gsub("/0.0.0.0", "");print}' | awk '{gsub("127.0.0.1", "");print}' >> $tmphosts
	lognecho "# Downloading ${u03}"
	MPGETSSL ${u03} | grep -o '^[^#]*' | grep -v "::" | grep -o '^[^<]*' | awk '{gsub("address=/", "");print}' | awk '{gsub("/0.0.0.0", "");print}' | awk '{gsub("127.0.0.1", "");print}' >> $tmphosts
	lognecho "# Downloading ${u04}"
	lognecho "> Processing StevenBlack lists"
	MPGETSSL ${u04} | grep -o '^[^#]*' | grep -o '^[^<]*' | awk '{print $2}' >> $tmphosts

	lognecho "> Processing notracking blocklists"
	lognecho "# Downloading ${u05}"
	MPGETSSL ${u05} | grep -o '^[^#]*' | grep -v "::" | grep -o '^[^<]*' | awk '{print $2}' >> $tmphosts

	lognecho "> Processing Disconnect.me lists"
	lognecho "# Downloading ${u06}"
	MPGETSSL ${u06} | grep -o '^[^#]*' >> $tmphosts
	lognecho "# Downloading ${u07}"
	MPGETSSL ${u07} | grep -o '^[^#]*' >> $tmphosts
	lognecho "# Downloading ${u08}"
	MPGETSSL ${u08} | grep -o '^[^#]*' >> $tmphosts
	lognecho "# Downloading ${u09}"
	MPGETSSL ${u09} | grep -o '^[^#]*' >> $tmphosts

	lognecho "> Processing quidsup/notrack lists"
	lognecho "# Downloading ${u10}"
	MPGETSSL ${u10} | grep -o '^[^<]*' | grep -o '^[^#]*' >> $tmphosts
	lognecho "# Downloading ${u11}"
	MPGETSSL ${u11} | grep -o '^[^<]*' | grep -o '^[^#]*' >> $tmphosts

	lognecho "> Processing MalwareDomains lists"
	lognecho "# Downloading ${u12}"
	MPGETSSL ${u12} | grep -o '^[^#]*' >> $tmphosts
	lognecho "# Downloading ${u3}"
	MPGETSSL ${u13} | grep -o '^[^#]*' >> $tmphosts

	lognecho "> Processing abuse.ch blocklists"
	lognecho "# Downloading ${u14}"
	MPGETSSL ${u14} | grep -o '^[^#]*' >> $tmphosts

	lognecho "> Processing Ransomware blocklists"
	lognecho "# Downloading ${u15}"
	MPGETSSL ${u15} | grep -o '^[^#]*' >> $tmphosts
	lognecho "# Downloading ${u16}"
	MPGETSSL ${u16} | grep -o '^[^#]*' >> $tmphosts
	lognecho "# Downloading ${u17}"
	MPGETSSL ${u17} | grep -o '^[^#]*' >> $tmphosts
	lognecho "# Downloading ${u18}"
	MPGETSSL ${u18} | grep -o '^[^#]*' >> $tmphosts

	lognecho "> Processing adaway list"
	lognecho "# Downloading ${u19}"
	MPGETSSL ${u19} | grep -o '^[^#]*' | grep -v "::" | awk '{print $2}' >> $tmphosts

	if [ $BLITZ -ge 1 ]; then
		lognecho "# Unlocking BLITZ=1 level lists"

		lognecho "> Processing more StevenBlack lists"
		lognecho "# Downloading ${u20}"
		MPGETSSL ${u20} | grep -o '^[^#]*' | grep -o '^[^<]*' | awk '{print $2}' >> $tmphosts
		lognecho "# Downloading ${u21}"
		MPGETSSL ${u21} | grep -o '^[^#]*' | grep -o '^[^<]*' | awk '{print $2}' >> $tmphosts
		lognecho "# Downloading ${u22}"
		MPGETSSL ${u22} | grep -o '^[^#]*' | grep -o '^[^<]*' | awk '{print $2}' >> $tmphosts
		lognecho "# Downloading ${u23}"
		MPGETSSL ${u23} | grep -o '^[^#]*' | grep -o '^[^<]*' | awk '{print $2}' >> $tmphosts

		lognecho "> Processing hosts-file ATS/EXP/GRM lists"
		lognecho "# Downloading ${u24}"
		MPGETSSL ${u24} | grep -o '^[^#]*' | grep -v "::" | awk '{print $2}' >> $tmphosts
		lognecho "# Downloading ${u25}"
		MPGETSSL ${u25} | grep -o '^[^#]*' | grep -v "::" | awk '{print $2}' >> $tmphosts
		lognecho "# Downloading ${u26}"
		MPGETSSL ${u26} | grep -o '^[^#]*' | grep -v "::" | awk '{print $2}' >> $tmphosts

		lognecho "> Processing hosts-file HJK/PUP lists"
		lognecho "# Downloading ${u27}"
		MPGETSSL ${u27} | grep -o '^[^#]*' | grep -v "::" | awk '{print $2}' >> $tmphosts
		lognecho "# Downloading ${u28}"
		MPGETSSL ${u28} | grep -o '^[^#]*' | grep -v "::" | awk '{print $2}' >> $tmphosts

		lognecho "> Processing dshield lists"
		lognecho "# Downloading ${u29}"
		MPGETSSL ${u29} | grep -o '^[^#]*' >> $tmphosts
		lognecho "# Downloading ${u30}"
		MPGETSSL ${u30} | grep -o '^[^#]*' >> $tmphosts
		lognecho "# Downloading ${u31}"
		MPGETSSL ${u31} | grep -o '^[^#]*' >> $tmphosts

		lognecho "> Processing pgl.yoyo.org list"
		lognecho "# Downloading ${u32}"
		MPGETSSL -d mimetype=plaintext -d hostformat=unixhosts ${u32} | grep -o '^[^#]*' | awk '{print $2}' >> $tmphosts

		lognecho "> Processing Securemecca list"
		lognecho "# Downloading ${u33}"
		MPGETSSL ${u33} | grep -o '^[^#]*' | awk '{print $2}' >> $tmphosts

		lognecho "> Processing cryptomining and porn lists"
		lognecho "# Downloading ${u34}"
		MPGETSSL ${u34} | grep -o '^[^<]*' | grep -o '^[^#]*' >> $tmphosts
		lognecho "# Downloading ${u35}"
		MPGETSSL ${u35} | grep -o '^[^#]*' | grep -o '^[^<]*' | awk '{print $2}' >> $tmphosts
		lognecho "# Downloading ${u36}"
		MPGETSSL ${u36} | grep -o '^[^#]*' | grep -o '^[^<]*' | awk '{print $2}' >> $tmphosts
		lognecho "# Downloading ${u37}"
		MPGETSSL ${u37} | grep -o '^[^<]*' | grep -o '^[^#]*' >> $tmphosts

		lognecho "> Processing Easylist & w3kbl lists"
		lognecho "# Downloading ${u38}"
		MPGETSSL ${u38} | grep -o '^[^#]*' >> $tmphosts
		lognecho "# Downloading ${u39}"
		MPGETSSL ${u39} | grep -o '^[^#]*' >> $tmphosts
		lognecho "# Downloading ${u40}"
		MPGETSSL ${u40} | grep -o '^[^#]*' >> $tmphosts
		lognecho "# Downloading ${u41}"
		MPGETSSL ${u41} | grep -o '^[^#]*' >> $tmphosts
		lognecho "# Downloading ${u42}"
		MPGETSSL ${u42} | grep -o '^[^#]*' >> $tmphosts
		lognecho "# Downloading ${u43}"
		MPGETSSL ${u43} | grep -o '^[^#]*' >> $tmphosts
		lognecho "# Downloading ${u44}"
		MPGETSSL ${u44} | grep -o '^[^#]*' >> $tmphosts
		lognecho "# Downloading ${u45}"
		MPGETSSL ${u45} | grep -o '^[^#]*' >> $tmphosts
		lognecho "# Downloading ${u6}"
		MPGETSSL ${u46} | grep -o '^[^#]*' >> $tmphosts
		lognecho "# Downloading ${u47}"
		MPGETSSL ${u47} | grep -o '^[^#]*' >> $tmphosts
		lognecho "# Downloading ${u48}"
		MPGETSSL ${u48} | grep -o '^[^#]*' >> $tmphosts
	fi

	if [ $BLITZ -ge 2 ]; then
		lognecho "# Unlocking BLITZ=2 level lists"

		lognecho "> Processing even more StevenBlack lists"
		lognecho "# Downloading ${u49}"
		MPGETSSL ${u49} | grep -o '^[^#]*' | grep -o '^[^<]*' | awk '{print $2}' >> $tmphosts
		lognecho "# Downloading ${u50}"
		MPGETSSL ${u50} | grep -o '^[^#]*' | grep -o '^[^<]*' | awk '{print $2}' >> $tmphosts
		lognecho "# Downloading ${u51}"
		MPGETSSL ${u51} | grep -o '^[^#]*' | grep -o '^[^<]*' | awk '{print $2}' >> $tmphosts

		lognecho "> Processing hosts-file EMD/FSA lists"
		lognecho "# Downloading ${u52}"
		MPGETSSL ${u52} | grep -o '^[^#]*' | grep -v "::" | awk '{print $2}' >> $tmphosts
		lognecho "# Downloading ${u53}"
		MPGETSSL ${u53} | grep -o '^[^#]*' | grep -v "::" | awk '{print $2}' >> $tmphosts

		lognecho "> Processing hosts-file MMT/PHA lists"
		lognecho "# Downloading ${u54}"
		MPGETSSL ${u54} | grep -o '^[^#]*' | grep -v "::" | awk '{print $2}' >> $tmphosts
		lognecho "# Downloading ${u55}"
		MPGETSSL ${u55} | grep -o '^[^#]*' | grep -v "::" | awk '{print $2}' >> $tmphosts

		lognecho "> Processing Cameleon list"
		lognecho "# Downloading ${u56}"
		MPGET ${u56} | grep -o '^[^#]*' | awk '{print $2}' >> $tmphosts

		lognecho "> Processing winhelp2002 list"
		lognecho "# Downloading ${u57}"
		MPGET ${u57} | grep -o '^[^#]*' | grep -v "::" | awk '{print $2}' >> $tmphosts

		lognecho "> Processing someonewhocares list"
		lognecho "# Downloading ${u58}"
		MPGET ${u58} | grep -o '^[^#]*' | awk '{print $2}' >> $tmphosts

		lognecho "> Processing anudeepND lists"
		lognecho "# Downloading ${u59}"
		MPGETSSL ${u59} | grep -o '^[^#]*' | grep -o '^[^<]*' | awk '{print $2}' >> $tmphosts
		lognecho "# Downloading ${u60}"
		MPGETSSL ${u60} | grep -o '^[^#]*' | grep -o '^[^<]*' | awk '{print $2}' >> $tmphosts
		lognecho "# Downloading ${u61}"
		MPGETSSL ${u61} | grep -o '^[^<]*' | grep -o '^[^#]*' >> $tmphosts

		lognecho "> Processing CHEF-KOCH lists"
		lognecho "# Downloading ${u62}"
		MPGETSSL ${u62} | grep -o '^[^#]*' | grep -o '^[^<]*' | awk '{print $2}' >> $tmphosts
		lognecho "# Downloading ${u63}"
		MPGETSSL ${u63} | grep -o '^[^#]*' | grep -o '^[^<]*' | awk '{print $2}' >> $tmphosts
		lognecho "# Downloading ${u64}"
		MPGETSSL ${u64} | grep -o '^[^#]*' | grep -o '^[^<]*' | awk '{print $2}' >> $tmphosts
		lognecho "# Downloading ${u65}"
		MPGETSSL ${u65} | grep -o '^[^#]*' | grep -o '^[^<]*' | awk '{print $2}' >> $tmphosts
		lognecho "# Downloading ${u66}"
		MPGETSSL ${u66} | grep -o '^[^#]*' | grep -o '^[^<]*' | awk '{print $2}' >> $tmphosts

		lognecho "> Processing joewein.de LLC list"
		lognecho "# Downloading ${u67}"
		MPGETSSL ${u67} | grep -o '^[^#]*' >> $tmphosts

		lognecho "> Processing Windows telemetry lists"
		lognecho "# Downloading ${u68}"
		MPGETSSL ${u68} | grep -o '^[^#]*' | grep -o '^[^<]*' | awk '{print $2}' >> $tmphosts
		lognecho "# Downloading ${u69}"
		MPGETSSL ${u69} | grep -o '^[^#]*' | grep -o '^[^<]*' | awk '{print $2}' >> $tmphosts

		lognecho "> Processing smart TV blocklists"
		lognecho "# Downloading ${u70}"
		MPGETSSL ${u70} | grep -o '^[^#]*' >> $tmphosts
		lognecho "# Downloading ${u71}"
		MPGETSSL ${u71} | grep -o '^[^<]*' | grep -o '^[^#]*' >> $tmphosts

		lognecho "> Processing a few more blocklists"
		lognecho "# Downloading ${u72}"
		MPGETSSL ${u72} | grep -o '^[^<]*' | grep -o '^[^#]*' | awk '{print $2}' >> $tmphosts
		lognecho "# Downloading ${u73}"
		MPGETSSL ${u73} | grep -o '^[^<]*' | grep -o '^[^#]*' | grep -v "::" | awk '{print $2}' >> $tmphosts
		lognecho "# Downloading ${u74}"
		MPGETSSL ${u74} | grep -o '^[^<]*' | grep -o '^[^#]*' >> $tmphosts
		lognecho "# Downloading ${u75}"
		MPGETSSL ${u75} | grep -o '^[^<]*' | grep -o '^[^#]*' | awk '{print $2}' >> $tmphosts
		lognecho "# Downloading ${u76}"
		MPGETSSL ${u76} | grep -o '^[^<]*' | grep -o '^[^#]*' >> $tmphosts
		lognecho "# Downloading ${u77}"
		MPGETSSL ${u77} | grep -o '^[^<]*' | grep -o '^[^#]*' >> $tmphosts
	fi

	if [ $BLITZ -ge 3 ]; then
		lognecho "# Unlocking BLITZ=3 level lists"

		lognecho "> Processing hosts-file PSH/PUP/WRZ lists"
		lognecho "# Downloading ${u78}"
		MPGETSSL ${u78} | grep -o '^[^#]*' | grep -v "::" | awk '{print $2}' >> $tmphosts
		lognecho "# Downloading ${u79}"
		MPGETSSL ${u79} | grep -o '^[^#]*' | grep -v "::" | awk '{print $2}' >> $tmphosts

		lognecho "> Processing Mahakala list"
		lognecho "# Downloading ${u80}"
		MPGETMHK ${u80} | grep -o '^[^#]*' | awk '{print $2}' >> $tmphosts

		lognecho "> Processing HostsFile.mine.nu list"
		lognecho "# Downloading ${u81}"
		MPGETSSL ${u81} | grep -o '^[^#]*' | awk '{print $2}' >> $tmphosts

		lognecho "> Processing Kowabit list"
		lognecho "# Downloading ${u82}"
		MPGETSSL ${u82} | grep -o '^[^#]*' >> $tmphosts

		lognecho "> Processing ADZHOSTS list"
		lognecho "# Downloading ${u83}"
		MPGETSSL ${u83} | grep -o '^[^#]*' | grep -v "::" | awk '{print $2}' >> $tmphosts
	fi

	if [ $BLITZ -eq 9000 ]; then
		lognecho ">>> WHY, YOU ABSOLUTE MADMAN!"
		lognecho ">>> JOG ON NOW. THIS WILL TAKE SOME TIME."
		lognecho "# Unlocking BLITZ=9000 level lists"

		lognecho "> Processing supermassive porn blocklist"
		lognecho "# Downloading ${u84}"
		MPGETSSL ${u84} | grep -o '^[^<]*' >> $tmphosts
	fi

	if [ $NOFB = "f" ]; then
		lognecho "> Blocking Facebook and Messenger"
		lognecho "# Downloading ${u85}"
		MPGETSSL ${u85} | grep -o '^[^<]*' >> $tmphosts
	fi

	if [ $NOFB = "F" ]; then
		lognecho "> Blocking Facebook, Messenger, Instagram, WhatsApp"
		lognecho "# Downloading ${u86}"
		MPGETSSL ${u86} | grep -o '^[^<]*' >> $tmphosts
	fi

	lognecho "> Updating official blacklist/whitelist files"
	lognecho "# Downloading ${u87}"
	MPGETSSL ${u87} | grep -o '^[^<]*' | grep -o '^[^#]*' > $blacklist
	lognecho "# Downloading ${u88}"
	MPGETSSL ${u88} | grep -o '^[^<]*' | grep -o '^[^#]*' > $whitelist
	lognecho "# Downloading ${u89}"
	MPGETSSL ${u89} | grep -o '^[^<]*' > $base64wl
	lognecho "# Downloading ${u90}"
	MPGETSSL ${u90} | grep -o '^[^<]*' | grep -o '^[^#]*' | grep -v "::" | awk '{print $2}' >> $tmphosts		
	lognecho "# Downloading ${u91}"
	MPGETSSL ${u91} | grep -o '^[^#]*' | grep -o '^[^<]*' | awk '{print $2}' >> $tmphosts
		
	LC_ALL=C uudecode $base64wl && cat applewhitelist >> $whitelist && rm applewhitelist && rm $base64wl

else
	lognecho "# NETWORK: DOWN | MODE: OFFLINE"
	# just in case connectivity is down for the moment
	# process the blacklists and whitelists anyway
	[ -s $mphosts ] && cat $mphosts | awk '{print $2}' > $tmphosts
	[ -s $mpdomains ] && cp $mpdomains $tmpdomains
fi

###############################################################################

# calculate and print file sizes
printFileSize $tmphosts
printFileSize $tmpdomains

# remove duplicates and extra whitespace, sort alphabetically
lognecho "> Processing blacklist/whitelist files"
LC_ALL=C cat $blacklist | sed -r 's/^[[:blank:]]*//; s/[[:blank:]]*$//; /^$/d; /^\s*$/d' | sort -u > tmpbl && cp tmpbl $blacklist
LC_ALL=C cat $whitelist | sed -r 's/^[[:blank:]]*//; s/[[:blank:]]*$//; /^$/d; /^\s*$/d' | sort -u > tmpwl && cp tmpwl $whitelist

# if not building for distribution, process myblacklist and mywhitelist files
# remove duplicates and extra whitespace, sort alphabetically
# and allow users' myblacklist precedence over defaults
if [ $DISTRIB -eq 0 ] && { [ -s "$myblacklist" ] || [ -s "$mywhitelist" ]; }; then
	lognecho "> Processing myblacklist/mywhitelist files"
	LC_ALL=C cat $myblacklist | sed -r 's/^[[:blank:]]*//; s/[[:blank:]]*$//; /^$/d; /^\s*$/d' | sort -u > tmpmybl && mv tmpmybl $myblacklist
	LC_ALL=C cat $mywhitelist | sed -r 's/^[[:blank:]]*//; s/[[:blank:]]*$//; /^$/d; /^\s*$/d' | sort -u > tmpmywl && mv tmpmywl $mywhitelist
	cat $blacklist | cat $myblacklist - > tmpbl
	cat $whitelist | cat $mywhitelist - | grep -Fvwf $myblacklist > tmpwl
fi

# trim leading and trailig whitespace, delete all blank lines including the ones with whitespace
# remove non-printable non-ASCII characters because DD-WRT dnsmasq throws "bad name at line n" errors
# merge blacklists with other lists and remove whitelist entries from the stream
lognecho "> Processing final mphosts/mpdomains files"
LC_ALL=C cat $tmphosts | sed -r 's/^[[:blank:]]*//; s/[[:blank:]]*$//; /^$/d; /^\s*$/d' | tr -cd '\000-\177' | cat tmpbl - | grep -Fvwf tmpwl | sort -u | awk -v "IP=$SetIP" '{sub(/\r$/,""); print IP" "$0}' > $mphosts
LC_ALL=C cat $tmpdomains | sed -r 's/^[[:blank:]]*//; s/[[:blank:]]*$//; /^$/d; /^\s*$/d' | tr -cd '\000-\177' | grep -Fvwf tmpwl | sort -u > $mpdomains

lognecho "> Removing temporary files"
rm -f $tmphosts
rm -f $tmpdomains
rm -f tmpbl
rm -f tmpwl
rm -rf ${Tam}

# calculate and print file sizes
printFileSize $mphosts
printFileSize $mpdomains

# Count how many domains/whitelists were added so it can be displayed to the user
numberOfAdsBlocked=$(cat $mphosts | wc -l | sed 's/^[ \t]*//')
lognecho "# Number of ad domains blocked: approx $numberOfAdsBlocked"

lognecho "> Restarting DNS server (dnsmasq)"
restart_dnsmasq

TIMERSTOP=`date +%s`
RTMINUTES=$(( $((TIMERSTOP - TIMERSTART)) /60 ))
RTSECONDS=$(( $((TIMERSTOP - TIMERSTART)) %60 ))
lognecho "# Total time: $RTMINUTES:$RTSECONDS minutes"
lognecho "# DONE"
logger ">>> $(basename "$0") finished"
exit 0
# FIN

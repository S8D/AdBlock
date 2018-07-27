TMuc="$(cd "$(dirname "${0}")" && pwd)"
TMTam="${TMuc}/dl"
if [ -d "$TMTam" ]
then
	echo "Using $TMTam"
else
	echo "Creating: $TMTam"
	mkdir ${TMTam}
fi
process="http://gg.gg/p_"
pc="${TMuc}/p.sh"
tai="${TMTam}/h.txt"
tam="${TMTam}/h.tmp"
tbl="${TMTam}/bl.txt"
tfb="${TMTam}/fb.txt"
fbo="${TMTam}/fbo.txt"
tal="${TMTam}/ap.txt"
twl="${TMTam}/wl.txt"
Size ()
{
	echo "# Size of $1: `du -h $1 | awk '{print $1}'`"
}
alias GetSSL="curl -f -s -k -L"
alias GetMHK="curl -f -s -A "Mozilla/5.0" -e http://forum.xda-developers.com/"
GetSSL -d mimetype=plaintext -d hostformat=dnsmasq https://pgl.yoyo.org/adservers/serverlist.php? > $tam;Size $tam;cat $tam > $tai
GetMHK http://adblock.mahakala.is/hosts > $tam;Size $tam;cat $tam >> $tai
GetSSL http://someonewhocares.org/hosts/zero/hosts > $tam;Size $tam;cat $tam >> $tai
GetSSL http://sysctl.org/cameleon/hosts > $tam;Size $tam;cat $tam >> $tai
GetSSL http://winhelp2002.mvps.org/hosts.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://adaway.org/hosts.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://adzhosts.hizo.fr/hosts/adzhosts-android.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://hosts-file.net/ad_servers.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://hosts-file.net/emd.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://hosts-file.net/exp.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://hosts-file.net/fsa.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://hosts-file.net/grm.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://hosts-file.net/hjk.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://hosts-file.net/mmt.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://hosts-file.net/pha.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://hosts-file.net/psh.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://hosts-file.net/pup.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://hosts-file.net/wrz.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://hostsfile.mine.nu/hosts0.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://hostsfile.org/Downloads/hosts.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://mirror1.malwaredomains.com/files/immortal_domains.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://mirror1.malwaredomains.com/files/justdomains > $tam;Size $tam;cat $tam >> $tai
GetSSL https://ransomwaretracker.abuse.ch/downloads/CW_C2_DOMBL.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://ransomwaretracker.abuse.ch/downloads/LY_C2_DOMBL.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://ransomwaretracker.abuse.ch/downloads/RW_DOMBL.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://ransomwaretracker.abuse.ch/downloads/TC_C2_DOMBL.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://raw.githubusercontent.com/anudeepND/blacklist/master/adservers.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://raw.githubusercontent.com/anudeepND/blacklist/master/CoinMiner.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://raw.githubusercontent.com/anudeepND/youtubeadsblacklist/master/domainlist.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://raw.githubusercontent.com/chadmayfield/my-pihole-blocklists/master/lists/pi_blocklist_porn_top1m.list > $tam;Size $tam;cat $tam >> $tai
GetSSL https://raw.githubusercontent.com/CHEF-KOCH/Audio-fingerprint-pages/master/AudioFp.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://raw.githubusercontent.com/CHEF-KOCH/Canvas-fingerprinting-pages/master/Canvas.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://raw.githubusercontent.com/CHEF-KOCH/Canvas-Font-Fingerprinting-pages/master/Canvas.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://raw.githubusercontent.com/CHEF-KOCH/Spotify-Ad-free/master/Spotifynulled.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://raw.githubusercontent.com/CHEF-KOCH/WebRTC-tracking/master/WebRTC.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/hosts/spy.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://raw.githubusercontent.com/HenningVanRaumle/pihole-ytadblock/master/ytadblock.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://raw.githubusercontent.com/hoshsadiq/adblock-nocoin-list/master/hosts.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://raw.githubusercontent.com/Marfjeh/coinhive-block/master/domains > $tam;Size $tam;cat $tam >> $tai
GetSSL https://raw.githubusercontent.com/matomo-org/referrer-spam-blacklist/master/spammers.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://raw.githubusercontent.com/mitchellkrogza/Badd-Boyz-Hosts/master/hosts > $tam;Size $tam;cat $tam >> $tai
GetSSL https://raw.githubusercontent.com/notracking/hosts-blocklists/master/domains.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://raw.githubusercontent.com/notracking/hosts-blocklists/master/hostnames.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://raw.githubusercontent.com/oznu/dns-zone-blacklist/master/dnsmasq/dnsmasq.blacklist > $tam;Size $tam;cat $tam >> $tai
GetSSL https://raw.githubusercontent.com/Perflyst/PiHoleBlocklist/master/android-tracking.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://raw.githubusercontent.com/Perflyst/PiHoleBlocklist/master/SmartTV.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://raw.githubusercontent.com/piwik/referrer-spam-blacklist/master/spammers.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://raw.githubusercontent.com/quidsup/notrack/master/malicious-sites.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://raw.githubusercontent.com/quidsup/notrack/master/trackers.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn/hosts > $tam;Size $tam;cat $tam >> $tai
GetSSL https://raw.githubusercontent.com/StevenBlack/hosts/master/data/add.2o7Net/hosts > $tam;Size $tam;cat $tam >> $tai
GetSSL https://raw.githubusercontent.com/StevenBlack/hosts/master/data/add.Risk/hosts > $tam;Size $tam;cat $tam >> $tai
GetSSL https://raw.githubusercontent.com/StevenBlack/hosts/master/data/add.Spam/hosts > $tam;Size $tam;cat $tam >> $tai
GetSSL https://raw.githubusercontent.com/StevenBlack/hosts/master/data/KADhosts/hosts > $tam;Size $tam;cat $tam >> $tai
GetSSL https://raw.githubusercontent.com/StevenBlack/hosts/master/data/UncheckyAds/hosts > $tam;Size $tam;cat $tam >> $tai
GetSSL https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts > $tam;Size $tam;cat $tam >> $tai
GetSSL https://raw.githubusercontent.com/tyzbit/hosts/master/data/tyzbit/hosts > $tam;Size $tam;cat $tam >> $tai
GetSSL https://raw.githubusercontent.com/vokins/yhosts/master/hosts > $tam;Size $tam;cat $tam >> $tai
GetSSL https://raw.githubusercontent.com/ZeroDot1/CoinBlockerLists/master/hosts > $tam;Size $tam;cat $tam >> $tai
GetSSL https://s3.amazonaws.com/lists.disconnect.me/simple_ad.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://s3.amazonaws.com/lists.disconnect.me/simple_malvertising.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://s3.amazonaws.com/lists.disconnect.me/simple_malware.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://s3.amazonaws.com/lists.disconnect.me/simple_tracking.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://v.firebog.net/hosts/AdguardDNS.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://v.firebog.net/hosts/Airelle-hrsk.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://v.firebog.net/hosts/Airelle-trc.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://v.firebog.net/hosts/BillStearns.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://v.firebog.net/hosts/Easylist.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://v.firebog.net/hosts/Easyprivacy.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://v.firebog.net/hosts/Kowabit.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://v.firebog.net/hosts/Prigent-Ads.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://v.firebog.net/hosts/Prigent-Malware.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://v.firebog.net/hosts/Prigent-Phishing.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://v.firebog.net/hosts/Shalla-mal.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://v.firebog.net/hosts/static/SamsungSmart.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://v.firebog.net/hosts/static/w3kbl.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://www.dshield.org/feeds/suspiciousdomains_High.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://www.dshield.org/feeds/suspiciousdomains_Low.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://www.dshield.org/feeds/suspiciousdomains_Medium.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://www.joewein.net/dl/bl/dom-bl-base.txt > $tam;Size $tam;cat $tam >> $tai
GetSSL https://zeustracker.abuse.ch/blocklist.php?download=domainblocklist > $tam;Size $tam;cat $tam >> $tai
GetSSL https://raw.githubusercontent.com/m-parashar/adbhostgen/master/blacklists/blacklist > $tam;Size $tam;cat $tam > $tbl
GetSSL https://raw.githubusercontent.com/m-parashar/adbhostgen/master/blacklists/facebookall.block > $tam;Size $tam;cat $tam > $tfb
GetSSL https://raw.githubusercontent.com/m-parashar/adbhostgen/master/blacklists/facebookonly.block > $tam;Size $tam;cat $tam > $fbo
GetSSL https://raw.githubusercontent.com/m-parashar/adbhostgen/master/whitelists/fruitydomains > $tam;Size $tam;cat $tam > $tal
GetSSL https://raw.githubusercontent.com/m-parashar/adbhostgen/master/whitelists/whitelist > $tam;Size $tam;cat $tam > $twl
GetSSL ${process} > $tam;Size $tam;cat $tam > $pc; echo "Run Process" ; sh $pc;
echo "> Deleting: $TMTam";rm -rf ${TMTam};
exit 0
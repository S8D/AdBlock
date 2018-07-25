#!/bin/sh
VERSION="20180725c"
export SetIP="0.1.2.3";export Level=4;
Nha="https://raw.githubusercontent.com/S8D/AdBlock/master"
HomePage="https://github.com/S8D/AdBlock"
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
#u80="http://gg.gg/u80_";
DenTrang="s/^[[:blank:]]*//; s/[[:blank:]]*$//; /^$/d; /^\s*$/d";
SubDM="\~|000webhostapp\.com$|000webhostaww\.com$|0catch\.com$|0x1f4b0\.com$|126\.net$|207\.net$|2o7\.net$|302br\.net$|360\.cn$|3g\.cn$|51yes\.com$|69server\.net$|6\.cn$|7us\.us$|ac\.cn$|actonsoftware\.com$|adaos\-ads\.net$|adap\.tv$|adbureau\.net$|adclear\.net$|adhese\.com$|adjlggler\.net$|adkmob\.com$|admob\.com$|adnxs\.com$|adotmob\.com$|adprotect\.net$|adpush\.cn$|adscience\.nl$|adsrvr\.org$|advertising\.com$|aeta.*lim\.net$|ahdoonetfisher\.net$|aitilklykk\.net$|aiziezq6\.net$|alimabi\.cn$|alimama\.cn$|allyes\.com$|alphonso\.tv$|alpol\.com$|altpool\.pro$|am15\.net$|amazon\-adsystem\.com$|analysys\.cn$|anbtr\.com$|angelfire\.com$|aobohalbirex\.net$|aplus\.net$|appier\.net$|atspace\.us$|autoimg\.cn$|aviasales\.ru$|awwier\.net$|baidu\.com$|baixeinfiltrato\.net$|beeplog\.de$|bestdeals\.at$|bizland\.com$|blog\.com$|blogswot\..*$|blueadvertise\.com$|blysellads\.com$|bpa\.nu$|bt\.net$|btcchina\.com$|btttag\.com$|bubblesmedia\.ru$|byinter\.net$|cablelink\.ro$|caiy.*ews\.net$|canalblog\.com$|carrieriq\.com$|casee\.cn$|cdi\.no$|ce.*d\-t.*ar\.com$|cedexis\.net$|centade\.com$|centerblog\.net$|chartbeat\.net$|charter\.com$|chat\.rl$|chez\.com$|chiej.*ls\.net$|china\.cn$|chinaenter\.cn$|cjb\.net$|cjt1\.net$|clan\.su$|clickability\.com$|clickbank\.net$|clicksmob\.com$|cloldfront\.net$|co\.at$|co\.cc$|co\.lk$|co\.tv$|co\.zw$|codns\.com$|coin\-have\.com$|coinblockers\.com$|com1\.ru$|com\-oo4\.net$|com\.al$|com\.br$|com\.cn$|comcast\.net$|comlu\.com$|comoj\.com$|company\-target\.com$|connextra\.com$|consensu\.org$|crashlytics\.com$|creablog\.com$|creativemedia\.buzz$|criteo\.(com|net)$|cryptaloot\.pro$|cz\.cc$|da\.ru$|ddns\.net$|de\.sr$|de\.vu$|deluxepass\.com$|demdex\.net$|demos\.su$|designmysite\.pro$|diaryland\.com$|digitalinsight\.com$|dolbleclick\.net$|domob\.cn$|doubleclick\.com$|doubleclick\.net$|dtiblog\.com$|dy4\.de$|e.*e\-of\-g.*er\.net$|e\-city\.tv$|easy4blog\.com$|ebaf.*idin\.com$|ebayrtm\.com$|ed10\.net$|edu\.cn$|eigenpage\.nl$|eiyo.*ows\.net$|eloqua\.com$|ensighten\.com$|envy\.nu$|eoc.*orks\.net$|erasercash\.com$|ero\-advertising\.com$|f3322\.net$|fastclick\.net$|fastestshopa\.su$|fasthost\.tv$|fateback\.com$|favorietje\.nl$|fgpp\.com$|films\-internet\.info$|firstfind\.nl$|firstlight\.cn$|fj\.cn$|flu\.cc$|for\-our\.info$|fora\.pl$|forum2x2\.ru$|forumtoolbar\.com$|free\.fr$|freehosting\.cc$|freesitesnetwork\.com$|frem\.com$|fwmrm\.net$|fx\.to$|gb\.net$|gerelateerd\.nl$|getrestinfom\.su$|getrestinfon\.su$|go2affise\.com$|googlesyndication\.com$|gotech\.tk$|gov\.cn$|grandenetworks\.net$|hashvault\.pro$|hatenablog\.com$|herokuapp\.com$|hi\.cn$|hienebakster\.net$|hitbox\.com$|hol\.es$|home\.ne\.jp$|hotjar\.com$|hotlinkimage\.com$|hotpaginas\.com$|httpool\.com$|huanqiu\.com$|hunantv\.com$|hut1\.ru$|hyperphp\.com$|hywerbanner\.net$|i2idata\.com$|i2iserv\.com$|i3log\.com$|i\-gloo\.net$|i\-lookup\.com$|ibelgique\.com$|iblogs\.com$|ibnsites\.com$|ibohpjavme\.com$|icast\.cn$|idv\.tw$|iedoobuzzlike\.com$|iegh.*rror\.com$|iehohicv2\.net$|iembarazadas\.com$|iequutravel4u\.com$|ieyipluckyscent\.com$|ifeng\.com$|ifengimg\.com$|ifrance\.com$|igexin\.com$|ign\.com$|ignorelist\.com$|igodigital\.com$|ihielatelevisao\.com$|iiniamoca\-news\.com$|ijijiji\.com$|ijinshan\.com$|iknowthatgirl\.com$|ikwilhet\.nu$|impact\-ad\.jp$|imrworldwide\.com$|indieclick\.com$|indymedia\.org$|infoweb\.ne\.jp$|inq\.com$|insightfirst\.com$|installantivirus\.us$|isgre\.at$|ixa.*sts\.net$|jl\.cn$|jpush\.cn$|jtle0\.cn$|kla.*and\.nl$|klan.*land\.com$|krovatka\.su$|l\-telcom\.net$|lab.*ining\.com$|land\.ru$|level3\.net$|linkexchange\.nl$|linkgoed\.nl$|linkhotel\.nl$|linkpulse\.com$|liuliangbao\.cn$|liveadvert\.com$|lmbler\.net$|localytics\.com$|loizuseolita\.com$|lookingat\.us$|lookseekpages\.com$|looksmart\.com$|loomia\.com$|looq.*ciety\.com$|loyaltytoolbar\.com$|lphbs\.com$|lsercash\.com$|ltdomains\.com$|lycos\.com$|mabulle\.com$|madvertise\.com$|maxthon\.cn$|mchsi\.com$|media\-toolbar\.com$|mediaonenetwork\.net$|meegmfio\.in$|mesh\.ad\.jp$|microad\.jp$|minemonero\.pro$|minerhills\.com$|minertopia\.org$|miningpoolhub\.com$|minisplat\.cn$|mirtesen\.rl$|mktoresp\.com$|moad\.cn$|mob\.com$|mobileapptracking\.com$|mobilecore\.com$|mobiletheory\.com$|mobpartner\.com$|mocean\.mobi$|mojeforlm\.net$|monerise\.com$|musicfrost\.com$|my.*toolbar\.com$|my\-place\.us$|mybjjblog\.com$|mydas\.mobi$|myhomescreen\.tv$|myjino\.ru$|mylivepage\.ru$|mylivewage\.rl$|myway\.com$|n3\.net$|nanopool\.org$|narod2\.ru$|narod\.ru$|nat.*orks\.ru$|nedstat\.net$|neliver\.com$|net16\.net$|net23\.net$|net46\.net$|net63\.net$|net76\.net$|net78\.net$|net84\.net$|net\.cn$|netpass\.tv$|netshelter\.net$|nnarod\.ru$|nu.*e\-cr.*t\.net$|nut\.cc$|nx\.cn$|oasuagoals\.net$|oboh.*avi\.net$|oewabox\.at$|ohx.*all\.net$|onion\.to$|online\-metrix\.net$|onlinepricex\.su$|ono\.com$|ontheweb\.nl$|ooroptiobeto\.net$|oowaividaddict\.net$|openxenterprise\.com$|org\.cn$|ourtoolbar\.com$|owentracker\.net$|pacbell\.net$|pagina\.nu$|peiw.*es\.com$|pinba.*twork\.com$|plp7\.ru$|plugrush\.com$|pma\-network\.com$|pointroll\.com$|polarmobile\.com$|poloniex\.com$|polyad\.net$|polybuild\.ru$|popads\.net$|pornhub\.com$|publicus\.com$|puserving\.com$|qq\.com$|qualtrics\.com$|queroumforum\.com$|raeniretweet\.net$|reporo\.net$|rfihub\.com$|rr\.com$|rr\.nu$|rubiconproject\.com$|s.*e\-dir.*y\.net$|sbcglobal\.net$|scorecardresearch\.com$|searchmiracle\.com$|searchwho\.com$|sec.*ctrade\.ru$|seclrenet\-server\.net$|seclreserver\.net$|secureintl\.com$|ser.*rike\.com$|serving\-sys\.com$|sextracker\.de$|shaeyffh6\.net$|sharezips\.net$|shoofle\.tv$|shuzilm\.cn$|si.*fe\-hi.*ce\.gq$|sina\.cn$|sinaimg\.cn$|site40\.net$|site50\.net$|site88\.net$|site90\.com$|site90\.net$|skyrock\.com$|smaato\.net$|smartnaturalshop\.su$|smi2\.net$|smi2\.ru$|soarfi\.cn$|solocwm\.com$|solt.*ale\.com$|soothxopso\.net$|spacevilla\.net$|sponsormob\.com$|spylog\.com$|spywarestrike\.com$|startclub\.nl$|startmee\.nl$|startspot\.nl$|startswot\.nl$|startvista\.nl$|startvriend\.nl$|student\-24\.ru$|subito\.cc$|suprnova\.cc$|switchadhub\.com$|syndicaster\.tv$|szm\.com$|t\-online\.hl$|taboola\.com$|tahc.*eks\.net$|taiwabonlswinner\.net$|teads\.tv$|tealilmiq\.com$|telekom\.hu$|telering\.at$|terrashare\.com$|theglobeandmail\.com$|thetrafficstat\.net$|thohjkuvat\.net$|tianya\.cn$|tie\.cl$|tlmblr\.com$|tmall\.com$|tmfweb\.nl$|tomshardware\.com$|top100\.org$|toprealsalen\.su$|tpnet\.pl$|tr.*ut\-t.*e\.org$|trademob\.com$|tsx\.org$|tvgoods\.ru$|twnet\.wl$|uc\.cn$|ucoz\.ru$|ufanet\.ru$|uni5\.net$|uni\.cc$|usite\.pro$|valleclick\.com$|valleclick\.net$|vectranet\.pl$|vertamedia\.com$|veruta\.com$|vi\.net$|videoplaza\.tv$|vidible\.tv$|vidzi\.tv$|voiceads\.cn$|voicecloud\.cn$|voluumtrk2\.com$|voluumtrk3\.com$|voluumtrk\.com$|vsn\.nu$|w8w\.pl$|waligrucha\.pl$|warszawa\.pl$|waw\.pl$|wbwhgwbr\.in$|web\.tr$|webgidsje\.nl$|webjump\.com$|webservis\.ru$|website\.pl$|webtradeplus\.su$|webtrekk\.net$|webwise\.com$|wechat\.com$|weebly\.com$|weibo\.cn$|weibo\.com$|wirtualnie\.pl$|wlblicvm\.com$|work5\.ru$|wostore\.cn$|wow\-hosting\.com$|woxaeoboads\.com$|woyo8g\.com$|wps\.cn$|wrating\.com$|wtcsites\.com$|wxv\.pl$|x10host\.com$|x10hosting\.com$|x2z\.com$|xae.*is\.com$|xanga\.com$|xbloggers\.com$|xblogspot\.com$|xg4ken\.com$|xhamster\.com$|xiaocen\.com$|xiaomi\.com$|xiti\.com$|xj\.cn$|xlogz\.com$|xmatch\.com$|xmiler\.com$|xooit\.com$|xrus\.org$|xxxfaster\.net$|xz\.cn$|yamanoha\.com$|yesadvertising\.com$|yi\.org$|yieldmanager\.net$|yoyohost\.com$|zac.*ella\.net$|zapto\.org$|zeblog\.com$|zinoiosijek031\.net$|zj\.cn$|zrus\.org$|zz\.mu$";
#__________________________________________________________________________________________________
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
	echo "Creating: $Tam"
	mkdir ${Tam}
fi
export hChinh="${TMuc}/h"
export hDung="${TMuc}/h.zzz"
export hTam="${Tam}/h.tmp"
export Tamh="${Tam}/ht.tmp"
export Tamt="${Tam}/tt.tmp"
export Tambl="${Tam}/bl.tmp"
export Tamwl="${Tam}/wl.tmp"
export dChinh="${TMuc}/d"
export dDung="${TMuc}/d.zzz"
export dTam="${Tam}/d.tmp"
export Tamd="${Tam}/dt.tmp"
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
alias GetSLL="curl -f -s -k -L"
[ $SECURL -eq 1 ] && unalias GetSLL && alias GetSLL="curl -f -s --capath ${TMuc} --cacert $CURL_CA_BUNDLE"
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
	printf '\t'; echo -n "[-0]"; printf '\t\t\t\t'; echo "Level [0: safe minimum protection"
	printf '\t'; echo -n "[-1]"; printf '\t\t\t\t'; echo "Level [1: increased protection"
	printf '\t'; echo -n "[-2]"; printf '\t\t\t\t'; echo "Level [2: optimum protection"
	printf '\t'; echo -n "[-3]"; printf '\t\t\t\t'; echo "Level [3: unlock maximum protection"
	printf '\t'; echo -n "[-4]"; printf '\t\t\t\t'; echo "Level [4: unlock Ultra protection [DEFAULT]"
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
	fTam="${Tam}/update"
	InRa ">>> Checking for updates..."
	if ping -q -c 1 -W 1 google.com >/dev/null; then
		GetSLL ${Nha}/$(basename "$0") > $fTam
		if [ 0 -eq $? ]; then
			old_md5=`md5sum $0 | cut -d' ' -f1`
			new_md5=`md5sum $fTam | cut -d' ' -f1`
			if [ "$old_md5" != "$new_md5" ]; then
				NEWVER=`grep -w -m 1 "VERSION" $fTam`
				InRa ">>> Update available: $NEWVER"
				OLDVER=`grep -w -m 1 "VERSION" $0 | cut -d \" -f2`
				cp $0 $0.$OLDVER
				chmod 755 $fTam
				mv $fTam $0
				InRa ">>> Updated to the latest version."
			else
				InRa ">>> Current version: $VERSION"
			fi
		else
			InRa ">>> Update failed. Try again."
		fi
		rm -rf ${Tam};
	fi
	logger ">>> $(basename "$0") finished"
	exit 0
}
#__________________________________________________________________________________________________
while getopts "h?v0123fFdDpPqQrRsSoOuUb:w:i:-:" opt; do
	case ${opt} in
		h|\? ) Giup ;;
		v    ) echo ">>> Current version: $VERSION" ; logger ">>> $(basename "$0") finished" ;rm -rf ${Tam}; exit 0 ;;
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
		GetSLL --remote-name --time-cond cacert.pem https://curl.haxx.se/ca/cacert.pem
	fi
#__________________________________________________________________________________________________
	InRa "> Updating official Black/WhiteList Online"
	GetSLL ${Nha}/denOn/denOn > $denOn;Size $denOn;
	GetSLL ${Nha}/trangOn/trangOn > $Tamh;Size $Tamh;cat $Tamh > $trangOn;
	GetSLL ${Nha}/trangOn/apple > $Tamh;Size $Tamh;cat $Tamh >> $trangOn;Size $trangOn
	InRa ">> Unlocking Level [0]"
	InRa "# Downloading: Domains";GetSLL ${u00} > $Tamd;Size $Tamd;cat $Tamd | sed -r 's|.*\=\/||; s|\/.*$||' > $dTam
#__________________________________________________________________________________________________
	InRa "# Downloading: ${u01}";GetSLL ${u01} > $Tamh;Size $Tamh;cat $Tamh > $hTam;
	InRa "# Downloading: ${u02}";GetSLL ${u02} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
	InRa "# Downloading: ${u03}";GetSLL -d mimetype=plaintext -d hostformat=dnsmasq ${u03} > $Tamh;Size $Tamh;cat $Tamh >> $hTam | Size $hTam;
	InRa "# Downloading: ${u04}";GetSLL ${u04} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
	InRa "# Downloading: ${u05}";GetSLL ${u05} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
	InRa "# Downloading: ${u06}";GetSLL ${u06} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
	InRa "# Downloading: ${u07}";GetSLL ${u07} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
	InRa "# Downloading: ${u08}";GetSLL ${u08} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
	InRa "# Downloading: ${u09}";GetSLL ${u09} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
	InRa "# Downloading: ${u10}";GetSLL ${u10} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
	InRa "# Downloading: ${u11}";GetSLL ${u11} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
	InRa "# Downloading: ${u12}";GetSLL ${u12} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
	InRa "# Downloading: ${u13}";GetSLL ${u13} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
	InRa "# Downloading: ${u14}";GetSLL ${u14} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
	InRa "# Downloading: ${u15}";GetSLL ${u15} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
	InRa "# Downloading: ${u16}";GetSLL ${u16} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
	InRa "# Downloading: ${u17}";GetSLL ${u17} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
	InRa "# Downloading: ${u18}";GetSLL ${u18} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
	InRa "# Downloading: ${u19}";GetSLL ${u19} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
	InRa "> Deleting Special character: [0]";LC_ALL=C cat $hTam | sed -r 's|#.*$||; s|<.*$||; s|::||; s|^address=/||; s|0.0.0.0||; s|:.*$||; s|^127.0.0.1||; s|^255.255.*||; s|0.0.0.0||; s|\/$||; s|\.$||; s|^[[:space:]]*||g; s|\;|\n|; s|\s+$||; s|\^$||; s|^\-\-||; s|^\-||; s|^[^.]+$||; s|&.*$||; s|^🔗||; s|^\.||; s|^\_\_||g; s|^\_||g; s|\.$||; s|\?$||; s|\-$||; s|\+$||; s|\$.*$||; s|\.v$||; s|\.w$||; s|p.*mq$||; s|\.co.*rls$|.com|; /^$/d' | sed -r 's|\n^[^.]+$||; /^$/d' | awk '{if ($1 in a) next; a[$1]=$0; print}' > $Tamh
	cat $Tamh > $hTam;InRa ">> File size Level [0]";Size $hTam;
#__________________________________________________________________________________________________
	InRa "# Downloading: ${u90}";GetSLL ${u90} > $Tamh;Size $Tamh;cat $Tamh > $Tamt;
	InRa "# Downloading: ${u91}";GetSLL ${u91} > $Tamh;Size $Tamh;cat $Tamh >> $Tamt;
	InRa "# Downloading: ${u92}";GetSLL ${u92} > $Tamh;Size $Tamh;cat $Tamh >> $Tamt;
	InRa "# Downloading: ${u93}";GetSLL ${u93} > $Tamh;Size $Tamh;cat $Tamh >> $Tamt;
	InRa "# Downloading: ${u94}";GetSLL ${u94} > $Tamh;Size $Tamh;cat $Tamh >> $Tamt;
	InRa "# Downloading: ${u95}";GetSLL ${u95} > $Tamh;Size $Tamh;cat $Tamh >> $Tamt;
	InRa "# Downloading: ${u96}";GetSLL ${u96} > $Tamh;Size $Tamh;cat $Tamh >> $Tamt;
	InRa "# Downloading: ${u97}";GetSLL ${u97} > $Tamh;Size $Tamh;cat $Tamh >> $Tamt;
	InRa "# Downloading: ${u98}";GetSLL ${u98} > $Tamh;Size $Tamh;cat $Tamh >> $Tamt;
	InRa "# Downloading: ${u99}";GetSLL ${u99} > $Tamh;Size $Tamh;cat $Tamh >> $Tamt;
	InRa "> Deleting Special character: [0.5]";LC_ALL=C cat $Tamt | tr '[:upper:]' '[:lower:]' | sed -r 's|#.*$||; s|<.*$||; s|::||; s|^address=/||; s|0.0.0.0||; s|:.*$||; s|^127.0.0.1||; s|^255.255.*||; s|0.0.0.0||; s|\/$||; s|\.$||; s|^[[:space:]]*||g; s|\;|\n|; s|\s+$||; s|\^$||; s|^\-\-||; s|^\-||; s|^[^.]+$||; s|&.*$||; s|^🔗||; s|^\.||; s|^\_\_||g; s|^\_||g; s|\.$||; s|\?$||; s|\-$||; s|\+$||; s|\$.*$||; s|\.v$||; s|\.w$||; s|p.*mq$||; s|\.co.*rls$|.com|; /^$/d' | sed -r 's|!.*$||; s|#.*$||; s|:.*$||; s|\^.*$||; s|\@.*$||; s|\/.*$||; s|\?.*$||; s|.*\*.$||; s|~.*$||; s|0.0.0.0||; s|\,|\n|g; s|^127\.0\.0\.1.*$||; s/\|\|//; s|[[:blank:]]|\n|; s|^\.||; s|^[^.]+$||; s|>.*$||; s|\\.*$||; s|^\-||; s|\&.*$||; s|\*$||; s|^.*\.$||g; s|.*\*.*||; s|.*\.$||; s|\n.*\.$||' | sed -r 's|\.invalid$||; s|.*main$||; s|\.co.*orn$|.com|; s|^i.*nt$||; s|^s.*pt$||' | sed 's|\$.*$||' | grep -o '^[^|]*' | awk '{if ($1 in a) next; a[$1]=$0; print}' > $Tamh
	cat $Tamh >> $hTam;InRa ">> File size Level [0.5]";Size $hTam;
#__________________________________________________________________________________________________
	if [ $Level -ge 1 ]; then
		InRa ">> Unlocking Level [1]"
		InRa "# Downloading: ${u20}";GetSLL ${u20} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u21}";GetSLL ${u21} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u22}";GetSLL ${u22} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u23}";GetSLL ${u23} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u24}";GetSLL ${u24} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u25}";GetSLL ${u25} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u26}";GetSLL ${u26} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u27}";GetSLL ${u27} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u28}";GetSLL ${u28} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u29}";GetSLL ${u29} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u30}";GetSLL ${u30} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u31}";GetSLL ${u31} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u32}";GetSLL ${u32} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u33}";GetSLL ${u33} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u34}";GetSLL ${u34} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u35}";GetSLL ${u35} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u36}";GetSLL ${u36} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u37}";GetSLL ${u37} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u38}";GetSLL ${u38} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u39}";GetSLL ${u39} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u40}";GetSLL ${u40} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u41}";GetSLL ${u41} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u42}";GetSLL ${u42} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u43}";GetSLL ${u43} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u44}";GetSLL ${u44} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u45}";GetSLL ${u45} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u46}";GetSLL ${u46} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u47}";GetSLL ${u47} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u48}";GetSLL ${u48} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "> Deleting Special character: [1]";LC_ALL=C cat $hTam | sed -r 's|#.*$||; s|<.*$||; s|::||; s|^address=/||; s|0.0.0.0||; s|:.*$||; s|^127.0.0.1||; s|^255.255.*||; s|0.0.0.0||; s|\/$||; s|\.$||; s|^[[:space:]]*||g; s|\;|\n|; s|\s+$||; s|\^$||; s|^\-\-||; s|^\-||; s|^[^.]+$||; s|&.*$||; s|^🔗||; s|^\.||; s|^\_\_||g; s|^\_||g; s|\.$||; s|\?$||; s|\-$||; s|\+$||; s|\$.*$||; s|\.v$||; s|\.w$||; s|p.*mq$||; s|\.co.*rls$|.com|; /^$/d' | sed -r 's|.*ating$||; s|.*kbang$||; s|.*ztop$||; s|.*kdns$||; s|.*main$||; s|\.v.*ost$|.vn|; s|\.co.*ost$|.com|; s|\.co.*ies$|.com|; s|\.co.*orn$|.com|' | sed -r 's|\n^[^.]+$||; /^$/d' | awk '{if ($1 in a) next; a[$1]=$0; print}' > $Tamh
		cat $Tamh > $hTam;InRa ">> File size Level [1]";Size $hTam;
	fi
#__________________________________________________________________________________________________
	if [ $Level -ge 2 ]; then
		InRa ">> Unlocking Level [2]"
		InRa "# Downloading: ${u49}";GetSLL ${u49} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u50}";GetSLL ${u50} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u51}";GetSLL ${u51} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u52}";GetSLL ${u52} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u53}";GetSLL ${u53} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u54}";GetSLL ${u54} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u55}";GetSLL ${u55} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u56}";GetHTT ${u56} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u57}";GetHTT ${u57} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u58}";GetSLL ${u58} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u59}";GetSLL ${u59} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u60}";GetSLL ${u60} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u61}";GetSLL ${u61} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u62}";GetSLL ${u62} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u63}";GetSLL ${u63} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u64}";GetSLL ${u64} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u65}";GetSLL ${u65} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u66}";GetSLL ${u66} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u67}";GetSLL ${u67} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u68}";GetSLL ${u68} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u69}";GetSLL ${u69} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u70}";GetSLL ${u70} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u71}";GetSLL ${u71} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u72}";GetSLL ${u72} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u73}";GetSLL ${u73} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u74}";GetSLL ${u74} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u75}";GetSLL ${u75} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u76}";GetSLL ${u76} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u77}";GetSLL ${u77} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "> Deleting Special character: [2]";LC_ALL=C cat $hTam | sed -r 's|#.*$||; s|<.*$||; s|::||; s|^address=/||; s|0.0.0.0||; s|:.*$||; s|^127.0.0.1||; s|^255.255.*||; s|0.0.0.0||; s|\/$||; s|\.$||; s|^[[:space:]]*||g; s|\;|\n|; s|\s+$||; s|\^$||; s|^\-\-||; s|^\-||; s|^[^.]+$||; s|&.*$||; s|^🔗||; s|^\.||; s|^\_\_||g; s|^\_||g; s|\.$||; s|\?$||; s|\-$||; s|\+$||; s|\$.*$||; s|\.v$||; s|\.w$||; s|p.*mq$||; s|\.co.*rls$|.com|; /^$/d' | sed -r 's|\.$||; s|\.k$||; s|\.co.*orn$|.com|; s|www$||' | sed -r 's|\n^[^.]+$||; /^$/d' | awk '{if ($1 in a) next; a[$1]=$0; print}' > $Tamh
		cat $Tamh > $hTam;InRa ">> File size Level [2]";Size $hTam;
	fi
#__________________________________________________________________________________________________
	if [ $Level -ge 3 ]; then
		InRa ">> Unlocking Level [3]"
		InRa "# Downloading: ${u78}";GetSLL ${u78} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u79}";GetSLL ${u79} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u80}";GetMHK ${u80} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;		
		InRa "# Downloading: ${u81}";GetSLL ${u81} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u82}";GetSLL ${u82} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u83}";GetSLL ${u83} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "> Deleting Special character: [3]";LC_ALL=C cat $hTam | sed -r 's|#.*$||; s|<.*$||; s|::||; s|^address=/||; s|0.0.0.0||; s|:.*$||; s|^127.0.0.1||; s|^255.255.*||; s|0.0.0.0||; s|\/$||; s|\.$||; s|^[[:space:]]*||g; s|\;|\n|; s|\s+$||; s|\^$||; s|^\-\-||; s|^\-||; s|^[^.]+$||; s|&.*$||; s|^🔗||; s|^\.||; s|^\_\_||g; s|^\_||g; s|\.$||; s|\?$||; s|\-$||; s|\+$||; s|\$.*$||; s|\.v$||; s|\.w$||; s|p.*mq$||; s|\.co.*rls$|.com|; /^$/d' | sed -r 's|\.com.*orn$|.com|; s|^w.*orn$||; s|.*html$||' | sed -r 's|\n^[^.]+$||; /^$/d' | awk '{if ($1 in a) next; a[$1]=$0; print}' > $Tamh
		cat $Tamh > $hTam;InRa ">> File size Level [3]";Size $hTam;
	#__________________________________________________________________________________________________
	fi
	if [ $Level -eq 4 ]; then
		InRa ">> Unlocking Level [4]"
		InRa "# Downloading: ${u84}";GetSLL ${u84} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa "# Downloading: ${u100}";GetSLL ${u100} > $Tamh;Size $Tamh;cat $Tamh >> $hTam;
		InRa ">>> File size Level [4]";Size $hTam
	fi
	if [ $NOFB = "f" ]; then
		InRa "# Downloading: ${u85}"
		GetSLL ${Nha}/denOn/facebook.only >> $hTam;Size $Tamh;cat $Tamh >> $hTam;
	fi
	if [ $NOFB = "F" ]; then
		InRa "# Downloading: ${u86}";GetSLL ${Nha}/denOn/facebook.all >> $hTam;Size $Tamh;
		cat $Tamh >> $hTam
	fi
#__________________________________________________________________________________________________
else
	InRa "# NETWORK: DOWN | MODE: OFFLINE"
	[ -s $hChinh ] && cat $hChinh | awk '{print $2}' > $hTam
	[ -s $dChinh ] && cp $dChinh $dTam
fi
#__________________________________________________________________________________________________
InRa "> Deleting Special character: Black/WhiteList Online"
LC_ALL=C cat $denOn | sed -r "${DenTrang}" > $Tambl && cp $Tambl $denOn
LC_ALL=C cat $trangOn | sed -r "${DenTrang}" > $Tamwl && cp $Tamwl $trangOn
#__________________________________________________________________________________________________
if [ $DISTRIB -eq 0 ] && { [ -s "$denOff" ] || [ -s "$trangOff" ]; }; then
	InRa "> Deleting Special character: Black/WhiteList Offline"
	LC_ALL=C cat $denOff | sed -r "${DenTrang}" > tmpmybl && mv tmpmybl $denOff
	LC_ALL=C cat $trangOff | sed -r "${DenTrang}" > tmpmywl && mv tmpmywl $trangOff
	cat $denOn | cat $denOff - > $Tambl
	cat $trangOn | cat $trangOff - | grep -Fvwf $denOff > $Tamwl
fi
#__________________________________________________________________________________________________
InRa "> Add-Remove Black-White List"
LC_ALL=C cat $hTam | tr '[:upper:]' '[:lower:]' | sed -r 's|#.*$||; s|0.0.0.0||; s|0.0.0.0$||; s|.* br.*||; s|.* lo.*||; s|:.*$||; s|^[[:space:]]*||g; s|^\-\-||; s|^\-||; s|^\_\_||; s|^\_||; s|^🔗||; s|^\.||; s|\.$||; s|\/.*$||; s|\.com.*orn$|.com|; s|\.co.*rls$|.com|; s|^w.*orn$||; s|\.v$||; s|\.w$||; s|\.z$||; s|\+$||; s|\-$||; s|^[^.]+$||; /^$/d' | grep -vE "(${SubDM})" | cat $Tambl - | grep -Fvwf $Tamwl | grep -Fvwf $dTam | awk '{if ($1 in a) next; a[$1]=$0; print}' | awk -v "IP=$SetIP" '{sub(/\r$/,""); print IP" "$0}' > $hChinh
LC_ALL=C cat $dTam | grep -Fvwf $Tamwl | sed -r 's|^|address\=\/|; s|$|\/0.1.2.3|' > $dChinh
InRa ">>>> File size Hosts";Size $hChinh;Counts=$(cat $hChinh | wc -l | sed 's/^[ \t]*//');
InRa "# Blocked: $Counts Hosts"
InRa ">>>> File size Domains";Size $dChinh;Counts=$(cat $dChinh | wc -l | sed 's/^[ \t]*//');
InRa "# Blocked: $Counts Domains"
#__________________________________________________________________________________________________
if [ -f "${TMuc}/Location" ]
then
	echo "Skip restart DNS server"
else
	InRa "> Restarting DNS server (dnsmasq)";ReBoot;InRa "> Deleting: $Tam";rm -rf ${Tam};
fi
TIMERSTOP=`date +%s`
RTMINUTES=$(( $((TIMERSTOP - TIMERSTART)) /60 ))
RTSECONDS=$(( $((TIMERSTOP - TIMERSTART)) %60 ))
InRa "# Total time: $RTMINUTES:$RTSECONDS minutes"
InRa "# DONE"
logger ">>> $(basename "$0") finished"
exit 0
# FIN
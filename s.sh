#!/bin/sh
VERSION="20180721+"
export SetIP="0.1.2.3"
export Level=4
Home1Page="https://github.com/S8D/AdBlock"
Home2Page="https://raw.githubusercontent.com/S8D/AdBlock/master"
u00="${Home2Page}/Darias.txt"
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
mdomains="000webhostapp\.com$|000webhostaww\.com$|2o7\.net$|302br\.net$|51yes\.com$|69server\.net$|actonsoftware\.com$|adjlggler\.net$|adnxs\.com$|adsrvr\.org$|advertising\.com$|aetaienergieclim\.net$|ahdoonetfisher\.net$|aitilklykk\.net$|allyes\.com$|alphonso\.tv$|alpol\.com$|altpool\.pro$|amazon\-adsystem\.com$|anbtr\.com$|angelfire\.com$|awwier\.net$|baixeinfiltrato\.net$|bizland\.com$|blog\.com$|blogswot\.ae$|blogswot\.al$|blogswot\.am$|blogswot\.ba$|blogswot\.be$|blogswot\.bg$|blogswot\.ca$|blogswot\.ch$|blogswot\.ch\.br$|blogswot\.cl$|blogswot\.co\.at$|blogswot\.co\.id$|blogswot\.co\.id\.br$|blogswot\.co\.il$|blogswot\.co\.ke$|blogswot\.co\.lk$|blogswot\.co\.lk\.br$|blogswot\.co\.nz$|blogswot\.co\.za$|blogswot\.com$|blogswot\.com\.al$|blogswot\.com\.ar$|blogswot\.com\.br$|blogswot\.com\.by$|blogswot\.com\.co$|blogswot\.com\.cy$|blogswot\.com\.ee$|blogswot\.com\.eg$|blogswot\.com\.es$|blogswot\.com\.ly$|blogswot\.com\.mt$|blogswot\.com\.ng$|blogswot\.com\.tr$|blogswot\.com\.tr\.br$|blogswot\.com\.woowra\-ns\.com$|blogswot\.cz$|blogswot\.de$|blogswot\.de\.br$|blogswot\.dk$|blogswot\.es$|blogswot\.fi$|blogswot\.fr$|blogswot\.gr$|blogswot\.gr\.br$|blogswot\.hk$|blogswot\.hl$|blogswot\.hr$|blogswot\.ie$|blogswot\.in$|blogswot\.is$|blogswot\.it$|blogswot\.it\.br$|blogswot\.jw$|blogswot\.kr$|blogswot\.lg$|blogswot\.li$|blogswot\.ll$|blogswot\.ls\.intellitxt\.com$|blogswot\.lt$|blogswot\.md$|blogswot\.mk$|blogswot\.mx$|blogswot\.my$|blogswot\.nl$|blogswot\.no$|blogswot\.qa$|blogswot\.rl$|blogswot\.ro$|blogswot\.rs$|blogswot\.se$|blogswot\.sg$|blogswot\.si$|blogswot\.sk$|blogswot\.sn$|blogswot\.tw$|blogswot\.we$|blogswot\.wt$|blysellads\.com$|bpa\.nu$|btcchina\.com$|btttag\.com$|byinter\.net$|cablelink\.ro$|canalblog\.com$|carrieriq\.com$|cedexis\.net$|centade\.com$|centerblog\.net$|certified\-toolbar\.com$|charter\.com$|chat\.rl$|chez\.com$|clickability\.com$|clickbank\.net$|cloldfront\.net$|co\.cc$|co\.lk$|co\.tv$|co\.zw$|com\.al$|com\.br$|com1\.ru$|comcast\.net$|consensu\.org$|crashlytics\.com$|creablog\.com$|criteo\.net$|cryptaloot\.pro$|de\.sr$|de\.vu$|designmysite\.pro$|diaryland\.com$|dolbleclick\.net$|doubleclick\.com$|doubleclick\.net$|easy4blog\.com$|ebafesangbadpratidin\.com$|ebayrtm\.com$|eibosholse\-of\-gerryweber\.net$|envy\.nu$|eoceiylmenetworks\.net$|erasercash\.com$|ero\-advertising\.com$|fastclick\.net$|fateback\.com$|films\-internet\.info$|flu\.cc$|for\-our\.info$|fora\.pl$|forum2x2\.ru$|freehosting\.cc$|freesitesnetwork\.com$|fwmrm\.net$|fx\.to$|googlesyndication\.com$|grandenetworks\.net$|hashvault\.pro$|hatenablog\.com$|hienebakster\.net$|hitbox\.com$|home\.ne\.jp$|hut1\.ru$|hywerbanner\.net$|i\-gloo\.net$|idv\.tw$|ikwilhet\.nu$|impact\-ad\.jp$|imrworldwide\.com$|indieclick\.com$|indieclick\.com$$|infoweb\.ne\.jp$|inq\.com$|insightfirst\.com$|l\-telcom\.net$|labbinarymining\.com$|land\.ru$|linkhotel\.nl$|liveadvert\.com$|lmbler\.net$|lsercash\.com$|media\-toolbar\.com$|mediaonenetwork\.net$|mesh\.ad\.jp$|microad\.jp$|minemonero\.pro$|minerhills\.com$|mirtesen\.rl$|mojeforlm\.net$|musicfrost\.com$|myblogtoolbar\.com$|myhomescreen\.tv$|myjino\.ru$|mylivepage\.ru$|mylivewage\.rl$|mystoretoolbar\.com$|myway\.com$|narod\.ru$|narod2\.ru$|neliver\.com$|netshelter\.net$|nnarod\.ru$|nut\.cc$|obohytaipeinavi\.net$|onion\.to$|online\-metrix\.net$|ono\.com$|ooroptiobeto\.net$|owentracker\.net$|pagina\.nu$|peiwetrannydates\.com$|pinballpublishernetwork\.com$|polyad\.net$|polybuild\.ru$|popads\.net$|puserving\.com$|qq\.com$|qualtrics\.com$|queroumforum\.com$|reporo\.net$|rr\.com$|rr\.nu$|rubiconproject\.com$|sbcglobal\.net$|science\-directory\.net$|scorecardresearch\.com$|seclrenet\-server\.net$|seclreserver\.net$|secureorganictrade\.ru$|serving\-sys\.com$|sextracker\.de$|sicherheitshilfe\-hilfeservice\.gq$|smaato\.net$|smi2\.ru$|solocwm\.com$|solthchandlerhomesforsale\.com$|soothxopso\.net$|spacevilla\.net$|startspot\.nl$|startswot\.nl$|student\-24\.ru$|subito\.cc$|szm\.com$|t\-online\.hl$|taboola\.com$|tahcieligiblegreeks\.net$|taiwabonlswinner\.net$|teads\.tv$|tealilmiq\.com$|terrashare\.com$|tlmblr\.com$|tmall\.com$|tomshardware\.com$|tpnet\.pl$|truth\-is\-out\-there\.org$|twnet\.wl$|uni\.cc$|usite\.pro$|valleclick\.com$|valleclick\.net$|vectranet\.pl$|vertamedia\.com$|vi\.net$|vsn\.nu$|wbwhgwbr\.in$|web\.tr$|webtrekk\.net$|weebly\.com$|wlblicvm\.com$|work5\.ru$|xxxfaster\.net$|yesadvertising\.com$|yieldmanager\.net$|zachasinderella\.net$|zz\.mu$|forumtoolbar\.com$|loyaltytoolbar\.com$|mycitytoolbar\.com$|mycollegetoolbar\.com$|myfamilytoolbar\.com$|myforumtoolbar\.com$|mylibrarytoolbar\.com$|myradiotoolbar\.com$|myteamtoolbar\.com$|mytowntoolbar\.com$|myuniversitytoolbar\.com$|ourtoolbar\.com$|xooit\.com$|0catch\.com$|0x1f4b0\.com$|126\.net$|207\.net$|7us\.us$|adap\.tv$|adhese\.com$|adkmob\.com$|admob\.com$|adotmob\.com$|adprotect\.net$|adscience\.nl$|aiziezq6\.net$|am15\.net$|atspace\.us$|aviasales\.ru$|beeplog\.de$|bestdeals\.at$|blueadvertise\.com$|bt\.net$|bubblesmedia\.ru$|caiyupasadenastarnews\.net$|cdi\.no$|chartbeat\.net$|chiejgravuremodels\.net$|cjb\.net$|cjt1\.net$|clan\.su$|clicksmob\.com$|co\.at$|com\-oo4\.net$|connextra\.com$|creativemedia\.buzz$|cz\.cc$|da\.ru$|deluxepass\.com$|demdex\.net$|demos\.su$|dtiblog\.com$|e\-city\.tv$|ed10\.net$|eigenpage\.nl$|eiyoojuegosparawindows\.net$|eloqua\.com$|ensighten\.com$|f3322\.net$|fastestshopa\.su$|fasthost\.tv$|favorietje\.nl$|fgpp\.com$|firstfind\.nl$|frem\.com$|gb\.net$|gerelateerd\.nl$|getrestinfom\.su$|getrestinfon\.su$|go2affise\.com$|gotech\.tk$|herokuapp\.com$|iedoobuzzlike\.com$|iehohicv2\.net$|indymedia\.org$|installantivirus\.us$|isgre\.at$|ixaichumoroutcasts\.net$|klantenservicenederland\.nl$|klantenservicetelefoonnummernederland\.com$|krovatka\.su$|level3\.net$|linkexchange\.nl$|linkgoed\.nl$|linkpulse\.com$|lookingat\.us$|madvertise\.com$|mchsi\.com$|miningpoolhub\.com$|mktoresp\.com$|mob\.com$|monerise\.com$|my\-place\.us$|mybjjblog\.com$|n3\.net$|nanopool\.org$|nationalcablenetworks\.ru$|nedstat\.net$|net16\.net$|net23\.net$|net46\.net$|net63\.net$|net76\.net$|net78\.net$|net84\.net$|netpass\.tv$|nupaifree\-crochet\.net$|oasuagoals\.net$|oewabox\.at$|ohxeimysonicwall\.net$|onlinepricex\.su$|ontheweb\.nl$|oowaividaddict\.net$|openxenterprise\.com$|pacbell\.net$|plp7\.ru$|pornhub\.com$|publicus\.com$|raeniretweet\.net$|rfihub\.com$|servecounterstrike\.com$|shaeyffh6\.net$|sharezips\.net$|shoofle\.tv$|site40\.net$|site50\.net$|site88\.net$|site90\.com$|site90\.net$|skyrock\.com$|smartnaturalshop\.su$|smi2\.net$|sponsormob\.com$|spywarestrike\.com$|startclub\.nl$|startmee\.nl$|startvista\.nl$|startvriend\.nl$|suprnova\.cc$|switchadhub\.com$|syndicaster\.tv$|telekom\.hu$|telering\.at$|thetrafficstat\.net$|thohjkuvat\.net$|tie\.cl$|tmfweb\.nl$|toprealsalen\.su$|trademob\.com$|uni5\.net$|veruta\.com$|videoplaza\.tv$|vidible\.tv$|vidzi\.tv$|webgidsje\.nl$|webservis\.ru$|webtradeplus\.su$|webwise\.com$|yamanoha\.com$|zeblog\.com$|zinoiosijek031\.net$|360\.cn$|3g\.cn$|zj\.cn$|ac\.cn$|adpush\.cn$|alimabi\.cn$|alimama\.cn$|analysys\.cn$|autoimg\.cn$|baidu\.com$|casee\.cn$|china\.cn$|chinaenter\.cn$|com\.cn$|domob\.cn$|edu\.cn$|firstlight\.cn$|fj\.cn$|gov\.cn$|hi\.cn$|icast\.cn$|jl\.cn$|jpush\.cn$|jtle0\.cn$|liuliangbao\.cn$|maxthon\.cn$|minisplat\.cn$|moad\.cn$|net\.cn$|nx\.cn$|org\.cn$|shuzilm\.cn$|sina\.cn$|sinaimg\.cn$|soarfi\.cn$|tianya\.cn$|uc\.cn$|voiceads\.cn$|voicecloud\.cn$|weibo\.cn$|wostore\.cn$|wps\.cn$|xj\.cn$|xz\.cn$|weibo\.com$|wechat\.com$|6\.cn$";
sed1="s|\^.*$||; s|\$.*$||; s|\/.*$||; s/\|\|//; s|^\.||; s|~.*$||;s|^yelp\.be.*$||;  s|^elpais.*$||; s|^mangapanda.*$||; s|^116\.ru.*$||; s|^yandex\..*$||; s|[[:blank:]]|\n|; s|^[^.]+$||g; s|\n^[^.]+$||; /^$/d";
sed2="s|#.*$||; s|;.*$||; s|:.*$||; s|<.*$||; s|^address=/||; s|^127.0.0.1||; s|127.0.0.1$||; s|\]||; s|0\.0\.0\.0|\n|; s|0\.0\.0\.0||; s/\|//; s|^\s+$||; s|^\s+||; s|\s+$||; s|\$||; s|\/$||; s|^🔗||; s|^\.||; s|^127\.0.*$||; s|\?||; s|\.$||; s|\-$||; s|\+$||; s|[[:blank:]]|\n|; s|\t|\n|; s|tl2$|tl|; s|comf4a$|com|; s|\.com12276\.|\.com\n12276\.|; s|cn000info\.|cn\.000info|; s|co14$|co|; s/st.adxxx.o$//; s|^255.255.255.255||; s|com1$|com|; s|[[:blank:]]||; s|\-\.$||; s|\.$||; s|^\.com$||; s|\^$||; s|^[^.]+$||g; s|\n^[^.]+$||; /^$/d";
sed3="s/^[[:blank:]]*//; s/[[:blank:]]*$//; /^$/d; /^\s*$/d";
sed4="s|^address=/||; s|\/0\.0\.0\.0||; s|\/0\.1\.2\.3||; s|\/127\.0\.0\.1||; s/^[[:blank:]]*//; s/[[:blank:]]*$//; /^$/d; /^\s*$/d";
sed5="s|^\-\-||; s|^\-||; s|\-$||; s|\.$||; s|^\.||; s|^[^.]+$||g; /^$/d";
sed6="s|#.*$||; s|;.*$||; s|:.*$||; s|<.*$||; s|^address=/||; s|^127.0.0.1||; s|127.0.0.1$||; s|\]||; s|0\.0\.0\.0|\n|; s|0\.0\.0\.0||; s/\|//; s|^\s+$||; s|^\s+||; s|\s+$||; s|\$||; s|\/$||; s|^🔗||; s|^\.||; s|^127\.0.*$||; s|\?||; s|\.$||; s|\-$||; s|\+$||; s|[[:blank:]]|\n|; s|\t|\n|; s|tl2$|tl|; s|comf4a$|com|; s|\.com12276\.|\.com\n12276\.|; s|cn000info\.|cn\.000info|; s|co14$|co|; s/st.adxxx.o$//; s|^255.255.255.255||; s|com1$|com|; s|[[:blank:]]||; s|\-\.$||; s|\.$||; s|^\.com$||; s|\^$||; s|^[^.]+$||g; s|\n^[^.]+$||; s|\-\.$||; /^$/d";
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
alias GetHTT="curl -f -s -k -L"
alias GetSLL="curl -f -s -k -L"
[ $SECURL -eq 1 ] && unalias GetSLL && alias GetSLL="curl -f -s --capath ${TMuc} --cacert $CURL_CA_BUNDLE"
alias GetMHK="curl -f -s -A -L "Mozilla/5.0" -e http://forum.xda-developers.com/"
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
	lognecho ">>> Checking for updates..."
	if ping -q -c 1 -W 1 google.com >/dev/null; then
		GetSLL ${Home2Page}/$(basename "$0") > $fTam
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
		rm -rf ${Tam};
	fi
	logger ">>> $(basename "$0") finished"
	exit 0
}
#___________________________________________________________________________________________________________________________________________________________________________________________________
while getopts "h?v0123fFdDpPqQrRsSoOuUb:w:i:-:" opt; do
	case ${opt} in
		h|\? ) printHelp ;;
		v    ) echo ">>> Current version: $VERSION" ; logger ">>> $(basename "$0") finished" ;rm -rf ${Tam}; exit 0 ;;
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
lognecho "|      AdBlock for DD-WRT/Android base on Linux             |"
lognecho "|      ${Home1Page}                       |"
lognecho "|      Author: Manish Parashar                              |"
lognecho "|      Editor: Darias                                       |"
lognecho "============================================================="
lognecho "             `date`"
lognecho "# Version: $VERSION"

#___________________________________________________________________________________________________________________________________________________________________________________________________
if [ -f $pauseflag ] && { [ -f $hDung ] || [ -f $dDung ]; }; then
	lognecho "# USER FORGOT TO RESUME PROTECTION AFTER PAUSING"
	protectOn
fi
if [ $ONLINE -eq 1 ] && ping -q -c 1 -W 1 google.com >/dev/null; then

	lognecho "# NETWORK: UP | MODE: ONLINE"
	lognecho "# IP ADDRESS FOR ADS: $SetIP"
	lognecho "# SECURE [0=NO | 1=YES]: $SECURL"
	lognecho "# Level [0|1|2|3|4]: $Level"

	if [ ! -s cacert.pem ] || { [ "${DAYOFWEEK}" -eq 1 ] || [ "${DAYOFWEEK}" -eq 4 ]; }; then
		lognecho "> Downloading / updating cURL certificates"
		GetSLL --remote-name --time-cond cacert.pem https://curl.haxx.se/ca/cacert.pem
	fi
#___________________________________________________________________________________________________________________________________________________________________________________________________
	lognecho "# Unlocking Level=0 lists"
	lognecho "# Downloading: Domains";GetSLL ${u00} > $Tamd;printFileSize $Tamd;cat $Tamd > $dTam && cp $dTam $dChinh;
#___________________________________________________________________________________________________________________________________________________________________________________________________
	lognecho "# Downloading: ${u01}";GetSLL ${u01} > $Tamh;printFileSize $Tamh;cat $Tamh > $hTam;
	lognecho "# Downloading: ${u02}";GetSLL ${u02} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
	lognecho "# Downloading: ${u03}";GetSLL -d mimetype=plaintext -d hostformat=dnsmasq ${u03} > $Tamh;
	printFileSize $Tamh;cat $Tamh >> $hTam | printFileSize $hTam;
	lognecho "# Downloading: Main lists"
	lognecho "# Downloading: ${u04}";GetSLL ${u04} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
	lognecho "# Downloading: ${u05}";GetSLL ${u05} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
	lognecho "# Downloading: ${u06}";GetSLL ${u06} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
	lognecho "# Downloading: ${u07}";GetSLL ${u07} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
	lognecho "# Downloading: ${u08}";GetSLL ${u08} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
	lognecho "# Downloading: ${u09}";GetSLL ${u09} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
	lognecho "# Downloading: ${u10}";GetSLL ${u10} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
	lognecho "# Downloading: ${u11}";GetSLL ${u11} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
	lognecho "# Downloading: ${u12}";GetSLL ${u12} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
	lognecho "# Downloading: ${u13}";GetSLL ${u13} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
	lognecho "# Downloading: ${u14}";GetSLL ${u14} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
	lognecho "# Downloading: ${u15}";GetSLL ${u15} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
	lognecho "# Downloading: ${u16}";GetSLL ${u16} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
	lognecho "# Downloading: ${u17}";GetSLL ${u17} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
	lognecho "# Downloading: ${u18}";GetSLL ${u18} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
	lognecho "# Downloading: ${u19}";GetSLL ${u19} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
#___________________________________________________________________________________________________________________________________________________________________________________________________
	lognecho "# Downloading: ${u90}";GetSLL ${u90} > $Tamh;printFileSize $Tamh;cat $Tamh > $Tamt;
	lognecho "# Downloading: ${u91}";GetSLL ${u91} > $Tamh;printFileSize $Tamh;cat $Tamh >> $Tamt;
	lognecho "# Downloading: ${u92}";GetSLL ${u92} > $Tamh;printFileSize $Tamh;cat $Tamh >> $Tamt;
	lognecho "# Downloading: ${u93}";GetSLL ${u93} > $Tamh;printFileSize $Tamh;cat $Tamh >> $Tamt;
	lognecho "# Downloading: ${u94}";GetSLL ${u94} > $Tamh;printFileSize $Tamh;cat $Tamh >> $Tamt;
	lognecho "# Downloading: ${u95}";GetSLL ${u95} > $Tamh;printFileSize $Tamh;cat $Tamh >> $Tamt;
	lognecho "# Downloading: ${u96}";GetSLL ${u96} > $Tamh;printFileSize $Tamh;cat $Tamh >> $Tamt;
	lognecho "# Downloading: ${u97}";GetSLL ${u97} > $Tamh;printFileSize $Tamh;cat $Tamh >> $Tamt;
	lognecho "# Downloading: ${u98}";GetSLL ${u98} > $Tamh;printFileSize $Tamh;cat $Tamh >> $Tamt;
	lognecho "# Downloading: ${u99}";GetSLL ${u99} > $Tamh;printFileSize $Tamh;cat $Tamh >> $Tamt;
	lognecho "> Processing: [0]";LC_ALL=C cat $Tamt | tr '[:upper:]' '[:lower:]' | grep -vE '(#|@|!|\*)' | sed -r "${sed1}" | sort -u > $hChinhTam
	printFileSize $hChinhTam;cat $hChinhTam >> $hTam;
	lognecho ">>>File size Level [0] is:";printFileSize $hTam;
#___________________________________________________________________________________________________________________________________________________________________________________________________
	if [ $Level -ge 1 ]; then
		lognecho "# Unlocking Level=1 lists"
		lognecho "# Downloading: ${u20}";GetSLL ${u20} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u21}";GetSLL ${u21} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u22}";GetSLL ${u22} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u23}";GetSLL ${u23} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u24}";GetSLL ${u24} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u25}";GetSLL ${u25} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u26}";GetSLL ${u26} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u27}";GetSLL ${u27} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u28}";GetSLL ${u28} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u29}";GetSLL ${u29} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u30}";GetSLL ${u30} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u31}";GetSLL ${u31} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u32}";GetSLL ${u32} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u33}";GetSLL ${u33} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u34}";GetSLL ${u34} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u35}";GetSLL ${u35} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u36}";GetSLL ${u36} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u37}";GetSLL ${u37} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u38}";GetSLL ${u38} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u39}";GetSLL ${u39} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u40}";GetSLL ${u40} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u41}";GetSLL ${u41} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u42}";GetSLL ${u42} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u43}";GetSLL ${u43} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u44}";GetSLL ${u44} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u45}";GetSLL ${u45} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u46}";GetSLL ${u46} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u47}";GetSLL ${u47} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u48}";GetSLL ${u48} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho ">>>File size Level [1] is:";printFileSize $hTam;
	fi
#___________________________________________________________________________________________________________________________________________________________________________________________________
	if [ $Level -ge 2 ]; then
		lognecho "# Unlocking Level=2 lists"
		lognecho "# Downloading: ${u49}";GetSLL ${u49} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u50}";GetSLL ${u50} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u51}";GetSLL ${u51} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u52}";GetSLL ${u52} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u53}";GetSLL ${u53} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u54}";GetSLL ${u54} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u55}";GetSLL ${u55} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u56}";GetHTT ${u56} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u57}";GetHTT ${u57} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u58}";GetSLL ${u58} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u59}";GetSLL ${u59} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u60}";GetSLL ${u60} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u61}";GetSLL ${u61} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u62}";GetSLL ${u62} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u63}";GetSLL ${u63} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u64}";GetSLL ${u64} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u65}";GetSLL ${u65} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u66}";GetSLL ${u66} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u67}";GetSLL ${u67} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u68}";GetSLL ${u68} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u69}";GetSLL ${u69} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u70}";GetSLL ${u70} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u71}";GetSLL ${u71} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u72}";GetSLL ${u72} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u73}";GetSLL ${u73} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u74}";GetSLL ${u74} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u75}";GetSLL ${u75} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u76}";GetSLL ${u76} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u77}";GetSLL ${u77} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho ">>>File size Level [2] is:";printFileSize $hTam;
	fi
#___________________________________________________________________________________________________________________________________________________________________________________________________
	if [ $Level -ge 3 ]; then
		lognecho "# Unlocking Level=3 lists"
		lognecho "# Downloading: ${u78}";GetSLL ${u78} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u79}";GetSLL ${u79} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u80}";GetMHK ${u80} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;		
		lognecho "# Downloading: ${u81}";GetSLL ${u81} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u82}";GetSLL ${u82} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u83}";GetSLL ${u83} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho ">>>File size Level [3] is:";printFileSize $hTam;
	#_________________________________________________________________________________________________________________________________
	lognecho "> Processing: [0]+[1]+[2]+[3]";LC_ALL=C cat $hTam | tr '[:upper:]' '[:lower:]' | sed -r "${sed2}" | sort -u > $hChinhTam
	printFileSize $hChinhTam;cat $hChinhTam > $hTam;
	#_________________________________________________________________________________________________________________________________
	fi
	if [ $Level -eq 4 ]; then
		lognecho "# Unlocking Level=4 lists"
		lognecho "# Downloading: ${u84}";GetSLL ${u84} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
		lognecho "# Downloading: ${u100}";GetSLL ${u100} > $Tamh;printFileSize $Tamh;cat $Tamh >> $hTam;
	fi
	if [ $NOFB = "f" ]; then
		lognecho "# Downloading: ${u85}"
		GetSLL ${Home2Page}/denOn/facebook.only >> $hTam;printFileSize $Tamh;cat $Tamh >> $hTam;
	fi
	if [ $NOFB = "F" ]; then
		lognecho "# Downloading: ${u86}";GetSLL ${Home2Page}/denOn/facebook.all >> $hTam;printFileSize $Tamh;
		cat $Tamh >> $hTam
	fi
	lognecho "> Updating official Black/WhiteList Online"
	GetSLL ${Home2Page}/denOn/denOn > $denOn;printFileSize $denOn;
	GetSLL ${u00} >$Tamt;printFileSize $Tamt;cat $Tamt > $trangOn;
	GetSLL ${Home2Page}/trangOn/trangOn >$Tamt;printFileSize $Tamt;cat $Tamt >> $trangOn;
	GetSLL ${Home2Page}/trangOn/apple >$Tamt;printFileSize $Tamt;cat $Tamt >> $trangOn;
#_____________________________________________________________________________________________________________
else
	lognecho "# NETWORK: DOWN | MODE: OFFLINE"
	[ -s $hChinh ] && cat $hChinh | awk '{print $2}' > $hTam
	[ -s $dChinh ] && cp $dChinh $dTam
fi
printFileSize $hTam
printFileSize $dTam
#_____________________________________________________________________________________________________________
lognecho "> Processing: Black/WhiteList Online"
LC_ALL=C cat $denOn | sed -r "${sed3}" | sort -u > $Tambl && cp $Tambl $denOn
LC_ALL=C cat $trangOn | tr '[:upper:]' '[:lower:]' | sed -r "${sed4}" | sort -u > $Tamwl && cp $Tamwl $trangOn
#_____________________________________________________________________________________________________________
if [ $DISTRIB -eq 0 ] && { [ -s "$denOff" ] || [ -s "$trangOff" ]; }; then
	lognecho "> Processing: Black/WhiteList Offline"
	LC_ALL=C cat $denOff | sed -r "${sed3}" | sort -u > tmpmybl && mv tmpmybl $denOff
	LC_ALL=C cat $trangOff | sed -r "${sed3}" | sort -u > tmpmywl && mv tmpmywl $trangOff
	cat $denOn | cat $denOff - > $Tambl
	cat $trangOn | cat $trangOff - | grep -Fvwf $denOff > $Tamwl
fi
#__________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________
	lognecho "> Deleting: Special Character";LC_ALL=C cat $hTam | tr '[:upper:]' '[:lower:]' | sed -r "${sed6}" > $hChinh
	lognecho "> Deleting: Mid-level domains";LC_ALL=C cat $hChinh | grep -vE "(${mdomains})" | tr -cd '\000-\177' | cat $Tambl - | grep -Fvwf $Tamwl | sed -r "${sed5}" | sort -u | awk -v "IP=$SetIP" '{sub(/\r$/,""); print IP" "$0}' > $hTam && cp $hTam $hChinh
	lognecho "> Deleting: $Tam";rm -rf ${Tam};
	lognecho ">>>>File size Hosts<<<<";printFileSize $hChinh;Counts=$(cat $hChinh | wc -l | sed 's/^[ \t]*//');
	lognecho "# Blocked: $Counts Hosts"
	lognecho ">>>>File size Domains<<<<";printFileSize $dChinh;Counts=$(cat $dChinh | wc -l | sed 's/^[ \t]*//');
	lognecho "# Blocked: $Counts Domains"
#___________________________________________________________________________________________________________________________________________________________________________________________________
if [ -f "${TMuc}/Location" ]
then
	echo "Skip restart DNS server"
else
	lognecho "> Restarting DNS server (dnsmasq)";restart_dnsmasq;
fi
TIMERSTOP=`date +%s`
RTMINUTES=$(( $((TIMERSTOP - TIMERSTART)) /60 ))
RTSECONDS=$(( $((TIMERSTOP - TIMERSTART)) %60 ))
lognecho "# Total time: $RTMINUTES:$RTSECONDS minutes"
lognecho "# DONE"
logger ">>> $(basename "$0") finished"
exit 0
# FIN
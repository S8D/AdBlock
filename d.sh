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
hLog="${TMuc}/h.log"
QUIET=0
#__________________________________________________________________________________________________
DenTrang="s/^[[:blank:]]*//; s/[[:blank:]]*$//; /^$/d; /^\s*$/d";
SubDM="\~|000webhostapp\.com$|000webhostaww\.com$|0catch\.com$|0x1f4b0\.com$|126\.net$|207\.net$|2o7\.net$|302br\.net$|360\.cn$|3g\.cn$|51yes\.com$|69server\.net$|6\.cn$|7us\.us$|ac\.cn$|actonsoftware\.com$|adaos\-ads\.net$|adap\.tv$|adbureau\.net$|adclear\.net$|adhese\.com$|adjlggler\.net$|adkmob\.com$|admob\.com$|adnxs\.com$|adotmob\.com$|adprotect\.net$|adpush\.cn$|adscience\.nl$|adsrvr\.org$|advertising\.com$|aeta.*lim\.net$|ahdoonetfisher\.net$|aitilklykk\.net$|aiziezq6\.net$|alimabi\.cn$|alimama\.cn$|allyes\.com$|alphonso\.tv$|alpol\.com$|altpool\.pro$|am15\.net$|amazon\-adsystem\.com$|analysys\.cn$|anbtr\.com$|angelfire\.com$|aobohalbirex\.net$|aplus\.net$|appier\.net$|atspace\.us$|autoimg\.cn$|aviasales\.ru$|awwier\.net$|baidu\.com$|baixeinfiltrato\.net$|beeplog\.de$|bestdeals\.at$|bizland\.com$|blog\.com$|blogswot\..*$|blueadvertise\.com$|blysellads\.com$|bpa\.nu$|bt\.net$|btcchina\.com$|btttag\.com$|bubblesmedia\.ru$|byinter\.net$|cablelink\.ro$|caiy.*ews\.net$|canalblog\.com$|carrieriq\.com$|casee\.cn$|cdi\.no$|ce.*d\-t.*ar\.com$|cedexis\.net$|centade\.com$|centerblog\.net$|chartbeat\.net$|charter\.com$|chat\.rl$|chez\.com$|chiej.*ls\.net$|china\.cn$|chinaenter\.cn$|cjb\.net$|cjt1\.net$|clan\.su$|clickability\.com$|clickbank\.net$|clicksmob\.com$|cloldfront\.net$|co\.at$|co\.cc$|co\.lk$|co\.tv$|co\.zw$|codns\.com$|coin\-have\.com$|coinblockers\.com$|com1\.ru$|com\-oo4\.net$|com\.al$|com\.br$|com\.cn$|comcast\.net$|comlu\.com$|comoj\.com$|company\-target\.com$|connextra\.com$|consensu\.org$|crashlytics\.com$|creablog\.com$|creativemedia\.buzz$|criteo\.(com|net)$|cryptaloot\.pro$|cz\.cc$|da\.ru$|ddns\.net$|de\.sr$|de\.vu$|deluxepass\.com$|demdex\.net$|demos\.su$|designmysite\.pro$|diaryland\.com$|digitalinsight\.com$|dolbleclick\.net$|domob\.cn$|doubleclick\.com$|doubleclick\.net$|dtiblog\.com$|dy4\.de$|e.*e\-of\-g.*er\.net$|e\-city\.tv$|easy4blog\.com$|ebaf.*idin\.com$|ebayrtm\.com$|ed10\.net$|edu\.cn$|eigenpage\.nl$|eiyo.*ows\.net$|eloqua\.com$|ensighten\.com$|envy\.nu$|eoc.*orks\.net$|erasercash\.com$|ero\-advertising\.com$|f3322\.net$|fastclick\.net$|fastestshopa\.su$|fasthost\.tv$|fateback\.com$|favorietje\.nl$|fgpp\.com$|films\-internet\.info$|firstfind\.nl$|firstlight\.cn$|fj\.cn$|flu\.cc$|for\-our\.info$|fora\.pl$|forum2x2\.ru$|forumtoolbar\.com$|free\.fr$|freehosting\.cc$|freesitesnetwork\.com$|frem\.com$|fwmrm\.net$|fx\.to$|gb\.net$|gerelateerd\.nl$|getrestinfom\.su$|getrestinfon\.su$|go2affise\.com$|googlesyndication\.com$|gotech\.tk$|gov\.cn$|grandenetworks\.net$|hashvault\.pro$|hatenablog\.com$|herokuapp\.com$|hi\.cn$|hienebakster\.net$|hitbox\.com$|hol\.es$|home\.ne\.jp$|hotjar\.com$|hotlinkimage\.com$|hotpaginas\.com$|httpool\.com$|huanqiu\.com$|hunantv\.com$|hut1\.ru$|hyperphp\.com$|hywerbanner\.net$|i2idata\.com$|i2iserv\.com$|i3log\.com$|i\-gloo\.net$|i\-lookup\.com$|ibelgique\.com$|iblogs\.com$|ibnsites\.com$|ibohpjavme\.com$|icast\.cn$|idv\.tw$|iedoobuzzlike\.com$|iegh.*rror\.com$|iehohicv2\.net$|iembarazadas\.com$|iequutravel4u\.com$|ieyipluckyscent\.com$|ifeng\.com$|ifengimg\.com$|ifrance\.com$|igexin\.com$|ign\.com$|ignorelist\.com$|igodigital\.com$|ihielatelevisao\.com$|iiniamoca\-news\.com$|ijijiji\.com$|ijinshan\.com$|iknowthatgirl\.com$|ikwilhet\.nu$|impact\-ad\.jp$|imrworldwide\.com$|indieclick\.com$|indymedia\.org$|infoweb\.ne\.jp$|inq\.com$|insightfirst\.com$|installantivirus\.us$|isgre\.at$|ixa.*sts\.net$|jl\.cn$|jpush\.cn$|jtle0\.cn$|kla.*and\.nl$|klan.*land\.com$|krovatka\.su$|l\-telcom\.net$|lab.*ining\.com$|land\.ru$|level3\.net$|linkexchange\.nl$|linkgoed\.nl$|linkhotel\.nl$|linkpulse\.com$|liuliangbao\.cn$|liveadvert\.com$|lmbler\.net$|localytics\.com$|loizuseolita\.com$|lookingat\.us$|lookseekpages\.com$|looksmart\.com$|loomia\.com$|looq.*ciety\.com$|loyaltytoolbar\.com$|lphbs\.com$|lsercash\.com$|ltdomains\.com$|lycos\.com$|mabulle\.com$|madvertise\.com$|maxthon\.cn$|mchsi\.com$|media\-toolbar\.com$|mediaonenetwork\.net$|meegmfio\.in$|mesh\.ad\.jp$|microad\.jp$|minemonero\.pro$|minerhills\.com$|minertopia\.org$|miningpoolhub\.com$|minisplat\.cn$|mirtesen\.rl$|mktoresp\.com$|moad\.cn$|mob\.com$|mobileapptracking\.com$|mobilecore\.com$|mobiletheory\.com$|mobpartner\.com$|mocean\.mobi$|mojeforlm\.net$|monerise\.com$|musicfrost\.com$|my.*toolbar\.com$|my\-place\.us$|mybjjblog\.com$|mydas\.mobi$|myhomescreen\.tv$|myjino\.ru$|mylivepage\.ru$|mylivewage\.rl$|myway\.com$|n3\.net$|nanopool\.org$|narod2\.ru$|narod\.ru$|nat.*orks\.ru$|nedstat\.net$|neliver\.com$|net16\.net$|net23\.net$|net46\.net$|net63\.net$|net76\.net$|net78\.net$|net84\.net$|net\.cn$|netpass\.tv$|netshelter\.net$|nnarod\.ru$|nu.*e\-cr.*t\.net$|nut\.cc$|nx\.cn$|oasuagoals\.net$|oboh.*avi\.net$|oewabox\.at$|ohx.*all\.net$|onion\.to$|online\-metrix\.net$|onlinepricex\.su$|ono\.com$|ontheweb\.nl$|ooroptiobeto\.net$|oowaividaddict\.net$|openxenterprise\.com$|org\.cn$|ourtoolbar\.com$|owentracker\.net$|pacbell\.net$|pagina\.nu$|peiw.*es\.com$|pinba.*twork\.com$|plp7\.ru$|plugrush\.com$|pma\-network\.com$|pointroll\.com$|polarmobile\.com$|poloniex\.com$|polyad\.net$|polybuild\.ru$|popads\.net$|pornhub\.com$|publicus\.com$|puserving\.com$|qq\.com$|qualtrics\.com$|queroumforum\.com$|raeniretweet\.net$|reporo\.net$|rfihub\.com$|rr\.com$|rr\.nu$|rubiconproject\.com$|s.*e\-dir.*y\.net$|sbcglobal\.net$|scorecardresearch\.com$|searchmiracle\.com$|searchwho\.com$|sec.*ctrade\.ru$|seclrenet\-server\.net$|seclreserver\.net$|secureintl\.com$|ser.*rike\.com$|serving\-sys\.com$|sextracker\.de$|shaeyffh6\.net$|sharezips\.net$|shoofle\.tv$|shuzilm\.cn$|si.*fe\-hi.*ce\.gq$|sina\.cn$|sinaimg\.cn$|site40\.net$|site50\.net$|site88\.net$|site90\.com$|site90\.net$|skyrock\.com$|smaato\.net$|smartnaturalshop\.su$|smi2\.net$|smi2\.ru$|soarfi\.cn$|solocwm\.com$|solt.*ale\.com$|soothxopso\.net$|spacevilla\.net$|sponsormob\.com$|spylog\.com$|spywarestrike\.com$|startclub\.nl$|startmee\.nl$|startspot\.nl$|startswot\.nl$|startvista\.nl$|startvriend\.nl$|student\-24\.ru$|subito\.cc$|suprnova\.cc$|switchadhub\.com$|syndicaster\.tv$|szm\.com$|t\-online\.hl$|taboola\.com$|tahc.*eks\.net$|taiwabonlswinner\.net$|teads\.tv$|tealilmiq\.com$|telekom\.hu$|telering\.at$|terrashare\.com$|theglobeandmail\.com$|thetrafficstat\.net$|thohjkuvat\.net$|tianya\.cn$|tie\.cl$|tlmblr\.com$|tmall\.com$|tmfweb\.nl$|tomshardware\.com$|top100\.org$|toprealsalen\.su$|tpnet\.pl$|tr.*ut\-t.*e\.org$|trademob\.com$|tsx\.org$|tvgoods\.ru$|twnet\.wl$|uc\.cn$|ucoz\.ru$|ufanet\.ru$|uni5\.net$|uni\.cc$|usite\.pro$|valleclick\.com$|valleclick\.net$|vectranet\.pl$|vertamedia\.com$|veruta\.com$|vi\.net$|videoplaza\.tv$|vidible\.tv$|vidzi\.tv$|voiceads\.cn$|voicecloud\.cn$|voluumtrk2\.com$|voluumtrk3\.com$|voluumtrk\.com$|vsn\.nu$|w8w\.pl$|waligrucha\.pl$|warszawa\.pl$|waw\.pl$|wbwhgwbr\.in$|web\.tr$|webgidsje\.nl$|webjump\.com$|webservis\.ru$|website\.pl$|webtradeplus\.su$|webtrekk\.net$|webwise\.com$|wechat\.com$|weebly\.com$|weibo\.cn$|weibo\.com$|wirtualnie\.pl$|wlblicvm\.com$|work5\.ru$|wostore\.cn$|wow\-hosting\.com$|woxaeoboads\.com$|woyo8g\.com$|wps\.cn$|wrating\.com$|wtcsites\.com$|wxv\.pl$|x10host\.com$|x10hosting\.com$|x2z\.com$|xae.*is\.com$|xanga\.com$|xbloggers\.com$|xblogspot\.com$|xg4ken\.com$|xhamster\.com$|xiaocen\.com$|xiaomi\.com$|xiti\.com$|xj\.cn$|xlogz\.com$|xmatch\.com$|xmiler\.com$|xooit\.com$|xrus\.org$|xxxfaster\.net$|xz\.cn$|yamanoha\.com$|yesadvertising\.com$|yi\.org$|yieldmanager\.net$|yoyohost\.com$|zac.*ella\.net$|zapto\.org$|zeblog\.com$|zinoiosijek031\.net$|zj\.cn$|zrus\.org$|zz\.mu$";
#__________________________________________________________________________________________________
InRa ()
{
	[ $QUIET -eq 0 ] && echo "$1"
	echo "$1" >> $hLog
}
Size ()
{
	InRa "# Size of $1: `du -h $1 | awk '{print $1}'`"
}
#__________________________________________________________________________________________________

GetSSL ${process} > $tam;Size $tam;cat $tam > $pc; echo "Run Process" ; sh $pc;
echo "> Deleting: $TMTam";rm -rf ${TMTam};
exit 0

# Mỗi lv tạo 1 file tương ứng rồi tải d.sh về và chạy
# Khi có file lv nào thì chạy cộng dồn htam rồi xóa lv
# Tải > chạy > cộng dồn > xóa: d.sh xử lý 4 lv thôi
#
#
#
#
InRa "> Deleting Special character: [0]";LC_ALL=C cat $hTam | sed -r 's|#.*$||; s|<.*$||; s|::||; s|^address=/||; s|0.0.0.0||; s|:.*$||; s|^127.0.0.1||; s|^255.255.*||; s|0.0.0.0||; s|\/$||; s|\.$||; s|^[[:space:]]*||g; s|\;|\n|; s|\s+$||; s|\^$||; s|^\-\-||; s|^\-||; s|^[^.]+$||; s|&.*$||; s|^🔗||; s|^\.||; s|^\_\_||g; s|^\_||g; s|\.$||; s|\?$||; s|\-$||; s|\+$||; s|\$.*$||; s|\.v$||; s|\.w$||; s|p.*mq$||; s|\.co.*rls$|.com|; /^$/d' | sed -r 's|\n^[^.]+$||; /^$/d' | awk '{if ($1 in a) next; a[$1]=$0; print}' > $tam
	cat $tam > $hTam;InRa ">> File size Level [0]";Size $hTam;

InRa "> Deleting Special character: [0.5]";LC_ALL=C cat $t8m | tr '[:upper:]' '[:lower:]' | sed -r 's|#.*$||; s|<.*$||; s|::||; s|^address=/||; s|0.0.0.0||; s|:.*$||; s|^127.0.0.1||; s|^255.255.*||; s|0.0.0.0||; s|\/$||; s|\.$||; s|^[[:space:]]*||g; s|\;|\n|; s|\s+$||; s|\^$||; s|^\-\-||; s|^\-||; s|^[^.]+$||; s|&.*$||; s|^🔗||; s|^\.||; s|^\_\_||g; s|^\_||g; s|\.$||; s|\?$||; s|\-$||; s|\+$||; s|\$.*$||; s|\.v$||; s|\.w$||; s|p.*mq$||; s|\.co.*rls$|.com|; /^$/d' | sed -r 's|!.*$||; s|#.*$||; s|:.*$||; s|\^.*$||; s|\@.*$||; s|\/.*$||; s|\?.*$||; s|.*\*.$||; s|~.*$||; s|0.0.0.0||; s|\,|\n|g; s|^127\.0\.0\.1.*$||; s/\|\|//; s|[[:blank:]]|\n|; s|^\.||; s|^[^.]+$||; s|>.*$||; s|\\.*$||; s|^\-||; s|\&.*$||; s|\*$||; s|^.*\.$||g; s|.*\*.*||; s|.*\.$||; s|\n.*\.$||' | sed -r 's|\.invalid$||; s|.*main$||; s|\.co.*orn$|.com|; s|^i.*nt$||; s|^s.*pt$||' | sed 's|\$.*$||' | grep -o '^[^|]*' | awk '{if ($1 in a) next; a[$1]=$0; print}' > $tam
	cat $tam >> $hTam;InRa ">> File size Level [0.5]";Size $hTam;

		InRa "> Deleting Special character: [1]";LC_ALL=C cat $hTam | sed -r 's|#.*$||; s|<.*$||; s|::||; s|^address=/||; s|0.0.0.0||; s|:.*$||; s|^127.0.0.1||; s|^255.255.*||; s|0.0.0.0||; s|\/$||; s|\.$||; s|^[[:space:]]*||g; s|\;|\n|; s|\s+$||; s|\^$||; s|^\-\-||; s|^\-||; s|^[^.]+$||; s|&.*$||; s|^🔗||; s|^\.||; s|^\_\_||g; s|^\_||g; s|\.$||; s|\?$||; s|\-$||; s|\+$||; s|\$.*$||; s|\.v$||; s|\.w$||; s|p.*mq$||; s|\.co.*rls$|.com|; /^$/d' | sed -r 's|.*ating$||; s|.*kbang$||; s|.*ztop$||; s|.*kdns$||; s|.*main$||; s|\.v.*ost$|.vn|; s|\.co.*ost$|.com|; s|\.co.*ies$|.com|; s|\.co.*orn$|.com|' | sed -r 's|\n^[^.]+$||; /^$/d' | awk '{if ($1 in a) next; a[$1]=$0; print}' > $tam
		cat $tam > $hTam;InRa ">> File size Level [1]";Size $hTam;


		InRa "> Deleting Special character: [2]";LC_ALL=C cat $hTam | sed -r 's|#.*$||; s|<.*$||; s|::||; s|^address=/||; s|0.0.0.0||; s|:.*$||; s|^127.0.0.1||; s|^255.255.*||; s|0.0.0.0||; s|\/$||; s|\.$||; s|^[[:space:]]*||g; s|\;|\n|; s|\s+$||; s|\^$||; s|^\-\-||; s|^\-||; s|^[^.]+$||; s|&.*$||; s|^🔗||; s|^\.||; s|^\_\_||g; s|^\_||g; s|\.$||; s|\?$||; s|\-$||; s|\+$||; s|\$.*$||; s|\.v$||; s|\.w$||; s|p.*mq$||; s|\.co.*rls$|.com|; /^$/d' | sed -r 's|\.$||; s|\.k$||; s|\.co.*orn$|.com|; s|www$||' | sed -r 's|\n^[^.]+$||; /^$/d' | awk '{if ($1 in a) next; a[$1]=$0; print}' > $tam
		cat $tam > $hTam;InRa ">> File size Level [2]";Size $hTam;


		InRa "> Deleting Special character: [3]";LC_ALL=C cat $hTam | sed -r 's|#.*$||; s|<.*$||; s|::||; s|^address=/||; s|0.0.0.0||; s|:.*$||; s|^127.0.0.1||; s|^255.255.*||; s|0.0.0.0||; s|\/$||; s|\.$||; s|^[[:space:]]*||g; s|\;|\n|; s|\s+$||; s|\^$||; s|^\-\-||; s|^\-||; s|^[^.]+$||; s|&.*$||; s|^🔗||; s|^\.||; s|^\_\_||g; s|^\_||g; s|\.$||; s|\?$||; s|\-$||; s|\+$||; s|\$.*$||; s|\.v$||; s|\.w$||; s|p.*mq$||; s|\.co.*rls$|.com|; /^$/d' | sed -r 's|\.com.*orn$|.com|; s|^w.*orn$||; s|.*html$||' | sed -r 's|\n^[^.]+$||; /^$/d' | awk '{if ($1 in a) next; a[$1]=$0; print}' > $tam
		cat $tam > $hTam;InRa ">> File size Level [3]";Size $hTam;


		InRa "> Deleting Special character: [4]";LC_ALL=C cat $hTam | sed -r 's|#.*$||; s|0.0.0.0||; s|0.0.0.0$||; s|.* br.*||; s|.* lo.*||; s|:.*$||; s|^[[:space:]]*||g; s|^\-\-||; s|^\-||; s|^\_\_||; s|^\_||; s|^🔗||; s|^\.||; s|\.$||; s|\/.*$||; s|\.com.*orn$|.com|; s|\.co.*rls$|.com|; s|^w.*orn$||; s|\.v$||; s|\.w$||; s|\.z$||; s|\+$||; s|\-$||; s|^[^.]+$||; /^$/d' | awk '{if ($1 in a) next; a[$1]=$0; print}' > $tam
		InRa ">>> File size Level [4]";Size $hTam

		grep -vE "(${SubDM})" | 
var noadsver = "$Id: no-ads.pac,v 6.3 2017/09/28 17:08:39 loverso Exp loverso $";
var normal = "DIRECT";
var blackhole = "PROXY 255.255.255.0:3421";
if (typeof (navigator) != "undefined" &&
	navigator.appVersion.indexOf("Mac") != -1) {
	blackhole = "PROXY 0.0.0.0:3421";
}
var localproxy = normal;
var socksproxy = normal;
var bypass = normal;
var re_banner = /[/]([^/]*?)(advert|adimage|adframe|adserv|admentor|adview|viewad|banner|popunder|media\/subtract)s?/i;
var re_banner_white = /(load|feature=banner|upload_popup|popupplayer|popupmenu\.css|loginpopup|bannerbomb|popup\.lala\.com\/|css)/i;
var re_banner2 = /[/](?!no-ads)([^/]*?([^0-9/][^-/]))?(\b|[_])(ad[s]?)(\b|[_0-9])/i;
var re_adhost = /\b((new)?ad(?!(venture|vantage|am|mission|visor|alur|iumx|ult|vizia|obe|min|sl|d|olly|vance))|ads\b|adserv|pop(?!ular|corn|e)|click(?!redblue|andbuy|.reference)|cash(?!back)|banner|bans)/i;
var re_crud = /www\.\w+\.com\/image-\d+-\d+$/;
var re_whitelist_domains = /(^|\.)(adorama\.com|adafruit\..*|advogato\.org|adirondack\..*|kintera\.org|sprintpcs\.com|adp\.com|lego\.com|dell\.com|mozdev\.org|mozilla\.org|fidelity\.com|tirerack\.com|titantv\.com|lala\.com|sprint\.com|nextel\.com|verizon\.com|vupload\.facebook\.com|rit\.edu|mididb\.com|sony\.tv|market\.android\.com|weeklyad\.staples\.com|(code|plus|www|mail|apis|drive|docs)\.google\.com|googleadservices\.com|gmail\.com|gstatic\.com|thetvdb\.com|bits\te.wikimedia\.org|css\.slickdealscdn\.com|newegg\.com|androiddrawer\.com|addons\.cdn\.mozilla\.net|wsj\.com|massdrop\.com|cloudfront\.net|ad.*\.rackcdn\.com|bankofamerica\.com\|office\.com|smarttiles\.click|solaredge\.com|smartthings\.com)$/i;
var isActive = 1;

function FindProxyForURL(url, host) {
	if (DuoiDM(host, "no-ads.int")) {
		if (DuoiDM(url, "*/on*")) {
			isActive = 1;
		} else if (DuoiDM(url, "*/off*")) {
			isActive = 0;
		} else if (DuoiDM(url, "*no-ads.int/")) {
			alert("no-ads is " + (isActive ? "enabled" : "disabled") + ".\n" + url);
		} else {
			alert("no-ads unknown option.\n" + url);
		}
		return blackhole;
	}
	if (!isActive) {
		return bypass;
	}
	url = url.toLowerCase();
	host = host.toLowerCase();
	if (0) {
		return localproxy;
	}
	if (0) {
		return socksproxy;
	}
	if (0 ||
		re_whitelist_domains.test(host) ||
		DuoiDM(url, "*.apple.com/switch/ads/*") ||
		(host == "adf.ly" &&
			DuoiDM(url, "*/http:/*")) ||
		(host == "cdn.adf.ly" &&
			DuoiDM(url, "*js")) ||
		(host == "images.rottentomatoescdn.com" &&
			DuoiDM(url, "*/scripts?")) ||
		((DauDM(host, "wunderground.com") ||
				DauDM(host, "wund.com")
			) &&
			(DuoiDM(url, "*/cgi-bin/banner/ban/wxbanner*") ||
				DuoiDM(url, "*/weathersticker/*") ||
				DuoiDM(url, "*/cgi-bin/satbanner*")
			)
		)
	) {
		return normal;
	}
	if (0 ||
		DuoiDM(url, "*/favicon.*") ||
		DuoiDM(url, "*/animated_favicon*") ||
		(re_banner.test(url) && !re_banner_white.test(url)) ||
		re_banner2.test(url) ||
		re_adhost.test(host) ||
		DauDM(host, "addthis.com") ||
		DauDM(host, "adjust.com") ||
		DauDM(host, "admicro1.vcmedia.vn") ||
		DauDM(host, "adminplayer.sohatv.vn") ||
		DauDM(host, "adnetwork.vn") ||
		DauDM(host, "adsco.re") ||
		DauDM(host, "adservice.google.com") ||
		DauDM(host, "adservice.google.com.vn") ||
		DauDM(host, "adsrvr.org") ||
		DauDM(host, "adtima.vn") ||
		DauDM(host, "adtimaserver.vn") ||
		DauDM(host, "aerserv.com") ||
		DauDM(host, "alexametrics.com") ||
		DauDM(host, "alibaba.tanx.com") ||
		DauDM(host, "alibabadns.com") ||
		DauDM(host, "amazon-adsystem.com") ||
		DauDM(host, "ambientplatform.vn") ||
		DauDM(host, "amemv.com") ||
		DauDM(host, "anthill.vn") ||
		DauDM(host, "ants.vn") ||
		DauDM(host, "app-measurement.com") ||
		DauDM(host, "appier.net") ||
		DauDM(host, "appldnld.apple.com") ||
		DauDM(host, "apple-dns.net") ||
		DauDM(host, "apple.com") ||
		DauDM(host, "applovin.com") ||
		DauDM(host, "applvn.com") ||
		DauDM(host, "appnext.com") ||
		DauDM(host, "appsflyer.com") ||
		DauDM(host, "baidu.com") ||
		DauDM(host, "blueseed.tv") ||
		DauDM(host, "blueserving.com") ||
		DauDM(host, "byteoversea.com") ||
		DauDM(host, "byteoversea.com.edgekey.net") ||
		DauDM(host, "byteoversea.net") ||
		DauDM(host, "catch.gift") ||
		DauDM(host, "cloudmobi.net") ||
		DauDM(host, "crashlytics.com") ||
		DauDM(host, "criteo.com") ||
		DauDM(host, "criteo.net") ||
		DauDM(host, "doubleclick.net") ||
		DauDM(host, "dxprljqoay4rt.cloudfront.net") ||
		DauDM(host, "eclick.vn") ||
		DauDM(host, "elb097307-934924932.us-east-1.elb.amazonaws.com") ||
		DauDM(host, "events-endpoint-455714294.us-east-1.elb.amazonaws.com") ||
		DauDM(host, "events-endpoint-e-899663497.us-east-1.elb.amazonaws.com") ||
		DauDM(host, "fastly.net") ||
		DauDM(host, "geniusdisplay.com") ||
		DauDM(host, "go2cloud.org") ||
		DauDM(host, "google-analytics.com") ||
		DauDM(host, "googleadservices.com") ||
		DauDM(host, "googlesyndication.com") ||
		DauDM(host, "googletagmanager.com") ||
		DauDM(host, "googletagservices.com") ||
		DauDM(host, "gowadogo.com") ||
		DauDM(host, "hadarone.com") ||
		DauDM(host, "hotjar.com") ||
		DauDM(host, "icloud.com") ||
		DauDM(host, "islandmob.com") ||
		DauDM(host, "kunlunca.com") ||
		DauDM(host, "kunluncan.com") ||
		DauDM(host, "kunlungr.com") ||
		DauDM(host, "lavanetwork.net") ||
		DauDM(host, "leadzu.com") ||
		DauDM(host, "leadzutw.com") ||
		DauDM(host, "liftoff.io") ||
		DauDM(host, "llnwd.net") ||
		DauDM(host, "log.baomoi.com") ||
		DauDM(host, "loggerelb-845367233.ap-southeast-1.elb.amazonaws.com") ||
		DauDM(host, "logw311.ati-host.net") ||
		DauDM(host, "lucklayed.info") ||
		DauDM(host, "mbid.io") ||
		DauDM(host, "mesu-cdn.apple.com.akadns.net") ||
		DauDM(host, "mesu.apple.com") ||
		DauDM(host, "mesu.g.aaplimg.com") ||
		DauDM(host, "microadinc.com") ||
		DauDM(host, "moatads.com") ||
		DauDM(host, "moblin.com") ||
		DauDM(host, "mobusi.com") ||
		DauDM(host, "mopub.com") ||
		DauDM(host, "ocsp.apple.com") ||
		DauDM(host, "performanceonclick.com") ||
		DauDM(host, "personaly.click") ||
		DauDM(host, "platform.twitter.com") ||
		DauDM(host, "popads.net") ||
		DauDM(host, "production-adserver-666328397.us-east-1.elb.amazonaws.com") ||
		DauDM(host, "pstatp.com") ||
		DauDM(host, "query.yahoo.com") ||
		DauDM(host, "scontent.xx.fbcdn.net") ||
		DauDM(host, "scorecardresearch.com") ||
		DauDM(host, "serving-sys.com") ||
		DauDM(host, "snssdk.com") ||
		DauDM(host, "startappservice.com") ||
		DauDM(host, "syndication.twitter.com") ||
		DauDM(host, "tapad.com") ||
		DauDM(host, "udarem.com") ||
		DauDM(host, "umeng.com") ||
		DauDM(host, "unlimapps.com") ||
		DauDM(host, "valuepotion.com") ||
		DauDM(host, "www-google-analytics.l.google.com") ||
		DauDM(host, "www-googletagmanager.l.google.com") ||
		DauDM(host, "ymtrack6.co") ||
		DauDM(host, "ymtracking.com") ||
		DauDM(host, "yomedia.vn") ||
		DauDM(host, "zadn.vn") ||
		DauDM(host, "doubleclick.com") ||
		DauDM(host, "doubleclick.net") ||
		DauDM(host, "rpts.net") ||
		DauDM(host, "2mdn.net") ||
		DauDM(host, "2mdn.com") ||
		DauDM(host, "chartbeat.net") ||
		DauDM(host, "chitika.net") ||
		DauDM(host, "globaltrack.com") ||
		DauDM(host, "burstnet.com") ||
		DauDM(host, "adbureau.net") ||
		DauDM(host, "targetnet.com") ||
		DauDM(host, "humanclick.com") ||
		DauDM(host, "linkexchange.com") ||
		DauDM(host, "fastclick.com") ||
		DauDM(host, "fastclick.net") ||
		DuoiDM(host, "205.180.85.*") ||
		DauDM(host, "admonitor.com") ||
		DauDM(host, "focalink.com") ||
		DauDM(host, "websponsors.com") ||
		DauDM(host, "advertising.com") ||
		DauDM(host, "cybereps.com") ||
		DauDM(host, "postmasterdirect.com") ||
		DauDM(host, "mediaplex.com") ||
		DauDM(host, "adtegrity.com") ||
		DauDM(host, "bannerbank.ru") ||
		DauDM(host, "bannerspace.com") ||
		DauDM(host, "theadstop.com") ||
		DauDM(host, "l90.com") ||
		DauDM(host, "webconnect.net") ||
		DauDM(host, "avenuea.com") ||
		DauDM(host, "flycast.com") ||
		DauDM(host, "engage.com") ||
		DauDM(host, "imgis.com") ||
		DauDM(host, "datais.com") ||
		DauDM(host, "link4ads.com") ||
		DauDM(host, "247media.com") ||
		DauDM(host, "hightrafficads.com") ||
		DauDM(host, "tribalfusion.com") ||
		DauDM(host, "rightserve.net") ||
		DauDM(host, "admaximize.com") ||
		DauDM(host, "valueclick.com") ||
		DauDM(host, "adlibris.se") ||
		DauDM(host, "vibrantmedia.com") ||
		DauDM(host, "coremetrics.com") ||
		DauDM(host, "vx2.cc") ||
		DauDM(host, "webpower.com") ||
		DauDM(host, "everyone.net") ||
		DauDM(host, "zedo.com") ||
		DauDM(host, "bigbangmedia.com") ||
		DauDM(host, "ad-annex.com") ||
		DauDM(host, "iwdirect.com") ||
		DauDM(host, "adlink.de") ||
		DauDM(host, "bidclix.net") ||
		DauDM(host, "webclients.net") ||
		DauDM(host, "linkcounter.com") ||
		DauDM(host, "sitetracker.com") ||
		DauDM(host, "adtrix.com") ||
		DauDM(host, "netshelter.net") ||
		DauDM(host, "rn11.com") ||
		DauDM(host, "ru4.com") ||
		DauDM(host, "rightmedia.net") ||
		DauDM(host, "casalemedia.com") ||
		DauDM(host, "casalemedia.com") ||
		DauDM(host, "quantserve.com") ||
		DauDM(host, "quantcast.com") ||
		DauDM(host, "crwdcntrl.net") ||
		DauDM(host, "scorecardresearch.net") ||
		DauDM(host, "pubmatic.net") ||
		DauDM(host, "yumenetworks.com") ||
		DauDM(host, "brilig.com") ||
		DauDM(host, "perfb.com") ||
		DauDM(host, "blogads.com") ||
		DauDM(host, "fetchback.com") ||
		DauDM(host, "creatives.badongo.com") ||
		DauDM(host, "pmsrvr.com") ||
		DauDM(host, "trafficmack.com") ||
		DauDM(host, "commission-junction.com") ||
		DauDM(host, "qkimg.net") ||
		DauDM(host, "bluestreak.com") ||
		DauDM(host, "virtumundo.com") ||
		DauDM(host, "treeloot.com") ||
		DauDM(host, "memberprize.com") ||
		DauDM(host, "internetfuel.net") ||
		DauDM(host, "internetfuel.com") ||
		DauDM(host, "peoplecaster.com") ||
		DauDM(host, "cupidsdatabase.com") ||
		DauDM(host, "automotive-times.com") ||
		DauDM(host, "healthy-lifetimes.com") ||
		DauDM(host, "us-world-business.com") ||
		DauDM(host, "internet-2-web.com") ||
		DauDM(host, "my-job-careers.com") ||
		DauDM(host, "freeonline.com") ||
		DauDM(host, "exitfuel.com") ||
		DauDM(host, "netbroadcaster.com") ||
		DauDM(host, "spaceports.com") ||
		DauDM(host, "mircx.com") ||
		DauDM(host, "exitchat.com") ||
		DauDM(host, "atdmt.com") ||
		DauDM(host, "partner2profit.com") ||
		DauDM(host, "centrport.net") ||
		DauDM(host, "centrport.com") ||
		DauDM(host, "rampidads.com") ||
		DauDM(host, "dt07.net") ||
		DauDM(host, "criteo.com") ||
		DauDM(host, "bidswitch.com") ||
		DauDM(host, "commonwealth.riddler.com") ||
		DauDM(host, "banner.freeservers.com") ||
		DauDM(host, "usads.futurenet.com") ||
		DauDM(host, "banners.egroups.com") ||
		DauDM(host, "ngadclient.hearme.com") ||
		DauDM(host, "affiliates.allposters.com") ||
		DauDM(host, "adincl.go2net.com") ||
		DauDM(host, "webads.bizservers.com") ||
		DauDM(host, "addserv.com") ||
		DauDM(host, "falkag.net") ||
		DauDM(host, "buysellads.com") ||
		DauDM(host, "dtscout.com") ||
		DauDM(host, "tynt.com") ||
		(host == "promote.pair.com") ||
		DauDM(host, "interclick.com") ||
		DauDM(host, "travelscream.com") ||
		(DauDM(host, "mktw.net") &&
			!DuoiDM(url, "*/css/*")) ||
		DauDM(host, "cjt1.net") ||
		DauDM(host, "bns1.net") ||
		DauDM(host, "image.ugo.com") ||
		DauDM(host, "mediamgr.ugo.com") ||
		DauDM(host, "zonecms.com") ||
		DauDM(host, "zoneld.com") ||
		DauDM(host, "atwola.com") ||
		DauDM(host, "toolbar.aol.com") ||
		DauDM(host, "adsdk.com") ||
		(DauDM(host, "overstock.com") &&
			DuoiDM(url, "*/linkshare/*")) ||
		(DauDM(host, "supermediastore.com") &&
			DuoiDM(url, "*/lib/supermediastore/*")) ||
		(DauDM(host, "shop4tech.com") &&
			DuoiDM(url, "*/assets/*")) ||
		(DauDM(host, "softwareandstuff.com") &&
			DuoiDM(url, "*/media/*")) ||
		(DauDM(host, "buy.com") &&
			DuoiDM(url, "*/affiliate/*")) ||
		(DauDM(host, "pdaphonehome.com") &&
			(DuoiDM(url, "*/pocketpcmagbest.gif") ||
				DuoiDM(url, "*/link-msmobiles.gif"))) ||
		(DauDM(host, "ppc4you.com") &&
			DuoiDM(url, "*/ppc_top_sites.gif")) ||
		(DauDM(host, "freewarepalm.com") &&
			DuoiDM(url, "*/sponsors/*")) ||
		DauDM(host, "travelscream.com") ||
		DauDM(host, "traveldeals.com") ||
		DauDM(host, "traveldeals.wunderground.com") ||
		DauDM(host, "as5000.com") ||
		(DauDM(host, "mc.dailymotion.com") &&
			DuoiDM(url, "*/masscast/*")) ||
		(host == "downloads.thespringbox.com") ||
		DauDM(host, "outbrain.com") ||
		DauDM(host, "marketgid.com") ||
		DauDM(host, "mgid.com") ||
		DauDM(host, "rtbsystem.com") ||
		DauDM(host, "directrev.com") ||
		DauDM(host, "az708531.vo.msecnd.net") ||
		DauDM(host, "remotead.cnet.com") ||
		DauDM(host, "1st-dating.com") ||
		DauDM(host, "mousebucks.com") ||
		DauDM(host, "yourfreedvds.com") ||
		DauDM(host, "popupsavings.com") ||
		DauDM(host, "popupmoney.com") ||
		DauDM(host, "popuptraffic.com") ||
		DauDM(host, "popupnation.com") ||
		DauDM(host, "infostart.com") ||
		DauDM(host, "opupad.net") ||
		DauDM(host, "usapromotravel.com") ||
		DauDM(host, "goclick.com") ||
		DauDM(host, "trafficwave.net") ||
		DauDM(host, "popupad.net") ||
		DauDM(host, "paypopup.com") ||
		DauDM(host, "trafficstars.com") ||
		DauDM(host, "onclkds.com") ||
		DauDM(host, "vipcpms.com") ||
		DauDM(host, "putags.com") ||
		DauDM(host, "greenreaper.com") ||
		DauDM(host, "spewey.com") ||
		DauDM(host, "englishharbour.com") ||
		DauDM(host, "casino-trade.com") ||
		DauDM(host, "got2goshop.com") ||
		DauDM(host, "addynamix.com") ||
		DauDM(host, "trafficmp.com") ||
		DauDM(host, "makingmoneyfromhome.net") ||
		DauDM(host, "leadcart.com") ||
		DauDM(host, "euros4click.de") ||
		DauDM(host, "power-mark.com") ||
		DauDM(host, "webtrendslive.com") ||
		DauDM(host, "wtlive.com") ||
		DauDM(host, "imrworldwide.com") ||
		DuoiDM(host, "66.40.16.*") ||
		DauDM(host, "web-stat.com") ||
		DauDM(host, "superstats.com") ||
		DauDM(host, "allhits.ru") ||
		DauDM(host, "list.ru") ||
		DauDM(host, "counted.com") ||
		DauDM(host, "rankyou.com") ||
		DauDM(host, "clickcash.com") ||
		DauDM(host, "clickbank.com") ||
		DauDM(host, "paycounter.com") ||
		DauDM(host, "cashcount.com") ||
		DauDM(host, "clickedyclick.com") ||
		DauDM(host, "clickxchange.com") ||
		DauDM(host, "sitestats.com") ||
		DauDM(host, "site-stats.com") ||
		DauDM(host, "hitbox.com") ||
		DauDM(host, "exitdirect.com") ||
		DauDM(host, "realtracker.com") ||
		DauDM(host, "etracking.com") ||
		DauDM(host, "livestat.com") ||
		DauDM(host, "spylog.com") ||
		DauDM(host, "freestats.com") ||
		DauDM(host, "addfreestats.com") ||
		DauDM(host, "topclicks.net") ||
		DauDM(host, "mystat.pl") ||
		DauDM(host, "hitz4you.de") ||
		DauDM(host, "hitslink.com") ||
		DauDM(host, "thecounter.com") ||
		DauDM(host, "roiservice.com") ||
		DauDM(host, "overture.com") ||
		DauDM(host, "xiti.com") ||
		DauDM(host, "cj.com") ||
		DauDM(host, "anrdoezrs.net") ||
		DauDM(host, "hey.it") ||
		DauDM(host, "ppctracking.net") ||
		DauDM(host, "darkcounter.com") ||
		DauDM(host, "2o7.com") ||
		DauDM(host, "2o7.net") ||
		DauDM(host, "gostats.com") ||
		DauDM(host, "everstats.com") ||
		DauDM(host, "onestat.com") ||
		DauDM(host, "statcounter.com") ||
		DauDM(host, "trafic.ro") ||
		DauDM(host, "exitexchange.com") ||
		DauDM(host, "clicktorrent.info") ||
		DauDM(host, "ventimedia.com") ||
		DauDM(host, "flashmediaportal.com") ||
		DauDM(host, "clictrackr.com") ||
		DauDM(host, "revivestar.com") ||
		DauDM(host, "clickability.com") ||
		DauDM(host, "savethis.com") ||
		DauDM(host, "extremetracking.com") ||
		DauDM(host, "extreme-dm.com") ||
		DauDM(host, "pop6.com") ||
		DauDM(host, "medleyads.com") ||
		DauDM(host, "news6insider.com") ||
		DauDM(host, "cw.cm") ||
		DauDM(host, "co.cc") ||
		DauDM(host, "hideus.in") ||
		DauDM(host, "addthis.com") ||
		DauDM(host, "popadscdn.net") ||
		DauDM(host, "netster.com") ||
		DauDM(host, "searchmarketing.com") ||
		DauDM(host, "friendgreetings.com") ||
		DauDM(host, "permissionedmedia.com") ||
		DauDM(host, "searchbarcash.com") ||
		DauDM(host, "shipboardserviceberrysiltstone.info") ||
		DauDM(host, "how2update4u.com") ||
		DauDM(host, "travelwednesday.com") ||
		DauDM(host, "masterclassfoods.com") ||
		DauDM(host, "liveadexchanger.com") ||
		DauDM(host, "betterads.co") ||
		DauDM(host, "livegoal.net") ||
		DauDM(host, "techsupport-verizon.com") ||
		DauDM(host, "avstats.com") ||
		DauDM(host, "zoomerang.com") ||
		DauDM(host, "quizrocket.com") ||
		(DauDM(host, "amazonaws.com") &&
			DuoiDM(url, "*/udm_img/mid*")) ||
		DauDM(host, "aceshigh.com") ||
		DauDM(host, "idealcasino.net") ||
		DauDM(host, "casinobar.net") ||
		DauDM(host, "casinoionair.com") ||
		(DauDM(host, "go2net.com") &&
			DuoiDM(url, "*adclick*")) ||
		DauDM(host, "licensed-collectibles.com") ||
		DauDM(host, "webdesignprofessional.com") ||
		DauDM(host, "gator.com") ||
		((DauDM(host, "pics.ebay.com") ||
				DauDM(host, "pics.ebaystatic.com")) &&
			DuoiDM(url, "*/pics/mops/*/*[0-9]x[0-9]*")) ||
		(DauDM(host, "ebayobjects.com") &&
			DuoiDM(url, "*search/keywords*")) ||
		DauDM(host, "admarketplace.com") ||
		DauDM(host, "admarketplace.net") ||
		(DauDM(host, "ezboard.com") &&
			DuoiDM(url, "*/bravenet/*")) ||
		(DauDM(host, "bravenet.com") &&
			(DuoiDM(host, "*counter*") ||
				DuoiDM(url, "*/jsbanner*") ||
				DuoiDM(url, "*/bravenet/*"))
		) ||
		((DauDM(host, "geo.yahoo.com") ||
				DauDM(host, "geocities.com")) &&
			(
				DuoiDM(url, "*/toto?s*") ||
				DuoiDM(url, "*geocities.com/js_source*") ||
				DauDM(host, "visit.geocities.com"))
		) ||
		(DauDM(host, "yimg.com") &&
			!(DuoiDM(url, "*yimg.com/a/i/*") ||
				DuoiDM(url, "*yimg.com/a/lib/*") ||
				DuoiDM(url, "*yimg.com/a/combo*")) &&
			(DuoiDM(url, "*yimg.com/a/*") ||
				DuoiDM(url, "*yimg.com/*/adv/*") ||
				DuoiDM(url, "*yimg.com/*/promotions/*"))
		) ||
		DauDM(host, "qz3.net") ||
		DauDM(host, "eyewonder.com") ||
		DauDM(host, "buzzcity.com") ||
		(DauDM(host, "fortunecity.com") &&
			(DuoiDM(url, "*/js/adscript*") ||
				DuoiDM(url, "*/js/fctrack*"))
		) ||
		(DauDM(host, "zdnet.com") &&
			(DauDM(host, "ads3.zdnet.com") ||
				host == "gserv.zdnet.com" ||
				DuoiDM(url, "*/texis/cs/ad.html") ||
				DuoiDM(url, "*/adverts"))
		) ||
		(host == "dw.com.com" || host == "mads.com.com") ||
		(DauDM(host, "com.com") &&
			(host == "dw.com.com" ||
				host == "mads.com.com")) ||
		(DauDM(host, "nytimes.com") &&
			DuoiDM(url, "*/adx/*")
		) ||
		DauDM(host, "unicast.net") ||
		DauDM(host, "reporting.net") ||
		DauDM(host, "affliate.net") ||
		(DauDM(host, "akamai.net") &&
			DuoiDM(url, "*.affiliate.net/*")) ||
		(DauDM(host, "infospace.com") &&
			DuoiDM(url, "*/goshopping/*")) ||
		DauDM(host, "webmarket.com") ||
		DauDM(host, "shopping.dogpile.com") ||
		DauDM(host, "information.gopher.com") ||
		(DauDM(host, "about.com") &&
			(0 ||
				DuoiDM(url, "*/sprinks/*") ||
				DuoiDM(url, "*about.com/0/js/*") ||
				DuoiDM(url, "*about.com/f/p/*"))
		) ||
		(DauDM(host, "dell.com") &&
			DuoiDM(url, "*/images/affiliates/*")
		) ||
		(DauDM(host, "ifilm.com") &&
			(DuoiDM(url, "*/partners/*") ||
				DuoiDM(url, "*/redirect*"))
		) ||
		((DauDM(host, "tomshardware.com") ||
				DuoiDM(host, "216.92.21.*")) &&
			(DuoiDM(url, "*/cgi-bin/banner*") ||
				DuoiDM(url, "*/cgi-bin/bd.m*") ||
				DuoiDM(url, "*/images/banner/*"))
		) ||
		DuoiDM(url, "*mapsonus.com/ad.images*") ||
		DauDM(host, "adfu.blockstackers.com") ||
		(DauDM(host, "slashdot.org") &&
			(
				DuoiDM(url, "*/slashdot/pc.gif*") ||
				DuoiDM(url, "*/pagecount.gif*") ||
				DuoiDM(url, "*/adlog.pl*"))
		) ||
		DauDM(host, "googlesyndication.com") ||
		(DauDM(host, "aintitcool.com") &&
			(
				DuoiDM(url, "*/newline/*") ||
				DuoiDM(url, "*/drillteammedia/*") ||
				DuoiDM(url, "*/foxsearchlight/*") ||
				DuoiDM(url, "*/media/aol*") ||
				DuoiDM(url, "*swf"))
		) ||
		(DauDM(host, "staples.com") &&
			DuoiDM(url, "*/pixeltracker/*")
		) ||
		DauDM(host, "pt.crossmediaservices.com") ||
		(DauDM(host, "officemax.com") &&
			DuoiDM(url, "*/affart/*")) ||
		(host == "hera.hardocp.com") ||
		DuoiDM(url, "*/onlineads/*") ||
		(DauDM(host, "fatwallet.com") &&
			DuoiDM(url, "*/js/*")) ||
		DauDM(host, "promo.search.com") ||
		(DauDM(host, "imdb.com") &&
			(DuoiDM(url, "*/photos/cmsicons/*") ||
				DuoiDM(url, "*/icons/*/celeb/*") ||
				DuoiDM(url, "*.swf"))
		) ||
		DauDM(host, "kliptracker.com") ||
		DauDM(host, "klipmart.com") ||
		host == "avpa.javalobby.org" ||
		host == "spinbox.techtracker.com" ||
		host == "rcm.amazon.com" ||
		(DauDM(host, "megaupload.com") && (
			DuoiDM(url, "*/aff*.php") ||
			DuoiDM(url, "*/mrads/*")
		)) ||
		DauDM(host, "megaflirt.com") ||
		DauDM(host, "ifriends.com") ||
		((DauDM(host, "gamecopyworld.com") ||
			DauDM(host, "linkworld.com") ||
			DauDM(host, "filetarget.com")) && (
			DuoiDM(url, "*/ii/*") ||
			DuoiDM(url, "*/@_eve*")
		)) ||
		DauDM(host, "lookoutmovies.com") ||
		DauDM(host, "tube-player.com") ||
		re_crud.test(url) ||
		DauDM(host, "taboola.com") ||
		DauDM(host, "taboolasyndication.com") ||
		DauDM(host, "disqus.com") ||
		DauDM(host, "revcontent.com") ||
		(DauDM(host, "register.com") &&
			(DuoiDM(url, "*.js") ||
				DuoiDM(host, "searchtheweb*") ||
				DuoiDM(host, "futuresite*"))
		) ||
		DauDM(host, "oingo.com") ||
		DauDM(host, "namingsolutions.com") ||
		DauDM(host, "coremetrics.com") ||
		DauDM(host, "firehunt.com") ||
		DauDM(host, "appliedsemantics.com") ||
		(host == "216.216.246.31") ||
		(host == "216.66.21.35") ||
		DauDM(host, "avsads.com") ||
		DauDM(host, "search411.com") ||
		(DauDM(host, "palmgear.com") &&
			(DuoiDM(url, "*/adsales/*") ||
				DuoiDM(url, "*/emailblast*"))
		) ||
		DauDM(host, "prreleases.net") ||
		DauDM(host, "porntrack.com") ||
		DauDM(host, "sexe-portail.com") ||
		DauDM(host, "sextracker.com") ||
		DauDM(host, "sexspy.com") ||
		DauDM(host, "offshoreclicks.com") ||
		DauDM(host, "exxxit.com") ||
		DauDM(host, "private-dailer.biz") ||
		DuoiDM(url, "*retestrak.nl/misc/reet.gif") ||
		DuoiDM(url, "*dontstayin.com/*.swf") ||
		DuoiDM(url, "*pornotube.com/textads*") ||
		DauDM(host, "xratedbucks.com") ||
		DauDM(host, "hornymatches.com") ||
		DauDM(host, "hornymatches.com") ||
		DauDM(host, "etology.com") ||
		DauDM(host, "streamray.com") ||
		DauDM(host, "awempire.com") ||
		DauDM(host, "promos.fling.com") ||
		DauDM(host, "pussygreen.com") ||
		DauDM(host, "livejasmin.com") ||
		DauDM(host, "imlive.com") ||
		DauDM(host, "ihookup.com") ||
		(DauDM(host, "shufuni.com") &&
			(DuoiDM(url, "*images/activepage*"))
		)
	) {
		return blackhole;
	} else {
		return normal;
	}
}
if (0) {
	alert("no-ads.pac: LOADED:\n" +
		"	version:	" + noadsver + "\n" +
		"	blackhole:	" + blackhole + "\n" +
		"	normal:		" + normal + "\n" +
		"	localproxy:	" + localproxy + "\n" +
		"	bypass:		" + bypass + "\n"
	);
}

function alertmatch(str) {
	alert(str);
	return 1;
}

function DauDM(host, domain) {
	if (host.length > domain.length) {
		return (host.substring(host.length - domain.length - 1) == "." + domain);
	}
	return (host == domain);
}
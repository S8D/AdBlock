//////////////////////////////////////////////////////////////////////////////
//
// John's No-ADS proxy auto configuration script
//	http://www.schooner.com/~loverso/no-ads/
//	loverso@schooner.com
//	Questions/help web forum at http://www.network54.com/Hide/Forum/223428
//
// Copyright 1996-2004, John LoVerso.  All Rights Reserved.
//
//	Permission is given to use and distribute this file, as long as this
//	copyright message and author notice are not removed.
//
//	No responsibility is taken for any errors on inaccuracies inherent
//	either to the comments or the code of this program, but if reported
//	to me, then an attempt will be made to fix them.
//
// ("no monies exchanged" in Copyright clause removed 11/2001)
//
var noadsver = "$Id: no-ads.pac,v 6.3 2017/09/28 17:08:39 loverso Exp loverso $";

// ****
// **** If you do not use a proxy to access the Internet, then the following
// **** line is already fine.
// ****
// **** If you use an a proxy to access the Internet, as required by your
// **** ISP or firewall, then change the line below, replacing
// **** "DIRECT" with "PROXY hostname:port", using the correct hostname:port
// **** for your proxy server.
// ****
var normal = "DIRECT";

// ***
// *** If you are not using a blackhold proxy, then you can leave this
// *** setting as is.
// ***
// *** Otherwise, update the next line with the correct hostname:port
// *** of your blackhole proxy server.  If you are using Larry Wang's
// *** BHP for Windows, you need to change the "0.0.0.0" to "127.0.0.1"
// ***
//var blackhole = "PROXY 0.0.0.0:3421";
var blackhole = "PROXY 255.255.255.0:3421";
// Safari/MacOS needs the old value
if (typeof(navigator) != "undefined"
	&& navigator.appVersion.indexOf("Mac") != -1) {
    blackhole = "PROXY 0.0.0.0:3421";
}


// ***
// *** If you need a different proxy to access local/internal hosts vs.
// *** the rest of the Internet, set 'localproxy' to that value.  Otherwise,
// *** 'localproxy' defaults to the same value as 'normal', so you do
// *** not need to change anything in the normal case.
// ***
// *** Some typical cases:
// ***	- 'normal' might be one proxy, and 'localproxy' might be another
// ***	- 'normal' might be a proxy, and 'localproxy' might be "DIRECT"
// ***
// *** You will also need to change the LOCAL section below by adding
// *** rules to match your local/internal hosts.
// ***
var localproxy = normal;

// ***
// *** If you need a socks proxy for some hosts, set it here.
// *** You will need to change the SOCKS section below.
var socksproxy = normal;

// ***
// *** 'bypass' is the preferred proxy setting for when no-ads is inactive.
// *** Either use '= normal' or '= localproxy' (or perhaps just "DIRECT").
// *** This only matters when you need to use a localproxy.
// *** (You probably don't need to care about this)
// ***
var bypass = normal;

///////////////////////////////////////////////////////////////////////////////
//
// This simple kludge uses a mechanism built into most browsers (IE, Netscape,
// Mozilla, Firefox, and Opera) on most platforms to block connections to
// banner ad servers.
//
// This mechanism uses the "proxy auto configuration" to blackhole requests
// to load ad images without forcing all your traffic through an ad-blocking
// proxy server.  Of course, unlike ad-blocking proxy servers, this does not
// otherwise not strip cookies.
//
// "Proxy auto configuration" invokes the JavaScript FindProxyForURL function
// below each time your browser requests a URL.  This works even if you have
// JavaScript otherwise disabled in your browser!  (Which you should!)
//

//
// Send me your additions or comments.  I'll credit you in the file.
// (But I've removed all email addresses to stop spam harvesters).
//


///////////////////////////////////////////////////////////////////////////////
//
// These are the basic steps needed to use "no-ads.pac".
// Detailed instructions follow below!
//
// 1. Save this as a file (no-ads.pac) on your local disk
//    (or, add it to your home page, if you have one)
// 2. Select a no-ads "blackhole".
// 3. Configure your browser to use this file as it's auto proxy configuration.
// 4. Clear your browser's cache
//    (or else it may still show you ads it has saved on your disk).
//


///////////////////////////////////////////////////////////////////////////////
//
// 1. SAVE THIS FILE
//
// Copy this file to your local machine; use your home directory (UNIX)
// or your Desktop or C:\ directory (Windows).
//



///////////////////////////////////////////////////////////////////////////////
//
// 2. SELECT A NO-ADS BLACKHOLE
//
// You can skip this section if you are using any version of Internet Explorer.
// You can also skip this section for Netscape 7.1, Mozilla 1.4, or
// Firefox 1.0 (or later), as they include PAC failover support (but do
// read the note in section "2a" below).
//
//
// The basic trick of no-ads is to match the site or URL of annoying web content
// and tell your browser to use a proxy that will deny loading of that resource
// (image, page, etc).
//
// A "black-hole" proxy server is one that always denies loading a web page.
// ("send it off to a blackhole").
//
// When you initially get "no-ads.pac", it is using this as the blackhole:
//
//	"PROXY 0.0.0.0:3421"
//
// This says to use the local host at a port which nothing should be listening
// on.  Thus, this is "a server that doesn't repond."
//
// This is a good default for all systems, and especially Windows.
// However, if you are using the Blackhole Proxy Server on Windows, 
// be sure to change it to "PROXY 127.0.0.1:3421"
//
//
// Some possibilities for the blackhole:
//
//	a. A server that doesn't respond.
//
//		*** This works for all versions of Internet Explorer.
//		*** This mostly works for Mozilla, Firefox, and Netscape.
//
//		If you do nothing, then this is configured to direct annoying
//		content to the proxy running on your own host at port 3421.
//		Since you shouldn't have anything running on that port, that
//		connection will timeout and the annoying content will never be
//		loaded.
//
//		Older versions of Netscape wait to connect to the proxy server
//		(usually it needs to load part of the image to layout the web
//		page), and then asks if you want to disable the proxy that
//		doesn't answer.
//
//		Older versions of Mozilla will give an alert saying it couldn't
//		connect to the proxy server.
//
//		Mozilla 1.4+, Firefox 1.0+ and Netscape 7.1 will only give
//		you this alert if the whole page being display is blocked,
//		rather than just an image on that page.  Thus, I still
//		recommend a blackhole proxy even though it isn't needed.
//
//		Opera will disable your auto proxy config if the proxy server
//		doesn't respond.
//
//		IE doesn't care that the proxy server isn't responding.  As
//		this avoids a connection for annoying content, it is fastest.
//
//	b. A simple, blackhole server
//
//		When needed, I run a simple "server" at port 3421 that denies
//		all requests.  Some options you can use for this:
//
//		- On Windows, you can try Larry Wang's black-hole proxy program:
//
//			http://leisuresuit10.tripod.com/BlackHoleProxy/
//
//		  I can not vouch that his binaries are virus free, but he does
//		  offer the source code.
//
//		- I use this shell script on UNIX; it is invoked via inetd.
//		  /usr/local/lib/noproxy:
//
//			#!/bin/sh
//			read a
//			read b
//			echo HTTP/1.0 501 No Ads Accepted
//			echo ""
//			exit
//
//		  Add this line to inetd.conf ('kill -HUP' inetd afterwards):
//
//		    3421 stream tcp nowait nobody /usr/local/lib/noproxy noproxy
//
//		  This simple script doesn't work on Linux because of the
//		  (IMHO) broken way it's TCP stack works.  See the bottom of
//		  http://www.schooner.com/~loverso/no-ads/ for a complete copy
//		  of the `noproxy' shell script.
//
//		  If always exec'ing a shell was expensive on your computer
//		  (it isn't on mine), then you could use a "wait"-style Perl
//		  script that would accept() incoming connections.
//
//		- Sean Burke has a black-hole proxy written in Perl script:
//
//		  http://www.speech.cs.cmu.edu/~sburke/pub/black_hole_http_server.pl
//		  (This is a standalone server, not run from inetd).
//
//	e. A trick: use an HTTP/1.0 non-proxy server
//
//		An HTTP/1.0 non-proxy server will return a 501 error when
//		given a proxy request.  Thus, just use the address of your
//		local intranet web server as your blackhole PROXY.
//		The downside of this is that it will probably also log an
//		error, which wastes a small amount of resources.
//
//	***
//	*** Be sure to update the "blackhole" variable above with a setting of
//	*** "PROXY hostname:port" that matches your blackhole server!!
//	***
//
//	***
//	*** If you already use a proxy server to access the WWW,
//	*** change the "normal" variable above from "DIRECT" to
//	*** be "PROXY proxy:port" to match your proxy server.
//	***


///////////////////////////////////////////////////////////////////////////////
//
// 3. TO CONFIGURE YOUR BROWSER
//
// The Proxy Auto Configuration file can be either on the local disk or
// accessed from a web server, with the following constraints:
//
//	a. IE4 can only load the PAC from a web server (http:// URL)
//	b. Netscape, Mozilla, Firefox and IE (5 or later) can load the
//	   PAC from anywhere.
//	c. Netscape, Mozilla, Firefox and (probably) Opera require the correct
//	   MIME type when loading the PAC from a web server.
//
//
// To set the Proxy Auto Configuration with Netscape, Mozilla, or Firefox:
//
//   1. Enable Proxy Auto Config:
//
//	For Netsacpe/Mozilla:
//
//		Open "Edit->Preferences"
//		Select "Advanced"
//		Select "Proxies"
//
//	For Firefox (1.0):
//
//		Open "Tools->Options"
//		Select "Coonection Settings" on the General tab:
//
//	Select the "Auto proxy configuration URL" option.
//	Enter URL or path of where you've saved this file, such as:
//
//		http://yourserver/no-ads.pac
//
//	If you place this on your local disk, you should use a
//	file: URL such as:
//
//		file:/home/loverso/no-ads.pac			(UNIX)
//		file:///c:/windows/desktop/no-ads.pac		(Windows)
//
//	(file:/ and file:// will work in Mozilla, but file:/// is correct
//	required for Firefox)
//
//   2. If you are serving this from a web server, these browsers require
//      the correct MIME type on the file before using it.  You must configure
//      your web server to provide a "application/x-ns-proxy-autoconfig"
//	MIME type.
//
//      a. For Apache, name the file with a ".pac" extension and add this
//	   line to the http.conf (or the .htaccess file in the same directory):
//
//		AddType application/x-ns-proxy-autoconfig .pac
//
//      b. For IIS (instructions from Kevin Roth)
//
//	   Open Internet Services Manager
//	   Right click on the web site (or directory) you wish to change.
//	   Choose Properties
//	   Click the "HTTP Headers" tab
//	   Click the "File Types" button in the "MIME Map" section
//	   Click the "New Type..." button
//	   Enter "pac" for "Associated Extension"
//	   Enter "application/x-ns-proxy-autoconfig" for "Content Type (MIME)"
//	   Click OK to close the Add type dialog, the MIME types dialog,
//		and the main properties dialog.
//
//      (This is definately needed for NS, but not for IE)
//
//
// To set the Proxy Auto Configuration with IE:
//
//   1. Enable Proxy Auto Config:
//
//	Open "Tools->Internet Options"
//	Select "Connections" tab
//	Click "LAN Settings"
//		or Choose an entry from "Dial-up settings" and click "Settings"
//
//	On the settings dialog, select "Use automatic configuration script"
//	Enter the URL of this file in Address field.
//
//		http://yourserver/no-ads.pac
//		file:///c:/windows/desktop/no-ads.pac		(Windows)
//
//	You can only use a file: URL with IE5 (or later).
//	("file:///" with with IE versions after 5.0 SP2)
//
//   2. Fix Security Settings (IMPORTANT):
//
//	Select "Security" tab
//	Select "Local intranet"
//	Click "Sites" box
//	Unselect "include all sites that bypass the proxy server" option
//
//   3. Disable "Auto Proxy Caching" (IMPORTANT):
//      (thanks to Kevin Roth for alerting me of this!)
//
//	IE contains a proxy result caching mechanism that will defeat the
//	ability to block servers that server both ad and non-ad content.
//	To prevent this, add the registry key described in this MS KB article:
//
//		http://support.microsoft.com/?kbid=271361
//
//	You can do so by downloading this file and clicking on it to load
//	it into the registry.  This must be done on a per-user basis.
//	http://www.schooner.com/~loverso/no-ads/IE-no-auto-proxy-cache.reg
//
//   IE doesn't currently check the MIME type of the PAC file.
//
//   To see some notes from MS on PAC in IE, see
//	http://msdn.microsoft.com/library/periodic/period99/faq0599.htm
//	(they seem to have removed this URL)
//
//
// To set the Proxy Auto Configuration with Opera 6 (6.04 on Windows tested):
//
//   1. Enable Proxy Auto Config:
//	Open the Preferences (Alt-P)
//	Select "Network"
//	Click the "Proxy servers" box
//	Select "Use automatic proxy configuration"
//	Enter the URL of this file as
//
//		http://yourserver/no-ads.pac
//		file://c:/windows/desktop/no-ads.pac
//
//	(file:/// might be needed; I've not tested Opera lately)
//
//   2. You must use a blackhole proxy for Opera (it will not work with an
//	address of a server that does not respond).
//
//   3. Be sure to clear the cache and exit/restart Opera.
//


///////////////////////////////////////////////////////////////////////////////
//
// 4. CLEAR YOUR BROWSER'S CACHE
//
// For Internet Explorer:
//
//	Open "Tools->Internet Options"
//	Select "Delete Files" under "Temporary Internet Files"
//	Click "OK"
//
// For Mozilla/Netscape Navigator:
//
//	Open "Edit->Preferences"
//	Select "Advanced"
//	Select "Proxies"
//	Click "Clear Disk Cache"
//	Click "Clear Memory Cache"
//
// For Firefox:
//
//	Open "Tools->Options"
//	Select the "Privay" tab
//	Scroll down or go to the "Cache" section
//	Click "Clear"
//
// For Opera:
//
//	Open "File->Preferences"
//	Select "History and cache"
//	Click "Empty now"
//


///////////////////////////////////////////////////////////////////////////////
//
// To see the definition of this page's JavaScript contents, see
//
//	http://home.netscape.com/eng/mozilla/2.0/relnotes/demo/proxy-live.html
//
// Microsoft includes this in their KB article:
//
//	http://support.microsoft.com/support/kb/articles/Q209/2/66.ASP
//
// Special PAC functions:
// Hostname:
//	isPlainHostName(host)
//	dnsDomainIs(host, domain)
//	localHostOrDomainIs(host, hostdom)
//	isResolvable(host)
//	isInNet(host, pattern, mask)
// Utility:
//	dnsResolve(host)
//	myIpAddress()
//	dnsDomainLevels(host)
// URL:
//	shExpMatch(str, shexp)
// Time:
//	weekdayRange(wd1, wd2, gmt)
//	dateRange(...)
//	timeRange(...)
//
// Other functions and methods that may work:
//	http://developer.netscape.com/docs/manuals/communicator/jsref/win1.htm
//	Note that "alert()" only works with Netscape4 and IE, and Mozilla 1.4+.
//
// NOTE:
//	isInNet() will resolve a hostname to an IP address, and cause
//	hangs on Mozilla/Firefox.  Currently, these are stubbed out and replaced
//	with shExpMatch(host, "a.b.c.*"), which doesn't do the same thing,
//	but is sufficient for these purposes.
//
// Additional Mozilla/Firefox comments:
//
//	All the above PAC functions are implemented in JavaScript,
//	and are added to the body of your PAC file when it is loaded.
//	See the "components/nsProxyAutoConfig.js" browser install
//	directory.
//
//	- shExpMatch() is implemented as three pattern.replaces()
//		 followed by a call to RegExp()  (SLOW)
//	- isPlainHostname() just checks for lack of "." in the string
//	- dnsDomainIs() just matches strings exactly
//	- alert() is bound to this.proxyAlert(), which displays a message
//		in the JavaScript console window

///////////////////////////////////////////////////////////////////////////////
//
// Regular Expressions
//
// Angus Turnbull pointed out the JavaScript 1.2 RE operators to me.
// These should work in NS4 and IE4 (or later), but I have only tested on
// Mozilla (1.3), IE5.5, and IE6.  PLEASE TELL ME IF IT WORKS FOR YOU!
//
// A good introduction is at:
//	http://www.evolt.org/article/Regular_Expressions_in_JavaScript/17/36435/
// Some references:
//	(old Netscape documentation is gone)
//	http://devedge.netscape.com/library/manuals/2000/javascript/1.5/reference/regexp.html
//	http://developer.netscape.com/docs/manuals/js/client/jsref/regexp.htm
//	http://www.webreference.com/js/column5/
//	http://msdn.microsoft.com/library/default.asp?url=/library/en-us/script56/html/js56jsobjRegExpression.asp
//	http://msdn.microsoft.com/library/default.asp?url=/library/en-us/script56/html/js56jsgrpRegExpSyntax.asp
// Real-time evaluator:
//	http://www.cuneytyilmaz.com/prog/jrx/
//
// I'm slowly replacing multiple glob patterns with regexps.
// By using RE literals of /.../ rather than the constructor 'new RegExp()',
// the regexps should be compiled as no-ads.pac is loaded.
// 
// Important notes:
// -	if using the constructor, \ needs to be quoted; thus "\\." is used
//	to match a literal '.'.  In the RE literal form, I need to end up
//	quoting any / for a URL path.
// -    Avoid these for now; they are broken or not supported in "older"
//	browsers such as NS4 and IE4:
//	- look-aheads (?=pat)
//	- non-greedy ? - a ? that follows *,+,?, and {}; (s)? is NOT non-greedy
//

// matches several common URL paths for ad images:
// such as: /banner/ /..._banner/ /banner_...
// but matches several words and includes plurals
// and catch .../!ad...

//var re_banner = /\/(.*_){0,1}(ad|advert|adverts?|adimage|adframe|adserver|admentor|adview|banner|bannerimg|popup|popunder)(s)?[_.\/]/i;
//var re_banner = /(\b|[_0-9])(ad|advert(ising)?|adimage|adframe|adserv|admentor|adview|banner|popup|popunder)s?(\b|[_0-9])/i;
//var re_banner = /(\b|[_])(ad|advert(ising)?|adimage|adframe|adserv|admentor|adview|banner|popup|popunder)s?(\b|[_0-9])/i;
// var re_banner = /[/](?!no-)([^/]*?)(\b|[_])(ad|advert(ising)?|adimage|adframe|adserv|admentor|adview|banner|popup|popunder)s?(\b|[_0-9])/i;

var re_banner  = /[/]([^/]*?)(advert|adimage|adframe|adserv|admentor|adview|viewad|banner|popunder|media\/subtract)s?/i;

var re_banner_white = /(load|feature=banner|upload_popup|popupplayer|popupmenu\.css|loginpopup|bannerbomb|popup\.lala\.com\/|css)/i;

// try to not block guids containing '...-ad...'
var re_banner2 = /[/](?!no-ads)([^/]*?([^0-9/][^-/]))?(\b|[_])(ad[s]?)(\b|[_0-9])/i;


// matches host/domain names starting with "ad" but not (admin|add|adsl)
// or any hostname starting with "pop", "clicks", and "cash"
// or any hostname containing "banner"
// ^(ad(s)?.{0,4}\.|pop|click|cash|[^.]*banner|[^.]*adserv)
// ^(ad(?!(min|sl|d\.))|pop|click|cash|[^.]*banner|[^.]*adserv)
// ^(ad(?!(min|sl|d\.))|pop|click|cash|[^.]*banner|[^.]*adserv|.*\.ads\.)
// ^(www\.)?(ad(?!(mission|visor|alur|iumx|ult|obe.*|min|sl|d|olly.*))|tology|pop|click(?!redblue)|cash|[^.]*banner|[^.]*adserv|.+\.ads?\.)
//var re_adhost = /.../i;

var re_adhost = /\b((new)?ad(?!(venture|vantage|am|mission|visor|alur|iumx|ult|vizia|obe|min|sl|d|olly|vance))|ads\b|adserv|pop(?!ular|corn|e)|click(?!redblue|andbuy|.reference)|cash(?!back)|banner|bans)/i;

// http://www.afcyhf.com/image-1742473-10472361
// http://www.tkqlhce.com/image-1742473-10510557
var re_crud = /www\.\w+\.com\/image-\d+-\d+$/;

// neg:
//	admin.foobar.com
//	add.iahoo.com
//	adsl.allow.com
//	administration.all.net
// pos:
//	fire.ads.ighoo.com
//	ads.foo.org
//	ad0121.aaaa.com
//	adserver.goo.biz
//	popup.foo.bar

// matched against hostname
var re_whitelist_domains = /(^|\.)(adorama\.com|adafruit\..*|advogato\.org|adirondack\..*|kintera\.org|sprintpcs\.com|adp\.com|lego\.com|dell\.com|mozdev\.org|mozilla\.org|fidelity\.com|tirerack\.com|titantv\.com|lala\.com|sprint\.com|nextel\.com|verizon\.com|vupload\.facebook\.com|rit\.edu|mididb\.com|sony\.tv|market\.android\.com|weeklyad\.staples\.com|(code|plus|www|mail|apis|drive|docs)\.google\.com|googleadservices\.com|gmail\.com|gstatic\.com|thetvdb\.com|bits\te.wikimedia\.org|css\.slickdealscdn\.com|newegg\.com|androiddrawer\.com|addons\.cdn\.mozilla\.net|wsj\.com|massdrop\.com|cloudfront\.net|ad.*\.rackcdn\.com|bankofamerica\.com\|office\.com|smarttiles\.click|solaredge\.com|smartthings\.com)$/i;
// http://adc8aa2d5893f5ce5bf9-b0fbfd775b6f5cda8694c34759b81cf5.r65.cf2.rackcdn.com/39060.png



///////////////////////////////////////////////////////////////////////////////

var isActive = 1;

function FindProxyForURL(url, host)
{
    //DEBUG alert("checking: url=" + url);

    // Excellent kludge from Sean M. Burke:
    // Enable or disable no-ads for the current browser session.
    //
    // To disable, visit this URL:		http://no-ads.int/off
    // To re-enable, visit this URL:		http://no-ads.int/on
    //
    // (this will not work with Mozilla or Opera if the alert()s are present)
    //
    // This happens before lowercasing the URL, so make sure you use lowercase!
    //
    if (shExpMatch(host, "no-ads.int")) {
        if (shExpMatch(url, "*/on*")) {
	    isActive = 1;
	    //LOG alert("no-ads has been enabled.\n" + url);
	} else if (shExpMatch(url, "*/off*")) {
	    isActive = 0;
	    //LOG alert("no-ads has been disabled.\n" + url);
	} else if (shExpMatch(url, "*no-ads.int/")) {
	    alert("no-ads is "+(isActive ? "enabled" : "disabled")+".\n" + url);
	} else {
	    alert("no-ads unknown option.\n" + url);
	}

	return blackhole;
    }

    if (!isActive) {
	//LOG3 alert("no-ads inactive bypass: " + url);
	return bypass;
    }

    // Suggestion from Quinten Martens
    // Make everything lower case.
    // WARNING: all shExpMatch rules following MUST be lowercase!
    url = url.toLowerCase();
    host = host.toLowerCase();

    //
    // Local/Internal rule
    // matches to this rule get the 'local' proxy.
    // Adding rules here enables the use of 'local'
    //
    if (0
	//LOCAL-RULES
	// add rules such as:
  	//	|| dnsDomainIs(host, "schooner.com")
	//	|| isPlainHostName(host)
	// or for a single host
	//	|| (host == "some-local-host")
    ) {
	//LOG3 alert("no-ads local: " + url);
	return localproxy;
    }

    //hosts to push out to a SOCKS proxy
    if (0
	//SOCKS-RULES
    ) {
	//LOG3 alert("no-ads socks: " + url);
	return socksproxy;
    }

    //
    // Whitelist section (originally from InvisiBill)
    //
    // Include sites here that should never be matched for ads.
    //
    if (0
	//WHITELIST-RULES
    	// To add whitelist domains, simple add a line such as:
  	//	|| dnsDomainIs(host, "schooner.com")
	// or for a single host
	//	|| (host == "some-host-name")

	// Note: whitelisting schooner.com will defeat the "is-it-working"
	// test page at http://www.schooner.com/~loverso/no-ads/ads/

	// any whitelisted domain
	|| re_whitelist_domains.test(host)

	// Apple.com "Switch" ads
	|| shExpMatch(url, "*.apple.com/switch/ads/*")

	// Uncomment for metacrawler
	// || (host == "clickit.go2net.com")

	|| (host == "adf.ly"
	    && shExpMatch(url, "*/http:/*"))
	|| (host == "cdn.adf.ly"
	    && shExpMatch(url, "*js"))

	|| (host == "images.rottentomatoescdn.com"
	    && shExpMatch(url, "*/scripts?"))

        // Wunderground (weather station 'banners')
	|| ((   _dnsDomainIs(host, "wunderground.com")
	     || _dnsDomainIs(host, "wund.com")
	    )
	    && (   shExpMatch(url, "*/cgi-bin/banner/ban/wxbanner*")
		|| shExpMatch(url, "*/weathersticker/*")
		|| shExpMatch(url, "*/cgi-bin/satbanner*")
	    )
	   )
    ) {
	//LOG3 alert("no-ads whitelist: " + url);
	return normal;
    }

    // To add more sites, simply include them in the correct format.
    //
    // The sites below are ones I currently block.  Tell me of others you add!

    // Remove the "//DEBUG2" to enable debug messages
    if (0
	//BLOCK-RULES
	//DEBUG2 || alert("start")

	// Block IE "favicon.ico" fetches
	// (to avoid being tracked as having bookmarked the site)
	|| shExpMatch(url, "*/favicon.*")
	|| shExpMatch(url, "*/animated_favicon*")

	//////
	//
	// Global Section
	// tries to match common names
	//

	// REs for common URL paths
	//
	//DEBUG2 || ((m = re_banner.exec(url)) && alert("re_banner\n0= " + m[0]+"\n1= " + m[1]+"\n2= " + m[2]+"\n3= " + m[3]+"\n4= " + m[4]))
	//DEBUG2 || ((m = re_banner_white.exec(url)) && alert("re_banner_white\n0= " + m[0]+"\n1= " + m[1]+"\n2= " + m[2]+"\n"))
	//
	|| (re_banner.test(url) && !re_banner_white.test(url))
	//
	//DEBUG2 || alert("passed re_banner")

	//DEBUG2 || ((m = re_banner2.exec(url)) && alert("re_banner2\n0= " + m[0]+"\n1= " + m[1]+"\n2= " + m[2]+"\n3= " + m[3]+"\n4= " + m[4]))
	//
	|| re_banner2.test(url)
	//
	//DEBUG2 || alert("passed re_banner2")

	// RE for common adserver hostnames.
	// The regexp matches all hostnames starting with "ad" that are not
	//	admin|add|adsl
	// (replaces explicit shExpMatch's below)
	|| re_adhost.test(host)
	//
	//DEBUG2 || alert("passed re_adhost")

	//////
	//
	// banner/ad organizations
	// Just delete the entire namespace
	//
	
	// Facebook ... The new evil
//	|| (_dnsDomainIs(host, "facebook.com")
//	    && (shExpMatch(url, "*/plugins/like*")
//	    )
//	)
//	|| _dnsDomainIs(host, "fbcdn.net")

        // doubleclick
	|| _dnsDomainIs(host, "doubleclick.com")
        || _dnsDomainIs(host, "doubleclick.net")
        || _dnsDomainIs(host, "rpts.net")
	|| _dnsDomainIs(host, "2mdn.net")
	|| _dnsDomainIs(host, "2mdn.com")

	|| _dnsDomainIs(host, "chartbeat.net")
	|| _dnsDomainIs(host, "chitika.net")

	// these set cookies
	|| _dnsDomainIs(host, "globaltrack.com")
	|| _dnsDomainIs(host, "burstnet.com")
	|| _dnsDomainIs(host, "adbureau.net")
	|| _dnsDomainIs(host, "targetnet.com")
	|| _dnsDomainIs(host, "humanclick.com")
	|| _dnsDomainIs(host, "linkexchange.com")

	|| _dnsDomainIs(host, "fastclick.com")
	|| _dnsDomainIs(host, "fastclick.net")

        // one whole class C full of ad servers (fastclick)
	// XXX this might need the resolver
//        || isInNet(host, "205.180.85.0", "255.255.255.0")
	|| shExpMatch(host, "205.180.85.*")

	// these use 1x1 images to track you
	|| _dnsDomainIs(host, "admonitor.com")
	|| _dnsDomainIs(host, "focalink.com")

	|| _dnsDomainIs(host, "websponsors.com")
	|| _dnsDomainIs(host, "advertising.com")
	|| _dnsDomainIs(host, "cybereps.com")
	|| _dnsDomainIs(host, "postmasterdirect.com")
	|| _dnsDomainIs(host, "mediaplex.com")
	|| _dnsDomainIs(host, "adtegrity.com")
	|| _dnsDomainIs(host, "bannerbank.ru")
	|| _dnsDomainIs(host, "bannerspace.com")
	|| _dnsDomainIs(host, "theadstop.com")
	|| _dnsDomainIs(host, "l90.com")
	|| _dnsDomainIs(host, "webconnect.net")
	|| _dnsDomainIs(host, "avenuea.com")
	|| _dnsDomainIs(host, "flycast.com")
	|| _dnsDomainIs(host, "engage.com")
	|| _dnsDomainIs(host, "imgis.com")
	|| _dnsDomainIs(host, "datais.com")
	|| _dnsDomainIs(host, "link4ads.com")
	|| _dnsDomainIs(host, "247media.com")
	|| _dnsDomainIs(host, "hightrafficads.com")
	|| _dnsDomainIs(host, "tribalfusion.com")
	|| _dnsDomainIs(host, "rightserve.net")
	|| _dnsDomainIs(host, "admaximize.com")
	|| _dnsDomainIs(host, "valueclick.com")
	|| _dnsDomainIs(host, "adlibris.se")
	|| _dnsDomainIs(host, "vibrantmedia.com")
	|| _dnsDomainIs(host, "coremetrics.com")
	|| _dnsDomainIs(host, "vx2.cc")
	|| _dnsDomainIs(host, "webpower.com")
	|| _dnsDomainIs(host, "everyone.net")
	|| _dnsDomainIs(host, "zedo.com")
	|| _dnsDomainIs(host, "bigbangmedia.com")
	|| _dnsDomainIs(host, "ad-annex.com")
	|| _dnsDomainIs(host, "iwdirect.com")
	|| _dnsDomainIs(host, "adlink.de")
	|| _dnsDomainIs(host, "bidclix.net")
	|| _dnsDomainIs(host, "webclients.net")
	|| _dnsDomainIs(host, "linkcounter.com")
	|| _dnsDomainIs(host, "sitetracker.com")
	|| _dnsDomainIs(host, "adtrix.com")
	|| _dnsDomainIs(host, "netshelter.net")
	|| _dnsDomainIs(host, "rn11.com")
	// http://vpdc.ru4.com/content/images/66/011.gif
	|| _dnsDomainIs(host, "ru4.com")
	// no '.' for rightmedia.net
	|| _dnsDomainIs(host, "rightmedia.net")
	|| _dnsDomainIs(host, "casalemedia.com")
	|| _dnsDomainIs(host, "casalemedia.com")
	|| _dnsDomainIs(host, "quantserve.com")
	|| _dnsDomainIs(host, "quantcast.com")
	|| _dnsDomainIs(host, "crwdcntrl.net")
	|| _dnsDomainIs(host, "scorecardresearch.net")
	|| _dnsDomainIs(host, "pubmatic.net")
	|| _dnsDomainIs(host, "yumenetworks.com")
	|| _dnsDomainIs(host, "brilig.com")

	|| _dnsDomainIs(host, "perfb.com")
	|| _dnsDomainIs(host, "blogads.com")

	|| _dnsDomainIs(host, "fetchback.com")
	|| _dnsDomainIs(host, "creatives.badongo.com")
	|| _dnsDomainIs(host, "pmsrvr.com")
	|| _dnsDomainIs(host, "trafficmack.com")


	// C-J
	|| _dnsDomainIs(host, "commission-junction.com")
	|| _dnsDomainIs(host, "qkimg.net")
	// emjcd.com ... many others

	// */adv/*
	|| _dnsDomainIs(host, "bluestreak.com")

	// Virtumundo -- as annoying as they get
	|| _dnsDomainIs(host, "virtumundo.com")
	|| _dnsDomainIs(host, "treeloot.com")
	|| _dnsDomainIs(host, "memberprize.com")

	// internetfuel and _some_ of the sites they redirect to
	// (more internetfuel - from Sam G)
	|| _dnsDomainIs(host, "internetfuel.net")
	|| _dnsDomainIs(host, "internetfuel.com")
	|| _dnsDomainIs(host, "peoplecaster.com")
	|| _dnsDomainIs(host, "cupidsdatabase.com")
	|| _dnsDomainIs(host, "automotive-times.com")
	|| _dnsDomainIs(host, "healthy-lifetimes.com")
	|| _dnsDomainIs(host, "us-world-business.com")
	|| _dnsDomainIs(host, "internet-2-web.com")
	|| _dnsDomainIs(host, "my-job-careers.com")
	|| _dnsDomainIs(host, "freeonline.com")
	|| _dnsDomainIs(host, "exitfuel.com")
	|| _dnsDomainIs(host, "netbroadcaster.com")
	|| _dnsDomainIs(host, "spaceports.com")
	|| _dnsDomainIs(host, "mircx.com")
	|| _dnsDomainIs(host, "exitchat.com")
	|| _dnsDomainIs(host, "atdmt.com")
	|| _dnsDomainIs(host, "partner2profit.com")
	|| _dnsDomainIs(host, "centrport.net")
	|| _dnsDomainIs(host, "centrport.com")
	|| _dnsDomainIs(host, "rampidads.com")

	|| _dnsDomainIs(host, "dt07.net")
	|| _dnsDomainIs(host, "criteo.com")
	|| _dnsDomainIs(host, "bidswitch.com")

	//////
	//
	// banner servers
	// (typically these set cookies or serve animated ads)
	//

	|| _dnsDomainIs(host, "commonwealth.riddler.com")
	|| _dnsDomainIs(host, "banner.freeservers.com")
	|| _dnsDomainIs(host, "usads.futurenet.com")
	|| _dnsDomainIs(host, "banners.egroups.com")
	|| _dnsDomainIs(host, "ngadclient.hearme.com")
	|| _dnsDomainIs(host, "affiliates.allposters.com")
	|| _dnsDomainIs(host, "adincl.go2net.com")
	|| _dnsDomainIs(host, "webads.bizservers.com")
	|| _dnsDomainIs(host, "addserv.com")
	|| _dnsDomainIs(host, "falkag.net")
	|| _dnsDomainIs(host, "buysellads.com")
	|| _dnsDomainIs(host, "dtscout.com")
	|| _dnsDomainIs(host, "tynt.com")

	|| (host == "promote.pair.com")

	|| _dnsDomainIs(host, "interclick.com")
	|| _dnsDomainIs(host, "travelscream.com")

	// marketwatch.com (flash ads), but CSS get loaded
	|| (_dnsDomainIs(host, "mktw.net")
	    && !shExpMatch(url, "*/css/*"))
	|| _dnsDomainIs(host, "cjt1.net")
	|| _dnsDomainIs(host, "bns1.net")
	
	// "undergroundonline"
	// comes from iframe with this url: http://mediamgr.ugo.com/html.ng/size=728x90&affiliate=megagames&channel=games&subchannel=pc&Network=affiliates&rating=g
	|| _dnsDomainIs(host, "image.ugo.com")
	|| _dnsDomainIs(host, "mediamgr.ugo.com")

	// web ads and "cheap Long Distance"
	|| _dnsDomainIs(host, "zonecms.com")
	|| _dnsDomainIs(host, "zoneld.com")

	// AOL
	|| _dnsDomainIs(host, "atwola.com")
	|| _dnsDomainIs(host, "toolbar.aol.com")
	|| _dnsDomainIs(host, "adsdk.com")

	// animated ads shown at techbargains
	|| (_dnsDomainIs(host, "overstock.com")
	    && shExpMatch(url, "*/linkshare/*"))
	|| (_dnsDomainIs(host, "supermediastore.com")
	    && shExpMatch(url, "*/lib/supermediastore/*"))
	|| (_dnsDomainIs(host, "shop4tech.com")
	    && shExpMatch(url, "*/assets/*"))
	|| (_dnsDomainIs(host, "softwareandstuff.com")
	    && shExpMatch(url, "*/media/*"))
	|| (_dnsDomainIs(host, "buy.com")
	    && shExpMatch(url, "*/affiliate/*"))

	|| (_dnsDomainIs(host, "pdaphonehome.com")
	    && (shExpMatch(url, "*/pocketpcmagbest.gif")
		|| shExpMatch(url, "*/link-msmobiles.gif")))
	|| (_dnsDomainIs(host, "ppc4you.com")
	    && shExpMatch(url, "*/ppc_top_sites.gif"))

	// more animated ads... these really drive me crazy
	|| (_dnsDomainIs(host, "freewarepalm.com")
	    && shExpMatch(url, "*/sponsors/*"))

	|| _dnsDomainIs(host, "travelscream.com")
	|| _dnsDomainIs(host, "traveldeals.com")
	|| _dnsDomainIs(host, "traveldeals.wunderground.com")
	|| _dnsDomainIs(host, "as5000.com")

	//////
	//
	// Ads/noise that make web pages SLOW
	//

	|| (_dnsDomainIs(host, "mc.dailymotion.com")
	    && shExpMatch(url, "*/masscast/*"))

	// "widget" at RottenTomatoes (provided by 'thespringbox')
	// **maybe just use 'flashblock' everywhere**
	|| (host == "downloads.thespringbox.com"
	   // uncomment this to be more targeted and just remove the one at RT
	   // && shEXpMatch(url, "*/wrapper.php?file=51832.sbw")
	)

	// "You May Also Like"
	|| _dnsDomainIs(host, "outbrain.com")
	
	// annoying "promoted content"
	|| _dnsDomainIs(host, "marketgid.com")
	|| _dnsDomainIs(host, "mgid.com")

	|| _dnsDomainIs(host, "rtbsystem.com")

	|| _dnsDomainIs(host, "directrev.com")
	|| _dnsDomainIs(host, "az708531.vo.msecnd.net")

	//////
	//
	// popups/unders
	//

	|| _dnsDomainIs(host, "remotead.cnet.com")
	|| _dnsDomainIs(host, "1st-dating.com")
	|| _dnsDomainIs(host, "mousebucks.com")
	|| _dnsDomainIs(host, "yourfreedvds.com")
	|| _dnsDomainIs(host, "popupsavings.com")
	|| _dnsDomainIs(host, "popupmoney.com")
	|| _dnsDomainIs(host, "popuptraffic.com")
	|| _dnsDomainIs(host, "popupnation.com")
	|| _dnsDomainIs(host, "infostart.com")
	|| _dnsDomainIs(host, "opupad.net")
	|| _dnsDomainIs(host, "usapromotravel.com")
	|| _dnsDomainIs(host, "goclick.com")
	|| _dnsDomainIs(host, "trafficwave.net")
	|| _dnsDomainIs(host, "popupad.net")
	|| _dnsDomainIs(host, "paypopup.com")
	|| _dnsDomainIs(host, "trafficstars.com")
	|| _dnsDomainIs(host, "onclkds.com")

	// adsterra
	|| _dnsDomainIs(host, "vipcpms.com")
	|| _dnsDomainIs(host, "putags.com")

	// Popups from ezboard
	|| _dnsDomainIs(host, "greenreaper.com")
	|| _dnsDomainIs(host, "spewey.com")
	|| _dnsDomainIs(host, "englishharbour.com")
	|| _dnsDomainIs(host, "casino-trade.com")
	|| _dnsDomainIs(host, "got2goshop.com")
	// more ezboard crud (from Miika Asunta)
	|| _dnsDomainIs(host, "addynamix.com")
	|| _dnsDomainIs(host, "trafficmp.com")
	|| _dnsDomainIs(host, "makingmoneyfromhome.net")
	|| _dnsDomainIs(host, "leadcart.com")

	|| _dnsDomainIs(host, "euros4click.de")

	// http://www.power-mark.com/js/popunder.js
	|| _dnsDomainIs(host, "power-mark.com")

	//////
	//
	// User tracking (worse than ads) && hit counting "services"
	//

	// "web trends live"
	|| _dnsDomainIs(host, "webtrendslive.com")
	|| _dnsDomainIs(host, "wtlive.com")
	|| _dnsDomainIs(host, "imrworldwide.com")

	// 1x1 tracking images
	// ** (but also used in some pay-for-clicks that I want to follow,
	// **  so disabled for now.  9/2001)
	// || _dnsDomainIs(host, "service.bfast.com")

	// one whole class C full of ad servers
	// XXX this might need the resolver
//	|| isInNet(host, "66.40.16.0", "255.255.255.0")
	|| shExpMatch(host, "66.40.16.*")

	|| _dnsDomainIs(host, "web-stat.com")
	|| _dnsDomainIs(host, "superstats.com")
	|| _dnsDomainIs(host, "allhits.ru")
	|| _dnsDomainIs(host, "list.ru")
	|| _dnsDomainIs(host, "counted.com")
	|| _dnsDomainIs(host, "rankyou.com")
	|| _dnsDomainIs(host, "clickcash.com")
	|| _dnsDomainIs(host, "clickbank.com")
	|| _dnsDomainIs(host, "paycounter.com")
	|| _dnsDomainIs(host, "cashcount.com")
	|| _dnsDomainIs(host, "clickedyclick.com")
	|| _dnsDomainIs(host, "clickxchange.com")
	|| _dnsDomainIs(host, "sitestats.com")
	|| _dnsDomainIs(host, "site-stats.com")
	|| _dnsDomainIs(host, "hitbox.com")
	|| _dnsDomainIs(host, "exitdirect.com")
	|| _dnsDomainIs(host, "realtracker.com")
	|| _dnsDomainIs(host, "etracking.com")
	|| _dnsDomainIs(host, "livestat.com")
	|| _dnsDomainIs(host, "spylog.com")
	|| _dnsDomainIs(host, "freestats.com")
	|| _dnsDomainIs(host, "addfreestats.com")
	|| _dnsDomainIs(host, "topclicks.net")
	|| _dnsDomainIs(host, "mystat.pl")
	|| _dnsDomainIs(host, "hitz4you.de")
	|| _dnsDomainIs(host, "hitslink.com")
	|| _dnsDomainIs(host, "thecounter.com")
	|| _dnsDomainIs(host, "roiservice.com")
	|| _dnsDomainIs(host, "overture.com")
	|| _dnsDomainIs(host, "xiti.com")
	|| _dnsDomainIs(host, "cj.com")
	|| _dnsDomainIs(host, "anrdoezrs.net")
	|| _dnsDomainIs(host, "hey.it")
	|| _dnsDomainIs(host, "ppctracking.net")
	|| _dnsDomainIs(host, "darkcounter.com")
	|| _dnsDomainIs(host, "2o7.com")
	|| _dnsDomainIs(host, "2o7.net")
	|| _dnsDomainIs(host, "gostats.com")
	|| _dnsDomainIs(host, "everstats.com")
	|| _dnsDomainIs(host, "onestat.com")
	|| _dnsDomainIs(host, "statcounter.com")
	|| _dnsDomainIs(host, "trafic.ro")
	|| _dnsDomainIs(host, "exitexchange.com")
	|| _dnsDomainIs(host, "clicktorrent.info")
	|| _dnsDomainIs(host, "ventimedia.com")
	|| _dnsDomainIs(host, "flashmediaportal.com")
	|| _dnsDomainIs(host, "clictrackr.com")
	|| _dnsDomainIs(host, "revivestar.com")

	// clickability, via CNN
	|| _dnsDomainIs(host, "clickability.com")
	|| _dnsDomainIs(host, "savethis.com")

	|| _dnsDomainIs(host, "extremetracking.com")
	|| _dnsDomainIs(host, "extreme-dm.com")
	|| _dnsDomainIs(host, "pop6.com")
	|| _dnsDomainIs(host, "medleyads.com")

	// bogus 'news'
	|| _dnsDomainIs(host, "news6insider.com")

	// bogus 'virusscan' popup/hijack
	// antivirus-whitelist.cw.cm
	// redirected from zyvqerta.cw.cm
	// redirected from contmoovui4d.co.cc 
	// (I'm tempted to toss all these bogus TLDs in the trash,
	// but I'll just stay on the second level)
	|| _dnsDomainIs(host, "cw.cm")
	|| _dnsDomainIs(host, "co.cc")

	|| _dnsDomainIs(host, "hideus.in")
	|| _dnsDomainIs(host, "addthis.com")
	|| _dnsDomainIs(host, "popadscdn.net")

	//////
	//
	// Dead domain parking
	//
	|| _dnsDomainIs(host, "netster.com")

	//////
	//
	// Search engine "optimizers"
	//
	|| _dnsDomainIs(host, "searchmarketing.com")

	//////
	//
	// Spyware/worms/malware
	//

	|| _dnsDomainIs(host, "friendgreetings.com")
	|| _dnsDomainIs(host, "permissionedmedia.com")
	|| _dnsDomainIs(host, "searchbarcash.com")
	|| _dnsDomainIs(host, "shipboardserviceberrysiltstone.info")
	|| _dnsDomainIs(host, "how2update4u.com")
	|| _dnsDomainIs(host, "travelwednesday.com")
	|| _dnsDomainIs(host, "masterclassfoods.com")
	|| _dnsDomainIs(host, "liveadexchanger.com")
	|| _dnsDomainIs(host, "betterads.co")
	|| _dnsDomainIs(host, "livegoal.net")

	//////
	//
	// Fake security warnings
	//
	|| _dnsDomainIs(host, "techsupport-verizon.com")
	|| _dnsDomainIs(host, "avstats.com")

	//////
	//
	// Surveys, votes, quizes
	//

	|| _dnsDomainIs(host, "zoomerang.com")
	|| _dnsDomainIs(host, "quizrocket.com")

	|| (_dnsDomainIs(host, "amazonaws.com")
	    && shExpMatch(url, "*/udm_img/mid*")
	)

	//////
	//
	// "Casino" ads (scams)
	//

	|| _dnsDomainIs(host, "aceshigh.com")
	|| _dnsDomainIs(host, "idealcasino.net")
	|| _dnsDomainIs(host, "casinobar.net")
	|| _dnsDomainIs(host, "casinoionair.com")

	|| (_dnsDomainIs(host, "go2net.com")
	    && shExpMatch(url, "*adclick*")
	)

	//////
	//
	// Spammers
	//

	|| _dnsDomainIs(host, "licensed-collectibles.com")
	|| _dnsDomainIs(host, "webdesignprofessional.com")

	//////
	//
	// Directed at extra annoying places
	//

	// Attempts to download ad-supported spyware without asking first
	|| _dnsDomainIs(host, "gator.com")

	// ebay
	|| ((_dnsDomainIs(host, "pics.ebay.com")
	     || _dnsDomainIs(host, "pics.ebaystatic.com"))
	    && shExpMatch(url, "*/pics/mops/*/*[0-9]x[0-9]*")
	)
	|| (_dnsDomainIs(host, "ebayobjects.com")
	    && shExpMatch(url, "*search/keywords*")
	)
	|| _dnsDomainIs(host, "admarketplace.com")
	|| _dnsDomainIs(host, "admarketplace.net")

	// Bravenet & Ezboard
	|| (_dnsDomainIs(host, "ezboard.com")
	    && shExpMatch(url, "*/bravenet/*")
	)
	|| (_dnsDomainIs(host, "bravenet.com")
	    && (   shExpMatch(host, "*counter*")
		|| shExpMatch(url, "*/jsbanner*")
	        || shExpMatch(url, "*/bravenet/*")
	    )
	)

	// GeoCities
	// (checking "toto" from Prakash Persaud)
	|| ((   _dnsDomainIs(host,"geo.yahoo.com")
	     || _dnsDomainIs(host,"geocities.com"))
	    && (
		   shExpMatch(url,"*/toto?s*")
		|| shExpMatch(url, "*geocities.com/js_source*")
		|| _dnsDomainIs(host, "visit.geocities.com")
	    )
	)

	// Yahoo ads (direct and via Akamai)
	// http://us.a1.yimg.com/us.yimg.com/a/...
	|| (_dnsDomainIs(host,"yimg.com")
	    && !(   shExpMatch(url,"*yimg.com/a/i/*")
		 || shExpMatch(url,"*yimg.com/a/lib/*")
		 || shExpMatch(url,"*yimg.com/a/combo*")
	    )
	    && (   shExpMatch(url,"*yimg.com/a/*")
		|| shExpMatch(url,"*yimg.com/*/adv/*")
		|| shExpMatch(url,"*yimg.com/*/promotions/*")
	    )
	)
	// "eyewonder" ads at Yahoo
	|| _dnsDomainIs(host,"qz3.net")
	|| _dnsDomainIs(host,"eyewonder.com")

	// background ad images
	|| _dnsDomainIs(host,"buzzcity.com")

	// FortuneCity - ads and tracking
	|| (_dnsDomainIs(host,"fortunecity.com")
	    && (    shExpMatch(url,"*/js/adscript*")
		 || shExpMatch(url,"*/js/fctrack*")
	    )
	)

	// zdnet
	// tracking webbugs:
	// http://gserv.zdnet.com/clear/ns.gif?a000009999999999999+2093
	|| (_dnsDomainIs(host, "zdnet.com")
	    && (   _dnsDomainIs(host, "ads3.zdnet.com")
		|| host == "gserv.zdnet.com"
		|| shExpMatch(url, "*/texis/cs/ad.html")
		|| shExpMatch(url, "*/adverts")
	     )
	)

	// cnet
	// web bugs and ad redirections
	// taken care of by hostname rules:
	//	http://adimg.com.com/...
	//	http://adlog.com.com/...
	// http://dw.com.com/clear/c.gif
	// http://dw.com.com/redir?astid=2&destUrl=http%3A%2F%2Fwww.buy ...
	// http://mads.com.com/mac-ad?...
	|| (host == "dw.com.com" || host == "mads.com.com")
	|| (_dnsDomainIs(host, "com.com")
	    && (   host == "dw.com.com"
		|| host == "mads.com.com"
	     )
	)

	// nytimes
	|| (_dnsDomainIs(host, "nytimes.com")
	    && shExpMatch(url,"*/adx/*")
	)

	// pop-after
	|| _dnsDomainIs(host, "unicast.net")


	// Be Free affiliate ads
	|| _dnsDomainIs(host, "reporting.net")
	|| _dnsDomainIs(host, "affliate.net")
	|| (_dnsDomainIs(host, "akamai.net")
	    && shExpMatch(url, "*.affiliate.net/*")
	)

	// Infospace.com popunder
	// for "webmarket.com" & "shopping.dogpile.com" -- just say no!
	|| (_dnsDomainIs(host, "infospace.com")
	    && shExpMatch(url, "*/goshopping/*")
	)
	|| _dnsDomainIs(host, "webmarket.com")
	|| _dnsDomainIs(host, "shopping.dogpile.com")

	// goto.com popunder for information.gopher.com
	|| _dnsDomainIs(host, "information.gopher.com")

	// About.com popunder and floating ad bar
	|| (_dnsDomainIs(host, "about.com")
	    && (0
	    || shExpMatch(url, "*/sprinks/*")
	    || shExpMatch(url, "*about.com/0/js/*")
	    || shExpMatch(url, "*about.com/f/p/*")
	    )
	)

	// Dell
	|| (_dnsDomainIs(host, "dell.com")
	    && shExpMatch(url, "*/images/affiliates/*")
	)

	// IFilm iframes
	|| (_dnsDomainIs(host, "ifilm.com")
	    && (shExpMatch(url, "*/partners/*")
	        || shExpMatch(url, "*/redirect*")
	    )
	)

	// tomshardware
	// they are most annoying:
	// - cookies on their background images to track you
	// - looping shockwave ads
	// this kills most of the crud
//	     || isInNet(host, "216.92.21.0", "255.255.255.0")
	|| ((_dnsDomainIs(host, "tomshardware.com")
	     || shExpMatch(host, "216.92.21.*"))
	    && (   shExpMatch(url, "*/cgi-bin/banner*")
	        || shExpMatch(url, "*/cgi-bin/bd.m*")
	        || shExpMatch(url, "*/images/banner/*")
	    )
	)

	|| shExpMatch(url, "*mapsonus.com/ad.images*")

	// Slashdot: added these when I saw hidden 1x1 images with cookies
	|| _dnsDomainIs(host, "adfu.blockstackers.com")
	|| (_dnsDomainIs(host, "slashdot.org")
	    && (
	           shExpMatch(url, "*/slashdot/pc.gif*")
		|| shExpMatch(url, "*/pagecount.gif*")
		|| shExpMatch(url, "*/adlog.pl*")
	    )
        )
	|| _dnsDomainIs(host, "googlesyndication.com")
	// || _dnsDomainIs(host, "google-analytics.com")

	// it-aint-cool.com
	|| (_dnsDomainIs(host, "aintitcool.com")
	    && (
	           shExpMatch(url, "*/newline/*")
		|| shExpMatch(url, "*/drillteammedia/*")
		|| shExpMatch(url, "*/foxsearchlight/*")
		|| shExpMatch(url, "*/media/aol*")
		|| shExpMatch(url, "*swf")
	    )
	)

	// Staples & CrossMediaServices
	|| (_dnsDomainIs(host, "staples.com")
	    && shExpMatch(url, "*/pixeltracker/*")
	)
	|| _dnsDomainIs(host, "pt.crossmediaservices.com")

	// OfficeMax affiliate art (affArt->affart because of toLowerCase)
	|| (_dnsDomainIs(host, "officemax.com")
	    && shExpMatch(url, "*/affart/*")
	)

	// complicated JavaScript for directed ads!
// 1/5/2004: allow /js/ as they now use it for graphs
//	|| (_dnsDomainIs(host, "anandtech.com")
//	    && (shExpMatch(url,"*/js/*")
//	        || shExpMatch(url,"*/bnr_*")
//	    )
//	)

	// hardocp
	// http://65.119.30.151/UploadFilesForNewegg/onlineads/newegg728hardocp.swf
	|| (host == "hera.hardocp.com")
	|| shExpMatch(url,"*/onlineads/*")

	// complicated JavaScript for gliding ads!
	|| (_dnsDomainIs(host, "fatwallet.com")
	    && shExpMatch(url,"*/js/*")
	)

	// cnet ads
	|| _dnsDomainIs(host, "promo.search.com")

	// IMDB celeb photos
	// (Photos/CMSIcons->photos/cmsicons because of toLowerCase)
	|| (_dnsDomainIs(host, "imdb.com")
	    && (   shExpMatch(url, "*/photos/cmsicons/*")
	        || shExpMatch(url, "*/icons/*/celeb/*")
	        || shExpMatch(url, "*.swf")
	    )
	)
	// incredibly annoying IMDB shock/flash ads
	|| _dnsDomainIs(host, "kliptracker.com")
	|| _dnsDomainIs(host, "klipmart.com")

	// more incredibly annoying shock/flash ads
	|| host == "avpa.javalobby.org"

	|| host == "spinbox.techtracker.com"

	// Amazon affiliate 'search'. retrieves a JS that writes new HTML
	// that references one or more images "related to your search"
	// (If there is a real use for rcm.amazon.com, let me know)
	// http://rcm.amazon.com/e/cm?t=starlingtechnolo&amp;l=st1&amp;search=cynicism&amp;mode=books&amp;p=11&amp;o=1&amp;bg1=CEE7FF&amp;fc1=000000&amp;lc1=083194&amp;lt1=_blank
	|| host == "rcm.amazon.com"

	// megaupload affiliate
	|| (_dnsDomainIs(host, "megaupload.com") && (
		   shExpMatch(url, "*/aff*.php")
		|| shExpMatch(url, "*/mrads/*")
	    )
	)
	|| _dnsDomainIs(host, "megaflirt.com")

	|| _dnsDomainIs(host, "ifriends.com")

	|| ((_dnsDomainIs(host, "gamecopyworld.com")
	     || _dnsDomainIs(host, "linkworld.com")
	     || _dnsDomainIs(host, "filetarget.com")
	    )&& (
		   shExpMatch(url, "*/ii/*")
		|| shExpMatch(url, "*/@_eve*")
//		|| shExpMatch(url, "*/@*")
	    )
	)

	|| _dnsDomainIs(host, "lookoutmovies.com")
	|| _dnsDomainIs(host, "tube-player.com")


	// www.afcyhf.com/image-1742473-10472361
	// www.tkqlhce.com/image-1742473-10510557
	|| re_crud.test(url)


	//////
	//
	// "sponsored" and "trending" content
	//
	|| _dnsDomainIs(host, "taboola.com")
	|| _dnsDomainIs(host, "taboolasyndication.com")
	|| _dnsDomainIs(host, "disqus.com")
	|| _dnsDomainIs(host, "revcontent.com")

	//////
	//
	// Other "Scum And Villainry"
	//

	// Popup from "reserved" domains at register.com
	// (I considered blocking all of register.com)
	|| (_dnsDomainIs(host, "register.com")
	    && (shExpMatch(url,"*.js")
		|| shExpMatch(host, "searchtheweb*")
		|| shExpMatch(host, "futuresite*")
	    )
	)

	|| _dnsDomainIs(host, "oingo.com")
	|| _dnsDomainIs(host, "namingsolutions.com")

	// "Data collection"
	|| _dnsDomainIs(host, "coremetrics.com")

	// Sets your home page
	|| _dnsDomainIs(host, "firehunt.com")

	// tracking
	|| _dnsDomainIs(host, "appliedsemantics.com")

	// Scum who buy ad space from the above
	// || _dnsDomainIs(host, "hartfordrents.com")
	// || _dnsDomainIs(host, "chicagocomputerrentals.com")
	// || _dnsDomainIs(host, "ccrsolutions.com")
	// || _dnsDomainIs(host, "rushcomputer.com")
	// || _dnsDomainIs(host, "localesimates.com")
	// || _dnsDomainIs(host, "unitedvision.com")
	// XXX this might need the resolver
//	|| isInNet(host, "216.216.246.31", "255.255.255.255")
	|| (host == "216.216.246.31")

	// avsforum ads
//	|| isInNet(host, "216.66.21.35", "255.255.255.255")
	|| (host == "216.66.21.35")
	|| _dnsDomainIs(host, "avsads.com")

	// bogus "search" sites at non-existent sites
	|| _dnsDomainIs(host, "search411.com")

	// palmgear.com
	|| (_dnsDomainIs(host, "palmgear.com")
	    && (   shExpMatch(url, "*/adsales/*")
		|| shExpMatch(url, "*/emailblast*")
	    )
	)

	|| _dnsDomainIs(host, "prreleases.net")

	//////
	//
	// Contributed adult sites
	//

	|| _dnsDomainIs(host, "porntrack.com")
	|| _dnsDomainIs(host, "sexe-portail.com")
	|| _dnsDomainIs(host, "sextracker.com")
	|| _dnsDomainIs(host, "sexspy.com")
	|| _dnsDomainIs(host, "offshoreclicks.com")
	|| _dnsDomainIs(host, "exxxit.com")
	|| _dnsDomainIs(host, "private-dailer.biz")
	|| shExpMatch(url, "*retestrak.nl/misc/reet.gif")
	|| shExpMatch(url, "*dontstayin.com/*.swf")
	|| shExpMatch(url, "*pornotube.com/textads*")
	|| _dnsDomainIs(host, "xratedbucks.com")
	|| _dnsDomainIs(host, "hornymatches.com")
	|| _dnsDomainIs(host, "hornymatches.com")
	|| _dnsDomainIs(host, "etology.com")
	|| _dnsDomainIs(host, "streamray.com")
	|| _dnsDomainIs(host, "awempire.com")
	|| _dnsDomainIs(host, "promos.fling.com")
	|| _dnsDomainIs(host, "pussygreen.com")
	|| _dnsDomainIs(host, "livejasmin.com")
	|| _dnsDomainIs(host, "imlive.com")
	|| _dnsDomainIs(host, "ihookup.com")

	|| (_dnsDomainIs(host, "shufuni.com")
	    && (   shExpMatch(url, "*images/activepage*")
	    )
	)

	//EXTRA-BLOCK-RULES
    ) {
	//LOG2 alert("no-ads blocking: " + url);

	// deny this request
	return blackhole;

    } else {
	//LOG3 alert("no-ads allowing: " + url);

	// all other requests go direct and avoid any overhead
	return normal;
    }
}

///////////////////////////////////////////////////////////////////////////////
//
// This line is just for testing; you can ignore it.  But, if you are having
// problems where you think this PAC file isn't being loaded, then change this
// to read "if (1)" and the alert box should appear when the browser loads this
// file.
//
// This works for IE4, IE5, IE5.5, IE6 and Netscape 2.x, 3.x, and 4.x.
// (For IE6, tested on Win2K)
// This does not work for Mozilla before 1.4 (and not for Netscape 6.x).
// In Mozilla 1.4+ and Fireox, this will write to the JavaScript console.
//
if (0) {
	alert("no-ads.pac: LOADED:\n" +
		"	version:	"+noadsver+"\n" +
		"	blackhole:	"+blackhole+"\n" +
		"	normal:		"+normal+"\n" +
		"	localproxy:	"+localproxy+"\n" +
		"	bypass:		"+bypass+"\n"
		//MSG
	);
}

// The above should show you that this JavaScript is executed in an
// unprotected global context.  NEVER point at someone elses autoconfig file;
// always load from your own copy!

// an alert that returns true (normally it returns void)
function alertmatch(str)
{
	alert(str);
	return 1;
}

///////////////////////////////////////////////////////////////////////////////
//
// Replacement function for dnsDomainIs().  This is to replace the
// prefix problem, which a leading '.' used to be used for.
//
//	dnsDomainIs("bar.com", "bar.com") => true
//	dnsDomainIs("www.bar.com", "bar.com") => true
//	dnsDomainIs("www.foobar.com", "bar.com") => true	<<< incorrect
//
//	_dnsDomainIs("bar.com", "bar.com") => true
//	_dnsDomainIs("www.bar.com", "bar.com") => true
//	_dnsDomainIs("www.foobar.com", "bar.com") => false	<<< correct
//
// 2016 update: Firefox 47 is broken:
//
//	dnsDomainIs("bar.com", ".bar.com") => false		<<< incorrect
//
function _dnsDomainIs(host, domain) {
    if (host.length > domain.length) {
	return (host.substring(host.length - domain.length - 1) == "."+domain);
    }
    return (host == domain);
}

///////////////////////////////////////////////////////////////////////////////
//
// Tired of reading boring comments?  Try reading today's comics:
//	http://www.schooner.com/~loverso/comics/
//
// or getting a quote from my collection:
//	http://www.schooner.com/~loverso/quote/
//

// eof
	//intelliserv.net
	//intellisrv.net
	//rambler.ru
	//rightmedia.net
	//calloffate.com
	//fairmeasures.com


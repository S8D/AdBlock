// Design by Sang Van
// Function: Blocked: Update iOS OTA, Update Carrier, Revoke,...
// Fb: https://www.facebook.com/vansang191

var PROXY_DIRECT = "DIRECT";
var DIRECT = "DIRECT";
var BLACK = "PROXY 8.8.8.8:53";
var WHITE = PROXY_DIRECT;

function s(u, r) {
    return shExpMatch(u, r);
}

function d(h, r) {
    return dnsDomainIs(h, r);
}

function n(h, r, m) {
    return isInNet(h, r, m);
}

function e(u) {
    var h;
    if (u.indexOf("://") > -1) {
        h = u.split('/')[2];
    } else {
        h = u.split('/')[0];
    }
    h = h.split(':')[0];
    var s = h.split('.').reverse();
    return s;
}

function FindProxyForURL(url, host) {
    var u = url.toLowerCase();
    var h = host.toLowerCase();
    var a = e(u);
    var b = a[0];
    var c = a[1];
    var f = c.length;
    var t = c[f - 1];
    var z = c[f - 2];
    if (d(h, "GX7QkY.configtest.wl.is")) {
        return "PROXY 5.9.40.99:80";
    }
    if (d(h, "wl.is") || d(h, "weblockapp.com")) {
        return PROXY_DIRECT;
    }
    if (n(h, "127.0.0.1", "255.255.255.0")) {
        return "PROXY 127.0.0.1:8888";
    }
    if (b == "com") {
        if (t == "1") {
            if (d(h, "c1o1.com") || d(h, "222111.com") || d(h, "movi11.com") || d(h, "psma01.com") || s(u, "*/mod_ad/*") && d(h, "mobile01.com") || d(h, "wy31.com") || d(h, "6721.com") || d(h, "game141.com") || d(h, "qq61.com") || d(h, "12291.com")) return BLACK;
        }
        if (t == "0") {
            if (z == "0") {
                if (d(h, "adt100.com") || d(h, "dian5000.com") || d(h, "334700.com") || d(h, "400or800.com")) return BLACK;
            } else if (d(h, "cpm360.com") || d(h, "pk840.com") || d(h, "ads80.com")) return BLACK;
        }
        if (t == "3") {
            if (d(h, "wafmedia3.com") || d(h, "81813.com") || d(h, "psma03.com") || d(h, "web933.com") || d(h, "admtpmp123.com") || d(h, "jxad.jx163.com") || d(h, "dszm163.com")) return BLACK;
        }
        if (t == "2") {
            if (d(h, "aimg.fc2.com") || d(h, "affiliate.fc2.com") || d(h, "arpg2.com") || d(h, "xq12.com") || d(h, "88210212.com") || d(h, "psma02.com") || d(h, "yy32.com") || d(h, "84232.com") || d(h, "888222.com") || d(h, "adshost2.com")) return BLACK;
        }
        if (t == "5") {
            if (d(h, "wafmedia5.com") || d(h, "jidian5.com") || d(h, "wangzhan5.com") || d(h, "lm.35.com") || d(h, "333555.com") || d(h, "3975.com") || d(h, "xp9365.com")) return BLACK;
        }
        if (t == "4") {
            if (d(h, "7794.com") || d(h, "clk1004.com") || d(h, "3234.com") || d(h, "admtpmp124.com") || d(h, "ipla.hit.stat24.com") || d(h, "macau2014.com")) return BLACK;
        }
        if (t == "7") {
            if (d(h, "6788787.com") || d(h, "hz3137.com") || d(h, "qq937.com") || d(h, "admtpmp127.com") || d(h, "xiao47.com") || d(h, "5577.com")) return BLACK;
        }
        if (t == "6") {
            if (z == "6") {
                if (d(h, "link.ad966.com") || d(h, "v.xi666.com") || d(h, "98766.com") || d(h, "woniu666.com")) return BLACK;
            } else if (d(h, "uu06.com") || d(h, "336.com") || d(h, "y2126.com") || d(h, "ejin56.com") || d(h, "cpv6.com") || d(h, "game3896.com") || d(h, "mosa86.com")) return BLACK;
        }
        if (t == "9") {
            if (z == "9") {
                if (d(h, "kol4399.com") || d(h, "510599.com") || d(h, "jinzhao99.com")) return BLACK;
            } else if (d(h, "bka789.com") || d(h, "7029.com") || d(h, "37pk49.com") || d(h, "yx4449.com") || d(h, "4779.com")) return BLACK;
        }
        if (t == "8") {
            if (z == "8") {
                if (d(h, "523688.com") || d(h, "8800888.com") || d(h, "aldm88.com") || d(h, "niux88.com")) return BLACK;
            } else if (d(h, "a8.com") || d(h, "tuite8.com") || d(h, "at918.com") || d(h, "xt918.com") || d(h, "txjy2008.com") || d(h, "pk38.com") || d(h, "ok8848.com") || d(h, "union178.com") || d(h, "jinniu168.com")) return BLACK;
        }
        if (t == "a") {
            if (z == "i") {
                if (d(h, "engine.a.redditmedia.com") || d(h, "vdopia.com") || d(h, "adex.bmediaasia.com") || d(h, "youxjia.com") || d(h, "adex2.bmediaasia.com") || d(h, "wigetmedia.com") || d(h, "amazemobilemedia.com") || d(h, "hdtmedia.com") || d(h, "shurumedia.com") || d(h, "tremormedia.com") || d(h, "xtendmedia.com") || d(h, "cdn.millennialmedia.com") || d(h, "lfstmedia.com") || d(h, "conversantmedia.com") || d(h, "andomedia.com")) return BLACK;
            } else if (z == "r") {
                if (d(h, "transpera.com") || d(h, "adserver.pandora.com") || d(h, "atedra.com") || d(h, "stats.pandora.com")) return BLACK;
            } else if (z == "t") {
                if (d(h, "admeta.com") || d(h, "plista.com") || d(h, "niwota.com")) return BLACK;
            } else if (z == "v") {
                if (d(h, "adelva.com") || d(h, "kochava.com") || d(h, "mojiva.com")) return BLACK;
            } else if (d(h, "u.*.iciba.com") || d(h, "ee4kdushuba.com") || d(h, "atemda.com") || d(h, "37ha.com") || d(h, "adtoma.com") || d(h, "atwola.com") || d(h, "bnmla.com") || d(h, "komoona.com") || d(h, "eclkmpsa.com") || d(h, "soua.com") || d(h, "de17a.com") || d(h, "ertya.com") || d(h, "oeya.com") || d(h, "2a.com") || d(h, "videoplaza.com")) return BLACK;
        }
        if (t == "c") {
            if (z == "i") {
                if (d(h, "cxpublic.com") || d(h, "pubmatic.com") || d(h, "ubmcmm.baidustatic.com") || d(h, "adsymptotic.com")) return BLACK;
            } else if (d(h, "uctrac.com") || d(h, "131cc.com") || d(h, "contentabc.com") || d(h, "adztec.com") || d(h, "samboc.com") || d(h, "newsinc.com") || d(h, "adbouc.com") || d(h, "365tc.com")) return BLACK;
        }
        if (t == "b") {
            if (z == "a") {
                if (d(h, "crosspromo.zeptolab.com") || d(h, "bms.zeptolab.com") || d(h, "asp.animelab.com")) return BLACK;
            } else if (z == "e") {
                if (d(h, "ucweb.com") || d(h, "ox\u002Dd.advanceweb.com") || d(h, "sa.entireweb.com") || d(h, "visitweb.com")) return BLACK;
            } else if (z == "o") {
                if (d(h, "admob.com") || d(h, "hot\u002Dmob.com") || d(h, "revmob.com")) return BLACK;
            } else if (d(h, "m2pub.com") || d(h, "tremorhub.com") || d(h, "116b.com")) return BLACK;
        }
        if (t == "e") {
            if (z == "c") {
                if (d(h, "widespace.com") || d(h, "startappservice.com") || d(h, "valuecommerce.com") || d(h, "adnetworkperformance.com") || d(h, "myspace.com") || d(h, "delivery.trafficforce.com")) return BLACK;
            } else if (z == "e") {
                if (d(h, "cs.37see.com") || d(h, "wauee.com") || d(h, "feesee.com") || d(h, "diankee.com") || d(h, "9wee.com") || d(h, "amobee.com") || d(h, "myiee.com")) return BLACK;
            } else if (z == "g") {
                if (d(h, "bounceexchange.com") || s(u, "*admax*") && d(h, "nexage.com") || d(h, "tradeadexchange.com") || d(h, "startappexchange.com") || d(h, "adsage.com") || d(h, "adkengage.com")) return BLACK;
            } else if (z == "i") {
                if (d(h, "87ie.com") || d(h, "wiseie.com") || d(h, "guobie.com")) return BLACK;
            } else if (z == "m") {
                if (d(h, "198game.com") || d(h, "sumome.com") || d(h, "re\u002Ddirectme.com") || d(h, "lockerdome.com") || d(h, "ad4game.com") || d(h, "155game.com") || d(h, "129game.com")) return BLACK;
            } else if (z == "n") {
                if (d(h, "admngronline.com") || d(h, "algovid.com") && s(u, "*watchcartoononline*") || d(h, "madsone.com") || d(h, "adservone.com") || d(h, "100tone.com")) return BLACK;
            } else if (z == "s") {
                if (d(h, "clickfuse.com") || d(h, "adinfuse.com") || d(h, "mobilefuse.com") || d(h, "openxenterprise.com") || d(h, "adhese.com") || d(h, "postrelease.com") || d(h, "uauniverse.com") || d(h, "tksense.com") || d(h, "trafficposse.com") || d(h, "cxense.com")) return BLACK;
            } else if (z == "r") {
                if (d(h, "omniture.com") || d(h, "awempire.com") || d(h, "livefyre.com")) return BLACK;
            } else if (z == "u") {
                if (d(h, "visualrevenue.com") || d(h, "qi\u002Dyue.com") || d(h, "tg.feixue.com")) return BLACK;
            } else if (z == "v") {
                if (d(h, "adsnative.com") || d(h, "quantserve.com") || d(h, "swrve.com") || d(h, "inner\u002Dactive.com") || d(h, "pushnative.com") || d(h, "redirectnative.com") || d(h, "advertserve.com")) return BLACK;
            } else if (d(h, "delivery.brokerbabe.com") || d(h, "adotube.com") || d(h, "adblade.com") || d(h, "assets.cookieconsent.silktide.com") || d(h, "behe.com") || d(h, "plus.google.com") || d(h, "vungle.com") || d(h, "advooe.com") || d(h, "greystripe.com") || d(h, "pubdirecte.com") || d(h, "adyeye.com")) return BLACK;
        }
        if (t == "d") {
            if (z == "a") {
                if (d(h, "v5ad.com") || d(h, "medibaad.com") || d(h, "5566ad.com") || d(h, "resource.gamediad.com") || d(h, "brucelead.com") || d(h, "d9ad.com") || d(h, "opt.ximad.com") || d(h, "d1ad.com") || d(h, "5uad.com") || d(h, "restartad.com") || d(h, "zhiad.com") || d(h, "egooad.com") || d(h, "mediamixad.com") || d(h, "amoad.com") || d(h, "tenoad.com") || d(h, "9wad.com") || d(h, "dotandad.com") || d(h, "hoyiad.com") || d(h, "sbs\u002Dad.com") || d(h, "fam\u002Dad.com") || d(h, "xixianad.com") || d(h, "5151ad.com") || d(h, "sprout\u002Dad.com") || d(h, "baitaiad.com") || d(h, "bead\u002Dad.com") || d(h, "admitad.com") || d(h, "exit\u002Dad.com")) return BLACK;
            } else if (z == "i") {
                if (d(h, "mgid.com") || d(h, "marketgid.com") || d(h, "innovid.com")) return BLACK;
            } else if (z == "l") {
                if (d(h, "hdtworld.com") || d(h, "cpmadworld.com") || d(h, "360yield.com")) return BLACK;
            } else if (d(h, "nyyed.com") || d(h, "adspeed.com") || d(h, "appflood.com") || d(h, "lianjie.phpwind.com") || d(h, "e.phpwind.com") || d(h, "unityads.unity3d.com") || d(h, "untd.com") || d(h, "999d.com")) return BLACK;
        }
        if (t == "g") {
            if (z == "n") {
                if (d(h, "bnserving.com") || d(h, "cold\u002Dcold\u002Dfreezing.com") || d(h, "8peng.com") || d(h, "billytesting.com") || d(h, "down.jialichuang.com") || d(h, "ezsaving.com") || d(h, "dilingling.com") || d(h, "wanliuliang.com") || d(h, "100peng.com") || d(h, "qling.com") || d(h, "flashtalking.com") || d(h, "kairing.com") || d(h, "mobileapptracking.com") || d(h, "advertising.com") || d(h, "integral\u002Dmarketing.com") || d(h, "newwang.com") || d(h, "aoparking.com")) return BLACK;
            } else if (d(h, "mathtag.com") || d(h, "trafmag.com") || d(h, "92cg.com") || d(h, "178gg.com")) return BLACK;
        }
        if (t == "i") {
            if (z == "a") {
                if (d(h, "insightexpressai.com") || d(h, "duomai.com") || d(h, "cdn.media.amp.avai.com") || d(h, "ilepai.com") || d(h, "p.37lai.com") || d(h, "adhai.com")) return BLACK;
            } else if (z == "b") {
                if (d(h, "zumobi.com") || d(h, "inmobi.com") || d(h, "bebi.com")) return BLACK;
            } else if (z == "m") {
                if (d(h, "ctrmi.com") || d(h, "livesmi.com") || d(h, "dotomi.com")) return BLACK;
            } else if (z == "u") {
                if (d(h, "adszui.com") || d(h, "keytui.com") || d(h, "unlitui.com")) return BLACK;
            } else if (d(h, "gouwu.vip.xunlei.com") || d(h, "jsunion.kankan.xunlei.com") || d(h, "san\u002Dni\u002Dichi.com") || d(h, "sitemaji.com") || d(h, "admaji.com") || d(h, "chenjingli.com") || d(h, "huoli.com") || d(h, "kuqi.com") || d(h, "upsight\u002Dapi.com") || d(h, "mobusi.com") || d(h, "17leyi.com") || d(h, "dxssiyi.com") || d(h, "u.juyouxi.com") || d(h, "t.iloveyouxi.com")) return BLACK;
        }
        if (t == "h") {
            if (z == "s") {
                if (d(h, "europacash.com") || d(h, "airpush.com") || d(h, "adcash.com")) return BLACK;
            } else if (z == "c") {
                if (d(h, "adinch.com") || d(h, "scorecardresearch.com") || d(h, "izptech.com") || d(h, "aimatch.com") || d(h, "adnotch.com") || d(h, "clmbtech.com")) return BLACK;
            } else if (d(h, "chinaih.com") || d(h, "sharethrough.com") || d(h, "adbooth.com") || d(h, "u1th.com")) return BLACK;
        }
        if (t == "k") {
            if (z == "c") {
                if (d(h, "redu\u002Dclick.com") || d(h, "openclick.com") || d(h, "exoclick.com") || d(h, "block.s5block.com")) return BLACK;
            } else if (z == "n") {
                if (d(h, "51link.com") || d(h, "displink.com") || d(h, "bolebank.com")) return BLACK;
            } else if (d(h, "iconpeak.com") || d(h, "ackak.com") || d(h, "web.7k7k.com") || d(h, "kk7kk.com") || s(u, "*get_ad.php*") && d(h, "tapatalk.com") || d(h, "adapi.addealsnetwork.com") || d(h, "adzerk.com") || d(h, "7stk.com") || d(h, "unionwk.com")) return BLACK;
        }
        if (t == "j") {
            if (d(h, "tjj.com") || d(h, "click.5j.com") || d(h, "boosj.com") || d(h, "gsdwj.com")) return BLACK;
        }
        if (t == "m") {
            if (z == "e") {
                if (d(h, "dra.amazon\u002Dadsystem.com") || d(h, "s.amazon\u002Dadsystem.com") || d(h, "api.unthem.com") || d(h, "aax\u002Deu.amazon\u002Dadsystem.com") || d(h, "aax\u002Dus\u002Deast.amazon\u002Dadsystem.com") || d(h, "c.amazon\u002Dadsystem.com") || d(h, "ir\u002Dna.amazon\u002Dadsystem.com") || d(h, "aax\u002Dus\u002Dpdx.amazon\u002Dadsystem.com") || d(h, "agrantsem.com") || d(h, "unthem.com") || d(h, "aax.amazon\u002Dadsystem.com")) return BLACK;
            } else if (z == "l") {
                if (d(h, "meidulm.com") || d(h, "7794lm.com") || d(h, "2273lm.com") || d(h, "c.sfilm.com") || d(h, "74lm.com") || d(h, "114lm.com")) return BLACK;
            } else if (z == "p") {
                if (d(h, "ubcpm.com") || d(h, "37cpm.com") || d(h, "unioncpm.com") || d(h, "yxcpm.com")) return BLACK;
            } else if (z == "r") {
                if (d(h, "lentainform.com") || d(h, "castplatform.com") || d(h, "adform.com") || d(h, "waystorm.com")) return BLACK;
            } else if (d(h, "redtram.com") || d(h, "yoyocm.com") || d(h, "socdm.com") || d(h, "ad120m.com") || d(h, "8888mmm.com") || d(h, "epom.com") || d(h, "sessionm.com") || d(h, "ad131m.com") || d(h, "crittercism.com") || d(h, "ad132m.com") || d(h, "gumgum.com") || d(h, "adnium.com") || d(h, "mdotm.com") || d(h, "ad127m.com") || d(h, "adcel.vrvm.com")) return BLACK;
        }
        if (t == "l") {
            if (z == "a") {
                if (d(h, "appodeal.com") || d(h, "exponential.com") || d(h, "ad.prismamediadigital.com") || d(h, "adversal.com")) return BLACK;
            } else if (z == "e") {
                if (d(h, "mixpanel.com") || d(h, "padsdel.com") || d(h, "xiaoangel.com")) return BLACK;
            } else if (z == "l") {
                if (d(h, "btrll.com") || d(h, "uucall.com") || d(h, "adroll.com") || d(h, "misterbell.com") || d(h, "brightroll.com")) return BLACK;
            } else if (d(h, "nznbl.com") || d(h, "liverail.com") || d(h, "googleadsl.com") || d(h, "adwhirl.com") || d(h, "coinurl.com") || d(h, "projectwonderful.com") || d(h, "adjwl.com")) return BLACK;
        }
        if (t == "o") {
            if (z == "a") {
                if (d(h, "diangao.com") || d(h, "daoyoudao.com") || d(h, "shouyibao.com") || d(h, "qizhao.com") || d(h, "90hao.com") || d(h, "tazhao.com") || d(h, "molidao.com") || d(h, "qutaotao.com") || d(h, "jugao.com")) return BLACK;
            } else if (z == "e") {
                if (d(h, "criteo.com") || d(h, "veeseo.com") || d(h, "wbdds.jeuxvideo.com")) return BLACK;
            } else if (z == "g") {
                if (d(h, "77go.com") || d(h, "chango.com") || d(h, "gocsgo.com")) return BLACK;
            } else if (z == "o") {
                if (d(h, "ugoooo.com") || d(h, "adserver.yahoo.com") || d(h, "code.100goo.com") || d(h, "tuigoo.com") || d(h, "analytics.yahoo.com") || d(h, "soo\u002Dboo.com") || d(h, "ads.yahoo.com") || d(h, "gemini.yahoo.com") || d(h, "beap\u002Dbc.yahoo.com") || d(h, "partnerads.ysm.yahoo.com") || d(h, "soundwave.mobile.yahoo.com") || d(h, "adqoo.com")) return BLACK;
            } else if (d(h, "globaltraffico.com") || d(h, "sekindo.com") || d(h, "zedo.com") || d(h, "49ko.com") || d(h, "qtmojo.com") || d(h, "yieldmo.com") || d(h, "adsbro.com") || d(h, "9buo.com") || d(h, "smaato.com") || d(h, "koowo.com") || d(h, "yluvo.com")) return BLACK;
        }
        if (t == "n") {
            if (z == "a") {
                if (d(h, "000wan.com") || d(h, "chinesean.com") || d(h, "aaalian.com") || d(h, "77zhuan.com") || d(h, "resmkt.dipan.com") || d(h, "333wan.com") || d(h, "womenwan.com") || d(h, "kuaiwan.com") || d(h, "kfwan.com") || d(h, "ttmsg.qianqian.com")) return BLACK;
            } else if (z == "e") {
                if (d(h, "huaqimen.com") || d(h, "playhaven.com") || d(h, "cocoren.com") || d(h, "webterren.com")) return BLACK;
            } else if (z == "d") {
                if (d(h, "c.jsrdn.com") || d(h, "eacdn.com") || d(h, "akncdn.com") || d(h, "cb\u002Dcdn.com") || d(h, "online\u002Ddn.com") || d(h, "domobcdn.com") || d(h, "inmobicdn.com") || d(h, "disquscdn.com")) return BLACK;
            } else if (z == "i") {
                if (d(h, "360kaixin.com") || d(h, "outbrain.com") || d(h, "linkedin.com") || d(h, "dianxin.com") || d(h, "applovin.com") || d(h, "yiqiwin.com")) return BLACK;
            } else if (z == "o") {
                if (d(h, "qlunion.com") || d(h, "vpon.com") || d(h, "amazonaws.com") && s(u, "*/adversion*") || d(h, "adition.com") || d(h, "diyiunion.com") || d(h, "ylunion.com") || d(h, "yuunion.com") || d(h, "tribalfusion.com") || d(h, "ppunion.com") || d(h, "trackimpression.com") || d(h, "yeeunion.com") || d(h, "baizoon.com") || d(h, "nspmotion.com") || d(h, "adfalcon.com") || d(h, "oounion.com") || d(h, "ytunion.com") || d(h, "21union.com") || d(h, "mopub.com") && !s(u, "*filmon*") || d(h, "performancehorizon.com") || d(h, "wyunion.com") || d(h, "clkmon.com")) return BLACK;
            } else if (z == "s") {
                if (d(h, "advertising.jp.msn.com") || d(h, "ads1.jp.msn.com") || d(h, "utm.sankei.jp.msn.com") || d(h, "c.jp.msn.com")) return BLACK;
            } else if (z == "r") {
                if (d(h, "ziiporn.com") || d(h, "turn.com") || d(h, "mtburn.com")) return BLACK;
            } else if (z == "u") {
                if (d(h, "promotion.aliyun.com") || d(h, "a1click.aiqun.com") || d(h, "bbs66shun.com") || d(h, "17kuxun.com") || d(h, "789un.com") || d(h, "artxun.com")) return BLACK;
            } else if (s(u, "*/partner\u002Dhp\u002Diphone/*") && d(h, "compositor.api.cnn.com") || d(h, "image.qndown.com")) return BLACK;
        }
        if (t == "p") {
            if (z == "a") {
                if (d(h, "heyzap.com") || d(h, "a.jumptap.com") || d(h, "appserver\u002Dap.com")) return BLACK;
            } else if (z == "o") {
                if (d(h, "rtbpop.com") || d(h, "u.imop.com") || d(h, "adtop.com")) return BLACK;
            } else if (z == "p") {
                if (d(h, "testflightapp.com") || d(h, "startapp.com") || d(h, "user\u002Dagent\u002Dtracker.herokuapp.com") || d(h, "blogupp.com")) return BLACK;
            } else if (d(h, "gglmcp.com") || d(h, "media\u002Drep.com") || d(h, "559gp.com") || d(h, "urbanairship.com") || d(h, "inmobi\u002Djp.com") || d(h, "onedmp.com") || d(h, "addisp.com")) return BLACK;
        }
        if (t == "s") {
            if (z == "c") {
                if (d(h, "medialytics.com") || d(h, "crashlytics.com") || d(h, "localytics.com") || !s(u, "*/ga.js") && !s(u, "*/analytics.js") && d(h, "google\u002Danalytics.com")) return BLACK;
            } else if (z == "d") {
                if (d(h, "marsads.com") || d(h, "buysellads.com") || d(h, "moatads.com") || d(h, "1phads.com") || d(h, "ketads.com") || d(h, "mng\u002Dads.com") || d(h, "zestads.com") || d(h, "juicyads.com") || d(h, "bcfads.com") || d(h, "beaverads.com") || d(h, "exoticads.com") || d(h, "mobile.aws.weather.com") && s(u, "*/ads.json") || d(h, "hotwords.com") || d(h, "openvideoads.com") || d(h, "pflexads.com") || d(h, "onclkds.com") || d(h, "tapjoyads.com") || d(h, "carbonads.com") || d(h, "yimeiads.com") || d(h, "appads.com") || d(h, "zwads.com") || d(h, "youtube.com") && s(u, "*/_get_ads*") || d(h, "mads.com") || d(h, "propellerads.com") || d(h, "mellowads.com") || d(h, "buzzads.com") || d(h, "medyanetads.com")) return BLACK;
            } else if (z == "k") {
                if (d(h, "mobtrks.com") || d(h, "ox\u002Dd.majorgeeks.com") || d(h, "keywordblocks.com") || d(h, "infolinks.com") || d(h, "terraclicks.com") || d(h, "ecpmrocks.com") || d(h, "mobytrks.com") || d(h, "yumenetworks.com") || d(h, "adtaxinetworks.com") || d(h, "hkg1.aastocks.com")) return BLACK;
            } else if (z == "r") {
                if (d(h, "guoshipartners.com") || d(h, "traffpartners.com") || !s(u, "*.gif*") && d(h, "mpnrs.com")) return BLACK;
            } else if (z == "u") {
                if (d(h, "ligatus.com") || d(h, "disqus.com") || d(h, "traffichaus.com")) return BLACK;
            } else if (z == "t") {
                if (d(h, "adacts.com") || d(h, "medialets.com") || d(h, "bbelements.com")) return BLACK;
            } else if (d(h, "mylovewebs.com") || d(h, "admeasures.com") || d(h, "1717gs.com") || d(h, "addthis.com") && !d(h, "s7.addthis.com") || d(h, "andmejs.com") || d(h, "clkdeals.com") || d(h, "otherlevels.com") || d(h, "propellerpops.com") || d(h, "17pps.com") || d(h, "ad\u002Dsys.com") || d(h, "serving\u002Dsys.com") || d(h, "adnxs.com") || d(h, "drnxs.com")) return BLACK;
        }
        if (t == "r") {
            if (z == "a") {
                if (d(h, "adgear.com") || d(h, "apsalar.com") || d(h, "gravatar.com") || d(h, "58ar.com") || d(h, "cpmstar.com")) return BLACK;
            } else if (z == "e") {
                if (d(h, "kixer.com") || d(h, "yieldmanager.com") || d(h, "eyewonder.com") || d(h, "adkeeper.com") || d(h, "appsflyer.com") || d(h, "mob\u002Dserver.com") || d(h, "ad\u002Dcenter.com") || d(h, "fyber.com") || d(h, "smartadserver.com") || d(h, "wwwpromoter.com") || d(h, "statcounter.com") || !s(u, "*/click*") && !s(u, "*itunesredir*") && d(h, "tradedoubler.com") || d(h, "liveadexchanger.com") || d(h, "sitemeter.com") || d(h, "js.91tiger.com") || d(h, "vkmonster.com") || d(h, "bidvertiser.com") || d(h, "applifier.com")) return BLACK;
            } else if (z == "o") {
                if (d(h, "exelator.com") || d(h, "image.click.livedoor.com") || d(h, "adtailor.com")) return BLACK;
            } else if (d(h, "clickmngr.com") || d(h, "ad\u002Dstir.com") || d(h, "szvr.com")) return BLACK;
        }
        if (t == "u") {
            if (z == "d") {
                if (d(h, "spcode.baidu.com") || d(h, "pos.baidu.com") || d(h, "tajianedu.com") || d(h, "cpro.baidu.com") || d(h, "jsmbaidu.com") || d(h, "mobads.baidu.com") || d(h, "drmcmm.baidu.com") || d(h, "cb.baidu.com") || d(h, "cbjs.baidu.com") || d(h, "iwanad.baidu.com") || d(h, "duiwai.baidu.com") || d(h, "redu.com") || d(h, "eiv.baidu.com") || d(h, "hao123union.baidu.com")) return BLACK;
            } else if (d(h, "zfjiu.com") || d(h, "cluclick.leshu.com") || d(h, "adzhu.com") || d(h, "1gou.com") || !d(h, "media.sailthru.com") && d(h, "sailthru.com") || d(h, "leadzu.com")) return BLACK;
        }
        if (t == "t") {
            if (z == "e") {
                if (d(h, "adsmarket.com") || d(h, "questionmarket.com") || d(h, "zergnet.com") || d(h, "teasernet.com")) return BLACK;
            } else if (z == "f") {
                if (d(h, "igpiphone.gameloft.com") || d(h, "ingameads.gameloft.com") || d(h, "201205igp.gameloft.com") || d(h, "igp06.gameloft.com") || d(h, "578756.gameloft.com") || d(h, "cdn.applift.com")) return BLACK;
            } else if (z == "n") {
                if (d(h, "kucent.com") || d(h, "adsinstant.com") || d(h, "revcontent.com") || d(h, "quantcount.com") || d(h, "liveintent.com") || d(h, "app.cookieassistant.com")) return BLACK;
            } else if (z == "s") {
                if (d(h, "admost.com") || d(h, "vadcast.com") || d(h, "chartboost.com")) return BLACK;
            } else if (d(h, "chartbeat.com") || d(h, "rubiconproject.com") || d(h, "appsdt.com") || d(h, "lijit.com") || d(h, "hghit.com") || d(h, "mobiright.com") || d(h, "atdmt.com") || d(h, "leadbolt.com") || !s(u, "*configure*") && d(h, "adtilt.com") || d(h, "avocarrot.com") || d(h, "georiot.com") || d(h, "apprupt.com") || d(h, "reklamport.com") || d(h, "adexprt.com") || d(h, "scanscout.com") || d(h, "intellitxt.com") || d(h, "appnext.com")) return BLACK;
        }
        if (t == "w") {
            if (d(h, "yczpw.com") || d(h, "csbew.com") || d(h, "adnow.com") || d(h, "bannerflow.com") || d(h, "rekanw.com")) return BLACK;
        }
        if (t == "v") {
            if (z == "d") {
                if (d(h, "code.xwadv.com") || d(h, "doubleadv.com") || d(h, "coinadv.com")) return BLACK;
            } else if (d(h, "onclasrv.com") || d(h, "n208adserv.com") || d(h, "clkrev.com") || d(h, "directrev.com") || d(h, "tom.itv.com")) return BLACK;
        }
        if (t == "y") {
            if (z == "l") {
                if (d(h, "parsely.com") || d(h, "4dsply.com") || d(h, "adtaily.com") || d(h, "adsupply.com")) return BLACK;
            } else if (z == "r") {
                if (d(h, "mobiletheory.com") || d(h, "ads.flurry.com") || d(h, "flurry.com")) return BLACK;
            } else if (d(h, "sponsorpay.com") || d(h, "channelray.com") || d(h, "netgy.com") || d(h, "doubleverify.com") || d(h, "33hy.com") || d(h, "trafficjunky.com") || d(h, "tapjoy.com") || d(h, "adcolony.com") || d(h, "234y.com") || d(h, "eeyy.com") || d(h, "gravity.com")) return BLACK;
        }
        if (t == "x") {
            if (z == "n") {
                if (d(h, "servedbyopenx.com") || d(h, "openx.com") || d(h, "tanx.com")) return BLACK;
            } else if (d(h, "blcx.com") || d(h, "atlassbx.com") || d(h, "mediaplex.com") || d(h, "adpdx.com") || d(h, "biddingx.com") || d(h, "mobclix.com") || d(h, "mobfox.com") || d(h, "emarbox.com") || d(h, "ssjpx.com") || d(h, "1x3x.com") || d(h, "adk2x.com") || d(h, "cdn.caprofitx.com") || d(h, "70yx.com") || d(h, "p.777wyx.com") || d(h, "4hzx.com")) return BLACK;
        }
        if (t == "z") {
            if (d(h, "adbuddiz.com") || d(h, "s.vipcnzz.com") || d(h, "37dz.com") || d(h, "zestadz.com") || d(h, "altrooz.com") || d(h, "caiyifz.com")) return BLACK;
        }
        if (d(h, "ximad.com") && s(u, "*/ad3/*") || d(h, "js.tjq.com")) return BLACK;
    } else if (b == "net") {
        if (t == "5") {
            if (d(h, "am15.net") || d(h, "9165.net")) return BLACK;
        }
        if (t == "8") {
            if (d(h, "nex8.net") || d(h, "a8.net")) return BLACK;
        }
        if (t == "a") {
            if (d(h, "adorika.net") || d(h, "chitika.net") || d(h, "clickterra.net") || d(h, "u.www.duba.net")) return BLACK;
        }
        if (t == "c") {
            if (d(h, "app\u002Dc.net") || d(h, "yocc.net") || d(h, "adfonic.net") || d(h, "tttccc.net")) return BLACK;
        }
        if (t == "e") {
            if (d(h, "redintelligence.net") || d(h, "accesstrade.net") || d(h, "mobile.yandexadexchange.net") || d(h, "mobilefuse.net") || d(h, "adglare.net") || d(h, "yen.appsfire.net") || d(h, "trafficgate.net") || d(h, "api.pubnative.net") || d(h, "adverserve.net")) return BLACK;
        }
        if (t == "d") {
            if (z == "a") {
                if (!d(h, "heise.nuggad.net") && d(h, "nuggad.net") || d(h, "microad.net") || d(h, "behaviad.net") || d(h, "content\u002Dad.net")) return BLACK;
            } else if (d(h, "kcld.net") || d(h, "rnmd.net") || d(h, "dddddd.net") || d(h, "nend.net")) return BLACK;
        }
        if (t == "g") {
            if (d(h, "flashwing.net") || d(h, "e\u002Dplanning.net") || d(h, "adimg.net")) return BLACK;
        }
        if (t == "i") {
            if (d(h, "cop.my.sandai.net") || d(h, "jingpi.net") || d(h, "revsci.net") || d(h, "jingwei.net") || d(h, "youxitui.net")) return BLACK;
        }
        if (t == "h") {
            if (d(h, "premium.2ch.net") || d(h, "adbooth.net")) return BLACK;
        }
        if (t == "k") {
            if (d(h, "bodyclick.net") || d(h, "fastclick.net") || d(h, "adzerk.net") || d(h, "connect.decknetwork.net") || d(h, "astrsk.net")) return BLACK;
        }
        if (t == "m") {
            if (d(h, "kadam.net") || d(h, "adform.net") || d(h, "adverticum.net") || d(h, "alea.adam.daum.net") || d(h, "cpvm.net")) return BLACK;
        }
        if (t == "o") {
            if (d(h, "criteo.net") || d(h, "adsmogo.net") || d(h, "reporo.net") || d(h, "smaato.net")) return BLACK;
        }
        if (t == "n") {
            if (z == "d") {
                if (d(h, "inmobicdn.net") || d(h, "popadscdn.net") || d(h, "mxcdn.net") || d(h, "s1.2mdn.net")) return BLACK;
            } else if (d(h, "ichi\u002Dni\u002Dsan.net") || d(h, "wofan.net") || d(h, "ujoin.net") || d(h, "3munion.net")) return BLACK;
        }
        if (t == "p") {
            if (d(h, "lduhtrp.net") || d(h, "adformdsp.net") || d(h, "smartclip.net")) return BLACK;
        }
        if (t == "s") {
            if (z == "d") {
                if (d(h, "msads.net") || d(h, "popads.net") || d(h, "everestads.net") || d(h, "carbonads.net") || d(h, "bloggerads.net") || d(h, "onclickads.net")) return BLACK;
            } else if (d(h, "playnomics.net") || d(h, "vaxadserver.azurewebsites.net") || d(h, "zucks.net") || d(h, "leadboltapps.net") || d(h, "adcrops.net") || d(h, "adsellers.net") || d(h, "intermarkets.net")) return BLACK;
        }
        if (t == "r") {
            if (z == "e") {
                if (d(h, "readserver.net") || d(h, "admaster.net") || d(h, "hk.chinesegamer.net") || d(h, "adjuggler.net") || d(h, "admixer.net")) return BLACK;
            } else if (d(h, "advertstar.net") || d(h, "adsfactor.net") || d(h, "adadvisor.net")) return BLACK;
        }
        if (t == "t") {
            if (d(h, "directadvert.net") || d(h, "adsrocket.net") || d(h, "leadbolt.net") || d(h, "keydot.net") || d(h, "kontagent.net")) return BLACK;
        }
        if (t == "y") {
            if (d(h, "kdly.net") || d(h, "buzzcity.net") || d(h, "innity.net") || d(h, "trafficjunky.net")) return BLACK;
        }
        if (t == "x") {
            if (d(h, "r0.mradx.net") || d(h, "openx.net") || d(h, "mradx.net")) return BLACK;
        }
        if (t == "z") {
            if (d(h, "3gpz.net") || d(h, "adm\u002Dcnzz.net")) return BLACK;
        }
        if (d(h, "11l11.net") || d(h, "mg.dt00.net") || d(h, "2o7.net") || d(h, "wan789.net") || d(h, "cubecdn.net") && s(u, "*/js/loader_*") || d(h, "yieldlab.net") || d(h, "js.ssrj.net") || d(h, "crwdcntrl.net") || d(h, "adru.net") || d(h, "uimserv.net")) return BLACK;
    } else if (b == "jp") {
        if (t == "a") {
            if (z == "b") {
                if (d(h, "spstaticimg.ameba.jp") || d(h, "ad.pr.ameba.jp") || d(h, "mediba.jp")) return BLACK;
            } else if (d(h, "newzia.jp") || d(h, "yicha.jp")) return BLACK;
        }
        if (t == "e") {
            if (z == "n") {
                if (d(h, "atech.ne.jp") || d(h, "ad.goo.ne.jp") || d(h, "adcdn.goo.ne.jp") || d(h, "d2c.ne.jp") || d(h, "doubleclick.ne.jp") || d(h, "owb101.goo.ne.jp")) return BLACK;
            } else if (d(h, "app\u002Dadforce.jp") || d(h, "ad\u002Dmove.jp") || d(h, "imobile.jp") || d(h, "guile.jp") || d(h, "adinte.jp")) return BLACK;
        }
        if (t == "d") {
            if (z == "a") {
                if (d(h, "aid\u002Dad.jp") || d(h, "microad.jp") || d(h, "bnr.rssad.jp") || d(h, "livead.jp") || d(h, "soraad.jp") || d(h, "trax\u002Dad.jp") || d(h, "impact\u002Dad.jp") || d(h, "smaad.jp")) return BLACK;
            } else if (d(h, "ad\u002Dcloud.jp") || d(h, "adcloud.jp")) return BLACK;
        }
        if (t == "g") {
            if (z == "m") {
                if (d(h, "ah.yimg.jp") || d(h, "yads.c.yimg.jp") || d(h, "im.c.yimg.jp") || d(h, "zimg.jp")) return BLACK;
            } else if (d(h, "jlisting.jp") || d(h, "advg.jp")) return BLACK;
        }
        if (t == "o") {
            if (z == "c") {
                if (d(h, "glossom.co.jp") || d(h, "ard.yahoo.co.jp") || d(h, "ov.yahoo.co.jp") || d(h, "im.ov.yahoo.co.jp") || d(h, "rd.ane.yahoo.co.jp") || d(h, "yads.yahoo.co.jp") || d(h, "b97.yahoo.co.jp") || d(h, "fc.itmedia.co.jp") || d(h, "listing.yahoo.co.jp") || d(h, "yad.yahoo.co.jp") || d(h, "mixi.co.jp") || d(h, "unitedblades.co.jp") || d(h, "feedback.promotionalads.yahoo.co.jp") || d(h, "b92.yahoo.co.jp") || d(h, "dlv.itmedia.co.jp") || d(h, "bc.geocities.yahoo.co.jp") || d(h, "yads.yjtag.yahoo.co.jp") || d(h, "yeas.yahoo.co.jp") || d(h, "smartads.mobile.yahoo.co.jp") || d(h, "logly.co.jp") || d(h, "i\u002Dmobile.co.jp") || d(h, "zucks.co.jp") || d(h, "tb.itmedia.co.jp")) return BLACK;
            } else if (d(h, "ads.nicovideo.jp")) return BLACK;
        }
        if (t == "p") {
            if (d(h, "gmossp\u002Dsp.jp") || d(h, "adjust\u002Dsp.jp") || d(h, "adresult\u002Dsp.jp")) return BLACK;
        }
        if (t == "s") {
            if (d(h, "aag.yahooapis.jp") || d(h, "doprads.jp") || d(h, "adlantis.jp") || d(h, "bypass.jp")) return BLACK;
        }
        if (t == "t") {
            if (z == "e") {
                if (d(h, "adjust\u002Dnet.jp") || d(h, "altnet.jp") || d(h, "openxmarket.jp")) return BLACK;
            } else if (z == "s") {
                if (d(h, "ad.mist.jp") || d(h, "maist.jp") || d(h, "dynalyst.jp")) return BLACK;
            } else if (d(h, "gsspat.jp") || d(h, "adresult.jp") || d(h, "gssprt.jp") || d(h, "fout.jp")) return BLACK;
        }
        if (t == "v") {
            if (d(h, "genieesspv.jp") || d(h, "ad\u002Dv.jp") || d(h, "adcv.jp")) return BLACK;
        }
        if (d(h, "smart\u002Dc.jp") || d(h, "media\u002Db.jp") || d(h, "mreco0.jp") || d(h, "i2i.jp") || d(h, "consearch.jp") || d(h, "mb\u002Dclick.jp") || d(h, "buzzurl.jp") || d(h, "webtracker.jp") || d(h, "fancrew.jp") || d(h, "openx.jp")) return BLACK;
    } else if (b == "ru") {
        if (t == "a") {
            if (d(h, "pingmedia.ru") || d(h, "bubblesmedia.ru") || d(h, "kibirata.ru")) return BLACK;
        }
        if (t == "b") {
            if (d(h, "adbomb.ru") || d(h, "addweb.ru") || d(h, "adhub.ru")) return BLACK;
        }
        if (t == "e") {
            if (d(h, "et\u002Dcode.ru") || d(h, "adcomplete.ru") || d(h, "adtime.ru") || d(h, "adname.ru")) return BLACK;
        }
        if (t == "d") {
            if (d(h, "adwad.ru") || d(h, "leadgid.ru") || d(h, "profitwizard.ru") || d(h, "medialand.ru") || d(h, "adland.ru")) return BLACK;
        }
        if (t == "i") {
            if (d(h, "admulti.ru") || d(h, "admobi.ru")) return BLACK;
        }
        if (t == "k") {
            if (z == "c") {
                if (d(h, "nclick.ru") || d(h, "redclick.ru") || d(h, "pay\u002Dclick.ru") || d(h, "adsclick.ru") || d(h, "adrock.ru")) return BLACK;
            } else if (d(h, "adstark.ru") || d(h, "bannerbank.ru")) return BLACK;
        }
        if (t == "m") {
            if (d(h, "kadam.ru") || d(h, "adpremium.ru")) return BLACK;
        }
        if (t == "l") {
            if (d(h, "r0.mail.ru") || d(h, "ad.mail.ru")) return BLACK;
        }
        if (t == "o") {
            if (d(h, "byzgoso.ru") || d(h, "yadro.ru")) return BLACK;
        }
        if (t == "n") {
            if (z == "o") {
                if (d(h, "gdeslon.ru") || d(h, "myragon.ru") || d(h, "advaction.ru")) return BLACK;
            } else if (d(h, "rotaban.ru") || d(h, "adbn.ru") || d(h, "begun.ru")) return BLACK;
        }
        if (t == "p") {
            if (d(h, "m1\u002Dshop.ru") || d(h, "wmip.ru") || d(h, "luxup.ru")) return BLACK;
        }
        if (t == "s") {
            if (z == "d") {
                if (d(h, "adhands.ru") || d(h, "cityads.ru") || d(h, "lcads.ru") || d(h, "actionads.ru") || d(h, "pc2ads.ru") || d(h, "mobiads.ru")) return BLACK;
            } else if (d(h, "medianetworks.ru") || d(h, "mobioffers.ru") || d(h, "24s.ru")) return BLACK;
        }
        if (t == "r") {
            if (z == "e") {
                if (d(h, "actionteaser.ru") || d(h, "mobileader.ru") || d(h, "adsniper.ru") || d(h, "adriver.ru") || d(h, "smartadserver.ru") || d(h, "adteaser.ru") || d(h, "adizer.ru")) return BLACK;
            } else if (d(h, "userator.ru") || d(h, "adselector.ru")) return BLACK;
        }
        if (t == "t") {
            if (d(h, "adcast.ru") || d(h, "seopult.ru") || d(h, "directadvert.ru") || d(h, "ttarget.ru")) return BLACK;
        }
        if (t == "w") {
            if (d(h, "addnow.ru") || d(h, "addflow.ru") || d(h, "adflow.ru")) return BLACK;
        }
        if (t == "y") {
            if (d(h, "actionpay.ru") || d(h, "advertpay.ru")) return BLACK;
        }
        if (t == "x") {
            if (d(h, "adpix.ru") || d(h, "awaps.yandex.ru") || d(h, "an.yandex.ru") || d(h, "adfox.ru") || d(h, "advertbox.ru")) return BLACK;
        }
        if (d(h, "ad1.ru") || d(h, "ma\u002Dstatic.ru") || d(h, "adfog.ru") || d(h, "adtraff.ru") || d(h, "ladycash.ru") || d(h, "recreativ.ru") || d(h, "cszz.ru")) return BLACK;
    } else if (b == "cn") {
        if (t == "c") {
            if (d(h, "rbc.cn") || d(h, "ads.uc.cn")) return BLACK;
        }
        if (t == "d") {
            if (d(h, "spotad.cn") || d(h, "myad.cn")) return BLACK;
        }
        if (t == "g") {
            if (d(h, "sxtengchuang.cn") || d(h, "skycn.org.cn") || d(h, "i\u002Dqianming.cn")) return BLACK;
        }
        if (t == "k") {
            if (d(h, "whoclick.cn") || d(h, "heroclick.cn")) return BLACK;
        }
        if (t == "m") {
            if (z == "o") {
                if (d(h, "chanet.com.cn") || d(h, "114.com.cn") || d(h, "buzz\u002Dtime.com.cn") || d(h, "rayli.com.cn") || d(h, "admaster.com.cn") || d(h, "460.com.cn")) return BLACK;
            } else if (d(h, "uucm.cn") || d(h, "1tlm.cn") || d(h, "100fenlm.cn")) return BLACK;
        }
        if (t == "o") {
            if (d(h, "adpro.cn") || d(h, "yinoo.cn")) return BLACK;
        }
        if (t == "n") {
            if (d(h, "flunion.cn") || d(h, "maxreturn.cn") || d(h, "baodaozhan.cn") || d(h, "77union.cn")) return BLACK;
        }
        if (t == "s") {
            if (d(h, "ad\u002Dplus.cn") || d(h, "ifocus.cn") || d(h, "adnets.cn") || d(h, "dlads.cn") || d(h, "vipads.cn")) return BLACK;
        }
        if (t == "w") {
            if (d(h, "now.cn") || d(h, "adwww.cn")) return BLACK;
        }
        if (t == "y") {
            if (d(h, "algj\u002D27dy.cn") || d(h, "allyesky.cn")) return BLACK;
        }
        if (d(h, "tiaosa.cn") || d(h, "domob.cn") || d(h, "vodone.cn") || d(h, "adpush.cn") || d(h, "www.59.cn") || d(h, "bmw100.cn") || d(h, "adpower.cn") || d(h, "games32.cn")) return BLACK;
    } else if (b == "cc") {
        if (t == "i") {
            if (d(h, "youzhi.cc") || d(h, "levei.cc") || d(h, "author.richi.cc")) return BLACK;
        }
        if (t == "n") {
            if (z == "o") {
                if (d(h, "ad7.on.cc") || d(h, "ad1.on.cc") || d(h, "ad3.on.cc") || d(h, "ad5.on.cc") || d(h, "ad2.on.cc") || d(h, "ad6.on.cc") || d(h, "ad4.on.cc")) return BLACK;
            }
        }
        if (t == "u") {
            if (d(h, "shendu.cc") || d(h, "pangu.cc")) return BLACK;
        }
        if (d(h, "adchina.cc") || d(h, "dingge.cc") || d(h, "2bj.cc") || d(h, "svem.cc") || d(h, "ugooo.cc") || d(h, "6693.cc") || d(h, "i.na7.cc") || d(h, "zdy.cc") || d(h, "cpa58.cc")) return BLACK;
    } else if (b == "pl") {
        if (t == "k") {
            if (d(h, "nextclick.pl") || d(h, "mobi.yanosik.pl")) return BLACK;
        }
        if (t == "m") {
            if (d(h, "i\u002Dstream.pl") || d(h, "contentstream.pl")) return BLACK;
        }
        if (t == "p") {
            if (d(h, "rek.www.wp.pl") || d(h, "adv.wp.pl")) return BLACK;
        }
        if (t == "s") {
            if (d(h, "hit.gemius.pl") || d(h, "clickonometrics.pl")) return BLACK;
        }
        if (t == "t") {
            if (d(h, "adkontekst.pl") || d(h, "adidm.idmnet.pl") || d(h, "csr.onet.pl")) return BLACK;
        }
        if (d(h, "vendimob.pl") || d(h, "adtotal.pl") || d(h, "adocean.pl") || d(h, "adview.pl") || d(h, "adtaily.pl")) return BLACK;
    } else if (b == "tw") {
        if (t == "b") {
            if (d(h, "aiweb.tw") || d(h, "u\u002Dlink.nbb.tw")) return BLACK;
        }
        if (t == "e") {
            if (d(h, "ishare.tw") || d(h, "crazymike.tw")) return BLACK;
        }
        if (t == "m") {
            if (z == "o") {
                if (d(h, "books.com.tw") || d(h, "dotmore.com.tw") || d(h, "adspending01.bwnet.com.tw") || d(h, "intowow.applefeed.com.tw") || d(h, "esearches.com.tw") || d(h, "banner.gametower.com.tw") || d(h, "housefun.com.tw") || d(h, "122.com.tw")) return BLACK;
            }
        }
        if (d(h, "ysm\u002Dadvertising.tw") || d(h, "adcenter.conn.tw") || d(h, "love12.tw")) return BLACK;
    } else if (b == "org") {
        if (t == "s") {
            if (d(h, "4chan\u002Dads.org") || d(h, "openvideoads.org") || d(h, "advancets.org")) return BLACK;
        }
        if (t == "r") {
            if (d(h, "adsrvr.org") || d(h, "zwaar.org")) return BLACK;
        }
        if (d(h, "adtrace.org") || d(h, "info.a7.org") || d(h, "nclick.org") || d(h, "js.17ol.org") || d(h, "ketchapp.org") || d(h, "job.chinesenow.org") || d(h, "openx.org") || d(h, "58ad.org")) return BLACK;
    } else if (b == "info") {
        if (t == "d") {
            if (d(h, "spotscenered.info") || d(h, "print.theyeshivaworld.info")) return BLACK;
        }
        if (t == "k") {
            if (d(h, "appshelf.ttpsdk.info") || d(h, "houseads.ttpsdk.info")) return BLACK;
        }
        if (d(h, "gredinatib.info") || d(h, "qqle.info") || d(h, "aifei.info") || d(h, "jiling0432.info") || d(h, "hot99.info") || d(h, "52lover.info")) return BLACK;
    } else if (b == "kr") {
        if (t == "o") {
            if (z == "c") {
                if (d(h, "theprimead.co.kr") || d(h, "adapi.about.co.kr") || d(h, "tpmn.co.kr") || d(h, "cauly.co.kr") || d(h, "realssp.co.kr") || d(h, "ad.about.co.kr") || d(h, "imadrep.co.kr") || d(h, "ad4989.co.kr")) return BLACK;
            }
        }
    } else if (b == "de") {
        if (t == "l") {
            if (d(h, "damoh.spiegel.de") || d(h, "brightroll.de")) return BLACK;
        }
        if (d(h, "madvertise.de") || d(h, "movad.de") || d(h, "adtech.de") || d(h, "de.ioam.de") || d(h, "advolution.de") || d(h, "adspirit.de")) return BLACK;
    } else if (b == "mobi") {
        if (d(h, "yoc.mobi") || d(h, "inner\u002Dactive.mobi") || d(h, "adsmogo.mobi") || d(h, "mocean.mobi") || d(h, "mydas.mobi") || d(h, "adver.mobi") || d(h, "vserv.mobi")) return BLACK;
    } else if (b == "ua") {
        if (t == "m") {
            if (z == "o") {
                if (d(h, "holder.com.ua") || d(h, "adpro.com.ua") || d(h, "adrock.com.ua") || d(h, "salesdoubler.com.ua") || d(h, "goodadvert.com.ua")) return BLACK;
            }
        }
        if (d(h, "adrock.ua")) return BLACK;
    } else if (b == "vn") {
        if (d(h, "vcmedia.vn") || d(h, "ad360.vn") || d(h, "eclick.vn") || d(h, "adtimaserver.vn") || d(h, "admicro.vn")) return BLACK;
    } else if (b == "asia") {
        if (d(h, "snapmobile.asia") || d(h, "cloudad.asia") || d(h, "gigazine.asia") || d(h, "pixels.asia")) return BLACK;
    } else if (b == "biz") {
        if (d(h, "trafficfactory.biz") || d(h, "kma.biz") || d(h, "rarenok.biz") || d(h, "novostimira.biz")) return BLACK;
    } else if (b == "su") {
        if (d(h, "leads.su") || d(h, "leadtrade.su") || d(h, "neoban.su") || d(h, "mbn.su")) return BLACK;
    } else if (b == "tv") {
        if (d(h, "teads.tv") || d(h, "adap.tv") || d(h, "videoplaza.tv")) return BLACK;
    } else if (b == "pw") {
        if (d(h, "c.yjvfuzdr.pw") || d(h, "v.vsimasd.pw") || d(h, "bdzhhjnml.pw")) return BLACK;
    } else if (b == "se") {
        if (d(h, "adrotator.se") || d(h, "fusion.dn.se") || d(h, "emediate.se")) return BLACK;
    } else if (b == "in") {
        if (d(h, "25888.in") || d(h, "11125.in")) return BLACK;
    } else if (b == "io") {
        if (d(h, "firstimpression.io") || d(h, "liftoff.io")) return BLACK;
    } else if (b == "me") {
        if (d(h, "c.subo.me") || d(h, "kiip.me")) return BLACK;
    } else if (b == "co") {
        if (d(h, "fyre.co") || d(h, "adk2.co")) return BLACK;
    } else if (b == "hk") {
        if (d(h, "i\u002Dpower.hk") || d(h, "i.l.networld.hk")) return BLACK;
    } else if (b == "uk") {
        if (d(h, "ad\u002Dx.co.uk") || d(h, "adskeeper.co.uk")) return BLACK;
    } else if (b == "cz") {
        if (d(h, "imedia.cz")) return BLACK;
    } else if (b == "il") {
        if (d(h, "fus.yad2.co.il")) return BLACK;
    } else if (b == "dk") {
        if (d(h, "emediate.dk")) return BLACK;
    } else if (b == "fr") {
        if (d(h, "ad2play.ftv\u002Dpublicite.fr")) return BLACK;
    } else if (b == "si") {
        if (d(h, "interseek.si")) return BLACK;
    } else if (b == "by") {
        if (d(h, "seed.by")) return BLACK;
    } else if (b == "at") {
        if (d(h, "ad.adworx.at")) return BLACK;
    } else if (b == "la") {
        if (d(h, "carambo.la")) return BLACK;
    } else if (b == "li") {
        if (d(h, "kau.li")) return BLACK;
    } else if (b == "bg") {
        if (d(h, "easyads.bg")) return BLACK;
    } else if (b == "ad") {
        if (d(h, "content.ad")) return BLACK;
    } else if (b == "xyz") {
        if (d(h, "0edfecc6.xyz")) return BLACK;
    } else if (b == "gr") {
        if (d(h, "adman.gr")) return BLACK;
    } else if (b == "space") {
        if (d(h, "dlski.space")) return BLACK;
    } else if (b == "eu") {
        if (d(h, "emediate.eu")) return BLACK;
    } else if (b == "es") {
        if (d(h, "kimia.es")) return BLACK;
    }
    if (s(h, "media.net") || (!d(h, "apple.com") && (s(u, "*.js") || s(u, "*.js/*")) && !d(h, "mzstatic.com")) || ((!s(u, "*/aclk*") && !s(u, "*/pagead/conversion.js") && d(h, "googleadservices.com")) || (!s(u, "*/gpt_mobile.js") && d(h, "googletagservices.com") && !s(u, "*/gpt.js")) || (d(h, "pagead2.googlesyndication.com") || d(h, "pagead1.googlesyndication.com") || d(h, "pagead3.googlesyndication.com") || d(h, "pagead.googlesyndication.com"))) || ((s(h, "ads.*") && !d(h, "radioactive.sg") && !d(h, "foxnews.com")) || s(h, "*.ads.*")) || s(u, "*.pandora.com*getlicensing*") || s(u, "*.pandora.com*/ads/*") || s(u, "*.p\u002Dcdn.com/*/ads/*") || s(u, "*pandora.com*method\u003Dad*") || (!d(h, "economist.com") && !d(h, "apple.com") && !d(h, "fwmrm.net") && s(u, "*/ad/*") && !d(h, "mzstatic.com")) || (s(u, "*/banner/*")) || s(u, "*/cookieconsent.js") || ((d(h, "adingo.jp") && !d(h, "cdn\u002Dfluct.sh.adingo.jp")) || d(h, "fluct.jp")) || s(h, "*.cj.com") || ((d(h, "connect.facebook.net") && s(u, "*/sdk/xfbml.ad.*")) || (s(u, "*/plugins/ad.*") && d(h, "facebook.com"))) || (s(h, "click.com")) || ((s(u, "*/*adname*") && d(h, "flipboard.com")) || (s(u, "*/flare/*") && d(h, "flipboard.com")) || (d(h, "flipboard.com") && s(u, "*/flipmag/admanager.js")) || (d(h, "flipboard.com") && s(u, "*/adcreative/*"))) || ((s(u, "*mobile.php*") && d(h, "pub.sapo.pt")) || (s(u, "*vast.php*") && d(h, "pub.sapo.pt"))) || (s(u, "*/adz/*")) || s(u, "*/permissionbar\u002Dlatest.min.js") || (n(h, "89.207.18.1", "255.255.255.0")) || (s(h, "*.manage.com") || s(h, "manage.com")) || s(u, "*.cookie\u002Dscript.com*") || s(u, "*betrad.com/pub/c/*.js") || (d(h, "doubleciick.net") || d(h, "doubleclick.net") || d(h, "pubads.g.doubleclick.net") || d(h, "googleads.g.doubleclick.net") || (!s(u, "*ythome*") && !d(h, "stats.g.doubleclick.net") && d(h, "doubleclick.net") && !d(h, "static.doubleclick.net"))) || s(u, "*pandora.com/util/*") || s(u, "*/jquery.cookiesdirective.js") || (s(h, "adserv.*") || s(h, "*.adserv.*")) || s(u, "*/cookie\u002Dinfo.js") || ((d(h, "amazonaws.com") && s(u, "*admarvel*")) || d(h, "admarvel.com")) || s(h, "inmobisdk*.akamaihd.net") || ((s(u, "*/delivery/*") && d(h, "supersonicads.com")) || (s(u, "*supersonicads*.akamaihd.net/*")) || (d(h, "ultraadserver.com") && s(u, "*/api*")) || (d(h, "ssacdn.com"))) || (!d(h, "apple.com") && s(u, "*/adserver/*") && !d(h, "mzstatic.com")) || (s(u, "*/adasset/*")) || s(u, "*/jquery.cookiebar.js") || ((s(u, "*.jpeg/*") || s(u, "*.jpg") || s(u, "*.jpeg?*") || s(u, "*.jpg?*") || s(u, "*.jpg/*") || s(u, "*.jpeg")) && !d(h, "mzstatic.com")) || (s(h, "adx.*") || s(h, "*.adx.*")) || (d(h, "h2.msn.com") || d(h, "rad.msn.com") || (s(u, "*/adsadclient*") && d(h, "msn.com")) || d(h, "stjjp.msn.com") || d(h, "udc.msn.com")) || s(u, "*/cookiewarning.js") || (s(h, "*.adasset.*") || s(h, "adasset.*")) || (!d(h, "lightsource.ca") && s(u, "*/banners/*")) || (s(u, "*/advert/*") && !d(h, "autotrader.co.uk")) || (s(h, "*.advertorial.*") || s(h, "advertorial.*")) || s(u, "*/interstitiel/interstitiel.xml*") || (s(u, "*/adserve/*")) || s(u, "*/openx/www/api/v*/*.php*") || ((d(h, "graph.facebook.com") && s(u, "*/network_ads")) || (s(u, "*/network_ads*") && d(h, "graph.facebook.com")) || (s(u, "*advertise*") && d(h, "graph.facebook.com"))) || s(u, "*/openx/www/images/*") || (s(h, "ad.*") || s(h, "*.ad.*")) || s(u, "*.cloudfront.net/campaigns/*") || (s(u, "*mobiquo/tapatalkdetect.js")) || (!d(h, "otomoto.pl") && !d(h, "apple.com") && !s(h, "*.kijiji.*") && !s(h, "*.olx.*") && !d(h, "watchdisneyxd.go.com") && !d(h, "mzstatic.com") && !d(h, "fortune.com") && !d(h, "ads\u002Dtrk.vidible.tv") && s(u, "*/ads/*") && !s(h, "olx.*") && !d(h, "gumtree.com")) || ((s(u, "*.png/*") || s(u, "*.png?*") || s(u, "*.png")) && !d(h, "mzstatic.com")) || (s(h, "adz.*") || s(h, "*.adz.*")) || s(u, "*cookie\u002Dconsent.js") || (s(h, "*.adview.*") || s(h, "adview.*")) || (s(h, "viewad.*") || s(h, "*.viewad.*")) || ((s(h, "adserver.*") && !d(h, "adtechus.com")) || s(h, "*.adserver.*")) || s(u, "*.p\u002Dcdn.com*/devicead/*") || (s(u, "*/adview/*")) || (s(h, "*.adresult.*") || s(h, "adresult.*")) || (s(u, "*/adx/*")) || (s(u, "*/adserv/*")) || (s(u, "*/viewad/*")) || (s(h, "*.adv.*") || s(h, "adv.*")) || s(h, "cj.com") || (s(h, "banners.*") || s(h, "*.banners.*")) || (s(u, "*/adv/*")) || s(u, "*/cookieinfo/*") || (s(h, "*.adsrv.*") || s(h, "adsrv.*")) || (s(h, "*.advert.*") || s(h, "advert.*")) || (s(u, "*/adresult/*")) || (s(u, "*apis.google.com/u/0/_/+1/fastbutton*") || s(u, "*plusone.google.com/_/+1/fastbutton*")) || (s(h, "banner.*") || s(h, "*.banner.*")) || ((s(u, "*/adnet/*") && d(h, "assets.gunosy.com")) || d(h, "adapi.gunosy.com") || d(h, "ad.gunosy.com") || d(h, "adntokyo.gunosy.com")) || (s(u, "*speednetwor*.com/*xbanner.*") || s(u, "*speednetwor*.com/*xpopup.*") || s(u, "*speednetwor*.com*smart.js") || s(u, "*speednetwor*.com*adclickurl*")) || (s(h, "*.ad\u002Dtraffic.*") || s(h, "ad\u002Dtraffic.*")) || s(u, "*/cookiewarning?.js") || (s(h, "*.adserve.*") || s(h, "adserve.*")) || (s(u, "*.gif/*") || s(u, "*.gif") || s(u, "*.gif?*")) || (s(u, "*.media.tumblr.com/*.gif")) || s(u, "*/openx/www/delivery/*.php*") || s(u, "*/jqueryCookieGuard*.js") || (s(h, "*.adclick.*") || s(h, "adclick.*")) || (s(h, "*.adverts.*") || s(h, "adverts.*")) || (s(u, "*/advertorial/*")) || (s(u, "*/adverts/*")) || ((!s(u, "*goalmobileapp*") && d(h, "taboola.com")) || d(h, "taboolasyndication.com")) || (s(u, "*/ad\u002Dtraffic/*")) || s(h, "m*.2mdn.net") || s(u, "*.pandora.com*/devicead/*") || s(h, "*.media.net") || s(u, "*.pandora.com*file\u003Dads/*") || (s(u, "*/adclick/*"))) return BLACK;
    if ((d(h, "mesu.apple.com") || d(h, "ocsp.apple.com") || d(h, "app\u002dmeasurement.com") || d(h, "e.crashlytics.com") || d(h, "settings.crashlytics.com") || s(u, "http://mesu.apple.com") || s(u, "http://ocsp.apple.com") || s(u, "https://ocsp.apple.com") || s(u, "https://mesu.apple.com") || d(h, "api.unlimapps.com") || d(h, "appldnld.apple.com") || d(h, "ppg.apple.com") || s(u, "https://appldnld.apple.com") || s(u, "http://appldnld.apple.com") || s(u, "https://ppg.apple.com") || s(u, "http://ppg.apple.com") || s(u, "https://*.facebook.com/ads/growth/aymt/homepage_panel/*") || s(u, "https://*.facebook.com/xti.php?*") || s(u, "https://*.facebook.com/common/referer_frame.php*") || s(u, "https://*.facebook.com/sem_campaigns/sem_pixel_test/*") || s(u, "https://pixel.facebook.com/*") || s(u, "*://*.doubleclick.net/*") || s(u, "http://facebook.com/ajax/mercury/change_read_status.php$xmlhttprequest") || d(h, "cloudmobi.net") || s(u, "http://facebook.com/*change_read_status*") || s(u, "https://facebook.com/ajax/mercury/change_read_status.php$xmlhttprequest") || s(u, "http://facebook.com/*typ.php*") || s(u, "https://m.facebook.com/messages/read/?tid\u003d\u0027") || s(u, "https://www.facebook.com/ajax/mercury/change_read_status.php") || s(u, "https://www.messenger.com/ajax/mercury/change_read_status.php") || s(u, "https://www.facebook.com/ajax/messaging/typ.php") || s(u, "https://www.messenger.com/ajax/messaging/typ.php") || s(u, "https://www.messenger.com/ajax/mercury/mark_seen.php") || s(u, "https://www.facebook.com/ajax/mercury/mark_seen.php") || s(u, "https://www.youtube.com/pagead") || s(u, "https://www.youtube.com/ptracking") || s(u, "*://flashtalking.com/*") || s(u, "https://s0.2mdn.net/ads") || s(u, "facebook.com/ajax/mercury/change_read_status.php$xmlhttprequest") || s(u, "https://www.youtube.com/api/stats"))) {
        return BLACK;
    }
    if (d(h, "adtechus.com")) return "PROXY 216.58.209.78:80";
    if (s(u, "*hulu.com/v3/revenue/*") || s(u, "*ll.a.hulu.com*") || (!s(u, "*.mp4*") && !s(u, "*.mp4") && s(u, "*hulu.com/published/*") && !s(u, "*.flv") && !s(u, "*.flv*")) || s(u, "*ads\u002D*.hulu.com*") || d(h, "ads.hulu.com") || s(u, "*hulu.com/beacon/*\u003Dadauditerror*")) return "PROXY 74.125.22.138:80";
    if (d(h, "fwmrm.net") || d(h, "adtechus.com")) return "PROXY 216.58.209.78:80";
    if (d(h, "fwmrm.net")) return "PROXY 216.58.209.78:80";
    return PROXY_DIRECT;
}
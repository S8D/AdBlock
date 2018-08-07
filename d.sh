#!/bin/sh
dVersion="20180807a"
#__________________________________________________________________________________________________
SedX="s|#.*$||; s|^0\.0\.0\.0||; s|^\s+||; s|^255.255.*||; s|w.*ating$||; s|w.*bang$||"
Sed0="s|<.*$||; s|^address=/||; s|\/0\.0\.0\.0||; s|\/.*$||; s|\:.* ||; s|^\_+||; s|^\_||; s|^0\.0\.0\.0||; s|\s+$||; s|\.$||; s|\.v$||; s|\.w$||"
Sed1="s|:.*$||; s|^127.0.0.1||; s|^\s+||; s|\s+$||; s|^\-||; s|^\_+||; s|\.col.*orn$|.com|; s/\.com(loc|en|stu|cate)[^.]*$/.com/; s|\.v$||; s|\.w$||; s|\.vnloc.*$|.vn|; s|.*\.lo.*ain$||; s|.*ztop$||; s|.*ating$||; s|.*kbang$||; s|.*kdns$||; s|\^$||"
Sed2="s|:.*$||; s|\;.*$||; s|^127.0.0.1||; s|^\s+||; s|\s+$||; s|^0\.0\.0\.0||; s|^\s+||; s|^\_+||; s|\.k$||; s/\.comm$/.com/; s/\.com(1|a|en|stu|f4a|http|cate)[^.]*$/.com/; s|<.*$||; s|\.$||; s|^\_||; s|^\-||; s|.*\-offer$||; s|\.tl2$|tl|; s|tkparent$|tk|; s|ldomain$||; s|^gg\.gg||"
Sed3="s|^127.0.0.1||; s|^\s+||; s|\s+$||; s|^\-||; s|^\.||; s|:.*$||; s|\.$||; s|\?$||; s|^\_+||; s/\.com(en|stu|cate)[^.]*$/.com/; s/.*\.(1cn|4th)$//; s|^w.*orn$||; s|.*html$||; s|s.*pboy$||; s|ldomain$||; s|^hosts\-file\.net$||"
Sed4="s|^127\.0.*||; s|^0\.0\.0\.0||; s|^\s+||; s|^\-+||; s|^🔗||; s|^\_+||; s|:.*$||; s|\s+$||; s|^\.||; s|\.$||; s|\/.*$||; s|\.v$||; s|\.w$||; s|\.z$||; s|\+$||; s|\.tl2$|tl|; s|^w.*orn$||; s|\.co14$|.co|; s|\.world15$|.world|; s|com\.do.*ld$|com|; s/\.comm$/.com/; s|.*\-offer$||; s|.*ocom$||; s|.*ilien$||; s/\.com(1|a|en|br|ca|stu)[^.]*$/.com/; s/.*[^a-z0-9]+$//; s|\$.*||; s|w.*ztop$||; s|dioch$|dio.ch|; s|s.*mait$||; s|^gg\.gg||"
SedY="s|^[^.]+$||; /^$/d"
Dl="${TMuc}/dl";
if [ -f "${TMuc}/Location" ];then
	mkdir -p ${Dl};
fi
QUIET="0"
#__________________________________________________________________________________________________
InRa ()
{
	[ $QUIET -eq 0 ] && echo "$1"
	echo "$1" >> $hLog
}
Size ()
{
	InRa "`du -h $1 | awk '{print $1}'`"
}
#__________________________________________________________________________________________________
if [ -f $Lv0 ];then
	InRa "> Compacting [0]  ...";
	LC_ALL=C cat $Lv0 | sed -r "${SedX}" | sed -r "${Sed0}" | sed -r "${SedY}" | awk '{if ($1 in a) next; a[$1]=$0; print}' > $tam;InRa ">> Compacted [0]: $(Size "$tam")";cat $tam > $hTam;
	if [ -f "${TMuc}/Location" ];then
		cp $Lv0 ${Dl}/_Lv0.txt; cp $tam ${Dl}/Lv0.txt;
	fi
	rm -f $Lv0;
fi
if [ -f $Lv00 ];then
	InRa "> Compacting [0.5]  ...";
	LC_ALL=C cat $Lv00 | tr '[:upper:]' '[:lower:]' | sed -r "${SedX}" | sed -r "${Sed00}" | sed -r "${Sed01}" | sed -r "${Sed01}" | sed 's|\$.*$||' | grep -o '^[^|]*' | awk '{if ($1 in a) next; a[$1]=$0; print}' > $tam;InRa ">> Compacted [0.5]: $(Size "$tam")";cat $tam >> $hTam;
	if [ -f "${TMuc}/Location" ];then
		cp $Lv00 ${Dl}/_Lv00.txt; cp $tam ${Dl}/Lv00.txt;
	fi
	rm -f $Lv00;
fi
if [ -f $Lv1 ];then
	InRa "> Compacting [1]  ...";
	LC_ALL=C cat $Lv1 | sed -r "${SedX}" | sed -r "${Sed1}" | sed -r "${SedY}" | awk '{if ($1 in a) next; a[$1]=$0; print}' > $tam;InRa ">> Compacted [1]: $(Size "$tam")";cat $tam >> $hTam;
	if [ -f "${TMuc}/Location" ];then
		cp $Lv1 ${Dl}/_Lv1.txt; cp $tam ${Dl}/Lv1.txt;
	fi
	rm -f $Lv1;
fi
if [ -f $Lv2 ];then
	InRa "> Compacting [2]  ...";
	LC_ALL=C cat $Lv2 | sed -r "${SedX}" | sed -r "${Sed2}" | sed -r "${SedY}" | awk '{if ($1 in a) next; a[$1]=$0; print}' > $tam;InRa ">> Compacted [2]: $(Size "$tam")";cat $tam >> $hTam;
	if [ -f "${TMuc}/Location" ];then
		cp $Lv2 ${Dl}/_Lv2.txt; cp $tam ${Dl}/Lv2.txt;
	fi
	rm -f $Lv2;
fi
if [ -f $Lv3 ];then
	InRa "> Compacting [3]  ...";
	LC_ALL=C cat $Lv3 | tr '[:upper:]' '[:lower:]' | sed -r "${SedX}" | sed -r "${Sed3}" | sed -r "${SedY}" | awk '{if ($1 in a) next; a[$1]=$0; print}' > $tam;InRa ">> Compacted [3]: $(Size "$tam")";cat $tam >> $hTam;
	if [ -f "${TMuc}/Location" ];then
		cp $Lv3 ${Dl}/_Lv3.txt; cp $tam ${Dl}/Lv3.txt;
	fi
	rm -f $Lv3;
fi
if [ -f $Lv4 ];then
	InRa "> Compacting [4]  ...";
	LC_ALL=C cat $Lv4 | tr '[:upper:]' '[:lower:]' | sed -r "${SedX}" | sed -r "${Sed4}" | sed -r "${SedY}" | awk '{if ($1 in a) next; a[$1]=$0; print}' > $tam;InRa ">> Compacted [4]: $(Size "$tam")";cat $tam >> $hTam;
	if [ -f "${TMuc}/Location" ];then
		cp $Lv4 ${Dl}/_Lv4.txt; cp $tam ${Dl}/Lv4.txt;
	fi
	rm -f $Lv4;
fi

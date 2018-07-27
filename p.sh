TMuc="$(cd "$(dirname "${0}")" && pwd)"
TMTam="${TMuc}/dl"
if [ -d "$TMTam" ]
then
	echo "Using $TMTam"
else
	echo "Creating: $TMTam"
	mkdir ${TMTam}
fi
tai="${TMTam}/h.txt"
tam="${TMTam}/h.tmp"
tbl="${TMTam}/bl.txt"
tfb="${TMTam}/fb.txt"
fbo="${TMTam}/fbo.txt"
tal="${TMTam}/ap.txt"
twl="${TMTam}/wl.txt"
wl="${TMTam}/wl"
fIn="${tai}"
fOut="${TMuc}/ok.txt"
PreOut="${TMuc}/_ok.txt"
SedF1="s|#.*$||; s|<.*$||; s|^address\=\/||; s|0.0.0.0 ||; s|^127.0.0.1||; s|:.*$||; s|\/.*$||; s|\;.*$||; s|\s\s|\n|; s|\s|\n|; s|^0\.0\.0\.0||; s|\&.*$||; s|localhost$||; s|\.k$||; s|\.v$||; s|\.w$||; s|\.col.*rn$||; s|[[:blank:]]||; s|^[[:space:]]*||g"
SedF2="s|^\_\_||; s|^\_||; s|^\-||; s|\?$||; s|^\.||; s|^[^.]+$||; /^$/d"
SedF3="s/\.com(a|m|1|en|f4a|http|stu.*rls|malware|ca.*(ies|orn))$/\.com/"
SedWL="s|#.*$||; s|^0\.0\.0\.0||; s|^127.0.0.1||; s|.*ldomain$||; s|^[^.]+$||; s|^[[:space:]]*||g; /^$/d"
cat $twl | sed -r "${SedWL}" > $wl
cat $fIn | tr '[:upper:]' '[:lower:]' | sed -r "${SedF1}" | sed -r "${SedF2}" | sed -r "${SedF3}" | sed -r 's/\.$\n//' | sort | uniq | cat $tbl - | grep -Fvwf $twl | sort -u > $PreOut; cat $PreOut | awk -v "IP=$SetIP" '{sub(/\r$/,""); print IP" "$0}' > $fOut
#!/bin/sh
PhienBan="20190204d"
DauCau="#"
OS=`uname -m`; x64="x86_64"; arm="armv7l"; Android="aarch64";
if [ $OS == $x64 ] || [ $OS == $arm ]; then TM="/root"; fi; 
if [ $OS == $Android ]; then TM="/sdcard"; fi;
tmDNS="${TM}/dns";
Den="${tmDNS}/Den.txt";
ipDen="${tmDNS}/ipDen.txt";
Trang="${tmDNS}/Trang.txt";
Choang="${tmDNS}/Choang.txt";
Chuyen="${tmDNS}/Chuyen.txt";
vDen=$(cat $Den | grep .*PhienBan\_ | sed 's/.*\_//');
vipDen=$(cat $ipDen | grep .*PhienBan\_ | sed 's/.*\_//');
vTrang=$(cat $Trang | grep .*PhienBan\_ | sed 's/.*\_//');
vChoang=$(cat $Choang | grep .*PhienBan\_ | sed 's/.*\_//');
vChuyen=$(cat $Chuyen | grep .*PhienBan\_ | sed 's/.*\_//');
echo -e "$DauCau Phiên bản Bộ lọc: $PhienBan\n Đen:   $vDen\n Choàng: $vChoang\n Chuyển: $vChuyen\n ipDen:  $vipDen\n Trắng:  $vTrang";

#!/bin/bash
PhienBan="20200130f"
OS=`uname -m`; x64="x86_64"; arm="armv7l"; Android="aarch64"
if [ $OS == $x64 ]; then if [ -d /www/cgi-bin ]; then sp="/usr/sbin/sp"; echo "OS: $OS | OpenWRT"; 
else sp="/sbin/sp"; echo "OS: $OS"; fi; if [ -f "$sp" ]; then 
	echo "Đang tải SpeedTest"; curl -sLo $sp uli.vn/_sp; chmod +x $sp; fi; fi

if [ $OS == $arm ]; then if [ -d /www/cgi-bin ]; then sp="/usr/sbin/sp"; echo "OS: $OS | OpenWRT"; 
else sp="/opt/sbin/sp"; echo "OS: $OS"; fi; if [ -f "$sp" ]; then 
	echo "Đang tải SpeedTest"; curl -sLo $sp uli.vn/sp_ ; chmod +x $sp; fi; fi

if [ $OS == $Android ]; then sp="/system/xbin/sp"; echo "OS: $OS"; 
	if [ -f "$sp" ]; then echo "Đang tải SpeedTest"; curl -sLo $sp uli.vn/sp- ; chmod +x $sp; fi; fi

echo "Kiểm tra tốc độ mạng tới máy chủ Singapore"
sp -B -s 9575
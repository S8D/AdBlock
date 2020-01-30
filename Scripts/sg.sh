#!/bin/bash
OS=`uname -m`; x64="x86_64"; arm="armv7l"; Android="aarch64"
if [ $OS == $x64 ]; then if [ -d /www/cgi-bin ]; then sp="/usr/sbin/sp"; else sp="/sbin/sp"; fi
if [ ! -f "$sp" ]; then curl -sLo $sp uli.vn/_sp ;fi; fi
if [ $OS == $arm ]; then if [ -d /www/cgi-bin ]; then sp="/usr/sbin/sp"; else sp="/opt/sbin/sp"; fi
if [ ! -f "$sp" ]; then curl -sLo $sp uli.vn/sp_ ;fi; fi
if [ $OS == $Android ]; then sp="/system/xbin/sp"; if [ ! -f "$sp" ]; then curl -sLo $sp uli.vn/sp- ;fi; fi
echo "Kiểm tra tốc độ mạng tới máy chủ Singapore"
sp -B -s 9575
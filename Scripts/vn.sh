#!/bin/bash
OS=`uname -m`; x64="x86_64"; arm="armv7l"; Android="aarch64"
if [ $OS == $x64 ]; then sp="/sbin/sp"; if [ ! -f "$sp" ]; then curl -sLo $sp uli.vn/_sp ;fi; fi
if [ $OS == $arm ]; then if [ -d /www/cgi-bin ]; then sp="/usr/sbin"; else sp="/opt/sbin/sp"; fi
if [ ! -f "$sp" ]; then curl -sLo $sp uli.vn/sp_ ;fi; fi
if [ $OS == $Android ]; then sp="/sbin/sp"; if [ ! -f "$sp" ]; then curl -sLo $sp uli.vn/sp- ;fi; fi
echo "Kiểm tra tốc độ mạng tới máy chủ Việt Nam"
sp -B -s 6107
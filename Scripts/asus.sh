#!/bin/bash
PhienBan="20200112o"
GetTime=$(date +"%F %a %T"); Time="$GetTime -"
DauCau="#"
dns="/jffs/dnscrypt/dnscrypt-proxy"
dl1="curl -s -L -o"; dl2="curl -s -L"

OS=`uname -m`; x64="x86_64"; arm="armv7l"; Android="aarch64"
if [ $OS == $arm ]; then linktai="linux_arm-"; ThuMuc="linux-arm"; duoi="tar.gz"; 
  giainen="tar -C ${TM} -xvf"; TM="/jffs"; tmDNS="${TM}/dns"; mkdir -p $tmDNS; else
  echo "$DauCau Scripts chưa hỗ trợ nền tảng đang chạy"; exit 1; fi
Log="${tmDNS}/Update.log"; if [ ! -f "$Log" ]; then echo '' > $Log; fi;
upTam="${TM}/tam"; rm -f $upTam;

echo "$DauCau Đang kiểm tra cập nhật $(basename "$0") $PhienBan..."
CheckNet () { ping -q -c 1 -W 1 g.co >/dev/null; };
if CheckNet; then net=1; else net=0; fi
if [ $net -eq 1 ]; then PhienBanMoi=$(curl -s -L "gg.gg/_asus" | grep PhienBan\= | sed 's/.*\=\"//; s/\"$//');
if [ $PhienBanMoi == $PhienBan ]; then echo "$DauCau $(basename "$0") $PhienBan là bản mới nhất!"; else
  echo "$DauCau Đang cập nhật $(basename "$0") v.$PhienBan lên v.$PhienBanMoi...";
  cp $0 ${tmDNS}/$PhienBan\_$(basename "$0")
  curl -s -L -o $upTam gg.gg/_asus; chmod +x $upTam; mv $upTam ${TM}/$0
  echo "$DauCau Khởi chạy $(basename "$0") $PhienBanMoi..."; sh ${TM}/$(basename "$0"); exit 1; fi; fi

echo "$DauCau Đang kiểm tra máy chủ cập nhật..."
CheckTN () { ping -q -c 1 -W 1 tiny.cc >/dev/null; }; CheckGG () { ping -q -c 1 -W 1 gg.gg >/dev/null; }
CheckGL () { ping -q -c 1 -W 1 g.co >/dev/null; };

if CheckGG; then UpLink="gg.gg/_dns"; DownLink="gg.gg/dns_"; net="1"; else
  if CheckTN; then UpLink="https://tiny.cc/_dns"; DownLink="https://tiny.cc/dns_"; net="2"; else
    if CheckGL; then UpLink="https://s8d.github.io/AdBlock/Scripts/dns.sh";
      DownLink="https://api.github.com/repos/DNSCrypt/dnscrypt-proxy/releases/latest"; net="3"; else net=0; fi; fi; fi

echo "$DauCau Đang kiểm tra cập nhật DNSCrypt-Proxy...";
PhienBanOn=$(${dl2} "${DownLink}" | awk -F '"' '/tag_name/{print $4}'); PhienBanOff=$(${dns} --version)
if [ $PhienBanOn == $PhienBanOff ]; then echo "$Time DNSCrypt-Proxy $PhienBanOn là bản mới nhất!" >> $Log;
  echo "$DauCau DNSCrypt-Proxy $PhienBanOn là bản mới nhất!"; Nhay start; else
  echo "$DauCau Đang cập nhật DNSCrypt-Proxy v.$PhienBanOff lên v.$PhienBanOn..."
  echo "$DauCau Đang tải DNSCrypt-Proxy..."
  DownURL=$(${dl2} $DownLink | grep browser_download_url.*$duoi | grep $linktai | cut -d '"' -f 4)
  $dl1 $TM/DNSCrypt.$duoi $DownURL
  echo "$DauCau Đang giải nén DNSCrypt-Proxy..."; rm -rf ${TM}/${ThuMuc}
  $giainen ${TM}/DNSCrypt.$duoi; chmod +x ${TM}/${ThuMuc}/dnscrypt-proxy
  echo "$DauCau Đang cập nhật DNSCrypt-Proxy..."
  mv ${TM}/${ThuMuc}/dnscrypt-proxy $dns
  rm -rf ${TM}/${ThuMuc}; rm -f ${TM}/DNSCrypt.$duoi; rm -f $upTam;
  echo "$Time DNSCrypt-Proxy được cập nhật lên $PhienBanOn" >> $Log
  echo "$DauCau DNSCrypt-Proxy đã được cập nhật lên v.$PhienBanOn"
fi

echo "$DauCau Chạy Cài đặt DNSCrypt-Proxy của ThuanTran`n"
#________________________________________________________________________________________
#asus="/jffs/asus"
#if [ ! -f "$asus" ]; then curl -s -L -o $asus gg.gg/dns_a; chmod +x $asus; fi; sh $asus

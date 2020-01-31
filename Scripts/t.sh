#!/bin/bash
OS=`uname -m`; x64="x86_64"; arm="armv7l"; Android="aarch64"
if [ $OS == $x64 ]; then linktai="linux_x86_64"; ThuMuc="linux-x86_64"; fi
if [ $OS == $arm ]; then linktai="linux_arm"; ThuMuc="linux-arm"; fi
echo "$(date +"%F %a %T") - Đang tải DNSCrypt-Proxy"
curl -sLo /root/dns/update.tar.gz https://github.com/DNSCrypt/dnscrypt-proxy/releases/download/2.0.36-beta.1/dnscrypt-proxy-$linktai-2.0.36-beta.1.tar.gz
echo "$(date +"%F %a %T") - Đang giải nén DNSCrypt-Proxy"
tar -C /root/dns/ -zxvf /root/dns/update.tar.gz; chmod +x /root/dns/$ThuMuc/dnscrypt-proxy
echo "$(date +"%F %a %T") - Đang cập nhật DNSCrypt-Proxy"
/etc/init.d/dns stop
mv /root/dns/$ThuMuc/dnscrypt-proxy /usr/sbin/dns
cp /root/dns/CauHinh_2036b1.toml /root/dns/CauHinh.toml
/etc/init.d/dns start
rm -rf /root/dns/$ThuMuc /root/dns/update.tar.gz
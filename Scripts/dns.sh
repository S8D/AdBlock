cat > /root/up.sh << \EOF
#!/bin/ash
echo "Đang tải DNSCrypt-Proxy"
curl -s https://api.github.com/repos/DNSCrypt/dnscrypt-proxy/releases/latest \
| grep browser_download_url.*tar.gz \
| grep linux_x86_64 \
| cut -d '"' -f 4 \
| wget -qi -
echo "Đang giải nén DNSCrypt-Proxy"
tar xzf /root/*.tar.gz
chmod +x /root/linux-x86_64/dnscrypt-proxy
/etc/init.d/dnscrypt-proxy stop
echo "Đang cập nhật DNSCrypt-Proxy"
mv /root/linux-x86_64/dnscrypt-proxy /usr/sbin/dnscrypt-proxy
/etc/init.d/dnscrypt-proxy start
rm -r /root/*.gz
rm -r /root/*.minisig
rm -r /root/linux-x86_64/
echo "Phiên bản DNSCrypt-Proxy hiện tại là:"
dnscrypt-proxy --version
EOF
cat > /root/set.sh << \EOF
/etc/init.d/cron enable
/etc/init.d/cron start
chmod +x /usr/sbin/dns
chmod +x /etc/init.d/dns
/etc/init.d/dns enable
/etc/init.d/dns start
dns -config /root/dns/CauHinh.toml -check
dns -config /root/dns/CauHinh.toml
dns -resolve g.co; dns -resolve t.co; dns -resolve m.me
EOF
chmod +x set.sh

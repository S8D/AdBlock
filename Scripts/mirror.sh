#Create Mirror
cp /etc/opkg/distfeeds.conf /root/Goc.conf; cp /root/Goc.conf /root/Sin.conf; sed -i -e 's/downloads\.openwrt\.org/mirror\.0x\.sg\/openwrt/g' /root/Sin.conf; cp /root/Goc.conf /root/Aus.conf; sed -i -e 's/downloads\.openwrt\.org/mirror\.kumi\.systems\/openwrt/g' /root/Aus.conf;
echo '#!/bin/bash' > /root/goc;
echo 'cp /root/Goc.conf /etc/opkg/distfeeds.conf' >> /root/goc; chmod +x /root/goc;
echo '#!/bin/bash' > /root/sin;
echo 'cp /root/Sin.conf /etc/opkg/distfeeds.conf' >> /root/sin; chmod +x /root/sin;
echo '#!/bin/bash' > /root/aus;
echo 'cp /root/Aus.conf /etc/opkg/distfeeds.conf' >> /root/aus; chmod +x /root/aus;

#ReStore
sed -i -e 's/mirror\.0x\.sg\/openwrt/downloads\.openwrt\.org/g' /root/Goc.conf;

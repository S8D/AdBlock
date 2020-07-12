opkg update && opkg install openssl-util luci-app-uhttpd
cat > /etc/ssl/darias.conf << \EOF
[req]
distinguished_name  = req_distinguished_name
x509_extensions     = v3_req
prompt              = no
string_mask         = utf8only
 
[req_distinguished_name]
O                   = OpenWRT
OU                  = Darias Luc
CN                  = LuCI WebAdmin
 
[v3_req]
keyUsage            = keyEncipherment, dataEncipherment
extendedKeyUsage    = serverAuth
subjectAltName      = @alt_names
 
[alt_names]
DNS.1               = ss.ss
IP.1                = 2.2.2.2
EOF
cd /etc/ssl/
openssl req -x509 -nodes -days 1325 -newkey rsa:2048 -keyout darias.key -out darias.crt -config darias.conf
cp darias.key /etc/uhttpd.key; cp darias.crt /etc/uhttpd.crt
/etc/init.d/uhttpd restart

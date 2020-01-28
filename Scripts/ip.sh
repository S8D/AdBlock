#!/bin/sh
ip=$(curl -sL "uli.vn/ip" | grep "Client IP address:" | sed 's/.*Client IP address: //g;s/).*//g'); echo "IP: $ip"

#!/bin/bash
TM="/data/media/0/dnscrypt-proxy"
[ `whoami` = root ] || { echo "Đã cấp quyền SU. Chạy lại $0"; su "$0" "$@"; exit $?; };
echo "$(date +"%F %a %T") - Đang cập nhật Bộ lọc"
curl -s -L -o ${TM}/_Den.txt gg.gg/bl_
echo "$(date +"%F %a %T") - Đã cập nhật Bộ lọc"
cat ${TM}/Den.txt | grep .*PhienBan

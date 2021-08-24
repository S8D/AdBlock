#!/bin/bash
# Script chặn quảng cáo của YouTube bằng Pi-Hole
PhienBan="210824k"

UpLink="https://xem.li/ytb"
ThoiGianKiemTra="300"
ThoiGianNgu="300"
Nha="https://s8d.github.io/AdBlock"
pbcu="https://xem.li/ytbo"
ip=$(curl -s api.ipify.org)
dl1="curl -sLo"; dl2="curl -sL"
mkdir -p /sd; echo ''
TM="/sd/ytb"; mkdir -p $TM
YTLog="${TM}/NhatKy.log"
ThoiGian=$(date "+%F %T")
TMPi="/var/log"
PiLog="/var/log/pihole.log"
ChanLog="/var/log/pihole-updateGravity.log"
PiData="/etc/pihole/gravity.db"
TMDichVu="/lib/systemd/system"
ytb="ytb.service"
YTTen=$(basename $0)
PRINTWD=$(pwd)
TMTam="/tmp/ytb"; mkdir -p $TMTam
upTam="${TM}/tam"
DOCKER_PIHOLE="/etc/docker-pi-hole-version"
ROOT_UID=0
ChanThuong='r([0-9]{1,2})[^-].*\.googlevideo\.com'
ChanManh='r([0-9]{1,2}).*\.googlevideo\.com'

# Cài đặt màu sắc
MauDo="\e[31m"
MauVang="\e[33m"
MauXanh="\e[32m"
MauXam="\e[0m"

# Đánh dấu màu
TgTT=$(echo -e "[i]") # [i] Information
TgCB=$(echo -e "[${MauVang}w${MauXam}]") # [w] Warning
TgNG=$(echo -e "[${MauDo}✗${MauXam}]") # [✗] Error
TgOK=$(echo -e "[${MauXanh}✓${MauXam}]") # [✓] Ok

#If any command shows out an error code, the script ends
set -e

function Banner () {
    echo -e "${MauDo}==================================="
    echo -e "|  ${MauXam}YouTube Ads AdBlock for PiHole ${MauDo}|"
    echo -e "|  ${MauXam}    Phiên bản: ${MauXanh}${PhienBan}         ${MauDo}|"
    echo -e "|  ${MauXanh}${Nha}  ${MauDo}|"
    echo -e "|  ${MauXam}Tác giả: ${MauXanh}deividgdt             ${MauDo}|"
    echo -e "|  ${MauXam}Chỉnh sửa: ${MauXanh}Darias              ${MauDo}|"
    echo -e "==================================="
    echo -e "${MauXam}`date`";
    echo -e "Your IP Address: ${MauXanh}$ip${MauXam}";
    echo -e "${TgTT} Nhật Ký: ${MauXanh}${YTLog}${MauXam}"
    echo -e "${TgTT} Dữ liệu PiHole: ${MauXanh}${PiData}${MauXam}"
    echo -e "${TgTT} Đang bắt đầu cài Chặn quảng cáo YouTube..."
    echo ""
}


function CheckUser() {
    if [[ "$(id -u $(whoami))" != "${ROOT_UID}" ]]; then
        echo -e "${TgNG} $(whoami) Vui lòng chạy $YTTen với quyền root."
        exit 1;
    fi
}


function CheckDocker() {
    if [ -f "${DOCKER_PIHOLE}" ]; then
        echo -e "${TgTT} Phát hiện Docker."
        DOCKER="y"
    fi
}


function Makeservice () {
    cd $TMDichVu && touch $ytb
    cat > $ytb <<-EOF
[Unit]
Description=Dịch vụ chặn quảng cáo YouTube bằng Pi-hole
After=network.target
[Service]
ExecStart=$PRINTWD/$YTTen chay
ExecStop=$PRINTWD/$YTTen dung
[Install]
WantedBy=multi-user.target
	EOF

}


function Database() {
    local OPTION=$1
    local DOMAIN="$2"

    case $OPTION in
        "create")
            LASTGROUPID=$(sqlite3 "${PiData}" "SELECT MAX(id) FROM 'group';" 2>>  $YTLog )
            GROUPID=$((${LASTGROUPID} + 1))
            sqlite3 "${PiData}" "INSERT INTO 'group' (id, name, description) VALUES (${GROUPID}, 'YouTubeAdsBlock', 'YouTube AdsBlock');" 2>> $YTLog
            ;;
        "insertDomain")
            if [[ $DOMAIN == *.googlevideo.com ]]; then
                echo -e "${TgTT} Đang thêm tên miền: $DOMAIN";
                echo "${ThoiGian} Đang thêm tên miền: ${YTD}" >> $YTLog
                sqlite3 "${PiData}"  """INSERT OR IGNORE INTO domainlist (type, domain, comment) VALUES (1, '${DOMAIN}', 'YouTube AdsBlock');""" 2>>  $YTLog;
            else
                echo -e "${TgNG} Tên miền: $DOMAIN ${MauDo}không ${MauXam}được thêm vì khác định dạng!!!"
                echo "${ThoiGian} Tên miền: $DOMAIN không được thêm vì khác định dạng!!!" >> $YTLog
            fi
            ;;
        "update")
            echo -e "${TgTT} Đang cập nhật dữ liệu..."
            echo "${ThoiGian} Đang cập nhật dữ liệu..." >> $YTLog
            sqlite3 "${PiData}"  "UPDATE domainlist_by_group SET group_id=${GROUPID} WHERE domainlist_id IN (SELECT id FROM domainlist WHERE comment = 'YouTube AdsBlock');" 2>>  $YTLog
            ;;
        "getGroupId")
            GROUPID=$(sqlite3 "${PiData}"  "SELECT id FROM 'group' WHERE name = 'YouTubeAdsBlock';" 2>>  $YTLog )
            ;;
        "checkDomain")
            KTTenMien=$(sqlite3 "${PiData}"  """SELECT domain FROM domainlist WHERE comment = 'YouTube AdsBlock' AND domain = '${DOMAIN}';""" 2>>  $YTLog)
            ;;
        "delete")
            echo -e "${TgTT} Đang ${MauDo}xóa ${MauXam}tên miền con từ ${MauXanh}${PiData}${MauXam}"
            sqlite3 "${PiData}"  "DELETE FROM domainlist WHERE comment = 'YouTube AdsBlock';" 2>>  $YTLog
            sqlite3 "${PiData}"  "DELETE FROM 'group' WHERE name = 'YouTubeAdsBlock';" 2>>  $YTLog
            ;;
    esac
}



function Cai() {
    CheckUser #We check if the root user is executing the script
    CheckDocker #We check if the script is being executed on a Docker Container

    function ConfigureEnv() {
        echo -e "${TgTT} Cấu hình Dữ liệu: ${MauXanh}$PiData ${MauXam}..."; sleep 1
        Database "create"
        echo -e "${TgTT} Bạn có muốn kích hoạt chế độ ${MauVang}Chặn mạnh tay ${MauXam}không?"
        echo -e "${TgTT} Có thể YouTube sẽ hoạt động không mượt đấy nhé! (${MauVang}Y${MauXam}/${MauXanh}N${MauXam}):"
        read -p " " answer
        case $answer in
            Y|y)
                PATTERN=${ChanManh}
                ;;
            N|n)
                PATTERN=${ChanThuong}
                ;;
            *)
                PATTERN=${ChanThuong}
                ;;
        esac

        echo -e "${TgTT} Đang tìm tên miền con trong PiHole..."; sleep 1
        cp $TMPi/pihole.log* $TMTam
        for GZIPFILE in $(ls $TMTam/pihole.log*gz > /dev/null 2>&1); do
            gunzip $GZIPFILE;
        done

        echo "${ThoiGian} Đang tìm tên miền con trong Nhật Ký..." >> $YTLog
        ALL_DOMAINS=$(cat $TMTam/pihole.log* | egrep --only-matching "${PATTERN}" | sort | uniq)

        if [ ! -z "${ALL_DOMAINS}" ]; then
            SoLuong=$(cat $TMTam/pihole.log* | egrep --only-matching "${PATTERN}" | sort | uniq | wc --lines)
            echo -e "${TgTT} Tìm thấy ${MauVang}$SoLuong ${MauXam}tên miền...";
            echo "${ThoiGian} Tìm thấy $SoLuong tên miền..." >> $YTLog
            for YTD in $ALL_DOMAINS; do
                Database "checkDomain" "${YTD}"
                if [[ -z ${KTTenMien} ]]; then Database "insertDomain" "${YTD}"; fi
            done
            Database "update"
            pihole updateGravity > ${ChanLog} 2>&1 &
            #echo -ne "${TgTT} Đang cập nhật dữ liệu"
            while [ ! -z "$(ps -fea | grep updateGravit[y])" ]; do echo -n "."; sleep 1; done
            echo ''; echo -e "${TgOK} Cập nhật dữ liệu Hoàn tất."
            echo -e "${TgOK} $SoLuong tên miền đã được thêm."
            echo "${ThoiGian} $SoLuong tên miền đã được thêm." >> $YTLog
        else
            echo -e "${TgCB} Không có tên miền nào được thêm."
            echo "${ThoiGian} Không có tên miền đã được thêm." >> $YTLog
        fi

        echo -ne "${TgTT} Đang ${MauDo}xóa ${MauXam}file tạm..."; sleep 1; echo ''
        rm --force ${TMTam}/pihole.log*
        echo -ne "${TgOK} Đã xóa file tạm."; sleep 1; echo ''
    }

    if [[ "${DOCKER}" == "y" ]]; then
        echo -e "${TgCB} Chặn quảng cáo YouTube phải được chạy/dừng thủ công"
        ConfigureEnv
        echo -e "${TgCB} Hãy dùng lệnh: bash $PRINTWD/$YTTen { chay & || dung & }"
    else
        if [ ! -f $TMDichVu/$ytb ]; then
            echo -e "${TgTT} Nếu bạn di chuyển $YTTen sang nơi khác, vui lòng chạy: ${MauDo}sh $YTTen cai${MauXam}";
            echo -ne "${TgTT} Đang cài Dịch vụ..."; sleep 1; echo ''
            Makeservice
            echo -e "${TgOK} Dịch vụ đã được cài.";

            ConfigureEnv

            echo -e "${TgOK} Chặn quảng cáo YouTube đã được cài đặt..."; sleep 1
            echo ""
            echo -e "${TgTT} Để chạy dịch vụ hãy dùng lệnh sau: systemctl start ytb"; sleep 1
            echo -ne "${TgTT} Đang bật Dịch vụ."; sleep 1; echo ''
            systemctl enable ytb 1> /dev/null 2>&1
            echo -e "${TgOK} Chặn quảng cáo YouTube đã được cài đặt thành công!"
            echo "${ThoiGian} Chặn quảng cáo YouTube đã được cài đặt thành công!" >> $YTLog
        else
            echo -e "${TgCB} Chặn quảng cáo YouTube đã được cài đặt..."; sleep 1
            echo -ne "${TgTT} Cài đặt lại Dịch vụ..."; echo ''
            Makeservice
            systemctl daemon-reload
            systemctl restart ytb 1> /dev/null 2>&1
            echo -e "${TgOK} Cài đặt lại Hoàn tất."
        fi
    fi
}


function Chay() {
    CheckUser #We check if the root user is executing the script

    echo -e "${TgOK} Chặn quảng cáo YouTube đã chạy"
    echo "${ThoiGian} Chặn quảng cáo YouTube đã chạy" >> $YTLog

    Database "getGroupId"

    if [ -z ${GROUPID} ]; then
        echo -e "${TgNG} Không thấy group ID của Chặn quảng cáo YouTube trong Dữ liệu."
        echo -e "${TgTT} Vui lòng chạy lại $YTTen với tham số: cai"
        exit 1;
    fi



    while true; do
        echo -e "${TgTT} Đang kiểm tra ${MauXanh}$PiLog${MauXam}..."
        echo "${ThoiGian} Đang kiểm tra ${PiLog}..." >> $YTLog

        TenMien=$(cat ${PiLog} | egrep --only-matching "${PATTERN}" | sort | uniq)
        TenMienMoi=
        KTTenMien=

        for YTD in $TenMien; do
            Database "checkDomain" "${YTD}"
            if [[ -z ${KTTenMien} ]]; then
                TenMienMoi="$TenMienMoi $YTD"
                Database "insertDomain" "${YTD}"
            fi
        done

        if [ -z "$TenMienMoi" ]; then
            echo -e "${TgTT} Không có tên miền nào được thêm."
            echo "${ThoiGian} Không có tên miền nào được thêm." >> $YTLog
        else
            Database "update"
            echo -e "${TgTT} Đã cập nhật tên miền quảng cáo."
            echo "${ThoiGian} Đã cập nhật tên miền quảng cáo." >> $YTLog
        fi
        echo -e "${TgTT} Sau ${MauVang}$ThoiGianNgu giây ${MauXam}sẽ kiểm tra tiếp."
        COUNT=$(($COUNT + 1))
        sleep $ThoiGianNgu;

        if [[ $COUNT -eq ${ThoiGianKiemTra} ]]; then
            CapNhat
            COUNT=0
        else
            continue;
        fi
    done
}


function Dung() {
    echo -ne "${TgTT} Dừng chặn quảng cáo YouTube"; echo ''
    echo "${ThoiGian} Chặn quảng cáo YouTube đã dừng" >> $YTLog
    #kill -9 `pgrep ytb`
    killall ytb
}


function Go() {
    CheckDocker #We check if the script is being executed on a Docker Container
    CheckUser #We check if the root user is executing the script

    echo -e "${TgTT} Đang ${MauDo}gỡ ${MauXam}chặn quảng cáo YouTube..."
    Database "delete"
    pihole updateGravity > ${ChanLog} 2>&1 &
    echo -ne "${TgTT} Đang cập nhật lại dữ liệu"
    while [ ! -z "$(ps -fea | grep updateGravit[y])" ]; do echo -n "."; sleep 1; done
    echo ''; echo -ne "${TgOK} Cập nhật dữ liệu Hoàn tất."; echo ''

    if [[ ! ${DOCKER} ]]; then
        echo -e "${TgTT} Đang ${MauDo}vô hiệu hóa ${MauXam}Dịch vụ..."
        systemctl stop ytb 1> /dev/null 2>&1
        systemctl disable ytb 1> /dev/null 2>&1
        systemctl daemon-reload

        if [ -f ${TMDichVu}/${ytb} ]; then
            echo -e "${TgTT} Đang ${MauDo}xóa ${MauXam}Dịch vụ..."
            rm --force ${TMDichVu}/${ytb};
        fi

        if [ -f ${TMDichVu}/ytadsblocker ]; then
            echo -e "${TgTT} Đang ${MauDo}xóa ${MauXam}Dịch vụ..."
            systemctl stop ytadsblocker 1> /dev/null 2>&1
            systemctl disable ytadsblocker 1> /dev/null 2>&1
            rm --force ${TMDichVu}/ytadsblocker;
        fi

        if [ -f ${YTLog} ]; then
            echo -e "${TgTT} Đang ${MauDo}xóa ${MauXam}Nhật ký..."
            rm --force ${YTLog};
        fi
    fi

    echo -e "${TgOK} Tắt chặn quảng cáo YouTube"; echo ''
    #kill -9 `pgrep ytb`
    killall ytb
}


function CheckPiHole() {
    PiCfg=$(cat /etc/pihole/pihole-FTL.conf | grep IP-NODATA-AAAA | sed -e 's/\=.*//')
    PiCfh="BLOCKINGMODE"
    piv=$(pihole -v | grep hole | sed -e 's/.*s v//; s/ (.*//; s/\..*//')
    PiCfgu="https://docs.pi-hole.net/ftldns/blockingmode/#pi-holes-ip-ipv6-nodata-blocking"
    sslu="https://tecadmin.net/configure-ssl-in-lighttpd-server/"
    sslcfg=$(cat /etc/lighttpd/lighttpd.conf | grep 443)
    echo -e "${TgTT} Đang kiểm tra cấu hình PiHole..."
    if [ ! $piv -ge 5 ]; then 
        echo -e "${TgNG} ${MauXam}${YTTen}${PhienBan} ${MauXam}chỉ tương thích với ${MauDo}PiHole 5.x trở lên${MauXam}!!!" 
        echo -e "${TgTT} Hoặc chạy phiên bản ${MauXanh}legacy${MauXam} cho ${MauDo}PiHole 5.x trở xuống${MauXam}!!!"
        echo -e "${TgTT} Tải phiên bản ${MauXanh}legacy${MauXam} tại: ${MauXanh}${pbcu}${MauXam}"; 
        read -p "${TgNG} Nhấn phím bất kỳ để thoát."; exit 1
    fi
    if [[ "${PiCfg}" != "${PiCfh}" ]]; then
        echo -e "${TgNG} Cấu hình PiHole chưa tương thích!!! Việc cấu hình PiHole tương thích sẽ chặn quảng cáo hiệu quả hơn."
        echo -e "${TgNG} Tham khảo cấu hình tại:\n ${PiCfgu}"; exit 1
    fi
    if [ -z ${sslcfg} ]; then
        echo -e "${TgNG} PiHole chưa được cấu hình ssl!!!"
        echo -e "${TgTT} Tham khảo cấu hình tại:\n ${sslcfg}"; exit 1
    fi
}


function CapNhat() {
    echo -e "${TgTT} Đang kiểm tra máy chủ cập nhật..."
    CheckNet_1 () { ping -q -c 1 -W 1 xem.li >/dev/null; }; 
    CheckNet_2 () { ping -q -c 1 -W 1 s8d.github.io >/dev/null; };
    if CheckNet_1; then net="1"; if CheckNet_2; then net="2"; else net=0; fi; else net=0; fi
    if [ $net -ge 2 ]; then echo -e "${TgTT} Đang kiểm tra cập nhật ${MauDo}$(basename "$0") ${MauXanh}$PhienBan${MauXam}..."
        PhienBanMoi=$(${dl2} "${UpLink}" | grep PhienBan\= | sed 's/.*\=\"//; s/\"$//');
        if [ $PhienBanMoi == $PhienBan ]; then echo -e "${TgTT} ${MauDo}$(basename "$0") ${MauXanh}$PhienBan ${MauXam}là bản mới nhất!";
            echo -e "${TgOK} $(basename "$0") $PhienBan là bản mới nhất!"  >> $YTLog
        else echo -e "${TgTT} Đang cập nhật ${MauDo}$(basename "$0") ${MauXanh}$PhienBan ${MauXam}lên ${MauXanh}$PhienBanMoi${MauXam}..."; mkdir -p $TM/old
            cp $0 ${TM}/old/$PhienBan\_$(basename "$0")
            $dl1 ${upTam} $UpLink; chmod +x ${upTam}; mv ${upTam} ${TM}/$0        
            echo -e "${TgOK} ${MauDo}$(basename "$0") được cập nhật lên ${MauXanh}$PhienBanMoi${MauXam}!" >> $YTLog
            echo -e "${TgOK} Khởi chạy ${MauDo}$(basename "$0") ${MauXanh}$PhienBanMoi${MauXam}..."; 
            if [ -f $TMDichVu/$ytb ]; then systemctl restart ytb 1> /dev/null 2>&1; fi; 
            #sh ${TM}/$(basename "$0"); 
        exit 0; fi
    else echo -e "${TgNG} Không có mạng!!! Thoát ra" >> $YTLog; exit 1
    fi
}

case "$1" in
    "cai"  ) Banner; Cai 	;;
    "chay" ) Chay           ;;
    "up"   ) CapNhat        ;;
    "kt"   ) CheckPiHole    ;;
    "dung" ) Dung 			;;
    "go"   ) Go			    ;;
    *      ) echo -e "${TgNG} Tham số không phù hợp.\n${TgTT} Vui lòng sử dụng tham số sau: ./$YTTen [ cai | chay | up | kt | dung | go ]" ;;
esac
echo ''

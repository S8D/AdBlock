#!/bin/bash
# Script chặn quảng cáo của YouTube bằng Pi-Hole
PhienBan="210827c"
CapNhatCauHinh="1"
#UpLink="https://xem.li/ytb"
UpLink="https://xem.li/yt"
Nha="https://s8d.github.io/AdBlock"
pbcu="https://xem.li/ytbo"
ip=$(curl -s api.ipify.org)
dl1="curl -sLo"; dl2="curl -sL"

mkdir -p /sd; echo ''
TM="/sd/ytb"; mkdir -p $TM
CauHinh="${TM}/cauhinh"
YTLog="${TM}/NhatKy.log"
TMTam="/tmp/ytb"; mkdir -p $TMTam
upTam="${TM}/tam"
QUIET="0"
ThoiGian=$(date "+%F %T")

PiTM="/var/log"
PiLog="/var/log/pihole.log"
PiLogGravity="/var/log/pihole-updateGravity.log"
PiData="/etc/pihole/gravity.db"

TMDichVu="/lib/systemd/system"
TenDV="ytb.service"
TenFile=$(basename $0)

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
function InRa () { [ $QUIET -eq 0 ] && echo -e "$1" ; echo -e "$1" >> $YTLog; }

if [ ! -f "${CauHinh}" ]; then
	InRa "${TgTT} Tạo file cấu hình..."
	echo '' > $CauHinh
	echo -e 'PhienBanCfg=1' >> $CauHinh
	echo -e 'ThoiGianCapNhat=2' >> $CauHinh
	echo -e 'ThoiGianNgu=300' >> $CauHinh
	echo "ChanThuong=r([0-9]{1,2})[^-].*\.googlevideo\.com" >> $CauHinh
	echo "ChanManh=r([0-9]{1,2}).*\.googlevideo\.com" >> $CauHinh
	ChanThuong="r([0-9]{1,2})[^-].*\.googlevideo\.com"
	ChanManh="r([0-9]{1,2}).*\.googlevideo\.com"
	echo -e "${TgTT} Bạn có muốn kích hoạt chế độ ${MauVang}Chặn mạnh tay ${MauXam}không?"
	echo -e "${TgTT} Có thể YouTube sẽ hoạt động không mượt đấy nhé! (${MauVang}Y${MauXam}/${MauXanh}N${MauXam}):"
	read -p " " answer
	case $answer in Y|y) CapDo=${ChanManh};; N|n) CapDo=${ChanThuong};; *) CapDo=${ChanThuong};; esac
	echo -e "CapDo=${CapDo}" >> $CauHinh
	echo -e "${TgTT} Chế độ quét Ads định kỳ ${MauXanh}Quét nhanh (N)${MauXam} hay ${MauVang}Quét toàn bộ (F)${MauXam}"
	read -p " " answer
	case $answer in N|n) QuetNhanh=1;; F|f) QuetNhanh=0;; *) QuetNhanh=1;; esac
	echo -e "QuetNhanh=${QuetNhanh}" >> $CauHinh
	InRa "${TgOK} Tạo file cấu hình Hoàn Tất!"
else
	dv=`grep -w -m 1 "ThoiGianCapNhat" $CauHinh`;ThoiGianCapNhat=$(echo $dv | sed 's/.*\=//');
	dv=`grep -w -m 1 "PhienBanCfg" $CauHinh`;PhienBanCfg=$(echo $dv | sed 's/.*\=//');
	dv=`grep -w -m 1 "ThoiGianNgu" $CauHinh`;ThoiGianNgu=$(echo $dv | sed 's/.*\=//');
	dv=`grep -w -m 1 "ChanThuong" $CauHinh`;ChanThuong=$(echo $dv | sed 's/.*\=//');
	dv=`grep -w -m 1 "QuetNhanh" $CauHinh`;QuetNhanh=$(echo $dv | sed 's/.*\=//');
	dv=`grep -w -m 1 "ChanManh" $CauHinh`;ChanManh=$(echo $dv | sed 's/.*\=//');
	dv=`grep -w -m 1 "CapDo" $CauHinh`;CapDo=$(echo $dv | sed 's/.*\=//');
	if [[ $QuetNhanh == 1 ]]; then CheDoQuet="Quét Nhanh"; else CheDoQuet="Quét Toàn bộ"; fi
	if [[ -z $CapDo ]]; then rm -rf $CauHinh; fi
fi

if [ ${CapNhatCauHinh} == 1 ]; then
	dv=`grep -w -m 1 "PhienBanCfg" $CauHinh`;PhienBanCfg=$(echo $dv | sed 's/.*\=//')
	if [ ${CapNhatCauHinh} != ${PhienBanCfg} ]; then rm -rf $CauHinh
	InRa "${TgCB} Chạy lại ${MauDo}$TenFile${MauXam} để cập nhật Cấu hình"; exit 1; fi
fi

#If any command shows out an error code, the script ends
set -e

function Banner () {
	echo -e "${MauDo}==================================="
	echo -e "|  ${MauXanh}YouTube Ads AdBlock for PiHole ${MauDo}|"
	echo -e "|  ${MauXam}    Phiên bản: ${MauXanh}${PhienBan}         ${MauDo}|"
	echo -e "|  ${MauXanh}${Nha}  ${MauDo}|"
	echo -e "|  ${MauXam}Tác giả: ${MauXanh}deividgdt             ${MauDo}|"
	echo -e "|  ${MauXam}Chỉnh sửa: ${MauXanh}Darias              ${MauDo}|"
	echo -e "==================================="
	echo -e "${MauXam}`date`";
	echo -e "Your IP Address: ${MauXanh}$ip${MauXam}";
	echo -e "${TgTT} Quét định kỳ: ${MauXanh}${CheDoQuet}${MauXam}"
	echo -e "${TgTT} Nhật Ký: ${MauXanh}${YTLog}${MauXam}"
	echo -e "${TgTT} Dữ liệu PiHole: ${MauXanh}${PiData}${MauXam}"
	echo ""
}

function CheckUser() {
	ROOT_UID=0
	if [[ "$(id -u $(whoami))" != "${ROOT_UID}" ]]; then
		echo -e "${TgNG} $(whoami) Vui lòng chạy $TenFile với quyền root."
		exit 1;
	fi
}

function CheckDocker() {
	DOCKER_PIHOLE="/etc/docker-pi-hole-version"
	if [ -f "${DOCKER_PIHOLE}" ]; then
		echo -e "${TgTT} Phát hiện Docker."
		DOCKER="y"
	fi
}

function Database() {
	local OPTION=$1
	local DOMAIN="$2"

	case $OPTION in
		"create")
			InRa "${TgTT} Đang tạo nhóm ID..."
			LASTGROUPID=$(sqlite3 "${PiData}" "SELECT MAX(id) FROM 'group';" 2>>  $YTLog )
			GROUPID=$((${LASTGROUPID} + 1))
			sqlite3 "${PiData}" "INSERT INTO 'group' (id, name, description) VALUES (${GROUPID}, 'YouTubeAdsBlock', 'YouTube AdsBlock');" 2>> $YTLog
			InRa "${TgOK} Đang tạo nhóm ID Hoàn tất!"
			;;
		"insertDomain")
			if [[ $DOMAIN == *.googlevideo.com ]]; then
				DemTenMien=$(($DemTenMien + 1))
				ThemTenMien=$(echo ${DOMAIN} | sed 's/.googlevideo.com//')
				InRa "${TgTT} Đang thêm $DemTenMien/$SoLuong: $ThemTenMien";
				sqlite3 "${PiData}"  """INSERT OR IGNORE INTO domainlist (type, domain, comment) VALUES (1, '${DOMAIN}', 'YouTube AdsBlock');""" 2>>  $YTLog;
			else
				InRa "${TgNG} Tên miền: $DOMAIN ${MauDo}không ${MauXam}được thêm vì khác định dạng!!!"
			fi
			;;
		"update")
			sqlite3 "${PiData}"  "UPDATE domainlist_by_group SET group_id=${GROUPID} WHERE domainlist_id IN (SELECT id FROM domainlist WHERE comment = 'YouTube AdsBlock');" 2>>  $YTLog
			;;
		"getGroupId")
			GROUPID=$(sqlite3 "${PiData}"  "SELECT id FROM 'group' WHERE name = 'YouTubeAdsBlock';" 2>>  $YTLog )
			;;
		"checkDomain")
			KTTenMien=$(sqlite3 "${PiData}"  """SELECT domain FROM domainlist WHERE comment = 'YouTube AdsBlock' AND domain = '${DOMAIN}';""" 2>>  $YTLog)
			;;
		"delete")
			InRa "${TgTT} Đang ${MauDo}xóa ${MauXam}tên miền con từ ${MauXanh}${PiData}${MauXam}"
			sqlite3 "${PiData}"  "DELETE FROM domainlist WHERE comment = 'YouTube AdsBlock';" 2>>  $YTLog
			sqlite3 "${PiData}"  "DELETE FROM 'group' WHERE name = 'YouTubeAdsBlock';" 2>>  $YTLog
			;;
	esac
}

function QuetFull() {
	echo -e "${TgTT} ${ThoiGian}" >> $YTLog
	InRa "${TgTT} Đang tổng hợp Nhật ký PiHole..."; sleep 1
	cp $PiTM/pihole.log* $TMTam
	for GZIPFILE in $(ls $TMTam/pihole.log*gz > /dev/null 2>&1); do
		gunzip $GZIPFILE;
	done

	InRa "${TgTT} Đang tìm tên miền con trong Nhật Ký..."
	TenMien=$(cat $TMTam/pihole.log* | egrep --only-matching "${CapDo}" | sort | uniq)

	if [ ! -z "${TenMien}" ]; then
		SoLuong=$(cat $TMTam/pihole.log* | egrep --only-matching "${CapDo}" | sort | uniq | wc --lines)
		InRa "${TgTT} Tìm thấy ${MauVang}$SoLuong ${MauXam}tên miền..."; DemTenMien=0
		for YTD in $TenMien; do
			Database "checkDomain" "${YTD}"
			if [[ -z ${KTTenMien} ]]; then Database "insertDomain" "${YTD}"; fi
		done
		Database "update"
		pihole updateGravity > ${PiLogGravity} 2>&1 &
		InRa "${TgTT} Đang cập nhật Dữ liệu"
		while [ ! -z "$(ps -fea | grep updateGravit[y])" ]; do echo -n "."; sleep 1; done
		echo ''; InRa "${TgOK} Cập nhật Dữ liệu Hoàn tất."
		InRa "${TgOK} ${MauXanh}$SoLuong ${MauXam}tên miền đã được thêm."
	else
		InRa "${TgCB} Không có tên miền nào được thêm."
	fi

	InRa "${TgTT} Đang ${MauDo}xóa ${MauXam}file tạm...";
	rm --force ${TMTam}/pihole.log*
	InRa "${TgOK} Đã xóa file tạm."; sleep 1; echo ''
}

function QuetLe() {
	echo -e "${TgTT} ${ThoiGian}" >> $YTLog
	InRa "${TgTT} Đang tìm tên miền con trong Nhật Ký..."
	TenMien=$(cat $PiLog | egrep --only-matching "${CapDo}" | sort | uniq)

	if [ ! -z "${TenMien}" ]; then
		SoLuong=$(cat $PiLog | egrep --only-matching "${CapDo}" | sort | uniq | wc --lines)
		InRa "${TgTT} Tìm thấy ${MauVang}$SoLuong ${MauXam}tên miền..."; COUNT=0;
		for YTD in $TenMien; do
			Database "checkDomain" "${YTD}"
			if [[ -z ${KTTenMien} ]]; then Database "insertDomain" "${YTD}"; fi
		done
		Database "update"
		pihole updateGravity > ${PiLogGravity} 2>&1 &
		InRa "${TgTT} Đang cập nhật Dữ liệu"
		while [ ! -z "$(ps -fea | grep updateGravit[y])" ]; do echo -n "."; sleep 1; done
		echo ''; InRa "${TgOK} Cập nhật Dữ liệu Hoàn tất."
		InRa "${TgOK} ${MauXanh}$SoLuong ${MauXam}tên miền đã được thêm."
	else
		InRa "${TgCB} Không có tên miền nào được thêm."
	fi
}

function TaoDichVu () {
	cd $TMDichVu && touch $TenDV
	cat > $TenDV <<-EOF
[Unit]
Description=Dịch vụ chặn quảng cáo YouTube bằng Pi-hole
After=network.target
[Service]
ExecStart=$TM/$TenFile chay
ExecStop=$TM/$TenFile dung
[Install]
WantedBy=multi-user.target
EOF
}

function CaiDichVu () {
	echo -e "${TgTT} ${ThoiGian}" >> $YTLog
	if [ ! -f $TMDichVu/$TenDV ]; then
		InRa "${TgTT} Nếu bạn di chuyển $TenFile sang nơi khác, vui lòng chạy: ${MauDo}sh $TenFile ${MauXanh}cai${MauXam}";
		InRa "${TgTT} Đang cài Dịch vụ..."; sleep 1
		TaoDichVu
		sudo chmod 664 $TMDichVu/$TenDV
		InRa "${TgOK} Dịch vụ đã được cài."
		InRa "${TgTT} Đang bật Dịch vụ."; sleep 1
		systemctl enable ytb 1> /dev/null 2>&1
		echo -e "${TgTT} Để chạy dịch vụ hãy dùng lệnh sau:\n\t ${MauVang}systemctl start ytb${MauXam}"; sleep 1
	else
		InRa "${TgCB} Chặn quảng cáo YouTube đã được cài đặt..."; sleep 1
		InRa "${TgTT} Cài đặt lại Dịch vụ..."; echo ''
		TaoDichVu
		systemctl daemon-reload
		systemctl restart ytb 1> /dev/null 2>&1
		InRa "${TgOK} Cài đặt lại Hoàn tất."; exit 1
	fi
}

function Cai() {
	echo -e "${TgTT} ${ThoiGian}" >> $YTLog
	CheckUser
	CheckDocker

	InRa "${TgTT} Đang bắt đầu cài ${MauVang}Chặn quảng cáo YouTube${MauXam}..."
	if [[ "${DOCKER}" == "y" ]]; then
		InRa "${TgCB} Chặn quảng cáo YouTube phải được chạy/dừng thủ công"
		QuetFull
		InRa "${TgCB} Hãy dùng lệnh: bash $TM/$TenFile { chay & || dung & }"
	fi
	InRa "${TgTT} Cấu hình Dữ liệu: ${MauXanh}$PiData ${MauXam}..."; sleep 1
	Database "create";
	CaiDichVu
	QuetFull
	InRa "${TgOK} Đang gọi Dịch vụ."
	systemctl start ytb 1> /dev/null 2>&1
	InRa "${TgOK} Chặn quảng cáo YouTube đã được cài đặt thành công!"
}

function Chay() {
	echo -e "${TgTT} ${ThoiGian}" >> $YTLog
	CheckUser
	Banner
	InRa "${TgOK} ${MauDo}$TenFile ${MauXanh}$PhienBan${MauXam} đang chạy..."
	Database "getGroupId"

	if [ -z ${GROUPID} ]; then
		InRa "${TgNG} Không thấy group ID của Chặn quảng cáo YouTube trong Dữ liệu."
		InRa "${TgTT} Vui lòng chạy lại $TenFile với tham số: cai"
		exit 1;
	fi

	while true; do
		if [[ $QuetNhanh == 1 ]]; then QuetLe; else QuetFull; fi
		echo -e "${TgTT} Quét định kỳ: ${MauXanh}${CheDoQuet}${MauXam}"
		InRa "${TgTT} ${MauDo}$TenFile ${MauXanh}$PhienBan${MauXam} sẽ quét tiếp sau: ${MauVang}$ThoiGianNgu giây${MauXam}"
		COUNT=$(($COUNT + 1))
		sleep $ThoiGianNgu;

		if [[ $COUNT -eq ${ThoiGianCapNhat} ]]; then
			CapNhat
			COUNT=0
		else
			continue;
		fi
	done
}

function Dung() {
	echo -e "${TgTT} ${ThoiGian}" >> $YTLog
	InRa "${TgTT} Dừng chặn quảng cáo YouTube";
	systemctl stop ytb 1> /dev/null 2>&1
	InRa "${TgNG} Chặn quảng cáo YouTube đã dừng"
	service ytb stop
	#kill -9 `pgrep ytb`
	killall ytb
}

function ChayLai () {
	TM="/sd/ytb"; mkdir -p $TM
	if [ ! -f $TM/chay ]; then
		sudo echo "systemctl restart ytb" > ${TM}/chay;
		sudo chmod +x ${TM}/chay
	fi
	if [ ! -f $TM/cai ]; then
		sudo echo "TM="/sd/ytb"; curl -sLo $TM/yt https://xem.li/yt; sudo chmod +x ${TM}/yt; sudo sh ${TM}/yt go; sudo sh ${TM}/yt cai" > ${TM}/cai
		sudo chmod +x ${TM}/cai
	fi
	sudo ${TM}/chaylai; sleep 1
}

function Go() {
	echo -e "${TgTT} ${ThoiGian}" >> $YTLog
	CheckDocker
	CheckUser

	echo -e "${TgTT} Đang ${MauDo}gỡ ${MauXam}chặn quảng cáo YouTube..."
	Database "delete"
	if [ ! -f $TM/cfg ]; then
	pihole updateGravity > ${PiLogGravity} 2>&1 &
	echo -ne "${TgTT} Đang cập nhật lại Dữ liệu"
	while [ ! -z "$(ps -fea | grep updateGravit[y])" ]; do echo -n "."; sleep 1; done
	echo ''; InRa "${TgOK} Cập nhật Dữ liệu Hoàn tất."; fi
	if [[ "${DOCKER}" != "y" ]]; then
		InRa "${TgTT} Đang ${MauDo}vô hiệu hóa ${MauXam}Dịch vụ..."
		systemctl stop ytb 1> /dev/null 2>&1
		systemctl disable ytb 1> /dev/null 2>&1
		systemctl daemon-reload
		InRa "${TgTT} Đang ${MauDo}xóa ${MauXam}Dịch vụ..."
		rm -rf $TMDichVu/$TenDV

		if [ -f ${TMDichVu}/ytadsblocker ]; then
			echo -e "${TgTT} Đang ${MauDo}xóa ${MauXam}Dịch vụ..."
			systemctl stop ytadsblocker 1> /dev/null 2>&1
			systemctl disable ytadsblocker 1> /dev/null 2>&1
			rm --force ${TMDichVu}/ytadsblocker;
			rm -rf ${TMDichVu}/ytadsblocker;
		fi

		if [ -f ${YTLog} ]; then
			InRa "${TgTT} Đang ${MauDo}xóa ${MauXam}Nhật ký..."
			rm --force ${YTLog};
		fi
	fi

	InRa "${TgOK} Tắt chặn quảng cáo YouTube"; echo ''
	#kill -9 `pgrep ytb`
	killall ytb
}

function CheckPiHole() {
	echo -e "${TgTT} ${ThoiGian}" >> $YTLog
	PiCfgu="https://docs.pi-hole.net/ftldns/blockingmode/#pi-holes-ip-ipv6-nodata-blocking"
	sslu="https://tecadmin.net/configure-ssl-in-lighttpd-server/"

	InRa "${TgTT} Kiểm tra phiên bản ${MauXanh}PiHole${MauXam}"
	piv=$(pihole -v | grep hole | sed -e 's/.*s v//; s/ (.*//; s/\..*//')
	pivful=$(pihole -v | grep hole | sed -e 's/.*s v//; s/ (.*//')
	if [ $piv -lt 5 ]; then
		InRa "${TgNG} ${MauDo}${TenFile} ${MauXanh}${PhienBan} ${MauXam}chỉ tương thích với ${MauDo}PiHole 5.x trở lên${MauXam}!!!"
		InRa "${TgTT} Hoặc chạy phiên bản ${MauXanh}legacy${MauXam} cho ${MauDo}PiHole 5.x trở xuống${MauXam}!!!"
		InRa "${TgTT} Tải phiên bản ${MauXanh}legacy${MauXam} tại: ${MauXanh}${pbcu}${MauXam}";
		read -p "${TgNG} Nhấn phím bất kỳ để thoát."; exit 1
	else
		InRa "${TgOK} ${MauDo}${TenFile}${PhienBan} ${MauXam}tương thích với ${MauDo}PiHole ${MauXanh}$pivful${MauXam}"
	fi

	InRa "${TgTT} Kiểm tra cấu hình ${MauXanh}PiHole${MauXam}"
	PiCfg=$(cat /etc/pihole/pihole-FTL.conf | grep IP-NODATA-AAAA | sed -e 's/\=.*//')
	PiCfh="BLOCKINGMODE"
	if [[ "${PiCfg}" != "${PiCfh}" ]]; then
		InRa "${TgNG} Cấu hình PiHole chưa tương thích!!! Việc cấu hình PiHole tương thích sẽ chặn quảng cáo hiệu quả hơn."
		InRa "${TgNG} Tham khảo cấu hình tại:\n ${PiCfgu}"; exit 1
	else
		InRa "${TgOK} PiHole đã bật ${MauXanh}BlockingMode${MauXam}"
	fi

	InRa "${TgTT} Kiểm tra cấu hình ${MauXanh}SSL${MauXam}"
	sslcfg=$(cat /etc/lighttpd/lighttpd.conf | grep 443)
	if [ -z ${sslcfg} ]; then
		InRa "${TgNG} PiHole chưa được cấu hình SSL!!!"
		InRa "${TgTT} Tham khảo cấu hình tại:\n ${sslcfg}"; exit 1
	else
		InRa "${TgOK} PiHole đã bật ${MauXanh}SSL${MauXam}"
	fi
}

function CapNhat() {
	echo -e "${TgTT} ${ThoiGian}" >> $YTLog
	InRa "${TgTT} Đang kiểm tra máy chủ cập nhật..."
	case "$(curl -s --max-time 2 -I xem.li | sed 's/^[^ ]* *\([0-9]\).*/\1/; 1q')" in [23]) net=1;;*) net=0;;esac
	if [ $net == 1 ]; then
	case "$(curl -s --max-time 2 -I github.com | sed 's/^[^ ]* *\([0-9]\).*/\1/; 1q')" in [23]) net=2;;*) net=0;;esac
		if [ $net == 2 ]; then
			case "$(curl -s --max-time 2 -I raw.githubusercontent.com | sed 's/^[^ ]* *\([0-9]\).*/\1/; 1q')" in [23]) net=3;;*) net=0;;esac
		fi
	fi
	if [ $net -ge 3 ]; then InRa "${TgTT} Đang kiểm tra cập nhật ${MauDo}$TenFile ${MauXanh}$PhienBan${MauXam}..."
		PhienBanMoi=$(${dl2} "${UpLink}" | grep PhienBan\= | sed 's/.*\=\"//; s/\"$//');
		if [ $PhienBanMoi == $PhienBan ]; then
		    InRa "${TgOK} ${MauDo}$TenFile ${MauXanh}$PhienBan ${MauXam}là bản mới nhất!";
		else InRa "${TgTT} Đang cập nhật ${MauDo}$TenFile ${MauXanh}$PhienBan ${MauXam}lên ${MauXanh}$PhienBanMoi${MauXam}...";
		    mkdir -p $TM/old
			cp $0 ${TM}/old/$PhienBan\_$TenFile
			$dl1 ${upTam} $UpLink; sudo chmod +x ${upTam};
			PhienBanUp=$(cat $upTam | grep PhienBan\= | sed 's/.*\=\"//; s/\"$//')
			if [ $PhienBanMoi == $PhienBanUp ]; then mv ${upTam} ${TM}/$TenFile
				InRa "${TgOK} ${MauDo}$TenFile được cập nhật lên ${MauXanh}$PhienBanMoi${MauXam}!"
			else InRa "${TgNG} $TenFile cập nhật thất bại!!!"; exit 1; fi
			InRa "${TgOK} Khởi động lại dịch vụ ${MauDo}$TenFile ${MauXanh}$PhienBanMoi${MauXam}...";
			if [ -f $TMDichVu/$TenDV ]; then ChayLai; fi;
			#sh ${TM}/$TenFile up; exit 0;
		fi
	else InRa "${TgNG} Không có mạng!!! Thoát ra"; exit 1
	fi
}

case "$1" in
	"cai"	) Banner; Cai	;;
	"chay"	) Chay			;;
	"up"	) CapNhat		;;
	"kt"	) CheckPiHole	;;
	"dung"	) Dung			;;
	"go"	) Go			;;
	*		) Banner; echo -e "${TgNG} Tham số không phù hợp.\n${TgTT} Tham số của ${MauDo}$TenFile ${MauXanh}$PhienBan ${MauXam} như sau: \n${TgTT} ${MauDo}./$TenFile ${MauXam}[ ${MauXanh}cai ${MauXam}| ${MauXanh}chay ${MauXam}| ${MauXanh}up ${MauXam}| ${MauXanh}kt ${MauXam}| ${MauXanh}dung ${MauXam}| ${MauXanh}go ${MauXam}]\n${TgTT} Chức năng tham số:\n${TgTT} ${MauXanh}cai${MauXam} | Cài đặt ${MauDo}$TenFile${MauXam}.\n${TgTT} ${MauXanh}chay${MauXam} | Chạy ${MauDo}$TenFile${MauXam}.\n${TgTT} ${MauXanh}up${MauXam}	| Cập nhật ${MauDo}$TenFile${MauXam}.\n${TgTT} ${MauXanh}kt${MauXam}	| Kiểm tra tương thích.\n${TgTT} ${MauXanh}dung${MauXam} | Dừng ${MauDo}$TenFile${MauXam}.\n${TgTT} ${MauXanh}go${MauXam}	| Gỡ cài đặt ${MauDo}$TenFile${MauXam}." ;;
esac
echo ''

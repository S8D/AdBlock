#!/bin/bash
# Script chặn quảng cáo của YouTube bằng Pi-Hole
PhienBan="210906a"
CapNhatCauHinh="1"
UpURL="https://lienket.vn/yt"
DuPhongURL="https://lienket.vn/dp"
Nha="https://s8d.github.io/AdBlock"
pbcu="https://xem.li/ytbo"
ip=$(curl -s api.ipify.org)
dl1="curl -sLo"; dl2="curl -sL"
PiTM="/var/log"
PiLog="/var/log/pihole.log"
Chuyen="/etc/pihole/custom.list"
mkdir -p /sd; echo ''
TM="/sd/ytb"; mkdir -p $TM
CauHinh="${TM}/cauhinh"
YTLog="${TM}/NhatKy.log"
TMTam="${TM}/tam"; mkdir -p $TMTam
Tam="${TM}/tmp"
QUIET="0"
ThoiGian=$(date "+%F %T")

TMDichVu="/lib/systemd/system"
TenDuPhong="dp"
TenYTB="ytb"
DVDuPhong="${TenDuPhong}.service"
CaiDV=${TM}/$TenDuPhong
TenDV="${TenYTB}.service"
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
function CheckCauHinh () {
	if [[ -z $CapDo ]]; then InRa "${TgNG} ${MauXanh}Cấp độ quét ${MauDo}chưa được cài đặt${MauXam}!!!"; fi
	if [[ -z $SetIP ]]; then InRa "${TgNG} ${MauXanh}IP chặn ${MauDo}chưa được cài đặt${MauXam}!!!"; fi
	if [[ -z $QuetNhanh ]]; then InRa "${TgNG} ${MauXanh}Chế độ quét ${MauDo}chưa được cài đặt${MauXam}!!!"; fi
}

if [ ! -f "${CauHinh}" ]; then
	InRa "${TgTT} Tạo file cấu hình..."
	echo '' > $CauHinh
	echo -e 'PhienBanCfg=1' >> $CauHinh
	#echo -e 'SetIP=8.8.8.8' >> $CauHinh
	echo -e 'ThoiGianCapNhat=2' >> $CauHinh
	echo -e 'ThoiGianNgu=300' >> $CauHinh
	echo "ChanThuong=r([0-9]{1,2})[^-].*\.googlevideo\.com" >> $CauHinh
	echo "ChanManh=r([0-9]{1,2}).*\.googlevideo\.com" >> $CauHinh
	ChanThuong="r([0-9]{1,2})[^-].*\.googlevideo\.com"
	ChanManh="r([0-9]{1,2}).*\.googlevideo\.com"
	while true; do
  		echo -e "${TgTT} Cài ${MauXanh}IP ${MauXam}cho tên miền ${MauDo}bị chặn${MauXam}: "; read -p " " SetIP
		if [[ $SetIP =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then echo -e "SetIP=${SetIP}" >> $CauHinh; break
		else echo -e "${TgNG} IP ${MauXanh}$SetIP ${MauDo}sai định dạng${MauXam}. Vui lòng nhập lại!!!"; fi
	done
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
	if [ -f "${CauHinh}" ]; then
		dv=`grep -w -m 1 "ThoiGianCapNhat" $CauHinh`;ThoiGianCapNhat=$(echo $dv | sed 's/.*\=//');
		dv=`grep -w -m 1 "PhienBanCfg" $CauHinh`;PhienBanCfg=$(echo $dv | sed 's/.*\=//');
		dv=`grep -w -m 1 "ThoiGianNgu" $CauHinh`;ThoiGianNgu=$(echo $dv | sed 's/.*\=//');
		dv=`grep -w -m 1 "ChanThuong" $CauHinh`;ChanThuong=$(echo $dv | sed 's/.*\=//');
		dv=`grep -w -m 1 "QuetNhanh" $CauHinh`;QuetNhanh=$(echo $dv | sed 's/.*\=//');
		dv=`grep -w -m 1 "ChanManh" $CauHinh`;ChanManh=$(echo $dv | sed 's/.*\=//');
		dv=`grep -w -m 1 "CapDo" $CauHinh`;CapDo=$(echo $dv | sed 's/.*\=//');
		dv=`grep -w -m 1 "SetIP" $CauHinh`;SetIP=$(echo $dv | sed 's/.*\=//');
		CheckCauHinh
		if [[ $QuetNhanh == 1 ]]; then CheDoQuet="Quét Nhanh"; else CheDoQuet="Quét Toàn bộ"; fi
	else InRa "${TgNG} Không tìm thấy file ${MauDo}$CauHinh${MauXam}!!!"
	fi
fi	
if [ -f "${CauHinh}" ]; then
	if [ ${CapNhatCauHinh} == 1 ]; then
		dv=`grep -w -m 1 "PhienBanCfg" $CauHinh`;PhienBanCfg=$(echo $dv | sed 's/.*\=//')
		if [ ${CapNhatCauHinh} != ${PhienBanCfg} ]; then rm -rf $CauHinh
		InRa "${TgCB} Chạy lại ${MauDo}$TenFile${MauXam} để cập nhật Cấu hình"; exit 1; fi
	fi
else InRa "${TgNG} Không tìm thấy file ${MauDo}$CauHinh${MauXam}!!!"
fi

set -e

function Banner () {
	echo -e "${MauDo}==================================="
	echo -e "|  ${MauXanh}YouTube Ads AdBlock for PiHole ${MauDo}|"
	echo -e "|  ${MauXam}    Phiên bản: ${MauXanh}${PhienBan}         ${MauDo}|"
	echo -e "|  ${MauXanh}${Nha}  ${MauDo}|"
	echo -e "|  ${MauXam}Tác giả: ${MauXanh}Darias                ${MauDo}|"
	echo -e "==================================="
	echo -e "${MauXam}`date`";
	echo -e "${TgTT} Địa chỉ IP của bạn: ${MauXanh}$ip${MauXam}";
	echo -e "${TgTT} Địa chỉ IP cài đặt: ${MauXanh}$SetIP${MauXam}";
	echo -e "${TgTT} Quét định kỳ: ${MauXanh}${CheDoQuet}${MauXam}"
	echo -e "${TgTT} Nhật Ký: ${MauXanh}${YTLog}${MauXam}"
	echo -e "${TgTT} Dữ liệu PiHole: ${MauXanh}${Chuyen}${MauXam}"
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

function CheckPiHole() {
	InRa "${TgTT} ${ThoiGian}"
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
		InRa "${TgOK} ${MauDo}${TenFile} ${MauXanh}${PhienBan} ${MauXam}tương thích với ${MauDo}PiHole ${MauXanh}$pivful${MauXam}"
	fi

	InRa "${TgTT} Kiểm tra cấu hình ${MauXanh}PiHole${MauXam}"
	PiCfg=$(cat /etc/pihole/pihole-FTL.conf | grep IP-NODATA-AAAA | sed -e 's/\=.*//')
	PiCfh="BLOCKINGMODE"
	if [[ "${PiCfg}" == "${PiCfh}" ]]; then
		InRa "${TgOK} PiHole đã bật ${MauXanh}BlockingMode${MauXam}"
	else
		InRa "${TgNG} Cấu hình PiHole chưa tương thích!!!\n${TgNG} Việc cấu hình PiHole tương thích sẽ chặn quảng cáo hiệu quả hơn."
		InRa "${TgNG} Tham khảo cấu hình tại:\n ${PiCfgu}"; exit 1
	fi

	InRa "${TgTT} Kiểm tra cấu hình ${MauXanh}SSL${MauXam}"
	sslcfg=$(cat /etc/lighttpd/*.conf | grep 443 | sed 's/.*://; s/".*//')
	if [ -z ${sslcfg} ]; then
		InRa "${TgNG} PiHole chưa được cấu hình SSL!!!"
		InRa "${TgTT} Tham khảo cấu hình tại:\n ${sslcfg}"; exit 1
	else
		InRa "${TgOK} PiHole đã bật ${MauXanh}SSL${MauXam}"
	fi
}

function Quet () {
	ThoiGian=$(date "+%F %T")
	InRa "${TgTT} ${ThoiGian}"
	CheckCauHinh
	InRa "${TgTT} Đang tìm tên miền con trong Nhật Ký..."
	if [[ $QuetNhanh == 1 ]]; then
		DSTenMien=$(cat $PiLog | egrep --only-matching "${CapDo}" | sort | uniq)
		SoLuong=$(cat $PiLog | egrep --only-matching "${CapDo}" | sort | uniq | wc --lines)
	else
		InRa "${TgTT} Đang tổng hợp Nhật ký PiHole..."
		yes | cp -rf ${PiTM}/pihole.lo* ${TMTam}
		gunzip $TMTam/*.gz
		DSTenMien=$(cat $TMTam/pihole.log* | egrep --only-matching "${CapDo}" | sort | uniq)
		SoLuong=$(cat $TMTam/pihole.log* | egrep --only-matching "${CapDo}" | sort | uniq | wc --lines)
	fi

	if [ ! -z "${DSTenMien}" ]; then
		InRa "${TgTT} Tìm thấy ${MauVang}$SoLuong ${MauXam}tên miền..."; DemTenMien=0
		for TenMien in $DSTenMien; do ThemTenMien=$(echo ${TenMien} | sed 's/.googlevideo.com//')
			cat $Chuyen | grep googlevideo | sed 's/.*(\t| )+//' > $Tam
			if [[ $TenMien == *.googlevideo.com ]]; then DemTenMien=$(($DemTenMien + 1))
				InRa "${TgTT} Đang thêm ${MauVang}$DemTenMien${MauXam}/${MauXanh}$SoLuong${MauXam}: ${MauXanh}$ThemTenMien${MauXam}";
				echo $TenMien | grep -Fvwf $Tam | sort | uniq | awk -v "IP=$SetIP" '{sub(/\r$/,""); print IP" "$0}' >> $Chuyen;
			else
			InRa "${TgNG} Tên miền $TenMien ${MauDo}không ${MauXam}được thêm vì sai định dạng!!!"
			fi
		done
		cat $Chuyen | sort | uniq > $Tam; mv $Tam $Chuyen
		TongSo=$(cat $Chuyen | grep googlevideo | sed 's/.*(\t| )+//' | wc --lines)
		InRa "${TgOK} Số lượng tên miền đã thêm: ${MauXanh}$DemTenMien${MauXam}."
		InRa "${TgOK} Tổng số tên miền đang chặn: ${MauVang}$TongSo${MauXam}."
	else
		InRa "${TgCB} Không có tên miền nào được thêm."
	fi

	#if [[ -f "${TMTam}/pihole.log" ]]; then
	#	InRa "${TgTT} Đang ${MauDo}xóa ${MauXam}file tạm...";
	#	rm -rf $TMTam
	#	InRa "${TgOK} Đã xóa file tạm."; sleep 1; echo ''
	#fi
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

function DuPhong () {
	TM="/sd/ytb"; CaiDV=${TM}/$TenDuPhong; cd $TM
	if [ ! -f ${CaiDV} ]; then $dl1 ${CaiDV} $DuPhongURL; sudo chmod +x ${CaiDV}; fi
	dv=`grep -w -m 1 "PhienBan" $CaiDV`;PhienBanCai=$(echo $dv | sed 's/.*\=\"//; s/\"$//')
	if [ -z ${PhienBanCai} ]; then rm -rf $CaiDV; $dl1 ${CaiDV} $DuPhongURL; sudo chmod +x ${CaiDV}; fi
	if [ -f ${CaiDV} ]; then $CaiDV; else InRa "${TgNG} Không tìm thấy $CaiDV"; exit 1; fi
}

function GoiDuPhong () {
	InRa "${TgCB} ${MauDo}$TenFile ${MauXanh}$PhienBan${MauXam} đang chạy lại Dịch vụ ${MauVang}phụ trợ ${MauXanh}chặn quảng cáo YouTube${MauXam}...";
	sudo systemctl stop $TenDuPhong
	sudo systemctl start $TenDuPhong
	sleep 3
	DangChay=$(systemctl status $TenDuPhong | grep Active | sed 's/).*//; s/.*(//')
	if [[ $DangChay == "running" ]]; then InRa "${TgOK} Dịch vụ ${MauVang}phụ trợ ${MauXanh}chặn quảng cáo YouTube ${MauXam}đang chạy..."
	else InRa "${TgNG} Dịch vụ ${MauVang}phụ trợ ${MauXanh}chặn quảng cáo YouTube ${MauDo}không chạy${MauXam}..."
		InRa "${TgCB} Đang khởi động lại Dịch vụ ${MauVang}phụ trợ ${MauXanh}chặn quảng cáo YouTube${MauXam}..."
		sudo systemctl restart $TenDuPhong
	fi
}

function CaiDichVu () {
	InRa "${TgTT} ${ThoiGian}"
	if [ ! -f $TMDichVu/$TenDV ]; then
		InRa "${TgTT} Nếu bạn di chuyển $TenFile sang nơi khác, vui lòng chạy: ${MauDo}sh $TenFile ${MauXanh}cai${MauXam}";
		InRa "${TgTT} Đang cài Dịch vụ..."; sleep 1
		TaoDichVu
		sudo chmod 664 $TMDichVu/$TenDV
		InRa "${TgOK} Dịch vụ đã được cài."
		InRa "${TgTT} Đang bật Dịch vụ."; sleep 1
		systemctl enable $TenYTB 1> /dev/null 2>&1
		echo -e "${TgTT} Để chạy dịch vụ hãy dùng lệnh sau:\n\t ${MauVang}systemctl start $TenYTB${MauXam}"; echo ''
	else
		InRa "${TgOK} Chặn quảng cáo YouTube đã được cài đặt..."; sleep 1
		InRa "${TgCB} Cài đặt lại Dịch vụ..."; echo ''
		TaoDichVu
		systemctl daemon-reload
		systemctl restart $TenYTB 1> /dev/null 2>&1
		InRa "${TgOK} Cài đặt lại Hoàn tất."; exit 1
	fi
}

function Cai() {
	InRa "${TgTT} ${ThoiGian}"
	CheckUser
	CheckDocker
	CheckPiHole	
	CheckCauHinh
	InRa "${TgTT} Đang bắt đầu cài ${MauVang}Chặn quảng cáo YouTube${MauXam}..."
	if [[ "${DOCKER}" == "y" ]]; then
		InRa "${TgCB} Chặn quảng cáo YouTube phải được chạy/dừng thủ công"
		Quet
		InRa "${TgCB} Hãy dùng lệnh: bash $TM/$TenFile { chay & || dung & }"
	fi
	CaiDichVu
	DuPhong
	QuetNhanh=0
	Quet
	InRa "${TgOK} Đang gọi Dịch vụ."
	systemctl start $TenYTB 1> /dev/null 2>&1
	InRa "${TgOK} Chặn quảng cáo YouTube đã được cài đặt thành công!"
}

function Chay() {
	InRa "${TgTT} ${ThoiGian}"
	CheckUser	
	Banner
	CheckCauHinh
	InRa "${TgOK} ${MauDo}$TenFile ${MauXanh}$PhienBan${MauXam} đang chạy..."

	while true; do
		Quet
		if [ ! -f $TMDichVu/$DVDuPhong ]; then DuPhong; fi
		DangChay=$(systemctl status $TenDuPhong | grep Active | sed 's/).*//; s/.*(//')
		if [[ $DangChay != "running" ]]; then sudo systemctl start $TenDuPhong; fi
		echo -e "${TgTT} Quét định kỳ: ${MauXanh}${CheDoQuet}${MauXam}"
		InRa "${TgTT} ${MauDo}$TenFile ${MauXanh}$PhienBan${MauXam} sẽ quét tiếp sau: ${MauVang}$ThoiGianNgu giây${MauXam}"
		InRa "${TgTT}"
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
	InRa "${TgTT} ${ThoiGian}"
	InRa "${TgTT} Dừng chặn quảng cáo YouTube";
	systemctl stop $TenYTB 1> /dev/null 2>&1
	InRa "${TgNG} Chặn quảng cáo YouTube đã dừng"
	service $TenYTB stop
	#kill -9 `pgrep $TenYTB`
	killall $TenYTB
}

function Go() {
	InRa "${TgTT} ${ThoiGian}"
	CheckDocker
	CheckUser

	echo -e "${TgTT} Đang ${MauDo}gỡ ${MauXam}chặn quảng cáo YouTube ${MauXanh}$PhienBan${MauXam}..."
	if [[ "${DOCKER}" != "y" ]]; then		
		for TenDichVu in $DVDuPhong $TenDV; do
			InRa "${TgTT} Đang ${MauDo}gỡ ${MauXam}Dịch vụ ${MauXanh}$TenDichVu${MauXam}..."
			systemctl stop $TenDichVu
			systemctl disable $TenDichVu
			rm -rf ${TMDichVu}/$TenDichVu
			rm -rf /etc/systemd/system/$TenDichVu
			rm -rf /etc/systemd/system/$TenDichVu
			rm -rf /usr/lib/systemd/system/$TenDichVu
			rm -rf /usr/lib/systemd/system/$TenDichVu
		done
		systemctl daemon-reload
		systemctl reset-failed

		if [ -f ${TMDichVu}/ytadsblocker ]; then bash <(curl -sL gg.gg/_ytb) uninstall
			echo -e "${TgTT} Đang ${MauDo}gỡ ${MauXam}Dịch vụ..."
			systemctl stop ytadsblocker 1> /dev/null 2>&1
			systemctl disable ytadsblocker 1> /dev/null 2>&1
			rm --force ${TMDichVu}/ytadsblocker;
			rm -rf ${TMDichVu}/ytadsblocker;
		fi

		if [ -f ${YTLog} ]; then
			InRa "${TgTT} Đang ${MauDo}xóa ${MauXam}Nhật ký..."
			rm --force ${YTLog};
		fi

		if [ -f $TMTam/pihole.log ]; then
			InRa "${TgTT} Đang ${MauDo}xóa ${MauXam} file rác..."
			rm -rf $TMTam
		fi
	fi
	rm -rf $TMTam $Tam
	InRa "${TgOK} Tắt chặn quảng cáo YouTube"; echo ''
	sed -i '/googlevideo/d' $Chuyen
	sed -e 's/\n+/\n/' $Chuyen; echo ''
	killall $TenYTB
}

function CapNhat() {
	InRa "${TgTT} ${ThoiGian}"
	DangChay=$(systemctl status $TenDuPhong | grep Active | sed 's/).*//; s/.*(//')
	if [[ $DangChay != "running" ]]; then sudo systemctl start $TenDuPhong; fi
	InRa "${TgTT} Đang kiểm tra máy chủ cập nhật..."
	case "$(curl -s --max-time 2 -I bom.to | sed 's/^[^ ]* *\([0-9]\).*/\1/; 1q')" in [23]) net=1;;*) net=0;;esac
	if [ $net == 1 ]; then
	case "$(curl -s --max-time 2 -I github.com | sed 's/^[^ ]* *\([0-9]\).*/\1/; 1q')" in [23]) net=2;;*) net=0;;esac
		if [ $net == 2 ]; then
			case "$(curl -s --max-time 2 -I raw.githubusercontent.com | sed 's/^[^ ]* *\([0-9]\).*/\1/; 1q')" in [23]) net=3;;*) net=0;;esac
		fi
	fi
	if [ $net -ge 3 ]; then InRa "${TgTT} Đang kiểm tra cập nhật ${MauDo}$TenFile ${MauXanh}$PhienBan${MauXam}..."
		PhienBanMoi=$(${dl2} "${UpURL}" | grep PhienBan\= | sed 's/.*\=\"//; s/\"$//');
		if [ $PhienBanMoi == $PhienBan ]; then
		    InRa "${TgOK} ${MauDo}$TenFile ${MauXanh}$PhienBan ${MauXam}là bản mới nhất!";
		else InRa "${TgCB} Đang cập nhật ${MauDo}$TenFile ${MauXanh}$PhienBan ${MauXam}lên ${MauXanh}$PhienBanMoi${MauXam}...";
		    mkdir -p $TM/old; rm -rf $Tam $TMTam
			cp $0 ${TM}/old/$PhienBan\_$TenFile
			$dl1 ${Tam} $UpURL; sudo chmod +x ${Tam};
			PhienBanUp=$(cat $Tam | grep PhienBan\= | sed 's/.*\=\"//; s/\"$//')
			if [ $PhienBanMoi == $PhienBanUp ]; then mv ${Tam} ${TM}/$TenFile
				InRa "${TgOK} ${MauDo}$TenFile ${MauXam}được ${MauVang}cập nhật ${MauXam}lên ${MauXanh}$PhienBanMoi${MauXam}!"
				rm -rf $Tam
			else InRa "${TgNG} ${MauDo}$TenFile ${MauXam}cập nhật thất bại!!!"; exit 1; fi			
			if [ -f $TMDichVu/$TenDV ]; then 
				InRa "${TgOK} Khởi động lại dịch vụ ${MauDo}$TenFile ${MauXanh}$PhienBanMoi${MauXam}...";
				if [ ! -f $TMDichVu/$DVDuPhong ]; then DuPhong; fi
				cd $TM; ./$TenDuPhong cl; exit 0
			fi
			
		fi
	else InRa "${TgNG} Không có mạng!!! Thoát ra"; exit 1
	fi
}

function GiupDo () {
	echo -e "${TgNG} Tham số truyền cho ${MauDo}$TenFile ${MauXanh}$PhienBan ${MauXam} như sau:
${TgTT} ${MauDo}./$TenFile ${MauXam}[ ${MauXanh}cai ${MauXam}| ${MauXanh}chay ${MauXam}| ${MauXanh}up ${MauXam}| ${MauXanh}kt ${MauXam}| ${MauXanh}dung ${MauXam}| ${MauXanh}go ${MauXam}]
${TgTT}	 ${MauXanh}cai${MauXam}  | Cài đặt ${MauDo}$TenFile${MauXam}.
${TgTT}	 ${MauXanh}chay${MauXam} | Chạy ${MauDo}$TenFile${MauXam}.
${TgTT}	 ${MauXanh}up${MauXam}   | Cập nhật ${MauDo}$TenFile${MauXam}.
${TgTT}	 ${MauXanh}kt${MauXam}   | Kiểm tra tương thích.
${TgTT}	 ${MauXanh}dung${MauXam} | Dừng ${MauDo}$TenFile${MauXam}.
${TgTT}	 ${MauXanh}go${MauXam}   | Gỡ cài đặt ${MauDo}$TenFile${MauXam}.
${TgTT}
${TgTT} Ngoài ra bạn có thể chỉnh sửa cấu hình trong file ${MauVang}$TM/${MauXanh}cauhinh${MauXam}"
}

case "$1" in
	"cai"	) Banner; Cai	;;
	"chay"	) Chay			;;
	"up"	) CapNhat		;;
	"kt"	) CheckPiHole	;;
	"dung"	) Dung			;;
	"dp"	) DuPhong		;;
	"gdp"	) GoiDuPhong	;;
	"go"	) Go			;;
	*		) Banner;GiupDo ;;
esac
echo ''
# Script chặn quảng cáo của YouTube bằng Pi-Hole

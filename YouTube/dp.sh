#!/bin/bash
PhienBan="210907a"
#################################
# Script chặn quảng cáo dự phòng#
#################################
UpURL="http://gg.gg/yt_"
DuPhongURL="http://gg.gg/dp_"
ThoiGian=$(date "+%F %T")
TGNgu="360"
TGCapNhat="1"
ip=$(curl -s api.ipify.org)
dl1="curl -sLo"; dl2="curl -sL"
mkdir -p /sd
TM="/sd/ytb"; mkdir -p $TM; cd ${TM}
CauHinh="${TM}/cauhinh"
TMTam="/tmp/ytb"; mkdir -p $TMTam
upTam="${TM}/tmp"
YTLog="${TM}/NhatKy.log"
ImLang="0"

TMDichVu="/lib/systemd/system"
TenDP="dp"
TenYTB="yt"
DichVuDP="${TenDP}.service"
CaiDV=${TM}/$TenDP
DichVuYTB="${TenYTB}.service"
TenFile=$(basename $0)

if [ -f $TMDichVu/$DichVuYTB ]; then
	TenFileYTB=$(systemctl status $DichVuYTB | grep chay | sed 's/.*ytb\///; s/ .*//')
	if [ -f $TMDichVu/$TenFileYTB ]; then
		PhienBanYTB=$(cat $TM/$TenFileYTB | grep PhienBan\= | sed 's/.*\=\"//; s/\"$//')
	fi
fi

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
function InRa () { [ $ImLang -eq 0 ] && echo -e "$1" ; echo -e "$1" >> $YTLog; }

function DichVu () {
	cd ${TMDichVu} && touch $DichVuDP
	cat > $DichVuDP <<-EOF
[Unit]
Description=dịch vụ phụ trợ chặn quảng cáo YouTube
After=network.target
[Service]
ExecStart=$TM/${TenDP} chay
ExecStop=$TM/${TenDP} dung
[Install]
WantedBy=multi-user.target

EOF
}

function CaiYT () {
	if [ ! -f $TM/$TenDP ]; then
		cd ${TM}; $dl1 $TenDP $UpURL
		sudo chmod +x $TenDP; ./$TenDP go; ./$TenDP cai
fi

}

function Chay () {
	while true; do
		DangChay=$(systemctl status $TenYTB | grep Active | sed 's/).*//; s/.*(//')
		if [[ $DangChay == "running" ]]; then 
			InRa "${TgOK} dịch vụ ${MauXanh}$TenFileYTB ${MauVang}$PhienBanYTB ${MauXam}đang chạy..."
			InRa "${TgTT} ${ThoiGian}"; InRa "${TgTT}"
		else 
			if [ -f $TMDichVu/$DichVuYTB ]; then 
			InRa "${TgNG} ${MauDo}$TenFile ${MauXanh}$PhienBan${MauXam} đang gọi dịch vụ ${MauXanh}$TenFileYTB ${MauVang}${PhienBanYTB}${MauXam}"; 
			sudo systemctl start $TenYTB
			InRa "${TgTT} ${ThoiGian}"; InRa "${TgTT}"
			else CaiYT; fi
		fi
		COUNT=$(($COUNT + 1))
		sleep $TGNgu;

		if [[ $COUNT -eq ${TGCapNhat} ]]; then
			CapNhat
			COUNT=0
		else
			continue;
		fi
	done

}

function GoiYT () {
	DangChay=$(systemctl status $TenYTB | grep Active | sed 's/).*//; s/.*(//')
	if [[ $DangChay == "running" ]]; then 
		InRa "${TgOK} dịch vụ ${MauVang}$TenFileYTB ${MauXanh}$PhienBanYTB ${MauXam}đang chạy..."; 
		InRa "${TgTT} ${ThoiGian}"; InRa "${TgTT}"
	else 
		if [ -f $TMDichVu/$DichVuYTB ]; then 
		InRa "${TgCB} ${MauDo}$TenFile ${MauXanh}$PhienBan${MauXam} đang gọi dịch vụ ${MauXanh}$TenFileYTB ${MauXanh}$PhienBanYTB${MauXam}..."; 
		sudo systemctl start $TenYTB; InRa "${TgTT} ${ThoiGian}"; InRa "${TgTT}"; fi
	fi
}

function GoiLaiYT () {
	InRa "${TgCB} ${MauDo}$TenFile ${MauXanh}$PhienBan${MauXam} đang ${MauVang}chạy lại ${MauXam}dịch vụ ${MauXanh}$TenFileYTB ${MauVang}$PhienBanYTB${MauXam}..."
	sudo systemctl stop $TenYTB
	sudo systemctl start $TenYTB
	sleep 5
	DangChay=$(systemctl status $TenYTB | grep Active | sed 's/).*//; s/.*(//')
	if [[ $DangChay == "running" ]]; then 
		InRa "${TgOK} dịch vụ ${MauXanh}$TenFileYTB ${MauVang}$PhienBanYTB ${MauXam}đang chạy..."
		InRa "${TgTT} ${ThoiGian}"; InRa "${TgTT}"
	else InRa "${TgNG} dịch vụ ${MauXanh}$TenFileYTB ${MauVang}$PhienBanYTB ${MauDo}không chạy${MauXam}..."
		InRa "${TgCB} Đang khởi động lại dịch vụ ${MauXanh}$TenFileYTB ${MauVang}$PhienBanYTB${MauXam}..."; 
		sudo systemctl restart $TenYTB
		InRa "${TgTT} ${ThoiGian}"; InRa "${TgTT}"
	fi
}

function Dung () {
	systemctl stop $TenDP
}

function Go () {
	${TM}/$TenYTB go
}

function CapNhat() {
	InRa "${TgTT} ${ThoiGian}"
	InRa "${TgTT} Đang kiểm tra máy chủ cập nhật..."; MayChu=$(echo $UpURL | sed 's/.*\/\///; s/\/.*//')
	case "$(curl -s --max-time 2 -I ${MayChu} | sed 's/^[^ ]* *\([0-9]\).*/\1/; 1q')" in [23]) net=1;;*) net=0;;esac
	if [ $net == 1 ]; then
	case "$(curl -s --max-time 2 -I github.com | sed 's/^[^ ]* *\([0-9]\).*/\1/; 1q')" in [23]) net=2;;*) net=0;;esac
		if [ $net == 2 ]; then
			case "$(curl -s --max-time 2 -I raw.githubusercontent.com | sed 's/^[^ ]* *\([0-9]\).*/\1/; 1q')" in [23]) net=3;;*) net=0;;esac
		fi
	fi
	if [ $net -ge 3 ]; then InRa "${TgTT} Đang kiểm tra cập nhật ${MauDo}$TenFile ${MauXanh}$PhienBan${MauXam}..."
		PhienBanMoi=$(${dl2} "${DuPhongURL}" | grep PhienBan\= | sed 's/.*\=\"//; s/\"$//');
		if [ $PhienBanMoi == $PhienBan ]; then
		    InRa "${TgOK} ${MauDo}$TenFile ${MauXanh}$PhienBan ${MauXam}là bản ${MauVang}mới nhất${MauXam}!"; InRa "${TgTT}"
		else InRa "${TgCB} Đang cập nhật ${MauDo}$TenFile ${MauXanh}$PhienBan ${MauXam}lên ${MauXanh}$PhienBanMoi${MauXam}...";
		    mkdir -p $TM/old
			cp $0 ${TM}/old/$PhienBan\_$TenFile
			$dl1 ${upTam} $DuPhongURL; sudo chmod +x ${upTam};
			PhienBanUp=$(cat $upTam | grep PhienBan\= | sed 's/.*\=\"//; s/\"$//')
			if [ $PhienBanMoi == $PhienBanUp ]; then mv ${upTam} ${TM}/$TenFile
				InRa "${TgOK} ${MauDo}$TenFile ${MauXam}được ${MauVang}cập nhật ${MauXam}lên ${MauXanh}$PhienBanMoi${MauXam}!"
			else InRa "${TgNG} ${MauDo}$TenFile ${MauXam}cập nhật ${MauDo}thất bại${MauXam}!!!"; exit 1; fi
			if [ -f $TM/$TenFileYTB ]; then
			InRa "${TgCB} Khởi động lại dịch vụ ${MauDo}$TenFile ${MauXanh}$PhienBanMoi${MauXam}...";
			cd $TM; ./$TenFileYTB gdp; exit 0; fi
		fi
	else InRa "${TgNG} Không có mạng!!! Thoát ra"; exit 1
	fi
}

if [ ! -f $TMDichVu/$DichVuDP ]; then
	DichVu
	sudo chmod +x $TMDichVu/$DichVuDP
	sudo systemctl enable $TenDP
	sudo systemctl start $TenDP
fi

case "$1" in
	"chay"	) Chay			;;
	"up"	) CapNhat		;;
	"dung"	) Dung			;;
	"cl"	) GoiLaiYT		;;
	"go"	) Go			;;
	*		) GoiYT			;;
esac
echo ''
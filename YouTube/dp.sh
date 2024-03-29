#!/bin/bash
PhienBan="210910a"
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

function TTYTB () { 
	if [ -f $TMDichVu/$DichVuYTB ]; then 
		TenFileYTB=$(systemctl status $DichVuYTB | grep chay | sed 's/.*ytb\///; s/ .*//'); 
		PhienBanYTB=$(cat $TM/$TenFileYTB | grep PhienBan\= | sed 's/.*\=\"//; s/\"$//'); 
	fi
	PhienBanYTB=$(echo $PhienBanYTB | sed 's/\n.*//')
}

function GoiYT () {
	TenFileYTB=
	PhienBanYTB=
	TTYTB
	DangChay=$(systemctl status $TenYTB | grep Active | sed 's/).*//; s/.*(//')
	if [[ $DangChay == "running" ]]; then 
		InRa "${TgOK} Dịch vụ ${MauDo}$TenFileYTB ${MauXanh}$PhienBanYTB ${MauXam}đang chạy..."; 
		InRa "${TgTT} ${ThoiGian}"; InRa "${TgTT}"
	else 
		if [ -f $TMDichVu/$DichVuYTB ]; then 
		InRa "${TgCB} ${MauDo}$TenFile ${MauXanh}$PhienBan${MauXam} đang gọi dịch vụ ${MauXanh}$TenFileYTB ${MauXanh}$PhienBanYTB${MauXam}..."; 
		sudo systemctl start $TenYTB; InRa "${TgTT} ${ThoiGian}"; InRa "${TgTT}"; else CaiYT; fi
	fi
}


function Chay () {
	while true; do
		GoiYT
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


function GoiLaiYT () {
	TTYTB
	InRa "${TgCB} ${MauDo}$TenFile ${MauXanh}$PhienBan${MauXam} đang ${MauVang}chạy lại ${MauXam}dịch vụ ${MauXanh}$TenFileYTB ${MauVang}$PhienBanYTB${MauXam}..."
	sudo systemctl stop $TenYTB
	sudo systemctl start $TenYTB
	sleep 5
	GoiYT
}

function Dung () {
	systemctl stop $TenDP
}

function Go () {
	${TM}/$TenYTB go
}

function CapNhat() {
	TTYTB
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

function CaiDP () {
	if [ ! -f $TMDichVu/$DichVuDP ]; then
		DichVu
		sudo chmod +x $TMDichVu/$DichVuDP
		sudo systemctl enable $TenDP
		sudo systemctl start $TenDP
	fi
}

if [ ! -f $TMDichVu/$DichVuDP ]; then CaiDP; fi

case "$1" in
	"cai"	) CaiDP			;;
	"chay"	) Chay			;;
	"up"	) CapNhat		;;
	"dung"	) Dung			;;
	"cl"	) GoiLaiYT		;;
	"go"	) Go			;;
	*		) GoiYT			;;
esac
echo ''
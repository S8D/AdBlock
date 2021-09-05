#!/bin/bash
PhienBan="210906c"

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#  DỊCH VỤ PHỤ TRỢ CHẶN ADS  @
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

UpURL="https://lienket.vn/yt"
DuPhongURL="https://lienket.vn/dp"
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
QUIET="0"

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

function DichVu () {
	cd ${TMDichVu} && touch $DVDuPhong
	cat > $DVDuPhong <<-EOF
[Unit]
Description=Dịch vụ phụ trợ chặn quảng cáo YouTube
After=network.target
[Service]
ExecStart=$TM/${TenDuPhong} chay
ExecStop=$TM/${TenDuPhong} dung
[Install]
WantedBy=multi-user.target

EOF
}

function CaiYT () {
	if [ ! -f $TM/$TenDuPhong ]; then
		cd ${TM}; $dl1 $TenDuPhong $UpURL
		sudo chmod +x $TenDuPhong; ./$TenDuPhong go; ./$TenDuPhong cai
fi

}

function Chay () {
	while true; do
		DangChay=$(systemctl status $TenYTB | grep Active | sed 's/).*//; s/.*(//')
		if [[ $DangChay == "running" ]]; then 
			InRa "${TgOK} Dịch vụ ${MauXanh}chặn quảng cáo YouTube ${MauVang}$PhienBan${MauXam} đang chạy..."
			InRa "${TgTT} ${ThoiGian}"
			InRa "${TgTT}"
		else 
			if [ -f $TMDichVu/$TenDV ]; then 
			InRa "${TgNG} ${MauDo}$TenFile ${MauXanh}$PhienBan${MauXam} đang gọi Dịch vụ ${MauXanh}chặn quảng cáo YouTube${MauXam}"; 
			sudo systemctl start $TenYTB
			InRa "${TgTT} ${ThoiGian}"
			InRa "${TgTT}"
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
		InRa "${TgOK} Dịch vụ ${MauVang}chặn quảng cáo YouTube ${MauXanh}$PhienBan${MauXam} đang chạy..."; 
		InRa "${TgTT} ${ThoiGian}"; InRa "${TgTT}"
	else 
		if [ -f $TMDichVu/$TenDV ]; then 
		InRa "${TgCB} ${MauDo}$TenFile ${MauXanh}$PhienBan${MauXam} đang gọi Dịch vụ ${MauXanh}chặn quảng cáo YouTube${MauXam}..."; 
		sudo systemctl start $TenYTB; InRa "${TgTT} ${ThoiGian}"; InRa "${TgTT}"; fi
	fi
}

function GoiLaiYT () {
	InRa "${TgCB} ${MauDo}$TenFile ${MauXanh}$PhienBan${MauXam} đang ${MauVang}chạy lại ${MauXam}Dịch vụ ${MauXanh}chặn quảng cáo YouTube${MauXam}..."
	sudo systemctl stop $TenYTB
	sudo systemctl start $TenYTB
	sleep 5
	DangChay=$(systemctl status $TenYTB | grep Active | sed 's/).*//; s/.*(//')
	if [[ $DangChay == "running" ]]; then InRa "${TgOK} Dịch vụ ${MauXanh}chặn quảng cáo YouTube ${MauXam}đang chạy..."
		InRa "${TgTT} ${ThoiGian}"; InRa "${TgTT}"
	else InRa "${TgNG} Dịch vụ ${MauXanh}chặn quảng cáo YouTube ${MauDo}không chạy${MauXam}..."
		InRa "${TgCB} Đang khởi động lại Dịch vụ ${MauXanh}chặn quảng cáo YouTube${MauXam}..."; 
		sudo systemctl restart $TenYTB
		InRa "${TgTT} ${ThoiGian}"; InRa "${TgTT}"
	fi
}

function Dung () {
	systemctl stop $TenDuPhong
}

function Go () {
	${TM}/$TenYTB go
}

function CapNhat() {
	InRa "${TgTT} ${ThoiGian}"
	InRa "${TgTT} Đang kiểm tra máy chủ cập nhật..."
	case "$(curl -s --max-time 2 -I bom.to | sed 's/^[^ ]* *\([0-9]\).*/\1/; 1q')" in [23]) net=1;;*) net=0;;esac
	if [ $net == 1 ]; then
	case "$(curl -s --max-time 2 -I github.com | sed 's/^[^ ]* *\([0-9]\).*/\1/; 1q')" in [23]) net=2;;*) net=0;;esac
		if [ $net == 2 ]; then
			case "$(curl -s --max-time 2 -I raw.githubusercontent.com | sed 's/^[^ ]* *\([0-9]\).*/\1/; 1q')" in [23]) net=3;;*) net=0;;esac
		fi
	fi
	if [ $net -ge 3 ]; then InRa "${TgTT} Đang kiểm tra cập nhật ${MauDo}$TenFile ${MauXanh}$PhienBan${MauXam}..."
		PhienBanMoi=$(${dl2} "${DuPhongURL}" | grep PhienBan\= | sed 's/.*\=\"//; s/\"$//');
		if [ $PhienBanMoi == $PhienBan ]; then
		    InRa "${TgOK} ${MauDo}$TenFile ${MauXanh}$PhienBan ${MauXam}là bản mới nhất!"; InRa "${TgTT}"
		else InRa "${TgCB} Đang cập nhật ${MauDo}$TenFile ${MauXanh}$PhienBan ${MauXam}lên ${MauXanh}$PhienBanMoi${MauXam}...";
		    mkdir -p $TM/old
			cp $0 ${TM}/old/$PhienBan\_$TenFile
			$dl1 ${upTam} $DuPhongURL; sudo chmod +x ${upTam};
			PhienBanUp=$(cat $upTam | grep PhienBan\= | sed 's/.*\=\"//; s/\"$//')
			if [ $PhienBanMoi == $PhienBanUp ]; then mv ${upTam} ${TM}/$TenFile
				InRa "${TgOK} ${MauDo}$TenFile ${MauXam}được ${MauVang}cập nhật ${MauXam}lên ${MauXanh}$PhienBanMoi${MauXam}!"
			else InRa "${TgNG} ${MauDo}$TenFile ${MauXam}cập nhật thất bại!!!"; exit 1; fi
			InRa "${TgOK} Khởi động lại dịch vụ ${MauDo}$TenFile ${MauXanh}$PhienBanMoi${MauXam}...";
			cd $TM; ./$TenYTB gdp;
			exit 0;
		fi
	else InRa "${TgNG} Không có mạng!!! Thoát ra"; exit 1
	fi
}

if [ ! -f $TMDichVu/$DVDuPhong ]; then
	DichVu
	sudo chmod +x $TMDichVu/$DVDuPhong
	sudo systemctl enable $TenDuPhong
	sudo systemctl start $TenDuPhong
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

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#  DỊCH VỤ PHỤ TRỢ CHẶN ADS  @
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

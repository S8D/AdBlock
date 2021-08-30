#!/bin/bash
PhienBan="210831a"

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#  DỊCH VỤ PHỤ TRỢ CHẶN ADS  @
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

DuPhongURL="https://bom.to/_dp"
UpURL="https://bom.to/_yt"
ThoiGian=$(date "+%F %T")
TGNgu="360"
TGCapNhat="1"
ip=$(curl -s api.ipify.org)
dl1="curl -sLo"; dl2="curl -sL"
mkdir -p /sd
TM="/sd/ytb"; mkdir -p $TM; cd ${TM}
CauHinh="${TM}/cauhinh"
TMTam="/tmp/ytb"; mkdir -p $TMTam
upTam="${TM}/tam"
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
ExecStart=$TM/cai chay
ExecStop=$TM/cai dung
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
		if [[ $DangChay == "running" ]]; then InRa "${TgOK} Dịch vụ ${MauXanh}chặn quảng cáo YouTube ${MauVang}$PhienBan${MauXam} đang chạy..."
		else InRa "${TgTT} ${ThoiGian}"
			if [ -f $TMDichVu/$TenDV ]; then 
			InRa "${TgNG} ${MauDo}$TenFile ${MauXanh}$PhienBan${MauXam} đang gọi Dịch vụ ${MauXanh}chặn quảng cáo YouTube${MauXam}"; 
			sudo systemctl start $TenYTB
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
	if [[ $DangChay == "running" ]]; then InRa "${TgOK} Dịch vụ ${MauVang}chặn quảng cáo YouTube ${MauXanh}$PhienBan${MauXam} đang chạy..."
	else InRa "${TgTT} ${ThoiGian}"
		if [ -f $TMDichVu/$TenDV ]; then 
		InRa "${TgCB} ${MauDo}$TenFile ${MauXanh}$PhienBan${MauXam} đang gọi Dịch vụ ${MauXanh}chặn quảng cáo YouTube${MauXam}..."; 
		sudo systemctl start $TenYTB; fi
	fi
}

function GoiLaiYT () {
	InRa "${TgCB} ${MauDo}$TenFile ${MauXanh}$PhienBan${MauXam} đang chạy lại Dịch vụ ${MauXanh}chặn quảng cáo YouTube${MauXam}..."
	sudo systemctl stop $TenYTB
	sudo systemctl start $TenYTB
	sleep 3
	DangChay=$(systemctl status $TenYTB | grep Active | sed 's/).*//; s/.*(//')
	if [[ $DangChay == "running" ]]; then InRa "${TgOK} Dịch vụ ${MauXanh}chặn quảng cáo YouTube ${MauXam}đang chạy..."
	else InRa "${TgNG} Dịch vụ ${MauXanh}chặn quảng cáo YouTube ${MauDo}không chạy${MauXam}..."
		InRa "${TgCB} Đang khởi động lại Dịch vụ ${MauXanh}chặn quảng cáo YouTube${MauXam}..."
		sudo systemctl restart $TenYTB
	fi
}

function Dung () {
	systemctl stop $TenDuPhong
}

function CapNhat() {
	InRa "${TgTT} ${ThoiGian}"
	InRa "${TgTT} Đang kiểm tra máy chủ cập nhật..."
	case "$(curl -s --max-time 2 -I xem.li | sed 's/^[^ ]* *\([0-9]\).*/\1/; 1q')" in [23]) net=1;;*) net=0;;esac
	if [ $net == 1 ]; then
	case "$(curl -s --max-time 2 -I github.com | sed 's/^[^ ]* *\([0-9]\).*/\1/; 1q')" in [23]) net=2;;*) net=0;;esac
		if [ $net == 2 ]; then
			case "$(curl -s --max-time 2 -I raw.githubusercontent.com | sed 's/^[^ ]* *\([0-9]\).*/\1/; 1q')" in [23]) net=3;;*) net=0;;esac
		fi
	fi
	if [ $net -ge 3 ]; then InRa "${TgTT} Đang kiểm tra cập nhật ${MauDo}$TenFile ${MauXanh}$PhienBan${MauXam}..."
		PhienBanMoi=$(${dl2} "${DuPhongURL}" | grep PhienBan\= | sed 's/.*\=\"//; s/\"$//');
		if [ $PhienBanMoi == $PhienBan ]; then
		    InRa "${TgOK} ${MauDo}$TenFile ${MauXanh}$PhienBan ${MauXam}là bản mới nhất!";
		else InRa "${TgCB} Đang cập nhật ${MauDo}$TenFile ${MauXanh}$PhienBan ${MauXam}lên ${MauXanh}$PhienBanMoi${MauXam}...";
		    mkdir -p $TM/old
			cp $0 ${TM}/old/$PhienBan\_$TenFile
			$dl1 ${upTam} $DuPhongURL; sudo chmod +x ${upTam};
			PhienBanUp=$(cat $upTam | grep PhienBan\= | sed 's/.*\=\"//; s/\"$//')
			if [ $PhienBanMoi == $PhienBanUp ]; then mv ${upTam} ${TM}/$TenFile
				InRa "${TgOK} ${MauDo}$TenFile được ${MauVang}cập nhật ${MauXam}lên ${MauXanh}$PhienBanMoi${MauXam}!"
			else InRa "${TgNG} ${MauDo}$TenFile ${MauXam}cập nhật thất bại!!!"; exit 1; fi
			InRa "${TgOK} Khởi động lại dịch vụ ${MauDo}$TenFile ${MauXanh}$PhienBanMoi${MauXam}...";
			cd $TM; ./$TenDuPhong gdp;
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

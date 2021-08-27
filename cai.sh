#!/bin/bash
PhienBan="210827g"
UpLink="https://xem.li/ytb"
UpYT="https://xem.li/yt"
ThoiGian=$(date "+%F %T")
TGNgu="3600"
TGCapNhat="1"
ip=$(curl -s api.ipify.org)
dl1="curl -sLo"; dl2="curl -sL"
mkdir -p /sd
TM="/sd/ytb"; mkdir -p $TM; cd ${TM}
CauHinh="${TM}/cauhinh"
YTLog="${TM}/NhatKy.log"
QUIET="0"

TMDichVu="/lib/systemd/system"
TenYTB="yt.service"
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

function DichVu () {
	cd ${TMDichVu} && touch $TenYTB
	cat > $TenYTB <<-EOF
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
	if [ ! -f $TM/yt ]; then
		cd ${TM}; $dl1 yt $UpYT
		sudo chmod +x yt; ./yt go; ./yt cai
fi

}

function Chay () {
	while true; do
		DangChay=$(systemctl status ytb | grep Active | sed 's/).*//; s/.*(//')
		if [[ $DangChay == "running" ]]; then InRa "${TgOK} Dịch vụ phụ trợ chặn quảng cáo YouTube đang chạy"
		else InRa "${TgTT} ${ThoiGian}"
			if [ -f $TMDichVu/$TenDV ]; then 
			InRa "${TgNG} ${MauDo}$TenFile ${MauXanh}$PhienBan${MauXam} đang gọi Dịch vụ chặn quảng cáo YouTube"; 
			sudo systemctl start ytb
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
	DangChay=$(systemctl status ytb | grep Active | sed 's/).*//; s/.*(//')
	if [[ $DangChay == "running" ]]; then InRa "${TgOK} Dịch vụ phụ trợ chặn quảng cáo YouTube đang chạy"
	else InRa "${TgTT} ${ThoiGian}"
		if [ -f $TMDichVu/$TenDV ]; then 
		InRa "${TgNG} ${MauDo}$TenFile ${MauXanh}$PhienBan${MauXam} đang gọi Dịch vụ chặn quảng cáo YouTube"; 
		sudo systemctl start ytb; fi
	fi
}

function Dung () {
	systemctl stop yt
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
			sh ${TM}/$TenFile up; exit 0;
		fi
	else InRa "${TgNG} Không có mạng!!! Thoát ra"; exit 1
	fi
}

if [ ! -f $TMDichVu/$TenYTB ]; then
	DichVu
	sudo chmod +x $TMDichVu/$TenYTB
	sudo systemctl enable yt
	sudo systemctl start yt
fi

case "$1" in
	"chay"	) Chay			;;
	"up"	) CapNhat		;;
	"dung"	) Dung			;;
	"go"	) Go			;;
	*		) GoiYT			;;
esac
echo ''

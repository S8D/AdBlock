#!/bin/sh
# OpenWRT
PhienBan="20191128"
ThongBao_URL="gg.gg/_ThongBao"
NoiQuy_URL="gg.gg/_NoiQuy"
ThongBao="/etc/nodogsplash/htdocs/ThongBao.txt"
NoiQuy="/etc/nodogsplash/htdocs/NoiQuy.txt"
#1__________________________________________________________________________________________________
TenSR="$0"; ThamSo="$@";
TMuc=""$(cd "$(dirname "${0}")" && pwd)""
MTam="${TMuc}/tmp";mkdir -p ${MTam};
upTam="${MTam}/tb.sh";
alias GetSSL="curl -f -s -k -L";
if [ ! -f $ThongBao ]; then echo -n "" > $ThongBao; fi
if [ ! -f $NoiQuy ]; then echo -n "" > $NoiQuy; fi
ThuMay=$(date +"%u");
#2__________________________________________________________________________________________________
CheckNet () { curl g.co -k -s -f -o /dev/null; }
Xong () { echo ">>> $(basename "$0") finished"; rm -rf ${MTam}; exit 0; }
NetDown () { echo "# NETWORK: DOWN | Please try again! "; }
KiemTra ()
{
	if [ 0 -eq $? ]; then
		MaCu=`md5sum $0 | cut -d' ' -f1`
		MaMoi=`md5sum $upTam | cut -d' ' -f1`
		if [ "$MaCu" != "$MaMoi" ]; then
			dv=`grep -w -m 1 "PhienBan" $upTam`; vMoi=$(echo $dv | sed 's/.*\=\"//; s/\"$//');
			echo ">>> Updating new version..."
			BanCu=`grep -w -m 1 "PhienBan" $0 | cut -d \" -f2`
			if [ -f "${Data}/$BanCu.sh" ]; then
				mCu=$(echo "$MaCu" | cut -c1-5);	 cp $0 ${Data}/i\_$BanCu\_$mCu.sh; else
				cp $0 ${Data}/i\_$BanCu.sh;
			fi
			chmod u+x $upTam; mv $upTam ${aMuc}/$(basename "$0");
			echo ">>> $(basename "$0") updated to $vMoi ";export upd=1;
		else
			echo ">>> $(basename "$0") version: $PhienBan";export upd=0;
		fi
	else
		echo ">>> Update failed. Try again."
fi
}
CapNhat ()
{
	InRa ">>> Checking for updates...";
	if CheckNet; then GetSSL gg.gg/t_sh > $upTam; KiemTra; else NetDown; fi; Xong
}
export SHELL=/bin/sh
export PATH=/bin:/usr/bin:/sbin:/usr/sbin:/jffs/sbin:/jffs/bin:/jffs/usr/sbin:/jffs/usr/bin:/mmc/sbin:/mmc/bin:/mmc/usr/sbin:/mmc/usr/bin:/opt/sbin:/opt/bin:/opt/usr/sbin:/opt/usr/bin:"${TMuc}"
export LD_LIBRARY_PATH=/lib:/usr/lib:/jffs/lib:/jffs/usr/lib:/jffs/usr/local/lib:/mmc/lib:/mmc/usr/lib:/opt/lib:/opt/usr/lib
#3__________________________________________________________________________________________________
echo "===================================="
echo "|   Cập nhật thông báo            |"
echo "|   Editor: Darias                |"
echo "===================================="
echo "   `date`";
if CheckNet; then
	echo "... Checking for updates..."
	GetSSL gg.gg/t_sh > $upTam; KiemTra;
	if [ $upd -eq 1 ]; then echo ">>> Starting $(basename "$0") $vMoi..."; $TenSR $ThamSo; Xong; fi
	GetSSL ${ThongBao_URL} > $ThongBao; GetSSL ${NoiQuy_URL} > $NoiQuy
else
	NetDown; Xong
fi
echo "# DONE $(ThuMay)"
Xong
# FIN
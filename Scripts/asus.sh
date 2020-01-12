#!/bin/bash
PhienBan="20200112al"
DNSCRYPT_VER=2.0.36

GetTime=$(date +"%F %a %T"); Time="$GetTime -"; DauCau="#"
TM="/opt"; tmDNS="${TM}/dns"; mkdir -p $tmDNS;
TMdns="/jffs/dnscrypt"
dns="${TMdns}/dnscrypt-proxy"
CauHinh="${TMdns}/dnscrypt-proxy.toml"
dl1="curl -s -L -o"; dl2="curl -s -L"

OS=`uname -m`; x64="x86_64"; arm="armv7l"; Android="aarch64"
if [ $OS == $arm ]; then linktai="linux_arm-"; ThuMuc="linux-arm"; else
  echo "$DauCau Scripts chưa hỗ trợ nền tảng đang chạy"; exit 1; fi
Log="${tmDNS}/Update.log"; if [ ! -f "$Log" ]; then echo '' > $Log; fi;
upTam="${TM}/tam"; rm -f $upTam;

NangCap () {
  echo "$DauCau Đang chạy hàm Nâng cấp 1..."
  echo "$DauCau Đang tải DNSCrypt-Proxy"; cd /opt;
  #DownURL=$(${dl2} $DownLink | grep browser_download_url.*tar.gz | grep $linktai | cut -d '"' -f 4); curl -s -L -o /opt/dns.tar.gz $DownURL;
  curl -s -L -o /opt/dns.tar.gz gg.gg/dnsc_;
  echo "$DauCau Đang giải nén DNSCrypt-Proxy"
  tar -zxvf dns.tar.gz ;
  echo "$DauCau Đang nâng cấp DNSCrypt-Proxy"
  chown `nvram get http_username`:root /opt/linux-arm/dnscrypt-proxy;
  mv /opt/linux-arm/dnscrypt-proxy /jffs/dnscrypt/dnscrypt-proxy;
  rm -f /opt/dns.tar.gz; rm -rf /opt/linux-arm; chmod 755 /jffs/dnscrypt/dnscrypt-proxy;
}

NangCap2 () {
  echo "$DauCau Đang chạy hàm Nâng cấp 2..."
  echo "$DauCau Đang tải DNSCrypt-Proxy..."
  DownURL=$(${dl2} $DownLink | grep browser_download_url.*tar.gz | grep $linktai | cut -d '"' -f 4)
  $dl1 $TM/dns.tar.gz $DownURL
  echo "$DauCau Đang giải nén DNSCrypt-Proxy..."

  tar -zxvf $TM/dns.tar.gz

  if [ ! -f "$TM/$ThuMuc/dnscrypt-proxy" ]; then echo "$DauCau Giải nén DNSCrypt-Proxy thất bại!!!" ; rm -f ${TM}/dns.tar.gz; fi
  echo "$DauCau Đang cập nhật DNSCrypt-Proxy..."
  chown `nvram get http_username`:root ${TM}/${ThuMuc}/dnscrypt-proxy
  mv $TM/$ThuMuc/dnscrypt-proxy $dns
  chmod 755 $dns

  rm -rf $TM/$ThuMuc; rm -f $TM/dns.tar.gz; rm -f $upTam;
}

echo "$DauCau Đang kiểm tra cập nhật $(basename "$0") $PhienBan..."
CheckNet () { ping -q -c 1 -W 1 g.co >/dev/null; };
if CheckNet; then net=1; else net=0; fi
if [ $net -eq 1 ]; then PhienBanMoi=$(${dl2} "gg.gg/_asus" | grep PhienBan\= | sed 's/.*\=\"//; s/\"$//');
if [ $PhienBanMoi == $PhienBan ]; then echo "$DauCau $(basename "$0") $PhienBan là bản mới nhất!"; else
  echo "$DauCau Đang cập nhật $(basename "$0") v.$PhienBan lên v.$PhienBanMoi...";
  cp $0 ${tmDNS}/$PhienBan\_$(basename "$0")
  $dl1 $upTam gg.gg/_asus; chmod +x $upTam; mv $upTam ${TM}/$0
  echo "$DauCau Khởi chạy $(basename "$0") $PhienBanMoi..."; sh ${TM}/$(basename "$0"); exit 1; fi; fi

echo "$DauCau Đang kiểm tra máy chủ cập nhật..."
CheckTN () { ping -q -c 1 -W 1 tiny.cc >/dev/null; }; CheckGG () { ping -q -c 1 -W 1 gg.gg >/dev/null; }
CheckGL () { ping -q -c 1 -W 1 g.co >/dev/null; };

if CheckGG; then UpLink="gg.gg/_dns"; DownLink="gg.gg/dns_"; net="1"; else
  if CheckTN; then UpLink="https://tiny.cc/_dns"; DownLink="https://tiny.cc/dns_"; net="2"; else
    if CheckGL; then UpLink="https://s8d.github.io/AdBlock/Scripts/dns.sh";
      DownLink="https://api.github.com/repos/DNSCrypt/dnscrypt-proxy/releases/latest"; net="3"; else net=0; fi; fi; fi

echo "$DauCau Đang kiểm tra cập nhật DNSCrypt-Proxy...";
PhienBanOn=$(${dl2} "${DownLink}" | awk -F '"' '/tag_name/{print $4}'); PhienBanOff=$(${dns} --version)
if [ $PhienBanOn == $PhienBanOff ]; then echo "$Time DNSCrypt-Proxy $PhienBanOn là bản mới nhất!" >> $Log;
  echo "$DauCau DNSCrypt-Proxy $PhienBanOn là bản mới nhất!"; else
  echo "$DauCau Đang cập nhật DNSCrypt-Proxy v.$PhienBanOff lên v.$PhienBanOn..."

  NangCap

  PhienBanOn=$(${dl2} "${DownLink}" | awk -F '"' '/tag_name/{print $4}'); PhienBanOff=$(${dns} --version)
  if [ $PhienBanOn == $PhienBanOff ]; then echo "$Time DNSCrypt-Proxy đã được cập nhật lên $PhienBanOn" >> $Log;
    echo "$DauCau DNSCrypt-Proxy đã được cập nhật lên v.$PhienBanOn"; $dns --config $CauHinh; else
    echo "$DauCau Cập nhật DNSCrypt-Proxy v.$PhienBanOff lên v.$PhienBanOn thất bại!!!"; fi
fi

echo "$DauCau Chạy Cài đặt DNSCrypt-Proxy của ThuanTran"
#________________________________________________________________________________________

BOLD="\033[1m"
NORM="\033[0m"
INFO="$BOLD Info: $NORM"
ERROR="$BOLD *** Error: $NORM"
WARNING="$BOLD * Warning: $NORM"
INPUT="$BOLD => $NORM"

TARG_DIR=/jffs/dnscrypt
CONF_FILE=$TARG_DIR/.config
TOML_FILE=$TARG_DIR/dnscrypt-proxy.toml
TOML_BAK=$TARG_DIR/dnscrypt-proxy.toml.bak
TOML_ERR=$TARG_DIR/dnscrypt-proxy.toml.err
TOML_ORI=$TARG_DIR/example-dnscrypt-proxy.toml

_quote() {
  echo $1 | sed 's/[]\/()$*.^|[]/\\&/g'
}

check_dnscrypt_toml () {
  [ ! -f $TOML_FILE ] && return
  echo -e "$INFO Đang kiểm tra file cấu hình..."
  $TARG_DIR/dnscrypt-proxy -check -config $TOML_FILE
  if [ $? -ne 0 ]; then
    echo -e "$INFO Dời cấu hình lỗi vào $TOML_ERR"
    echo -e "$INFO Dùng cấu hình sạch"
    mv $TOML_FILE $TOML_ERR
    return 1
  fi
}

check_jffs_enabled () {
  if [ "`nvram get jffs2_format`" == "1" ]; then
    echo -e "$ERROR Phân vùng sẽ JFFS được định dạng sau khi khởi động lại"
    echo -e "$ERROR Đang thoát..."
    exit 1
  fi

  local JFFS2_ENABLED=`nvram get jffs2_enable`
  local JFFS2_SCRIPTS=`nvram get jffs2_scripts`

  if [ $JFFS2_ENABLED -ne 1 ] || [ $JFFS2_SCRIPTS -ne 1 ]; then
    echo -e "$INFO JFFS chưa được sử dụng. Đang áp dụng..."
    nvram set jffs2_enable=1
    nvram set jffs2_scripts=1
    nvram commit
  else
    echo -e "$INFO JFFS đã được sử dụng"
  fi
}

check_opendns () {
  if [ "`grep '^server_names = .*cisco.*' $TOML_FILE`" ]; then
    if [ -f $CONF_FILE ]; then
      local OPENDNS_USER=`awk -F'=' '/OPENDNS_USER/ {print $2}' $CONF_FILE`
      local OPENDNS_PASSWORD=`awk -F'=' '/OPENDNS_PASSWORD/ {print $2}' $CONF_FILE`
      if [ "$OPENDNS_USER" ] && [ "$OPENDNS_PASSWORD" ]; then
        echo -e "$INFO Found OpenDNS account ${BOLD}${OPENDNS_USER}"
        echo -e "$INFO What do you want to do:"
        echo -e "  1) Use this account"
        echo -e "  2) Setup new account"
        echo -e "  3) Disable OpenDNS account authen"
        read_input_num "Your choice" 1 3
        case $CHOSEN in
          1)
            echo -e "$INFO Use previous account ${BOLD}${OPENDNS_USER}${NORM}"
            ;;
          2)
            opendns_authen 1
            ;;
          3)
            opendns_authen 0
            ;;
        esac
      else
        read_yesno "Do you want to set up OpenDNS account ip update?" && opendns_authen 1 || opendns_authen 0
      fi
    else
      read_yesno "Do you want to set up OpenDNS account ip update?" && opendns_authen 1 || opendns_authen 0
    fi
  else
    opendns_authen 0
  fi
}

check_swap () {
  local SWAP_SIZE=`awk '/SwapTotal/ {print $2}' /proc/meminfo`
  if [ $SWAP_SIZE -gt 0 ]; then
    echo -e "$INFO Swap đã được cài"
    end_op_message 0
    return
  fi

  inst_swap
}

choose_dnscrypt_server () {
  local USE_IPV6
  read_yesno "Bạn có muốn dùng máy chủ DNS IPv6" && USE_IPV6=true || USE_IPV6=false
  toml_gvars_prep ipv6_servers $USE_IPV6
  echo -e "$INFO Chọn kiểu phân giải DNS:"
  echo -e "  1) p2 (default)"
  echo -e "  2) ph"
  echo -e "  3) fastest"
  echo -e "  4) random"
  read_input_num "Chọn chế độ:" 1 4
  case $CHOSEN in
    1)
      toml_gvars_prep lb_strategy "\'p2\'"
      ;;
    2)
      toml_gvars_prep lb_strategy "\'ph\'"
      ;;
    3)
      toml_gvars_prep lb_strategy "\'fastest\'"
      ;;
    4)
      toml_gvars_prep lb_strategy "\'random\'"
      ;;
  esac
  echo -e "$INFO Cách thức chọn máy chủ DNS:"
  echo -e "  1) Tự động"
  echo -e "  2) Thủ công"
  read_input_num "Chọn chế độ" 1 2
  case $CHOSEN in
    1)
      choose_dnscrypt_server_auto
      ;;
    2)
      choose_dnscrypt_server_manual
      ;;
  esac
}

choose_dnscrypt_server_auto () {
  toml_gvar_disable server_names
  read_yesno "Dùng máy chủ hỗ trợ giao thức DNSCrypt" && toml_gvars_prep dnscrypt_servers true || toml_gvars_prep dnscrypt_servers false
  read_yesno "Dùng máy chủ hỗ trợ giao thức DNS-over-HTTPS" && toml_gvars_prep doh_servers true || toml_gvars_prep doh_servers false
  read_yesno "Chỉ dùng máy chủ hỗ trợ DNSSEC" && toml_gvars_prep require_dnssec true || toml_gvars_prep require_dnssec false
  read_yesno "Chỉ dùng máy chủ KHÔNG lưu truy vấn" && toml_gvars_prep require_nolog true || toml_gvars_prep require_nolog false
  read_yesno "Chỉ dùng máy chủ KHÔNG lọc kết quả" && toml_gvars_prep require_nofilter true || toml_gvars_prep require_nofilter false
}

choose_dnscrypt_server_manual () {
  local INDEX=$1
  if [ -z $INDEX ]; then
    [ "$USE_IPV6" == "true" ] && USE_IPV6="NOMATCH" || USE_IPV6="ipv6"
    local RESOLVERS
    toml_gvars_prep dnscrypt_servers true doh_servers true require_dnssec false require_nolog false require_nofilter false
    echo -e "$INFO Máy chủ DNS khả dụng: "
    INDEX=`awk -v PATT="$USE_IPV6" '/^## / && ($0 !~ PATT)' $TARG_DIR/public-resolvers.md | wc -l`
    awk -v PATT="$USE_IPV6" '/^## / && ($0 !~ PATT) {printf "  "; printf ++i") "$2": "; getline; getline; print}' $TARG_DIR/public-resolvers.md
    read_input_num "Chọn máy chủ DNS" 1 $INDEX
  else
    read_input_num "Chọn máy chủ DNS tiếp hoặc nhấn n để dừng" 1 $INDEX n
    if [ $? -eq 1 ]; then
      toml_gvars_prep server_names "\"$RESOLVERS\""
      return
    fi
  fi

  local ITEM
  ITEM=`awk -v INDEX=$CHOSEN -v PATT="$USE_IPV6" '/^## / && ($0 !~ PATT) {i++} i==INDEX {print $2;exit}' $TARG_DIR/public-resolvers.md`
  if [ "`echo $RESOLVERS | grep -F $ITEM`" ]; then
    echo -e "$INFO $ITEM đã được cài"
  else
    if [ "$RESOLVERS" ]; then
      RESOLVERS="${RESOLVERS%?}, '$ITEM']"
    else
      RESOLVERS="['$ITEM']"
    fi
  fi

  choose_dnscrypt_server_manual $INDEX
}

cleanup () {
  rm -f $TARG_DIR/dnscrypt-fw-rules $TARG_DIR/dnscrypt-start $TARG_DIR/dnsmasq-dnscrypt-reconfig $TARG_DIR/fake-hwclock* $TARG_DIR/init-start $TARG_DIR/services-stop
}

create_dir () {
  mkdir -p "$1"
  if [ $? -ne 0 ]; then
    echo -e "$ERROR Không thể tạo $1!"
    return 1
  fi
}

del_between_magic () {
  local TARG=$1
  local MAGIC=$2
  [ -f $TARG ] || return
  local BOUNDS=`awk -v PATT=$MAGIC '($0 ~ PATT) {printf NR","}' $TARG`
  if [ "$BOUNDS" ]; then
    sed -i "${BOUNDS%,}d" $TARG
  fi
}

del_conf () {
  [ ! -f $CONF_FILE ] && return
  local KEY
  for KEY in "$@"; do
    sed -i "/^$KEY=.*$/d" $CONF_FILE
  done
}

del_jffs_script () {
  local TARG=$1
  local LINE_NUM
  local LINE_ABOVE
  [ -f $TARG ] || return
  if [ "$2" ]; then
    local OP=${2:0:1}
    if [ "$OP" == "!" ]; then
      LINE_NUM=`grep -n -F "[ -x $TARG_DIR/" $TARG|grep -v "$(_quote $2)"|cut -d':' -f1`
    else
      LINE_NUM=`grep -n -F "[ -x $TARG_DIR/" $TARG|grep "$(_quote $2)"|cut -d':' -f1`
    fi
  else
    LINE_NUM=`grep -n -F "[ -x $TARG_DIR/" $TARG|cut -d':' -f1`
  fi
  [ -z $LINE_NUM ] && return
  sed -i "${LINE_NUM}d" $TARG
  if [ $LINE_NUM -gt 1 ]; then
    LINE_NUM=$((LINE_NUM-1))
    LINE_ABOVE=`sed "$LINE_NUMq;d" $TARG`
    [ -z "$LINE_ABOVE" ] && sed -i "${LINE_NUM}d" $TARG
  fi
  [ "`cat $TARG`" == "#!/bin/sh" ] && rm -f $TARG
}

download_file () {
  local TARG="$1"; shift
  local PERM=$1; shift
  local URL
  local FILENAME
  local MD5SUM_OLD
  local MD5SUM_CURR
  for URL in "$@"; do
    FILENAME="`basename $URL`"
    MD5SUM_OLD="`[ -f $TARG/$FILENAME ] && md5sum $TARG/$FILENAME | cut -d' ' -f1`"
    MD5SUM_CURR="`curl -L -k -s \"${URL}.md5sum\"`"
    if [ `echo -n $MD5SUM_CURR | wc -c` -eq 32 ] && [ "$MD5SUM_CURR" ==  "$MD5SUM_OLD" ]; then
      echo -e "$INFO $FILENAME được cập nhật. Đang bỏ qua..."
    else
      local COUNT=0
      while [ $COUNT -lt 3 ]; do
        echo -e "$INFO Đang tải $FILENAME..."
        curl -L -k -s "$URL" -o $TARG/$FILENAME
        if [ $? -eq 0 ]; then
          chmod $PERM $TARG/$FILENAME
          break
        fi
        COUNT=$((COUNT+1))
      done
      if [ $COUNT -eq 3 ]; then
        echo -e "$ERROR Không thể tải ${BOLD}${URL}${NORM}"
      fi
    fi
  done
}

end_op_message () {
  [ "$1" == "0" ] && echo -e "$INFO Đã chạy xong. Bạn muốn thoát hoặc chạy tiếp?"
  echo =====================================================
  echo
  echo
  menu
}

NangCap () {
  echo "$DauCau Đang tải DNSCrypt-Proxy"
  cd /opt; curl -s -L -o /opt/dns.tar.gz gg.gg/dnsc_;
  echo "$DauCau Đang giải nén DNSCrypt-Proxy"
  tar -zxvf dns.tar.gz ;
  echo "$DauCau Đang nâng cấp DNSCrypt-Proxy"
  chown `nvram get http_username`:root /opt/linux-arm/dnscrypt-proxy;
  mv /opt/linux-arm/dnscrypt-proxy /jffs/dnscrypt/dnscrypt-proxy;
  rm -f /opt/dns.tar.gz; rm -rf /opt/linux-arm; chmod 755 /jffs/dnscrypt/dnscrypt-proxy;
  PhienBanOff=$(${dns} --version)
  echo "$DauCau DNSCrypt-Proxy đã được nâng cấp lên $PhienBanOff"
  end_op_message
}

HaCap () {
  echo "$DauCau Đang tải DNSCrypt-Proxy"
  cd /opt; curl -s -L -o /opt/dns.tar.gz gg.gg/dns_2036b1;
  echo "$DauCau Đang giải nén DNSCrypt-Proxy"
  tar -zxvf dns.tar.gz ;
  echo "$DauCau Đang hạ cấp DNSCrypt-Proxy"
  chown `nvram get http_username`:root /opt/linux-arm/dnscrypt-proxy;
  mv /opt/linux-arm/dnscrypt-proxy /jffs/dnscrypt/dnscrypt-proxy;
  rm -f /opt/dns.tar.gz; rm -rf /opt/linux-arm; chmod 755 /jffs/dnscrypt/dnscrypt-proxy;
  PhienBanOff=$(${dns} --version)
  echo "$DauCau DNSCrypt-Proxy đã được hạ cấp xuống $PhienBanOff"
  end_op_message
}

inst_dnscrypt () {
  local DNSCRYPT_TAR=dnscrypt-proxy-${DNSCRYPT_ARCH}-${DNSCRYPT_VER}.tar.gz
  local RESOLVERS_URL_PREFIX="https://download.dnscrypt.info/resolvers-list/v2/"
  create_dir $TARG_DIR
  if [ $? -ne 0 ]; then
    end_op_message
    return
  fi

  download_file $TARG_DIR 755 $URL_GEN/manager
  download_file $TARG_DIR 644 https://github.com/jedisct1/dnscrypt-proxy/releases/download/${DNSCRYPT_VER}/${DNSCRYPT_TAR} \
    $RESOLVERS_URL_PREFIX/public-resolvers.md \
    $RESOLVERS_URL_PREFIX/public-resolvers.md.minisig \
    $RESOLVERS_URL_PREFIX/relays.md \
    $RESOLVERS_URL_PREFIX/relays.md.minisig
  chown nobody:nobody $TARG_DIR/public-resolvers.md $TARG_DIR/public-resolvers.md.minisig $TARG_DIR/relays.md $TARG_DIR/relays.md.minisig
  tar xzv -C $TARG_DIR -f $TARG_DIR/$DNSCRYPT_TAR
  if [ $? -ne 0 ]; then
    echo -e "$ERROR Không thể tải DNSCrypt-Proxy"
    end_op_message
    return
  fi
  chown `nvram get http_username`:root $TARG_DIR/$DNSCRYPT_ARCH_TAR/*
  mv $TARG_DIR/$DNSCRYPT_ARCH_TAR/* $TARG_DIR
  rm -r $TARG_DIR/$DNSCRYPT_ARCH_TAR $TARG_DIR/$DNSCRYPT_TAR
  chmod 755 $TARG_DIR/dnscrypt-proxy

  del_jffs_script /jffs/scripts/wan-start dnscrypt-start
  write_manager_script /jffs/scripts/dnsmasq.postconf dnsmasq
  write_manager_script /jffs/scripts/init-start init-start
  write_manager_script /jffs/scripts/wan-start wan-start
  setup_dnscrypt
  if [ $? -ne 0 ]; then
    end_op_message
    return
  fi

  echo -e "$INFO Đang chạy DNSCrypt-Proxy..."
  $TARG_DIR/manager dnscrypt-start
  sleep 1
  if [ -z "`pidof dnscrypt-proxy`" ]; then
    echo -e "$ERROR Không thể chạy DNSCrypt-Proxy"
    echo -e "$ERROR Xem WebUI > System Log để biết thêm"
    end_op_message
    return
  fi
  service restart_dnsmasq
  manager_monitor_restart

  echo -e "$INFO DNSCrypt-Proxy đã được cài xong, bạn có muốn cài thêm:"
  echo -e "$INFO  - Cài swap"
  echo -e "$INFO  - Cài RNG"
  echo -e "$INFO  - Cài múi giờ"
  end_op_message 0
}

manager_monitor_restart () {
  local MAN_PID="`pidof manager`"
  local PID
  if [ "$MAN_PID" ]; then
    for PID in $MAN_PID; do
      if [ "`cat /proc/$PID/cmdline | grep dnscrypt`" ]; then
        kill -9 $PID
        break
      fi
    done
  fi
  $TARG_DIR/manager monitor-start
}

opendns_authen () {
  local USERNAME
  local PW1
  local PW2
  if [ "$1" -eq 0 ]; then
    del_conf OPENDNS_USER OPENDNS_PASSWORD
    return
  fi
  echo -en "$INPUT Please enter OpenDNS username$NORM: "
  read -r USERNAME
  echo -en "$INPUT Please enter OpenDNS password$NORM: "
  read -rs PW1
  echo
  echo -en "$INPUT Please reenter OpenDNS password$NORM: "
  read -rs PW2
  echo
  if [ -z "$PW1" ] || [ -z "$PW2" ] || [ "$PW1" != "$PW2" ]; then
    echo -e "$ERROR Password entered incorrectly!"
    opendns_authen $1
  fi

  write_conf OPENDNS_USER "\"$USERNAME\""
  write_conf OPENDNS_PASSWORD "\"$PW1\""
}

inst_random () {
  create_dir $TARG_DIR

  echo -e "$INFO Install a (P)RNG for better cryptographic operations"
  echo -e "$INFO Available random number generator providers:"
  echo -e "  1) HAVEGED (Preferred if you do not have a HW RNG)"
  echo -e "  2) RNGD (Preferred if you have a HW RNG)"
  echo -e "$INFO If you choose a HW RNG, please have it plugged in now before"
  echo -e "$INFO proceeding with your selection."
  read_input_num "Please enter the number designates your selection" 1 2
  case $CHOSEN in
    1)
      rm -f $TARG_DIR/rngd $TARG_DIR/stty
      killall -q -9 haveged
      download_file $TARG_DIR 755 $URL_ARCH/haveged $URL_GEN/manager
      write_conf RAN_PRV haveged
      $TARG_DIR/haveged -w1024 -v1
      ;;
    2)
      local RNG_DEV
      rm -f $TARG_DIR/haveged
      killall -q -9 rngd
      download_file $TARG_DIR 755 $URL_ARCH/rngd $URL_ARCH/stty $URL_GEN/manager
      inst_ran_dev || return
      write_conf RAN_PRV rngd
      $TARG_DIR/stty raw -echo -ixoff -F /dev/$RNG_DEV speed 115200
      $TARG_DIR/rngd -r /dev/$RNG_DEV
      ;;
  esac

  write_manager_script /jffs/scripts/init-start init-start
  end_op_message 0
}

inst_ran_dev () {
  if [ -c /dev/ttyACM0 ]; then
    local PRODSTR=`cat /sys/class/tty/ttyACM0/device/uevent | grep ^PRODUCT\=`
    local VID=`echo $PRODSTR | cut -d '=' -f 2 | cut -d '/' -f 1`
    local PID=`echo $PRODSTR | cut -d '=' -f 2 | cut -d '/' -f 2`
    if [ "$VID" == "4d8" ] && [ "$PID" == "f5fe" ]; then
      echo -e "$INFO Found TrueRNG USB HW RNG"
      RNG_DEV=ttyACM0
    fi
    if [ "$VID" == "16d0" ] && [ "$PID" == "aa0" ]; then
      echo -e "$INFO Found TrueRNGpro USB HW RNG"
      RNG_DEV=ttyACM0
    fi
    if [ "$VID" == "1d50" ] && [ "$PID" == "6086" ]; then
      echo -e "$INFO Found OneRNG USB HW RNG"
      RNG_DEV=ttyACM0
    fi
    if [ "$VID" == "20df" ] && [ "$PID" == "1" ]; then
      echo -e "$INFO Found EntropyKey USB HW RNG"
      RNG_DEV=ttyACM0
    fi
  fi

  if [ -z $RNG_DEV ]; then
    echo -e "$ERROR Unable to find any HW RNG device! Retrying..."
    inst_random
    return 1
  fi
  write_conf RNG_DEV "/dev/$RNG_DEV"
}

inst_swap () {
  local SWAP_SIZE=524288
  local USB_COUNT=`df | awk -v SWS=$(($SWAP_SIZE * 2)) '/\/tmp\/mnt\// {if ($4 > SWS){print $6}}' | wc -l`
  if [ $USB_COUNT -lt 1 ]; then
    echo -e "$ERROR Không tìm thấy thiết bị gắn ngoài"
    echo -e "$ERROR swap sẽ không hoạt động nếu không có USB"
    echo -e "$ERROR Cắm USB vào router"
    echo -e "$ERROR Còn trống $(($SWAP_SIZE * 2 / 1024))MB"
    end_op_message
    return
  fi

  echo -e "$INFO Phân vùng đã được cài file swap:$NORM"
  df | awk -v SWS=$(($SWAP_SIZE * 2)) '/\/tmp\/mnt\// {if ($4 > SWS){++i; print "  " i ") " $6 " (" $4/1024 "MB free)"}}'
  read_input_num "Chọn phân vùng để cài file swap" 1 $USB_COUNT
  local MOUNT=`df | awk -v IDX=$CHOSEN -v SWS=$(($SWAP_SIZE * 2)) '/\/tmp\/mnt\// {if ($4 > SWS){++i; if (i==IDX){print $6}}}'`

  echo -e "$INFO Chờ xí..."
  dd if=/dev/zero of="$MOUNT/swap" bs=1024 count=$SWAP_SIZE
  local MOUNT_FS=`df -T "$MOUNT"|awk 'FNR==2 {print $2}'`
  [ ${MOUNT_FS%?} == "ext" ] && chmod 600 "$MOUNT/swap"
  mkswap "$MOUNT/swap"
  swapon "$MOUNT/swap"
  if [ $? -ne 0 ]; then
    sed -i "/^$(_quote '[ -f $1/swap ] && swapon $1/swap')$/d" /jffs/scripts/post-mount
    sed -i "/^$(_quote '[ -f $1/swap ] && swapoff $1/swap')$/d" /jffs/scripts/unmount
    write_command_script /jffs/scripts/post-mount '[ -f "$1/swap" ] && swapon "$1/swap"'
    write_command_script /jffs/scripts/unmount '[ -f "$1/swap" ] && swapoff "$1/swap"'
    end_op_message 0
  else
    echo -e "$ERROR Không thể tạo file swap. Đọc log để biết thêm"
    end_op_message
  fi
}

read_input_dns () {
  echo -en "$INPUT $1 ${BOLD}$2: $NORM"
  read DNS_SERVER
  [ -z $DNS_SERVER ] && DNS_SERVER=$2
  if [ "`echo $DNS_SERVER | awk -F'.' 'NF != 4 || $1 < 0 || $1 > 255 || $2 < 0 || $2 > 255 || $3 < 0 || $3 > 255 || $4 < 0 || $4 > 255 {print}'`" ]; then
    echo -e "$ERROR Bạn nhập sai địa chỉ máy chủ rồi!!!"
    read_input_dns "$@"
  fi
}

read_input_num () {
  if [ -z $4 ]; then
    echo -en "$INPUT $1, $BOLD[$2-$3]$NORM: "
  else
    echo -en "$INPUT $1, $BOLD[$2-$3/$4]$NORM: "
  fi
  read CHOSEN
  if [ "$CHOSEN" ] && [ "$CHOSEN" == "$4" ]; then
    return 1
  fi
  if [ -z "`echo $CHOSEN | grep -E '^[0-9]+$'`" ]; then
    echo -e "$ERROR Bạn nhập sai rồi! Đang thử lại..."
    read_input_num "$@"
    return
  fi
  if [ $CHOSEN -lt $2 ] || [ $CHOSEN -gt $3 ] ; then
    echo -e "$ERROR Giá trị nhập vào hơi lớn! Đang thử lại..."
    read_input_num "$@"
    return
  fi
}

read_yesno () {
  echo -en "$INPUT $1 $BOLD[y/n]$NORM: "
  local YESNO
  read YESNO
  case $YESNO in
    y|Y)
      return 0
      ;;
    n|N)
      return 1
      ;;
    *)
      echo -e "$ERROR Nhập giá trị sai!"
      read_yesno "$@"
      ;;
  esac
}

setup_dnscrypt () {
  if [ ! -f $TOML_ORI ] || [ ! -f $TARG_DIR/dnscrypt-proxy ]; then
    echo -e "$ERROR DNSCrypt-Proxy không được cài đặt. Đang dừng..."
    return
  fi

  echo -e "$INFO Đang cấu hình DNSCrypt-Proxy..."
  setup_dnscrypt_impl "$@"
  local RET=$?
  check_opendns
  if [ "$1" == "reconfig" ]; then
    if [ $RET -eq 0 ]; then
      echo -e "$INFO Đang khởi động lại DNSCrypt-Proxy với file cấu hình mới..."
      $TARG_DIR/manager dnscrypt-start
      end_op_message 0
    else
      end_op_message 0
    fi
  fi
}

setup_dnscrypt_impl () {
  if [ -z $1 ] && [ -f $TOML_FILE ]; then
    check_dnscrypt_toml
    if [ $? -ne 0 ]; then
      setup_dnscrypt_impl x
      return
    fi
    echo -e "$INFO Tìm thấy file cấu hình cũ"
    read_yesno "Bạn có muốn dùng file cấu hình cũ?" && echo -e "$INFO Dùng file cấu hình cũ" || setup_dnscrypt_impl x
  else
    if [ -f $TOML_FILE ]; then
      if [ "$1" == "reconfig" ]; then
        check_dnscrypt_toml
        if [ $? -ne 0 ]; then
          setup_dnscrypt_impl x
          return
        fi
        echo -e "$INFO Tìm thấy file cấu hình cũ"
      fi
      echo -e "$INFO Bạn muốn làm gì với nó:"
      echo -e "$INFO   1) Dùng file cấu hình cũ"
      echo -e "$INFO   2) Dùng file cấu hình mặc định"
      read_input_num "Lựa chọn của bạn là:" 1 2
      case $CHOSEN in
        1)
          echo -e "$INFO Dùng file cấu hình cũ"
          ;;
        2)
          echo -e "$INFO Đang sao lưu cấu hình..."
          mv $TOML_FILE $TOML_BAK
          cp -f $TOML_ORI $TOML_FILE
          ;;
      esac
    else
      cp -f $TOML_ORI $TOML_FILE
    fi
    local GVARS_ARGS
    read_yesno "Bạn có muốn cài mọi truy vấn thông qua DNSCrypt-Proxy?" && write_manager_script /jffs/scripts/firewall-start fw-rules || del_jffs_script /jffs/scripts/firewall-start
    choose_dnscrypt_server

    echo -e "$INFO Cài máy chủ DNS mặc định cho DNSCrypt-Proxy"
    echo -e "$INFO DNSCrypt-Proxy sẽ dùng máy chủ này khi khởi động"
    read_input_dns "Mặc định là" 8.8.4.4
    read_input_num "Cài cấp độ log. Mặc định là 2, 0 ghi nhiều nhất" 0 6
    toml_gvars_prep fallback_resolver "\'$DNS_SERVER:53\'" log_level $CHOSEN ignore_system_dns true listen_addresses "[\'127.0.0.1:65053\']" cache false cert_ignore_timestamp true user_name "\'nobody\'" max_clients 25000 keepalive 120 netprobe_timeout 120 netprobe_address "\'$DNS_SERVER:53\'"
    echo -e "$INFO Đang cấu hình DNSCrypt-Proxy..."
    eval toml_gvars_write $GVARS_ARGS
    check_dnscrypt_toml
    if [ $? -ne 0 ]; then
      echo -e "$INFO Cấu hình DNSCrypt-Proxy thất bại!!!"
      echo -e "$INFO Please send $TOML_ERR file and screen log of "
      echo -e "$INFO all operations you have made to this script dev"
      return 1
    fi
  fi
}

set_timezone () {
  local TMP=/root
  local TZ_DATA=tzdata-2018c-1-any.pkg.tar.bz2

  download_file $TARG_DIR 755 $URL_GEN/manager
  download_file $TMP 644 $URL_GEN/$TZ_DATA
  local INDEX=`tar tjf $TMP/$TZ_DATA | awk -F'/' '!/\/$/ && !/PaxHeader/ && /\/posix\//' | wc -l`
  echo -e "$INFO Múi giờ khả dụng:"
  tar tjf $TMP/$TZ_DATA | awk -F'/' '!/\/$/ && !/PaxHeader/ && /\/posix\//' | sort | awk -v INDEX=0 -F'/' '!/\/$/ {++INDEX;printf "  " INDEX") ";for (i=5; i<NF; i++)  printf $i "/"; print $NF}'
  read_input_num "Chọn múi giờ của bạn" 1 $INDEX
  local TZ_FILE="`tar tjf $TMP/$TZ_DATA | awk -F'/' '!/\/$/ && !/PaxHeader/ && /\/posix\//' | sort | awk -v INDEX=$CHOSEN '{++i}i==INDEX{print $0}'`"
  echo -e "$INFO `basename $TZ_FILE` selected"
  tar xjf $TMP/$TZ_DATA -C $TMP usr/share/zoneinfo/posix
  mv "$TMP/$TZ_FILE" $TARG_DIR/localtime
  if [ $? -ne 0 ]; then
    echo -e "$ERROR Không thể cài múi giờ"
    end_op_message
    return
  fi

  write_manager_script /jffs/scripts/init-start init-start
  write_manager_script /jffs/scripts/services-stop services-stop
  ln -sf $TARG_DIR/localtime /etc/localtime
  [ "`pidof dnscrypt-proxy`" ] && $TARG_DIR/manager dnscrypt-start
  rm -r $TMP/$TZ_DATA $TMP/usr
  end_op_message 0
}

toml_gvar_disable () {
  local VAR=$1
  local IDX_NX_GVAR=`awk '/^\[.*\]$/ {print NR;exit}' $TOML_FILE`
  sed -i "1,$IDX_NX_GVAR{s/\(^$VAR = .*\)/# \1/}" $TOML_FILE
}

toml_gvars_prep () {
  GVARS_ARGS="$GVARS_ARGS $@"
}

toml_gvars_write () {
  local IDX_NX_GVAR=`awk '/\[.+\]/ && !/(#| = )/ {print NR;exit}' $TOML_FILE`
  local IDX_GLB_INS=`awk -v VAR="#.*Global settings.*" '($0 ~ VAR) {while (getline) {if ($0 ~ "^$") break} print NR;exit}' $TOML_FILE`
  local VAR
  local VALUE
  local TO
  local INDEX
  local HAS_GLB_INS
  local SED_CMD
  while [ $# -gt 0 ]; do
    VAR=$1; shift
    VALUE=$1; shift
    TO=$(_quote "$VAR = $VALUE")
    INDEX=`awk -v IDX=$IDX_NX_GVAR -v VAR="^$VAR = " '($0 ~ VAR) && (NR < IDX) {print NR; exit}' $TOML_FILE`
    if [ "$INDEX" ]; then
      SED_CMD="${INDEX}{s/.*/${TO}/};${SED_CMD}"
      continue
    fi
    INDEX=`awk -v IDX=$IDX_NX_GVAR -v VAR="#.*$VAR = " '($0 ~ VAR) && (NR < IDX) {print NR; exit}' $TOML_FILE`
    if [ "$INDEX" ]; then
      SED_CMD="${INDEX}{s/.*/${TO}/};${SED_CMD}"
      continue
    fi
    [ -z $HAS_GLB_INS ] && SED_CMD="${SED_CMD}${IDX_GLB_INS}{s/^/\n${TO}\n" || SED_CMD="${SED_CMD}${TO}\n"
    HAS_GLB_INS=1
  done
  [ "$HAS_GLB_INS" ] && SED_CMD="${SED_CMD}/}"
  sed -i "${SED_CMD%;}" $TOML_FILE
}

uninst_all () {
  rm -rf $TARG_DIR
  del_jffs_script /jffs/scripts/dnsmasq.postconf
  del_jffs_script /jffs/scripts/init-start
  del_jffs_script /jffs/scripts/firewall-start
  del_jffs_script /jffs/scripts/services-stop
  del_jffs_script /jffs/scripts/wan-start
  service restart_dnsmasq
  killall -q -9 haveged rngd dnscrypt-proxy
  local MAN_PID="`pidof manager`"
  local PID
  if [ "$MAN_PID" ]; then
    for PID in $MAN_PID; do
      if [ "`cat /proc/$PID/cmdline | grep dnscrypt`" ]; then
        kill -9 $PID
        break
      fi
    done
  fi
  end_op_message 0
}

uninst_dnscrypt () {
  echo -e "$INFO Đang gỡ DNSCrypt-Proxy..."
  rm -f $TARG_DIR/dnscrypt-proxy $TARG_DIR/nonroot
  del_jffs_script /jffs/scripts/dnsmasq.postconf
  del_jffs_script /jffs/scripts/firewall-start
  del_jffs_script /jffs/scripts/wan-start
  killall -q dnscrypt-proxy
  service restart_dnsmasq
  echo -e "$INFO Một vài file cấu hình phát sinh có thể chưa được gỡ hết"
  end_op_message 0
}

uninst_random () {
  echo -e "$INFO Đang gỡ (P)RNG..."
  rm -f $TARG_DIR/haveged $TARG_DIR/rngd $TARG_DIR/stty
  killall -q -9 haveged rngd
  del_conf RAN_PRV RNG_DEV
  [ ! -f $TARG_DIR/localtime ] && [ ! -f $TARG_DIR/dnscrypt-proxy ] && del_jffs_script /jffs/scripts/init-start; del_jffs_script /jffs/scripts/services-stop
  end_op_message 0
}

unset_timezone () {
  rm -f $TARG_DIR/localtime
  [ -z "`grep \"^RAN_PRV=.*$\" $TARG_DIR/.config`" ] && [ ! -f $TARG_DIR/dnscrypt-proxy ] && del_jffs_script /jffs/scripts/init-start; del_jffs_script /jffs/scripts/services-stop
  end_op_message 0
}

write_conf () {
  local VAR=$1
  local VALUE="$2"
  [ -f $TARG_DIR/.opendns-auth ] && mv $TARG_DIR/.opendns-auth $CONF_FILE && chmod 644 $CONF_FILE
  if [ ! -f $CONF_FILE ]; then
    touch $CONF_FILE && chmod 644 $CONF_FILE
  fi
  if [ "`grep $VAR $CONF_FILE`" ]; then
    VALUE=$(_quote "$VALUE")
    sed -i "/^$VAR=/s/=.*/=$VALUE/" $CONF_FILE
  else
    echo "$VAR=$VALUE" >> $CONF_FILE
  fi
}

write_command_script () {
  local TARG=$1
  local COMMAND=$2
  local FILENAME="`basename \"$TARG\"`"

  if [ ! -f $TARG ]; then
    echo -e "$INFO Đang tạo file $FILENAME"
    echo "#!/bin/sh" > $TARG
  fi
  chmod 755 $TARG

  if [ `grep -c -F "$COMMAND" $TARG` -gt 0 ]; then
    echo -e "$INFO $FILENAME đã được cấu hình"
  else
    echo -e "$INFO Đang cấu hình file $FILENAME"
    echo "$COMMAND" >> $TARG
  fi
}

write_manager_script () {
  local TARG=$1
  local OP=$2
  local FILENAME="`basename \"$TARG\"`"
  local COMMAND=$TARG_DIR/manager

  if [ ! -f $TARG ]; then
    echo -e "$INFO Đang tạo file $FILENAME"
    echo "#!/bin/sh" > $TARG
  fi
  chmod 755 $TARG $COMMAND
  del_between_magic $TARG dnscrypt-asuswrt-installer

  if [ `grep -c -F "[ -x $COMMAND ] && $COMMAND $OP" $TARG` -gt 0 ]; then
    echo -e "$INFO $FILENAME đã được cấu hình"
  else
    echo -e "$INFO Đang cấu hình file $FILENAME"
    if [ "`grep \"^$COMMAND\" $TARG`" ]; then
      sed -i "s~^$COMMAND~[ -x $COMMAND ] \&\& $COMMAND $OP~" $TARG
    else
      del_jffs_script $TARG !manager
      [ `tail -1 $TARG|grep -c '^$'` -eq 0 ] && echo "" >> $TARG
      echo "[ -x $COMMAND ] && $COMMAND $OP" >> $TARG
    fi
  fi
}

[ $1 ] && BRANCH=$1 || BRANCH=master
URL_GEN=https://raw.githubusercontent.com/thuantran/dnscrypt-asuswrt-installer/$BRANCH/gen
URL_ARCH=https://github.com/thuantran/dnscrypt-asuswrt-installer/raw/$BRANCH

case $(uname -m) in
  armv7l)
    URL_ARCH=$URL_ARCH/armv7
    DNSCRYPT_ARCH=linux_arm
    DNSCRYPT_ARCH_TAR=linux-arm
    echo -e "$INFO Đang dùng kiến trúc ARMv7."
    ;;
  aarch64)
    URL_ARCH=$URL_ARCH/armv8
    DNSCRYPT_ARCH=linux_arm64
    DNSCRYPT_ARCH_TAR=linux-arm64
    echo -e "$INFO Đang dùng kiến trúc ARMv8."
    ;;
  # mips)
    # URL_ARCH=$URL_ARCH/mips
    # DNSCRYPT_ARCH=linux_mipsle
    # DNSCRYPT_ARCH_TAR=linux-mipsle
    # echo -e "$INFO Detected MIPSEL architecture."
    # echo -e "$WARNING FOR TESTING ONLY, MIGHT NOT WORK AT ALL"
    # echo -e "$WARNING USE AT YOUR OWN RISK"
    # ;;
  *)
    echo "Xin lỗi nhé, kịch bản hiện tại chưa hỗ trợ nền tảng của bạn."
    exit 1
    ;;
esac

check_jffs_enabled
cleanup

menu () {
  echo -e "$INFO Nhấn phím để thực hiện tuỳ chọn bên dưới:"
  if [ ! $PhienBanOff == 2.0.36-beta.1 ]; then
  echo -e "  0) Hạ cấp DNSCrypt-Proxy về 2.0.36-Beta 1"; else
  echo -e "  0) Nâng cấp DNSCrypt-Proxy lên $PhienBanOn"; fi
  echo -e "  1) Cài mới DNSCrypt-Proxy"
  echo -e "  2) Gỡ DNSCrypt-Proxy"
  echo -e "  3) Cấu hình DNSCrypt-Proxy"
  echo -e "  4) Đặt muối giờ"
  echo -e "  5) Gỡ muối giờ"
  echo -e "  6) Cài (P)RNG"
  echo -e "  7) Gỡ (P)RNG"
  echo -e "  8) Cài swap file"
  echo -e "  9) Gỡ hết"
  echo -e "  q) Thoát"
  read_input_num "Nhấn phím tương ứng với yêu cầu của bạn:" 0 9 q
  case $CHOSEN in
    0)
      if [ ! $PhienBanOff == 2.0.36-beta.1 ]; then 
      echo -e "$INFO Thao tác này sẽ hạ cấp DNSCrypt-Proxy phiên bản $PhienBanOff"
      echo -e "$INFO về phiên bản 2.0.36-Beta 1."
      echo
      read_yesno "Bạn có muốn hạ cấp DNSCrypt-Proxy về 2.0.36-Beta 1?" && HaCap; else
      echo -e "$INFO Thao tác này sẽ nâng cấp DNSCrypt-Proxy phiên bản $PhienBanOff"
      echo -e "$INFO lên phiên bản $PhienBanOn"
      echo
      read_yesno "Bạn có muốn nâng cấp DNSCrypt-Proxy lên $PhienBanOn?" && NangCap; fi;
      menu
      ;;
    1)
      echo -e "$INFO Cần dung lượng tối thiểu 8Mb để cài DNSCrypt-Proxy."
      echo -e "$INFO Không thay đổi dữ liệu khác trên /jffs."
      echo -e "$INFO Các kịch bản cần thiết cũng sẽ được cài."
      echo
      read_yesno "Bạn có muốn cài DNSCrypt-Proxy vào /jffs?" && inst_dnscrypt || menu
      ;;
    2)
      echo -e "$INFO Lựa chọn này sẽ gỡ DNSCrypt-Proxy."
      echo -e "$INFO Không thay đổi dữ liệu khác trên /jffs."
      echo -e "$INFO Và xoá luôn kịch bản đã cài."
      echo
      read_yesno "Bạn có muốn gỡ DNSCrypt-Proxy khỏi /jffs?" && uninst_dnscrypt || menu
      ;;
    3)
      echo -e "$INFO Cấu hình lại DNSCrypt-Proxy"
      echo
      read_yesno "Bạn có muốn thực hiện?" && setup_dnscrypt reconfig || menu
      ;;
    4)
      echo -e "$INFO Việc này sẽ cài muối giờ cho router"
      echo
      read_yesno "Bạn có muốn thực hiện?" && set_timezone || menu
      ;;
    5)
      echo -e "$INFO Việc này sẽ Gỡ muối giờ đã cho router"
      echo
      read_yesno "Bạn có muốn thực hiện?" && unset_timezone || menu
      ;;
    6)
      echo -e "$INFO Lựa chọn này sẽ cài (P)RNG (<0.5MB)"
      echo -e "$INFO vào jffs, không thay đổi dữ liệu khác."
      echo -e "$INFO Cũng như thay đổi kịch bản tương ứng."
      echo
      read_yesno "Bạn có muốn cài (P)RNG vào /jffs?" && inst_random || menu
      ;;
    7)
      echo -e "$INFO Lựa chọn này sẽ gỡ (P)RNG"
      echo -e "$INFO từ jffs, không thay đổi dữ liệu khác."
      echo -e "$INFO Cũng như thay đổi kịch bản tương ứng."
      echo
      read_yesno "Bạn có muốn gỡ (P)RNG từ /jffs?" && uninst_random || menu
      ;;
    8)
      echo -e "$INFO Lựa chọn này sẽ cài file swap vào router"
      echo -e "$INFO Bạn cần chọn thiết bị gắn ngoài để lưu file swap"
      echo -e "$INFO Bạn cần tối thiểu 500Mb để lưu file swap"
      echo
      read_yesno "Bạn có muốn cài file swap?" && check_swap || menu
      ;;
    9)
      echo -e "$INFO Lựa chọn này sẽ gỡ file swap khỏi router"
      echo
      read_yesno "Bạn có muốn thực hiện?" && uninst_all || menu
      ;;
    q|Q)
      echo -e "$INFO Thoát kịch bản"
      echo -e "$INFO Nếu cần thiết, hãy khởi động lại router!"
      ;;
  esac
}

menu

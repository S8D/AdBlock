#!/bin/sh
PhienBan="20200130a"
DNSCRYPT_VER=2.0.36
DI_VERSION=v2.0.3

GetTime=$(date +"%F %a %T"); Time="$GetTime -"; DauCau="#"
TM="/opt"; tmDNS="${TM}/dns"; mkdir -p $tmDNS; cd $TM
TMdns="/jffs/dnscrypt"
dns="${TMdns}/dnscrypt-proxy"
CauHinh="${TMdns}/dnscrypt-proxy.toml"
dl1="curl -s -L -o"; dl2="curl -s -L"
rm -f ${TM}/*.minisig
rm -f /jffs/dnscrypt/*.gz; rm -rf /jffs/dnscrypt/linux-arm
rm -f /jffs/*.gz; rm -rf /jffs/linux-arm
OS=`uname -m`; x64="x86_64"; arm="armv7l"; Android="aarch64"
if [ $OS == $arm ]; then linktai="linux_arm-"; ThuMuc="linux-arm"; else
  echo "$DauCau Scripts chưa hỗ trợ nền tảng đang chạy"; exit 1; fi
Log="${tmDNS}/Update.log"; if [ ! -f "$Log" ]; then echo '' > $Log; fi;
upTam="${TM}/tam"; rm -f $upTam;

echo "$DauCau Đang kiểm tra máy chủ cập nhật..."
#CheckGG () { ping -q -c 1 -W 1 gg.gg >/dev/null; }; 
CheckUL () { ping -q -c 1 -W 1 uli.vn >/dev/null; }; 
CheckTN () { ping -q -c 1 -W 1 tiny.cc >/dev/null; }; 
CheckGH () { ping -q -c 1 -W 1 s8d.github.io >/dev/null; };

if CheckUL; then UpLink="uli.vn/tt"; DownLink="uli.vn/dns"; net="2"; else
  if CheckTN; then UpLink="https://tiny.cc/-tt"; DownLink="https://tiny.cc/dns_"; net="2"; else
    if CheckGH; then UpLink="https://s8d.github.io/AdBlock/Scripts/thuantran.sh";
      DownLink="https://api.github.com/repos/DNSCrypt/dnscrypt-proxy/releases/latest"; net="3"; else net=0; fi; fi; fi

if [ $net -ge 1 ]; then echo "$DauCau Đang kiểm tra cập nhật $(basename "$0") $PhienBan..."
  PhienBanMoi=$(${dl2} "$UpLink" | grep PhienBan\= | sed 's/.*\=\"//; s/\"$//');
  if [ $PhienBanMoi == $PhienBan ]; then echo "$DauCau $(basename "$0") $PhienBan là bản mới nhất!"; else
    echo "$DauCau Đang cập nhật $(basename "$0") v.$PhienBan lên v.$PhienBanMoi...";
    cp $0 ${tmDNS}/$PhienBan\_$(basename "$0")
    $dl1 $upTam $UpLink; chmod +x $upTam; mv $upTam ${TM}/$0
    echo "$DauCau Khởi chạy $(basename "$0") $PhienBanMoi..."; sh ${TM}/$(basename "$0"); exit 1; fi; fi

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
  echo -e "$INFO Checking dnscrypt-proxy configuration..."
  $TARG_DIR/dnscrypt-proxy -check -config $TOML_FILE
  if [ $? -ne 0 ]; then
    echo -e "$INFO Move invalid configuration file to $TOML_ERR"
    echo -e "$INFO Operation will continue with clean config file"
    mv $TOML_FILE $TOML_ERR
    return 1
  fi
}

check_dns_environment () {
  local DNSPRIV=`nvram get dnspriv_enable`
  if [ $DNSPRIV -ne 0 ]; then
    echo -e "$INFO Setting up Correct DNS Environment."
    nvram set dnspriv_enable=0
    nvram commit
    echo -e "$INFO DNS Environment is Ready."
  else
    echo -e "$INFO DNS Environment is Ready."
  fi
}

check_dns_filter () {
  local DNSFIL=`nvram get dnsfilter_enable_x`
  if [ "$1" -eq 0 ] && [ $DNSFIL -ne 0 ]; then
    nvram set dnsfilter_enable_x="0"
    nvram commit
    echo -e "$INFO User chose to not force DNS through this proxy."
    return
  fi
  if [ "$1" -eq 1 ] && [ $DNSFIL -ne 1 ]; then
    nvram set dnsfilter_custom1=""
    nvram set dnsfilter_custom2=""
    nvram set dnsfilter_custom3=""
    nvram set dnsfilter_enable_x="1"
    nvram set dnsfilter_mode="11"
    nvram set dnsfilter_rulelist=""
    nvram set dnsfilter_rulelist1=""
    nvram set dnsfilter_rulelist2=""
    nvram set dnsfilter_rulelist3=""
    nvram set dnsfilter_rulelist4=""
    nvram set dnsfilter_rulelist5=""
    nvram set dhcp_dns1_x=""
    nvram set dhcp_dns2_x=""
    nvram commit
    echo -e "$INFO Set DNSFilter to Control DNS."
  elif [ "$1" -eq 1 ] && [ $DNSFIL -ne 0 ]; then
    echo -e "$INFO DNSFilter is Already on."
    echo -e "$INFO User can choose to keep any custom dnsfilter values and only redirect non-custom traffic."
    read_yesno "Do you want to redirect only SOME DNS resolutions on your network through this proxy?" && check_dns_filter_some || echo -e "$INFO User chose to continue redirecting All DNS resolutions instead."
    nvram set dnsfilter_custom1=""
    nvram set dnsfilter_custom2=""
    nvram set dnsfilter_custom3=""
    nvram set dnsfilter_mode="11"
    nvram set dnsfilter_rulelist=""
    nvram set dnsfilter_rulelist1=""
    nvram set dnsfilter_rulelist2=""
    nvram set dnsfilter_rulelist3=""
    nvram set dnsfilter_rulelist4=""
    nvram set dnsfilter_rulelist5=""
    nvram set dhcp_dns1_x=""
    nvram set dhcp_dns2_x=""
    nvram commit
  fi
}

check_dns_filter_some () {
  nvram set dnsfilter_mode="11"
  nvram set dhcp_dns1_x=""
  nvram set dhcp_dns2_x=""
  nvram commit
  echo -e "$INFO Set DNSFilter to Control DNS through this proxy, while leaving any Custom Rules and Values."
  return
}

check_jffs_enabled () {
  if [ "`nvram get jffs2_format`" == "1" ]; then
    echo -e "$ERROR JFFS partition is scheduled to be reformatted"
    echo -e "$ERROR Please reboot to format or disable that setting and try again. Exiting..."
    exit 1
  fi

  local JFFS2_ENABLED=`nvram get jffs2_enable`
  local JFFS2_SCRIPTS=`nvram get jffs2_scripts`

  if [ $JFFS2_ENABLED -ne 1 ] || [ $JFFS2_SCRIPTS -ne 1 ]; then
    echo -e "$INFO JFFS custom scripts and configs are not enabled. Enabling them"
    nvram set jffs2_enable=1
    nvram set jffs2_scripts=1
    nvram commit
  else
    echo -e "$INFO JFFS custom scripts and configs are already enabled"
  fi
}

check_anonymized_support () {
  if [ "`grep '^server_names = .*cisco.*' $TOML_FILE`" ] && [ "`grep '^dnscrypt_servers = .*true.*' $TOML_FILE`" ]; then
    echo -e "$INFO Cisco does not support anonymized DNS"
    echo -e "$INFO Continue without Relays Support"
    toml_nvars_delete "routes =" $TOML_FILE
  elif [ "`grep '^server_names = .*NextDNS-Custom.*' $TOML_FILE`" ] && [ "`grep '^dnscrypt_servers = .*true.*' $TOML_FILE`" ]; then
    echo -e "$INFO NextDNS-Custom is defined"
    echo -e "$INFO Continue without Relays Support"
    toml_nvars_delete "routes =" $TOML_FILE
  elif [ "`grep '^dnscrypt_servers = .*true.*' $TOML_FILE`" ]; then   # Checking for Anonymized Relays.
    echo -e "$INFO Checking for Anonymized Dnscrypt Support"
    echo -e "$INFO Users may only specify Wild-card Relay Support (server_name "*")"
    echo -e "$INFO All DNSCRYPT Server traffic will be sent through same set of chosen Relays."
    echo -e "$INFO With this Menu, Users Can Disable, Pick, or Skip Relay Support for DNSCRYPT servers."
    echo -e "$INFO Picking Relays brings up Menu for Choosing Relays."
    echo -e "$INFO Skip allows Users to skip configuring relays."
    echo -e "$INFO NOTE: You must disable if you want to turn off Relays that were defined on earlier configurations..."
    echo -e "$INFO What do you want to do:"
    echo -e "  1) Disable Relays for DNSCRYPT servers"
    echo -e "  2) Pick Relays for DNSCRYPT servers"
    echo -e "  3) Skip Choosing Relays for DNSCRYPT servers"
    read_input_num "Your choice" 1 3
    case $CHOSEN in
      1)
        echo -e "$INFO Continue without Relays Support"
        toml_nvars_delete "routes =" $TOML_FILE
        ;;
      2)
        toml_nvars_delete "routes =" $TOML_FILE
        VARSARGS="dnswarden-dc2 af-dnswarden-dc3 opennic-eleix dnscrypt-jp-blahdns-ipv4 dnscrypt-fi-blahdns-ipv6v6 af-dnswarden-dc2-ipv6v6 quad9-dnscrypt-ip4-nofilter-alt geekdns-north opennic-R4SAS yandex ventricle.us freetsa.org cs-mo opennic-R4SAS-ipv6v6 quad9-dnscrypt-ip6-nofilter-altv6 geekdns-hk opennic-rico4514 qag.me cleanbrowsing-family-ipv6v6 captnemo-in ev-to cs-usdc geekdns-south cs-it arvind-io ibksturm quad9-dnscrypt-ip6-filter-altv6 dnscrypt-de-blahdns-ipv4 af-dnswarden-dc1-ipv6v6 ads-dnswarden-dc1-ipv6-ecsv6 ads-dnswarden-dc2 cs-ro dnscrypt-fi-blahdns-ipv4 ev-va adguard-dns-family-ipv6v6 cs-usor dnscrypt.ca-1-ipv6v6 quad9-dnscrypt-ip6-filter-priv6 mrkaran scaleway-ams-ipv6v6 dnswarden-dc3-ipv6v6 dnswarden-dc2-ipv6v6 doh-fi-blahdns dnscrypt.eu-nl ads-dnswarden-dc2-ipv6v6 af-dnswarden-dc1-ipv6-ecsv6 af-dnswarden-dc2-ipv6-ecsv6 quad9-dnscrypt-ip4-filter-pri adguard-dns-family cs-de cs-uswa d0wn-is-ns2 scaleway-ams af-dnswarden-dc3-ipv6-ecsv6 cleanbrowsing-security quad9-dnscrypt-ip4-filter-alt v.dnscrypt.uk-ipv4 cs-fr v.dnscrypt.uk-ipv6v6 opennic-luggs ads-dnswarden-dc3 ffmuc.net sea-dnscrypt-us ads-dnswarden-dc2-ecs jp.tiar.app cleanbrowsing-adult cs-usga qualityology.com dnscrypt.nl-ns0 dnscrypt.eu-dk cs-nl2 d0wn-tz-ns1-ipv6v6 publicarray-au ads-dnswarden-dc3-ipv6v6 cs-ch jp.tiar.app-ipv6v6 dnsforfamily dnsforfamily-v6v6 dnscrypt-jp-blahdns-ipv6v6 ads-dnswarden-dc1 id-gmail securedns-ipv6v6 cs-fi af-dnswarden-dc2-ecs af-dnswarden-dc1-ecs dnswarden-dc1 oszx af-dnswarden-dc2 dnswarden-dc1-ipv6v6 cleanbrowsing-family quad9-dnscrypt-ip6-nofilter-priv6 quad9-dnscrypt-ip4-nofilter-pri scaleway-fr ads-dnswarden-dc2-ipv6-ecsv6 dnscrypt.one-ipv6v6 opennic-luggs-ipv6v6 cs-ustx dnscrypt.uk-ipv4 dnscrypt.one opennic-luggs2-ipv6v6 ads-dnswarden-dc1-ipv6v6 securedns sfw.scaleway-fr adguard-dns cs-ca2 af-dnswarden-dc3-ecs ffmuc.net-v6v6 cs-usnc dnscrypt.uk-ipv6v6 dnscrypt.eu-dk-ipv6v6 cs-lv publicarray-au2 cs-usil adguard-dns-ipv6v6 dnswarden-dc3 geekdns-west soltysiak af-dnswarden-dc3-ipv6v6 cs-swe dnscrypt.ca-2-ipv6v6 ads-dnswarden-dc3-ipv6-ecsv6 ads-dnswarden-dc3-ecs cs-ca dnscrypt-de-blahdns-ipv6v6 ams-dnscrypt-nl dnscrypt.ca-1 comodo-02 af-dnswarden-dc1 ads-dnswarden-dc1-ecs cs-usca opennic-luggs2 cleanbrowsing-adult-ipv6v6 dnscrypt.ca-2 d0wn-tz-ns1 cs-nl opennic-bongobow id-gmail-ipv6v6 cs-pl"
        for DNSCRYPT in $VARSARGS; do
        SERVER=$(echo "$DNSCRYPT")
          if [ "`grep '^server_names = .*'$SERVER'.*' $TOML_FILE`" ]; then
            echo -e "$INFO Found Servers for Anonymized Dnscrypt Support"
            echo -e "$INFO Choose Relays for DNSCRYPT servers"
            choose_relays_manual
            return
          fi
        done
        echo -e "$INFO Allowing users to setup for Automatically Chosen Servers"
        echo -e "$INFO Warning:Selecting Yes will disable defined servers"
        echo -e "$INFO No will force installer continue as is."
        local GVARS_ARGS
        read_yesno "Do you want to set up relay support for servers chosen automatically?" && toml_gvar_disable server_names || return
        eval toml_gvars_write $GVARS_ARGS
        choose_relays_manual
        ;;
      3)
        echo -e "$INFO Continue without Adding or Modifying Relays Support"
        ;;
    esac
  else
       echo -e "$INFO Continue without Relays Support"
       toml_nvars_delete "routes =" $TOML_FILE
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

check_nextdns () {
  if [ "`grep '^server_names = .*nextdns.*' $TOML_FILE`" ]; then
     echo -e "$INFO Found NextDNS Server Selection"
     echo -e "$INFO If you have a NextDNS Account visit https://my.nextdns.io/login enter your setup and copy your DNS STAMP"
     echo -e "$INFO What do you want to do:"
     echo -e "  1) Setup Your SDNS STAMP"
     echo -e "  2) Skip dont have account"
     read_input_num "Your choice" 1 2
     case $CHOSEN in
       1)
         echo -e "$INFO User has specified to define NextDNS-Custom"
         nextdns_authen 1
         ;;
       2)
         echo -e "$INFO User has chosen to skip NextDNS-Custom"
         nextdns_authen 0
         ;;
     esac
  fi
}

check_swap () {
  local SWAP_SIZE=`awk '/SwapTotal/ {print $2}' /proc/meminfo`
  if [ $SWAP_SIZE -gt 0 ]; then
    echo -e "$INFO Swap file is already setup"
    end_op_message 0
    return
  fi

  inst_swap
}

choose_dnscrypt_server () {
  local USE_IPV6
  read_yesno "Do you want to use DNS server over IPv6 (yes only if your connection has IPv6)?" && USE_IPV6=true || USE_IPV6=false
  toml_gvars_prep ipv6_servers $USE_IPV6
  echo -e "$INFO Choose DNS resolving load balancing strategy:"
  echo -e "  1) p2 (default)"
  echo -e "  2) ph"
  echo -e "  3) first"
  echo -e "  4) random"
  read_input_num "Select your mode" 1 4
  case $CHOSEN in
    1)
      toml_gvars_prep lb_strategy "\'p2\'"
      ;;
    2)
      toml_gvars_prep lb_strategy "\'ph\'"
      ;;
    3)
      toml_gvars_prep lb_strategy "\'first\'"
      ;;
    4)
      toml_gvars_prep lb_strategy "\'random\'"
      ;;
  esac
  echo -e "$INFO Choose how your DNS servers are selected:"
  echo -e "  1) Automatically"
  echo -e "  2) Manually"
  echo -e "  3) Static"
  read_input_num "Select your mode" 1 3
  case $CHOSEN in
    1)
      choose_dnscrypt_server_auto
      ;;
    2)
      choose_dnscrypt_server_manual
      ;;
    3)
      choose_dnscrypt_server_static
      ;;
  esac
}

choose_dnscrypt_server_auto () {
  toml_gvar_disable server_names
  read_yesno "Use servers support the DNSCrypt protocol" && toml_gvars_prep dnscrypt_servers true || toml_gvars_prep dnscrypt_servers false
  read_yesno "Use servers support the DNS-over-HTTPS protocol" && toml_gvars_prep doh_servers true || toml_gvars_prep doh_servers false
  read_yesno "Use only servers support DNSSEC" && toml_gvars_prep require_dnssec true || toml_gvars_prep require_dnssec false
  read_yesno "Use only servers that do not log user's queries" && toml_gvars_prep require_nolog true || toml_gvars_prep require_nolog false
  read_yesno "Use only servers that do not filter result" && toml_gvars_prep require_nofilter true || toml_gvars_prep require_nofilter false
}

choose_dnscrypt_server_manual () {
  local INDEX=$1
  if [ -z $INDEX ]; then
    [ "$USE_IPV6" == "true" ] && USE_IPV6="NOMATCH" || USE_IPV6="ipv6"
    local RESOLVERS
    toml_gvars_prep dnscrypt_servers true doh_servers true require_dnssec false require_nolog false require_nofilter false
    echo -e "$INFO Available DNS servers: "
    INDEX=`awk -v PATT="$USE_IPV6" '/^## / && ($0 !~ PATT)' $TARG_DIR/public-resolvers.md | wc -l`
    awk -v PATT="$USE_IPV6" '/^## / && ($0 !~ PATT) {printf "  "; printf ++i") "$2": "; getline; getline; print}' $TARG_DIR/public-resolvers.md
    read_input_num "Please choose DNS server" 1 $INDEX
  else
    read_input_num "Please choose next DNS server or press n to stop" 1 $INDEX n
    if [ $? -eq 1 ]; then
      toml_gvars_prep server_names "\"$RESOLVERS\""
      return
    fi
  fi

  local ITEM
  ITEM=`awk -v INDEX=$CHOSEN -v PATT="$USE_IPV6" '/^## / && ($0 !~ PATT) {i++} i==INDEX {print $2;exit}' $TARG_DIR/public-resolvers.md`
  if [ "`echo $RESOLVERS | grep -F $ITEM`" ]; then
    echo -e "$INFO $ITEM is already set"
  else
    if [ "$RESOLVERS" ]; then
      RESOLVERS="${RESOLVERS%?}, '$ITEM']"
    else
      RESOLVERS="['$ITEM']"
    fi
  fi

  choose_dnscrypt_server_manual $INDEX
}

choose_dnscrypt_server_static () {
  echo -e "$INFO This feature allows the User to define a single server using the sdns stamp of the server."
  echo -e "$INFO This assigns the server with a custom name specified by the user as a static option."
  echo -e "$INFO This is only necessary if the Server is not available as an option on the list of servers under manual option."
  echo -e "$INFO If you do not want to continue down this path please select option 2 to return to server selection menu."
  echo -e "$INFO What do you want to do:"
  echo -e "  1) Setup Static Server."
  echo -e "  2) Skip and Go back to server selection menu."
  read_input_num "Your choice" 1 2
    case $CHOSEN in
      1)
        echo -e "$INFO User has specified to define a Static Server."
        read_yesno "Do you want to remove any old static configurations?" && toml_static_removal || echo -e "$INFO Continuing to static server configuration."
        static_chosen 1
        ;;
      2)
        echo -e "$INFO User has chosen to go back to server selection menu."
        static_chosen 0
        ;;
    esac
}


choose_relays_manual () {
  local INDEX=$1
  if [ -z $INDEX ]; then
    [ "$USE_IPV6" == "true" ] && USE_IPV6="NOMATCH" || USE_IPV6="ipv6"
    local RELAYS
    echo -e "$INFO Available Relay servers: "
    INDEX=`awk -v PATT="$USE_IPV6" '/^## / && ($0 !~ PATT)' $TARG_DIR/relays.md | wc -l`
    awk -v PATT="$USE_IPV6" '/^## / && ($0 !~ PATT) {printf "  "; printf ++i") "$2": "; getline; getline; print}' $TARG_DIR/relays.md
    read_input_num "Please choose RELAY server" 1 $INDEX
  else
    read_input_num "Please choose next RELAY server or press n to stop" 1 $INDEX n      
    if [ $? -eq 1 ]; then
       toml_avars_prep routes "\"[ { server_name='*', via=$RELAYS } ]\"" 
      return
    fi
  fi

  local ITEM
  ITEM=`awk -v INDEX=$CHOSEN -v PATT="$USE_IPV6" '/^## / && ($0 !~ PATT) {i++} i==INDEX {print $2;exit}' $TARG_DIR/relays.md`
 
  if [ "`echo $RELAYS | grep -F $ITEM`" ]; then
    echo -e "$INFO $ITEM is already set"
  else
    if [ "$RELAYS" ]; then
      RELAYS="${RELAYS%?}, '$ITEM']"
    else
      RELAYS="['$ITEM']"
    fi
  fi

  choose_relays_manual $INDEX
}

cleanup () {
  rm -f $TARG_DIR/dnscrypt-fw-rules $TARG_DIR/dnscrypt-start $TARG_DIR/dnsmasq-dnscrypt-reconfig $TARG_DIR/fake-hwclock* $TARG_DIR/init-start $TARG_DIR/services-stop
}

create_dir () {
  mkdir -p "$1"
  if [ $? -ne 0 ]; then
    echo -e "$ERROR Unable to create $1!"
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
      echo -e "$INFO $FILENAME is up to date. Skipping..."
    else
      local COUNT=0
      while [ $COUNT -lt 3 ]; do
        echo -e "$INFO Downloading $FILENAME"
        curl -L -k -s "$URL" -o $TARG/$FILENAME
        if [ $? -eq 0 ]; then
          chmod $PERM $TARG/$FILENAME
          break
        fi
        COUNT=$((COUNT+1))
      done
      if [ $COUNT -eq 3 ]; then
        echo -e "$ERROR Unable to download ${BOLD}${URL}${NORM}"
      fi
    fi
  done
}

end_op_message () {
  [ "$1" == "0" ] && echo -e "$INFO Operation completed. You can quit or continue"
  echo =====================================================
  echo
  echo
  menu
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
    echo -e "$ERROR Unable to download dnscrypt-proxy package for your router"
    end_op_message
    return
  fi
  chown `nvram get http_username`:root $TARG_DIR/$DNSCRYPT_ARCH_TAR/*
  mv $TARG_DIR/$DNSCRYPT_ARCH_TAR/* $TARG_DIR
  rm -r $TARG_DIR/$DNSCRYPT_ARCH_TAR $TARG_DIR/$DNSCRYPT_TAR
  chmod 755 $TARG_DIR/dnscrypt-proxy

  del_jffs_script /jffs/scripts/wan-start dnscrypt-start
  del_jffs_script /jffs/scripts/openvpn-event
  del_jffs_script /jffs/scripts/firewall-start
  write_manager_script /jffs/scripts/dnsmasq.postconf dnsmasq
  write_manager_script /jffs/scripts/init-start init-start
  write_manager_script /jffs/scripts/wan-start wan-start
  setup_dnscrypt
  if [ $? -ne 0 ]; then
    end_op_message
    return
  fi

  echo -e "$INFO Staring dnscrypt-proxy..."
  $TARG_DIR/manager dnscrypt-start
  sleep 1
  if [ -z "`pidof dnscrypt-proxy`" ]; then
    echo -e "$ERROR Couldn't start dnscrypt-proxy"
    echo -e "$ERROR Please send WebUI System Log to dev"
    end_op_message
    return
  fi
  service restart_dnsmasq
  manager_monitor_restart

  echo -e "$INFO For dnscrypt-proxy version 2 to work reliably, you might also want to:"
  echo -e "$INFO  - Add swap"
  echo -e "$INFO  - Add a RNG"
  echo -e "$INFO  - Set your timezone"
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

nextdns_authen () {
  local SDNS
  if [ "$1" -eq 0 ]; then
    return
  fi
  echo -en "$INPUT Please enter sdns$NORM: "
  read -r SDNS
  local GVARS_ARGS
  toml_gvars_prep server_names "\"['NextDNS-Custom']\""
  eval toml_gvars_write $GVARS_ARGS
  toml_static_removal
  toml_nvars_insert "[static]" "[static.'NextDNS-Custom']" $TOML_FILE
  toml_nvars_insert "[static.'NextDNS-Custom']" "stamp = '$SDNS'" $TOML_FILE
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
    echo -e "$ERROR Unable to find any external USB storage"
    echo -e "$ERROR Or no suitable external USB storage found"
    echo -e "$ERROR Please connect a USB storage with at least"
    echo -e "$ERROR $(($SWAP_SIZE * 2 / 1024))MB of free space"
    end_op_message
    return
  fi

  echo -e "$INFO Available partition to install swap file:$NORM"
  df | awk -v SWS=$(($SWAP_SIZE * 2)) '/\/tmp\/mnt\// {if ($4 > SWS){++i; print "  " i ") " $6 " (" $4/1024 "MB free)"}}'
  read_input_num "Please select the partition to install swap file" 1 $USB_COUNT
  local MOUNT=`df | awk -v IDX=$CHOSEN -v SWS=$(($SWAP_SIZE * 2)) '/\/tmp\/mnt\// {if ($4 > SWS){++i; if (i==IDX){print $6}}}'`

  echo -e "$INFO Please wait..."
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
    echo -e "$ERROR Unable to create swap. Get the command log to dev"
    end_op_message
  fi
}

read_input_dns () {
  echo -en "$INPUT $1 ${BOLD}$2: $NORM"
  read DNS_SERVER
  [ -z $DNS_SERVER ] && DNS_SERVER=$2
  if [ "`echo $DNS_SERVER | awk -F'.' 'NF != 4 || $1 < 0 || $1 > 255 || $2 < 0 || $2 > 255 || $3 < 0 || $3 > 255 || $4 < 0 || $4 > 255 {print}'`" ]; then
    echo -e "$ERROR Invalid DNS server address entered"
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
    echo -e "$ERROR Invalid character entered! Retrying..."
    read_input_num "$@"
    return
  fi
  if [ $CHOSEN -lt $2 ] || [ $CHOSEN -gt $3 ] ; then
    echo -e "$ERROR Chosen number is not in range! Retrying..."
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
      echo -e "$ERROR Invalid input!"
      read_yesno "$@"
      ;;
  esac
}

static_chosen () {
  local SDNSSTAMP
  local STATICNAME
  if [ "$1" -eq 0 ]; then
    echo -e "$INFO Choose how your DNS servers are selected:"
    echo -e "  1) Automatically"
    echo -e "  2) Manually"
    echo -e "  3) Static"
    read_input_num "Select your mode" 1 3
      case $CHOSEN in
        1)
          choose_dnscrypt_server_auto
          ;;
        2)
          choose_dnscrypt_server_manual
          ;;
        3)
          choose_dnscrypt_server_static
          ;;
      esac
    return
  fi
  echo -e "$INFO Please enter Static Server SDNS stamp" 
  echo -en "$INPUT Please enter sdnsstamp$NORM: "
  read -r SDNSSTAMP
  echo -e "$INFO Please choose Static Server Name"
  echo -en "$INPUT Please enter staticname$NORM: "
  read -r STATICNAME
  toml_gvars_prep server_names "\"['$STATICNAME']\""
  toml_gvars_prep dnscrypt_servers true doh_servers true require_dnssec false require_nolog false require_nofilter false
  toml_nvars_insert "[static]" "[static.'$STATICNAME']" $TOML_FILE
  toml_nvars_insert "[static.'$STATICNAME']" "stamp = '$SDNSSTAMP'" $TOML_FILE
}

setup_dnscrypt () {
  if [ ! -f $TOML_ORI ] || [ ! -f $TARG_DIR/dnscrypt-proxy ]; then
    echo -e "$ERROR dnscrypt-proxy is not installed. Aborting..."
    return
  fi

  echo -e "$INFO Configuring dnscrypt-proxy..."
  setup_dnscrypt_impl "$@"
  local RET=$?
  check_opendns
  check_nextdns
  local AVARS_ARGS
  check_anonymized_support
  eval toml_avars_write $AVARS_ARGS
  if [ "$1" == "reconfig" ]; then
    if [ $RET -eq 0 ]; then
      echo -e "$INFO Restarting dnscrypt-proxy with new config..."
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
    echo -e "$INFO Found previous dnscrypt-proxy config file"
    read_yesno "Do you want to use this file without reconfiguring?" && echo -e "$INFO Use previous settings file" || setup_dnscrypt_impl x
  else
    if [ -f $TOML_FILE ]; then
      if [ "$1" == "reconfig" ]; then
        check_dnscrypt_toml
        if [ $? -ne 0 ]; then
          setup_dnscrypt_impl x
          return
        fi
        echo -e "$INFO Found previous dnscrypt-proxy config file"
      fi
      echo -e "$INFO How do you want to reconfigure:"
      echo -e "$INFO   1) Start from previous settings file"
      echo -e "$INFO   2) Start from default config"
      read_input_num "Your selection" 1 2
      case $CHOSEN in
        1)
          echo -e "$INFO Use previous settings file"
          ;;
        2)
          echo -e "$INFO Backing up previous settings file..."
          mv $TOML_FILE $TOML_BAK
          cp -f $TOML_ORI $TOML_FILE
          ;;
      esac
    else
      cp -f $TOML_ORI $TOML_FILE
    fi
    local GVARS_ARGS
    read_yesno "Do you want to redirect all DNS resolutions on your network through this proxy?" && check_dns_filter 1 || check_dns_filter 0
    choose_dnscrypt_server

    echo -e "$INFO Set a DNS server for initializing dnscrypt-proxy"
    echo -e "$INFO and router services (e.g. ntp) at boot"
    read_input_dns "Default is" 8.8.8.8
    read_input_num "Set log level, default is 2, 0 is the most verbose" 0 6
    toml_gvars_prep fallback_resolver "\'$DNS_SERVER:53\'" log_level $CHOSEN ignore_system_dns true listen_addresses "[\'127.0.1.1:53\']" cache false cert_ignore_timestamp true user_name "\'nobody\'" max_clients 25000 keepalive 120 netprobe_timeout 120 netprobe_address "\'$DNS_SERVER:53\'"
    echo -e "$INFO Writing dnscrypt-proxy configuration..."
    eval toml_gvars_write $GVARS_ARGS
    check_dnscrypt_toml
    if [ $? -ne 0 ]; then
      echo -e "$INFO Writing dnscrypt-proxy configuration failed"
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
  echo -e "$INFO Available timezones/locations:"
  tar tjf $TMP/$TZ_DATA | awk -F'/' '!/\/$/ && !/PaxHeader/ && /\/posix\//' | sort | awk -v INDEX=0 -F'/' '!/\/$/ {++INDEX;printf "  " INDEX") ";for (i=5; i<NF; i++)  printf $i "/"; print $NF}'
  read_input_num "Select your timezone/location" 1 $INDEX
  local TZ_FILE="`tar tjf $TMP/$TZ_DATA | awk -F'/' '!/\/$/ && !/PaxHeader/ && /\/posix\//' | sort | awk -v INDEX=$CHOSEN '{++i}i==INDEX{print $0}'`"
  echo -e "$INFO `basename $TZ_FILE` selected"
  tar xjf $TMP/$TZ_DATA -C $TMP usr/share/zoneinfo/posix
  mv "$TMP/$TZ_FILE" $TARG_DIR/localtime
  if [ $? -ne 0 ]; then
    echo -e "$ERROR Unable to set your timezone file"
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

toml_avar_disable () {
  local VAR=$1
  local IDX_NX_AVAR=`awk '/^\[.*\]$/ {print NR;exit}' $TOML_FILE`
  sed -i "1,$IDX_NX_AVAR{s/\(^$VAR = .*\)/# \1/}" $TOML_FILE
}

toml_avars_prep () {
  AVARS_ARGS="$AVARS_ARGS $@"
}

toml_avars_write () {
  local IDX_NX_AVAR=`awk '/\[.+\]/ && !/(#| = )/ {print NR;exit}' $TOML_FILE`
  local IDX_GLB_INS=`awk -v VAR="#.*routes.*" '($0 ~ VAR) {while (getline) {if ($0 ~ "^$") break} print NR;exit}' $TOML_FILE`
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
    INDEX=`awk -v IDX=$IDX_NX_AVAR -v VAR="^$VAR = " '($0 ~ VAR) && (NR < IDX) {print NR; exit}' $TOML_FILE`
    if [ "$INDEX" ]; then
      SED_CMD="${INDEX}{s/.*/${TO}/};${SED_CMD}"
      continue
    fi
    INDEX=`awk -v IDX=$IDX_NX_AVAR -v VAR="#.*$VAR = " '($0 ~ VAR) && (NR < IDX) {print NR; exit}' $TOML_FILE`
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

toml_nvars_insert () {
  PATTERN=$(_quote "$1")
  CONTENT=$(_quote "$2")
  sed -i "/$PATTERN/a$CONTENT" $3
}

toml_nvars_replace () {
  PATTERN=$(_quote "$1")
  CONTENT=$(_quote "$2")
  sed -i "s/$PATTERN/$CONTENT/" $3
}

toml_nvars_append () {
  echo "$1" >> $2
}

toml_nvars_delete () {
  PATTERN=$(_quote "$1")
  sed -i "/$PATTERN/d" $2
}

toml_static_removal () {
echo -e "$INFO Removing any static server configuration."
toml_nvars_delete "[static.'" $TOML_FILE
toml_nvars_delete "stamp =" $TOML_FILE
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
  echo -e "$INFO Uninstalling dnscrypt-proxy..."
  rm -f $TARG_DIR/dnscrypt-proxy $TARG_DIR/nonroot
  del_jffs_script /jffs/scripts/dnsmasq.postconf
  del_jffs_script /jffs/scripts/firewall-start
  del_jffs_script /jffs/scripts/wan-start
  killall -q dnscrypt-proxy
  service restart_dnsmasq
  echo -e "$INFO Some configuration files are not removed in case you want to reinstall"
  end_op_message 0
}

uninst_random () {
  echo -e "$INFO Uninstalling (P)RNG..."
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
    echo -e "$INFO Creating $FILENAME file"
    echo "#!/bin/sh" > $TARG
  fi
  chmod 755 $TARG

  if [ `grep -c -F "$COMMAND" $TARG` -gt 0 ]; then
    echo -e "$INFO $FILENAME file already configured"
  else
    echo -e "$INFO Configure $FILENAME file"
    echo "$COMMAND" >> $TARG
  fi
}

write_manager_script () {
  local TARG=$1
  local OP=$2
  local FILENAME="`basename \"$TARG\"`"
  local COMMAND=$TARG_DIR/manager

  if [ ! -f $TARG ]; then
    echo -e "$INFO Creating $FILENAME file"
    echo "#!/bin/sh" > $TARG
  fi
  chmod 755 $TARG $COMMAND
  del_between_magic $TARG dnscrypt-asuswrt-installer

  if [ `grep -c -F "[ -x $COMMAND ] && $COMMAND $OP" $TARG` -gt 0 ]; then
    echo -e "$INFO $FILENAME file already configured"
  else
    echo -e "$INFO Configure $FILENAME file"
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
    echo -e "$INFO Detected ARMv7 architecture."
    ;;
  aarch64)
    URL_ARCH=$URL_ARCH/armv8
    DNSCRYPT_ARCH=linux_arm64
    DNSCRYPT_ARCH_TAR=linux-arm64
    echo -e "$INFO Detected ARMv8 architecture."
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
    echo "This is unsupported platform, sorry."
    exit 1
    ;;
esac

check_dns_environment
check_jffs_enabled
cleanup

menu () {
  echo -e "$INFO Choose what you want to do:"
  echo -e "  1) Install/Update dnscrypt-proxy"
  echo -e "  2) Uninstall dnscrypt-proxy"
  echo -e "  3) Configure dnscrypt-proxy"
  echo -e "  4) Set timezone"
  echo -e "  5) Unset timezone"
  echo -e "  6) Install (P)RNG"
  echo -e "  7) Uninstall (P)RNG"
  echo -e "  8) Install swap file"
  echo -e "  9) Uninstall ALL"
  echo -e "  q) Quit"
  read_input_num "Please enter the number designates your selection:" 1 9 q
  case $CHOSEN in
    1)
      echo -e "$INFO This operation will install dnscrypt-proxy and related files (<6MB)"
      echo -e "$INFO to jffs, no other data will be changed."
      echo -e "$INFO Also some start scripts will be installed/modified as required."
      echo
      read_yesno "Do you want to install dnscrypt-proxy to /jffs?" && inst_dnscrypt || menu
      ;;
    2)
      echo -e "$INFO This operation will uninstall dnscrypt-proxy and related files"
      echo -e "$INFO from jffs, no other data will be changed."
      echo -e "$INFO Also some start scripts will be modified as required."
      echo
      read_yesno "Do you want to uninstall dnscrypt-proxy from /jffs?" && uninst_dnscrypt || menu
      ;;
    3)
      echo -e "$INFO This operation allows you to configure dnscrypt-proxy"
      echo
      read_yesno "Do you want to proceed?" && setup_dnscrypt reconfig || menu
      ;;
    4)
      echo -e "$INFO This operation allows you to set your router"
      echo -e "$INFO timezone for background services and processes"
      echo
      read_yesno "Do you want to proceed?" && set_timezone || menu
      ;;
    5)
      echo -e "$INFO This operation allows you to unset your router"
      echo -e "$INFO timezone for background services and processes"
      echo
      read_yesno "Do you want to proceed?" && unset_timezone || menu
      ;;
    6)
      echo -e "$INFO This operation will install a (P)RNG (<0.5MB)"
      echo -e "$INFO to jffs, no other data will be changed."
      echo -e "$INFO Also some start scripts will be installed/modified as required."
      echo
      read_yesno "Do you want to install (P)RNG to /jffs?" && inst_random || menu
      ;;
    7)
      echo -e "$INFO This operation will uninstall (P)RNG"
      echo -e "$INFO from jffs, no other data will be changed."
      echo -e "$INFO Also some start scripts will be installed/modified as required."
      echo
      read_yesno "Do you want to uninstall (P)RNG from /jffs?" && uninst_random || menu
      ;;
    8)
      echo -e "$INFO This operation will install a swap file for your device"
      echo -e "$INFO You need an external USB storage to host this file"
      echo
      read_yesno "Do you want to install a swap file (512MB on ext filesystem partition)?" && check_swap || menu
      ;;
    9)
      echo -e "$INFO This operation will cleanup everything installed by this script (except swap)"
      echo
      read_yesno "Do you want to continue?" && uninst_all || menu
      ;;
    q|Q)
      echo -e "$INFO Operations have been applied if any has been made"
      echo -e "$INFO In case of anomaly, please reboot your router!"
      ;;
  esac
}

menu

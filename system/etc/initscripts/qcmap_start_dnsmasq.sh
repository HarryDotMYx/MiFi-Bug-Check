#!/bin/sh
DUMP_TO_KMSG=/dev/kmsg

echo "Starting DNSMASQ SERVICE arg1: $1 agr2: ${type_inst} " > $DUMP_TO_KMSG
static_dns1=$(nvram get static_dns1 2>&1)
static_dns2=$(nvram get static_dns2 2>&1)
echo "static_dns1=$static_dns1" > $DUMP_TO_KMSG
echo "static_dns2=$static_dns2" > $DUMP_TO_KMSG
echo "dhcp_option_force1=$dhcp_option_force1" > $DUMP_TO_KMSG

if ( [ "$static_dns1" != "" ] || [ "$static_dns1" != "" ] );then
	dhcp_option_force1=6
fi

if [ "$static_dns1" != "" ];then
	 dhcp_option_force1="$dhcp_option_force1,$static_dns1"
fi

if [ "$static_dns2" != "" ];then
         dhcp_option_force1="$dhcp_option_force1,$static_dns2"
fi

echo "1dhcp_option_force1=$dhcp_option_force1" > $DUMP_TO_KMSG

static_dns61=$(nvram get static_dns61 2>&1)
static_dns62=$(nvram get static_dns62 2>&1)
if ( [ "$static_dns61" != "" ] || [ "$static_dns61" != "" ] );then
        dhcp_option=option6:dns-server
fi

if [ "$static_dns61" != "" ];then
         dhcp_option="$dhcp_option,[$static_dns61]"
fi

if [ "$static_dns62" != "" ];then
         dhcp_option="$dhcp_option,[$static_dns62]"
fi
echo "dhcp_option=$dhcp_option" > $DUMP_TO_KMSG
if [ ${type_inst} == "vlan" ]; then
    echo "launching dnsmasq for tpie vlan inst" > $DUMP_TO_KMSG
    if [ ${#dhcp_option_force3} -ne 0 ];then
      /usr/bin/dnsmasq --conf-file=${conf_file} \
      --dhcp-leasefile=${dhcp_leasefile} \
      --addn-hosts=${addn_hosts} \
      --pid-file=${pid_file} \
      --interface=${interface} \
      --except-interface=lo \
      -z \
      --dhcp-range=${dhcp_range} \
      --dhcp-hostsfile=${dhcp_hostsfile} \
      --dhcp-option-force=${dhcp_option_force1} \
      --dhcp-option-force=${dhcp_option_force2} \
      --dhcp-option-force=${dhcp_option_force3} \
      --dhcp-script=${dhcp_script}
    elif [ ${#dhcp_option_force2} -ne 0 ];then
      /usr/bin/dnsmasq --conf-file=${conf_file} \
      --dhcp-leasefile=${dhcp_leasefile} \
      --addn-hosts=${addn_hosts} \
      --pid-file=${pid_file} \
      --interface=${interface} \
      --except-interface=lo \
      -z \
      --dhcp-range=${dhcp_range} \
      --dhcp-hostsfile=${dhcp_hostsfile} \
      --dhcp-option-force=${dhcp_option_force1} \
      --dhcp-option-force=${dhcp_option_force2} \
      --dhcp-script=${dhcp_script}
    else
      /usr/bin/dnsmasq --conf-file=${conf_file} \
      --dhcp-leasefile=${dhcp_leasefile} \
      --addn-hosts=${addn_hosts} \
      --pid-file=${pid_file} \
      --interface=${interface} \
      --except-interface=lo \
      -z \
      --dhcp-range=${dhcp_range} \
      --dhcp-hostsfile=${dhcp_hostsfile} \
      --dhcp-option-force=${dhcp_option_force1} \
      --dhcp-script=${dhcp_script}
    fi
elif [ ${type_inst} == "ip_passthrough" ]; then
    echo "launching dnsmasq for type ippass inst" > $DUMP_TO_KMSG
    if [ ${#dhcp_option_force3} -ne 0 ];then
      if [ ${nat_enabled} -eq 0 ];then
        /usr/bin/dnsmasq --conf-file=${conf_file} \
        --dhcp-leasefile=${dhcp_leasefile} \
        --addn-hosts=${addn_hosts} \
        --pid-file=${pid_file} \
        --interface=${interface} \
        --except-interface=lo \
        -z \
        --dhcp-hostsfile=${dhcp_hostsfile} \
        --dhcp-option-force=${dhcp_option_force1} \
        --dhcp-option-force=${dhcp_option_force2} \
        --dhcp-option-force=${dhcp_option_force3} \
        --dhcp-range=${dhcp_range2} \
        --dhcp-script=${dhcp_script}
      else
        /usr/bin/dnsmasq --conf-file=${conf_file} \
        --dhcp-leasefile=${dhcp_leasefile} \
        --addn-hosts=${addn_hosts} \
        --pid-file=${pid_file} \
        --interface=${interface} \
        --except-interface=lo \
        -z \
        --dhcp-range=${dhcp_range1} \
        --dhcp-hostsfile=${dhcp_hostsfile} \
        --dhcp-option-force=${dhcp_option_force1} \
        --dhcp-option-force=${dhcp_option_force2} \
        --dhcp-option-force=${dhcp_option_force3} \
        --dhcp-range=${dhcp_range2} \
        --dhcp-script=${dhcp_script}
      fi
    elif [ ${#dhcp_option_force2} -ne 0 ];then
      if [ ${nat_enabled} -eq 0 ];then
        /usr/bin/dnsmasq --conf-file=${conf_file} \
        --dhcp-leasefile=${dhcp_leasefile} \
        --addn-hosts=${addn_hosts} \
        --pid-file=${pid_file} \
        --interface=${interface} \
        --except-interface=lo \
        -z \
        --dhcp-hostsfile=${dhcp_hostsfile} \
        --dhcp-option-force=${dhcp_option_force1} \
        --dhcp-option-force=${dhcp_option_force2} \
        --dhcp-range=${dhcp_range2} \
        --dhcp-script=${dhcp_script}
      else
        /usr/bin/dnsmasq --conf-file=${conf_file} \
        --dhcp-leasefile=${dhcp_leasefile} \
        --addn-hosts=${addn_hosts} \
        --pid-file=${pid_file} \
        --interface=${interface} \
        --except-interface=lo \
        -z \
        --dhcp-range=${dhcp_range1} \
        --dhcp-hostsfile=${dhcp_hostsfile} \
        --dhcp-option-force=${dhcp_option_force1} \
        --dhcp-option-force=${dhcp_option_force2} \
        --dhcp-range=${dhcp_range2} \
        --dhcp-script=${dhcp_script}
      fi
    else
      if [ ${nat_enabled} -eq 0 ];then
        /usr/bin/dnsmasq --conf-file=${conf_file} \
        --dhcp-leasefile=${dhcp_leasefile} \
        --addn-hosts=${addn_hosts} \
        --pid-file=${pid_file} \
        --interface=${interface} \
        --except-interface=lo \
        -z \
        --dhcp-hostsfile=${dhcp_hostsfile} \
        --dhcp-option-force=${dhcp_option_force1} \
        --dhcp-range=${dhcp_range2} \
        --dhcp-script=${dhcp_script}
      else
        /usr/bin/dnsmasq --conf-file=${conf_file} \
        --dhcp-leasefile=${dhcp_leasefile} \
        --addn-hosts=${addn_hosts} \
        --pid-file=${pid_file} \
        --interface=${interface} \
        --except-interface=lo \
        -z \
        --dhcp-range=${dhcp_range1} \
        --dhcp-hostsfile=${dhcp_hostsfile} \
        --dhcp-option-force=${dhcp_option_force1} \
        --dhcp-range=${dhcp_range2} \
        --dhcp-script=${dhcp_script}
      fi
    fi
elif [ ${type_inst} == "dhcpv6_proxy_dns" ]  && [ ${#dhcp_range3} -ne 0 ]; then
    echo "launching dnsmasq for type dhcpv6_proxy_dns $dhcp_option_force1 $dhcp_option_force2 $dhcp_option_force3 $dhcp_option_force4" > $DUMP_TO_KMSG
    if [ ${#dhcp_option_force4} -ne 0 ];then
      /usr/bin/dnsmasq --conf-file=${conf_file} \
      --dhcp-leasefile=${dhcp_leasefile} \
      --addn-hosts=${addn_hosts} \
      --pid-file=${pid_file} \
      --interface=${interface} \
      --except-interface=lo \
      -z \
      --dhcp-range=${dhcp_range1} \
      --dhcp-hostsfile=${dhcp_hostsfile} \
      --dhcp-option-force=${dhcp_option_force1} \
      --dhcp-option-force=${dhcp_option_force2} \
      --dhcp-option-force=${dhcp_option_force3} \
      --dhcp-option-force=${dhcp_option_force4} \
      --dhcp-range=${dhcp_range2} \
      --dhcp-range=${dhcp_range3} \
      --dhcp-option=${dhcp_option} \
      --dhcp-script=${dhcp_script}
    elif [ ${#dhcp_option_force3} -ne 0 ];then
      /usr/bin/dnsmasq --conf-file=${conf_file} \
      --dhcp-leasefile=${dhcp_leasefile} \
      --addn-hosts=${addn_hosts} \
      --pid-file=${pid_file} \
      --interface=${interface} \
      --except-interface=lo \
      -z \
      --dhcp-range=${dhcp_range1} \
      --dhcp-hostsfile=${dhcp_hostsfile} \
      --dhcp-option-force=${dhcp_option_force1} \
      --dhcp-option-force=${dhcp_option_force2} \
      --dhcp-option-force=${dhcp_option_force3} \
      --dhcp-range=${dhcp_range2} \
      --dhcp-range=${dhcp_range3} \
      --dhcp-option=${dhcp_option} \
      --dhcp-script=${dhcp_script}
    elif [ ${#dhcp_option_force2} -ne 0 ];then
      /usr/bin/dnsmasq --conf-file=${conf_file} \
      --dhcp-leasefile=${dhcp_leasefile} \
      --addn-hosts=${addn_hosts} \
      --pid-file=${pid_file} \
      --interface=${interface} \
      --except-interface=lo \
      -z \
      --dhcp-range=${dhcp_range1} \
      --dhcp-hostsfile=${dhcp_hostsfile} \
      --dhcp-option-force=${dhcp_option_force1} \
      --dhcp-option-force=${dhcp_option_force2} \
      --dhcp-range=${dhcp_range2} \
      --dhcp-range=${dhcp_range3} \
      --dhcp-option=${dhcp_option} \
      --dhcp-script=${dhcp_script}
    else
      /usr/bin/dnsmasq --conf-file=${conf_file} \
      --dhcp-leasefile=${dhcp_leasefile} \
      --addn-hosts=${addn_hosts} \
      --pid-file=${pid_file} \
      --interface=${interface} \
      --except-interface=lo \
      -z \
      --dhcp-range=${dhcp_range1} \
      --dhcp-hostsfile=${dhcp_hostsfile} \
      --dhcp-option-force=${dhcp_option_force1} \
      --dhcp-range=${dhcp_range2} \
      --dhcp-range=${dhcp_range3} \
      --dhcp-option=${dhcp_option} \
      --dhcp-script=${dhcp_script}
      fi
elif [ ${type_inst} == "dhcpv6_proxy_dns" ] ; then
    echo "launching dnsmasq for type dhcpv6_proxy_dns inst" > $DUMP_TO_KMSG
    if [ ${#dhcp_range2} -eq 0 ] ; then
      echo "launching dnsmasq with only dnsv6 functionality" > $DUMP_TO_KMSG
      /usr/bin/dnsmasq --conf-file=${conf_file} \
      --dhcp-leasefile=${dhcp_leasefile} \
      --addn-hosts=${addn_hosts} \
      --pid-file=${pid_file} \
      --interface=${interface} \
      --except-interface=lo \
      -z \
      --dhcp-range=${dhcp_range1} \
      --dhcp-option=${dhcp_option} \
      --dhcp-script=${dhcp_script}
    elif [ ${#dhcp_option_force4} -ne 0 ];then
      /usr/bin/dnsmasq --conf-file=${conf_file} \
      --dhcp-leasefile=${dhcp_leasefile} \
      --addn-hosts=${addn_hosts} \
      --pid-file=${pid_file} \
      --interface=${interface} \
      --except-interface=lo \
      -z \
      --dhcp-range=${dhcp_range1} \
      --dhcp-hostsfile=${dhcp_hostsfile} \
      --dhcp-option-force=${dhcp_option_force1} \
      --dhcp-option-force=${dhcp_option_force2} \
      --dhcp-option-force=${dhcp_option_force3} \
      --dhcp-option-force=${dhcp_option_force4} \
      --dhcp-range=${dhcp_range2} \
      --dhcp-option=${dhcp_option} \
      --dhcp-script=${dhcp_script}
    elif [ ${#dhcp_option_force3} -ne 0 ];then
      /usr/bin/dnsmasq --conf-file=${conf_file} \
      --dhcp-leasefile=${dhcp_leasefile} \
      --addn-hosts=${addn_hosts} \
      --pid-file=${pid_file} \
      --interface=${interface} \
      --except-interface=lo \
      -z \
      --dhcp-range=${dhcp_range1} \
      --dhcp-hostsfile=${dhcp_hostsfile} \
      --dhcp-option-force=${dhcp_option_force1} \
      --dhcp-option-force=${dhcp_option_force2} \
      --dhcp-option-force=${dhcp_option_force3} \
      --dhcp-range=${dhcp_range2} \
      --dhcp-option=${dhcp_option} \
      --dhcp-script=${dhcp_script}
    elif [ ${#dhcp_option_force2} -ne 0 ];then
      /usr/bin/dnsmasq --conf-file=${conf_file} \
      --dhcp-leasefile=${dhcp_leasefile} \
      --addn-hosts=${addn_hosts} \
      --pid-file=${pid_file} \
      --interface=${interface} \
      --except-interface=lo \
      -z \
      --dhcp-range=${dhcp_range1} \
      --dhcp-hostsfile=${dhcp_hostsfile} \
      --dhcp-option-force=${dhcp_option_force1} \
      --dhcp-option-force=${dhcp_option_force2} \
      --dhcp-range=${dhcp_range2} \
      --dhcp-option=${dhcp_option} \
      --dhcp-script=${dhcp_script}
    else
      /usr/bin/dnsmasq --conf-file=${conf_file} \
      --dhcp-leasefile=${dhcp_leasefile} \
      --addn-hosts=${addn_hosts} \
      --pid-file=${pid_file} \
      --interface=${interface} \
      --except-interface=lo \
      -z \
      --dhcp-range=${dhcp_range1} \
      --dhcp-hostsfile=${dhcp_hostsfile} \
      --dhcp-option-force=${dhcp_option_force1} \
      --dhcp-range=${dhcp_range2} \
      --dhcp-option=${dhcp_option} \
      --dhcp-script=${dhcp_script}
    fi
elif [ ${type_inst} == "dnsv4" ]; then
    echo "launching dnsmasq for type dnsv4 inst" > $DUMP_TO_KMSG
    /usr/bin/dnsmasq --conf-file=${conf_file} \
    --dhcp-leasefile=${dhcp_leasefile} \
    --addn-hosts=${addn_hosts} \
    --pid-file=${pid_file} \
    --interface=${interface} \
    --except-interface=lo \
    -z \
    --dhcp-script=${dhcp_script}
elif [ ${type_inst} == "relay" ]; then
    /usr/bin/dnsmasq \
    --interface=${interface} \
    --except-interface=lo \
    -z \
    --dhcp-relay=${dhcp_relay} \
    --dhcp-proxy
elif [ ${type_inst} == "sta_br" ]; then
    /usr/bin/dnsmasq \
    --interface=${interface} \
    --except-interface=lo \
    -z \
    --dhcp-relay=${dhcp_relay} \
    --dhcp-proxy \
    --dhcp-leasefile=${dhcp_leasefile}
elif [ ${type_inst} == "cradle" ]; then
    /usr/bin/dnsmasq \
    --interface=${interface} \
    --except-interface=lo \
    -z \
    --dhcp-relay=${dhcp_relay} \
    --dhcp-proxy \
    --dhcp-leasefile=${dhcp_leasefile}
elif [ ${type_inst} == "ipv6_nat" ]; then
    /usr/bin/dnsmasq --conf-file=${conf_file} \
    --dhcp-leasefile=${dhcp_leasefile} \
    --addn-hosts=${addn_hosts} \
    --pid-file=${pid_file} \
    --interface=${interface} \
    --except-interface=lo \
    -z \
    --dhcp-range=${dhcp_range} \
    --dhcp-range=${dhcp_range1} \
    --dhcp-option=${dhcp_option} \
    --dhcp-option-force=${dhcp_option_force} \
    --dhcp-script=${dhcp_script}
fi
exit 0

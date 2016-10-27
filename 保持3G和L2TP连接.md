 ##保持3G和L2TP连接
 
    while [[ 1 ]];do
        /usr/bin/wvdialconf&
        sleep 5
        /usr/bin/wvdial&
        sleep 5
        route add -net 10.10.11.0 netmask 255.255.255.0 gw 10.10.11.1
        result=$(ping -c  2 -q  10.10.11.1 | grep "0 received")
        if [ -n "$result" ];then
             service xl2tpd restart
             sleep 5
             echo "c testvpn" > /run/xl2tpd/l2tp-control
        fi
        sleep 5
    done
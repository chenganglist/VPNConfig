yum install -y ppp iptables make gcc gmp-devel xmlto bison flex xmlto libpcap-devel lsof


L2TP VPN service is installed, your L2TP VPN username is vpn, VPN password is p5l0cOjR


vim /etc/xl2tpd/xl2tpd.conf 

vim /etc/ppp/peers/testvpn.l2tpd


echo 'c vpn' > /var/run/xl2tpd/l2tp-control


xl2tpd -c /etc/xl2tpd/xl2tpd.conf
运行/etc/init.d/xl2tpd start即可，这种启动方式会自动去找/etc/xl2tpd/xl2tpd.conf这个配置文件，
开始拨号：
　　# echo 'c testvpn' > /var/run/xl2tpd/l2tp-control
　　拨号成功的话，通过ifconfig可看见有个ppp0的接口
断开连接:
　　# echo 'd testvpn' > /var/run/xl2tpd/l2tp-control
启动xl2tpd到拨号，整个过程可查看日志
　　tail -f /var/log/message

/etc/3GDial.sh 
/etc/L2TPClient.sh

#!/bin/sh
wvdialconf
sleep 1
wvdial
sleep 5
xl2tpd -c /etc/xl2tpd/xl2tpd.conf
sleep 10
echo 'c testvpn' > /var/run/xl2tpd/l2tp-control

nohup /etc/3GPlusL2TP.sh &


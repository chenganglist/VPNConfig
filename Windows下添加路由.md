#Windows下添加路由

route print
route -p add 192.168.10.0 mask 255.255.255.0  192.168.10.1
route add 192.168.10.0 mask 255.255.255.0  192.168.10.1

route -p add 192.168.1.0 mask 255.255.255.0  192.168.1.1

route delete 192.168.10.0

route -p add 10.10.11.0 mask 255.255.255.0  10.10.11.1 

#Linux下添加路由

route -n
route add -net 192.168.10.0 netmask 255.255.255.0 gw 192.168.10.1

route add -net 10.10.11.0 netmask 255.255.255.0 gw 10.10.11.1

route del -host 192.168.10.0 dev eth0


ifconfig eth0.2 down;ifconfig eth0.2 hw ether 74:D4:35:F1:85:93;ifconfig eth0.2 up
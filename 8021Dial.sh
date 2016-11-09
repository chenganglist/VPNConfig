#!/bin/sh
#openwrt突破802.1x协议限制
killall wpa_supplicant 2> /dev/null
wpa_supplicant -B -D wired -i eth0.2 -c /etc/802.1x.conf
sleep 5
udhcpc -i eth0.2

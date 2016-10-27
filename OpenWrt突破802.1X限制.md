#OpenWrt突破802.1X限制
##一、安装软件wpa-supplicant和wpa-cli

	wpa-supplicant：突破协议
	wpa-cli：检测状态
	安装方式有两种：Web安装和opkg安装


##二、配置802.1X文件

	vim /etc/8021x.conf:
	ctrl_interface=/var/run/wpa_supplicant
	ap_scan=0
	network={
	    key_mgmt=IEEE8021X
	    eap=MD5
	    identity="用户名"
	    password="密码"
	    eapol_flags=0
	}


##三、设置开机启动脚本
	
	vim /etc/rc.local
	
	非Roboswitch™系列交换芯片:
		killall wpa_supplicant 2>/dev/null
		wpa_supplicant -B -D wired -i eth0.2 -c /etc/8021x.conf
		sleep 5
		udhcpc -i eth0.2

	Roboswitch™系列交换芯片:
		killall wpa_supplicant 2>/dev/null
		wpa_supplicant -i eth0.2 -D roboswitch -c /etc/8021x.conf -p multicast_only=1 -B
		sleep 5
		udhcpc -i eth0.2






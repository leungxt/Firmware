#! /bin/sh

cp -r /tmp/upload/passwall /etc/config/

cp -r /tmp/upload/adbyby /etc/config/

wget -O /root/cf.sh https://raw.githubusercontent.com/leungxt/OpenWrt-Firmware/main/cf.sh

wget -O /root/ip.txt https://raw.githubusercontent.com/leungxt/OpenWrt-Firmware/main/ip.txt

wget -O /root/CloudflareST https://github.com/leungxt/OpenWrt-Firmware/raw/main/CloudflareST

chmod +x /root/cf.sh  &&  chmod +x /root/CloudflareST

# 30 4 * * * /root/cf.sh > /dev/null 

#!/bin/sh

#停止passwall
/etc/init.d/passwall stop

sleep 2s

speed_url=https://alist.hustcn.com:8443/d/NAS/downloads/soft/test_200m.txt

./CloudflareST -sl 10 -tl 300 -tll 40 -dn 10 -url $speed_url

sleep 2s

echo "查询完毕，开始查询最快的IP"
#获取csv的第一条的IP
val1=$(sed -n '2p' result.csv )

oldIFS=$IFS
IFS=","
set -- ${val1}
anycast1="$1"
uci set passwall.b2b3a4f5ace2428dba7ff3f22cd78d6f.address=$anycast1

IFS=$oldIFS

# anycast="${array[0]}"
echo "最快的IP为：$anycast1"

#设置passwall的IP
uci commit passwall
#启动passwall
/etc/init.d/passwall restart

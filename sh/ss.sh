#!/bin/sh
apt update -y
apt install golang -y
go get github.com/shadowsocks/shadowsocks-go/cmd/shadowsocks-server
wget https://raw.githubusercontent.com/sspantz/tools/master/sh/shadowsocks-server.service
echo { > config.json
echo -n \"server\":\" >> config.json
echo -n $(/sbin/ifconfig -a|grep inet|grep -v 127.0.0.1|grep -v inet6|awk '{print $2}'|tr -d "addr:") >> config.json
echo \", >> config.json
echo \"local_address\":\"127.0.0.1\", >> config.json
echo \"port_password\": { >> config.json
echo \"8387\": \"159159!\", >> config.json
echo \"8388\": \"147147!\", >> config.json
echo \"8389\": \"123123!\" >> config.json
echo    }, >> config.json
echo \"method\": \"aes-128-cfb\", >> config.json
echo \"timeout\":600 >> config.json
echo } >> config.json
cp shadowsocks-server.service /etc/systemd/system/
systemctl enable shadowsocks-server
systemctl restart shadowsocks-server
echo "Please setting your client with the follow json file."
cat config.json
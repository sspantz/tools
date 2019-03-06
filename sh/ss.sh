#!/usr/bin/sh

apt update -y && apt upgrade -y
apt install golang -y
go get git@github.com:shadowsocks/shadowsocks-go.git
wget https://raw.githubusercontent.com/sspantz/tools/master/README.md
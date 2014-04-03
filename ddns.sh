#!/bin/sh
# Script ultra simple y crontab-friendly para actualizar no-ip.com
wget -qO- http://USER:PASSWD@dynupdate.no-ip.com/nic/update?hostname=ASDFASDF.no-ip.org&myip=$(wget -qO- http://ifconfig.me/ip) &>/dev/null

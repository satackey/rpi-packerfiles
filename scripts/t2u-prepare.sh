#!/bin/bash
set -ex

wget -O - http://ftp.tsukuba.wide.ad.jp/Linux/raspbian/raspbian
apt-get update -y && apt-get install -y build-essential bc libelf-dev raspberrypi-kernel-headers git
cd /home/pi
git clone -b v5.6.4.2 https://github.com/aircrack-ng/rtl8812au.git

#!/bin/bash
set -ex

cd /tmp

# Download and export
# wget -qO softether-vpnserver-linux-arm_eabi-32bit.tar.gz \
#     https://github.com/SoftEtherVPN/SoftEtherVPN_Stable/releases/download/v4.29-9680-rtm/softether-vpnserver-v4.29-9680-rtm-2019.02.28-linux-arm_eabi-32bit.tar.gz

# tar xf softether-vpnserver-linux-arm_eabi-32bit.tar.gz
# rm softether-vpnserver-linux-arm_eabi-32bit.tar.gz

apt-get update
apt-get install -y git gcc libc6 libpthread-stubs0-dev openssl libssl-dev libreadline6-dev libncurses5-dev
ln -s /usr/bin/make /usr/bin/gmake
git clone --depth=1 https://github.com/SoftEtherVPN/SoftEtherVPN_Stable vpnserver

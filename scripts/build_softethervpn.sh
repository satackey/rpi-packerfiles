#!/bin/bash
set -ex

cd /tmp/vpnserver

# Enable restricted functions on open source
sed -e 's/SiIsEnterpriseFunctionsRestrictedOnOpenSource(s->Cedar);/true;/' -i src/Cedar/Server.c

# Build and install
./configure
make
make install

# Install
# cd ..
# mv vpnserver /usr/local

# cd /usr/vpnserver/
# chmod 600 *
# chmod 700 vpncmd vpnserver
vpnserver
/usr/bin/vpnserver


# Register as a systemd service
# Config from https://qiita.com/kumasun/items/6fd9ddafc8ea6278f088
echo "[Unit]
Description=Softether VPN Server Service
After=network.target

[Service]
Type=forking
User=root
ExecStart=/usr/local/vpnserver/vpnserver start
ExecStop=/usr/local/vpnserver/vpnserver stop
Restart=on-abort
WorkingDirectory=/usr/local/vpnserver/
ExecStartPre=/sbin/ip link set dev eth0 promisc on

[Install]
WantedBy=multi-user.target
" > /etc/systemd/system/vpnserver.service

sudo systemctl enable vpnserver

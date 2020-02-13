#!/bin/bash
set -ex

# Delete default user "pi"
userdel pi
rm -rf /home/pi
rm -f /etc/sudoers.d/010_pi-nopasswd

# ユーザ satackey を作成
USERNAME=satackey
adduser --disabled-password --gecos "" $USERNAME
# echo "${USERNAME}:${USERNAME}" | chpasswd

# GitHub に登録された公開鍵で ssh ログインできるようにする
mkdir -p /home/${USERNAME}/.ssh
cd /home/${USERNAME}/.ssh
chown ${USERNAME} .
chmod 700 .
wget -qO authorized_keys https://github.com/${USERNAME}.keys
chown ${USERNAME} authorized_keys
chmod 600 authorized_keys

gpasswd -a ${USERNAME} sudo

echo "satackey ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/010_$USERNAME-nopasswd
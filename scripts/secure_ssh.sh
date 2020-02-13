#!/bin/bash
set -ex

# ChallengeResponseAuthentication no
# PasswordAuthentication no
# UsePAM no

sed '/ChallengeResponseAuthentication/d' -i /etc/ssh/sshd_config
sed '/PasswordAuthentication/d' -i /etc/ssh/sshd_config
sed '/UsePAM/d' -i /etc/ssh/sshd_config

echo >> /etc/ssh/sshd_config
echo "
ChallengeResponseAuthentication no
PasswordAuthentication no
UsePAM no
" >> /etc/ssh/sshd_config

systemctl enable ssh

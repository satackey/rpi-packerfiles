#!/bin/bash
set -ex

sed -i -e 's/#interface eth0/interface eth0/g'
sed -i -e 's/#static ip_address=192.168.2.1\/24/static ip_address=192.168.32.1\/24/g'

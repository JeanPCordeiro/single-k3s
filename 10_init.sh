#!/bin/bash
set -o xtrace

apt update
apt upgrade -y
apt install curl -y
apt install ca-certificates -y
apt install wireguard -y
apt install apache2-utils -y

curl -fsSL https://tailscale.com/install.sh | sh

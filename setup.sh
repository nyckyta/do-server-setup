#!/bin/bash

apt-get update

# utils
apt-get install jq net-tools

# docker install
curl -fsSL https://get.docker.com -o get-docker.sh
sh ./get-docker.sh
systemctl enable docker.service
systemctl enable containerd.service
echo '{"log-driver":"local"}' | cat > /etc/docker/daemon.json
systemctl restart docker.service
systemctl restart containerd.service

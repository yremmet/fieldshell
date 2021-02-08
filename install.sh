#!/bin/bash
set -euo pipefail
apt-get update
apt-get install -y apt-utils apt-transport-https gnupg2 curl locales

curl https://gist.githubusercontent.com/yremmet/1a77ac70b1a24cb901e28233219c5663/raw/b93d4a52be6e5572998ef1deb1f172599a68f919/output.sh -o output.sh

. ./output.sh
header "Setup Locale"
locale-gen en_US.UTF-8

header "APT INSTALL"
# Kubectl
info "adding kubectl source"
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - 
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" >> /etc/apt/sources.list.d/kubernetes.list
apt-get update
info install packages
apt-get install -y kubectl \
kafkacat \
python3-pip \
neovim \
ansible \
postgresql \
mongodb \
docker.io \
zsh \
ruby \
php

header "APT CLEAN"
apt-get clean

header "PIP"
pip3 install docker-compose \
docker \
kafka-utils \
numpy \
pandas \
jupyterlab

header "OHMYZSH"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

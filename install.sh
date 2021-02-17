#!/bin/bash
set -euo pipefail
apt-get update
apt-get install -y curl locales 
curl https://gist.github.com/yremmet/1a77ac70b1a24cb901e28233219c5663/raw -Lo /output.sh

. ./output.sh
header "Setup Locale"
locale-gen en_US.UTF-8

header "APT INSTALL"
# Kubectl
info "adding kubectl source"
apt-get install -y --no-install-recommends apt-utils apt-transport-https gnupg2
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - 
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" >> /etc/apt/sources.list.d/kubernetes.list
apt-get update
info install  packages
apt-get install -y \
ansible \
docker.io \
git \
kubectl \
kafkacat \
mongodb \
neovim \
php \
postgresql \
python3-pip \
ruby ruby-dev \
tmux \
zsh 

header "APT CLEAN"
apt-get clean

header "PIP"
pip3 install \
docker \
docker-compose \
jupyterlab \
kafka-utils \
ksql \
numpy \
pandas \

header "OHMYZSH"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

header "TMUX"
cd /root
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

header "CodeServer"
curl -fsSL https://code-server.dev/install.sh | sh -s --

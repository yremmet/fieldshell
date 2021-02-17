#!/bin/bash
sed -i "/ZSH_THEME=\"/c\ZSH_THEME=\"${THEME:-agnoster}\"" ~/.zshrc
sed -e '/plugins=(/ s/^#*/#/' -i ~/.zshrc
echo "plugins=(${PLUGINS})" >> ~/.zshrc
echo "EDITOR=\"${EDITOR:-nvim}\"" >> ~/.zshrc
mkdir -p /root/.config/code-server/

echo "
bind-addr: 0.0.0.0:8090
auth: password
password: ${CODE_SERVER_PASSWORD}
cert: true
" > /root/.config/code-server/config.yaml

sudo systemctl enable --now code-server@$USER
zsh

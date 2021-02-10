#!/bin/bash
sed -i "/ZSH_THEME=\"/c\ZSH_THEME=\"${THEME:-agnoster}\"" ~/.zshrc
sed -e '/plugins=(/ s/^#*/#/' -i ~/.zshrc
echo "plugins=(${PLUGINS})" >> ~/.zshrc
echo "EDITOR=\"${EDITOR:-nvim}\"" >> ~/.zshrc
sed -i "/password=\"/c\password: ${CODE_SERVER_PASSWORD}" ~/.config/code-server/config.yaml
code-server &
zsh

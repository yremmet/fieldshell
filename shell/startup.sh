#!/bin/bash
sed -i "/ZSH_THEME=\"/c\ZSH_THEME=\"${THEME:-agnoster}\"" ~/.zshrc
sed -e '/plugins=(/ s/^#*/#/' -i ~/.zshrc
echo "plugins=(${PLUGINS})" >> ~/.zshrc
echo "EDITOR=\"${EDITOR:-nvim}\"" >> ~/.zshrc
tmux


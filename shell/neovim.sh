#!/bin/bash
. ./output
info  "Preparing Neovim config directory ..."
mkdir -p ~/.config/nvim
#info "Pip installing venv to containerize Neovim dependencies (instead of installing them onto your system) ..."

#info "Activating virtualenv and pip installing Neovim (for Python plugin support), libraries for async autocompletion support (jedi, psutil, setproctitle)"
pip3 install neovim pyvim jedi psutil setproctitle yapf doq msgpack
info 'Downloading vim-plug, the best minimalistic vim plugin manager ...'
mkdir -o ~/.local/share/nvim/site/autoload/
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "Running :PlugInstall within nvim ..."
nvim -c ':PlugInstall' -c ':UpdateRemotePlugins' -c ':qall'

gem install neovim

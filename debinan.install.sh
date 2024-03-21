#!/bin/env bash

sudo apt install -y git gcc cargo npm python3 pip zsh lsd bat tmux xclip zsh-autosuggestions wget unzip python3-venv
wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
chmod u+x nvim.appimage && ./nvim.appimage --appimage-extract
sudo cp -r squashfs-root/usr/* /usr/
sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /usr/share/zsh-theme-powerlevel10k/
git clone --depth=1 https://gitlab.com/Neptunim_93/dotfile.git
./dotfile/install.sh 
git clone --depth=1 https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
nvim

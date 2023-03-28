#/bin/bash

sudo pacman -Syyu --needed --noconf < ./required.txt
mkdir $HOME/.config/nvim
cp -r ./lua/ $HOME/.config/nvim
cp -r ./plugin/ $HOME/.config/nvim
cp -r ./init.lua $HOME/.config/nvim
cp -r ./.zshrc $HOME

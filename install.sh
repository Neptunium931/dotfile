#/bin/bash

PWD=$(pwd)
mkdir -p $HOME/.config
ln -s $PWD/nvim $HOME/.config/nvim
ln -s $PWD/config/i3 $HOME/.config/i3
ln -s $PWD/config/polybar $HOME/.config/polybar
ln -s $PWD/config/scripts $HOME/.config/scripts
ln -s $PWD/config/systemd $HOME/.config/systemd
ln -s $PWD/config/zathura $HOME/.config/zathura
ln -s $PWD/zshrc $HOME/.zshrc
ln -s $PWD/Xresources $HOME/.Xresources
ln -s $PWD/gitconfig $HOME/.gitconfig
ln -s $PWD/gitattributes $HOME/.gitattributes
ln -s $PWD/tmux.conf $HOME/.tmux.conf

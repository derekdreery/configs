#!/bin/bash

PWD=$(pwd)

error() {
    echo >&2 " -- ERROR: $1, aborting"
    exit 1
}

check_for() {
    hash $1 >/dev/null 2>&1 || error "$1 not found"
    echo "-- $1 found"
}

echo ""
echo "Installing configuration scripts"
echo "--------------------------------"
echo ""
echo "Checking pre-requisites"
check_for "i3"
check_for "vim"
check_for "feh"
check_for "git"
check_for "lightdm"
check_for "lightdm-gtk-greeter"

echo ""
echo "Installing configuration files"
set -x
# i3
mkdir -p ~/.i3
if [ ! -e "$HOME/.i3/config" ]; then
    ln -s $PWD/i3config $HOME.i3/config
fi
# background image (feh)
mkdir -p $HOME/Pictures
if [ ! -e "$HOME/Pictures/summer_sunset.png" ]; then 
    cp $PWD/summer_sunset.png $HOME/Pictures/
fi
# vim
if [ ! -e "$HOME/.vimrc" ]; then
    ln -s $PWD/vimrc $HOME.vimrc
fi
if [ ! -e "$HOME/.vim/bundle/Vundle.vim" ]; then
    git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi
vim +PluginInstall +qall
# lightdm
if [ -e "/etc/lightdm/lightdm-gtk-greeter.conf" ]; then
    sudo rm /etc/lightdm/lightdm-gtk-greeter.conf
fi
sudo ln -s $PWD/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf
if [ -e "/etc/lightdm/lightdm.conf" ]; then
    sudo rm /etc/lightdm/lightdm.conf
fi
sudo ln -s $PWD/lightdm.conf /etc/lightdm/lightdm.conf

#!/bin/bash

PWD=$(pwd)
GRAPHICS=1

error() {
    echo >&2 " -- ERROR: $1, aborting"
    exit 1
}

error() {
    echo >&2 " -- WARN: $1, continuing"
}

check_for() {
    hash $1 >/dev/null 2>&1 || error "$1 not found"
    echo "-- $1 found"
}

check_for_graphics() {
    if hash $1 >/dev/null 2>&1; then
        warn "$1 not found, not installing graphics"
        GRAPHICS=0
    fi
    echo "-- $1 found"
}

echo ""
echo "Installing configuration scripts"
echo "--------------------------------"
echo ""
echo "Checking pre-requisites"
check_for "xrdb"
check_for "i3"
check_for "vim"
check_for "feh"
check_for "git"
check_for "lightdm"
check_for "lightdm-gtk-greeter"

echo ""
echo "Creating directories"
mkdir -p "$HOME/packages"
mkdir -p "$HOME/.zsh/zfunc"
mkdir -p "$HOME/.config/i3"

echo "Installing configuration files"
set -x

# zsh
ln -s "$PWD/addpath.zsh" "$HOME/.zsh/zfunc/addpath"

# i3
if [ ! -e "$HOME/.config/i3/config" ]; then
    ln -s "$PWD/i3config" "$HOME/config/i3/config"
fi
# background image (feh)
mkdir -p $HOME/Pictures
if [ ! -e "$HOME/Pictures/summer_sunset.png" ]; then 
    cp $PWD/summer_sunset.png $HOME/Pictures/
fi
if [ ! -e "$HOME/Pictures/summer_sunset_dark.png" ]; then 
    cp $PWD/summer_sunset_dark.png $HOME/Pictures/
fi
# vim
mkdir -p ~/.config/Xresources
wget "https://raw.githubusercontent.com/altercation/solarized/master/xresources/solarized" \
    -O ~/.config/Xresources/solarized
echo "[[ -f ~/.config/Xresources/solarized ]] && xrdb -merge -I\$HOME ~/.config/Xresources/solarized" >> $HOME/.xinitrc
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
# git
sh ./git_setup.sh
# xcwd
git clone https://github.com/schischi/xcwd $HOME/packages/xcwd
pushd $HOME/packages/xcwd
make
sudo cp ./xcwd /usr/local/bin/xcwd
popd

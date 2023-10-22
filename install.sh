#!/bin/bash

if command -v apt &>/dev/null; then
    PKG_MANAGER="apt"
elif command -v dnf &>/dev/null; then
    PKG_MANAGER="dnf"
else
    echo "No supported package manager found. Exiting."
    exit 1
fi

if [ "$PKG_MANAGER" == "apt" ]; then
    sudo apt update
    sudo apt remove vim*
    #sudo apt install -y vim-nox-py3
    sudo apt install -y git pandoc pandoc-citeproc ranger
elif [ "$PKG_MANAGER" == "dnf" ]; then
    sudo dnf -y update
    sudo dnf -y install vim-enhanced git pandoc ranger
fi

# Remaining common steps
mkdir -p ~/.vim  # -p flag ensures that the directory will be created if it doesn't exist
echo "runtime vimrc" > ~/.vimrc
git clone https://github.com/ealvar3z/vim-academic.git ~/vim-academic
cp ~/vim-academic/vimrc ~/.vim/vimrc
vim
cat ./bashrcappend >> ~/.bashrc


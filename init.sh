#!/bin/bash

vim_dir=~/.vim
autoload_dir=$vim_dir/autoload
plugged_dir=$vim_dir/plugged
plugged_conf_dir=$vim_dir/plugged.conf
my_vim=$vim_dir/myscript

nvim_parent_dir=~/.config

plug_remote=https://github.com/junegunn/vim-plug
my_vim_remote=https://github.com/Edcwsyh/My-Vimscript.git


if [ ! -d $vim_dir ]
then
    mkdir $vim_dir
fi

if [ ! -d $autoload_dir ]
then
    mkdir $autoload_dir
fi

if [ ! -d $plugged_dir ]
then
    mkdir $plugged_dir
fi

if [ -d $plugged_conf_dir ]
then
    rm -rf $plugged_conf_dir
elif [ -L $plugged_conf_dir ]
    rm $plugged_conf_dir
fi

if [ ! -d $my_vim ]
then
    mkdir $my_vim
    git clone $my_vim_remote $my_vim
fi

if [ ! -d $nvim_parent_dir ]
then
    mkdir $nvim_parent_dir
    ln -s ~/.vim $nvim_parent_dir
fi

cp ./.vimrc ~/.vimrc
cp ./coc-settings.json $vim_dir
ln -P ~/.vimrc $vim_dir/init.vim

ln -s ./plugged.conf ~/.vim/plugged.conf

if [ ! -f $autoload_dir/plug.vim ]
then
    git clone $plug_remote $plugged_dir/plug
    cp $plugged_dir/plug/plug.vim $autoload_dir
fi

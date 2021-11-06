#!/bin/bash

vim_dir=~/.vim
autoload_dir=$vim_dir/autoload
plugged_dir=$vim_dir/plugged
plugged_conf_dir=$vim_dir/plugged.conf
my_vim=$vim_dir/myscript

plug_remote=https://github.com/junegunn/vim-plug
my_vim_remote=https://github.com/Edcwsyh/My-Vimscript.git

cp ./.vimrc ~/./.vimrc

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

if [ ! -d $plugged_conf_dir ]
then
    mkdir $plugged_conf_dir
fi

if [ ! -d $my_vim ]
then
    mkdir $my_vim
    git clone $my_vim_remote $my_vim
fi

cp -r ./plugged.conf/* $plugged_conf_dir/

if [ ! -f $autoload_dir/plug.vim ]
then
    git clone $plug_remote $plugged_dir/plug
    cp $plugged_dir/plug.vim $autoload_dir
fi

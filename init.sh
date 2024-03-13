#!/bin/bash

# 获取脚本所在目录
# copy from : https://stackoverflow.com/questions/59895/how-can-i-get-the-directory-where-a-bash-script-is-located-from-within-the-scrip
function script_dir() {
        SOURCE=${BASH_SOURCE[0]}
        while [ -L "$SOURCE"   ]; do # resolve $SOURCE until the file is no longer a symlink
            DIR=$( cd -P "$( dirname "$SOURCE"   )" >/dev/null 2>&1 && pwd   )
            SOURCE=$(readlink "$SOURCE")
              [[ $SOURCE != /*   ]] && SOURCE=$DIR/$SOURCE # if $SOURCE was a relative symlink,   we need to resolve it relative to the path where the symlink file was located
            done
        echo $( cd -P "$( dirname "$SOURCE"   )" >/dev/null 2>&1 && pwd   )
}

SCRIPT_DIR=`script_dir`
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
then
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

ln -Pf ./vimrc ~/.vimrc
cp ./coc-settings.json $vim_dir
ln -Pf ~/.vimrc $vim_dir/init.vim

ln -s ${SCRIPT_DIR}/plugged.conf ~/.vim/plugged.conf

if [ ! -f $autoload_dir/plug.vim ]
then
    git clone $plug_remote $plugged_dir/plug
    cp $plugged_dir/plug/plug.vim $autoload_dir
fi

# install ycm
${SCRIPT_DIR}/ycm_manager.sh --install

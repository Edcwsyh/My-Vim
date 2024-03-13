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


if [ ! -d $vim_dir ]
then
    echo -e "\e[1;32mSuccess\e[0m : mkdir vim dir : $vim_dir";
    mkdir $vim_dir
fi

if [ ! -d $autoload_dir ]
then
    echo -e "\e[1;32mSuccess\e[0m : mkdir vim auto load dir : $autoload_dir";
    mkdir $autoload_dir
fi

if [ ! -d $plugged_dir ]
then
    echo -e "\e[1;32mSuccess\e[0m : mkdir vim plugged dir : $plugged_dir";
    mkdir $plugged_dir
fi

if [ -d $plugged_conf_dir ]
then
    echo -e "\e[1;32mSuccess\e[0m : delete plugged conf dir";
    rm -rf $plugged_conf_dir
elif [ -L $plugged_conf_dir ]
then
    echo -e "\e[1;32mSuccess\e[0m : delete plugged conf dir link";
    rm $plugged_conf_dir
fi

if [ -d $my_vim ]
then
    echo -e "\e[1;32mSuccess\e[0m : delete my vimscript dir";
    rm -rf $my_vim
elif [ -L $my_vim ]
then
    echo -e "\e[1;32mSuccess\e[0m : delete my vimscript dir link";
    rm $my_vim
fi


if [ ! -d $nvim_parent_dir ]
then
    echo -e "\e[1;32mSuccess\e[0m : mkdir nvim parent dir";
    mkdir $nvim_parent_dir
    ln -s ~/.vim $nvim_parent_dir
fi

echo -e "\e[1;32mSuccess\e[0m : link ${SCRIPT_DIR}/vimrc to ~/.vimrc";
ln -Pf ./vimrc ~/.vimrc
echo -e "\e[1;32mSuccess\e[0m : copy coc-settings.json to ${vim_dir}";
cp ./coc-settings.json $vim_dir
echo -e "\e[1;32mSuccess\e[0m : link ${SCRIPT_DIR}/vimrc to ${vim_dir}/init.vim";
ln -Pf ~/.vimrc $vim_dir/init.vim

echo -e "\e[1;32mSuccess\e[0m : link ${SCRIPT_DIR}/plugged.conf to $plugged_conf_dir";
ln -s ${SCRIPT_DIR}/plugged.conf $plugged_conf_dir
echo -e "\e[1;32mSuccess\e[0m : link ${SCRIPT_DIR}/myscript to $my_vim";
ln -s ${SCRIPT_DIR}/myscript $my_vim

if [ ! -f $autoload_dir/plug.vim ]
then
    echo -e "\e[1;32mSuccess\e[0m : init plug.vim";
    git clone $plug_remote $plugged_dir/plug
    cp $plugged_dir/plug/plug.vim $autoload_dir
fi

echo -e "\e[1;32mSuccess\e[0m : start install YouCompleteMe";
# install ycm
${SCRIPT_DIR}/ycm_manager.sh --install

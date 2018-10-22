#!/bin/bash
sudo apt install libncurses5-dev libgnome2-dev libgnomeui-dev \
libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
python3-dev ruby-dev lua5.1 liblua5.1-dev libperl-dev git
apt remove vim vim-runtime gvim
apt remove vim-tiny vim-common vim-gui-common vim-nox
cd ~
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge \
			--enable-multibyte \
			--enable-rubyinterp=yes \
			--enable-pythoninterp=yes \
			--enable-python3interp=yes \
			--with-python3-config-dir=/usr/lib/python3.5/config \
			--enable-perlinterp=yes \
			--enable-luainterp=yes \
			--enable-gui=gtk2 \
			--enable-cscope \
			--prefix=/usr/local

make VIMRUNTIMEDIR=/usr/local/share/vim/vim81
cd ~/vim
sudo make install
sudo update-alternatives --install /usr/bin/editor editor /usr/local/bin/vim 1
sudo update-alternatives --set editor /usr/local/bin/vim
sudo update-alternatives --install /usr/bin/vi vi /usr/local/bin/vim 1
sudo update-alternatives --set vi /usr/local/bin/vim

vim --version

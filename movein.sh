#!/bin/env sh

# REMOVE DEFAULT OPENBSD
echo "Removing defaults"
cd ~/
rm -rf	~/.Xdefaults
	~/.cshrc \
	~/.cvsrc \
	~/.login \
	~/.mailrc \
	~/.profile \

# COPY USER REPOSITORIES
echo "Cloning User Repositories"
git clone https://github.com/masetrax/dots
git clone https://github.com/masetrax/img
git clone https://github.com/masetrax/docs
git clone https://github.com/masetrax/etc
git clone https://github.com/masetrax/colours
echo "Complete"

# CLONING PUBLIC REPOS
echo "Cloning Repositories"
mkdir ~/.repos
cd ~/.repos
git clone https://github.com/dylanaraps/sowm
git clone https://github.com/dylanaraps/pfetch
git clone https://git.suckless.org/st
git clone https://git.suckless.org/surf
git clone https://git.suckless.org/tabbed
cd ~/
echo "Complete"

# INSTALL PACKAGES
echo "Running Package Manager"
doas pkg_add -l ~/dots/packages_OpenBSD
echo "Packages Installed"

# SET DEFAULTS
cd ~/dots/
	cp .Xresources ~/.Xresources
	cp .xsession ~/.xsession
	cp .bashrc ~/.bashrc
	cp .bash_aliases ~/.bash_aliases
	cp .vimrc ~/.vimrc
	cp .tmux.conf ~/.tmux.conf
	cp .rtorrent.rc ~/.rtorrent.rc
	cp .dunstrc ~/.dunstrc
	cp .profile ~/.profile
	cp .cwmrc ~/.cwmrc
	cp. config/ ~/.config/
        cd

# CHANGE TO BASH SHELL
chsh -s bash

echo "Move in completed. Shell will exit to record changes."

exit

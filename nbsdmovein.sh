# REMOVE DEFAULTS NETBSD
echo "Removing defaults"
cd ~/
rm -rf	~/.cshrc \
	~/.shrc \
	~/.login \
	~/.mailrc \
	~/.profile \
	~/.Xdefaults \
	~/.cvsrc

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
mkdir ~/repos
cd ~/repos
git clone https://github.com/dylanaraps/pfetch
git clone https://git.suckless.org/st
cd
echo "Complete"

# INSTALL PACKAGES
echo "Running Package Manager"
doas pkgin import ~/dots/packages_NetBSD
echo "Packages Installed"

# SET DEFAULTS
cd ~/dots/
	cp Xresources ~/.Xresources
	cp xsession ~/.xinitrc
	cp bashrc ~/.bashrc
	cp vimrc ~/.vimrc
	cp tmux.conf ~/.tmux.conf
	cp rtorrent.rc ~/.rtorrent.rc
	cp dunstrc ~/.dunstrc
	cp profile ~/.profile
	cp ctwmrc ~/.ctwmrc
        cd

# CHANGE TO BASH SHELL
chsh -s bash

echo "Move in completed. Shell will exit to record changes."

logout

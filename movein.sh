# REMOVE DEFAULT OPENBSD
echo "Removing defaults"
cd ~/
rm -rf	~/.cshrc \
	~/.logic \
	~/.mailrc \
	~/.profile \
	~/.Xdefaults \
	~/.cvsrc

# COPY REPOSITORIES
echo "Cloning User Repositories"
git clone https://github.com/masetrax/dots
git clone https://github.com/masetrax/img
git clone https://github.com/masetrax/docs
git clone https://github.com/masetrax/etc
echo "Complete"

echo "Cloning Repositories"
# COPY WM SPECIFIC REPOSITORIES
mkdir ~/.repos
git clone https://github.com/dylanaraps/sowm
git clone https://github.com/dylanaraps/pfetch
git clone https://github.com/jcs/sdorfehs
git clone https://git.suckless.org/st
cd ~/
echo "Complete"

# INSTALL PACKAGES
echo "Running Package Manager"
if [ $(uname -s) = "OpenBSD" ]; then
	doas pkg_add -l ~/dots/packages_OpenBSD
elif [ $(uname -s) = "NetBSD" ]; then
	doas pkgin import ~/dots/packages_NetBSD
else
	echo "Configure packages manually"
	exit 1
fi
echo "Packages Installed"

# SET DEFAULTS
cd ~/dots/
if [ $(uname -s) = "NetBSD" ]; then
	cp Xresources ~/.Xresources
	cp xsession ~/.xinitrc
	cp bashrc ~/.bashrc
	cp vimrc ~/.vimrc
	cp tmux.conf ~/tmux.conf
	cp ctwmrc ~/.ctwmrc
	cp rtorrent.rc ~/.rtorrent.rc
	cp dunstrc ~/.dunstrc
	cp profile ~/.profile
else
	cp Xresources ~/.Xdefaults
	cp xsession ~/.xsession
	cp bashrc ~/.bashrc
	cp vimrc ~/.vimrc
	cp tmux.conf ~/.tmux.conf
	cp rtorrent.rc ~/.rtorrent.rc
	cp dunstrc ~/.dunstrc
	cp profile ~/.profile
	cp cwmrc ~/.cwmrc
	mkdir ~/.config
	mkdir ~/.config/sdorfehs
	cp config ~/.config/sdorfehs/config
	exit 1
fi

# CLEAN UP
mv ~/bin ~/.bin
mv ~/dots ~/.dots

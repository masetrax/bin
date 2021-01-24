# REMOVE DEFAULT OPENBSD
echo "Removing defaults"
cd ~/
rm -rf	~/.cshrc \
	~.shrc \
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
echo "Complete"

# CLONING PUBLIC REPOS
echo "Cloning Repositories"
mkdir ~/.repos
cd ~/.repos
git clone https://github.com/dylanaraps/sowm
git clone https://github.com/dylanaraps/pfetch
cd ~/
echo "Complete"

# INSTALL PACKAGES
echo "Running Package Manager"
doas pkg_add -l ~/dots/packages_OpenBSD
echo "Packages Installed"

# SET DEFAULTS
cd ~/dots/
	cp Xresources ~/.Xdefaults
	cp xsession ~/.xsession
	cp bashrc ~/.bashrc
	cp vimrc ~/.vimrc
	cp tmux.conf ~/.tmux.conf
	cp rtorrent.rc ~/.rtorrent.rc
	cp dunstrc ~/.dunstrc
	cp profile ~/.profile
	cp cwmrc ~/.cwmrc

echo "Move in completed. Shell will exit to record changes."
exit

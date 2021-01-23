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
git clone https://git.suckless.org/dwm
cd ~/
echo "Complete"

# INSTALL PACKAGES
echo "Running Package Manager"
doas pkg_add -l ~/dots/packages.txt
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
mkdir ~/.config
mkdir ~/.config/sdorfehs
cp config ~/.config/sdorfehs/config

# CLEAN UP
mv ~/bin ~/.bin
mv ~/dots ~/.dots

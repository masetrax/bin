# REMOVE DEFAULT OPENBSD
echo "Removing defaults"
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
echo "Complete"

# INSTALL PACKAGES
echo "Running Package Manager"
doas pkg_add -L ~/DOTS/PAckages.txt
echo "Packages Installed"

# SET DEFAULTS
cd ~/dots/
cp Xresources ~/.Xdefaults
cp xsession ~/.xsession
cp bashrc ~/.bashrc
cp vimrc ~/.vimrc
cp tmux.conf ~/.tmux.conf
cp rtorrentrc ~/.rtorrentrc
cp dunst ~/.dunstrc
cp profile ~/.profile
cp cwmrc ~/.cwmrc
mkdir ~/.config
mkdir ~/.config/sdorfehs
cp config.conf ~/.config/sdorfehs/

# SET XENOCARA DEFAULT
#touch .xsession
#	echo "xsetroot -solid "#F3F6E3"" >> ~/.xsession
#	echo "exec sowm" >> ~/.xsession

# CLEAN UP
mv ~/bin ~/.bin
mv ~/dots ~/.dots

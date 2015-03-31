#!/bin/bash

# INSTALL BUILD TOOLS

sudo apt-get update && sudo apt-get install build essential
sudo apt-get build-dep emacs24

# download and extract
wget -c -p /tmp http://ftp.gnu.org/gnu/emacs/emacs-24.4.tar.gz
cd /tmp && tar -xf emacs-24.4.tar.* && cd emacs-24.4

# compile package
./configure
make
sudo make install

# create icon
echo '[Desktop Entry]' >> /usr/share/applications/emacs-24.desktop
echo 'Version=1.0' >> /usr/share/applications/emacs-24.desktop
echo 'Name=Emacs-24' >> /usr/share/applications/emacs-24.desktop
echo 'Exec=env UBUNTU_MENUPROXY=0 /usr/local/bin/emacs' >> /usr/share/applications/emacs-24.desktop
echo 'Terminal=false' >> /usr/share/applications/emacs-24.desktop
echo 'Icon=emacs' >> /usr/share/applications/emacs-24.desktop
echo 'Type=Application' >> /usr/share/applications/emacs-24.desktop
echo 'Categories=IDE' >> /usr/share/applications/emacs-24.desktop
echo 'X-Ayatana-Desktop-Shortcuts=NewWindow' >> /usr/share/applications/emacs-24.desktop
echo '[NewWindow Shorcut Group]' >> /usr/share/applications/emacs-24.desktop
echo 'Name=New Window' >> /usr/share/applications/emacs-24.desktop
echo 'TargetEnvironment=Unity' >> /usr/share/applications/emacs-24.desktop
echo ''
echo 'Emacs compilation and icon generation complete.'

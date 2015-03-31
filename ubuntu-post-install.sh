#!/bin/sh
# -*- Mode: sh; coding: utf-8; indent-tabs-mode: nil; tab-width: 4 -*-
#
# Authors:
# 	Sam Hewitt <hewittsamuel@gmail.com>
#
# Modified to needs by:
# 	David Harris <ir0nb8t@yahoo.co.uk>
#
# Description:
# A post-installation bash script for Ubuntu
#
# Legal Preamble:
#
# This script is free software; you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation; version 3.
#
# This script is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
# details.
#
# You should have received a copy of the GNU General Public License along with
# this program; if not, see <https://www.gnu.org/licenses/gpl-3.0.txt>

# tab width
tabs 4
clear
echo '#************************************#'
echo '#*****Ubuntu Post-Install Script*****#'
echo '#************************************#'

#----- FUNCTIONS -----#

dir="$(dirname "$0")"
. $dir/functions/cleanup
. $dir/functions/codecs
. $dir/functions/config
. $dir/functions/customize
. $dir/functions/design
. $dir/functions/development
. $dir/functions/favourites
. $dir/functions/gnome
. $dir/functions/icons
. $dir/functions/ppa
. $dir/functions/security
. $dir/functions/system
. $dir/functions/themes
. $dir/functions/upgrade
. $dir/functions/thirdparty
. $dir/functions/vpn

#----- MESSAGE FUNCTIONS -----#

show_info() {
	echo -e "\033[1;34m$@\033[0m"
}
show_success() {
	echo -e "\033[1;32m$@\033[0m"
}
show_error() {
	echo -e "\033[1;31m$@\033[m" 1>&2
}

#----- MAIN FUNCTIONS -----#

# Main
function main {
echo ''
show_info 'What would you like to do? '
echo ''
echo '1. Perform system update & upgrade?'
echo '2. Install favourite applications?'
echo '3. Install favourite system utilities?'
echo '4. Install development tools?'
echo '5. Install design tools?'
echo '6. Install extra GNOME components?'
echo '7. Install Ubuntu Restricted Extras?'
echo '8. Install third-party applications?'
echo '9. Customize system?'
echo '10. Cleanup the system?'
echo '11. Add extra PPAs and repos?'
echo '12. Install security tools?'
echo '13. Configure system?'
echo '14. Install VPN?'
echo '15. Install system themes?'
echo '16. Install system icons?'
echo 'q. Quit?'
echo ''
show_info 'Enter your choice :' && read REPLY
case $REPLY in
	1) upgrade;; # System Upgrade
	2) clear && favourites;; # Install Favourite Applications
	3) clear && system;; # Install Favourite Tools
	4) clear && development;; # Install Dev Tools
	5) clear && design;; # Install Design Tools
	6) clear && gnome;; # Install GNOME components
	7) clear && codecs;; # Install Ubuntu Restricted Extras
	8) clear && thirdparty;; # Install Third-Party Applications
	9) clear && customize;; # Customize system
	10) clear && cleanup;; # Cleanup System
	11) clear && ppa;; # add extra ppas to system
	12) clear && security;; # Install security tools
	13) clear && config;; # run config scripts
	14) clear && vpn;; # install vpn
	15) clear && themes;; # install themes from themes.list
	16) clear && icons;; # install icons from icons.list 
	[Qq]* ) echo '' && quit;; # Quit
	* ) clear && show_error '\aNot an option, try again.' && main;;
esac
}
# Quit
function quit {
read -p "Are you sure you want to quit? (Y)es, (N)o " REPLY
case $REPLY in
	[Yy]* ) exit 99;;
[Nn]* ) clear && main;;
* ) clear && show_error 'Sorry, try again.' && quit;;
esac
}
#----- RUN MAIN FUNCTION -----#
main
#END OF SCRIPT

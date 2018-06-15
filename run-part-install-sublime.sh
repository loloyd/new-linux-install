#!/bin/bash
# Install Sublime

echo "NLI: Install Sublime now? [y/n]"
read OPTION_YN
if [ "$OPTION_YN" == "Y" ] || [ "$OPTION_YN" == "y" ]; then
  # Install the GPG key:
  wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
  # Ensure apt is set up to work with https sources:
  sudo apt install apt-transport-https
  echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
  sudo apt update
  sudo apt install sublime-text
  cd ~/.config/sublime-text-3/Packages
  git clone https://github.com/SideBarEnhancements-org/SideBarEnhancements.git
  cd ~
  # read -p "Press [Enter] key to continue..."
fi

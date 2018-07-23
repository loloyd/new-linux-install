#!/bin/bash
# Install Sublime

echo ""
echo "NLI: ========================================"
read -p "NLI: Install Sublime now? [y/n] " OPTION_YN
if [ "$OPTION_YN" == "Y" ] || [ "$OPTION_YN" == "y" ]; then
  mkdir ~/Downloads/sublime
  cd ~/Downloads/sublime
  # Install the GPG key:
  wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
  # Ensure apt is set up to work with https sources:
  sudo apt install apt-transport-https
  echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
  sudo apt update
  sudo apt install sublime-text
  git clone https://github.com/SideBarEnhancements-org/SideBarEnhancements.git
  cd ~
  mv ~/Downloads/sublime/SideBarEnhancements ~/.config/sublime-text-3/Packages/.
  # read -p "Press [Enter] key to continue..."
fi

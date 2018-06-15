#!/bin/bash
# Install Atom

echo "NLI: Install Atom now? [y/n]"
read OPTION_YN
if [ "$OPTION_YN" == "Y" ] || [ "$OPTION_YN" == "y" ]; then
  mkdir ~/Downloads/atom
  cd ~/Downloads/atom
  wget https://atom.io/download/deb
  sudo gdebi deb
  cd ~
  # read -p "Press [Enter] key to continue..."
fi

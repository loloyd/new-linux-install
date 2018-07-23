#!/bin/bash
# Install Atom

echo ""
echo "NLI: ========================================"
read -p "NLI: Install Atom now? [y/n] " OPTION_YN
if [ "$OPTION_YN" == "Y" ] || [ "$OPTION_YN" == "y" ]; then
  mkdir ~/Downloads/atom
  cd ~/Downloads/atom
  wget https://atom.io/download/deb
  sudo gdebi deb
  cd ~
  # read -p "Press [Enter] key to continue..."
fi

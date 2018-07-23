#!/bin/bash
# Install Webmin

echo ""
echo "NLI: ========================================"
read -p "NLI: Install Webmin now? [y/n] " OPTION_YN
if [ "$OPTION_YN" == "Y" ] || [ "$OPTION_YN" == "y" ]; then
  echo "deb http://download.webmin.com/download/repository sarge contrib" | sudo tee /etc/apt/sources.list.d/webmin.list
  wget http://www.webmin.com/jcameron-key.asc -O - | sudo apt-key add -
  sudo apt update -y
  sudo apt install -y webmin
  echo "Access Webmin via https://localhost:10000/"
  read -p "Press [Enter] key to continue..."
fi

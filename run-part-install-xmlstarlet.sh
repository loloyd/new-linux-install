#!/bin/bash
# Install xmlstarlet

echo "NLI: Install xmlstarlet now? [y/n]"
read OPTION_YN
if [ "$OPTION_YN" == "Y" ] || [ "$OPTION_YN" == "y" ]; then
  sudo apt update -y
  sudo apt install -y xmlstarlet
fi

#!/bin/bash
# Install sshfs

echo "NLI: Install sshfs now? [y/n]"
read OPTION_YN
if [ "$OPTION_YN" == "Y" ] || [ "$OPTION_YN" == "y" ]; then
  sudo apt install sshfs
fi

#!/bin/bash
# Install sshfs

echo ""
echo "NLI: ========================================"
read -p "NLI: Install sshfs now? [y/n] " OPTION_YN
if [ "$OPTION_YN" == "Y" ] || [ "$OPTION_YN" == "y" ]; then
  sudo apt install sshfs
fi

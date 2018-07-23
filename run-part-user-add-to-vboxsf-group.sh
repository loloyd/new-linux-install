#!/bin/bash
# Add user to vboxsf group

echo ""
echo "NLI: ========================================"
read -p "NLI: Add a user to vboxsf group now? [y/n] " OPTION_YN
if [ "$OPTION_YN" == "Y" ] || [ "$OPTION_YN" == "y" ]; then
  read -p "NLI: Input the username for adding to vboxsf group: " OPTION_USERNAME
  sudo usermod -G vboxsf -a OPTION_USERNAME
fi

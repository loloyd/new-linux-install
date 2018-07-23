#!/bin/bash
# Install Apache2

echo ""
echo "NLI: ========================================"
read -p "NLI: Install Apache2 now? [y/n] " OPTION_YN
if [ "$OPTION_YN" == "Y" ] || [ "$OPTION_YN" == "y" ]; then
  sudo apt install apache2
fi

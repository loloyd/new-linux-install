#!/bin/bash
# Install Apache2

echo "NLI: Install Apache2 now? [y/n]"
read OPTION_YN
if [ "$OPTION_YN" == "Y" ] || [ "$OPTION_YN" == "y" ]; then
  sudo apt install apache2
fi

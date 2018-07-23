#!/bin/bash
# Install rfr (remove-from-recents)

echo ""
echo "NLI: ========================================"
read -p "NLI: Install rfr (remove-from-recents) now? [y/n] " OPTION_YN
if [ "$OPTION_YN" == "Y" ] || [ "$OPTION_YN" == "y" ]; then
  if [ ! -d ~/nli/projects ]; then
    mkdir ~/nli/projects
  fi
  cd ~/nli/projects
  git clone https://github.com/loloyd/remove-from-recents.git
  sudo cp ~/projects/remove-from-recents/rfr /usr/local/bin/.
  cd ~
fi

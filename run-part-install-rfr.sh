#!/bin/bash
# Install rfr (remove-from-recents)

echo "NLI: Install rfr (remove-from-recents) now? [y/n]"
read OPTION_YN
if [ "$OPTION_YN" == "Y" ] || [ "$OPTION_YN" == "y" ]; then
  if [ ! -d ~/projects ]; then
    mkdir ~/projects
  fi
  cd ~/projects
  git clone https://github.com/loloyd/remove-from-recents.git
  sudo cp ~/projects/remove-from-recents/rfr /usr/local/bin/.
  cd ~
fi

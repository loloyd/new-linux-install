#!/bin/bash
# Append favorite bindings to .bashrc

echo "NLI: Append favorite bindings to .bashrc? [y/n]"
read OPTION_YN
if [ "$OPTION_YN" == "Y" ] || [ "$OPTION_YN" == "y" ]; then
  echo "NLI: Appending favorites to .bashrc..."
  printf "#Added by 'new-linux-install'\n" >> ~/.bashrc
  printf "alias flite='flite -voice slt'\n" >> ~/.bashrc
  echo "NLI: + alias las='ls -las'"
  printf "alias las='ls -las'\n" >> ~/.bashrc
  printf "\n" >> ~/.bashrc
  echo "NLI: + bind \"TAB:menu-complete\"; bind \"set show-all-if-ambiguous on\"\n"
  printf "bind \"TAB:menu-complete\"; bind \"set show-all-if-ambiguous on\"\n" >> ~/.bashrc
fi


#!/bin/bash
# Append favorite bindings to .bash_aliases

echo "NLI: Append favorite bindings to .bash_aliases? [y/n]"
read OPTION_YN
if [ "$OPTION_YN" == "Y" ] || [ "$OPTION_YN" == "y" ]; then
  if [ ! -f ~/.bash_aliases ]; then
    touch ~/.bash_aliases
  fi
  echo "NLI: Appending favorites to .bash_aliases..."
  printf "\n# Added by 'new-linux-install'\n" >> ~/.bash_aliases
  printf "alias flite='flite -voice slt'\n" >> ~/.bash_aliases
  echo "NLI: + alias las='ls -las'"
  printf "alias las='ls -las'\n" >> ~/.bash_aliases
  printf "\n" >> ~/.bash_aliases
  echo "NLI: + alias lat='ls -lat'"
  printf "alias lat='ls -lat'\n" >> ~/.bash_aliases
  echo "NLI: + alias cls='clear'"
  printf "alias cls='clear'\n" >> ~/.bash_aliases
  echo "NLI: + alias h.='history'"
  printf "alias h.='history'\n" >> ~/.bash_aliases
  echo "NLI: + alias hf='history | grep $1'"
  printf "alias hf='history | grep $1'\n" >> ~/.bash_aliases
  echo "NLI: + alias pf='ps -e | grep $1'"
  printf "alias pf='ps -e | grep $1'\n" >> ~/.bash_aliases
  printf "\n" >> ~/.bash_aliases
  echo "NLI: + bind \"TAB:menu-complete\"; bind \"set show-all-if-ambiguous on\"\n"
  printf "bind \"TAB:menu-complete\"; bind \"set show-all-if-ambiguous on\"\n" >> ~/.bash_aliases
fi


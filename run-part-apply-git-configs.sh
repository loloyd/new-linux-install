#!/bin/bash
# Apply git configs

echo ""
echo "NLI: ========================================"
read -p "NLI: Apply git configs now? [y/n] " OPTION_YN
if [ "$OPTION_YN" == "Y" ] || [ "$OPTION_YN" == "y" ]; then
  read -p "NLI: Input the globally used email address for working with git repositories: " OPTION_EMAIL
  echo "NLI: $ git config --global user.email \"$OPTION_EMAIL\""
  git config --global user.email "$OPTION_EMAIL"
  read -p "NLI: Input the globally used username for working with git repositories: " OPTION_USERNAME
  echo "NLI: $ git config --global user.name \"$OPTION_USERNAME\""
  git config --global user.name "$OPTION_USERNAME"
fi

#!/bin/bash
# Apply custom folder tree structure

echo ""
echo "NLI: ========================================"
echo "NLI: The following folder tree has been identified as authoritative for the regular use-case"
echo "NLI: /home/user/"
echo "NLI:            .zaux/"
echo "NLI:            nli/apps/"
echo "NLI:            nli/dump/"
echo "NLI:            nli/mounts/"
echo "NLI:            nli/projects/"
echo "NLI:            nli/shared/"
echo "NLI:            nli/store/"
echo "NLI:            nli/troubleshooting/"
echo "NLI:            nli/www/"
read -p "NLI: Create the regular use-case folder structure now? [y/n] " OPTION_YN
if [ "$OPTION_YN" == "Y" ] || [ "$OPTION_YN" == "y" ]; then
  echo "NLI: + mkdir ~/.zaux"
  mkdir ~/.zaux
  echo "NLI: $ mkdir -p ~/nli/apps"
  mkdir -p ~/nli/apps
  echo "NLI: $ mkdir -p ~/nli/dump"
  mkdir -p ~/nli/dump
  echo "NLI: $ mkdir -p ~/nli/mounts"
  mkdir -p ~/nli/mounts
  echo "NLI: $ mkdir -p ~/nli/projects"
  mkdir -p ~/nli/projects
  echo "NLI: $ mkdir -p ~/nli/shared"
  mkdir -p ~/nli/shared
  echo "NLI: $ mkdir -p ~/nli/store"
  mkdir -p ~/nli/store
  echo "NLI: $ mkdir -p ~/nli/troubleshooting"
  mkdir -p ~/nli/troubleshooting
  echo "NLI: $ mkdir -p ~/nli/www"
  mkdir -p ~/nli/www
fi

# Create user home links to nli subpaths

echo ""
echo "NLI: ========================================"
read -p "NLI: Create easy access user home links to nli subpaths now? [y/n] " OPTION_YN
if [ "$OPTION_YN" == "Y" ] || [ "$OPTION_YN" == "y" ]; then
  echo "NLI: Creating easy access user home links to nli subpaths..."
  echo "NLI: $ ln -s ~/nli/apps ~/Apps"
  ln -s ~/nli/apps ~/Apps
  echo "NLI: $ ln -s ~/nli/dump ~/Dump"
  ln -s ~/nli/dump ~/Dump
  echo "NLI: $ ln -s ~/nli/mounts ~/Mounts"
  ln -s ~/nli/mounts ~/Mounts
  echo "NLI: $ ln -s ~/nli/projects ~/Projects"
  ln -s ~/nli/projects ~/Projects
  echo "NLI: $ ln -s ~/nli/shared ~/Shared"
  ln -s ~/nli/shared ~/Shared
  echo "NLI: $ ln -s ~/nli/store ~/Store"
  ln -s ~/nli/store ~/Store
  echo "NLI: $ ln -s ~/nli/troubleshooting ~/Troubleshooting"
  ln -s ~/nli/troubleshooting ~/Troubleshooting
  echo "NLI: $ ln -s ~/nli/www ~/www"
  ln -s ~/nli/www ~/www
fi

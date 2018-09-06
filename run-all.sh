#!/bin/bash
# Show welcome, introduction and offer menu

echo "NLI: LD New Linux Mint Installation (release date 201805, update 20180723)"
echo "NLI: This script is going to update this Linux Mint installation and"
echo "NLI: customize the personal profile according to the following option:"
echo "NLI: 1. Use home+office portable profile"
echo "NLI: 2. Use office profile"
echo "NLI: 3. Use home profile"
read -p "Please choose 1, 2 or 3: " OPTION_PROFILE

# Update the system

echo ""
echo "NLI: ========================================"
read -p "NLI: Update the system? [y/n] " OPTION_YN
if [ "$OPTION_YN" == "Y" ] || [ "$OPTION_YN" == "y" ]; then
  echo "NLI: Updating the system..."
  echo "NLI: $ apt update"
  sudo apt update
  echo "NLI: $ apt upgrade"
  sudo apt upgrade
fi

# Append favorite bindings to .bash_aliases
./run-part-append-favorite-bindings-to-.bash_aliases.sh

# Apply custom folder tree structure
./run-part-apply-custom-folder-tree-structure.sh

# Apply custom folder tree structure addendum
./run-part-apply-custom-folder-tree-structure-addendum.sh

# Create mount points
./run-part-create-mount-points.sh

# Create network shares mounting script
./run-part-create-network-shares-mounting-scripts.sh

# Install sshfs
./run-part-install-sshfs.sh

# Install xmlstarlet
./run-part-install-xmlstarlet.sh

# Install Atom
./run-part-install-atom.sh

# Install Sublime
./run-part-install-sublime.sh

# Install rclone
./run-part-install-rclone.sh

# Install apache2
./run-part-install-apache2.sh

# Install Webmin
./run-part-install-webmin.sh

# Install rfr (remove-from-recents)
./run-part-install-rfr.sh

# Add user to vboxsf group
./run-part-user-add-to-vboxsf-group.sh

# Apply git configs
./run-part-apply-git-configs.sh

# To be added soon - other half-baked automations

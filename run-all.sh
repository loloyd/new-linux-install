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

## Create mount points.  https://www.tldp.org/LDP/Linux-Filesystem-Hierarchy/html/mnt.html says
## /mnt should be used for local issue (device level) mounting.  Volatile network mounts can therefore be implemented
## elsewhere.

echo ""
echo "NLI: ========================================"
read -p "NLI: Create mount point folders? [y/n] " OPTION_YN
if [ "$OPTION_YN" == "Y" ] || [ "$OPTION_YN" == "y" ]; then
  echo "NLI: Creating mount point folders..."
  if [ "$OPTION_PROFILE" -eq 3 -o "$OPTION_PROFILE" -eq 1 ]; then
    echo "NLI: $ mkdir ~/nli/mounts/home-nas1-audio"
    mkdir ~/nli/mounts/home-nas1-audio    
    echo "NLI: $ mkdir ~/nli/mounts/home-nas1-photos"
    mkdir ~/nli/mounts/home-nas1-photos
    echo "NLI: $ mkdir ~/nli/mounts/home-nas1-restricted"
    mkdir ~/nli/mounts/home-nas1-restricted
    echo "NLI: $ mkdir ~/nli/mounts/home-nas1-video"
    mkdir ~/nli/mounts/home-nas1-video
    echo "NLI: $ mkdir ~/nli/mounts/ldtpe"
    mkdir ~/nli/mounts/ldtpe
  fi
  if [ "$OPTION_PROFILE" -eq 2 -o "$OPTION_PROFILE" -eq 1 ]; then
    echo "NLI: $ mkdir ~/nli/mounts/office-nas1-media"
    mkdir ~/nli/mounts/office-nas1-media
    echo "NLI: $ mkdir ~/nli/mounts/office-nas1-revault"
    mkdir ~/nli/mounts/office-nas1-revault
    echo "NLI: $ mkdir ~/nli/mounts/office-nas1-zaux"
    mkdir ~/nli/mounts/office-nas1-zaux
  fi
fi

## Create network shares mounting script

read -p "NLI: Create network shares mounting script? [y/n] " OPTION_YN
if [ "$OPTION_YN" == "Y" ] || [ "$OPTION_YN" == "y" ]; then
  echo "NLI: network shares mounting script..."
  if [ "$OPTION_PROFILE" -eq 1 -o "$OPTION_PROFILE" -eq 3 ]; then
    read -p "NLI: Input the fixed IP address of home-nas1: " OPTION_IPADDRESS
    read -p "NLI: Input the username for mounting home-nas1: " OPTION_USERNAME
    read -sp "NLI: Input the password of $OPTION_USERNAME for mounting home-nas1: " OPTION_PASSWORD
    touch ~/nli/mounts/mount-home-nas1.sh
    printf "sudo mount -t cifs //$OPTION_IPADDRESS/Audio ~/nli/mounts/home-nas1-audio -o guest,rw,uid=1000,gid=1000,nounix,iocharset=utf8,file_mode=0777,dir_mode=0777\n" >> ~/nli/mounts/mount-home-nas1.sh
    printf "sudo mount -t cifs //$OPTION_IPADDRESS/Photos ~/nli/mounts/home-nas1-photos -o guest,rw,uid=1000,gid=1000,nounix,iocharset=utf8,file_mode=0777,dir_mode=0777\n" >> ~/nli/mounts/mount-home-nas1.sh
    printf "sudo mount -t cifs //$OPTION_IPADDRESS/Restricted ~/nli/mounts/home-nas1-restricted -o rw,uid=1000,gid=1000,nounix,iocharset=utf8,file_mode=0777,dir_mode=0777,username=$OPTION_USERNAME,password=$OPTION_PASSWORD\n" >> ~/nli/mounts/mount-home-nas1.sh
    printf "sudo mount -t cifs //$OPTION_IPADDRESS/Video ~/nli/mounts/home-nas1-video -o guest,rw,uid=1000,gid=1000,nounix,iocharset=utf8,file_mode=0777,dir_mode=0777\n" >> ~/nli/mounts/mount-home-nas1.sh
    chmod a+x ~/nli/mounts/mount-home-nas1.sh
    read -p "NLI: Input the fixed IP address of ldtpe: " OPTION_IPADDRESS
    read -p "NLI: Input the username for sshfs to ldtpe: " OPTION_USERNAME
    touch ~/nli/mounts/mount-sshfs-ldtpe.sh
    printf "sshfs $OPTION_USERNAME@OPTION_IPADDRESS: ~/nli/mounts/ldtpe/" >> ~/nli/mounts/mount-sshfs-ldtpe.sh
    chmod a+x ~/nli/mounts/mount-sshfs-ldtpe.sh
  fi
    
  if [ "$OPTION_PROFILE" -eq 1 -o "$OPTION_PROFILE" -eq 2 ]; then
    read -p "NLI: Input the fixed IP address of office-nas1: " OPTION_IPADDRESS
    read -p "NLI: Input the username for mounting office-nas1: " OPTION_USERNAME
    read -sp "NLI: Input the password of $OPTION_USERNAME for mounting office-nas1: " OPTION_PASSWORD
    touch ~/nli/mounts/mount-office-nas1.sh
    printf "sudo mount -t cifs //$OPTION_IPADDRESS/media ~/nli/mounts/office-nas1-media -o username=$OPTION_USERNAME,password=$OPTION_PASSWORD,vers=2.0\n" >> ~/nli/mounts/mount-office-nas1.sh
    printf "sudo mount -t cifs //$OPTION_IPADDRESS/revault ~/nli/mounts/office-nas1-revault -o username=$OPTION_USERNAME,password=$OPTION_PASSWORD,vers=2.0\n" >> ~/nli/mounts/mount-office-nas1.sh
    printf "sudo mount -t cifs //$OPTION_IPADDRESS/zaux ~/nli/mounts/office-nas1-zaux -o username=$OPTION_USERNAME,password=$OPTION_PASSWORD,vers=2.0\n" >> ~/nli/mounts/mount-office-nas1.sh
    chmod a+x ~/nli/mounts/mount-office-nas1.sh
  fi
fi

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

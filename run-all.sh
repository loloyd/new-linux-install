#!/bin/bash
# Show welcome, introduction and offer menu

echo "NLI: LD New Linux Mint Installation (release date 201805)"
echo "NLI: This script is going to update this Linux Mint installation and"
echo "NLI: customize the personal profile according to the following option:"
echo "NLI: 1. Use home+office portable profile"
echo "NLI: 2. Use office profile"
echo "NLI: 3. Use home profile"
read OPTION_PROFILE

# Update the system

echo "NLI: Update the system? [y/n]"
read OPTION_YN
if [ "$OPTION_YN" == "Y" ] || [ "$OPTION_YN" == "y" ]; then
  echo "NLI: Updating the system..."
  echo "NLI: + apt-get update"
  sudo apt-get update
  echo "NLI: + apt-get upgrade"
  sudo apt-get upgrade
fi

# Append favorites to .bashrc

echo "NLI: Append favorite bindings to .bashrc? [y/n]"
read OPTION_YN
if [ "$OPTION_YN" == "Y" ] || [ "$OPTION_YN" == "y" ]; then
  echo "NLI: Appending favorites to .bashrc..."
  printf "#Added by 'new-linux-install'\n" >> .bashrc
  printf "alias flite='flite -voice slt'\n" >> .bashrc
  echo "NLI: + alias las='ls -las'"
  printf "alias las='ls -las'\n" >> .bashrc
  printf "\n" >> .bashrc
  echo "NLI: + bind \"TAB:menu-complete\"; bind \"set show-all-if-ambiguous on\"\n"
  printf "bind \"TAB:menu-complete\"; bind \"set show-all-if-ambiguous on\"\n" >> .bashrc
fi

# Apply custom folder tree structure
./run-part-apply-custom-folder-tree-structure.sh

# Apply custom folder tree structure addendum
./run-part-apply-custom-folder-tree-structure-addendum.sh

# Create an easy mount utility for network shares that you normally/usually use

## Create integrated path for easy mount point installation

echo "NLI: Create ~/nli/mounts folder? [y/n]"
read OPTION_YN
if [ "$OPTION_YN" == "Y" ] || [ "$OPTION_YN" == "y" ]; then
  echo "NLI: + mkdir ~/nli/mounts"
  mkdir ~/nli/mounts
fi

## Create mount points.  https://www.tldp.org/LDP/Linux-Filesystem-Hierarchy/html/mnt.html says
## /mnt should be used for local issue (device level) mounting.  Volatile network mounts can therefore be implemented
## elsewhere.

echo "NLI: Create mount point folders? [y/n]"
read OPTION_YN
if [ "$OPTION_YN" == "Y" ] || [ "$OPTION_YN" == "y" ]; then
  echo "NLI: Creating mount point folders..."
  if [ "$OPTION_PROFILE" -eq 3 -o "$OPTION_PROFILE" -eq 1 ]; then
    mkdir ~/nli/mounts/home-nas1-audio
    mkdir ~/nli/mounts/home-nas1-photos
    mkdir ~/nli/mounts/home-nas1-restricted
    mkdir ~/nli/mounts/home-nas1-video
  fi
  if [ "$OPTION_PROFILE" -eq 2 -o "$OPTION_PROFILE" -eq 1 ]; then
    mkdir ~/nli/mounts/office-nas1-media
    mkdir ~/nli/mounts/office-nas1-revault
    mkdir ~/nli/mounts/office-nas1-zaux
  fi
fi

## Create easy access linked mount points (deprecated)

#echo "NLI: Create easy access linked mount points? [y/n]"
#read OPTION_YN
#if [ "$OPTION_YN" == "Y" ] || [ "$OPTION_YN" == "y" ]; then
#  echo "NLI: Creating easy access linked mount points..."
#  if [ "$OPTION_PROFILE" -eq 1 ]; then
#    ln -s /mnt/video100 ~/nli/mounts/video100
#    ln -s /mnt/photos100 ~/nli/mounts/photos100
#    ln -s /mnt/audio100 ~/nli/mounts/audio100
#    ln -s /mnt/restricted100 ~/nli/mounts/restricted100
#  elif [ "$OPTION_PROFILE" -eq 2 ]; then
#    ln -s /mnt/ldnas138-vault ~/nli/mounts/ldnas138-vault
#    ln -s /mnt/ldnas138-media ~/nli/mounts/ldnas138-media
#    ln -s /mnt/ldnas138-zaux ~/nli/mounts/ldnas138-zaux
#  fi
#fi

## Create network shares mounting script

echo "NLI: Create network shares mounting script? [y/n]"
read OPTION_YN
if [ "$OPTION_YN" == "Y" ] || [ "$OPTION_YN" == "y" ]; then
  echo "NLI: network shares mounting script..."
  if [ "$OPTION_PROFILE" -eq 1 -o "$OPTION_PROFILE" -eq 3 ]; then
    echo "NLI: Input the fixed IP address of home-nas1:"
    read OPTION_IPADDRESS
    echo "NLI: Input the username for mounting home-nas1:"
    read OPTION_USERNAME
    echo "NLI: Input the password of $OPTION_USERNAME for mounting home-nas1:"
    read OPTION_PASSWORD
    touch ~/nli/mounts/mount-home-nas1.sh
    printf "sudo mount -t cifs //$OPTION_IPADDRESS/Audio ~/nli/mounts/home-nas1-audio -o guest,rw,uid=1000,gid=1000,nounix,iocharset=utf8,file_mode=0777,dir_mode=0777\n" >> ~/nli/mounts/mount-home-nas1.sh
    printf "sudo mount -t cifs //$OPTION_IPADDRESS/Photos ~/nli/mounts/home-nas1-photos -o guest,rw,uid=1000,gid=1000,nounix,iocharset=utf8,file_mode=0777,dir_mode=0777\n" >> ~/nli/mounts/mount-home-nas1.sh
    printf "sudo mount -t cifs //$OPTION_IPADDRESS/Restricted ~/nli/mounts/home-nas1-restricted -o rw,uid=1000,gid=1000,nounix,iocharset=utf8,file_mode=0777,dir_mode=0777,username=$OPTION_USERNAME,password=$OPTION_PASSWORD\n" >> ~/nli/mounts/mount-home-nas1.sh
    printf "sudo mount -t cifs //$OPTION_IPADDRESS/Video ~/nli/mounts/home-nas1-video -o guest,rw,uid=1000,gid=1000,nounix,iocharset=utf8,file_mode=0777,dir_mode=0777\n" >> ~/nli/mounts/mount-home-nas1.sh
    chmod a+x ~/nli/mounts/mount-home-nas1.sh
  fi
  if [ "$OPTION_PROFILE" -eq 1 -o "$OPTION_PROFILE" -eq 2 ]; then
    echo "NLI: Input the fixed IP address of office-nas1:"
    read OPTION_IPADDRESS
    echo "NLI: Input the username for mounting office-nas1:"
    read OPTION_USERNAME
    echo "NLI: Input the password of $OPTION_USERNAME for mounting office-nas1"
    read OPTION_PASSWORD
    touch ~/nli/mounts/mount-office-nas1.sh
    printf "sudo mount -t cifs //$OPTION_IPADDRESS/media ~/nli/mounts/office-nas1-media -o username=$OPTION_USERNAME,password=$OPTION_PASSWORD,vers=2.0\n" >> ~/nli/mounts/mount-office-nas1.sh
    printf "sudo mount -t cifs //$OPTION_IPADDRESS/revault ~/nli/mounts/office-nas1-revault -o username=$OPTION_USERNAME,password=$OPTION_PASSWORD,vers=2.0\n" >> ~/nli/mounts/mount-office-nas1.sh
    printf "sudo mount -t cifs //$OPTION_IPADDRESS/zaux ~/nli/mounts/office-nas1-zaux -o username=$OPTION_USERNAME,password=$OPTION_PASSWORD,vers=2.0\n" >> ~/nli/mounts/mount-office-nas1.sh
    chmod a+x ~/nli/mounts/mount-office-nas1.sh
  fi
fi

# Install rclone
./run-part-install-rclone.sh

# Install apache2
./run-part-install-apache2.sh

# To be added soon - rclone installation and other half-baked automations
#if [ "$OPTION_PROFILE" -eq 1 ]; then
#elif [ "$OPTION_PROFILE" -eq 2 ]; then
#fi


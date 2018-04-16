# Show welcome, introduction and offer menu

echo "NLI: LD New Linux Mint Installation (release date 201804)"
echo "NLI: This script is going to update this Linux Mint installation and"
echo "NLI: customize the personal profile according to the following option:"
echo "NLI: 1. Use home profile"
echo "NLI: 2. Use office profile"
read OPTION_PROFILE

# Update the system

echo "NLI: Updating the system..."
echo "NLI: + apt-get update"
sudo apt-get update
echo "NLI: + apt-get upgrade"
sudo apt-get upgrade

# Change to home directory

echo "NLI: + cd"
cd

# Append favorites to .bashrc

echo "NLI: Append favorite bindings to .bashrc? (y/n)"
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

# Create new-linux-install nli folder

echo "NLI: Create ~/nli folder? (y/n)"
read OPTION_YN
if [ "$OPTION_YN" == "Y" ] || [ "$OPTION_YN" == "y" ]; then
  echo "NLI: + mkdir ~/nli"
  mkdir ~/nli
fi

# Create an easy mount utility for network shares that you normally/usually use

## Create integrated path for easy mount point installation

echo "NLI: Create ~/nli/mounts folder? (y/n)"
read OPTION_YN
if [ "$OPTION_YN" == "Y" ] || [ "$OPTION_YN" == "y" ]; then
  echo "NLI: + mkdir ~/nli/mounts"
  mkdir ~/nli/mounts
fi

## Create mount points

echo "NLI: Create mount point folders? (y/n)"
read OPTION_YN
if [ "$OPTION_YN" == "Y" ] || [ "$OPTION_YN" == "y" ]; then
  echo "NLI: Creating mount points..."
  if [ "$OPTION_PROFILE" -eq 1 ]; then
    sudo mkdir /mnt/video100
    sudo mkdir /mnt/photos100
    sudo mkdir /mnt/audio100
    sudo mkdir /mnt/restricted100
  elif [ "$OPTION_PROFILE" -eq 2 ]; then
    sudo mkdir /mnt/ldnas138-vault
    sudo mkdir /mnt/ldnas138-media
    sudo mkdir /mnt/ldnas138-zaux
  fi
fi

## Create easy access linked mount points

echo "NLI: Create easy access linked mount points? (y/n)"
read OPTION_YN
if [ "$OPTION_YN" == "Y" ] || [ "$OPTION_YN" == "y" ]; then
  echo "NLI: Creating easy access linked mount points..."
  if [ "$OPTION_PROFILE" -eq 1 ]; then
    ln -s /mnt/video100 ~/nli/mounts/video100
    ln -s /mnt/photos100 ~/nli/mounts/photos100
    ln -s /mnt/audio100 ~/nli/mounts/audio100
    ln -s /mnt/restricted100 ~/nli/mounts/restricted100
  elif [ "$OPTION_PROFILE" -eq 2 ]; then
    ln -s /mnt/ldnas138-vault ~/nli/mounts/ldnas138-vault
    ln -s /mnt/ldnas138-media ~/nli/mounts/ldnas138-media
    ln -s /mnt/ldnas138-zaux ~/nli/mounts/ldnas138-zaux
  fi
fi

## Create network shares mounting script

echo "NLI: Create network shares mounting script? (y/n)"
read OPTION_YN
if [ "$OPTION_YN" == "Y" ] || [ "$OPTION_YN" == "y" ]; then
  echo "NLI: network shares mounting script..."
  if [ "$OPTION_PROFILE" -eq 1 ]; then
    touch ~/nli/mounts/mount100.sh
    printf "sudo mount -t cifs //192.168.1.100/Video /mnt/video100 -o guest,rw,uid=1000,gid=1000,nounix,iocharset=utf8,file_mode=0777,dir_mode=0777\n" >> ~/nli/mounts/mount100.sh
    printf "sudo mount -t cifs //192.168.1.100/Photos /mnt/photos100 -o guest,rw,uid=1000,gid=1000,nounix,iocharset=utf8,file_mode=0777,dir_mode=0777\n" >> ~/nli/mounts/mount100.sh
    printf "sudo mount -t cifs //192.168.1.100/Audio /mnt/audio100 -o guest,rw,uid=1000,gid=1000,nounix,iocharset=utf8,file_mode=0777,dir_mode=0777\n" >> ~/nli/mounts/mount100.sh
    printf "sudo mount -t cifs //192.168.1.100/Restricted /mnt/restricted100 -o rw,uid=1000,gid=1000,nounix,iocharset=utf8,file_mode=0777,dir_mode=0777,username=username,password=password\n" >> ~/nli/mounts/mount100.sh
  elif [ "$OPTION_PROFILE" -eq 2 ]; then
  fi
fi

# To be added soon - rclone installation and other half-baked automations
#if [ "$OPTION_PROFILE" -eq 1 ]; then
#elif [ "$OPTION_PROFILE" -eq 2 ]; then
#fi


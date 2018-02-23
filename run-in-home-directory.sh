# Update the system

sudo apt-get update
sudo apt-get upgrade

# Change to home directory

cd

# Append favorites to .bashrc

printf "#Added by 'new-linux-install'\n" >> .bashrc
printf "alias flite='flite -voice slt'\n" >> .bashrc
printf "alias las='ls -las'\n" >> .bashrc
printf "\n" >> .bashrc
printf "bind \"TAB:menu-complete\"; bind \"set show-all-if-ambiguous on\"\n" >> .bashrc

# Create new-linux-install nli folder

mkdir nli

# Create an easy mount utility for network shares that you normally/usually use

## Create integrated path for easy mount point installation

mkdir nli/mounts

## Create mount points

sudo mkdir /mnt/video100
sudo mkdir /mnt/photos100
sudo mkdir /mnt/audio100
sudo mkdir /mnt/restricted100

## Create easy access linked mount points

ln -s /mnt/video100 nli/mounts/video100
ln -s /mnt/photos100 nli/mounts/photos100
ln -s /mnt/audio100 nli/mounts/audio100
ln -s /mnt/restricted100 nli/mounts/restricted100

## Create network shares mounting script

touch nli/mounts/mount100.sh
printf "sudo mount -t cifs //192.168.1.100/Video /mnt/video100 -o guest,rw,uid=1000,gid=1000,nounix,iocharset=utf8,file_mode=0777,dir_mode=0777\n" >> nli/mounts/mount100.sh
printf "sudo mount -t cifs //192.168.1.100/Photos /mnt/photos100 -o guest,rw,uid=1000,gid=1000,nounix,iocharset=utf8,file_mode=0777,dir_mode=0777\n" >> nli/mounts/mount100.sh
printf "sudo mount -t cifs //192.168.1.100/Audio /mnt/audio100 -o guest,rw,uid=1000,gid=1000,nounix,iocharset=utf8,file_mode=0777,dir_mode=0777\n" >> nli/mounts/mount100.sh
printf "sudo mount -t cifs //192.168.1.100/Restricted /mnt/restricted100 -o rw,uid=1000,gid=1000,nounix,iocharset=utf8,file_mode=0777,dir_mode=0777,username=username,password=password\n" >> nli/mounts/mount100.sh

# To be added soon - rclone installation and other half-baked automations


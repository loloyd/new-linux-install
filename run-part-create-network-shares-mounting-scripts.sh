# Create network shares mounting scripts

read -p "NLI: Create network shares mounting scripts? [y/n] " OPTION_YN
if [ "$OPTION_YN" == "Y" ] || [ "$OPTION_YN" == "y" ]; then
  echo "NLI: network shares mounting script..."
  read -p "NLI: Create network shares mounting scripts for at-home use? [y/n] " OPTION_YN
  if [ "$OPTION_YN" == "Y" ] || [ "$OPTION_YN" == "y" ]; then
    read -p "NLI: Input the fixed IP address of home-nas1: " OPTION_IPADDRESS
    read -p "NLI: Input the username for mounting home-nas1: " OPTION_USERNAME
    read -sp "NLI: Input the password of $OPTION_USERNAME for mounting home-nas1: " OPTION_PASSWORD
    touch ~/nli/mounts/mount-home-nas1.sh
    printf "sudo mount -t cifs //$OPTION_IPADDRESS/Audio ~/nli/mounts/home-nas1-audio -o guest,rw,uid=1000,gid=1000,nounix,iocharset=utf8,file_mode=0777,dir_mode=0777\n" >> ~/nli/mounts/mount-home-nas1.sh
    printf "sudo mount -t cifs //$OPTION_IPADDRESS/Photos ~/nli/mounts/home-nas1-photos -o guest,rw,uid=1000,gid=1000,nounix,iocharset=utf8,file_mode=0777,dir_mode=0777\n" >> ~/nli/mounts/mount-home-nas1.sh
    printf "sudo mount -t cifs //$OPTION_IPADDRESS/Restricted ~/nli/mounts/home-nas1-restricted -o rw,uid=1000,gid=1000,nounix,iocharset=utf8,file_mode=0777,dir_mode=0777,username=$OPTION_USERNAME,password=$OPTION_PASSWORD\n" >> ~/nli/mounts/mount-home-nas1.sh
    printf "sudo mount -t cifs //$OPTION_IPADDRESS/Video ~/nli/mounts/home-nas1-video -o guest,rw,uid=1000,gid=1000,nounix,iocharset=utf8,file_mode=0777,dir_mode=0777\n" >> ~/nli/mounts/mount-home-nas1.sh
    chmod a+x ~/nli/mounts/mount-home-nas1.sh
  fi

  read -p "NLI: Create network shares mounting script for LDTPE? [y/n] " OPTION_YN
  if [ "$OPTION_YN" == "Y" ] || [ "$OPTION_YN" == "y" ]; then
    read -p "NLI: Input the fixed IP address of ldtpe: " OPTION_IPADDRESS
    read -p "NLI: Input the username for sshfs to ldtpe: " OPTION_USERNAME
    touch ~/nli/mounts/mount-sshfs-ldtpe.sh
    printf "sshfs $OPTION_USERNAME@$OPTION_IPADDRESS: ~/nli/mounts/ldtpe/\n" >> ~/nli/mounts/mount-sshfs-ldtpe.sh
    chmod a+x ~/nli/mounts/mount-sshfs-ldtpe.sh
  fi

  read -p "NLI: Create network shares mounting script for LDYoga? [y/n] " OPTION_YN
  if [ "$OPTION_YN" == "Y" ] || [ "$OPTION_YN" == "y" ]; then
    read -p "NLI: Input the fixed IP address of ldyoga: " OPTION_IPADDRESS
    read -p "NLI: Input the username for sshfs to ldyoga: " OPTION_USERNAME
    touch ~/nli/mounts/mount-sshfs-ldyoga.sh
    printf "sshfs $OPTION_USERNAME@$OPTION_IPADDRESS: ~/nli/mounts/ldyoga/\n" >> ~/nli/mounts/mount-sshfs-ldyoga.sh
    chmod a+x ~/nli/mounts/mount-sshfs-ldyoga.sh
  fi

  read -p "NLI: Create network shares mounting script for VirtualBox-as-guest use? [y/n] " OPTION_YN
  if [ "$OPTION_YN" == "Y" ] || [ "$OPTION_YN" == "y" ]; then
    read -p "NLI: Input the share name of user from host: " OPTION_SHARENAME
    echo "NLI: Creating ~/nli/mounts/mount-host-$OPTION_SHARENAME.sh"
    touch ~/nli/mounts/mount-host-$OPTION_SHARENAME.sh
    printf "sudo mount -t vboxsf $OPTION_SHARENAME ~/nli/mounts/host-$OPTION_SHARENAME\n" >> ~/nli/mounts/mount-host-$OPTION_SHARENAME.sh
    chmod a+x ~/nli/mounts/mount-host-$OPTION_SHARENAME.sh
    echo "NLI: Creating ~/nli/mounts/mount-host-Google_Drive.sh"
    touch ~/nli/mounts/mount-host-Google_Drive.sh
    printf "sudo mount -t vboxsf Google_Drive ~/nli/mounts/host-Google_Drive\n" >> ~/nli/mounts/mount-host-Google_Drive.sh
    chmod a+x ~/nli/mounts/mount-host-Google_Drive.sh
    echo "NLI: Creating ~/nli/mounts/mount-host-Drive-SQAD.sh"
    touch ~/nli/mounts/mount-host-Drive-SQAD.sh
    printf "sudo mount -t vboxsf Drive-SQAD ~/nli/mounts/host-Drive-SQAD\n" >> ~/nli/mounts/mount-host-Drive-SQAD.sh
    chmod a+x ~/nli/mounts/mount-host-Drive-SQAD.sh
    echo "NLI: Creating ~/nli/mounts/mount-host-SynologyDrive.sh"
    touch ~/nli/mounts/mount-host-SynologyDrive.sh
    printf "sudo mount -t vboxsf SynologyDrive ~/nli/mounts/host-SynologyDrive\n" >> ~/nli/mounts/mount-host-SynologyDrive.sh
    chmod a+x ~/nli/mounts/mount-host-SynologyDrive.sh
    echo "NLI: Creating ~/nli/mounts/mount-host-C_Drive.sh"
    touch ~/nli/mounts/mount-host-C_Drive.sh
    printf "sudo mount -t vboxsf C_Drive ~/nli/mounts/host-C_Drive\n" >> ~/nli/mounts/mount-host-C_Drive.sh
    chmod a+x ~/nli/mounts/mount-host-C_Drive.sh
  fi

##### if [ "$OPTION_PROFILE" -eq 1 -o "$OPTION_PROFILE" -eq 2 ]; then
  read -p "NLI: Create network shares mounting script for in-office use? [y/n] " OPTION_YN
  if [ "$OPTION_YN" == "Y" ] || [ "$OPTION_YN" == "y" ]; then
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

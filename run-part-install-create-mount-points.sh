## Create mount points.  https://www.tldp.org/LDP/Linux-Filesystem-Hierarchy/html/mnt.html says
## /mnt should be used for local issue (device level) mounting.  Volatile network mounts can therefore be implemented
## elsewhere.

echo ""
echo "NLI: ========================================"
read -p "NLI: Create mount point folders? [y/n] " OPTION_YN
if [ "$OPTION_YN" == "Y" ] || [ "$OPTION_YN" == "y" ]; then
##### if [ "$OPTION_PROFILE" -eq 2 -o "$OPTION_PROFILE" -eq 1 ]; then

  read -p "NLI: Create mount point folders for at-home use? [y/n] " OPTION_YN
  if [ "$OPTION_YN" == "Y" ] || [ "$OPTION_YN" == "y" ]; then
    echo "NLI: Creating mount point folders for at-home use..."
    echo "NLI: $ mkdir ~/nli/mounts/home-nas1-audio"
    mkdir ~/nli/mounts/home-nas1-audio
    echo "NLI: $ mkdir ~/nli/mounts/home-nas1-photos"
    mkdir ~/nli/mounts/home-nas1-photos
    echo "NLI: $ mkdir ~/nli/mounts/home-nas1-restricted"
    mkdir ~/nli/mounts/home-nas1-restricted
    echo "NLI: $ mkdir ~/nli/mounts/home-nas1-video"
    mkdir ~/nli/mounts/home-nas1-video
  fi

  read -p "NLI: Create mount point folders for in-office use? [y/n] " OPTION_YN
  if [ "$OPTION_YN" == "Y" ] || [ "$OPTION_YN" == "y" ]; then
    echo "NLI: $ mkdir ~/nli/mounts/office-nas1-media"
    mkdir ~/nli/mounts/office-nas1-media
    echo "NLI: $ mkdir ~/nli/mounts/office-nas1-revault"
    mkdir ~/nli/mounts/office-nas1-revault
    echo "NLI: $ mkdir ~/nli/mounts/office-nas1-zaux"
    mkdir ~/nli/mounts/office-nas1-zaux
  fi

  read -p "NLI: Create mount point folders for VirtualBox-as-guest use? [y/n] " OPTION_YN
  if [ "$OPTION_YN" == "Y" ] || [ "$OPTION_YN" == "y" ]; then
    read -p "NLI: Input the share name of user from host: " OPTION_SHARENAME
    echo "NLI: $ mkdir ~/nli/mounts/host-$OPTION_SHARENAME"
    mkdir ~/nli/mounts/host-$OPTION_SHARENAME
    echo "NLI: $ mkdir ~/nli/mounts/host-Google_Drive"
    mkdir ~/nli/mounts/host-Google_Drive
    echo "NLI: $ mkdir ~/nli/mounts/host-Drive-SQAD"
    mkdir ~/nli/mounts/host-Drive-SQAD
    echo "NLI: $ mkdir ~/nli/mounts/host-SynologyDrive"
    mkdir ~/nli/mounts/host-SynologyDrive
    echo "NLI: $ mkdir ~/nli/mounts/host-C_Drive"
    mkdir ~/nli/mounts/host-C_Drive
  fi

  read -p "NLI: Create mount point folder for LDTPE? [y/n] " OPTION_YN
  if [ "$OPTION_YN" == "Y" ] || [ "$OPTION_YN" == "y" ]; then
    echo "NLI: Creating mount point folders for LDTPE..."
    echo "NLI: $ mkdir ~/nli/mounts/ldtpe"
    mkdir ~/nli/mounts/ldtpe
  fi

  read -p "NLI: Create mount point folder for LDYoga? [y/n] " OPTION_YN
  if [ "$OPTION_YN" == "Y" ] || [ "$OPTION_YN" == "y" ]; then
    echo "NLI: Creating mount point folders for LDYoga..."
    echo "NLI: $ mkdir ~/nli/mounts/ldyoga"
    mkdir ~/nli/mounts/ldyoga
  fi

fi

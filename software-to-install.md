# Core

## Install from Software Manager

  Gnome-commander
  Audacious
  Audacity
  Htop
  TreeSheets
  PlayOnLinux
  DuplicateKiller https://github.com/loloyd/duplicatekiller.git
  SQLiteMan
  DB Browser for SQLite
  

## Install from own websites

  TeamViewer https://www.teamviewer.com/en/download/linux/

  flite for text-reader/dictation
  rclone

# Preferential

## Installed from new-linux-install https://github.com/loloyd/new-linux-install.git

  atom
  rclone
  rclone
  remove-from-recents (rfr)
  sshfs
  sublime
  webmin
  xmlstarlet

## Install from Software Manager

  KPatience/kpat
  Wine
  Chromium
  Chrome Remote Desktop
  drumbit (online music sequencer, pattern player and recorder)
  FreePlane (mind mapping)
  Gydl (download from Youtube)
  Inkscape
  KSimond
  KSudoku
  LMMS
  Maps
  Manual in X Window
  OpenShot Video Editor
  qBittorrent
  Sam
  Samba (? may not be needed anymore)
  Shotwell Photo Organizer
  Simon Speech Recognition and Model Manager
  Simond
  Slack
  Solitaire
  Sound Recorder
  SSC
  SSCd
  Viber
  VYM (View Your Mind mind mapping)
  VirtualBox

## Install from own websites

  Vivaldi https://vivaldi.com/download/
  Chrome https://www.google.com/chrome/

  Ultracopier

# Troubleshooting

Based on https://www.linuxmint.com/rel_tara_mate.php

## Touchpad drivers

The default touchpad driver in this edition is "libinput" (provided by the xserver-xorg-input-libinput package).

If you experience problems with it, you can switch to another driver called "synaptics" (provided by the xserver-xorg-input-synaptics package).

To know which driver is used by your input devices, run the following command:

    grep -i "Using input driver" /var/log/Xorg.0.log

When both drivers are installed, "synaptics" takes priority.

To switch to the "synaptics" driver, install it with the command:

    apt install xserver-xorg-input-synaptics

Then log out and log back in.

To go back to using "libinput", simply remove the "synaptics" driver:

    apt remove xserver-xorg-input-synaptics

Then log out and log back in.

Note: You can also try installing the "evdev" driver (provided by the xserver-xorg-input-evdev).

## Sound and microphone issues

If you're facing issues with your microphone or your sound output, please install "pavucontrol".

This will add "PulseAudio Volume Control" to your menu. This application has more configuration options than the default volume control.

## DVD Playback with VLC

If VLC does not find your DVD player, click on Media->Open Disc, and specify '/dev/sr0' as the disc device.

## Issues with KDE apps

If you're experiencing issues with KDE apps (Okular, Gwenview, KStars..etc) run the following command:

    apt install kdelibs-bin kdelibs5-data kdelibs5-plugins

# Verify, may depend on Linux Mint installation settings

  LibreOffice
  Firefox
  VLC

# Server Setup

## Install from Software Manager

  Webmin
  PHP (7)
  Apache (2.4)

  Follow guide to make PHP work with Apache from 
    http://www.ubuntugeek.com/install-apache2-with-php-7-support-in-ubuntu-16-04-server.html
  Add the following directives in /etc/apache2/sites-available/000-default.conf
IndexOptions FancyIndexing ScanHTMLTitles IconsAreLinks FoldersFirst
Alias /loloyd/ /home/loloyd/www/
<Directory /home/loloyd/www/>
    Options Indexes FollowSymLinks MultiViews
    Require all granted
</Directory>


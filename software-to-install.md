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

# Core

## Install from Software Manager

  Gnome-commander
  Audacious

## Install from own websites

  TeamViewer https://www.teamviewer.com/en/download/linux/

  flite for text-reader/dictation
  rclone

# Preferential

## Install from Software Manager

  KPatience/kpat
  Wine
  Chromium

  VirtualBox

## Install from own websites

  Vivaldi https://vivaldi.com/download/
  Chrome https://www.google.com/chrome/

  Ultracopier
  qBittorrent

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

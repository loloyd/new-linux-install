# Preferential for speeding up the machine by taking out bloat
# and sacrificial graphical visual effects

## Reference: https://sites.google.com/site/easylinuxtipsproject/3

## Software to uninstall

1. $ sudo apt-get remove xserver-xorg-video-intel

The following packages will be REMOVED:
  xserver-xorg-video-intel
0 upgraded, 0 newly installed, 1 to remove and 0 not upgraded.
After this operation, 3,251 kB disk space will be freed.

Rational: Force the use of newer video graphics driver from Linux kernel
instead of the OS-mandated backward compatibility driver

Results of $ inxi -G

Before:
Graphics:  Card: Intel Device 5a84
           Display Server: X.Org 1.18.4 drivers: intel (unloaded: fbdev,vesa)
           Resolution: 1366x768@60.02hz
           GLX Renderer: Mesa DRI Intel HD Graphics 505 (Broxton)
           GLX Version: 3.0 Mesa 17.2.8

After rebooting:
Graphics:  Card: Intel Device 5a84
           Display Server: X.Org 1.18.4 drivers: intel (unloaded: fbdev,vesa)
           Resolution: 1366x768@60.02hz
           GLX Renderer: Mesa DRI Intel HD Graphics 505 (Broxton)
           GLX Version: 3.0 Mesa 17.2.8


2. $ sudo apt-get remove compiz-core

The following packages will be REMOVED:
  compiz compiz-core compiz-gnome compiz-plugins compiz-plugins-default
  compizconfig-settings-manager libcompizconfig0 python-compizconfig
0 upgraded, 0 newly installed, 8 to remove and 0 not upgraded.
After this operation, 19.4 MB disk space will be freed.


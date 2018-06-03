#!/bin/bash
# rclone automated installation for Google Drive sync

echo "NLI: Install rclone now? [y/n]"
read OPTION_YN
if [ "$OPTION_YN" == "Y" ] || [ "$OPTION_YN" == "y" ]; then
  curl https://rclone.org/install.sh | sudo bash
fi

echo "NLI: Configure rclone now? [y/n]"
echo "NLI: Note: It is advisable to use \"gd\" as the remote name to make referencing to the remote GoogleDrive"
echo "NLI:   easier and faster.  It is OK to make two names referencing the same remote GoogleDrive,"
echo "NLI:   such as \"gd\" and \"GoogleDrive\"."
read OPTION_YN
if [ "$OPTION_YN" == "Y" ] || [ "$OPTION_YN" == "y" ]; then
  rclone config
fi

echo "NLI: Add LD easy aliases for rclone/Google Drive?"
echo "NLI: gd-lsd    List Google Drive top-level directories"
echo "NLI: gd-ncdu   Run rclone text-based navigator"
echo ""

# ===
# $ rclone copy /home/loloyd/GoogleDrive/Linux\ Mint gd:Linux\ Mint

# 1. To copy a local directory to a drive directory called backup#

#$ rclone copy /home/source <remote-name>:backup
#$ rclone copy /home/loloyd/GoogleDrive/Projects gd:Projects

#2. List directories in top level of your remote drive

#$ rclone lsd <remote-name>:
#$ rclone lsd GoogleDrive:
#$ rclone lsd gd:

#3. List all the files in your drive recursively

#$ rclone ls <remote-name>:
#$ rclone ls GoogleDrive:
#$ rclone ls gd:

#===

#rclone copy gd:PSA /home/loloyd/GoogleDrive/PSA


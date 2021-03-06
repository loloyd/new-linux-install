#!/bin/bash
# Apply custom folder tree structure addendum

echo ""
echo "NLI: ========================================"
echo "NLI: The following folder tree has been identified as addendum to the LD use-case"
echo "NLI: /home/user/"
echo "NLI:            nli/store/googledrive/"
echo "NLI:            nli/store/psa-cdr/"
echo "NLI:                              drive-sqad/"
echo "NLI:                              synologydrive/"
read -p "NLI: Create the addendum to the LD use-case folder structure now? [y/n] " OPTION_YN
if [ "$OPTION_YN" == "Y" ] || [ "$OPTION_YN" == "y" ]; then
  echo "NLI: $ mkdir -p ~/nli/store/googledrive"
  mkdir -p ~/nli/store/googledrive
  echo "NLI: $ mkdir -p ~/nli/store/psa-cdr/drive-sqad"
  mkdir -p ~/nli/store/psa-cdr/drive-sqad
  echo "NLI: $ mkdir -p ~/nli/store/psa-cdr/synologydrive"
  mkdir -p ~/nli/store/psa-cdr/synologydrive
fi

# Create user home links to nli subpaths

echo ""
echo "NLI: ========================================"
read -p "NLI: Create easy access user home links to nli subpaths addendum now? [y/n] " OPTION_YN
if [ "$OPTION_YN" == "Y" ] || [ "$OPTION_YN" == "y" ]; then
  echo "NLI: Creating easy access user home links to nli subpaths..."
  echo "NLI: $ ln -s ~/nli/store/googledrive ~/GoogleDrive"
  ln -s ~/nli/store/googledrive ~/GoogleDrive
  echo "NLI: $ ln -s ~/nli/store/psa-cdr ~/PSA-CDR"
  ln -s ~/nli/store/psa-cdr ~/PSA-CDR
  echo "NLI: $ ln -s ~/nli/store/psa-cdr/drive-sqad ~/Drive-SQAD"
  ln -s ~/nli/store/psa-cdr/drive-sqad ~/Drive-SQAD
  echo "NLI: $ ln -s ~/nli/store/psa-cdr/synologydrive ~/SynologyDrive"
  ln -s ~/nli/store/psa-cdr/synologydrive ~/SynologyDrive
fi

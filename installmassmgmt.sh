#!/bin/bash
# -----------------------------------------------------------------------------
# installmassmgmt.sh
# install the components of the massmgmt suite in the correct locations
# Last Edited: 6/1/18
# -----------------------------------------------------------------------------

# remove previous installation
if [ -e "/usr/local/massmgmt" ] ; then
    sudo rm -rf /usr/local/massmgmt
    sudo rm /usr/local/bin/massmgmt
    sudo rm /Library/LaunchDaemons/org.massmgmt.plist
fi

# set up directories
sudo mkdir /usr/local/massmgmt
sudo mkdir /usr/local/massmgmt/bin
sudo mkdir /usr/local/massmgmt/conf
sudo mkdir /usr/local/massmgmt/mconfig
sudo mkdir /usr/local/massmgmt/lib

# move components into place
cd /tmp/massmgmt

sudo cp massmgmt /usr/local/massmgmt/

copyLoc="/usr/local/massmgmt/bin"

sudo cp autoUpdate $copyLoc
sudo cp adobeReader $copyLoc
sudo cp checkChrome.py $copyLoc
sudo cp chrome $copyLoc
sudo cp firefox $copyLoc
sudo cp enableSSH $copyLoc
sudo cp enableARD $copyLoc
sudo cp lockSysPrefs $copyLoc
sudo cp munki $copyLoc
sudo cp powerOptions $copyLoc
sudo cp setFirewall $copyLoc
sudo cp setHostname $copyLoc
sudo cp setTimezone $copyLoc
sudo cp sus $copyLoc

sudo cp com.google.Chrome.plist /usr/local/massmgmt/conf
sudo cp massmgmt.config /usr/local/massmgmt

sudo cp massmgmtlib.sh /usr/local/massmgmt/lib

sudo cp org.massmgmt.plist /Library/LaunchDaemons

sudo mkdir /usr/local/bin

sudo ln -s '/usr/local/massmgmt/massmgmt' '/usr/local/bin/'

# chown

configFile="/usr/local/massmgmt/massmgmt.config"
adminUser="$(cat $configFile | awk '/AdminUserID/ {print $2}')"

sudo chown -R $adminUser /usr/local/massmgmt

# chmod
chmod 755 /usr/local/massmgmt
cd /usr/local/massmgmt/bin
chmod 755 autoUpdate
chmod 755 adobeReader
chmod 755 chrome
chmod 755 firefox
chmod 755 enableSSH
chmod 755 enableARD
chmod 755 lockSysPrefs
chmod 755 munki
chmod 755 powerOptions
chmod 755 setFirewall
chmod 755 setHostname
chmod 755 setTimezone
chmod 755 sus
chmod 755 checkChrome.py

chmod 755 /usr/local/massmgmt/lib/massmgmtlib.sh

if [ -e "/usr/local/massmgmt/massmgmt.config" ] ; then
    exit 0
else
    exit 1
fi
# -----------------------------------------------------------------------------

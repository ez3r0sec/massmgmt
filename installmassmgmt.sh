#!/bin/bash
# -----------------------------------------------------------------------------
# installmassmgmt.sh
# install the components of the massmgmt suite in the correct locations
# Last Edited: 6/16/18
# -----------------------------------------------------------------------------

# remove previous installation
if [ -e "/usr/local/massmgmt" ] ; then
    rm -rf /usr/local/massmgmt
    rm /usr/local/bin/massmgmt
    rm /Library/LaunchDaemons/org.massmgmt.plist
fi

# set up directories
mkdir /usr/local/massmgmt
mkdir /usr/local/massmgmt/bin
mkdir /usr/local/massmgmt/conf
mkdir /usr/local/massmgmt/mconfig
mkdir /usr/local/massmgmt/lib

# move components into place
cd /tmp/massmgmt

cp massmgmt /usr/local/massmgmt/

copyLoc="/usr/local/massmgmt/bin"

cp autoUpdate $copyLoc
cp adobeReader $copyLoc
cp checkChrome $copyLoc
cp chrome $copyLoc
cp firefox $copyLoc
cp enableSSH $copyLoc
cp enableARD $copyLoc
cp lockSysPrefs $copyLoc
cp munki $copyLoc
cp powerOptions $copyLoc
cp setFirewall $copyLoc
cp setHostname $copyLoc
cp setTimezone $copyLoc
cp sus $copyLoc

cp com.google.Chrome.plist /usr/local/massmgmt/conf
cp massmgmt.config /usr/local/massmgmt

cp massmgmtlib.sh /usr/local/massmgmt/lib

cp org.massmgmt.plist /Library/LaunchDaemons

mkdir /usr/local/bin

ln -s '/usr/local/massmgmt/massmgmt' '/usr/local/bin/'

# chown

configFile="/usr/local/massmgmt/massmgmt.config"
adminUser="$(cat $configFile | awk '/AdminUserID/ {print $2}')"

chown -R $adminUser /usr/local/massmgmt

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
chmod 755 checkChrome

chmod 755 /usr/local/massmgmt/lib/massmgmtlib.sh

if [ -e "/usr/local/massmgmt/massmgmt.config" ] ; then
    exit 0
else
    exit 1
fi
# -----------------------------------------------------------------------------

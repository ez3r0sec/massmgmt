#!/bin/bash
# -----------------------------------------------------------------------------
# configureMassmgmt.sh
# Tool to generate configuration files for the massmgmt suite
# Last Edited: 8/29/17
# -----------------------------------------------------------------------------
# variables
buildFile="/tmp/massmgmt.config"


###### Header Block
echo "#######################################################################################" >> "$buildFile"
echo "# massmgmt configuration file                                                         #" >> "$buildFile"
echo "# colon-delimited key-value pairs to read with awk                                    #" >> "$buildFile"
echo "# consult the help.txt for information about the values to set                        #" >> "$buildFile"
echo "#######################################################################################" >> "$buildFile"
echo >> "$buildFile"

###### File Locations
echo "# file locations" >> "$buildFile"
echo "ScriptLocation: /usr/local/massmgmt/bin" >> "$buildFile"
echo "PlistLocation: /usr/local/massmgmt/conf" >> "$buildFile"
echo "MobileConfigLocation: /usr/local/massmgmt/mconfig" >> "$buildFile"
echo "HelpPage: /usr/local/massmgmt/help.txt" >> "$buildFile"
echo "LogFile: /usr/local/massmgmt/massmgmt.log" >> "$buildFile"

###### Admin User
printf "What is the local admininstrator user id number (ex. 501) -> "
read A

echo >> "$buildFile"
echo "# users" >> "$buildFile"
echo "AdminUserID: $A" >> "$buildFile"

###### Script Options
echo >> "$buildFile"
echo "####################### script options ################################################" >> "$buildFile"
echo "# autoUpdate" >> "$buildFile"

printf "Enable automatic update checking (Enable, Disable) -> "
read B
echo "AutomaticCheck: $B" >> "$buildFile"

printf "Enable automatic app updates (Enable, Disable) -> "
read C
echo "AppUpdate: $C" >> "$buildFile"

printf "Enable automatic macOS updates (Enable, Disable) -> "
read D
echo "MacOSUpdate: $D" >> "$buildFile"

printf "Enable automatic download of updates (Enable, Disable) -> "
read E
echo "AutomaticDownload: $E" >> "$buildFile"

printf "Enable automatic installion of critical security updates and system data files *recommended to enable* (Enable, Disable) -> "
read F
echo "AutomaticCheck: $F" >> "$buildFile"

# -----------------------------------------------------------------------------

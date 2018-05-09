#!/bin/bash
# -----------------------------------------------------------------------------
#                                massmgmtlib.sh
#                           bash library for massmgmt
#                             Last Edited: 4/24/18
# -----------------------------------------------------------------------------
# massmgmt variables
### files
configFile="/usr/local/massmgmt/massmgmt.config"
logFile="$(cat $configFile | awk '/LogFile/ {print $2}')"
### user information
adminUserID="$(cat $configFile | awk '/AdminUserID/ {print $2}')"
adminUser="$(dscl . list /Users UniqueID | grep $adminUserID | awk '{print $1}')"
### system information
starDate="$(date)"
hostName="$(hostname)"
### log entry
logStart="$starDate $hostName"
# -----------------------------------------------------------------------------

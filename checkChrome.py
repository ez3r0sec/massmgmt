#!/usr/bin/python
# ------------------------------------------------------------------------------
# checkChrome.py (Python 2.7)
# Check if chrome is installed/up to date and install if not installed or out of date
# Last Edited: 3/13/18
# ------------------------------------------------------------------------------
# import libraries
import json
import urllib2
import os.path
import plistlib
# variables --------------------------------------------------------------------
url = 'http://omahaproxy.appspot.com/all.json'
osPath = "/Applications/Google Chrome.app"
# ------------------------------------------------------------------------------
if os.path.exists(osPath) is True:
    resp = urllib2.urlopen(url)
    data = json.loads(resp.read())
    for each in data:
        if each.get("os") == "mac":
            versions = each.get("versions")
            for version in versions:
                if version.get("channel") == "stable":
                    latest = (version.get("current_version"))           
    # plist variables for comparison - if Chrome is not in /Applications, the script will create the update file
    plistloc = "/Applications/Google Chrome.app/Contents/Info.plist"
    pl = plistlib.readPlist(plistloc)
    pver = pl["CFBundleShortVersionString"]
    if latest == pver:
        exit
    else:
        file = open("/tmp/updateChrome.txt","w") 
        file.write("Please update chrome") 
        exit
else:
    file = open("/tmp/updateChrome.txt","w") 
    file.write("Please update chrome") 
    exit
exit
#-------------------------------------------------------------------------------

# massmgmt
Version 2.1.4                                                           
Last Edited: 10/30/18                                                                                            

# Purpose
The massmgmt suite came about as an attempt to automate configuration and patch management
on macOS laptops stored in shared-use carts and desktops in computer labs without requiring a 
central server or system to manage endpoints. Massmgmt can be used in combination with Munki
to extend your management capabilities. The main advantage of massmgmt over other systems is
that it is extremely lightweight and if the desired configuration of endpoints does not
frequently change, endpoints can maintain their configuration without intervention, which 
allows technicians to more efficiently spend their time.

# Description
The massmgmt suite uses a series of bash and python scripts to maintain a desired 
state configuration on macOS endpoints. Massmgmt is configured to run on startup
at a defined interval using a launch daemon (org.massmgmt.plist). Because the 
suite is built on multiple scripts, it is modular and easy for system administrators to 
maintain. The storage directory for the suite of scripts is /usr/local/massmgmt/bin.
In addition to these scripts there are plans for endpoint log analysis and security
modules.

The first step of each script checks if the setting is enabled and if the 
configuration matches the desired state defined in the configuration file
/usr/local/massmgmt/massmgmt.config. Editing the configuration file and
redistributing it to endpoints is the most simple means of altering the desired
state of managed machines.

If the desired state already exists no action must be taken and the script will 
exit and the next script will run. If the setting does not match the desired 
state, the script will correct the discrepancy. Typically, any files that are 
generated by massmgmt will be placed in /tmp unless they are meant to to be used 
later. Persistant and installable plist files will be stored within 
/usr/local/massmgmt/conf.

The massmgmt tool has logging built into the scripts that are included. The
log file is located by default at /usr/local/massmgmt/massmgmt.log. The log may 
also be flushed by entering the command:

<code>massmgmt flushLog</code>

Logs may also be retrieved to the desktop directory of the current user with:

massmgmt pullLog</code>

Massmgmt can also be called so that admins can interactively call individual scripts
by entering the command:

<code>massmgmt -im</code>

This command enters “interactive mode” and is logged as such for auditing interactions.
Massmgmt may also be run in its entirety by an admin or root user by entering:

<code>massmgmt</code>

Massmgmt also supports installing and removing configuration profiles. Profiles should
be stored in /usr/local/massmgmt/mconfig so they could be installed whenever the desired
state is not in place. The administrator can interactively install profiles using the
following command:

<code>massmgmt installProfiles</code>

For especially restrictive profiles, a profile removal command is available during
troubleshooting:

<code>massmgmt rmProfiles</code>

# Requirements

All that is required on the client devices for massmgmt before installation is a local account 
with administrator privileges to run massmgmt scripts. No web servers are 
necessary. For maximum flexibility, massmgmt can be paired with Munki so that configurations
can be changed at will or massmgmt can be updated.

# Installation Directions

The easiest way to customize massmgmt for an environment is to download the zip file
from the project page, edit the configuration file with a text editor, and package it
with Packages.app from Whitebox or PackageMaker.app from Apple using installmassmgmt.sh
as a post-install script. The installmassmgmt.sh script relies on using /tmp/massmgmt
as the target directory in the package.

Happy Configuring!

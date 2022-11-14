# Adobe Creative Cloud

## App

### Installation

#### Homebrew

```sh
brew install --cask adobe-creative-cloud
```

### Tips

#### Disable Core Sync

1. Open System Preferences -> Extensions
2. Added Extensions -> Uncheck Core Sync Finder Extensions
3. Activity Monitor -> Search Core Sync -> Stop Process

<!-- ####

```sh
#
export LOGGED_IN_USER=$(stat -f %Su /dev/console)
export LOGGED_IN_USER_ID=$(id -u "$LOGGED_IN_USER")
export BUNDLE_IDENTIFIER_PREFIX='com.adobe'

#
launchctl print system
launchctl print user/"$LOGGED_IN_USER_ID"
launchctl print gui/"$LOGGED_IN_USER_ID"

#
launchctl unload -w ~/Library/LaunchAgents/com.adobe.ccxprocess.plist
launchctl unload -w ~/Library/LaunchAgents/com.adobe.GC.Invoker-1.0.plist
launchctl unload -w /Library/LaunchAgents/com.adobe.AdobeCreativeCloud.plist
launchctl unload -w /Library/LaunchAgents/com.adobe.GC.AGM.plist
launchctl unload -w /Library/LaunchAgents/com.adobe.GC.Invoker-1.0.plist
launchctl unload -w /Library/LaunchDaemons/com.adobe.agsservice.plist
launchctl unload -w /Library/LaunchDaemons/com.adobe.acc.installer.v2.plist

launchctl stop com.adobe.AdobeCreativeCloud
launchctl stop com.adobe.GC.AGM
launchctl stop com.adobe.CCXProcess.6464
launchctl stop com.adobe.CCLibrary.6544
launchctl stop com.adobe.ccxprocess
launchctl stop com.adobe.accmac.28188
launchctl stop com.adobe.GC.Scheduler-1.0
launchctl stop com.adobe.accmac.6452
launchctl stop com.adobe.LightroomClassicCC7.30440

killall "AdobeRCDaemon"
killall "Adobe CCXProcess.app"
killall "Adobe Desktop Service"
killall "Adobe Installer"
killall "AdobeCRDaemon"
killall "AdobeIPCBroker"
killall "CCLibrary"
killall "CCXProcess"
killall "Core Sync"
killall "Core Sync Helper"

#
launchctl list | egrep -i "$BUNDLE_IDENTIFIER_PREFIX"

#
sudo launchctl bootout gui/"$loggedInUserID" /Library/LaunchAgents/"$BUNDLE_IDENTIFIER_PREFIX".*.plist
sudo launchctl bootout system /Library/LaunchAgents/"$BUNDLE_IDENTIFIER_PREFIX".*.plist

#
ls -A1 /Library/{LaunchDaemons,LaunchAgents}/"$BUNDLE_IDENTIFIER_PREFIX".*.plist

#
sudo launchctl unload -w /Library/LaunchDaemons/"$BUNDLE_IDENTIFIER_PREFIX".*.plist
launchctl unload -w /Library/LaunchDaemons/"$BUNDLE_IDENTIFIER_PREFIX".*.plist
``` -->

<!--
#
sudo launchctl unload -w /Library/{LaunchAgents,LaunchDaemons}/"$BUNDLE_IDENTIFIER_PREFIX"*.plist
sudo launchctl unload -w {,~}/Library/LaunchAgents/"$BUNDLE_IDENTIFIER_PREFIX"*.plist
-->

### Issues

#### Full Disk Access

```log
Error: Unable to remove some files. Please enable Full Disk Access for your terminal under System Preferences → Security & Privacy → Privacy → Full Disk Access.
```

```sh
brew install adobe-creative-cloud --force
```

### Uninstall

#### Homebrew

```sh
brew uninstall --cask adobe-creative-cloud
```

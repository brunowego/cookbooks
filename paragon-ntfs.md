# Paragon NTFS

## App

### Installation

#### DMG

```sh
#
wget http://dl.paragon-software.com/demo/ntfsmac15_trial.dmg && \
  hdiutil attach ntfsmac15_trial.dmg -nobrowse -mountpoint /Volumes/Paragon-NTFS

#
open /Volumes/Paragon-NTFS/FSInstaller.app

#
hdiutil detach /Volumes/Paragon-NTFS && \
  rm ./ntfsmac15_trial.dmg
```
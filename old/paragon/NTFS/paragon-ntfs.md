# Paragon NTFS

## Installation

### DMG

```sh
wget http://dl.paragon-software.com/demo/ntfsmac15_trial.dmg && hdiutil attach ntfsmac15_trial.dmg -nobrowse -mountpoint /Volumes/Paragon-NTFS
```

```sh
open /Volumes/Paragon-NTFS/FSInstaller.app
```

```sh
hdiutil detach /Volumes/Paragon-NTFS && rm ./ntfsmac15_trial.dmg
```

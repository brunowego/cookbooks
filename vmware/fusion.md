# VMware Fusion

## App

### Installation

#### Homebrew

```sh
# Version 8
brew install homebrew/cask-versions/vmware-fusion8

# Last Version
brew install --cask vmware-fusion
```

### Tips

#### Remove menu bar icon

1. Preferences...
2. General
3. Applications Menu:
4. Show in menu bar:
5. Never

### Issues

#### Could not open `/dev/vmmon`

```log
Could not open /dev/vmmon: No such file or directory.
```

1. System Preferences
2. Security & Privacy
3. General
4. System software developer "VMware, Inc." was blocked from loading.
5. Allow

<!-- #### TBD

```log
Unable to retrieve kernel symbols.
```

#### TBD

```log
Failed to initialize monitor device.
``` -->

#### Keyboard and Mouse not Working

1. System Preferences
2. Security & Privacy
3. Privacy
4. Accessibility
5. VMware Fusion

<!-- ####

```log
Unable to retrieve kernel zone sizes.
Failed to initialize monitor device.
```

TODO -->

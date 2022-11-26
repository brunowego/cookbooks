# Bootable USB

## Installation

```sh
#
ls /Volumes

# Mojave
sudo /Applications/Install\ macOS\ Mojave.app/Contents/Resources/createinstallmedia \
  --volume /Volumes/<MyVolume>

# Catalina
sudo /Applications/Install\ macOS\ Catalina.app/Contents/Resources/createinstallmedia \
  --volume /Volumes/<MyVolume>

# Ventura
sudo /Applications/Install\ macOS\ Ventura.app/Contents/Resources/createinstallmedia \
  --volume /Volumes/<MyVolume>
```

Reboot and press Option (⌥).

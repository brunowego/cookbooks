# macOS Format

## Disable Activation Lock

Remove your device from "Find My".

## Make Bootable USB

```sh
#
ls /Volumes

# Ventura
sudo /Applications/Install\ macOS\ Ventura.app/Contents/Resources/createinstallmedia --help

sudo /Applications/Install\ macOS\ Ventura.app/Contents/Resources/createinstallmedia \
  --volume /Volumes/<MyVolume> \
  --nointeraction \
  --downloadassets
```

Reboot and press Option (⌥).

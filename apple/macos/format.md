# macOS Format

1. Disable Activation Lock: Remove your device from [Find My](https://icloud.com/find).
2. Make Bootable USB

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

3. Reboot and press Option (⌥).

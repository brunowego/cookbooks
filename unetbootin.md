# UNetbootin

## App

### Installation

#### Homebrew

```sh
brew install --cask unetbootin
```

<!--
https://www.wdiaz.org/how-to-create-a-bootable-windows-usb/
-->

### Docs

#### Windows

1. Open "Disk Utility"
2. Select the desired external drive
3. Click in "Erase"
   - Name: `WININSTALL`
   - Format: `ExFAT`
   - Scheme: Master Boot Record
4. Open UNetbootin
   - UNetbootin needs permissions to write to your USB drive. Type your password to allow this.
   - Type your password
5. Check "Diskimage"
   - Select "ISO"
   - Choose `WinXX_x64.iso` file
6. Type "USB Drive"
   - Select correct drive
   - Ok

### Uninstall

```sh
# Homebrew
brew uninstall --cask unetbootin
```

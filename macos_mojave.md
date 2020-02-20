# macOS Mojave

## ISO

```sh
hdiutil attach /Applications/Install\ macOS\ Mojave.app/Contents/SharedSupport/InstallESD.dmg -noverify -mountpoint /Volumes/mojave
hdiutil create -o ./MojaveBase.cdr -size 7316m -layout SPUD -fs HFS+J
hdiutil attach ./MojaveBase.cdr.dmg -noverify -mountpoint /Volumes/install_build
asr restore -source /Applications/Install\ macOS\ Mojave.app/Contents/SharedSupport/BaseSystem.dmg -target /Volumes/install_build -noprompt -noverify -erase
rm -rf /Volumes/macOS\ Base\ System/System/Installation/Packages
mkdir -p /Volumes/macOS\ Base\ System/System/Installation/Packages
cp -R /Volumes/mojave/Packages/* /Volumes/macOS\ Base\ System/System/Installation/Packages/
```

```sh
hdiutil detach /Volumes/macOS\ Base\ System
hdiutil detach /Volumes/mojave
```

```sh
mv ./MojaveBase.cdr.dmg ./BaseSystem.dmg
```

```sh
hdiutil create -o ./Mojave.cdr -size 8965m -layout SPUD -fs HFS+J
hdiutil attach ./Mojave.cdr.dmg -noverify -mountpoint /Volumes/install_build
asr restore -source /Applications/Install\ macOS\ Mojave.app/Contents/SharedSupport/BaseSystem.dmg -target /Volumes/install_build -noprompt -noverify -erase
cp ./BaseSystem.dmg /Volumes/macOS\ Base\ System/
rm ./BaseSystem.dmg
```

```sh
hdiutil detach /Volumes/macOS\ Base\ System
hdiutil convert ./Mojave.cdr.dmg -format UDTO -o ./Mojave.iso
```

```sh
rm ./Mojave.cdr.dmg
mv ./Mojave.iso.cdr ~/Desktop/Mojave.iso
```

## VirtualBox

```sh
export VBOX_NAME='macOS Mojave'

VBoxManage createvm \
  --name "$VBOX_NAME" \
  --ostype 'MacOS_64' \
  --register

VBoxManage modifyvm "$VBOX_NAME" \
  --chipset 'ich9' \
  --cpuidset 00000001 000306a9 00020800 80000201 178bfbff \
  --cpus 4 \
  --memory 8192 \
  --vram 128 \
  --accelerate3d on \
  --rtcuseutc on \
  --firmware 'efi' \
  --audioout on \
  --hpet on \
  --usb on \
  --usbxhci on \
  --usbehci on \
  --usbxhci off \
  --clipboard bidirectional \
  --draganddrop bidirectional \
  --audiocontroller 'hda' \
  --mouse 'usbtablet' \
  --keyboard 'usb' \
  --mouse 'usbtablet'

VBoxManage storagectl "$VBOX_NAME" \
  --name 'SATA' \
  --add sata \
  --controller 'IntelAHCI'

VBoxManage createhd \
  --filename "$HOME/VirtualBox VMs/$VBOX_NAME/$VBOX_NAME.vdi" \
  --size 40960 \
  --variant 'Standard'

VBoxManage storageattach "$VBOX_NAME" \
  --storagectl 'SATA' \
  --port 0 \
  --device 0 \
  --type hdd \
  --medium "$HOME/VirtualBox VMs/$VBOX_NAME/$VBOX_NAME.vdi"

VBoxManage storageattach "$VBOX_NAME" \
  --storagectl 'SATA' \
  --port 1 \
  --device 0 \
  --type 'dvddrive' \
  --medium 'emptydrive'

VBoxManage setextradata "$VBOX_NAME" 'VBoxInternal/Devices/efi/0/Config/DmiSystemProduct' 'MacBookPro11,3'
VBoxManage setextradata "$VBOX_NAME" 'VBoxInternal/Devices/efi/0/Config/DmiSystemVersion' '1.0'
VBoxManage setextradata "$VBOX_NAME" 'VBoxInternal/Devices/efi/0/Config/DmiBoardProduct' 'Mac-2BD1B31983FE1663'
VBoxManage setextradata "$VBOX_NAME" 'VBoxInternal/Devices/smc/0/Config/DeviceKey' 'ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc'
VBoxManage setextradata "$VBOX_NAME" 'VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC' 1
VBoxManage setextradata "$VBOX_NAME" 'VBoxInternal2/EfiGraphicsResolution' '1920x1080'

VBoxManage showvminfo "$VBOX_NAME"
```

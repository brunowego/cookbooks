# Xcode

<!--
https://medium.com/@marksiu/how-to-build-ios-project-with-command-82f20fda5ec5

https://blog.process-one.net/using-a-local-development-trusted-ca-on-macos/

https://github.com/jjfernandes87/comitando-prototype-to-prodction
-->

## Links

- [Main Website](https://developer.apple.com/xcode/)
- [Apple ID](https://appleid.apple.com/)

## CLI

### Installation

```sh
xcode-select --install
```

## App

### References

- [More Downloads for Apple Developers](https://developer.apple.com/download/more/?name=Xcode)
- [Building from the Command Line with Xcode FAQ](https://developer.apple.com/library/archive/technotes/tn2339/_index.html)

### Installation

#### MAS

```sh
mas install 497799835
```

#### XIP

- [Xcode 10.3](https://developer.apple.com/services-account/download?path=/Developer_Tools/Xcode_10.3/Xcode_10.3.xip)

### Configuration

```sh
#
sudo xcode-select -s /Applications/Xcode.app/Contents/Developer

#
sudo xcodebuild -runFirstLaunch

#
sudo xcodebuild -license accept
```

### Commands

```sh
xcodebuild -help
xcrun -h
```

### Usage

```sh
#
xcodebuild -showsdks

#
xcodebuild -version
# or
pkgutil --pkg-info=com.apple.pkg.CLTools_Executables | grep version

# Open Workspace
open -a /Applications/Xcode.app <workspace-name>.xcworkspace

# Open Project
open -a /Applications/Xcode.app <workspace-name>.xcodeproj
# or
open <workspace-name>.xcodeproj

#
xcodebuild -list

xcodebuild \
  -list \
  -workspace <workspace-name>.xcworkspace

xcodebuild \
  -list \
  -project <project-name>.xcodeproj

#
xcrun instruments -s

#
xcodebuild clean \
  -workspace <project-name>.xcworkspace \
  -scheme <scheme-name>

xcodebuild clean \
  -project <project-name>.xcodeproj \
  -scheme <scheme-name>

#
xcodebuild \
  -resolvePackageDependencies \
  -workspace <project-name>.xcworkspace \
  -scheme <scheme-name>

#
xcodebuild build \
  -workspace <project-name>.xcworkspace \
  -scheme <scheme-name>

#
xcodebuild archive \
  -workspace <project-name>.xcworkspace \
  -scheme <scheme-name> \
  -archivePath ~/Downloads/<file-name>.xcarchive

#
xcodebuild \
  -exportArchive \
  -archivePath ~/Downloads/<file-name>.scarchive \
  -exportPath ~/Downloads \
  -exportOptionsPlist ~/Downloads/ExportOptions.plist

#
xcodebuild \
  -target <target-name> \
  -xcconfig <configuration-file>.xcconfig
```

### Tips

#### Visual Studio Code

```sh
#
code --install-extension mariomatheu.syntax-project-pbxproj

#
jq '."recommendations" += ["mariomatheu.syntax-project-pbxproj"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

#### Download Manual Profiles

1. Xcode -> Preferences...
2. Accounts Tab
3. Select Apple ID -> Download Manual Profiles

#### Switch Version

```sh
# Current Path
xcode-select -p

#
sudo xcode-select -switch <path/to/>Xcode.app
```

#### Old Version

1. Access [More Downloads for Apple Developers](https://developer.apple.com/download/more/)
2. Search for version Xcode 11.5 -> Download Zip File
3. Move `Xcode.app` to `/Applications/Xcode11.5.app`
4. Run `sudo xcode-select -s /Applications/Xcode11.5.app`
5. Verify using `xcodebuild -version` and `xcode-select -p`

#### Apple ID

1. Start Xcode
2. Select Xcode > Preferences...
3. Select Accounts
4. Add Apple ID -> Continue

<!-- ####

https://stackoverflow.com/questions/3648764/editing-the-iphone-simulator-hosts-file -->

<!-- ####

1. Open Keychain Access
2. Select Keychain Access -> Certificate Assistant -> Request a Certificate From a Certificate Authority...
3.

https://ioscodesigning.com/generating-code-signing-files/ -->

<!-- #### iOS Development Certificate

```sh
open ios/Runner.xcworkspace
``` -->

### Issues

#### Tool `xcodebuild` Requires Xcode

```log
xcode-select: error: tool 'xcodebuild' requires Xcode, but active developer directory '/Library/Developer/CommandLineTools' is a command line tools instance
```

```sh
sudo xcode-select -s /Applications/Xcode.app/Contents/Developer
```

#### Agreeing License

```log
Agreeing to the Xcode/iOS license requires admin privileges, please re-run as root via sudo.
```

```sh
sudo xcodebuild -license
```

Or open Xcode and accept the terms.

<!-- ####

```log
error: No profiles for 'xxx.xxx.xxx.xxx.xxx' were found: Xcode couldn't find any iOS App Development provisioning profiles matching 'xxx.xxx.xxx.xxx.xxx'. Automatic signing is disabled and unable to generate a profile. To enable automatic signing, pass -allowProvisioningUpdates to xcodebuild. (in target 'xxx-xxx-xxx')
```

TODO -->

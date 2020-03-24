# Xcode

<!--
https://medium.com/@marksiu/how-to-build-ios-project-with-command-82f20fda5ec5

https://blog.process-one.net/using-a-local-development-trusted-ca-on-macos/
-->

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

### Commands

```sh
xcodebuild -help
xcrun -h
```

### Usage

```sh
# Switch Version
sudo xcode-select -switch <path/to/>Xcode.app

# Current Path
xcode-select --print-path

# Open Workspace
open -a /Applications/Xcode.app <your_workspace_name>.xcworkspace

# Open Project
open -a /Applications/Xcode.app <your_workspace_name>.xcodeproj

#
xcodebuild -list

# xcodebuild \
#   -list \
#   -workspace <your_workspace_name>.xcworkspace

# xcodebuild \
#   -list \
#   -project <your_project_name>.xcodeproj

#
xcrun instruments -s

#
xcodebuild clean \
  -workspace <your_project_name>.xcworkspace \
  -scheme <your_scheme_name>

xcodebuild clean \
  -project <your_project_name>.xcodeproj \
  -scheme <your_scheme_name>

#
xcodebuild build \
  -workspace <your_project_name>.xcworkspace \
  -scheme <your_scheme_name>

#
xcodebuild archive \
  -workspace <your_project_name>.xcworkspace \
  -scheme <your_scheme_name> \
  -archivePath ~/Downloads/<your_file_name>.xcarchive

#
xcodebuild \
  -exportArchive \
  -archivePath ~/Downloads/<your_file_name>.scarchive \
  -exportPath ~/Downloads \
  -exportOptionsPlist ~/Downloads/ExportOptions.plist

#
xcodebuild \
  -target <your_target_name> \
  -xcconfig <your_configuration_file>.xcconfig
```

### Tips

#### Apple ID

1. Start Xcode
2. Select Xcode > Preferences...
3. Select Accounts
3. Add Apple ID -> Continue

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

#### Agreeing License

```log
Agreeing to the Xcode/iOS license requires admin privileges, please re-run as root via sudo.
```

```sh
sudo xcodebuild -license
```

Or open Xcode and accept the terms.

#### Tool `xcodebuild` Requires Xcode

```log
xcode-select: error: tool 'xcodebuild' requires Xcode, but active developer directory '/Library/Developer/CommandLineTools' is a command line tools instance
```

```sh
sudo xcode-select -s /Applications/Xcode.app/Contents/Developer
```

<!-- ####

```log
error: No profiles for 'xxx.xxx.xxx.xxx.xxx' were found: Xcode couldn't find any iOS App Development provisioning profiles matching 'xxx.xxx.xxx.xxx.xxx'. Automatic signing is disabled and unable to generate a profile. To enable automatic signing, pass -allowProvisioningUpdates to xcodebuild. (in target 'xxx-xxx-xxx')
```

TODO -->

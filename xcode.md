# Xcode

## App

### Installation

#### MAS

```sh
mas install 497799835
```

### Usage

```sh
# Open Project
open -a Xcode *.xcodeproj
open -a Xcode *.xcworkspace
```

### Tips

<!-- ####

1. Start Xcode
2. Select Xcode > Preferences...
3. Select Accounts
3. Add Apple ID... -->

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

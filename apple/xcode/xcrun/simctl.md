# xcrun simctl

## CLI

### Commands

```sh
xcrun simctl help
```

### Configuration

```sh
xcrun simctl
```

### Usage

```sh
#
xcrun simctl list

#
xcrun simctl runtime add <./path/to/runtime.dmg>
# or
xcodebuild -downloadPlatform <platform>
xcodebuild -downloadPlatform iOS # watchos, tvos
# or
xcodebuild -downloadAllPlatforms

#
xcrun simctl list devicetypes
xcrun simctl list runtimes

#
xcrun simctl create <name> <devicetype-id> <runtime-id>
# iPhone
xcrun simctl create 'iPhone 11 Pro Max' 'com.apple.CoreSimulator.SimDeviceType.iPhone-11-Pro-Max' 'com.apple.CoreSimulator.SimRuntime.iOS-17-2'
# iPad
xcrun simctl create 'iPad Air (3rd generation)' 'com.apple.CoreSimulator.SimDeviceType.iPad-Air--3rd-generation-' 'com.apple.CoreSimulator.SimRuntime.iOS-17-2'

#
xcrun simctl list devices 'iPhone 11 Pro Max'

#
export SIMULATOR_UDID="$(xcrun simctl getenv booted SIMULATOR_UDID)"
# or, specify the device name
export SIMULATOR_UDID="$(xcrun simctl getenv 'iPhone 11 Pro Max' SIMULATOR_UDID)"
export SIMULATOR_UDID="$(xcrun simctl getenv 'iPad Air (3rd generation)' SIMULATOR_UDID)"

#
xcrun simctl boot "$SIMULATOR_UDID"

#
xcrun simctl list | grep Booted

#
# xcrun simctl launch booted -AppleLanguages '(pt-BR)' -AppleLocale 'pt_BR'

#
open -a simulator

#
xcrun simctl shutdown "$SIMULATOR_UDID"

#
xcrun simctl erase "$SIMULATOR_UDID"
```

### Issues

#### Missing `simctl`

```log
xcrun: error: unable to find utility "simctl", not a developer tool or in PATH
```

```sh
#
sudo xcode-select -s /Applications/Xcode.app

#
xcrun simctl help
```

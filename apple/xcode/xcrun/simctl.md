# xcrun simctl

<!--
https://suelan.github.io/2020/02/05/iOS-Simulator-from-the-Command-Line/
-->

## CLI

### Commands

```sh
xcrun simctl help
```

### Usage

```sh
#
xcrun simctl list
xcrun simctl list | grep Booted

#
xcrun simctl list devices 'iPhone 11 Pro Max'

#
xcrun simctl create <name> <device-type-id> <runtime-id>
xcrun simctl create 'iPhone 11 Pro Max' 'com.apple.CoreSimulator.SimDeviceType.iPhone-11-Pro-Max' 'com.apple.CoreSimulator.SimRuntime.iOS-16-1'

#
export SIMULATOR_UDID="$(xcrun simctl getenv booted SIMULATOR_UDID)"

#
open -a simulator

#
xcrun simctl shutdown "$SIMULATOR_UDID"

#
xcrun simctl boot "$SIMULATOR_UDID"

#
xcrun simctl erase "$SIMULATOR_UDID"
```

<!--
xcrun simctl install booted ./demo.app
xcrun simctl launch <device> <bundle> <arguments>.
-->

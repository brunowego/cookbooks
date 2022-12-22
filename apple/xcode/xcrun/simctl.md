# xcrun simctl

## CLI

### Commands

```sh
xcrun simctl help
```

### Devices

#### List

```sh
#
xcrun simctl list
xcrun simctl list | grep Booted

#
xcrun simctl list devices 'iPhone 11 Pro Max'
```

#### Create

```sh
#
xcrun simctl create <name> <device-type-id> <runtime-id>
# Example
xcrun simctl create 'iPhone 11 Pro Max' 'com.apple.CoreSimulator.SimDeviceType.iPhone-11-Pro-Max' 'com.apple.CoreSimulator.SimRuntime.iOS-16-2'
```

#### Boot

```sh
#
export SIMULATOR_UDID="$(xcrun simctl getenv booted SIMULATOR_UDID)"
# or, specify the device name
export SIMULATOR_UDID="$(xcrun simctl getenv 'iPhone 11 Pro Max' SIMULATOR_UDID)"

#
xcrun simctl boot "$SIMULATOR_UDID"

#
open -a simulator
```

<!--
xcrun simctl install booted ./demo.app
xcrun simctl launch <device> <bundle> <arguments>
-->

#### Cleanup

```sh
#
xcrun simctl shutdown "$SIMULATOR_UDID"

#
xcrun simctl erase "$SIMULATOR_UDID"
```

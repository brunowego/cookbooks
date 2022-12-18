# objection

**Keywords:** Mobile Exploration

## Links

- [Code Repository](https://github.com/sensepost/objection)

## CLI

### Installation

#### pip

```sh
pip3 install -U objection
```

### Commands

```sh
objection --help
```

### Usage

```sh
#
objection -g <package-identifier> explore
```

#### Explore

<!--
https://book.hacktricks.xyz/mobile-pentesting/android-app-pentesting/frida-tutorial/objection-tutorial
-->

```sh
#
env

#
android shell_exec whoami

#
android ui screenshot /tmp/screenshot

#
memory list modules
memory list exports libssl.so
memory list exports libart.so --json libart.json

#
android hooking list activities
android hooking list services
android hooking list receivers
android hooking list classes
android hooking search classes <class>
android hooking get current_activity

#
jobs list
jobs kill <job-id>
```

<!--
android root disable
android root simulate

android hooking search methods getRequestParams
android hooking list class_methods <classname>
android hooking generate simple <classname>
android hooking watch class <classname>
android hooking watch class_method <classname>.getRequestParams --dump-args --dump-return --dump-backtrace
android hooking watch class_method <classname>.$init --dump-args

android heap search instances <classname>
android heap execute 0x2526 getRequestParams

android intent launch_activity com.autonavi.map.activity.NewMapActivity
-->

### Issues

#### Missing Instance of Running Frida Server

```log
Unable to connect to the frida server: need Gadget to attach on jailed Android; its default location is: ~/.cache/frida/gadget-android-arm64.so
```

Run [Frida Server](/ssl/ssl-pinning/android.md#run-frida-server).

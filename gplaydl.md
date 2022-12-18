# gplaydl

<!--
https://myaccount.google.com/lesssecureapps
https://accounts.google.com/DisplayUnlockCaptcha
https://myaccount.google.com/apppasswords
-->

**Keywords:** APK Downloader

## Links

- [Code Repository](https://github.com/rehmatworks/gplaydl)

## CLI

<!-- **Notes:** Tested on Python3 version 3.8.14. -->

**WIP:** Currently not working as expected.

### Installation

#### Homebrew

```sh
pip3 install -U gplaydl==1.3.5
```

### Commands

```sh
gplaydl -h
```

### Configuration

```sh
gplaydl configure
```

### Usage

```sh
#
gplaydl download \
  --packageId com.twitter.android \
  --path ./.android/apk/downloads
```

<!--
gplaydl download --packageId com.teslacoilsw.launcher
gplaydl download --packageId com.spotify.music
gplaydl download --packageId au.com.shiftyjelly.pocketcasts
-->

### Issues

#### TBD

```log
'server says: BadAuthentication'
```

TODO

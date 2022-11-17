# GooglePlay

<!--
https://myaccount.google.com/lesssecureapps
https://accounts.google.com/DisplayUnlockCaptcha
https://myaccount.google.com/apppasswords
-->

**Keywords:** APK Downloader

## Links

- [Code Repository](https://github.com/89z/googleplay)

## CLI

### Installation

#### go get

```sh
GOBIN=/usr/local/bin go install github.com/89z/googleplay/cmd/googleplay@latest
```

### Commands

```sh
googleplay
```

### Configuration

```sh
#
googleplay -email <email> -password <password>
```

### Usage

```sh
#
googleplay -device

#
googleplay -a com.google.android.youtube

#
googleplay \
  -a com.google.android.youtube \
  -purchase

#
googleplay \
  -a com.google.android.youtube \
  -v 1532614080
```

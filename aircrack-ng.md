# Aircrack-ng

## Installation

### Homebrew

```sh
brew install aircrack-ng
```

## Configuration

### OS X

```sh
sudo ln -s $(brew --prefix aircrack-ng)/bin/aircrack-ng /usr/local/bin/aircrack-ng
```

```sh
sudo ln -s /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport /usr/local/bin/airport
```

## Usage

```sh
sudo airport -s
```

```sh
sudo airport -z
ifconfig
```

```sh
airport [interface] sniff [channel]
```

```sh
ls /tmp/airportSniff*.cap
```

```sh
aircrack-ng -1 -a 1 -b [BSSID] [capfile] -w [wordlist]
```

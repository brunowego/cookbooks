# Firefox

## App

### References

- [Releases FTP](https://ftp.mozilla.org/pub/firefox/releases/)

### Installation

#### Homebrew

```sh
brew cask install firefox
```

### Docs

#### Screenshot

1. Page actions
2. Take a Screenshot -> Save full page

### Uninstall

#### APT

```sh
sudo apt --purge -y autoremove firefox

rm -fR ~/.mozilla/firefox ~/.cache/mozilla/firefox
sudo rm -fR /etc/firefox /usr/lib/firefox /usr/lib/firefox-addons
```

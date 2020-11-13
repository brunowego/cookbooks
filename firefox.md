# Firefox

## Extensions

- [Proxy Switcher and Manager](https://addons.mozilla.org/en-US/firefox/addon/proxy-switcher-and-manager/)
- [Temporary Containers](https://addons.mozilla.org/en-US/firefox/addon/temporary-containers/)
- [Language Switch](https://addons.mozilla.org/en-US/firefox/addon/languageswitch/)

## App

### References

- [Releases FTP](https://ftp.mozilla.org/pub/firefox/releases/)

### Installation

#### Homebrew

```sh
brew cask install --appdir='/Applications' firefox
```

### Docs

#### Certificates

1. Preferences
2. Privacy & Security
3. Security -> Certificates -> View Certificates...
4. Authorities Tab -> Import

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

## CLI

### Configuration

```sh
# Darwin
ln -s '/Applications/Firefox.app/Contents/MacOS/firefox' '/usr/local/bin/firefox'
```

### Commands

```sh
firefox -ProfileManager
```

### Usage

```sh
#
firefox --setDefaultBrowser

#
firefox [url]

#
firefox --new-window [url]

#
firefox --private-window

#
firefox --search [text]

#
firefox --safe-mode

#
firefox --headless --screenshot {{path/to/output_file.png}} {{https://example.com/}}

#
firefox --profile {{path/to/directory}} {{https://example.com/}}
```

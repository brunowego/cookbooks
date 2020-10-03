# Firefox Developer Edition

## App

### References

- [Uninstall Firefox](/firefox.md#uninstall)

### Installation

#### Homebrew

```sh
brew tap homebrew/cask-versions
brew cask install --appdir='/Applications' firefox-developer-edition
```

#### Linux

```sh
#
wget -O - https://ftp.mozilla.org/pub/devedition/releases/72.0b3/linux-x86_64/en-US/firefox-72.0b3.tar.bz2 | \
  sudo tar -xjC /usr/local --transform s/firefox/firefox-dev/

# Ubuntu
cat << EOF > ~/Desktop/Firefox\ Developer.desktop
[Desktop Entry]
Name=Firefox Developer
GenericName=Firefox Developer Edition
Exec=/usr/local/firefox-dev/firefox %u
Terminal=false
Icon=/usr/local/firefox-dev/browser/chrome/icons/default/default128.png
Type=Application
Categories=Application;Network;X-Developer;
Comment=Firefox Developer Edition Web Browser.
EOF
```

#### Chocolatey

```sh
choco install -y firefox-dev
```

### Issues

#### Proxy

Bypass external proxies for the following hosts:

```txt
*.mozilla.net
```

### Docs

#### Refresh Firefox

1. Type `about:support` on search area
2. Give Firefox Developer Edition a tune up
3. Refresh Firefox Developer Edition…

## CLI

### Configuration

```sh
ln -s '/Applications/Firefox Developer Edition.app/Contents/MacOS/firefox' '/usr/local/bin/firefox'
```

### Usage

Same as [Firefox](/firefox.md#usage)

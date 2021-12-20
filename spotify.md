# Spotify

## Links

- [Main Website](https://spotify.com/)
- [Developer / Dashboard / Applications](https://developer.spotify.com/dashboard/applications)

## App

### Installation

#### Homebrew

```sh
brew install --cask spotify
```

#### APT

```sh
sudo apt update
sudo apt -y install spotify-client
```

#### Chocolatey

```sh
choco install -y spotify
```

### Tips

#### Homebrew

##### Hide Dock Icon

```sh
vim /Applications/Spotify.app/Contents/Info.plist
```

Add before last `</dict>`:

```plist
<key>LSUIElement</key>
<true/>
```

### Issues

#### Proxy

Bypass external proxies for the following hosts:

```txt
*.spotify.com
```

### Uninstall

#### Homebrew

```sh
brew uninstall --cask spotify
```

```sh
rm -fR ~/Library/Application\ Support/Spotify
```

# Charles

## App

### Installation

#### Homebrew

```sh
brew cask install charles
```

#### APT

```sh
echo 'deb https://www.charlesproxy.com/packages/apt/ charles-proxy main' | \
  sudo tee /etc/apt/sources.list.d/charles.list

curl -fsSL https://www.charlesproxy.com/packages/apt/PublicKey | \
  sudo apt-key add -
```

```sh
sudo apt update
sudo apt -y install charles-proxy
```

#### YUM

```sh
cat << EOF | sudo tee /etc/yum.repos.d/charles.repo
[charlesproxy]
name=Charles Proxy Repository
baseurl=https://www.charlesproxy.com/packages/yum
gpgkey=https://www.charlesproxy.com/packages/yum/PublicKey
EOF
```

```sh
yum check-update
sudo yum -y install charles-proxy
```

### Features

#### SSL Proxying

TODO

### Tips

#### Add CLI

```sh
# Darwin
ln -s /Applications/Charles.app/Contents/MacOS/Charles /usr/local/bin/charles
```

#### Darwin Dock

```sh
# hidden
/usr/libexec/PlistBuddy -c 'Add :LSUIElement bool true' /Applications/Charles.app/Contents/Info.plist

# show
/usr/libexec/PlistBuddy -c 'Delete :LSUIElement' /Applications/Charles.app/Contents/Info.plist
```

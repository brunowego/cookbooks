# Charles

## App

### Installation

#### Homebrew

```sh
brew install --cask charles
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

yum check-update
sudo yum -y install charles-proxy
```

### Tips

#### Proxy on Terminal

```sh
#
export PROXY_HOST='127.0.0.1:8888'

# single
export http_proxy="$PROXY_HOST"

# multiple
export \
  http_proxy="$PROXY_HOST" \
  https_proxy="$PROXY_HOST" \
  no_proxy='localhost,127.0.0.1'
```

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

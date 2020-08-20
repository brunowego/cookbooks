# Google Chrome

## App

### Installation

#### Homebrew

```sh
brew cask install --appdir='/Applications' google-chrome
```

#### APT

```sh
wget -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo /usr/bin/sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt update
```

```sh
sudo apt -y install google-chrome-stable
```

#### YUM

```sh
cat << EOF | sudo tee /etc/yum.repos.d/google-chrome.repo
[google-chrome]
name=google-chrome
baseurl=http://dl.google.com/linux/chrome/rpm/stable/x86_64
enabled=1
gpgcheck=1
gpgkey=https://dl.google.com/linux/linux_signing_key.pub
EOF
```

```sh
sudo yum -y install google-chrome-stable
```

#### Chocolatey

```sh
choco install -y googlechrome
```

### Configuration

```sh
# Darwin
ln -s /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome /usr/local/bin/chrome
```

### Tips

#### Incognito

```sh
# Darwin
open -a /Applications/Google\ Chrome.app --args --incognito
```

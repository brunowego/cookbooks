# Google Chrome

## App

### Installation

#### Homebrew

```sh
brew install \
  --cask \
  --appdir='/Applications' \
  google-chrome
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

### Shortcuts

| Description     | Shortcut                           |
| --------------- | ---------------------------------- |
| Developer Tools | `Command (⌘)` + `Option (⌥)` + `J` |

### Tips

<!-- ####

```sh
open -a 'Google Chrome' --args --incognito

open -a 'Google Chrome' --args --ssl-version-min=tls1
``` -->

#### Cleaning HTTPS 301 Redirect

1. Open "More Tools -> Developer Tools"
2. Hold the "Refress" button
3. Select "Empty Cache and Hard Reload"

#### Incognito

```sh
# Darwin
open -a /Applications/Google\ Chrome.app --args --incognito
```

<!--
NET::ERR_CERT_AUTHORITY_INVALID

chrome://settings/security?q=enhanced

chrome://flags/
Insecure origins treated as secure
Allow invalid certificates for resources loaded from localhost.

/Applications/Google\ Chrome\ Dev.app/Contents/MacOS/Google\ Chrome\ Dev \
  --ignore-certificate-errors \
  --ignore-urlfetcher-cert-requests \
  --allow-insecure-localhost
-->

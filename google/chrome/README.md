# Google Chrome

## Extensions

- [1Password](https://chrome.google.com/webstore/detail/1password-%E2%80%93-password-mana/aeblfdkhhhdcdjpifhhbdiojplfjncoa?hl=en)
- [Allow CORS: Access-Control-Allow-Origin](https://chrome.google.com/webstore/detail/allow-cors-access-control/lhobafahddgcelffkeicbaginigeejlf?hl=en)
- [AutoFormer+](https://chrome.google.com/webstore/detail/autoformer%20/cjefgijpbofijpnfpncbjajignkcbbod?hl=en)
- [AWS Extend Switch Roles](https://chrome.google.com/webstore/detail/aws-extend-switch-roles/jpmkfafbacpgapdghgdpembnojdlgkdl?hl=en)
- [Clear Cache](https://chrome.google.com/webstore/detail/clear-cache/cppjkneekbjaeellbfkmgnhonkkjfpdn?hl=pt-BR)
- [Cloudinary Media Inspector](https://chrome.google.com/webstore/detail/cloudinary-media-inspecto/ehnkhkglbafecknplfmjklnnjimokpkg)
- [Global Speed](https://chrome.google.com/webstore/detail/global-speed/jpbjcnkcffbooppibceonlgknpkniiff?hl=en)
- [HTTPS Everywhere](https://chrome.google.com/webstore/detail/https-everywhere/gcbommkclmclpchllfjekcdonpmejbdp?hl=en)
- [Locale Switcher](https://chrome.google.com/webstore/detail/locale-switcher/kngfjpghaokedippaapkfihdlmmlafcc/)
- [Prometheus Formatter](https://chrome.google.com/webstore/detail/prometheus-formatter/jhfbpphccndhifmpfbnpobpclhedckbb?hl=en)
- [Proxy Switcher and Manager](https://chrome.google.com/webstore/detail/proxy-switcher-and-manage/onnfghpihccifgojkpnnncpagjcdbjod?hl=en)
- [Wappalyzer](https://chrome.google.com/webstore/detail/wappalyzer/gppongmhjkpfnbhagpmjfkannfbllamg?hl=en)

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

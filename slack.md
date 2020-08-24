# Slack

## App

### Installation

#### Homebrew

```sh
brew cask install slack
```

#### APT

```sh
wget -O - 'https://packagecloud.io/slacktechnologies/slack/gpgkey' | sudo apt-key add -

sudo /usr/bin/sh -c 'echo "deb https://packagecloud.io/slacktechnologies/slack/debian/ jessie main" >> /etc/apt/sources.list.d/slack.list'
```

```sh
sudo apt update
sudo apt -y install slack-desktop
```

### Running

```sh
# Darwin
open -a /Applications/Slack.app
```

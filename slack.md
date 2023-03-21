# Slack

## Links

- [Org. Repository](https://github.com/slackhq)
- [Dashboard](https://app.slack.com)
- [Main Website](https://slack.com)
- [Status Page](https://status.slack.com)
- [Workspace Admin](https://my-org.slack.com/admin)

<!--
https://slack.github.com/
-->

## App

### Installation

#### Homebrew

```sh
brew install --cask slack
```

#### MAS

```sh
mas install 803453959
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

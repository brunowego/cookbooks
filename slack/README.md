# Slack

<!--
https://usepylon.com
-->

## Links

- [Org. Repository](https://github.com/slackhq)
- [Dashboard](https://app.slack.com)
- [Main Website](https://slack.com)
- [Status Page](https://status.slack.com)
- [Workspace Admin](https://my-org.slack.com/admin)

<!--
https://slack.github.com
-->

## App

### Installation

```sh
# Using Homebrew
brew install --cask slack

# Using MAS
mas install 803453959

# Using APT
wget -O - 'https://packagecloud.io/slacktechnologies/slack/gpgkey' | sudo apt-key add -

sudo /usr/bin/sh -c 'echo "deb https://packagecloud.io/slacktechnologies/slack/debian/ jessie main" >> /etc/apt/sources.list.d/slack.list'

sudo apt update
sudo apt -y install slack-desktop
```

### Running

```sh
# Darwin
open -a /Applications/Slack.app
```

<!--
https://github.com/slackapi/node-slack-sdk

How to quickly get and use a Slack API bot token https://api.slack.com/tutorials/tracks/getting-a-token

https://api.slack.com/apps
https://api.slack.com/apps/<app-id>/oauth
-->

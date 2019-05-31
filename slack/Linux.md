# Linux

## Installation

### APT

```sh
wget -O - https://packagecloud.io/slacktechnologies/slack/gpgkey | sudo apt-key add -
sudo sh -c 'echo "deb https://packagecloud.io/slacktechnologies/slack/debian/ jessie main" >> /etc/apt/sources.list.d/slack.list'
sudo apt update
```

```sh
sudo apt -y install slack-desktop
```

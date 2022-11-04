# AWS Session Manager Plugin

## Links

- [Code Repository](https://github.com/aws/session-manager-plugin)

## Docs

- [Install the Session Manager plugin for the AWS CLI](https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html)

## Installation

### Homebrew

```sh
brew install --cask session-manager-plugin
```

### APT

```sh
curl -LO 'https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb'
sudo apt -y install ./session-manager-plugin.deb && rm ./session-manager-plugin.deb
```

### Chocolatey

```sh
choco install -y awscli-session-manager
```

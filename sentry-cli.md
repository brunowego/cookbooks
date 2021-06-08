# Sentry CLI

## Links

- [Code Repository](https://github.com/getsentry/sentry-cli)
- [Main Website](https://docs.sentry.io/product/cli/)

## CLI

### Installation

#### Homebrew

```sh
brew tap getsentry/tools

brew install sentry-cli
```

#### NPM

```sh
npm install @sentry/cli
```

### Linux Binary

```sh
curl \
  -L "https://github.com/getsentry/sentry-cli/releases/download/$(curl -s https://api.github.com/repos/getsentry/sentry-cli/releases/latest | grep tag_name | cut -d '"' -f 4)/sentry-cli-Linux-x86_64" \
  -o /usr/local/bin/sentry-cli && \
    sudo chmod +x /usr/local/bin/sentry-cli
```

### Commands

```sh
sentry-cli -h
```

### Usage

```sh
#
cat << EOF > ~/.sentryclirc
[defaults]
url = https://sentry.io
org = <organization>
project = <project>
EOF

#
sentry-cli login

#
sentry-cli info
```

***Data Source Name (DSN)***

```ini
[auth]
dsn = <dsn>
```

***Log Level***

```ini
[log]
level = debug
```

***Send Event***

```sh
#
sentry-cli send-event -m 'Something happened'

#
sentry-cli send-event \
  -m 'Unknown system error' \
  --logfile /var/log/system.log

#
eval "$(sentry-cli bash-hook)"
```

### Tips

#### TCP Dump

Try check network issues using [tcpdump](/tcpdump.md#usage) on port `443`.

***manage.py***

```py
import logging

logger = logging.getLogger('sentry.errors')
logger.setLevel(logging.INFO)
logger.addHandler(logging.StreamHandler())
```

## Docker

### Running

```sh
docker run --rm \
  -v "$(pwd)":/work \
  docker.io/getsentry/sentry-cli --help
```

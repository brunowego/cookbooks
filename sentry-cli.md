# Sentry CLI

## CLI

### Installation

#### Homebrew

```sh
brew install getsentry/tools/sentry-cli
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

***Semd Event***

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

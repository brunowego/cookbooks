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

### Configuration

```sh
#
export SENTRY_URL='https://sentry.io'
export SENTRY_ORG=''

#
cat << EOF > ~/.sentryclirc
[defaults]
url = ${SENTRY_URL}
org = ${SENTRY_ORG}
EOF

#
sentry-cli login

#
sentry-cli info
```

### Usage

```sh
#
sentry-cli repos list

#
sentry-cli projects list

#
sentry-cli releases list
```

### Tips

#### Debug Log Level

```sh
#
export SENTRY_LOG_LEVEL='debug'
```

#### Send Event

```sh
#
export SENTRY_DSN=''

#
sentry-cli send-event \
  -m 'Something happened'

#
sentry-cli send-event \
  -m 'Unknown system error' \
  --logfile /var/log/system.log

#
eval "$(sentry-cli bash-hook)"
```

#### Create Release

```sh
#
export SENTRY_RELEASE="$(sentry-cli releases propose-version)"

#
sentry-cli releases new -p "$SENTRY_PROJECT" "$SENTRY_RELEASE"

sentry-cli releases set-commits \
  --auto "$SENTRY_RELEASE" || true

sentry-cli releases finalize "$SENTRY_RELEASE"

sentry-cli releases deploys "$SENTRY_RELEASE" new \
  -e '[env]'
```

#### Upload SourceMaps

```sh
#
sentry-cli releases files \
  '[release]' \
  list

#
sentry-cli releases files \
  '[release]' \
  upload-sourcemaps \
    --url-prefix='~/' \
    --rewrite \
    --validate \
    ./build

#
sentry-cli releases files \
  '[release]' \
  delete \
    --all


#
sentry-cli releases finalize '[release]'
```

#### Configuration

**_Data Source Name (DSN)_**

```ini
[auth]
dsn = <dsn>
```

**_Log Level_**

```ini
[log]
level = debug
```

#### TCP Dump

Try check network issues using [tcpdump](/tcpdump.md#usage) on port `443`.

**_manage.py_**

```py
import logging

logger = logging.getLogger('sentry.errors')
logger.setLevel(logging.INFO)
logger.addHandler(logging.StreamHandler())
```

### Issues

#### Request Entity Too Large

```log
DEBUG   2021-07-05 23:14:52.857797 -03:00 < HTTP/1.1 413 Request Entity Too Large
```

```log
error: API request failed
  caused by: sentry reported an error: unknown error (http status: 413)
```

```sh
kubectl patch ingress/sentry \
  -n sentry \
  -p '{"metadata":{"annotations":{"nginx.ingress.kubernetes.io/proxy-body-size":"32m"}}}'
```

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h sentry \
  --name sentry \
  --network workbench \
  docker.io/getsentry/sentry-cli --help
```

### Tips

#### Send Event

```sh
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h sentry \
  -e SENTRY_DSN='' \
  --name sentry \
  --network workbench \
  docker.io/getsentry/sentry-cli send-event \
  -m 'Something happened'
```

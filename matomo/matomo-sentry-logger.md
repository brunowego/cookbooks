# Matomo Sentry Logger

## Dependencies

- [Sentry](/sentry.md)

## Installation

```sh
# Host
cd /path/to/matomo

# Docker
docker exec -it matomo /bin/bash
```

```sh
MATOMO_PLUGIN_VERSION="$(curl -s https://api.github.com/repos/Findus23/plugin-SentryLogger/releases/latest | grep tag_name | cut -d '"' -f 4)"; \
  curl -L "https://github.com/Findus23/plugin-SentryLogger/archive/${MATOMO_PLUGIN_VERSION}.tar.gz" | \
    tar -xzC ./plugins --transform "s/plugin-SentryLogger-${MATOMO_PLUGIN_VERSION}/SentryLogger/"
```

## Activate

```sh
./console plugin:activate SentryLogger
```

# Matomo Log Viewer

## Installation

```sh
# Host
cd /path/to/matomo

# Docker
docker exec -it matomo /bin/sh
```

```sh
MATOMO_PLUGIN_VERSION="$(curl -ks https://api.github.com/repos/matomo-org/plugin-LogViewer/releases/latest | grep tag_name | cut -d '"' -f 4)"; \
  curl -kL "https://github.com/matomo-org/plugin-LogViewer/archive/${MATOMO_PLUGIN_VERSION}.tar.gz" | \
    tar -xzC ./plugins --transform "s/plugin-LogViewer-${MATOMO_PLUGIN_VERSION}/LogViewer/"
```

## Activate

```sh
./console plugin:activate LogViewer
```

## Cofiguration

```sh
# Log file
cd /path/to/matomo
ls tmp/logs
touch tmp/logs/matomo.log || exit

#
./console config:set \
  --section='log' \
  --key='log_writers[]' \
  --value='file'

#
./console config:set \
  --section='Debug' \
  --key='enable_sql_profiler' \
  --value='1'

#
cat tmp/logs/matomo.log
```

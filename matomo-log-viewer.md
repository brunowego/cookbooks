# Matomo Log Viewer

## Installation

```sh
cd /path/to/matomo
```

```sh
curl -L https://github.com/matomo-org/plugin-LogViewer/archive/3.0.4.tar.gz | \
  tar -xzC ./plugins --transform s/plugin-LogViewer-3.0.4/LogViewer/
```

## Activate

```sh
./console plugin:activate LogViewer
```

## Cofiguration

```sh
./console config:set \
  --section='log' \
  --key='log_writers[]' \
  --value='file'

./console config:set \
  --section='Debug' \
  --key='enable_sql_profiler' \
  --value='1'
```

# LogViewer

## Installation

```sh
git clone --branch 3.0.4 --single-branch --depth 1 https://github.com/matomo-org/plugin-LogViewer plugins/LogViewer
```

## Active

```sh
./console plugin:activate LogViewer
```

##

```sh
[log]
log_writers[] = file
```

```sh
[Debug]
enable_sql_profiler = 1
```

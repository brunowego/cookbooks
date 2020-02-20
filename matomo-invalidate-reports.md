# Matomo Invalidate Reports

## Installation

```sh
# Host
cd /path/to/matomo

# Docker
docker exec -it matomo /bin/bash
```

```sh
MATOMO_PLUGIN_VERSION="$(curl -s https://api.github.com/repos/innocraft/plugin-InvalidateReports/releases/latest | grep tag_name | cut -d '"' -f 4)"; \
  curl -L "https://github.com/innocraft/plugin-InvalidateReports/archive/${MATOMO_PLUGIN_VERSION}.tar.gz" | \
    tar -xzC ./plugins --transform "s/plugin-InvalidateReports-${MATOMO_PLUGIN_VERSION}/InvalidateReports/"
```

## State

```sh
#
./console plugin:activate InvalidateReports

#
./console plugin:deactivate InvalidateReports
```

```sh
mysql \
  -h 127.0.0.1 \
  -P 3306 \
  -D matomo_dev \
  -u matomo \
  -p'matomo' \
  -ve "SELECT option_value FROM matomo_option WHERE option_name = 'version_InvalidateReports'"
```

## Commands

```sh
#
./console diagnostics:analyze-archive-table $(gdate +%Y_%m)

# Darwin
./console core:invalidate-report-data \
  --dates "$(gdate -d '1 week ago' +%Y-%m-%d),$(gdate +%Y-%m-%d)" \
  --periods day,week,month,year

# Linux
./console core:invalidate-report-data \
  --dates "$(date -d '1 week ago' +%Y-%m-%d),$(date +%Y-%m-%d)" \
  --periods day,week,month,year
```

## Docs

### Invalidate Reports

1. General settings
2. System
3. Invalidate reports
   - Choose website
   - Choose segment
   - Choose how far back to invalidate data
   - Invalidate Reports

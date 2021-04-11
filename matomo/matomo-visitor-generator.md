# Matomo Visitor Generator

## Installation

```sh
# Host
cd /path/to/matomo

# Docker
docker exec -it matomo /bin/sh
```

```sh
# Last Version
MATOMO_PLUGIN_VERSION="$(curl -s https://api.github.com/repos/matomo-org/plugin-VisitorGenerator/releases/latest | grep tag_name | cut -d '"' -f 4)"; \
  curl -L "https://github.com/matomo-org/plugin-VisitorGenerator/archive/${MATOMO_PLUGIN_VERSION}.tar.gz" | \
    tar -xzC ./plugins --transform "s/plugin-VisitorGenerator-${MATOMO_PLUGIN_VERSION}/VisitorGenerator/"

# Dev Version
curl -kL 'https://github.com/matomo-org/plugin-VisitorGenerator/archive/3.x-dev.tar.gz' | \
  tar -xzC ./plugins --transform 's/plugin-VisitorGenerator-3.x-dev/VisitorGenerator/'
```

## State

```sh
#
./console plugin:activate VisitorGenerator
```

```sh
#
mysql \
  -h 127.0.0.1 \
  -P 3306 \
  -D matomo_dev \
  -u matomo \
  -p'matomo' \
  -ve "SELECT option_value FROM matomo_option WHERE option_name = 'version_VisitorGenerator'"
```

## Usage

```sh
# Help
./console help visitorgenerator:generate-visits

# Anonymize log
./console visitorgenerator:anonymize-log [file]

# Annotation
./console visitorgenerator:generate-annotation \
  --idsite 1

# Goals
./console visitorgenerator:generate-goals \
  --idsite 1

# Live
./console visitorgenerator:generate-live-visits \
  --idsite 1 \
  --log-file ./plugins/VisitorGenerator/tests/data/test.log \
  --custom-matomo-url http://127.0.0.1:8080

# Users
./console visitorgenerator:generate-users \
  --limit 100

# Visits
./console visitorgenerator:generate-visits \
  --idsite 1 \
  --days 7 \
  --custom-piwik-url http://127.0.0.1:8080

# Websites
./console visitorgenerator:generate-websites \
  --limit 10

# Shorten log
./console visitorgenerator:shorten-log [file]
```
